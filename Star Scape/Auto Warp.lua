if not game:IsLoaded() then
	game.Loaded:Wait()
end

if not syn or not syn.secure_call then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Lua_SecureCall", true))()
end

local queue_on_tp = (syn and syn.queue_on_teleport or queue_on_teleport)
local secure_call = ((syn and syn.secure_call) or cus_secure_call)

local function GetSectorByName(Name: string)
    for i,v in next, game:GetService("ReplicatedStorage").Galaxy.Sectors:GetDescendants() do
        if v.Name == Name then
            return v
        end
    end
end

local Routes = require(game:GetService("ReplicatedStorage"):WaitForChild("Source", 60):WaitForChild("Client", 60):WaitForChild("Helpers", 60):WaitForChild("Routes", 60))
if Routes.getNextSystemName() ~= nil then
	queue_on_tp(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Star%20Scape/Auto%20Warp.lua", true))

    secure_call(require(game:GetService("ReplicatedStorage").Source.Client.Actions.WarpToStar), game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Game"), GetSectorByName(Routes.getNextSystemName()))
end
