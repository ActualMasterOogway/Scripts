if not game:IsLoaded() then
	game.Loaded:Wait()
end

if not syn then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Lua_SecureCall", true))()
end

local queue_on_tp = (syn and syn.queue_on_teleport or queue_on_teleport)
local secure_call = (syn and syn.secure_call or cus_secure_call)
game:GetService("ReplicatedStorage"):WaitForChild("Remote", 60):WaitForChild("Effects", 60):WaitForChild("ExitWarpEffect", 60)
task.wait(3.5)
local Routes = require(game:GetService("ReplicatedStorage"):WaitForChild("Source", 60):WaitForChild("Client", 60):WaitForChild("Helpers", 60):WaitForChild("Routes", 60))
local go = false
local NM NM = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	if not checkcaller() and getnamecallmethod() == "FireServer" and self.Name == "ExitWarpEffect" then
		go = true
	end
	return NM(self, ...)
end))
repeat task.wait() until go == true
task.wait(1)
if Routes.getNextSystemName() ~= nil then
	queue_on_tp(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Star%20Scape/Auto%20Warp.lua", true))
	secure_call(require(game:GetService("ReplicatedStorage").Source.Client.Flight.Warp).leaveSystem, game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Game"), game:GetService("ReplicatedStorage").System.Neighbors[Routes.getNextSystemName()].Value)
elseif game.PlaceId == 3352371986 then
    TPShip(CFrame.new(-14859.5, -15436, -15846.5, 0.712774694, 0.311850518, 0.628252685, -0.056373354, 0.918294728, -0.391863286, -0.699123919, 0.243893534, 0.672117352))
    local Supplies
    for i,v in pairs(game.Workspace.Stations:GetDescendants()) do 
        if v.Name == "Supplies" then
            Supplies = v
        end
    end
    game:GetService("ReplicatedStorage").Remote.Warfare.TakeFactionSupplies:FireServer(Supplies, BoxAmount)
    task.wait(0.65)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 0x6d, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 0x6d, false, game)
    task.wait(1.25)
	MouseClick("Left", 1095, 847)
	task.wait(0.45)
	MouseClick("Left", 1000, 880)
	task.wait(0.15)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 0x6d, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 0x6d, false, game)
    queue_on_tp(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Star%20Scape/Auto%20Warp.lua", true))
	secure_call(require(game:GetService("ReplicatedStorage").Source.Client.Flight.Warp).leaveSystem, game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Game"), game:GetService("ReplicatedStorage").System.Neighbors[Routes.getNextSystemName()].Value)
end
