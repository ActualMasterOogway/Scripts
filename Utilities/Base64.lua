local Base64 = {}

local S1 = {}
local S2 = {}
local S3 = {}
local S4 = {}
local S5 = {}
local C1 = 0
local C2 = 0
local C3 = 0
local alphabet = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ+/"
local base = {}

for i = 0, 63 do
	base[i] = alphabet:sub(i + 1, i + 1)
	base[alphabet:sub(i + 1, i + 1)] = i
end

for C1 = 0, 255 do
	for C2 = 0, 255 do
		local Sum = C3 * 65536 + C2 * 256 + C1
		local B1 = base[bit32.extract(Sum, 0, 6)]
		local B2 = base[bit32.extract(Sum, 6, 6)]
		
		S1[string.char(C1, C2)] = B1..B2
		S3[B1..B2] = string.char(C1)
	end
end

for C2 = 0, 255 do
	for C3 = 0, 255 do
		local Sum = C3 * 65536 + C2 * 256 + C1
		local B3 = base[bit32.extract(Sum, 12, 6)]
		local B4 = base[bit32.extract(Sum, 18, 6)]

		S2[string.char(C2, C3)] = B3..B4
		S5[B3..B4] = string.char(C3)
	end
end

for C1 = 0, 192, 64 do
	for C2 = 0, 255 do
		for C3 = 0, 3 do
			local Sum = C3 * 65536 + C2 * 256 + C1
			local B2 = base[bit32.extract(Sum, 6, 6)]
			local B3 = base[bit32.extract(Sum, 12, 6)]
			
			S4[B2..B3] = string.char(C2)
		end
	end
end

function Base64:Encode(Data)
    assert(Data, "Argument #1 Missing or nil")
    assert(typeof(Data) == "string" or typeof(Data) == "number", 'Attempted to Encode '..typeof(Data)..', expected "string" or "number".') 
	if Data == 0 then return "" end
	
    local index = 2
	local a = -#Data % 3
	Data = Data..string.rep("\0", a)
	local result = table.create(#Data / 3 * 2 + 1, "    ")
	result[1] = base[a]
	
	for i = 1, #Data, 3 do
		result[index] = S1[Data:sub(i, i + 1)]
		result[index + 1] = S2[Data:sub(i + 1, i + 2)]
		index += 2
	end
	
	return table.concat(result, "")
end

function Base64:Decode(Data)
    assert(Data, "Argument #1 Missing or nil")
    assert(typeof(Data) == "string" or typeof(Data) == "number", 'Attempted to Decode '..typeof(Data)..', expected "string" or "number".')
	if Data == "E" or Data == "" then return "" end
	
	local padding = base[Data:sub(1, 1)]
	local resault = table.create((#Data - 1) / 4 * 3, "   ")
	local index = 1

	for i = 2, #Data, 4 do
		resault[index] = S3[Data:sub(i, i + 1)]
		resault[index + 1] = S4[Data:sub(i + 1, i + 2)]
		resault[index + 2] = S5[Data:sub(i + 2, i + 3)]
		index += 3
	end
	
	local concatted = table.concat(resault)
	return concatted:sub(1, #concatted - padding)
end

Base64:decode = Base64.Decode
Base64:encode = Base64.Encode

return Base64
