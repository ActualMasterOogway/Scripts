-- // Variables \\ --

local Plr = game.Players.LocalPlayer

local Functions = {
    IsClosure = is_synapse_function or iskrnlclosure or isexecutorclosure or function() return true end,
    SetIdentity = (syn and syn.set_thread_identity) or set_thread_identity or setthreadidentity or setthreadcontext or function() return 0 end,
    GetIdentity = (syn and syn.get_thread_identity) or get_thread_identity or getthreadidentity or getthreadcontext or function() return 0 end,
    Request = (syn and syn.request) or http_request or request or function() return {Body = "404: Not Found", Success = false} end,
    QueueOnTeleport = (syn and syn.queue_on_teleport) or queue_on_teleport or function() end,
    GetAsset = getsynasset or getcustomasset or function() return "" end,
    ProtectGui = protect_gui or (syn and syn.protect_gui) or (Fluxus and Fluxus.protect_gui) or function(...) return ... end,
    GetHUI = gethui or get_hidden_ui or function(...) return game.CoreGui end,
    SetReadOnly = setreadonly or make_writeable or function(...) return ... end,
    IsReadOnly = isreadonly or is_writeable or function() return true end,
    CloneData = function(a) if typeof(a) == "userdata" and (cloneref or clonereference) then return (cloneref or clonereference)(a), true elseif type(a) == "function" and (clonefunc or clonefunction) then return (clonefunc or clonefunction)(a), true elseif typeof(a) == "Instance" then local oldArchivable = a.Archivable a.Archivable = true local c = a:Clone() a.Archivable = oldArchivable return c, true end return a, false end,
	Executor = (function() local exploitcheck = identifyexecutor or getexecutor or getexecutorname or (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or (secure_load and "Sentinel") or (is_sirhurt_closure and "Sirhurt") or (pebc_execute and "ProtoSmasher") or (KRNL_LOADED and "Krnl") or (WrapGlobal and "WeAreDevs") or (isvm and "Proxo") or (shadow_env and "Shadow") or (jit and "EasyExploits") or (getscriptenvs and "Calamari") or (unit and not syn and "Unit") or (OXYGEN_LOADED and "Oxygen U") or (IsElectron and "Electron") local Exploit = "Undefined" if type(exploitcheck) == "function" then Exploit = exploitcheck() elseif type(exploitcheck) == "string" then Exploit = exploitcheck else Exploit = "Failed to identify Executor!" end return Exploit end)(),
	Color = {
		Add = function(...) return ... end,
		Substract = function(...) return ... end,
		ToHex = function(...) return ... end,
		ToColor3 = function(...) return ... end,
	},
    GetSignalConnections = getconnections or getsignalcons or get_signal_cons or function(signal: RBXScriptSignal) if typeof(signal) == "RBXScriptSignal" then return {} else return error('connect is not a valid member of '..signal.ClassName..' "'..signal.Name..'"') end end
}

-- // Misc Functions \\ --

local function convertToAsset(str)
    if isfile(str) then
        return Functions.GetAsset(str)
        
    elseif str:find("rbxassetid") or tonumber(str) then
        local numberId = str:gsub("%D", "")
        return "rbxassetid://".. numberId
        
    elseif str:find("http") then
        local req = Functions.Request({Url=str, Method="GET"})
        
        if req.Success then
            local name = "customObject_".. tick().. ".txt"
            writefile("realmasteroogway_debris\\"..name, req.Body)
            return Functions.GetAsset(name)
        end
    end
end -- thx vynixu

local GetService = game.GetService

-- // Functions \\ --

Functions.Service = setmetatable({}, {__index = function(self, ServiceName)
	local Service = Functions.CloneData(GetService(game, ServiceName))
	self[ServiceName] = Service
	return Service
end})

Functions.GetMT = function(...) local mt = getrawmetatable(...) Functions.SetReadOnly(mt, false) return mt end

Functions.JSDecode = function(...) return Functions.Service.HttpService:JSONDecode(...) end

Functions.JSEncode = function(...) return Functions.Service.HttpService:JSONEncode(...) end

Functions.GetPlayerByName = function(name)
    for i,plr in next, game.Players:GetPlayers() do
        if string.find(plr.Name:lower(), name) or string.find(plr.DisplayName:lower(), name) then
            return plr
        end
    end
end

Functions.LoadCustomAsset = function(str)
    if str == "" then
        return ""
    end

    return convertToAsset(str)
end -- and thx again for the function :)

Functions.LoadCustomInstance = function(str)
    if str ~= "" then
        local asset = convertToAsset(str)
        local success, result = pcall(function()
            return game:GetObjects(asset)[1]
        end)
    
        if success then
            return result
        end
    end

    warn("Something went wrong attempting to load custom instance")
end -- and again

Functions.CreateModule = function(configs)
    local md = {}
    local realMD = {}
    md.__index = md
    realMD.__index = realMD

    md.GetModule = function(self)
        if self ~= md.__index.__index then return error("Expected ':' not '.' calling member function GetModule", 5) end
        return realMD
    end

    md.AddFunction = function(self)
        if self ~= md.__index.__index then return error("Expected ':' not '.' calling member function AddFunction", 5) end
    end

    return md
end

-- Scripts
if isfolder("realmasteroogway_debris") then delfolder("realmasteroogway_debris") end
makefolder("realmasteroogway_debris")

Functions.Service.Players.PlayerRemoving:Connect(function(player)
    if player == Plr then
        delfolder("realmasteroogway_debris")
    end
end)

return Functions
