local QTP = (syn and syn.queue_on_teleport) or queue_on_teleport
repeat task.wait() until game.CoreGui task.wait(0.25)
game.CoreGui:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay").DescendantAdded:Connect(function(Err)
	if Err.Name == "ErrorTitle" then
		QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
        game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer) return
	end
end)
for i,Err in pairs(game.CoreGui:WaitForChild("RobloxPromptGui"):WaitForChild("promptOverlay"):GetDescendants()) do
	if Err.Name == "ErrorTitle" then
		QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
        game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer) return
	end
end
if game.PlaceId == 6839171747 then
    repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop").Visible == true task.wait(.25)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer()
    QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
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
    QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
    while true do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = FoundFreeElevator.CFrame 
        firetouchinterest(FoundFreeElevator:FindFirstChild("TouchInterest"), game.Players.LocalPlayer.Character.Head, 0) 
        firetouchinterest(FoundFreeElevator:FindFirstChild("TouchInterest"), game.Players.LocalPlayer.Character.Head, 1) task.wait()
    end
else
    QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
    game:GetService("TeleportService"):Teleport(6516141723, game.Players.LocalPlayer)
end
