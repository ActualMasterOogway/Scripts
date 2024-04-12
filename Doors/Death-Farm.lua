-- loader:
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))()
local QTP = (syn and syn.queue_on_teleport) or queue_on_teleport
repeat task.wait() until game.CoreGui task.wait(0.25)
game.CoreGui:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay").DescendantAdded:Connect(function(Err)
	if Err.Name == "ErrorTitle" then task.wait(1.25)
		task.spawn(QTP, game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))
        game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer) return
	end
end)
for i,Err in pairs(game.CoreGui:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay"):GetDescendants()) do
	if Err.Name == "ErrorTitle" then task.wait(1.25)
		task.spawn(QTP, game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))
        game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer) return
	end
end

if game.PlaceId == 6839171747 then
    repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop").Visible == true task.wait(1.25)
    local Hum: Humanoid = game.Players.LocalPlayer.Character.Humanoid
    while not Hum.Parent:FindFirstChild("Key") and task.wait() do
        game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Camera.Disabled = false
        Hum.Parent:PivotTo(workspace.CurrentRooms["0"].Assets.KeyObtain.Hitbox.CFrame)
        task.wait()
        fireproximityprompt(workspace.CurrentRooms["0"].Assets.KeyObtain.ModulePrompt)
    end
    task.wait(.6)
    print("e")
    game.ReplicatedStorage.RemotesFolder.PreRunShop:FireServer({})
    task.wait(.1)
    fireproximityprompt(workspace.CurrentRooms["0"].StarterElevator.Model.Model.SkipButton.SkipPrompt)
    Hum.WalkSpeed = 21
    Hum.Parent:WaitForChild("Collision").CanCollide = false
    task.wait(.6)
    game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Camera.Disabled = false

    local targetPosition = (workspace.CurrentRooms["0"].Door.Door.CFrame * CFrame.new(0, 0, 5)).Position

    while (Hum.RootPart.Position - targetPosition).Magnitude > 1.3 and task.wait() do
        Hum.Parent.Collision.AssemblyLinearVelocity = (targetPosition - Hum.Parent.Collision.Position).Unit * 20.5
        print("not finished walking, grrrr", (Hum.RootPart.Position - targetPosition).Magnitude)
    end
    game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Camera.Disabled = true
    task.wait()
    workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, workspace.CurrentRooms["0"].Door.Door.Position)
    task.wait()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, workspace.CurrentRooms["0"].Door.Lock.UnlockPrompt.KeyboardKeyCode, false, game)
    game.ReplicatedStorage.GameData.LatestRoom:GetPropertyChangedSignal("Value"):Wait()
    game:GetService("VirtualInputManager"):SendKeyEvent(false, workspace.CurrentRooms["0"].Door.Lock.UnlockPrompt.KeyboardKeyCode, false, game)
    game.Players.LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Camera.Disabled = false
    Hum.Health = 0
    task.spawn(QTP, game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))
    game.ReplicatedStorage.RemotesFolder.PlayAgain:FireServer()
elseif game.PlaceId == 6516141723 then
    repeat task.wait() until game:IsLoaded() and game.Players and game.Workspace and game.Players.LocalPlayer and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("Head") and game.Players.LocalPlayer.Character:FindFirstChild("Health") and game.Players.LocalPlayer.Character:FindFirstChild("Sheesh") and game.Workspace:FindFirstChild("Lobby") and game.Workspace:FindFirstChild("Lobby"):FindFirstChild("LobbyElevators") local FoundFreeElevator = false task.wait(.5)
    task.spawn(function()
        while FoundFreeElevator == false do task.wait()
            for i,v in pairs(game:GetService("Workspace").Lobby.LobbyElevators:GetDescendants()) do
                if v:IsA("TextLabel") and v.Text == "0 / 1" and v.Parent.Parent.Name == "DoorHitbox" then
                    FoundFreeElevator = v.Parent.Parent
                end
            end
        end
    end)
    repeat task.wait() until FoundFreeElevator ~= false task.wait()
    task.spawn(QTP, game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FoundFreeElevator.CFrame
        firetouchinterest(FoundFreeElevator:FindFirstChild("TouchInterest"), game.Players.LocalPlayer.Character.Head, 0) 
        firetouchinterest(FoundFreeElevator:FindFirstChild("TouchInterest"), game.Players.LocalPlayer.Character.Head, 1) 
        task.wait()
    end
else
    task.spawn(QTP, game:HttpGet("https://raw.githubusercontent.com/ActualMasterOogway/Scripts/main/Doors/Death-Farm.lua"))
    game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer)
end
