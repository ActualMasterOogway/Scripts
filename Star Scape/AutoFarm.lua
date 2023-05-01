if not game:IsLoaded() then
	game.Loaded:Wait()
end
if not syn then
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Babyhamsta/RBLX_Scripts/main/Universal/Lua_SecureCall", true))()
end
local queue_on_tp = (syn and syn.queue_on_teleport or queue_on_teleport)
local secure_call = (syn and syn.secure_call or cus_secure_call)
local Routes = require(game:GetService("ReplicatedStorage"):WaitForChild("Source", 60):WaitForChild("Client", 60):WaitForChild("Helpers", 60):WaitForChild("Routes", 60))
local Ship = game:GetService("Workspace").Ships[game:GetService("Players").LocalPlayer.Name]:FindFirstChildWhichIsA("Model")
function TPShip(Position)
    local M = Instance.new("Model")
    local Obj = Instance.new("Part", M)
    Obj.Name = "Object"
    local St = Instance.new("Part", M)
    St.Name = "Stats"
    local Z = Instance.new("NumberValue", St)
    Z.Name = "Zone"
    local T = Instance.new("NumberValue", St)
    T.Name = "Type"
    task.spawn(function()
        require(game:GetService("ReplicatedStorage").Source.Client.Flight.Warp).warpToTarget(M)
    end)
    task.wait(.5)
    if typeof(Position) == "Vector3" then
        Ship:SetPrimaryPartCFrame(CFrame.new(Position))
    elseif typeof(Position) == "CFrame" then
        Ship:SetPrimaryPartCFrame(Position)
    end
    task.wait(.5)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 0x78, false, game)
	task.wait()
	game:GetService("VirtualInputManager"):SendKeyEvent(false, 0x78, false, game)
end
function MouseClick(Type, XPos, YPos)
    if typeof(XPos) ~= "number" then
        return error("Expected Number at X Position (got "..typeof(XPos)..")")
    elseif typeof(YPos) ~= "number" then
        return error("Expected Number at Y Position (g  ot "..typeof(YPos)..")")
    end
    if string.match(Type:lower(), "left") then
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(XPos, YPos, 0, true, game, 0) task.wait() game:GetService("VirtualInputManager"):SendMouseButtonEvent(XPos, YPos, 0, false, game, 0)
    elseif string.match(Type:lower(), "right") then
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(XPos, YPos, 1, true, game, 0) task.wait() game:GetService("VirtualInputManager"):SendMouseButtonEvent(XPos, YPos, 1, false, game, 0)
    else
        return error("Expected Mouse Click Left or Right (got "..Type..")")
    end
end
for i,v in pairs(Ship:GetDescendants()) do
    if v:IsA("BasePart") and v.CanCollide then
        v.CanCollide = false
    end
end
local BoxAmount = tonumber(readfile("StarScapeBoxAmount.config"))
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
elseif game.PlaceId == 731680819 then
    game:GetService("ReplicatedStorage").Source.Client.Triggers.PreloadZone:Fire(1)
    task.wait(.25)
    TPShip(CFrame.new(-16417.2773, -15400.4619, -18133.0996, 0.712774694, 0.311850518, 0.628252685, -0.056373354, 0.918294728, -0.391863286, -0.699123919, 0.243893534, 0.672117352))
    task.wait(0.5)
    game:GetService("ReplicatedStorage").Remote.Warfare.DeliverFactionSupplies:FireServer(game:GetService("Workspace").Stations:GetChildren()[2], "TradeUnionSupplies", BoxAmount)
    game:GetService("ReplicatedStorage").Remote.Warfare.DeliverFactionSupplies:FireServer(game:GetService("Workspace").Stations:GetChildren()[1], "TradeUnionSupplies", BoxAmount)
    task.wait(0.45)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 0x6d, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 0x6d, false, game)
    task.wait(1.25)
    game:GetService("Players").LocalPlayer.PlayerGui.Map.Window.Position = UDim2.new(0, 0, -0.65, 0)
    task.wait(0.25)
    MouseClick("Left", 849, 216)
    task.wait(0.25)
    game:GetService("Players").LocalPlayer.PlayerGui.Map.Window.Position = UDim2.new(0, 0, 0, 0)
    task.wait(0.45)
    MouseClick("Left", 1000, 880)
    task.wait(0.15)
    game:GetService("VirtualInputManager"):SendKeyEvent(true, 0x6d, false, game)
    game:GetService("VirtualInputManager"):SendKeyEvent(false, 0x6d, false, game)
    queue_on_tp(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Star%20Scape/Auto%20Warp.lua", true))
	secure_call(require(game:GetService("ReplicatedStorage").Source.Client.Flight.Warp).leaveSystem, game:GetService("Players").LocalPlayer:WaitForChild("PlayerScripts"):WaitForChild("Game"), game:GetService("ReplicatedStorage").System.Neighbors[Routes.getNextSystemName()].Value)
end
