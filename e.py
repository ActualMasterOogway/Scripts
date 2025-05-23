import requests # Keep for synchronous get_studio_versions
import os
import zipfile
import shutil
import asyncio
import aiohttp
import aiofiles
import aiofiles.os as aio_os # For async os operations
from tqdm.asyncio import tqdm # Async-compatible tqdm
if os.name == 'nt': # 'nt' is for Windows
    asyncio.set_event_loop_policy(asyncio.WindowsSelectorEventLoopPolicy())
# The byte sequence you are looking for (shortened as in your edit)
TARGET_BYTES_HEX = "40 57 48 83 EC 20 48 8B F9 48 85 C9 74 ?? 48 8B 49" # Updated hex string with wildcard

# NOTE: The hex string contains "??", which represents a wildcard byte.
# We now have a custom search function to handle this.
# We no longer convert the hex string directly to bytes here.

# URL for Roblox deployment history
DEPLOY_HISTORY_URL = "https://setup.rbxcdn.com/DeployHistory.txt"
# Base URL for downloading Roblox files
DOWNLOAD_BASE_URL = "http://setup.rbxcdn.com/"

# Directory to store downloads temporarily
DOWNLOAD_DIR = "roblox_version_downloads"
# Specific executable to look for inside the zip
TARGET_EXE_IN_ZIP = "RobloxStudioBeta.exe"

CONCURRENT_DOWNLOADS = 10
FOUND_EVENT = asyncio.Event() # Global event to signal when bytes are found

# --- Helper Functions ---

def get_studio_versions_sync(): # Renamed to clarify it's sync
    """
    Fetches and parses DeployHistory.txt to get a list of RobloxStudio version GUIDs,
    ordered from newest to oldest. This remains synchronous as it's a one-off.
    """
    print(f"Fetching deployment history from {DEPLOY_HISTORY_URL}...")
    try:
        response = requests.get(DEPLOY_HISTORY_URL, timeout=30)
        response.raise_for_status()
    except requests.RequestException as e:
        print(f"Error fetching deployment history: {e}")
        return []

    versions_found_in_file = []
    print("Parsing deployment history for Studio versions...")
    # Your existing parsing logic from the last provided script
    for line_num, line in enumerate(response.text.splitlines()):
        if "New Studio64 version-" in line: # Focus on Studio64 as per your example
            parts = line.split()
            version_guid = None
            for part in parts:
                if part.startswith("version-"):
                    version_guid = part.rstrip(',').strip()
                    break
            if version_guid: # Add if not already added (though dict.fromkeys handles this later)
                 versions_found_in_file.append(version_guid)

    if not versions_found_in_file:
        print("No Studio version GUIDs were extracted.")
        return []

    # Deduplicate while preserving order (oldest first from file)
    unique_versions_oldest_first = list(dict.fromkeys(versions_found_in_file))
    print(f"Found {len(unique_versions_oldest_first)} unique RobloxStudio version GUIDs in history.")
    return list(reversed(unique_versions_oldest_first)) # Newest first for processing

async def download_file_async(session, url, local_path, pbar_position=0):
    """Downloads a file asynchronously with aiohttp and tqdm progress."""
    file_name_desc = os.path.basename(local_path)
    if len(file_name_desc) > 25:
        file_name_desc = "..." + file_name_desc[-22:]

    try:
        # print(f"  [DL {pbar_position}] Attempting: {url}") # Less verbose now with tqdm
        async with session.get(url, timeout=aiohttp.ClientTimeout(total=300)) as response: # 5 min timeout
            response.raise_for_status()
            total_size = int(response.headers.get('content-length', 0))
            block_size = 8192

            progress_bar = tqdm(
                total=total_size,
                unit='B', unit_scale=True, unit_divisor=1024,
                desc=f"DL {file_name_desc}",
                position=pbar_position, # For multiple bars
                leave=False, # Remove bar on completion
                bar_format='{desc} {percentage:3.0f}%|{bar:20}| {n_fmt}/{total_fmt} [{rate_fmt}]'
            )
            try:
                async with aiofiles.open(local_path, 'wb') as f:
                    while not FOUND_EVENT.is_set():
                        chunk = await response.content.read(block_size)
                        if not chunk:
                            break
                        await f.write(chunk)
                        progress_bar.update(len(chunk))
                    if FOUND_EVENT.is_set() and progress_bar.n < total_size : # Download cancelled
                        print(f"    [DL {pbar_position}] Download of {file_name_desc} cancelled mid-way.")
                        progress_bar.set_description_str(f"DL {file_name_desc} [CANCELLED]")
                        progress_bar.close()
                        if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
                        return False

                progress_bar.set_description_str(f"DL {file_name_desc} [DONE]")
                progress_bar.close()

                if total_size != 0 and progress_bar.n != total_size:
                    print(f"    WARNING [DL {pbar_position}]: Downloaded size mismatch for {file_name_desc}. File might be incomplete.")
                    if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
                    return False
                # print(f"    [DL {pbar_position}] Successfully downloaded {os.path.basename(local_path)}")
                return True
            except Exception as e_write: # Handle exceptions during write/progress update
                progress_bar.set_description_str(f"DL {file_name_desc} [ERR_WRITE]")
                progress_bar.close()
                print(f"    Error during file write/progress for {file_name_desc}: {e_write}")
                if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
                return False

    except aiohttp.ClientResponseError as e_http: # More specific HTTP errors
        # tqdm bar won't be created if session.get fails early
        print(f"    HTTP Error for {file_name_desc}: {e_http.status} {e_http.message} (URL: {url})")
        if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
        return False
    except asyncio.TimeoutError:
        print(f"    Timeout downloading {file_name_desc} from {url}")
        if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
        return False
    except Exception as e:
        print(f"    Generic download error for {file_name_desc}: {e} (URL: {url})")
        if await aio_os.path.exists(local_path): await aio_os.remove(local_path)
        return False

def parse_aob_pattern(hex_string):
    """
    Parses a hex string with optional '??' wildcards into a list of bytes or None.
    Example: "40 57 ?? 83" -> [0x40, 0x57, None, 0x83]
    """
    pattern = []
    for byte_str in hex_string.split():
        if byte_str == '??':
            pattern.append(None) # Use None to represent a wildcard
        else:
            try:
                pattern.append(int(byte_str, 16))
            except ValueError:
                print(f"Error: Invalid hex byte '{byte_str}' in pattern.")
                return None # Indicate parsing failure
    return pattern

async def search_bytes_in_file_async(file_path, aob_pattern_hex):
    """Searches for a byte pattern (AOB) with wildcards in a file asynchronously."""
    # print(f"    Searching bytes in {os.path.basename(file_path)}...") # Can be verbose

    pattern = parse_aob_pattern(aob_pattern_hex)
    if pattern is None or not pattern:
        print(f"    Invalid or empty AOB pattern: {aob_pattern_hex}")
        return False

    pattern_len = len(pattern)

    try:
        async with aiofiles.open(file_path, 'rb') as f:
            content = await f.read()

        content_len = len(content)
        if content_len < pattern_len:
            return False # File is smaller than the pattern

        # Iterate through the file content byte by byte
        for i in range(content_len - pattern_len + 1):
            match = True
            # Check the pattern against the content starting at position i
            for j in range(pattern_len):
                if pattern[j] is not None and content[i + j] != pattern[j]:
                    match = False
                    break # Mismatch found, move to the next position in content
            
            if match:
                # print(f"    !!!! FOUND TARGET BYTES in {os.path.basename(file_path)} at offset {i}!!!!")
                return True # Full pattern matched

        return False # Pattern not found in the file

    except Exception as e:
        print(f"    Error reading/searching file {os.path.basename(file_path)}: {e}")
        return False

def sync_extract_target_from_zip(zip_path, target_filename_in_zip, extract_to_dir, extracted_filename):
    """
    Synchronously extracts a target file from a zip.
    Returns the name of the member as found in zip if successful, else None.
    The extracted file will be named `extracted_filename` in `extract_to_dir`.
    """
    try:
        with zipfile.ZipFile(zip_path, 'r') as zip_ref:
            target_member_name_in_zip = None
            for member in zip_ref.namelist():
                if os.path.basename(member).lower() == target_filename_in_zip.lower():
                    target_member_name_in_zip = member
                    break
            
            if target_member_name_in_zip:
                # Ensure extract_to_dir exists (should already be version_specific_dir)
                # os.makedirs(extract_to_dir, exist_ok=True) # Redundant if version_specific_dir made
                
                # Extract to a specific file path
                full_extract_path = os.path.join(extract_to_dir, extracted_filename)
                with open(full_extract_path, 'wb') as f_out:
                    f_out.write(zip_ref.read(target_member_name_in_zip))
                return target_member_name_in_zip # Return the member name as it was in the zip
            return None
    except zipfile.BadZipFile:
        print(f"    Error: Bad zip file {os.path.basename(zip_path)}")
        return None
    except Exception as e:
        print(f"    Error extracting from {os.path.basename(zip_path)}: {e}")
        return None

async def process_version_async(session, version_guid, semaphore, pbar_pos):
    """Processes a single version: download, extract, search."""
    if FOUND_EVENT.is_set():
        return None

    async with semaphore:
        if FOUND_EVENT.is_set(): # Check again after acquiring semaphore
            return None

        # print(f"Processing {version_guid}...")
        version_specific_dir = os.path.join(DOWNLOAD_DIR, version_guid)
        await aio_os.makedirs(version_specific_dir, exist_ok=True)

        zip_filename_cdn = f"{version_guid}-RobloxStudio.zip"
        local_zip_path = os.path.join(version_specific_dir, zip_filename_cdn)
        zip_url = DOWNLOAD_BASE_URL + zip_filename_cdn

        # print(f"  [V{pbar_pos}] Primary: Download {zip_filename_cdn} for {version_guid}")
        download_successful = await download_file_async(session, zip_url, local_zip_path, pbar_pos)

        if FOUND_EVENT.is_set(): # Check if found by another task during our download
            if await aio_os.path.exists(local_zip_path): await aio_os.remove(local_zip_path)
            if await aio_os.path.exists(version_specific_dir) and not await aio_os.listdir(version_specific_dir):
                await aio_os.rmdir(version_specific_dir)
            return None

        if download_successful:
            extracted_exe_path_local = os.path.join(version_specific_dir, TARGET_EXE_IN_ZIP)
            loop = asyncio.get_running_loop()
            
            # print(f"    [V{pbar_pos}] Extracting '{TARGET_EXE_IN_ZIP}' from {zip_filename_cdn}...")
            # Run synchronous zip extraction in a thread pool
            extracted_member_name = await loop.run_in_executor(
                None, # Uses default ThreadPoolExecutor
                sync_extract_target_from_zip,
                local_zip_path,
                TARGET_EXE_IN_ZIP,
                version_specific_dir, # Directory to extract into
                TARGET_EXE_IN_ZIP    # Filename for the extracted file
            )

            if FOUND_EVENT.is_set(): # Check again
                if await aio_os.path.exists(extracted_exe_path_local): await aio_os.remove(extracted_exe_path_local)
                if await aio_os.path.exists(local_zip_path): await aio_os.remove(local_zip_path)
                if await aio_os.path.exists(version_specific_dir) and not await aio_os.listdir(version_specific_dir):
                    await aio_os.rmdir(version_specific_dir)
                return None

            if extracted_member_name:
                # print(f"    [V{pbar_pos}] Searching in extracted {TARGET_EXE_IN_ZIP}...")
                if await search_bytes_in_file_async(extracted_exe_path_local, TARGET_BYTES_HEX):
                    if not FOUND_EVENT.is_set(): # Critical check before setting
                        FOUND_EVENT.set() # Signal all other tasks
                        print(f"\n\n>>>> SUCCESS: Bytes found by worker for version {version_guid} <<<<")
                        return {
                            "version_guid": version_guid,
                            "zip_url": zip_url,
                            "zip_path": local_zip_path,
                            "extracted_member": extracted_member_name,
                            "extracted_exe_path": extracted_exe_path_local,
                        }
                    else: # Found, but another task beat us to setting the event
                        # Clean up our own extracted file and zip, as we are redundant
                        if await aio_os.path.exists(extracted_exe_path_local): await aio_os.remove(extracted_exe_path_local)
                        if await aio_os.path.exists(local_zip_path): await aio_os.remove(local_zip_path)
                else: # Bytes not found in extracted exe
                    if await aio_os.path.exists(extracted_exe_path_local): await aio_os.remove(extracted_exe_path_local)
            # else: # Target exe not found in zip
                # print(f"    [V{pbar_pos}] '{TARGET_EXE_IN_ZIP}' not found in {zip_filename_cdn}.")

            # If we reached here and didn't return success, clean up zip (if bytes not found or exe not in zip)
            if await aio_os.path.exists(local_zip_path) and not FOUND_EVENT.is_set(): # Don't delete if it was the successful one
                 await aio_os.remove(local_zip_path)
        # else: # Download failed
            # print(f"    [V{pbar_pos}] Download failed for {zip_filename_cdn}.")


        # Final cleanup for this version's dir if empty and we didn't find the target
        try:
            if not FOUND_EVENT.is_set() or (FOUND_EVENT.is_set() and not await aio_os.path.exists(local_zip_path)): # check if current worker was the winner
                if await aio_os.path.exists(version_specific_dir) and not await aio_os.listdir(version_specific_dir):
                    await aio_os.rmdir(version_specific_dir)
        except Exception as e_clean:
            print(f"    Note: Error during cleanup for {version_guid}: {e_clean}")
        
        return None # Did not find in this version, or was superseded

async def main():
    print(f"Target AOB (hex): {TARGET_BYTES_HEX}")
    # print(f"Target bytes (raw): {TARGET_BYTES}\n") # This line is removed as we no longer convert to bytes here
    print(f"Max concurrent downloads: {CONCURRENT_DOWNLOADS}\n")

    if not await aio_os.path.exists(DOWNLOAD_DIR):
        await aio_os.makedirs(DOWNLOAD_DIR)
        print(f"Created download directory: {DOWNLOAD_DIR}")

    studio_versions = get_studio_versions_sync()
    if not studio_versions:
        print("No studio versions found or could not fetch history. Exiting.")
        return

    print(f"\nStarting search through {len(studio_versions)} unique versions (newest to oldest)...")
    
    semaphore = asyncio.Semaphore(CONCURRENT_DOWNLOADS)
    tasks = []
    found_details_final = None

    # Shared aiohttp session for all downloads
    async with aiohttp.ClientSession() as session:
        for i, version_guid in enumerate(studio_versions):
            if FOUND_EVENT.is_set(): # Don't create new tasks if already found
                break
            # Assign a position for tqdm bar, cycles through 0 to CONCURRENT_DOWNLOADS-1
            pbar_position = i % CONCURRENT_DOWNLOADS
            task = asyncio.create_task(
                process_version_async(session, version_guid, semaphore, pbar_position)
            )
            tasks.append(task)

        # Wait for all created tasks to complete or be cancelled
        results = await asyncio.gather(*tasks, return_exceptions=True)

    for result in results:
        if isinstance(result, Exception):
            # print(f"A worker task resulted in an error: {result}") # Can be noisy
            pass
        elif result: # This means process_version_async returned a dict
            found_details_final = result
            break # Should be the one that set FOUND_EVENT

    if found_details_final:
        print("\n" + "="*60)
        print(f"SUCCESS: Bytes found in version {found_details_final['version_guid']}")
        print(f"  Downloaded Zip URL: {found_details_final['zip_url']}")
        print(f"  Local Zip Path: {found_details_final['zip_path']}")
        print(f"  Extracted From Zip: '{found_details_final['extracted_member']}' -> {found_details_final['extracted_exe_path']}")
        print("  Relevant files have been kept in the downloads directory.")
        print("="*60)
    else:
        print("\n--- Search Complete ---")
        print("Target bytes were not found in any of the checked Roblox Studio versions.")

    # Final cleanup of the main download directory if it exists and is empty
    # (and wasn't the one containing the found file)
    try:
        if await aio_os.path.exists(DOWNLOAD_DIR):
            is_empty = True
            # Check if download_dir is truly empty or only contains the folder of the found version
            if found_details_final:
                found_version_dir_name = found_details_final['version_guid']
                async for item in aio_os.scandir(DOWNLOAD_DIR):
                    if item.name != found_version_dir_name:
                        is_empty = False # Contains other items
                        break
                if is_empty and (await aio_os.listdir(DOWNLOAD_DIR) == [found_version_dir_name]):
                    pass # Contains only the found version's folder, don't delete DOWNLOAD_DIR
                else: # Contains other items, or is empty and nothing was found
                     if not await aio_os.listdir(DOWNLOAD_DIR): is_empty = True # Truly empty
            elif not await aio_os.listdir(DOWNLOAD_DIR): # Nothing found and dir is empty
                is_empty = True

            if is_empty and (not found_details_final or not await aio_os.listdir(DOWNLOAD_DIR)):
                # Use synchronous shutil.rmtree in an executor for simplicity of recursive delete
                loop = asyncio.get_running_loop()
                await loop.run_in_executor(None, shutil.rmtree, DOWNLOAD_DIR)
                print(f"Cleaned up empty download directory: {DOWNLOAD_DIR}")
            elif found_details_final:
                 print(f"Download directory {DOWNLOAD_DIR} contains the found version. Other temporary files should be cleaned.")
            else:
                 print(f"Download directory {DOWNLOAD_DIR} may contain partial downloads or was not empty. Manual review might be needed.")
    except Exception as e_final_clean:
        print(f"Error during final cleanup of {DOWNLOAD_DIR}: {e_final_clean}")


if __name__ == "__main__":
    try:
        asyncio.run(main())
    except KeyboardInterrupt:
        print("\n\nSearch interrupted by user (Ctrl+C).")
        FOUND_EVENT.set() # Signal tasks to stop if they are still running
    except ModuleNotFoundError as e:
        if e.name in ["aiohttp", "aiofiles", "tqdm"]:
            print(f"\nERROR: A required async library '{e.name}' is not installed.")
            print(f"Please install it by running: pip install {e.name}")
        else:
            print(f"\nERROR: A required module is missing: {e.name}")
    finally:
        print("Exiting script.")
        # A more robust final cleanup of DOWNLOAD_DIR if it was created and is now empty could be added here
        # but the one in main() should cover most cases.
