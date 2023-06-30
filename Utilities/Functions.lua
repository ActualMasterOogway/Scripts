if funcs then return end
local err = function() error("Unsupported function. Please get a supported executor!") end
getgenv().funcs = {
    setreadonly = setreadonly or make_writeable or err,
    isreadonly = isreadonly or is_writeable or err,
    isclosure = is_synapse_function or iskrnlclosure or isexecutorclosure or err,
    setthreadidentity = (syn and syn.set_thread_identity) or set_thread_identity or setthreadidentity or setthreadcontext or err,
    getthreadidentity = (syn and syn.get_thread_identity) or get_thread_identity or getthreadidentity or getthreadcontext or err,
    request = http_request or request or HttpPost or (syn and syn.request) or err,
    queueonteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or err,
    getasset = getsynasset or getcustomasset or err,
    getrawmetatable = function(...) if getrawmetatable then local mt = getrawmetatable(...) funcs.setreadonly(mt, false) return mt else err() end end,
    httpget = game.HttpGet or httpget or err,
    loadlink = function(link) if link:find("https://github.com/") and not link:find("?raw=true") then link = link.."?raw=true" end funcs.loadstring(link) end,
    setclipboard = function(node, tablename, spaces) if type(node) == "table" then local cache, stack, output = {}, {}, {} local depth = 1 local space if spaces == true or nil then space = "\n" elseif spaces == nil then space = "\n" else space = "" end local output_str = "{"..space while true do local size = 0 for k,v in pairs(node) do size = size + 1 end local cur_index = 1 for k,v in pairs(node) do if (cache[node] == nil) or (cur_index >= cache[node]) then if (string.find(output_str,"}",output_str:len())) then output_str = output_str .. ","..space elseif not (string.find(output_str, space, output_str:len())) then output_str = output_str..space end output[#output + 1] = output_str output_str = "" local key if (type(k) == "number" or type(k) == "boolean") then key = "["..tostring(k).."]" else key = "[\""..tostring(k).."\"]" end if (type(v) == "number" or type(v) == "boolean") then output_str = output_str .. string.rep('\t',depth) .. key .. " = "..tostring(v) elseif (type(v) == "table") then output_str = output_str..string.rep('\t',depth)..key.." = {"..space stack[#stack + 1] = node stack[#stack + 1] = v cache[node] = cur_index + 1 break else output_str = output_str .. string.rep('\t',depth) .. key .. " = \""..tostring(v).."\"" end if (cur_index == size) then output_str = output_str .. space .. string.rep('\t',depth-1) .. "}" else output_str = output_str .. "," end else if (cur_index == size) then output_str = output_str .. space .. string.rep('\t',depth-1) .. "}" end end cur_index = cur_index + 1 end if (size == 0) then output_str = output_str .. space .. string.rep('\t',depth-1) .. "}" end if (#stack > 0) then node = stack[#stack] stack[#stack] = nil depth = cache[node] == nil and depth + 1 or depth - 1 else break end end output[#output +  1] = output_str output_str = table.concat(output) if spaces == false then output_str = output_str:gsub("	", "") task.wait() output_str = output_str:gsub(" ", "") end if tablename == nil and setclipboard then setclipboard("local tabel = " .. output_str) elseif setclipboard then setclipboard("local "..tostring(tablename).." = " .. output_str) else err() end else if setclipboard then setclipboard(node) else err() end end end,
    randomstring = function(length) local name = "" for i = 1, length do name = name..string.char(math.random(32, 126)) end return name end,
    addcolors = function(color, num) if typeof(num) == "Number" then return math.round(color.R * 255 + num), math.round(color.G * 255 + num), math.round(color.B * 255 + num) elseif typeof(num) == "Color3" then return math.round(color.R * 255 + math.round(num.R * 255)), math.round(color.G * 255 + math.round(num.G * 255)), math.round(color.B * 255 + math.round(num.B * 255)) else return error("Expected type Number or Color3, got \""..typeof(num).."\"", 3) end end,
    protectgui = function(GUI, changename) if gethui or get_hidden_gui then local hiddenUI = get_hidden_gui or gethui GUI.Name = funcs.randomstring(25) GUI.Parent = hiddenUI() elseif (not is_sirhurt_closure) and (syn and syn.protect_gui) then GUI.Name = funcs.randomstring(25) syn.protect_gui(GUI) GUI.Parent = game.CoreGui elseif game.CoreGui:FindFirstChild('RobloxGui') then GUI = game.CoreGui.RobloxGui else GUI.Name = funcs.randomstring(25) GUI.Parent = game.CoreGui end task.spawn(function() if changename == true then task.spawn(function() while task.wait() do GUI.Name = funcs.randomstring(25) end end) end end) end,
    getexecutor = function() local exploitcheck = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or (secure_load and "Sentinel") or (is_sirhurt_closure and "Sirhurt") or (pebc_execute and "ProtoSmasher") or (KRNL_LOADED and "Krnl") or (WrapGlobal and "WeAreDevs") or (isvm and "Proxo") or (shadow_env and "Shadow") or (jit and "EasyExploits") or (getscriptenvs and "Calamari") or (unit and not syn and "Unit") or (OXYGEN_LOADED and "Oxygen U") or (IsElectron and "Electron") or identifyexecutor or getexecutor or getexecutorname local Exploit = "Undefined" if type(exploitcheck) == "function" then Exploit = exploitcheck() elseif type(exploitcheck) == "string" then Exploit = exploitcheck else Exploit = "Failed to identify Executor!" end return Exploit end,
    tohex = function(color) local current = math.floor(color.r * 255) * 256 ^ 2 + math.floor(color.g * 255) * 256 + math.floor(color.b * 255) local final = "" local hexChar = {"A", "B", "C", "D", "E", "F"} repeat local remainder = current % 16 local char = tostring(remainder) if remainder >= 10 then char = hexChar[1 + remainder - 10] end current = math.floor(current / 16) final = final..char until current <= 0 return "#"..string.reverse(final) end,
    jsdecode = function(...) return game:GetService("HttpService"):JSONDecode(...) end,
    jsencode = function(...) return game:GetService("HttpService"):JSONEncode(...) end,
    getgithubcontent = function(table) local Response = funcs.request({Url = "https://raw.githubusercontent.com/"..table["User"].."/"..table["Repository"]:gsub(" ", "-").."/"..table["Branch"].."/"..table["FileName"], Method = "GET", Headers = {["Authorization"] = "token "..table["AccessToken"], ["Content-Type"] = "application/json"}}) for i,v in pairs(oldprints) do getgenv()[i] = v end if Response.Success then return Response.Body else warn("404: Not Found") return "404: Not Found" end end,
    base64 = funcs.loadstring(funcs.httpget("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Utilities/Base64.lua"))
}
local mt = funcs.getrawmetatable(game)
local oldnc = mt.__namecall; mt.__namecall = newcclosure(function(self, ...)
    if getcallingscript() ~= nil then return oldnc(self, ...) end
    local a = {...}
    local Method = getnamecallmethod()
    if Method == "FindFirstDescendant" then
        if a[1] == nil then return error("No argument was provided") end
        for i, v in pairs(self:GetDescendants()) do
            if v.Name == a[1] then
                return v
            end
        end
        return false
    elseif Method == "FindFirstDescendantWhichIsA" then
        if a[1] == nil then return error("No argument was provided") end
        for i, v in pairs(self:GetDescendants()) do
            if v:IsA(a[1]) then
                return v
            end
        end
        return false
    elseif Method == "FindFirstDescendantOfClass" then
        if a[1] == nil then return error("No argument was provided") end
        for i, v in pairs(self:GetDescendants()) do
            if v:IsA(a[1]) then
                return v
            end
        end
        return false
    elseif Method == "GetDescendantsWithNames" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetDescendants()) do
            if v.Name == a[1] and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "GetDescendantsWithNamesOfClass" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetDescendants()) do
            if v:IsA(a[1]) and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "GetDescendantsWithNamesWhichAreA" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetDescendants()) do
            if v:IsA(a[1]) and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "GetChildrenWithNames" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetChildren()) do
            if v.Name == a[1] and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "GetChildrenWithNamesOfClass" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetChildren()) do
            if v:IsA(a[1]) and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "GetChildrenWithNamesWhichAreA" then
        if a[1] == nil then return error("No argument was provided") end
        if a[2] == nil then a[2] = math.huge end
        local tbl = {}
        for i,v in pairs(self:GetChildren()) do
            if v:IsA(a[1]) and #tbl ~= a[2] then
                tbl[#tbl + 1] = v
            end
        end
        return tbl
    elseif Method == "HasProperties" then
        local props = {...}
        local HasProps
        for i = 1, #props do
        	local success, result = pcall(function() self[props[i]] = self[props[i]] end)
	        if success and HasProps ~= false or result:find(". Property is read only") and HasProps ~= false then
	            HasProps = true
	        else
	        	HasProps = false
	        end
        end
        return HasProps
    end
    return oldnc(self, ...)
end)

local mt2 = funcs.getrawmetatable(game)
local oldnc2 = mt2.__namecall; mt2.__namecall = newcclosure(function(self, ...)
    if getcallingscript() ~= nil then return oldnc(self, ...) end
    local a = {...}
    local Method = getnamecallmethod()
    if Method == "GetService" and self == game then
        assert(a[1] or a[1] == "", "'"..tostring(a[1]).."' is not a valid Service name")
        if a[1] == "Base64" then
            return funcs.base64
        end
    elseif Method:lower() == "getprivategithubcontent" and self == game or Method:lower() == "getprivategitcontent" and self == game or Method:lower() == "getprivategit" and self == game or Method:lower() == "getprivategithub" and self == game then
        assert(a[1], "Argument #1 Missing or nil")
        assert(a[1]["User"], "No 'User' was provided")
        assert(a[1]["Repository"], "No 'Repository' was provided")
        if a[1]["Branch"] == nil then a[1]["Branch"] = "main" end
        assert(a[1]["FileName"], "No 'FileName' was provided")
        assert(a[1]["AccessToken"], "No 'AccessToken' was provided")
        return funcs.getgithubcontent(a[1])
    elseif typeof(self) == "Color3" and Method == "ToHex" then
        return funcs.tohex(self)
    elseif self == game and Method:lower() == "getexecutor" then
        return funcs.getexecutor()
    elseif Method:lower() == "protectgui" and typeof(self) == "Instance" and self.ClassName == "ScreenGui" then
        assert(a[1], "Argument #1 Missing or nil")
        if a[2] == nil then a[2] = true end
        return funcs.protectgui(self, a[2])
    elseif Method:lower() == "isexecutorclosure" and typeof(self) == "function" or Method:lower() == "isclosure" and typeof(self) == "function" then
        return funcs.isclosure(self)
    elseif Method == "IsChildOf" and typeof(self) == "Instance" then
        assert(a[1], "Argument #1 Missing or nil")
        return self.Parent == a[1]
    end
    return oldnc2(self, ...)
end)

Drawing.Elements = {}
Drawing.elements = {}
Drawing.Drawings = {}
Drawing.drawings = {}
Drawing.fonts = Drawing.Fonts

local function AddDrawingElement(drw)
    Drawing.Elements[#Drawing.Elements + 1] = drw
    Drawing.elements[#Drawing.elements + 1] = drw
    Drawing.Drawings[#Drawing.Drawings + 1] = drw
    Drawing.drawings[#Drawing.drawings + 1] = drw
end

local olddraw = Drawing.new

Drawing.new = function(...)
	local element = olddraw(...)
	AddDrawingElement({type = ..., object = element})
	return element
end

Drawing.New = function(...)
	local element = olddraw(...)
	AddDrawingElement({type = ..., object = element})
	return element
end
