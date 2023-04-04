if game.PlaceId == 6839171747 then
    repeat task.wait() until game:IsLoaded() and game.Players and game.Players.LocalPlayer and game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop") and game.Players.LocalPlayer:FindFirstChild("PlayerGui"):FindFirstChild("MainUI"):FindFirstChild("ItemShop").Visible == true task.wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    game.ReplicatedStorage.EntityInfo.PlayAgain:FireServer()
    local QTP = (syn and syn.queue_on_teleport) or queue_on_teleport
    QTP(game:HttpGet("https://raw.githubusercontent.com/MasterOogway6147/Scripts/main/Doors/Death%20Farm.lua"))
end
