if not game:IsLoaded() then
	game.Loaded:Wait()
end

if not syn then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Lua_SecureCall", true))()
end

local queue_on_tp = (syn and syn.queue_on_teleport or queue_on_teleport)
local secure_call = (syn and syn.secure_call or cus_secure_call)
game:GetService("ReplicatedStorage"):WaitForChild("Remote", 60):WaitForChild("Effects", 60):WaitForChild("ExitWarpEffect", 60)
task.wait(3)
local Routes = require(game:GetService("ReplicatedStorage"):WaitForChild("Source", 60):WaitForChild("Client", 60):WaitForChild("Helpers", 60):WaitForChild("Routes", 60))
local go = false
local NM NM = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
	if not checkcaller() and getnamecallmethod() == "FireServer" and self == ExitWarpEffect then
		go = true
	end
	return NM(self, ...)
end))
repeat task.wait() until go == true
task.wait(3.34)
queue_on_tp(game:HttpGet("", true))
secure_call(require(game:GetService("ReplicatedStorage").Source.Client.Flight.Warp).leaveSystem, game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Game"), game:GetService("ReplicatedStorage").System.Neighbors[Routes.getNextSystemName()].Value)
