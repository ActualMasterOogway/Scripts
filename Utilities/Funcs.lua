-- // Variables \\ --

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua"))() -- Babyhamsta bypasses https://web.archive.org/web/20240309210243/https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Bypasses.lua

local Plr, searchCache, tpQueue, clipboard, modules =
    game.Players.LocalPlayer,
    {},
    {},
    "",
    {
        -- // Krnl Built In Ones \\ --

        ["Hook"] = "https://gist.githubusercontent.com/richie0866/dfff74c366c141a681b580f613f7962f/raw/d89456887e62a8d5a36da0317f25454c433fa0bb/Hook.lua", -- https://web.archive.org/web/20240310095759/https://gist.githubusercontent.com/richie0866/dfff74c366c141a681b580f613f7962f/raw/d89456887e62a8d5a36da0317f25454c433fa0bb/Hook.lua
        ["Promise"] = "https://gist.github.com/richie0866/f7c56370664cd8b6d13b02e70529fc86/raw/6e945905b6a1106276cf8b128893c2b50997a00f/Promise.lua", -- https://web.archive.org/web/20240310095553/https://gist.githubusercontent.com/richie0866/f7c56370664cd8b6d13b02e70529fc86/raw/6e945905b6a1106276cf8b128893c2b50997a00f/Promise.lua
        ["Thread"] = "https://gist.githubusercontent.com/richie0866/89a30f80b1562678a2d554c18c0a022f/raw/b53d733b2a52788648008d3bd7e553ea286f1d1e/Thread.lua", --https://web.archive.org/web/20240310095750/https://gist.githubusercontent.com/richie0866/89a30f80b1562678a2d554c18c0a022f/raw/b53d733b2a52788648008d3bd7e553ea286f1d1e/Thread.lua
        ["Maid"] = "https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua", -- https://web.archive.org/web/20240310095606/https://raw.githubusercontent.com/Quenty/NevermoreEngine/version2/Modules/Shared/Events/Maid.lua
        ["Signal"] = "https://gist.githubusercontent.com/richie0866/98879ede8725238d6eb8523774ec31b9/raw/7a4a57334056de0fe84f602315ba5c45524b57d9/Signal.lua", -- https://web.archive.org/web/20240310095651/https://gist.githubusercontent.com/richie0866/98879ede8725238d6eb8523774ec31b9/raw/7a4a57334056de0fe84f602315ba5c45524b57d9/Signal.lua
        
        -- // Custom Ones \\ --

        ["ZZLib"] = "https://gist.githubusercontent.com/richie0866/dd558b64ba9e6da2b4e81a296ccb4d82/raw/a3fab8d1075c7477577a262ed84617d32b40f55b/zzlib.lua", -- https://web.archive.org/web/20240310095658/https://gist.githubusercontent.com/richie0866/dd558b64ba9e6da2b4e81a296ccb4d82/raw/a3fab8d1075c7477577a262ed84617d32b40f55b/zzlib.lua
        ["Simulation"] = "https://gist.githubusercontent.com/richie0866/152b1491856bdca1bdc89d2ff0bfe871/raw/9b7e25f5531743615d77d83855b13fdac002088f/Simulation.lua", -- https://web.archive.org/web/20240310095806/https://gist.githubusercontent.com/richie0866/152b1491856bdca1bdc89d2ff0bfe871/raw/9b7e25f5531743615d77d83855b13fdac002088f/Simulation.lua aliens are among us, we live in a simulation
        ["QuickList"] = "https://raw.githubusercontent.com/ActualMasterOogway/QuickList/main/QuickList.lua", -- https://web.archive.org/web/20240310095716/https://raw.githubusercontent.com/ActualMasterOogway/QuickList/main/QuickList.lua
        ["Stringify"] = "https://raw.githubusercontent.com/Partixel/R-Stringify/master/MainModule.ModuleScript.lua", -- https://web.archive.org/web/20240310144054/https://raw.githubusercontent.com/Partixel/R-Stringify/master/MainModule.ModuleScript.lua
        ["ESP"] = "https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Utilities/Vynixu%20ESP%20Edited.lua" -- https://web.archive.org/web/20240312144743/https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Utilities/Vynixu%20ESP%20Edited.lua
    }

local function searchVar(names: table, type, e): table
    local tbl = e or getgenv()
    if not searchCache[tbl] then
        searchCache[tbl] = true
        for i, v in next, tbl do
            local Type = typeof(v)
            if Type == (type or "function") and table.find(names, i) then
                return v
            elseif Type == "table" then
                local foundRecursive = searchVar(names, v)
                if foundRecursive then
                    return foundRecursive
                end
            end
        end
    end
    return false
end

local Functions = {
    IsExecClosure = searchVar {
        "is_fluxus_closure",
        "is_sentinel_closure",
        "is_krnl_closure",
        "is_proto_closure",
        "is_calamari_closure",
        "is_electron_closure",
        "is_elysian_closure",
        "is_synapse_closure",
        "is_executor_closure",
        "isexecutorclosure"
    } or function()
            return false
        end,
    SetThreadIdentity = searchVar {
        "setthreadidentity",
        "set_thread_identity",
        "setthreadcontext",
        "set_thread_context"
    } or function()
            return 0
        end,
    GetThreadIdentity = searchVar {
        "getthreadidentity",
        "get_thread_identity",
        "getthreadcontext",
        "get_thread_context"
    } or function()
            return 0
        end,
    Request = searchVar {
        "request",
        "http_request",
        "httprequest"
    } or function()
            return {Body = "404: Not Found", Success = false}
        end,
    GetAsset = searchVar {
        "getcustomasset"
    } or function()
            return ""
        end,
    GetHUI = searchVar {
        "gethui",
        "get_hidden_ui"
    } or function(...)
            return game.CoreGui
        end,
    SetReadOnly = searchVar {
        "setreadonly",
        "make_writeable"
    } or function(...)
            return ...
        end,
    IsReadOnly = searchVar {
        "isreadonly",
        "is_readonly",
        "is_read_only",
        "iswriteable",
        "is_writeable",
        "is_write_able"
    } or function()
            return true
        end,
    GetSignalConnections = searchVar {
        "getconnections",
        "get_connections",
        "getsignalcons",
        "get_signal_cons"
    } or function(signal: RBXScriptSignal) 
            assert(typeof(signal) == "RBXScriptSignal", `connect is not a valid member of {signal.ClassName or signal} "{signal.Name or ""}"`)
            return {}
        end,
    Clipboard = setmetatable(
        {
        Set = function(node, spaces)
            local SetCB, copyType =
                searchVar {
                    "setclipboard",
                    "set_clipboard",
                    "set_clip_board",
                    "toclipboard",
                    "to_clipboard",
                    "to_clip_board"
                }, 
                typeof(node)
            if copyType == "table" then
                local cache, stack, output = {}, {}, {}
                local depth = 1
                local space = `{spaces == true or spaces == nil and "\n" or ""}`
                local output_str = `\{{space}`
                while true do
                    local size = 0
                    for k,v in next, node do
                        size = size + 1
                    end 
                    local cur_index = 1
                    for k,v in next, node do
                        if (cache[node] == nil) or (cur_index >= cache[node]) then
                            if (string.find(output_str,"}",output_str:len())) then
                                output_str = output_str .. ","..space
                            elseif not (string.find(output_str, space, output_str:len())) then
                                output_str = output_str .. space
                            end
                            output[#output + 1] = output_str
                            output_str = ""
                            local key
                            if (type(k) == "number" or type(k) == "boolean") then
                                key = "["..tostring(k).."]"
                            else
                                key = "[\""..tostring(k).."\"]"
                            end
        
                            if (type(v) == "number" or type(v) == "boolean") then
                                output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v)
                            elseif (type(v) == "table") then
                                output_str = output_str .. string.rep('\t',depth) .. key .. " = {"..space
                                stack[#stack + 1] = node
                                stack[#stack + 1] = v
                                cache[node] = cur_index+1
                                break
                            else
                                output_str = output_str .. string.rep('\t',depth) .. key .. " = \""..tostring(v).."\""
                            end
        
                            if (cur_index == size) then
                                output_str = output_str .. space .. string.rep('\t',depth-1) .. "}"
                            else
                                output_str = output_str .. ","
                            end
                        else
                            if (cur_index == size) then
                                output_str = output_str .. space .. string.rep('\t',depth-1) .. "}"
                            end
                        end
        
                        cur_index = cur_index + 1
                    end
                    if (size == 0) then
                        output_str = output_str .. space .. string.rep('\t',depth-1) .. "}"
                    end
                    if (#stack > 0) then
                        node = stack[#stack]
                        stack[#stack] = nil
                        depth = cache[node] == nil and depth + 1 or depth - 1
                    else
                        break
                    end
                end
                output[#output + 1] = output_str
                output_str = table.concat(output)
                if spaces == false then
                    output_str = output_str:gsub("\t", "")
                    output_str = output_str:gsub(" ", "")
                end
                node = output_str
                SetCB(output_str)
            end
            SetCB(node)
            clipboard = node
        end,
        Get = searchVar {
            "getclipboard",
            "get_clipboard",
            "get_clip_board"
        } or function()
                return clipboard
            end
        },
        {}
    ),
    Executor = (function()
        -- im mentally ill
        local exploitcheck =
            searchVar {
            "identifyexecutor",
            "getexecutor",
            "getexecutorname"
        } or function()
                return "Unknown"
            end
        return exploitcheck()
    end)(),
    IsRobloxActive = searchVar {
        "iswindowactive",
        "isrbxactive"
    },
    SecureCall = searchVar {
        "KRNL_SAFE_CALL",
        "securecall",
        "secure_call"
    } or
        (function()
            -- stolen from https://github.com/Babyhamsta/RBLX_Scripts/blob/main/Universal/Lua_SecureCall <3
            local toProtect = {}
            local oldTraceback

            local function isProtectedCaller(Function)
                for i = 0, 30 do
                    local stackInfo = debug.getinfo(i)
                    if stackInfo then
                        if Function == stackInfo.func then
                            return true
                        end
                    else
                        break
                    end
                end
                return false
            end

            oldTraceback = hookfunction(
                debug.traceback,
                function()
                    local stackTrace = oldTraceback()
                    for Function, spoofedTrace in next, toProtect do
                        if isProtectedCaller(Function) then
                            local Lines = {}
                            stackTrace:gsub(
                                "[^\n\r]+",
                                function(Line)
                                    Lines[#Lines + 1] = Line:gsub("^@:", spoofedTrace)
                                end
                            )
                            table.remove(Lines, 1)
                            table.remove(Lines, #Lines - 1)

                            return table.concat(Lines, "\n") .. "\n"
                        end
                    end
                    return stackTrace:match "[^\n\r]*\n?(.*)"
                end
            )

            return newcclosure(
                function(Function, Script, ...)
                    local old_env = getfenv()
                    toProtect[Function] = Script:GetFullName() .. ":"
                    local spoof_env = select(2, pcall(getsenv, Script))
                    spoof_env = (type(spoof_env) == "string" or not spoof_env) and getrenv() or spoof_env
                    spoof_env.script = spoof_env.script or Script

                    local setthreadcontext = setthreadcontext
                    setthreadcontext(2)
                    local Level = 0
                    while true do
                        if not pcall(setfenv, Level + 2, spoof_env) then
                            break
                        end
                        Level = Level + 1
                    end
                    local securityContext = getthreadcontext and getthreadcontext() or 6
                    local ret = table.pack(Function(...))

                    for i = 0, Level do
                        setfenv(i, old_env)
                    end

                    setthreadcontext(securityContext)
                    return unpack(ret)
                end
            )
        end)(),
    Base64 = searchVar(
        {
            "base64",
            "Base64"
        },
        "table"
    ) or loadstring(game:HttpGet("https://raw.githubusercontent.com/Reselim/Base64/master/Base64.lua"))(), -- https://web.archive.org/web/20240312134234/https://raw.githubusercontent.com/Reselim/Base64/master/Base64.lua
    Crypt = searchVar(
        {
            "crypt",
            "Crypt"
        },
        "table"
    ) or -- TODO: Implement custom crypt Library
        {},
    SaveInstance = searchVar {
        "saveinstance",
        "SaveInstance",
        "Saveinstance",
        "saveInstance"
    } or
        loadstring(game:HttpGet("https://raw.githubusercontent.com/luau/SynSaveInstance/main/saveinstance.luau", true))(

        ), -- https://web.archive.org/web/20240313165954/https://raw.githubusercontent.com/luau/SynSaveInstance/main/saveinstance.luau
    ProtectInstance = searchVar {
        "protect_gui",
        "protectgui",
        "protect_ui",
        "protectui"
    } or function(...) -- TODO: add custom protector (hook all finding methods, signals, and stop indexing) (a.k.a https://web.archive.org/web/20240310100022/https://api.irisapp.ca/SourceViewer/Viewer.php?Script=https://api.irisapp.ca/Scripts/IrisInstanceProtect.lua)
            return ...
        end
}

-- // Misc Functions \\ --

local function convertToAsset(str)
    if isfile(str) then
        return Functions.GetAsset(str)
    elseif str:find("rbxassetid") or tonumber(str) then
        local numberId = str:gsub("%D", "")
        return "rbxassetid://" .. numberId
    elseif str:find("http") then
        local req = Functions.Request({Url = str, Method = "GET"})

        if req.Success then
            local name = "customObject_" .. tick() .. ".txt"
            writefile("realmasteroogway_debris\\" .. name, req.Body)
            return Functions.GetAsset(name)
        end
    end
end -- thx vynixu https://github.com/RegularVynixu/Utilities/blob/main/Functions.lua

local Egame, Esettings, Eusersettings, rget, rset, cloneRef, cloneFun = 
    game, 
    settings(), 
    UserSettings(), 
    rawget, 
    rawset,
    searchVar {
        "cloneref",
        "clonereference"
    } or (function()
            -- took inspiration from https://github.com/Babyhamsta/RBLX_Scripts/blob/main/Universal/CloneRef.lua
            local CheckPart, InstanceList = Instance.new("Part"), {}
            
            for i, v in next, getreg() do
                if typeof(v) == "table" and #v and rawget(v, "__mode") == "kvs" then
                    for i2, v2 in next, v do
                        if v2 == CheckPart then
                            InstanceList = v
                            break
                        end
                    end
                end
            end

            return function(userdata)
                if not InstanceList then
                    return
                end
                for i, v in next, InstanceList do
                    if v == userdata then
                        InstanceList[i] = nil
                        return userdata
                    end
                end
            end
        end)(),
    searchVar {
        "clonefunc",
        "clonefunction"
    }

-- // Functions \\ --

Functions.Service = setmetatable(
    {},
    {
        __index = function(self, ServiceName)
            local Service = rget(self, ServiceName)
            if Service == nil then
                Service =
                    Egame:GetService(ServiceName) or Esettings:GetService(ServiceName) or
                    Eusersettings:GetService(ServiceName) or
                    Functions[ServiceName]
                rset(self, ServiceName, Service)
            end
            return Service
        end,
        __newindex = function()
        end
    }
)

Functions.Teleport = setmetatable(
    {
        Queue = setmetatable(
            tpQueue,
            {
                __call = function(Script)
                    local queueTPf = searchVar {"queue_on_teleport"}
                    if queueTPf then
                        queueTPf(Script)
                        tpQueue[#tpQueue + 1] = Script
                    end
                end,
                __newindex = function(self, key, value)
                    if rawget(self, key) ~= nil then
                        local oldQueue = tpQueue
                        Functions.Teleport.ClearQueue()
                        for i, v in next, oldQueue do
                            if key ~= i and typeof(v) == "string" then
                                Functions.Teleport.Queue[i] = v
                            end
                        end
                        Functions.Teleport.Queue[key] = value
                    else
                        self(value)
                        rawset(self, key, value)
                    end
                end
            }
        ),
        ClearQueue = function()
            local cleartpq = searchVar {"clear_teleport_queue"}
            if cleartpq then
                cleartpq()
                tpQueue = {}
            end
        end
    },
    {
        __call = function(...)
            Functions.Service.TeleportService:Teleport(...)
        end,
        __newindex = function()
        end
    }
)

function Functions:CloneData(data)
    if typeof(data) == "Instance" and data.Parent ~= game then
        local oldArchivable = data.Archivable
        data.Archivable = true
        local c = data:Clone()
        data.Archivable = oldArchivable
        return c, true
    elseif type(data) == "userdata" then
        return cloneRef(data), true
    elseif type(data) == "function" and cloneFun then
        return cloneFun(data), true
    end
    return data, false
end

function Functions:LoadAsync(url)
    return Krnl and Krnl.LoadAsync and Krnl:LoadAsync(url) or loadstring(game:HttpGetAsync(url))()
end

function Functions:Require(moduleName)
    if modules[moduleName] then
        if typeof(modules[moduleName]) == "string" then
            local newlyLoadedModule = self:LoadAsync(moduleName)
            modules[moduleName] = newlyLoadedModule
            return newlyLoadedModule
        else
            return modules[moduleName]
        end
    else
        error(debug.traceback(`Attempt to require an unsupported module (UN:Require('{moduleName}'))`))
    end
end

function Functions:GetMT(...)
    local mt = getrawmetatable(...)
    self.SetReadOnly(mt, false)
end

function Functions:JSDecode(...)
    return self.Service.HttpService:JSONDecode(...)
end

function Functions:JSEncode(...)
    return self.Service.HttpService:JSONEncode(...)
end

function Functions:GetFingerprint()
    for i, v in next, self.JSDecode(self.Request({Url = "https://httpbin.org/get", Method = "GET"}).Body).headers do
        if
            typeof(i) == "string" and
                (i:lower():match("fingerprint") or i:lower():match("hwid") or i:lower():match("identifier"))
         then
            return v
        end
    end
end

function Functions:GetClientID()
    return Functions.Service.RbxAnalyticsService:GetClientId()
end

function Functions:GetPlayerByName(name)
    for i, v in next, self.Service.Players:GetPlayers() do
        if v.Name:lower():find(name) or v.DisplayName:lower():find(name) then
            return v
        end
    end
end

function Functions:LoadCustomAsset(str)
    if str == "" then
        return ""
    end

    return convertToAsset(str)
end -- vynixu i luv u https://github.com/RegularVynixu/Utilities/blob/main/Functions.lua

function Functions:LoadCustomInstance(str)
    local r = ""
    if str ~= "" then
        local asset = convertToAsset(str)
        local success, result = pcall(game.GetObjects, game, asset)
        r = result
        if success then
            return result[1]
        end
    end

    warn("Something went wrong attempting to load custom instance", r, debug.traceback(""))
end -- vynixu W https://github.com/RegularVynixu/Utilities/blob/main/Functions.lua

-- Scripts

if isfolder("realmasteroogway_debris") then
    delfolder("realmasteroogway_debris")
end
makefolder("realmasteroogway_debris")

Functions.Service.Players.PlayerRemoving:Connect(
    function(player)
        if player == Plr then
            delfolder("realmasteroogway_debris")
            Drawing.clear()
        end
    end
)

return Functions
