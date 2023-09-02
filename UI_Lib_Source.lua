local MasterOogway6147 = {}
MasterOogway6147.Version = "1.0"
local guiloaded = false
function rmdname(length)
	local randomname = ""
	for i = 1, length do
		randomname = randomname..string.char(math.random(65,90))
	end
	return randomname
end

function MasterOogway6147:Load(loadconfig)
	if loadconfig.KeySystem == nil then
		loadconfig.KeySystem = {
			Enabled = false,
			Key = ""
		}
	end
	loadconfig.KeySystem.Enabled = not loadconfig.KeySystem.Enabled 
    local Config = {
        Key = loadconfig.KeySystem.Key,
        Callback = loadconfig.Callback or function() end
    }
	local CurrentPlaceImageId = game.MarketplaceService:GetProductInfo(game.PlaceId).IconImageAssetId
	local CurrentPlaceName = tostring(game.MarketplaceService:GetProductInfo(game.PlaceId).Name)
	if loadconfig.Oogwaymode == nil or typeof(loadconfig.Oogwaymode) ~= "number" then
		if math.random(1, 50) == 1 then
			loadconfig.Oogwaymode = 0
		else
			loadconfig.Oogwaymode = 1
		end
	end
	if loadconfig.MouseAvailableOnFirstPersonMode.Enabled == true then
		local ScreenGui = Instance.new("ScreenGui")
		local TextButton = Instance.new("TextButton")

		ScreenGui.Parent = game.CoreGui.RobloxGui
		ScreenGui.IgnoreGuiInset = true
		ScreenGui.Enabled = false
		TextButton.Parent = ScreenGui
		TextButton.Size = UDim2.new(0, 0, 0, 0)
		TextButton.BackgroundTransparency = 1
		TextButton.Modal = true
		TextButton.Text = ""

		game:GetService("UserInputService").InputBegan:Connect(function(key, processed)
			if processed then return end
			if key.KeyCode == loadconfig.MouseAvailableOnFirstPersonMode.KeybindToUnlockMouse then
				ScreenGui.Enabled = not ScreenGui.enabled
			end
		end)
	end
    local MasterOogway6147Key = Instance.new("ScreenGui")
    MasterOogway6147Key.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MasterOogway6147Key.Parent = game.CoreGui
    MasterOogway6147Key.Name = rmdname(18)
    MasterOogway6147Key.ResetOnSpawn = false

    task.spawn(function()
        while wait(1) do
            if MasterOogway6147Key then
                for i, v in pairs(MasterOogway6147Key:GetDescendants()) do
                    if v then
                        v.Name = rmdname(math.random(10,20))
                    end
                end
            end
        end
    end)

    local MasterOogway6147KeyShadow = Instance.new("ImageLabel")
    MasterOogway6147KeyShadow.Name = "MasterOogway6147KeyShadow"
    MasterOogway6147KeyShadow.ZIndex = 2
    MasterOogway6147KeyShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    MasterOogway6147KeyShadow.Size = UDim2.new(0, 660, 0, 134)
    MasterOogway6147KeyShadow.ClipsDescendants = true
    MasterOogway6147KeyShadow.BackgroundTransparency = 1
    MasterOogway6147KeyShadow.Position = UDim2.new(0.5, 0, 0.6, 0)
    MasterOogway6147KeyShadow.BorderSizePixel = 0
    MasterOogway6147KeyShadow.ScaleType = Enum.ScaleType.Slice
    MasterOogway6147KeyShadow.ImageTransparency = 1
    MasterOogway6147KeyShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    MasterOogway6147KeyShadow.TileSize = UDim2.new(1, 0, 2, 0)
    MasterOogway6147KeyShadow.Image = "rbxassetid://1316045217"
    MasterOogway6147KeyShadow.SliceCenter = Rect.new(50, 50, 50, 50)
    MasterOogway6147KeyShadow.Parent = MasterOogway6147Key
    
    local MasterOogway6147KeyShadow_Window = Instance.new("Frame")
    MasterOogway6147KeyShadow_Window.Name = "MasterOogway6147KeyShadow_Window"
    MasterOogway6147KeyShadow_Window.ZIndex = 3
    MasterOogway6147KeyShadow_Window.Size = UDim2.new(0, 650, 0, 124)
    MasterOogway6147KeyShadow_Window.ClipsDescendants = true
    MasterOogway6147KeyShadow_Window.Position = UDim2.new(0, 5, 0, 5)
    MasterOogway6147KeyShadow_Window.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window.BackgroundColor3 = loadconfig.Color.Background
    MasterOogway6147KeyShadow_Window.Parent = MasterOogway6147KeyShadow
    
    local MasterOogway6147KeyShadow_WindowUICorner = Instance.new("UICorner")
    MasterOogway6147KeyShadow_WindowUICorner.Name = "MasterOogway6147KeyShadow_WindowUICorner"
    MasterOogway6147KeyShadow_WindowUICorner.CornerRadius = UDim.new(0, 3)
    MasterOogway6147KeyShadow_WindowUICorner.Parent = MasterOogway6147KeyShadow_Window
    
    local MasterOogway6147KeyShadow_WindowUIStroke = Instance.new("UIStroke")
    MasterOogway6147KeyShadow_WindowUIStroke.Name = "MasterOogway6147KeyShadow_WindowUIStroke"
    MasterOogway6147KeyShadow_WindowUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    MasterOogway6147KeyShadow_WindowUIStroke.Thickness = 1.2
    MasterOogway6147KeyShadow_WindowUIStroke.Color = Color3.fromRGB(100, 100, 100)
    MasterOogway6147KeyShadow_WindowUIStroke.Parent = MasterOogway6147KeyShadow_Window
    
    local MasterOogway6147KeyShadow_Window_Outline = Instance.new("Frame")
    MasterOogway6147KeyShadow_Window_Outline.Name = "MasterOogway6147KeyShadow_Window_Outline"
    MasterOogway6147KeyShadow_Window_Outline.ZIndex = 4
    MasterOogway6147KeyShadow_Window_Outline.Size = UDim2.new(0, 650, 0, 1)
    MasterOogway6147KeyShadow_Window_Outline.Position = UDim2.new(0, 0, 0, 34)
    MasterOogway6147KeyShadow_Window_Outline.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_Outline.BackgroundColor3 = loadconfig.Color.Foreground
    MasterOogway6147KeyShadow_Window_Outline.Parent = MasterOogway6147KeyShadow_Window
    
    local MasterOogway6147KeyShadow_Window_TopBar = Instance.new("Frame")
    MasterOogway6147KeyShadow_Window_TopBar.Name = "MasterOogway6147KeyShadow_Window_TopBar"
    MasterOogway6147KeyShadow_Window_TopBar.ZIndex = 4
    MasterOogway6147KeyShadow_Window_TopBar.Size = UDim2.new(0, 650, 0, 34)
    MasterOogway6147KeyShadow_Window_TopBar.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_TopBar.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    MasterOogway6147KeyShadow_Window_TopBar.Parent = MasterOogway6147KeyShadow_Window
    
    local MasterOogway6147KeyShadow_Window_TopBarWindowUICorner = Instance.new("UICorner")
    MasterOogway6147KeyShadow_Window_TopBarWindowUICorner.Name = "MasterOogway6147KeyShadow_Window_TopBarWindowUICorner"
    MasterOogway6147KeyShadow_Window_TopBarWindowUICorner.CornerRadius = UDim.new(0, 6)
    MasterOogway6147KeyShadow_Window_TopBarWindowUICorner.Parent = MasterOogway6147KeyShadow_Window_TopBar
    
    local MasterOogway6147KeyShadow_Window_TopBar_Title = Instance.new("TextLabel")
    MasterOogway6147KeyShadow_Window_TopBar_Title.Name = "MasterOogway6147KeyShadow_Window_TopBar_Title"
    MasterOogway6147KeyShadow_Window_TopBar_Title.ZIndex = 5
    MasterOogway6147KeyShadow_Window_TopBar_Title.Size = UDim2.new(0, 80, 0, 25)
    MasterOogway6147KeyShadow_Window_TopBar_Title.BackgroundTransparency = 1
    MasterOogway6147KeyShadow_Window_TopBar_Title.Position = UDim2.new(0, 7.5, 0, 5)
    MasterOogway6147KeyShadow_Window_TopBar_Title.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_TopBar_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147KeyShadow_Window_TopBar_Title.FontSize = Enum.FontSize.Size14
    MasterOogway6147KeyShadow_Window_TopBar_Title.TextSize = 14
    MasterOogway6147KeyShadow_Window_TopBar_Title.TextScaled = true
    MasterOogway6147KeyShadow_Window_TopBar_Title.TextColor3 = Color3.fromRGB(220, 220, 220)
    MasterOogway6147KeyShadow_Window_TopBar_Title.Text = loadconfig.HubName
    MasterOogway6147KeyShadow_Window_TopBar_Title.Font = Enum.Font.Gotham
    MasterOogway6147KeyShadow_Window_TopBar_Title.TextXAlignment = Enum.TextXAlignment.Left
    MasterOogway6147KeyShadow_Window_TopBar_Title.Parent = MasterOogway6147KeyShadow_Window_TopBar
    
    local MasterOogway6147KeyShadow_Window_TopBar_Beta_Title = Instance.new("TextLabel")
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Name = "MasterOogway6147KeyShadow_Window_TopBar_Beta_Title"
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.ZIndex = 5
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Size = UDim2.new(0, 53, 0, 22)
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Position = UDim2.new(0, 90, 0, 6)
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.BackgroundColor3 = loadconfig.Color.Foreground
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.FontSize = Enum.FontSize.Size14
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.TextSize = 14
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.TextColor3 = loadconfig.Color.Background
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Text = "Beta"
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Font = Enum.Font.Gotham
    MasterOogway6147KeyShadow_Window_TopBar_Beta_Title.Parent = MasterOogway6147KeyShadow_Window_TopBar
    
    local MasterOogway6147KeyShadow_Window_TopBar_Beta_TitleWindowUICorner = Instance.new("UICorner")
    MasterOogway6147KeyShadow_Window_TopBar_Beta_TitleWindowUICorner.Name = "MasterOogway6147KeyShadow_Window_TopBar_Beta_TitleWindowUICorner"
    MasterOogway6147KeyShadow_Window_TopBar_Beta_TitleWindowUICorner.CornerRadius = UDim.new(0, 4)
    MasterOogway6147KeyShadow_Window_TopBar_Beta_TitleWindowUICorner.Parent = MasterOogway6147KeyShadow_Window_TopBar_Beta_Title
    
    local MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title = Instance.new("TextLabel")
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Name = "MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title"
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.ZIndex = 5
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Size = UDim2.new(0, 76, 0, 35)
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.BackgroundTransparency = 1
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Position = UDim2.new(0, 150, 0, 0)
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.FontSize = Enum.FontSize.Size14
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.TextSize = 14
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.TextColor3 = loadconfig.Color.Foreground
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Text = "Key System"
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Font = Enum.Font.Gotham
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.TextXAlignment = Enum.TextXAlignment.Left
    MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title.Parent = MasterOogway6147KeyShadow_Window_TopBar
    
    local MasterOogway6147KeyShadow_Window_TopBar_Close_Button = Instance.new("ImageButton")
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.Name = "MasterOogway6147KeyShadow_Window_TopBar_Close_Button"
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.ZIndex = 5
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.Size = UDim2.new(0, 18, 0, 18)
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.BackgroundTransparency = 1
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.Position = UDim2.new(0, 624, 0, 8)
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.BorderSizePixel = 0
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.ImageColor3 = Color3.fromRGB(220, 220, 220)
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.Image = "http://www.roblox.com/asset/?id=6031094678"
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.Parent = MasterOogway6147KeyShadow_Window_TopBar
    MasterOogway6147KeyShadow_Window_TopBar_Close_Button.MouseButton1Click:Connect(function()
        game:GetService("TweenService"):Create(MasterOogway6147KeyShadow, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0.5, 0, 1, 0)}):Play()
        for i, v in pairs(MasterOogway6147Key:GetDescendants()) do
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
            elseif v:IsA("Frame") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
            elseif v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
            elseif v:IsA("UIStroke") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 1}):Play()
            end
        end
        wait(0.5)
        MasterOogway6147Key:Destroy()
        wait(0.5)
    end)

	local MasterOogway6147_Current_LoadingTXT = Instance.new("TextLabel")
    MasterOogway6147_Current_LoadingTXT.Name = "MasterOogway6147_Current_LoadingTXT"
    MasterOogway6147_Current_LoadingTXT.ZIndex = 5
    MasterOogway6147_Current_LoadingTXT.Size = UDim2.new(0, 120, 0, 35)
    MasterOogway6147_Current_LoadingTXT.BackgroundTransparency = 1
    MasterOogway6147_Current_LoadingTXT.BorderSizePixel = 0
    MasterOogway6147_Current_LoadingTXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147_Current_LoadingTXT.FontSize = Enum.FontSize.Size14
    MasterOogway6147_Current_LoadingTXT.TextTransparency = 1
    MasterOogway6147_Current_LoadingTXT.TextSize = 14
    MasterOogway6147_Current_LoadingTXT.TextColor3 = loadconfig.Color.Foreground
    MasterOogway6147_Current_LoadingTXT.Text = "Correct Key!"
    MasterOogway6147_Current_LoadingTXT.Font = Enum.Font.Gotham
    MasterOogway6147_Current_LoadingTXT.TextXAlignment = Enum.TextXAlignment.Right
    MasterOogway6147_Current_LoadingTXT.Parent = MasterOogway6147KeyShadow_Window_TopBar
    
    if loadconfig.Discord.Join == true then
		if loadconfig.Discord.Type == ("Button" or nil) then
			MasterOogway6147_Current_LoadingTXT.Position = UDim2.new(0, 330, 0, 0)
			local MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button = Instance.new("TextButton")
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Name = "MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button"
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.ZIndex = 5
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Size = UDim2.new(0, 160, 0, 26)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Position = UDim2.new(0, 456, 0, 4)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.BorderSizePixel = 0
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.BackgroundColor3 = loadconfig.Color.Foreground
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.AutoButtonColor = false
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.FontSize = Enum.FontSize.Size14
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.TextSize = 14
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.TextColor3 = loadconfig.Color.Background
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Text = "Join Discord Server"
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Font = Enum.Font.Gotham
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.Parent = MasterOogway6147KeyShadow_Window_TopBar
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.MouseButton1Click:Connect(function()
				if request then
					request({
						Url = 'http://127.0.0.1:6463/rpc?v=1',
						Method = 'POST',
						Headers = {
							['Content-Type'] = 'application/json',
							Origin = 'https://discord.com'
						},
						Body = game:GetService('HttpService'):JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = game:GetService('HttpService'):GenerateGUID(false),
						args = {code = loadconfig.Discord.InviteCode}
						})
					})
				elseif syn then
					syn.request({
						Url = 'http://127.0.0.1:6463/rpc?v=1',
						Method = 'POST',
						Headers = {
							['Content-Type'] = 'application/json',
							Origin = 'https://discord.com'
						},
						Body = game:GetService('HttpService'):JSONEncode({
						cmd = 'INVITE_BROWSER',
						nonce = game:GetService('HttpService'):GenerateGUID(false),
						args = {code = loadconfig.Discord.InviteCode}
						})
					})
				else
					print("Your executor does not support request() function and syn.request() function get a better executor")
				end
			end)

			local MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_ButtonUICorner = Instance.new("UICorner")
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_ButtonUICorner.Name = "MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_ButtonUICorner"
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_ButtonUICorner.CornerRadius = UDim.new(0, 3)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_ButtonUICorner.Parent = MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button

			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.MouseEnter:Connect(function()
				game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0.2}):Play()
			end)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.MouseLeave:Connect(function()
				game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			end)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.MouseButton1Down:Connect(function()
				game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0.5}):Play()
			end)
			MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button.MouseButton1Up:Connect(function()
				game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
			end)
			game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_CopyDiscord_Button, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0, BackgroundTransparency = 0}):Play()
		elseif loadconfig.Discord.Type == "Auto" then
			if request then
				request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = game:GetService('HttpService'):JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = game:GetService('HttpService'):GenerateGUID(false),
					args = {code = loadconfig.Discord.InviteCode}
					})
				})
			elseif syn then
				syn.request({
					Url = 'http://127.0.0.1:6463/rpc?v=1',
					Method = 'POST',
					Headers = {
						['Content-Type'] = 'application/json',
						Origin = 'https://discord.com'
					},
					Body = game:GetService('HttpService'):JSONEncode({
					cmd = 'INVITE_BROWSER',
					nonce = game:GetService('HttpService'):GenerateGUID(false),
					args = {code = loadconfig.Discord.InviteCode}
					})
				})
			else
				print("Your executor does not support request() function and syn.request() function get a better executor")
			end
		end
	end
	if (loadconfig.Discord.Join == false or loadconfig.Discord.Type == "Auto") then
		MasterOogway6147_Current_LoadingTXT.Position = UDim2.new(0, 500, 0, 0)
	end
    
    local KeyFrame_Frame = Instance.new("Frame")
    KeyFrame_Frame.Name = "KeyFrame_Frame"
    KeyFrame_Frame.ZIndex = 4
    KeyFrame_Frame.Size = UDim2.new(0, 638, 0, 34)
    KeyFrame_Frame.Position = UDim2.new(0, 6, 0, 42)
    KeyFrame_Frame.BorderSizePixel = 0
    KeyFrame_Frame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    KeyFrame_Frame.Parent = MasterOogway6147KeyShadow_Window
    
    local KeyFrame_FrameUICorner = Instance.new("UICorner")
    KeyFrame_FrameUICorner.Name = "KeyFrame_FrameUICorner"
    KeyFrame_FrameUICorner.CornerRadius = UDim.new(0, 4)
    KeyFrame_FrameUICorner.Parent = KeyFrame_Frame
    
    local KeyFrame_FrameUIStroke = Instance.new("UIStroke")
    KeyFrame_FrameUIStroke.Name = "KeyFrame_FrameUIStroke"
    KeyFrame_FrameUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    KeyFrame_FrameUIStroke.Thickness = 1.2
    KeyFrame_FrameUIStroke.Color = Color3.fromRGB(55, 55, 55)
    KeyFrame_FrameUIStroke.Parent = KeyFrame_Frame
    
    local KeyFrame_Frame_TextBox = Instance.new("TextBox")
    KeyFrame_Frame_TextBox.Name = "KeyFrame_Frame_TextBox"
    KeyFrame_Frame_TextBox.ZIndex = 5
    KeyFrame_Frame_TextBox.Size = UDim2.new(0, 628, 0, 34)
    KeyFrame_Frame_TextBox.BackgroundTransparency = 1
    KeyFrame_Frame_TextBox.Position = UDim2.new(0, 10, 0, 0)
    KeyFrame_Frame_TextBox.BorderSizePixel = 0
    KeyFrame_Frame_TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyFrame_Frame_TextBox.FontSize = Enum.FontSize.Size14
    KeyFrame_Frame_TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
    KeyFrame_Frame_TextBox.TextSize = 14
    KeyFrame_Frame_TextBox.TextColor3 = Color3.fromRGB(220, 220, 220)
    KeyFrame_Frame_TextBox.Text = ""
    KeyFrame_Frame_TextBox.PlaceholderText = "Key"
    KeyFrame_Frame_TextBox.CursorPosition = -1
    KeyFrame_Frame_TextBox.Font = Enum.Font.Gotham
    KeyFrame_Frame_TextBox.TextXAlignment = Enum.TextXAlignment.Left
    KeyFrame_Frame_TextBox.ClearTextOnFocus = false
    KeyFrame_Frame_TextBox.Parent = KeyFrame_Frame
    
    local KeyFrame_Frame_SubmitButton = Instance.new("TextButton")
    KeyFrame_Frame_SubmitButton.Name = "KeyFrame_Frame_SubmitButton"
    KeyFrame_Frame_SubmitButton.ZIndex = 4
    KeyFrame_Frame_SubmitButton.Size = UDim2.new(0, 80, 0, 34)
    KeyFrame_Frame_SubmitButton.Position = UDim2.new(0, 564, 0, 42)
    KeyFrame_Frame_SubmitButton.BorderSizePixel = 0
    KeyFrame_Frame_SubmitButton.BackgroundColor3 = loadconfig.Color.Foreground
    KeyFrame_Frame_SubmitButton.AutoButtonColor = false
    KeyFrame_Frame_SubmitButton.FontSize = Enum.FontSize.Size14
    KeyFrame_Frame_SubmitButton.TextSize = 14
    KeyFrame_Frame_SubmitButton.TextColor3 = loadconfig.Color.Background
    KeyFrame_Frame_SubmitButton.Text = "Submit"
    KeyFrame_Frame_SubmitButton.Font = Enum.Font.Gotham
    KeyFrame_Frame_SubmitButton.Parent = MasterOogway6147KeyShadow_Window
    
    local KeyFrame_Frame_SubmitButtonUICorner = Instance.new("UICorner")
    KeyFrame_Frame_SubmitButtonUICorner.Name = "KeyFrame_Frame_SubmitButtonUICorner"
    KeyFrame_Frame_SubmitButtonUICorner.CornerRadius = UDim.new(0, 3)
    KeyFrame_Frame_SubmitButtonUICorner.Parent = KeyFrame_Frame_SubmitButton
    
    local KeyFrame_Frame_Description_TXT = Instance.new("TextLabel")
    KeyFrame_Frame_Description_TXT.Name = "KeyFrame_Frame_Description_TXT"
    KeyFrame_Frame_Description_TXT.ZIndex = 5
    KeyFrame_Frame_Description_TXT.Size = UDim2.new(0, 632, 0, 48)
    KeyFrame_Frame_Description_TXT.BackgroundTransparency = 1
    KeyFrame_Frame_Description_TXT.Position = UDim2.new(0, 12, 0, 76)
    KeyFrame_Frame_Description_TXT.BorderSizePixel = 0
    KeyFrame_Frame_Description_TXT.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    KeyFrame_Frame_Description_TXT.FontSize = Enum.FontSize.Size14
    KeyFrame_Frame_Description_TXT.TextSize = 14
    KeyFrame_Frame_Description_TXT.TextColor3 = Color3.fromRGB(220, 220, 220)
    KeyFrame_Frame_Description_TXT.Text = loadconfig.Information
    KeyFrame_Frame_Description_TXT.TextWrapped = true
    KeyFrame_Frame_Description_TXT.Font = Enum.Font.Gotham
    KeyFrame_Frame_Description_TXT.TextWrap = true
    KeyFrame_Frame_Description_TXT.TextXAlignment = Enum.TextXAlignment.Center
    KeyFrame_Frame_Description_TXT.Parent = MasterOogway6147KeyShadow_Window

    KeyFrame_Frame_TextBox.Focused:Connect(function()
        game:GetService("TweenService"):Create(KeyFrame_FrameUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = loadconfig.Color.Foreground}):Play()
    end)
    KeyFrame_Frame_TextBox.FocusLost:Connect(function()
        game:GetService("TweenService"):Create(KeyFrame_FrameUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
    end)

    KeyFrame_Frame_SubmitButton.MouseButton1Click:Connect(function()
        if KeyFrame_Frame_TextBox.Text == Config.Key then
            game:GetService("TweenService"):Create(MasterOogway6147_Current_LoadingTXT, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            wait(0.5)
            game:GetService("TweenService"):Create(MasterOogway6147KeyShadow, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0.5, 0, 0.6, 0)}):Play()
            for i, v in pairs(MasterOogway6147KeyShadow.Parent:GetDescendants()) do
                if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
                elseif v:IsA("Frame") then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                elseif v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                elseif v:IsA("UIStroke") then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 1}):Play()
                end
            end
            wait(0.5)
            MasterOogway6147Key:Destroy()
            wait(1)
            guiloaded = true
        else
            --[[do nothing]]
        end

        KeyFrame_Frame_SubmitButton.MouseEnter:Connect(function()
            game:GetService("TweenService"):Create(KeyFrame_Frame_SubmitButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0.2}):Play()
        end)
        KeyFrame_Frame_SubmitButton.MouseLeave:Connect(function()
            game:GetService("TweenService"):Create(KeyFrame_Frame_SubmitButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
        end)
        KeyFrame_Frame_SubmitButton.MouseButton1Down:Connect(function()
            game:GetService("TweenService"):Create(KeyFrame_Frame_SubmitButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0.5}):Play()
        end)
        KeyFrame_Frame_SubmitButton.MouseButton1Up:Connect(function()
            game:GetService("TweenService"):Create(KeyFrame_Frame_SubmitButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
        end)
    end)

    for i, v in pairs(MasterOogway6147Key:GetDescendants()) do
        if v:IsA("ImageLabel") or v:IsA("ImageButton") then
            v.ImageTransparency = 1
        elseif v:IsA("Frame") then
            v.BackgroundTransparency = 1
        elseif v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
            v.BackgroundTransparency = 1
            v.TextTransparency = 1
        elseif v:IsA("UIStroke") then
            v.Transparency = 1
        end
    end
    
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0.5, 0, 0.5, 0), ImageTransparency = 0.4}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_Close_Button, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_Title, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_Beta_Title, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0, TextTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147KeyShadow_Window_TopBar_KeySystem_Title, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147_Current_LoadingTXT, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
    game:GetService("TweenService"):Create(KeyFrame_Frame, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
    game:GetService("TweenService"):Create(KeyFrame_Frame_TextBox, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
    game:GetService("TweenService"):Create(KeyFrame_Frame_SubmitButton, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0, BackgroundTransparency = 0}):Play()
    game:GetService("TweenService"):Create(KeyFrame_Frame_Description_TXT, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
    
    for i, v in pairs(MasterOogway6147Key:GetDescendants()) do
        if v:IsA("UIStroke") then
            game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
        end
    end
    
    task.spawn(function()
        local UserInputService = game:GetService("UserInputService")
        local runService = (game:GetService("RunService"));
    
        local gui = MasterOogway6147KeyShadow_Window_TopBar
        local guitodrag = MasterOogway6147KeyShadow
    
        local dragging
        local dragInput
        local dragStart
        local startPos
    
        function Lerp(a, b, m)
            return a + (b - a) * m
        end;
    
        local lastMousePos
        local lastGoalPos
        local DRAG_SPEED = (loadconfig.DragSpeed); -- // The speed of the UI darg.
        function Update(dt)
            if not (startPos) then return end;
            if not (dragging) and (lastGoalPos) then
                MasterOogway6147KeyShadow.Position = UDim2.new(startPos.X.Scale, Lerp(MasterOogway6147KeyShadow.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(MasterOogway6147KeyShadow.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
                return 
            end;
    
            local delta = (lastMousePos - UserInputService:GetMouseLocation())
            local xGoal = (startPos.X.Offset - delta.X);
            local yGoal = (startPos.Y.Offset - delta.Y);
            lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
            MasterOogway6147KeyShadow.Position = UDim2.new(startPos.X.Scale, Lerp(MasterOogway6147KeyShadow.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(MasterOogway6147KeyShadow.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
        end;
    
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = MasterOogway6147KeyShadow.Position
                lastMousePos = UserInputService:GetMouseLocation()
    
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
    
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
    
        runService.Heartbeat:Connect(Update)
    end)

    if loadconfig.KeySystem.Enabled == true then
        guicontinue = true
    end

    repeat wait() until guiloaded or guicontinue

    if guicontinue then
        if MasterOogway6147Key then
            MasterOogway6147Key:Destroy()
        end
    end

    local MasterOogway6147Beta = Instance.new("ScreenGui")
    MasterOogway6147Beta.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    MasterOogway6147Beta.ResetOnSpawn = false
    MasterOogway6147Beta.Parent = game:GetService("CoreGui")
    MasterOogway6147Beta.Name = rmdname(18)

    task.spawn(function()
        while task.wait(1) do
            if MasterOogway6147Beta then
                for i, v in pairs(MasterOogway6147Beta:GetDescendants()) do
                    v.Name = rmdname(math.random(10,20))
                end
            end
        end
    end)
    
    local MasterOogway6147BetaShadow = Instance.new("ImageLabel")
    MasterOogway6147BetaShadow.Name = "MasterOogway6147BetaShadow"
    MasterOogway6147BetaShadow.ZIndex = 2
    MasterOogway6147BetaShadow.AnchorPoint = Vector2.new(0.5, 0.5)
    MasterOogway6147BetaShadow.Size = UDim2.new(0, 666, 0, 460)
    MasterOogway6147BetaShadow.BackgroundTransparency = 1
    MasterOogway6147BetaShadow.Position = UDim2.new(0.5, 0, 0.6, 0)
    MasterOogway6147BetaShadow.BorderSizePixel = 0
    MasterOogway6147BetaShadow.ScaleType = Enum.ScaleType.Slice
    MasterOogway6147BetaShadow.ImageTransparency = 0
    MasterOogway6147BetaShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
    MasterOogway6147BetaShadow.TileSize = UDim2.new(1, 0, 2, 0)
    MasterOogway6147BetaShadow.Image = "rbxassetid://1316045217"
    MasterOogway6147BetaShadow.SliceCenter = Rect.new(50, 50, 50, 50)
    MasterOogway6147BetaShadow.Parent = MasterOogway6147Beta
    
    local MasterOogway6147Window = Instance.new("Frame")
    MasterOogway6147Window.Name = "MasterOogway6147Window"
    MasterOogway6147Window.ZIndex = 3
    MasterOogway6147Window.Visible = false
    MasterOogway6147Window.Size = UDim2.new(0, 654, 0, 450)
    MasterOogway6147Window.ClipsDescendants = true
    MasterOogway6147Window.Position = UDim2.new(0, 5, 0, 5)
    MasterOogway6147Window.BorderSizePixel = 0
    MasterOogway6147Window.BackgroundColor3 = loadconfig.Color.Background
    MasterOogway6147Window.Parent = MasterOogway6147BetaShadow
    
    local WindowUICorner = Instance.new("UICorner")
    WindowUICorner.Name = "WindowUICorner"
    WindowUICorner.CornerRadius = UDim.new(0, 3)
    WindowUICorner.Parent = MasterOogway6147Window
    
    local WindowUIStroke = Instance.new("UIStroke")
    WindowUIStroke.Name = "WindowUIStroke"
    WindowUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    WindowUIStroke.Thickness = 1.2
    WindowUIStroke.Color = Color3.fromRGB(100, 100, 100)
    WindowUIStroke.Parent = MasterOogway6147Window
    
    local PageContainer = Instance.new("Frame")
    PageContainer.Name = "PageContainer"
    PageContainer.ZIndex = 4
    PageContainer.Size = UDim2.new(0, 638, 0, 36)
    PageContainer.Position = UDim2.new(0, 8, 0, 42)
    PageContainer.BorderSizePixel = 0
    PageContainer.BackgroundColor3 = Color3.fromRGB(12, 12, 12)
    PageContainer.Parent = MasterOogway6147Window
    
    local PageContainerUICorner = Instance.new("UICorner")
    PageContainerUICorner.Name = "PageContainerUICorner"
    PageContainerUICorner.CornerRadius = UDim.new(0, 4)
    PageContainerUICorner.Parent = PageContainer
    
    local PageContainerUIStroke = Instance.new("UIStroke")
    PageContainerUIStroke.Name = "PageContainerUIStroke"
    PageContainerUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    PageContainerUIStroke.Thickness = 1.2
    PageContainerUIStroke.Color = Color3.fromRGB(55, 55, 55)
    PageContainerUIStroke.Parent = PageContainer
    
    local PageContainerInner = Instance.new("Frame")
    PageContainerInner.Name = "PageContainerInner"
    PageContainerInner.ZIndex = 4
    PageContainerInner.Size = UDim2.new(0, 1, 0, 34)
    PageContainerInner.BackgroundTransparency = 1
    PageContainerInner.Position = UDim2.new(0, 12, 0, 0)
    PageContainerInner.BorderSizePixel = 0
    PageContainerInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    PageContainerInner.Parent = PageContainer
    
    local PageContainerInnerUIListLayout = Instance.new("UIListLayout")
    PageContainerInnerUIListLayout.Name = "PageContainerInnerUIListLayout"
    PageContainerInnerUIListLayout.FillDirection = Enum.FillDirection.Horizontal
    PageContainerInnerUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
    PageContainerInnerUIListLayout.Parent = PageContainerInner
    
    local MasterOogway6147Window_Outline = Instance.new("Frame")
    MasterOogway6147Window_Outline.Name = "MasterOogway6147Window_Outline"
    MasterOogway6147Window_Outline.ZIndex = 4
    MasterOogway6147Window_Outline.Size = UDim2.new(0, 654, 0, 1)
    MasterOogway6147Window_Outline.Position = UDim2.new(0, 0, 0, 34)
    MasterOogway6147Window_Outline.BorderSizePixel = 0
    MasterOogway6147Window_Outline.BackgroundColor3 = loadconfig.Color.Foreground
    MasterOogway6147Window_Outline.Parent = MasterOogway6147Window
    
    local MasterOogway6147WindowTopBar = Instance.new("Frame")
    MasterOogway6147WindowTopBar.Name = "MasterOogway6147WindowTopBar"
    MasterOogway6147WindowTopBar.ZIndex = 4
    MasterOogway6147WindowTopBar.Size = UDim2.new(0, 654, 0, 34)
    MasterOogway6147WindowTopBar.BorderSizePixel = 0
    MasterOogway6147WindowTopBar.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
    MasterOogway6147WindowTopBar.Parent = MasterOogway6147Window
    
    local MasterOogway6147WindowTopBarUICorner = Instance.new("UICorner")
    MasterOogway6147WindowTopBarUICorner.Name = "MasterOogway6147WindowTopBarUICorner"
    MasterOogway6147WindowTopBarUICorner.CornerRadius = UDim.new(0, 6)
    MasterOogway6147WindowTopBarUICorner.Parent = MasterOogway6147WindowTopBar
    
    local MasterOogway6147WindowTopBar_MasterOogway6147TItle = Instance.new("TextLabel")
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Name = "MasterOogway6147WindowTopBar_MasterOogway6147TItle"
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.ZIndex = 5
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Size = UDim2.new(0, 80, 0, 25)
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.BackgroundTransparency = 1
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Position = UDim2.new(0, 7.5, 0, 5)
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.BorderSizePixel = 0
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.FontSize = Enum.FontSize.Size14
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.TextSize = 14
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.TextColor3 = Color3.fromRGB(220, 220, 220)
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.TextScaled = true
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Text = loadconfig.HubName
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Font = Enum.Font.Gotham
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.TextXAlignment = Enum.TextXAlignment.Left
    MasterOogway6147WindowTopBar_MasterOogway6147TItle.Parent = MasterOogway6147WindowTopBar
    
    local MasterOogway6147WindowTopBar_BetaTitle = Instance.new("TextLabel")
    MasterOogway6147WindowTopBar_BetaTitle.Name = "MasterOogway6147WindowTopBar_BetaTitle"
    MasterOogway6147WindowTopBar_BetaTitle.ZIndex = 5
    MasterOogway6147WindowTopBar_BetaTitle.Size = UDim2.new(0, 53, 0, 22)
    MasterOogway6147WindowTopBar_BetaTitle.Position = UDim2.new(0, 90, 0, 6)
    MasterOogway6147WindowTopBar_BetaTitle.BorderSizePixel = 0
    MasterOogway6147WindowTopBar_BetaTitle.BackgroundColor3 = loadconfig.Color.Foreground
    MasterOogway6147WindowTopBar_BetaTitle.FontSize = Enum.FontSize.Size14
    MasterOogway6147WindowTopBar_BetaTitle.TextSize = 14
    MasterOogway6147WindowTopBar_BetaTitle.TextColor3 = loadconfig.Color.Background
    MasterOogway6147WindowTopBar_BetaTitle.Text = "Beta"
    MasterOogway6147WindowTopBar_BetaTitle.Font = Enum.Font.Gotham
    MasterOogway6147WindowTopBar_BetaTitle.Parent = MasterOogway6147WindowTopBar
    
    local MasterOogway6147WindowTopBar_BetaTitleUICorner = Instance.new("UICorner")
    MasterOogway6147WindowTopBar_BetaTitleUICorner.Name = "MasterOogway6147WindowTopBar_BetaTitleUICorner"
    MasterOogway6147WindowTopBar_BetaTitleUICorner.CornerRadius = UDim.new(0, 4)
    MasterOogway6147WindowTopBar_BetaTitleUICorner.Parent = MasterOogway6147WindowTopBar_BetaTitle
    
    local MasterOogway6147WindowTopBar_Title = Instance.new("TextLabel")
    MasterOogway6147WindowTopBar_Title.Name = "MasterOogway6147WindowTopBar_Title"
    MasterOogway6147WindowTopBar_Title.ZIndex = 5
    MasterOogway6147WindowTopBar_Title.Size = UDim2.new(0, 202, 0, 35)
    MasterOogway6147WindowTopBar_Title.BackgroundTransparency = 1
    MasterOogway6147WindowTopBar_Title.Position = UDim2.new(0, 150, 0, 0)
    MasterOogway6147WindowTopBar_Title.BorderSizePixel = 0
    MasterOogway6147WindowTopBar_Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147WindowTopBar_Title.FontSize = Enum.FontSize.Size14
    MasterOogway6147WindowTopBar_Title.TextSize = 14
    MasterOogway6147WindowTopBar_Title.TextColor3 = loadconfig.Color.Foreground
    MasterOogway6147WindowTopBar_Title.Text = CurrentPlaceName
    MasterOogway6147WindowTopBar_Title.Font = Enum.Font.Gotham
    MasterOogway6147WindowTopBar_Title.TextXAlignment = Enum.TextXAlignment.Left
    MasterOogway6147WindowTopBar_Title.Parent = MasterOogway6147WindowTopBar

	local MasterOogway6147WindowTopBar_GameImage = Instance.new("ImageLabel")
    MasterOogway6147WindowTopBar_GameImage.Name = "MasterOogway6147WindowTopBar_GameImage"
    MasterOogway6147WindowTopBar_GameImage.ZIndex = 5
    MasterOogway6147WindowTopBar_GameImage.Size = UDim2.new(0, 27.5, 0, 27.5)
    MasterOogway6147WindowTopBar_GameImage.BackgroundTransparency = 1
    MasterOogway6147WindowTopBar_GameImage.Position = UDim2.new(0, 500, 0, 3.5)
    MasterOogway6147WindowTopBar_GameImage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	MasterOogway6147WindowTopBar_GameImage.BackgroundTransparency = 1
	MasterOogway6147WindowTopBar_GameImage.ImageTransparency = 0
    MasterOogway6147WindowTopBar_GameImage.Image = "rbxassetid://"..CurrentPlaceImageId
    MasterOogway6147WindowTopBar_GameImage.Parent = MasterOogway6147WindowTopBar
    
    local MasterOogway6147WindowTopBarCloseButton = Instance.new("ImageButton")
    MasterOogway6147WindowTopBarCloseButton.Name = "MasterOogway6147WindowTopBarCloseButton"
    MasterOogway6147WindowTopBarCloseButton.ZIndex = 5
    MasterOogway6147WindowTopBarCloseButton.Size = UDim2.new(0, 18, 0, 18)
    MasterOogway6147WindowTopBarCloseButton.BackgroundTransparency = 1
    MasterOogway6147WindowTopBarCloseButton.Position = UDim2.new(0, 626, 0, 8)
    MasterOogway6147WindowTopBarCloseButton.BorderSizePixel = 0
    MasterOogway6147WindowTopBarCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    MasterOogway6147WindowTopBarCloseButton.ImageColor3 = Color3.fromRGB(220, 220, 220)
    MasterOogway6147WindowTopBarCloseButton.Image = "http://www.roblox.com/asset/?id=6031094678"
    MasterOogway6147WindowTopBarCloseButton.Parent = MasterOogway6147WindowTopBar
    MasterOogway6147WindowTopBarCloseButton.MouseButton1Click:Connect(function()
        game:GetService("TweenService"):Create(MasterOogway6147BetaShadow, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0.5, 0, 0.6, 0)}):Play()
        for i, v in pairs(MasterOogway6147BetaShadow.Parent:GetDescendants()) do
            if v:IsA("ImageLabel") or v:IsA("ImageButton") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
            elseif v:IsA("Frame") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
            elseif v:IsA("TextBox") or v:IsA("TextLabel") or v:IsA("TextButton") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
            elseif v:IsA("UIStroke") then
                game:GetService("TweenService"):Create(v, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 1}):Play()
            end
        end
        wait(0.5)
        MasterOogway6147Beta:Destroy()
    end)
    
    local MasterOogway6147WindowTopBar_Version = Instance.new("TextLabel")
    MasterOogway6147WindowTopBar_Version.Name = "MasterOogway6147WindowTopBar_Version"
    MasterOogway6147WindowTopBar_Version.ZIndex = 5
    MasterOogway6147WindowTopBar_Version.Size = UDim2.new(0, 82, 0, 35)
    MasterOogway6147WindowTopBar_Version.BackgroundTransparency = 1
    MasterOogway6147WindowTopBar_Version.Position = UDim2.new(0, 536, 0, 0)
    MasterOogway6147WindowTopBar_Version.BorderSizePixel = 0
    MasterOogway6147WindowTopBar_Version.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    MasterOogway6147WindowTopBar_Version.FontSize = Enum.FontSize.Size14
    MasterOogway6147WindowTopBar_Version.TextSize = 14
    MasterOogway6147WindowTopBar_Version.TextColor3 = loadconfig.Color.Foreground
    MasterOogway6147WindowTopBar_Version.Text = loadconfig.Version or "Version 0"
    MasterOogway6147WindowTopBar_Version.Font = Enum.Font.Gotham
    MasterOogway6147WindowTopBar_Version.TextXAlignment = Enum.TextXAlignment.Right
    MasterOogway6147WindowTopBar_Version.Parent = MasterOogway6147WindowTopBar
    
    local ContainerHolder = Instance.new("Frame")
    ContainerHolder.Name = "ContainerHolder"
    ContainerHolder.ZIndex = 4
    ContainerHolder.Size = UDim2.new(0, 638, 0, 362)
    ContainerHolder.BackgroundTransparency = 1
    ContainerHolder.Position = UDim2.new(0, 6, 0, 88)
    ContainerHolder.BorderSizePixel = 0
    ContainerHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
    ContainerHolder.Parent = MasterOogway6147Window
    
    local StartingWindow = Instance.new("Frame")
    StartingWindow.Name = "StartingWindow"
    StartingWindow.ZIndex = 4
    StartingWindow.Size = UDim2.new(0, 654, 0, 450)
    StartingWindow.BackgroundTransparency = 1
    StartingWindow.Position = UDim2.new(0, 5, 0, 5)
    StartingWindow.BorderSizePixel = 0
    StartingWindow.BackgroundColor3 = loadconfig.Color.Background
    StartingWindow.Parent = MasterOogway6147BetaShadow
    
    local StartingWindowUICorner = Instance.new("UICorner")
    StartingWindowUICorner.Name = "StartingWindowUICorner"
    StartingWindowUICorner.CornerRadius = UDim.new(0, 2)
    StartingWindowUICorner.Parent = StartingWindow
    
    local StartingWindowUIStroke = Instance.new("UIStroke")
    StartingWindowUIStroke.Name = "StartingWindowUIStroke"
    StartingWindowUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    StartingWindowUIStroke.Transparency = 1
    StartingWindowUIStroke.Thickness = 1.2
    StartingWindowUIStroke.Color = Color3.fromRGB(100, 100, 100)
    StartingWindowUIStroke.Parent = StartingWindow
    
    local LoadingTweenFrame = Instance.new("Frame")
    LoadingTweenFrame.Name = "LoadingTweenFrame"
    LoadingTweenFrame.ZIndex = 5
    LoadingTweenFrame.Visible = false
    LoadingTweenFrame.Size = UDim2.new(0, 654, 0, 98)
    LoadingTweenFrame.Position = UDim2.new(0, 0, 0, 176)
    LoadingTweenFrame.BorderSizePixel = 0
    LoadingTweenFrame.BackgroundColor3 = loadconfig.Color.Background
    LoadingTweenFrame.Parent = StartingWindow
    
    local C_TweeningLoading = Instance.new("ImageLabel")
    C_TweeningLoading.Name = "C_TweeningLoading"
    C_TweeningLoading.ZIndex = 6
    C_TweeningLoading.Size = UDim2.new(0, 18, 0, 18)
    C_TweeningLoading.Position = UDim2.new(0, 318, 0, 40)
    C_TweeningLoading.BorderSizePixel = 0
    C_TweeningLoading.BackgroundColor3 = loadconfig.Color.Foreground
    C_TweeningLoading.ImageTransparency = loadconfig.Oogwaymode
    C_TweeningLoading.Image = "rbxassetid://12623269478"
    C_TweeningLoading.Parent = LoadingTweenFrame
    
    local C_TweeningLoadingUICorner = Instance.new("UICorner")
    C_TweeningLoadingUICorner.Name = "C_TweeningLoadingUICorner"
    C_TweeningLoadingUICorner.CornerRadius = UDim.new(0, 3)
    C_TweeningLoadingUICorner.Parent = C_TweeningLoading
    
    local B_TweeningLoading = Instance.new("ImageLabel")
    B_TweeningLoading.Name = "B_TweeningLoading"
    B_TweeningLoading.ZIndex = 6
    B_TweeningLoading.Size = UDim2.new(0, 18, 0, 18)
    B_TweeningLoading.Position = UDim2.new(0, 296, 0, 40)
    B_TweeningLoading.BorderSizePixel = 0
    B_TweeningLoading.BackgroundColor3 = loadconfig.Color.Foreground
    B_TweeningLoading.ImageTransparency = loadconfig.Oogwaymode
    B_TweeningLoading.Image = "rbxassetid://12623269478"
    B_TweeningLoading.Parent = LoadingTweenFrame
    
    local B_TweeningLoadingUICorner = Instance.new("UICorner")
    B_TweeningLoadingUICorner.Name = "B_TweeningLoadingUICorner"
    B_TweeningLoadingUICorner.CornerRadius = UDim.new(0, 3)
    B_TweeningLoadingUICorner.Parent = B_TweeningLoading
    
    local D_TweeningLoading = Instance.new("ImageLabel")
    D_TweeningLoading.Name = "D_TweeningLoading"
    D_TweeningLoading.ZIndex = 6
    D_TweeningLoading.Size = UDim2.new(0, 18, 0, 18)
    D_TweeningLoading.Position = UDim2.new(0, 340, 0, 40)
    D_TweeningLoading.BorderSizePixel = 0
    D_TweeningLoading.BackgroundColor3 = loadconfig.Color.Foreground
    D_TweeningLoading.ImageTransparency = loadconfig.Oogwaymode
    D_TweeningLoading.Image = "rbxassetid://12623269478"
    D_TweeningLoading.Parent = LoadingTweenFrame
    
    local D_TweeningLoadingUICorner = Instance.new("UICorner")
    D_TweeningLoadingUICorner.Name = "D_TweeningLoadingUICorner"
    D_TweeningLoadingUICorner.CornerRadius = UDim.new(0, 3)
    D_TweeningLoadingUICorner.Parent = D_TweeningLoading
    
    local A_TweeningLoading = Instance.new("ImageLabel")
    A_TweeningLoading.Name = "A_TweeningLoading"
    A_TweeningLoading.ZIndex = 6
    A_TweeningLoading.Size = UDim2.new(0, 18, 0, 18)
    A_TweeningLoading.Position = UDim2.new(0, 274, 0, 40)
    A_TweeningLoading.BorderSizePixel = 0
    A_TweeningLoading.BackgroundColor3 = loadconfig.Color.Foreground
    A_TweeningLoading.ImageTransparency = loadconfig.Oogwaymode
    A_TweeningLoading.Image = "rbxassetid://12623269478"
    A_TweeningLoading.Parent = LoadingTweenFrame
    
    local A_TweeningLoadingUICorner = Instance.new("UICorner")
    A_TweeningLoadingUICorner.Name = "A_TweeningLoadingUICorner"
    A_TweeningLoadingUICorner.CornerRadius = UDim.new(0, 3)
    A_TweeningLoadingUICorner.Parent = A_TweeningLoading
    
    local E_TweeningLoading = Instance.new("ImageLabel")
    E_TweeningLoading.Name = "E_TweeningLoading"
    E_TweeningLoading.ZIndex = 6
    E_TweeningLoading.Size = UDim2.new(0, 18, 0, 18)
    E_TweeningLoading.Position = UDim2.new(0, 362, 0, 40)
    E_TweeningLoading.BorderSizePixel = 0
    E_TweeningLoading.BackgroundColor3 = loadconfig.Color.Foreground
    E_TweeningLoading.ImageTransparency = loadconfig.Oogwaymode
    E_TweeningLoading.Image = "rbxassetid://12623269478"
    E_TweeningLoading.Parent = LoadingTweenFrame
    
    local E_TweeningLoadingUICorner = Instance.new("UICorner")
    E_TweeningLoadingUICorner.Name = "E_TweeningLoadingUICorner"
    E_TweeningLoadingUICorner.CornerRadius = UDim.new(0, 3)
    E_TweeningLoadingUICorner.Parent = E_TweeningLoading
    
    local LoadingTweenFrame_Front = Instance.new("Frame")
    LoadingTweenFrame_Front.Name = "LoadingTweenFrame_Front"
    LoadingTweenFrame_Front.ZIndex = 7
    LoadingTweenFrame_Front.Size = UDim2.new(0, 654, 0, 100)
    LoadingTweenFrame_Front.BorderSizePixel = 0
    LoadingTweenFrame_Front.BackgroundColor3 = loadconfig.Color.Background
    LoadingTweenFrame_Front.Parent = LoadingTweenFrame

    task.spawn(function()
        local UserInputService = game:GetService("UserInputService")
        local runService = (game:GetService("RunService"));
    
        local gui = MasterOogway6147WindowTopBar
        local guitodrag = MasterOogway6147BetaShadow
    
        local dragging
        local dragInput
        local dragStart
        local startPos
    
        function Lerp(a, b, m)
            return a + (b - a) * m
        end;
    
        local lastMousePos
        local lastGoalPos
        local DRAG_SPEED = (loadconfig.DragSpeed); -- // The speed of the UI darg.
        function Update(dt)
            if not (startPos) then return end;
            if not (dragging) and (lastGoalPos) then
                guitodrag.Position = UDim2.new(startPos.X.Scale, Lerp(guitodrag.Position.X.Offset, lastGoalPos.X.Offset, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(guitodrag.Position.Y.Offset, lastGoalPos.Y.Offset, dt * DRAG_SPEED))
                return 
            end;
    
            local delta = (lastMousePos - UserInputService:GetMouseLocation())
            local xGoal = (startPos.X.Offset - delta.X);
            local yGoal = (startPos.Y.Offset - delta.Y);
            lastGoalPos = UDim2.new(startPos.X.Scale, xGoal, startPos.Y.Scale, yGoal)
            guitodrag.Position = UDim2.new(startPos.X.Scale, Lerp(guitodrag.Position.X.Offset, xGoal, dt * DRAG_SPEED), startPos.Y.Scale, Lerp(guitodrag.Position.Y.Offset, yGoal, dt * DRAG_SPEED))
        end;
    
        gui.InputBegan:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
                dragging = true
                dragStart = input.Position
                startPos = guitodrag.Position
                lastMousePos = UserInputService:GetMouseLocation()
    
                input.Changed:Connect(function()
                    if input.UserInputState == Enum.UserInputState.End then
                        dragging = false
                    end
                end)
            end
        end)
    
        gui.InputChanged:Connect(function(input)
            if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
                dragInput = input
            end
        end)
    
        runService.Heartbeat:Connect(Update)
    end)
    
    task.spawn(function()
        while true do
            if StartingWindow then
            game:GetService("TweenService"):Create(A_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 272 + 2, 0, 20), Rotation = 45}):Play()
            game:GetService("TweenService"):Create(C_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 316 + 2, 0, 20), Rotation = 45}):Play()
            game:GetService("TweenService"):Create(E_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 360 + 2, 0, 20), Rotation = 45}):Play()
            game:GetService("TweenService"):Create(B_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 294 + 2, 0, 60), Rotation = -90}):Play()
            game:GetService("TweenService"):Create(D_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 338 + 2, 0, 60), Rotation = -90}):Play()
            wait(0.8)
            game:GetService("TweenService"):Create(A_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 272 + 2, 0, 60), Rotation = -90}):Play()
            game:GetService("TweenService"):Create(C_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 316 + 2, 0, 60), Rotation = -90}):Play()
            game:GetService("TweenService"):Create(E_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 360 + 2, 0, 60), Rotation = -90}):Play()
            game:GetService("TweenService"):Create(B_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 294 + 2, 0, 20), Rotation = 45}):Play()
            game:GetService("TweenService"):Create(D_TweeningLoading, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Position = UDim2.new(0, 338 + 2, 0, 20), Rotation = 45}):Play()
            wait(0.8)
            end
        end
    end)

    game:GetService("TweenService"):Create(MasterOogway6147BetaShadow, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.4, Position = UDim2.new(0.5, 0, 0.5, 0)}):Play()
    game:GetService("TweenService"):Create(MasterOogway6147BetaShadow.StartingWindow, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
    game:GetService("TweenService"):Create(StartingWindowUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
    wait(1.2)
    LoadingTweenFrame.Visible = true
    game:GetService("TweenService"):Create(LoadingTweenFrame_Front, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
    wait(3)
    MasterOogway6147Window.Visible = true
    wait(3)
    game:GetService("TweenService"):Create(LoadingTweenFrame_Front, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
    wait(0.8)
    if LoadingTweenFrame then
        A_TweeningLoading:Destroy()
        B_TweeningLoading:Destroy()
        C_TweeningLoading:Destroy()
        D_TweeningLoading:Destroy()
        E_TweeningLoading:Destroy()
    end

    wait(0.3)
    wait(0.2)
    LoadingTweenFrame:Destroy()
    wait(0.5)
    game:GetService("TweenService"):Create(StartingWindow, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
    game:GetService("TweenService"):Create(StartingWindowUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 1}):Play()
    wait(1)
    StartingWindow:Destroy()

    local Window = {}

    function Window:Toggle()
        MasterOogway6147Beta.Enabled = not MasterOogway6147Beta.Enabled
    end

    function Window:Container(containerconfig)
        local Container = Instance.new("ScrollingFrame")
        local ContainerLeft = Instance.new("Frame")
        local ContainerLeftUIListLayout = Instance.new("UIListLayout")
        local ContainerRight = Instance.new("Frame")
        local ContainerRightUIListLayout = Instance.new("UIListLayout")
        
        Container.Name = containerconfig.Title or "Container"
        Container.Parent = ContainerHolder
        Container.Active = true
        Container.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        Container.BackgroundTransparency = 1.000
        Container.BorderSizePixel = 0
        Container.Position = UDim2.new(0, -4, 0, -8)
        Container.Size = UDim2.new(0, 650, 0, 370)
        Container.ZIndex = 5
        Container.CanvasSize = UDim2.new(0, 0, 0, 0)
        Container.ScrollBarThickness = 0
        Container.Visible = false
        
        ContainerLeft.Name = "ContainerLeft"
        ContainerLeft.Parent = Container
        ContainerLeft.BackgroundColor3 = loadconfig.Color.Background
        ContainerLeft.BorderSizePixel = 0
        ContainerLeft.Position = UDim2.new(0, 6, 0, 6)
        ContainerLeft.Size = UDim2.new(0, 318, 0, 100)
        ContainerLeft.ZIndex = 6
        
        ContainerLeftUIListLayout.Name = "ContainerLeftUIListLayout"
        ContainerLeftUIListLayout.Parent = ContainerLeft
        ContainerLeftUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerLeftUIListLayout.Padding = UDim.new(0, 8)
        
        ContainerRight.Name = "ContainerRight"
        ContainerRight.Parent = Container
        ContainerRight.BackgroundColor3 = loadconfig.Color.Background
        ContainerRight.BorderSizePixel = 0
        ContainerRight.Position = UDim2.new(0, 328, 0, 6)
        ContainerRight.Size = UDim2.new(0, 318, 0, 100)
        ContainerRight.ZIndex = 6
        
        ContainerRightUIListLayout.Name = "ContainerRightUIListLayout"
        ContainerRightUIListLayout.Parent = ContainerRight
        ContainerRightUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
        ContainerRightUIListLayout.Padding = UDim.new(0, 8)
                
        ContainerLeftUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            local largestListSize = 0
        
            largestListSize = ContainerLeftUIListLayout.AbsoluteContentSize.Y + ContainerLeftUIListLayout.Padding.Offset
        
            if ContainerRightUIListLayout.AbsoluteContentSize.Y > largestListSize then
                largestListSize = ContainerRightUIListLayout.AbsoluteContentSize.Y + ContainerRightUIListLayout.Padding.Offset
            end
        
            Container.CanvasSize = UDim2.new(0, 0, 0, largestListSize + 6)
        end)
        
        ContainerRight.ContainerRightUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
            local largestListSize = 0
        
            largestListSize = ContainerLeftUIListLayout.AbsoluteContentSize.Y + ContainerLeftUIListLayout.Padding.Offset
        
            if ContainerRightUIListLayout.AbsoluteContentSize.Y > largestListSize then
                largestListSize = ContainerRightUIListLayout.AbsoluteContentSize.Y + ContainerRightUIListLayout.Padding.Offset
            end
        
            Container.CanvasSize = UDim2.new(0, 0, 0, largestListSize + 6)
        end)

        local PageButton = Instance.new("TextButton")

        PageButton.Name = containerconfig.Title or "PageButton"
        PageButton.Parent = PageContainerInner
        PageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
        PageButton.BackgroundTransparency = 1.000
        PageButton.BorderSizePixel = 0
        PageButton.ZIndex = 5
        PageButton.Font = Enum.Font.Gotham
        PageButton.Text = containerconfig.Title or "Page"
        PageButton.Size = UDim2.new(0, 49, 0, 34)
        PageButton.TextColor3 = Color3.fromRGB(220, 220, 220)
        PageButton.TextSize = 14.000
        PageButton.TextXAlignment = Enum.TextXAlignment.Left
        PageButton.TextTransparency = 1

        PageButton:GetPropertyChangedSignal("Text"):Connect(function() PageButton.Size = UDim2.new(0, PageButton.TextBounds.X + 10, 0, 34) end)
        if containerconfig.Open == true then
            game:GetService("TweenService"):Create(PageButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            Container.Visible = true
        else
            game:GetService("TweenService"):Create(PageButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.5}):Play()
            Container.Visible = false
        end
        

        PageButton.MouseButton1Click:Connect(function()
            for i, v in pairs(PageContainerInner:GetChildren()) do
                if v:IsA("TextButton") then
                    game:GetService("TweenService"):Create(v, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.5}):Play()
                end
            end
            for i, v in pairs(ContainerHolder:GetChildren()) do
                if v:IsA("ScrollingFrame") then
                    v.Visible = false
                end
            end
            game:GetService("TweenService"):Create(PageButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            Container.Visible = true
        end)

        PageButton.Size = UDim2.new(0, PageButton.TextBounds.X + 10, 0, 34)

        local Container = {}

        function Container:Button(buttonconfig)
            buttonconfig.Callback = buttonconfig.Callback or function() end
            local Button = Instance.new("TextButton")
            local ButtonUICorner = Instance.new("UICorner")
            
            Button.Name = buttonconfig.Title or "Button"
            Button.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            Button.BorderSizePixel = 0
            Button.Size = UDim2.new(0, 316, 0, 30)
            Button.ZIndex = 7
            Button.AutoButtonColor = false
            Button.Font = Enum.Font.Gotham
            Button.TextColor3 = Color3.fromRGB(220, 220, 220)
            Button.Text = buttonconfig.Title or "nil text"
            Button.TextSize = 14.000
            Button.TextTransparency = 1
            Button.BackgroundTransparency = 1

            if buttonconfig.Container == "Left" then
                Button.Parent = ContainerLeft
            elseif buttonconfig.Container == "Right" then
                Button.Parent = ContainerRight
            end
            
            ButtonUICorner.CornerRadius = UDim.new(0, 4)
            ButtonUICorner.Name = "ButtonUICorner"
            ButtonUICorner.Parent = Button

            local ButtonUIStroke = Instance.new("UIStroke")
            ButtonUIStroke.Name = "ButtonUIStroke"
            ButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ButtonUIStroke.Thickness = 1.2
            ButtonUIStroke.Color = Color3.fromRGB(55, 55, 55)
            ButtonUIStroke.Parent = Button
            ButtonUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(Button, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            game:GetService("TweenService"):Create(Button, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            game:GetService("TweenService"):Create(ButtonUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()

            Button.MouseButton1Click:Connect(function()
                pcall(function()
                    buttonconfig.Callback()
                end)
            end)
            Button.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(36,36,36)}):Play()
            end)
            Button.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
            end)
            Button.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = loadconfig.Color.Foreground}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = loadconfig.Color.Background}):Play()
            end)
            Button.MouseButton1Up:Connect(function()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                game:GetService("TweenService"):Create(Button, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = Color3.fromRGB(220, 220, 220)}):Play()
            end)

            local ButtonList = {}

            function ButtonList:ChangeText(newtext)
                task.spawn(function()
                    game:GetService("TweenService"):Create(Button, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                    wait(0.4)
                    Button.Text = tostring(newtext)
                    wait(0.1)
                    game:GetService("TweenService"):Create(Button, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
                end)
            end

            return ButtonList
        end

        function Container:Toggle(toggleconfig)
            toggleconfig.Callback = toggleconfig.Callback or function() end
            local ToggleButton = Instance.new("TextButton")
            local ToggleButtonUICorner = Instance.new("UICorner")
            local ToggleTitle = Instance.new("TextLabel")
            local ToggleImagelabelOut = Instance.new("ImageLabel")
            local ToggleImagelabelOutUICorner = Instance.new("UICorner")
            local ToggleImagelabelIn = Instance.new("ImageLabel")
            
            ToggleButton.Name = toggleconfig.Title or "ToggleButton"
            ToggleButton.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            ToggleButton.BorderSizePixel = 0
            ToggleButton.Size = UDim2.new(0, 316, 0, 30)
            ToggleButton.ZIndex = 7
            ToggleButton.AutoButtonColor = false
            ToggleButton.Font = Enum.Font.Gotham
            ToggleButton.Text = ""
            ToggleButton.TextColor3 = Color3.fromRGB(220, 220, 220)
            ToggleButton.TextSize = 14.000
            ToggleButton.BackgroundTransparency = 1

            if toggleconfig.Container == "Left" then
                ToggleButton.Parent = ContainerLeft
            elseif toggleconfig.Container == "Right" then
                ToggleButton.Parent = ContainerRight
            end

            local ToggleButtonUIStroke = Instance.new("UIStroke")
            ToggleButtonUIStroke.Name = "ToggleButtonUIStroke"
            ToggleButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ToggleButtonUIStroke.Thickness = 1.2
            ToggleButtonUIStroke.Color = Color3.fromRGB(55, 55, 55)
            ToggleButtonUIStroke.Parent = ToggleButton
            ToggleButtonUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            game:GetService("TweenService"):Create(ToggleButtonUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            ToggleButtonUICorner.CornerRadius = UDim.new(0, 4)
            ToggleButtonUICorner.Name = "ToggleButtonUICorner"
            ToggleButtonUICorner.Parent = ToggleButton
            
            ToggleTitle.Name = "ToggleTitle"
            ToggleTitle.Parent = ToggleButton
            ToggleTitle.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            ToggleTitle.BackgroundTransparency = 1.000
            ToggleTitle.BorderSizePixel = 0
            ToggleTitle.Position = UDim2.new(0, 10, 0, 0)
            ToggleTitle.Size = UDim2.new(0, 250, 0, 30)
            ToggleTitle.ZIndex = 8
            ToggleTitle.Font = Enum.Font.Gotham
            ToggleTitle.Text = toggleconfig.Title or "nil text"
            ToggleTitle.TextColor3 = toggleconfig.TextColor or Color3.fromRGB(220, 220, 220)
            ToggleTitle.TextSize = 14.000
            ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left
            ToggleTitle.TextTransparency = 1

            game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            ToggleImagelabelOut.Name = "ToggleImagelabelOut"
            ToggleImagelabelOut.Parent = ToggleButton
            ToggleImagelabelOut.BackgroundColor3 = loadconfig.Color.Foreground
            ToggleImagelabelOut.BackgroundTransparency = 1.000
            ToggleImagelabelOut.BorderSizePixel = 0
            ToggleImagelabelOut.Position = UDim2.new(0, 292, 0, 6)
            ToggleImagelabelOut.Size = UDim2.new(0, 18, 0, 18)
            ToggleImagelabelOut.ZIndex = 8
            ToggleImagelabelOut.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
            ToggleImagelabelOut.ImageTransparency = 1.000

            local ToggleImagelabelOutUIStroke = Instance.new("UIStroke")
            ToggleImagelabelOutUIStroke.Name = "ToggleImagelabelOutUIStroke"
            ToggleImagelabelOutUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            ToggleImagelabelOutUIStroke.Thickness = 1.2
            ToggleImagelabelOutUIStroke.Color = Color3.fromRGB(55, 55, 55)
            ToggleImagelabelOutUIStroke.Parent = ToggleImagelabelOut
            ToggleImagelabelOutUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(ToggleImagelabelOutUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            ToggleImagelabelOutUICorner.CornerRadius = UDim.new(0, 4)
            ToggleImagelabelOutUICorner.Name = "ToggleImagelabelOutUICorner"
            ToggleImagelabelOutUICorner.Parent = ToggleImagelabelOut
            
            ToggleImagelabelIn.Name = "ToggleImagelabelIn"
            ToggleImagelabelIn.Parent = ToggleImagelabelOut
            ToggleImagelabelIn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            ToggleImagelabelIn.BackgroundTransparency = 1.000
            ToggleImagelabelIn.BorderSizePixel = 0
            ToggleImagelabelIn.Position = UDim2.new(0, 2, 0, 2)
            ToggleImagelabelIn.Size = UDim2.new(0, 14, 0, 14)
            ToggleImagelabelIn.ZIndex = 8
            ToggleImagelabelIn.Image = "http://www.roblox.com/asset/?id=6031094667"
            ToggleImagelabelIn.ImageColor3 = loadconfig.Color.Background
            ToggleImagelabelIn.ImageTransparency = 1.000

            local toggled = false
            local function tog()
                if toggled then
                    toggled = false
                    game:GetService("TweenService"):Create(ToggleImagelabelOut, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                    game:GetService("TweenService"):Create(ToggleImagelabelIn, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
                    pcall(function()
                        toggleconfig.Callback(toggled)
                    end)
                else
                    toggled = true
                    game:GetService("TweenService"):Create(ToggleImagelabelOut, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                    game:GetService("TweenService"):Create(ToggleImagelabelIn, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
                    pcall(function()
                        toggleconfig.Callback(toggled)
                    end)
                end
            end
            if toggleconfig.Toggled == true then
                tog()
            end
            ToggleButton.MouseButton1Click:Connect(tog)
            ToggleButton.MouseEnter:Connect(function()
                game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(36,36,36)}):Play()
            end)
            ToggleButton.MouseLeave:Connect(function()
                game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                game:GetService("TweenService"):Create(ToggleImagelabelOutUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
                game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = toggleconfig.TextColor or Color3.fromRGB(220, 220, 220)}):Play()
            end)
            ToggleButton.MouseButton1Down:Connect(function()
                game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = loadconfig.Color.Foreground}):Play()
                game:GetService("TweenService"):Create(ToggleImagelabelOutUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = loadconfig.Color.Foreground}):Play()
                game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = loadconfig.Color.Background}):Play()
            end)
            ToggleButton.MouseButton1Up:Connect(function()
                game:GetService("TweenService"):Create(ToggleButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                game:GetService("TweenService"):Create(ToggleImagelabelOutUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
                game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = toggleconfig.TextColor or Color3.fromRGB(220, 220, 220)}):Play()
            end)

            local ToggleList = {}

            function ToggleList:ChangeTextColor(newcolor)
                task.spawn(function()
                    game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = newcolor or Color3.fromRGB(220, 220, 220)}):Play()
                end)
            end

            function ToggleList:ChangeText(newtext)
                task.spawn(function()
                    game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                    wait(0.4)
                    ToggleTitle.Text = tostring(newtext)
                    wait(0.1)
                    game:GetService("TweenService"):Create(ToggleTitle, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
                end)
            end

            function ToggleList:CurrentValue()
                return toggled
            end

            function ToggleList:ChangeValue(newvalue)
                task.spawn(function()
                    if newvalue == false then
                        toggled = false
                        game:GetService("TweenService"):Create(ToggleImagelabelOut, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 1}):Play()
                        game:GetService("TweenService"):Create(ToggleImagelabelIn, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 1}):Play()
                        pcall(function()
                            toggleconfig.Callback(toggled)
                        end)
                    else
                        toggled = true
                        game:GetService("TweenService"):Create(ToggleImagelabelOut, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
                        game:GetService("TweenService"):Create(ToggleImagelabelIn, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
                        pcall(function()
                            toggleconfig.Callback(toggled)
                        end)
                    end
                end)
            end

            return ToggleList
        end

        function Container:Outline(outlineconfig)
            local Outline = Instance.new("TextButton")
            Outline.Name = "Outline"
            Outline.ZIndex = 7
            Outline.Size = UDim2.new(0, 316, 0, 2)
            Outline.BorderSizePixel = 0
            Outline.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            Outline.AutoButtonColor = false
            Outline.FontSize = Enum.FontSize.Size14
            Outline.TextSize = 14
            Outline.TextColor3 = Color3.fromRGB(220, 220, 220)
            Outline.Text = ""
            Outline.Font = Enum.Font.Gotham
            Outline.BackgroundTransparency = 1

            if outlineconfig.Container == "Left" then
                Outline.Parent = ContainerLeft
            elseif outlineconfig.Container == "Right" then
                Outline.Parent = ContainerRight
            end
            
            local OutlineUICorner = Instance.new("UICorner")
            OutlineUICorner.Name = "OutlineUICorner"
            OutlineUICorner.CornerRadius = UDim.new(0, 4)
            OutlineUICorner.Parent = Outline
            
            local OutlineUIStroke = Instance.new("UIStroke")
            OutlineUIStroke.Name = "OutlineUIStroke"
            OutlineUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            OutlineUIStroke.Thickness = 1.2
            OutlineUIStroke.Color = Color3.fromRGB(55, 55, 55)
            OutlineUIStroke.Parent = Outline           
            OutlineUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(Outline, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            game:GetService("TweenService"):Create(OutlineUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
        end

        function Container:TextBox(textboxconfig)
            textboxconfig.Callback = textboxconfig.Callback or function() end
            local TextBoxFrame = Instance.new("TextButton")
            local TextBoxFrameUICorner = Instance.new("UICorner")
            local TextBoxFrame_Title = Instance.new("TextLabel")
            local TextBoxFrameImageLabel = Instance.new("ImageLabel")
            local TextBoxFrame_TextBox = Instance.new("TextBox")
            
            TextBoxFrame.Name = textboxconfig.Title or "TextBoxFrame"
            TextBoxFrame.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            TextBoxFrame.BorderSizePixel = 0
            TextBoxFrame.Position = UDim2.new(0, 0, 1.53999996, 0)
            TextBoxFrame.Size = UDim2.new(0, 316, 0, 46)
            TextBoxFrame.ZIndex = 7
            TextBoxFrame.AutoButtonColor = false
            TextBoxFrame.Font = Enum.Font.Gotham
            TextBoxFrame.Text = ""
            TextBoxFrame.TextColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxFrame.TextSize = 14.000
            TextBoxFrame.BackgroundTransparency = 1

            game:GetService("TweenService"):Create(TextBoxFrame, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()

            if textboxconfig.Container == "Left" then
                TextBoxFrame.Parent = ContainerLeft
            elseif textboxconfig.Container == "Right" then
                TextBoxFrame.Parent = ContainerRight
            end

            local TextBoxFrameUIStroke = Instance.new("UIStroke")
            TextBoxFrameUIStroke.Name = "TextBoxFrameUIStroke"
            TextBoxFrameUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            TextBoxFrameUIStroke.Thickness = 1.2
            TextBoxFrameUIStroke.Color = Color3.fromRGB(55, 55, 55)
            TextBoxFrameUIStroke.Parent = TextBoxFrame
            TextBoxFrameUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(TextBoxFrameUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            TextBoxFrameUICorner.CornerRadius = UDim.new(0, 4)
            TextBoxFrameUICorner.Name = "TextBoxFrameUICorner"
            TextBoxFrameUICorner.Parent = TextBoxFrame
            
            TextBoxFrame_Title.Name = "TextBoxFrame_Title"
            TextBoxFrame_Title.Parent = TextBoxFrame
            TextBoxFrame_Title.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            TextBoxFrame_Title.BackgroundTransparency = 1.000
            TextBoxFrame_Title.BorderSizePixel = 0
            TextBoxFrame_Title.Position = UDim2.new(0, 10, 0, 8)
            TextBoxFrame_Title.Size = UDim2.new(0, 250, 0, 14)
            TextBoxFrame_Title.ZIndex = 8
            TextBoxFrame_Title.Font = Enum.Font.Gotham
            TextBoxFrame_Title.Text = textboxconfig.Title or "nil text"
            TextBoxFrame_Title.TextColor3 = Color3.fromRGB(220, 220, 220)
            TextBoxFrame_Title.TextSize = 14.000
            TextBoxFrame_Title.TextXAlignment = Enum.TextXAlignment.Left
            TextBoxFrame_Title.TextTransparency = 1

            game:GetService("TweenService"):Create(TextBoxFrame_Title, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            TextBoxFrameImageLabel.Name = "TextBoxFrameImageLabel"
            TextBoxFrameImageLabel.Parent = TextBoxFrame
            TextBoxFrameImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxFrameImageLabel.BackgroundTransparency = 1.000
            TextBoxFrameImageLabel.BorderSizePixel = 0
            TextBoxFrameImageLabel.Position = UDim2.new(0, 286, 0, 14)
            TextBoxFrameImageLabel.Size = UDim2.new(0, 18, 0, 18)
            TextBoxFrameImageLabel.ZIndex = 8
            TextBoxFrameImageLabel.Image = "http://www.roblox.com/asset/?id=6034934040"
            TextBoxFrameImageLabel.ImageColor3 = Color3.fromRGB(220, 220, 220)
            TextBoxFrameImageLabel.ImageTransparency = 1

            game:GetService("TweenService"):Create(TextBoxFrameImageLabel, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.500}):Play()
            
            TextBoxFrame_TextBox.Name = "TextBoxFrame_TextBox"
            TextBoxFrame_TextBox.Parent = TextBoxFrame
            TextBoxFrame_TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            TextBoxFrame_TextBox.BackgroundTransparency = 1.000
            TextBoxFrame_TextBox.BorderSizePixel = 0
            TextBoxFrame_TextBox.Position = UDim2.new(0.03164557, 0, 0, 0)
            TextBoxFrame_TextBox.Size = UDim2.new(0, 306, 0, 46)
            TextBoxFrame_TextBox.ZIndex = 10
            TextBoxFrame_TextBox.Font = Enum.Font.Gotham
            TextBoxFrame_TextBox.LineHeight = 1.500
            TextBoxFrame_TextBox.PlaceholderColor3 = Color3.fromRGB(150, 150, 150)
            TextBoxFrame_TextBox.PlaceholderText = textboxconfig.PlaceholderText or "nil text"
            TextBoxFrame_TextBox.Text = ""
            TextBoxFrame_TextBox.TextColor3 = Color3.fromRGB(220, 220, 220)
            TextBoxFrame_TextBox.TextSize = 14.000
            TextBoxFrame_TextBox.TextTransparency = 0.500
            TextBoxFrame_TextBox.TextXAlignment = Enum.TextXAlignment.Left
            TextBoxFrame_TextBox.TextYAlignment = Enum.TextYAlignment.Bottom
            TextBoxFrame_TextBox.ClearTextOnFocus = false
            TextBoxFrame_TextBox.TextTransparency = 1

            game:GetService("TweenService"):Create(TextBoxFrame_TextBox, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.500}):Play()

            TextBoxFrame_TextBox.Focused:Connect(function()
                game:GetService("TweenService"):Create(TextBoxFrameUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = loadconfig.Color.Foreground}):Play()
            end)
            TextBoxFrame_TextBox.FocusLost:Connect(function()
                game:GetService("TweenService"):Create(TextBoxFrameUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
                pcall(function()
                    textboxconfig.Callback(TextBoxFrame_TextBox.Text)
                end)
            end)

            local TextBoxList = {}

            function TextBoxList:ChangeText(newtext)
                task.spawn(function()
                    game:GetService("TweenService"):Create(TextBoxFrame_Title, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                    wait(0.4)
                    TextBoxFrame_Title.Text = tostring(newtext)
                    wait(0.1)
                    game:GetService("TweenService"):Create(TextBoxFrame_Title, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
                end)
            end

            function TextBoxList:ChangeValue(newvalue, valueconfig)
                game:GetService("TweenService"):Create(TextBoxFrame_TextBox, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                wait(0.4)
                TextBoxFrame_TextBox.Text = newvalue
                wait(0.1)
                game:GetService("TweenService"):Create(TextBoxFrame_TextBox, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.5}):Play()
                if valueconfig.RecallFunction then
                    pcall(function()
                        textboxconfig.Callback(TextBoxFrame_TextBox.Text)
                    end)
                end
            end

            function TextBoxList:GetText()
                return TextBoxFrame_TextBox.Text
            end

            return TextBoxList
            
        end

        function Container:Label(labelconfig)
            local Label = Instance.new("TextButton")
            Label.Name = labelconfig.Title or "Label"
            Label.ZIndex = 7
            Label.Size = UDim2.new(0, 316, 0, 26)
            Label.BorderSizePixel = 0
            Label.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            Label.AutoButtonColor = false
            Label.FontSize = Enum.FontSize.Size14
            Label.TextSize = 14
            Label.TextColor3 = Color3.fromRGB(220, 220, 220)
            Label.Text = ""
            Label.Font = Enum.Font.Gotham
            Label.BackgroundTransparency = 1
            game:GetService("TweenService"):Create(Label, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()

            if labelconfig.Container == "Left" then
                Label.Parent = ContainerLeft
            elseif labelconfig.Container == "Right" then
                Label.Parent = ContainerRight
            end
            
            local LabelUICorner = Instance.new("UICorner")
            LabelUICorner.Name = "LabelUICorner"
            LabelUICorner.CornerRadius = UDim.new(0, 4)
            LabelUICorner.Parent = Label
            
            local LabelTextLabel = Instance.new("TextLabel")
            LabelTextLabel.Name = "LabelTextLabel"
            LabelTextLabel.ZIndex = 8
            LabelTextLabel.AutomaticSize = Enum.AutomaticSize.Y
            LabelTextLabel.Size = UDim2.new(0, 308, 0, 26)
            LabelTextLabel.BackgroundTransparency = 1
            LabelTextLabel.Position = UDim2.new(0, 10, 0, 0)
            LabelTextLabel.BorderSizePixel = 0
            LabelTextLabel.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            LabelTextLabel.FontSize = Enum.FontSize.Size14
            LabelTextLabel.TextSize = 14
            LabelTextLabel.TextColor3 = labelconfig.Color or Color3.fromRGB(220, 220, 220)
            LabelTextLabel.Text = labelconfig.Title or "nil text"
            LabelTextLabel.TextWrapped = true
            LabelTextLabel.Font = Enum.Font.Gotham
            LabelTextLabel.TextWrap = true
            LabelTextLabel.TextXAlignment = Enum.TextXAlignment.Left
            LabelTextLabel.Parent = Label
            game:GetService("TweenService"):Create(LabelTextLabel, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            local LabelUIStroke = Instance.new("UIStroke")
            LabelUIStroke.Name = "LabelUIStroke"
            LabelUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            LabelUIStroke.Thickness = 1.2
            LabelUIStroke.Color = Color3.fromRGB(55, 55, 55)
            LabelUIStroke.Parent = Label
            LabelUIStroke.Transparency = 1
            game:GetService("TweenService"):Create(LabelUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            Label.Size = UDim2.new(0, 316, 0, LabelTextLabel.TextBounds.Y + 14)
            Label:GetPropertyChangedSignal("Text"):Connect(function() LabelTextLabel.Size = UDim2.new(0, 308, 0, LabelTextLabel.TextBounds.Y + 14) end)
            LabelTextLabel.Size = UDim2.new(0, 308, 0, LabelTextLabel.TextBounds.Y + 14)
            LabelTextLabel:GetPropertyChangedSignal("Text"):Connect(function() LabelTextLabel.Size = UDim2.new(0, 308, 0, LabelTextLabel.TextBounds.Y + 14) end)

            local LabelList = {}

            function LabelList:ChangeColor(newcolor)
                newcolor = newcolor or Color.fromRGB(220, 220, 220)
                game:GetService("TweenService"):Create(LabelTextLabel, TweenInfo.new(0.5,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextColor3 = newcolor}):Play()
            end

            function LabelList:ChangeValue(newvalue, valueconfig)
                if valueconfig.Animation == true then
                    game:GetService("TweenService"):Create(LabelTextLabel, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                    wait(0.4)
                    LabelTextLabel.Text = newvalue
                    wait(0.1)
                    game:GetService("TweenService"):Create(LabelTextLabel, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
                else
                    LabelTextLabel.Text = newvalue
                end
            end

            function LabelList:GetText()
                return LabelTextLabel.Text
            end

            return LabelList
        end

        function Container:Keybind(keybindconfig)
            keybindconfig.Callback = keybindconfig.Callback or function() end
            keybindconfig.Key = keybindconfig.Key or nil
            local KeybindButton = Instance.new("TextButton")
            local KeybindButtonUICorner = Instance.new("UICorner")
            local KeybindButtonTitle = Instance.new("TextLabel")
            local KeybindButtonImagelabel = Instance.new("ImageLabel")
            local KeybindButton_Current_Key = Instance.new("TextLabel")
            
            KeybindButton.Name = keybindconfig.Title or "KeybindButton"
            KeybindButton.Parent = ContainerLeft
            KeybindButton.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            KeybindButton.BorderSizePixel = 0
            KeybindButton.Position = UDim2.new(0, 0, 2.77999997, 0)
            KeybindButton.Size = UDim2.new(0, 316, 0, 46)
            KeybindButton.ZIndex = 7
            KeybindButton.AutoButtonColor = false
            KeybindButton.Font = Enum.Font.Gotham
            KeybindButton.Text = ""
            KeybindButton.TextColor3 = Color3.fromRGB(220, 220, 220)
            KeybindButton.TextSize = 14.000
            KeybindButton.Transparency = 1

            game:GetService("TweenService"):Create(KeybindButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            
            if keybindconfig.Container == "Left" then
                KeybindButton.Parent = ContainerLeft
            elseif keybindconfig.Container == "Right" then
                KeybindButton.Parent = ContainerRight
            end
            
            KeybindButtonUICorner.CornerRadius = UDim.new(0, 4)
            KeybindButtonUICorner.Name = "KeybindButtonUICorner"
            KeybindButtonUICorner.Parent = KeybindButton
            
            KeybindButtonTitle.Name = "KeybindButtonTitle"
            KeybindButtonTitle.Parent = KeybindButton
            KeybindButtonTitle.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            KeybindButtonTitle.BackgroundTransparency = 1.000
            KeybindButtonTitle.BorderSizePixel = 0
            KeybindButtonTitle.Position = UDim2.new(0, 10, 0, 0)
            KeybindButtonTitle.Size = UDim2.new(0, 250, 0, 30)
            KeybindButtonTitle.ZIndex = 8
            KeybindButtonTitle.Font = Enum.Font.Gotham
            KeybindButtonTitle.Text = keybindconfig.Title or "nil text"
            KeybindButtonTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
            KeybindButtonTitle.TextSize = 14.000
            KeybindButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
            KeybindButtonTitle.TextTransparency = 1

            game:GetService("TweenService"):Create(KeybindButtonTitle, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            KeybindButtonImagelabel.Name = "KeybindButtonImagelabel"
            KeybindButtonImagelabel.Parent = KeybindButton
            KeybindButtonImagelabel.BackgroundColor3 = Color3.fromRGB(211, 166, 166)
            KeybindButtonImagelabel.BackgroundTransparency = 1.000
            KeybindButtonImagelabel.BorderSizePixel = 0
            KeybindButtonImagelabel.Position = UDim2.new(0, 284, 0, 12)
            KeybindButtonImagelabel.Size = UDim2.new(0, 22, 0, 22)
            KeybindButtonImagelabel.ZIndex = 8
            KeybindButtonImagelabel.Image = "http://www.roblox.com/asset/?id=6034818398"
            KeybindButtonImagelabel.ImageColor3 = Color3.fromRGB(220, 220, 220)
            KeybindButtonImagelabel.ImageTransparency = 0.500

            game:GetService("TweenService"):Create(KeybindButtonImagelabel, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0.500}):Play()
            
            KeybindButton_Current_Key.Name = "KeybindButton_Current_Key"
            KeybindButton_Current_Key.Parent = KeybindButton
            KeybindButton_Current_Key.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            KeybindButton_Current_Key.BackgroundTransparency = 1.000
            KeybindButton_Current_Key.BorderSizePixel = 0
            KeybindButton_Current_Key.Position = UDim2.new(0, 10, 0, 16)
            KeybindButton_Current_Key.Size = UDim2.new(0, 250, 0, 30)
            KeybindButton_Current_Key.ZIndex = 8
            KeybindButton_Current_Key.Font = Enum.Font.Gotham
            KeybindButton_Current_Key.Text = "nil"
            KeybindButton_Current_Key.TextColor3 = Color3.fromRGB(220, 220, 220)
            KeybindButton_Current_Key.TextSize = 14.000
            KeybindButton_Current_Key.TextTransparency = 1
            KeybindButton_Current_Key.TextXAlignment = Enum.TextXAlignment.Left

            game:GetService("TweenService"):Create(KeybindButton_Current_Key, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0.500}):Play()

            local KeybindButtonUIStroke = Instance.new("UIStroke")
            KeybindButtonUIStroke.Name = "KeybindButtonUIStroke"
            KeybindButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            KeybindButtonUIStroke.Thickness = 1.2
            KeybindButtonUIStroke.Color = Color3.fromRGB(55, 55, 55)
            KeybindButtonUIStroke.Transparency = 1
            
            KeybindButtonUIStroke.Parent = KeybindButton

            local nilkeybind = false

            game:GetService("TweenService"):Create(KeybindButtonUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            if keybindconfig.Key == nil then
                local Key = nil
                KeybindButton_Current_Key.Text = "None"
                local nilkeybind = true
            else
                local Key = keybindconfig.Key.Name
                KeybindButton_Current_Key.Text = Key
                local nilkeybind = false
            end
            local changingkeybind = false
            KeybindButton.MouseButton1Click:connect(
                function(e)
                    changingkeybind = true
                    game:GetService("TweenService"):Create(KeybindButtonUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = loadconfig.Color.Foreground}):Play()
                    KeybindButton_Current_Key.Text = "..."
                    local a, b = game:GetService("UserInputService").InputBegan:wait()
                    if a.KeyCode.Name ~= "Unknown" then
                        KeybindButton_Current_Key.Text = a.KeyCode.Name
                        Key = a.KeyCode.Name
                    end
                end
            )
            
            
            task.spawn(function()
                game:GetService("UserInputService").InputBegan:connect(function(current, pressed)
                    if not pressed then
                            if current.KeyCode.Name == KeybindButton_Current_Key.Text then
                                if changingkeybind == false then
                                    game:GetService("TweenService"):Create(KeybindButtonUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
                                    pcall(function()
                                        keybindconfig.Callback()
                                    end)
                                elseif changingkeybind == true then
                                    game:GetService("TweenService"):Create(KeybindButtonUIStroke, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Color = Color3.fromRGB(55, 55, 55)}):Play()
                                    changingkeybind = false
                                end
                            end
                    end
                end)
            end)

            local KeybindList = {}

            function KeybindList:ChangeKey(newkey)
                Key = newkey.Name
                KeybindButton_Current_Key.Text = Key
            end

            function KeybindList:ChangeValue(newvalue)
                game:GetService("TweenService"):Create(KeybindButtonTitle, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                wait(0.4)
                KeybindButtonTitle.Text = newvalue
                wait(0.1)
                game:GetService("TweenService"):Create(KeybindButtonTitle, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            end

            return KeybindList
        end

        function Container:Slider(sliderconfig)
            sliderconfig.Callback = sliderconfig.Callback or function() end
            local SliderButton = Instance.new("TextButton")
            SliderButton.Name = sliderconfig.Title or "SliderButton"
            SliderButton.ZIndex = 7
            SliderButton.Size = UDim2.new(0, 316, 0, 40)
            SliderButton.Position = UDim2.new(0, 0, 3.1199999, 0)
            SliderButton.BorderSizePixel = 0
            SliderButton.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            SliderButton.AutoButtonColor = false
            SliderButton.FontSize = Enum.FontSize.Size14
            SliderButton.TextSize = 14
            SliderButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton.Text = ""
            SliderButton.Font = Enum.Font.Gotham
            SliderButton.BackgroundTransparency = 1

            if sliderconfig.Container == "Left" then
                SliderButton.Parent = ContainerLeft
            elseif sliderconfig.Container == "Right" then
                SliderButton.Parent = ContainerRight
            end
            
            local SliderButtonUICorner = Instance.new("UICorner")
            SliderButtonUICorner.Name = "SliderButtonUICorner"
            SliderButtonUICorner.CornerRadius = UDim.new(0, 4)
            SliderButtonUICorner.Parent = SliderButton

            game:GetService("TweenService"):Create(SliderButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            
            local SliderButtonUIStroke = Instance.new("UIStroke")
            SliderButtonUIStroke.Name = "SliderButtonUIStroke"
            SliderButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            SliderButtonUIStroke.Thickness = 1.2
            SliderButtonUIStroke.Color = Color3.fromRGB(55, 55, 55)
            SliderButtonUIStroke.Parent = SliderButton
            SliderButtonUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(SliderButtonUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            local SliderButtonTitle = Instance.new("TextLabel")
            SliderButtonTitle.Name = "SliderButtonTitle"
            SliderButtonTitle.ZIndex = 8
            SliderButtonTitle.Size = UDim2.new(0, 250, 0, 14)
            SliderButtonTitle.BackgroundTransparency = 1
            SliderButtonTitle.Position = UDim2.new(0, 10, 0, 8)
            SliderButtonTitle.BorderSizePixel = 0
            SliderButtonTitle.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            SliderButtonTitle.FontSize = Enum.FontSize.Size14
            SliderButtonTitle.TextSize = 14
            SliderButtonTitle.TextColor3 = Color3.fromRGB(220, 220, 220)
            SliderButtonTitle.Text = sliderconfig.Title or "nil text"
            SliderButtonTitle.Font = Enum.Font.Gotham
            SliderButtonTitle.TextXAlignment = Enum.TextXAlignment.Left
            SliderButtonTitle.Parent = SliderButton
            SliderButtonTitle.TextTransparency = 1

            game:GetService("TweenService"):Create(SliderButtonTitle, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            local SliderButton_Frame = Instance.new("Frame")
            SliderButton_Frame.Name = "SliderButton_Frame"
            SliderButton_Frame.ZIndex = 8
            SliderButton_Frame.Size = UDim2.new(0, 296, 0, 4)
            SliderButton_Frame.BackgroundTransparency = 1
            SliderButton_Frame.Position = UDim2.new(0, 10, 0, 28)
            SliderButton_Frame.BorderSizePixel = 0
            SliderButton_Frame.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
            SliderButton_Frame.Parent = SliderButton
            SliderButton_Frame.BackgroundTransparency = 1

            game:GetService("TweenService"):Create(SliderButton_Frame, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            
            local SliderButton_FrameUICorner = Instance.new("UICorner")
            SliderButton_FrameUICorner.Name = "SliderButton_FrameUICorner"
            SliderButton_FrameUICorner.CornerRadius = UDim.new(0, 2)
            SliderButton_FrameUICorner.Parent = SliderButton_Frame
            
            local SliderButton_FrameUIStroke = Instance.new("UIStroke")
            SliderButton_FrameUIStroke.Name = "SliderButton_FrameUIStroke"
            SliderButton_FrameUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            SliderButton_FrameUIStroke.Thickness = 1.2
            SliderButton_FrameUIStroke.Color = Color3.fromRGB(55, 55, 55)
            SliderButton_FrameUIStroke.Parent = SliderButton_Frame
            SliderButton_FrameUIStroke.Transparency = 1

            game:GetService("TweenService"):Create(SliderButton_FrameUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()
            
            local SliderButton_FrameInnerFrame = Instance.new("Frame")
            SliderButton_FrameInnerFrame.Name = "SliderButton_FrameInnerFrame"
            SliderButton_FrameInnerFrame.ZIndex = 9
            SliderButton_FrameInnerFrame.Size = UDim2.new(0, 0, 0, 4)
            SliderButton_FrameInnerFrame.BackgroundColor3 = loadconfig.Color.Foreground
            SliderButton_FrameInnerFrame.Parent = SliderButton_Frame
            
            local SliderButton_FrameInnerFrameUICorner = Instance.new("UICorner")
            SliderButton_FrameInnerFrameUICorner.Name = "SliderButton_FrameInnerFrameUICorner"
            SliderButton_FrameInnerFrameUICorner.CornerRadius = UDim.new(0, 2)
            SliderButton_FrameInnerFrameUICorner.Parent = SliderButton_FrameInnerFrame
            
            local SliderButton_Frame_InnerButton = Instance.new("TextButton")
            SliderButton_Frame_InnerButton.Name = "SliderButton_Frame_InnerButton"
            SliderButton_Frame_InnerButton.ZIndex = 10
            SliderButton_Frame_InnerButton.Size = UDim2.new(0, 296, 0, 4)
            SliderButton_Frame_InnerButton.Position = UDim2.new(0, 0, 0, 0)
            SliderButton_Frame_InnerButton.BorderSizePixel = 0
            SliderButton_Frame_InnerButton.BackgroundColor3 = loadconfig.Color.Foreground
            SliderButton_Frame_InnerButton.AutoButtonColor = false
            SliderButton_Frame_InnerButton.FontSize = Enum.FontSize.Size14
            SliderButton_Frame_InnerButton.TextSize = 14
            SliderButton_Frame_InnerButton.TextColor3 = Color3.fromRGB(255, 255, 255)
            SliderButton_Frame_InnerButton.Text = ""
            SliderButton_Frame_InnerButton.Font = Enum.Font.Gotham
            SliderButton_Frame_InnerButton.Parent = SliderButton_Frame
            SliderButton_Frame_InnerButton.BackgroundTransparency = 1
            
            local SliderButton_Val = Instance.new("TextLabel")
            SliderButton_Val.Name = "SliderButton_Val"
            SliderButton_Val.ZIndex = 8
            SliderButton_Val.Size = UDim2.new(0, 48, 0, 14)
            SliderButton_Val.BackgroundTransparency = 1
            SliderButton_Val.Position = UDim2.new(0, 260, 0, 8)
            SliderButton_Val.BorderSizePixel = 0
            SliderButton_Val.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            SliderButton_Val.FontSize = Enum.FontSize.Size14
            SliderButton_Val.TextSize = 14
            SliderButton_Val.TextColor3 = Color3.fromRGB(220, 220, 220)
            SliderButton_Val.Text = sliderconfig.minvalue or "nil 0"
            SliderButton_Val.Font = Enum.Font.Gotham
            SliderButton_Val.TextXAlignment = Enum.TextXAlignment.Right
            SliderButton_Val.Parent = SliderButton
            SliderButton_Val.TextTransparency = 1

            game:GetService("TweenService"):Create(SliderButton_Val, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            SliderButton.Parent = ContainerLeft

            local minvalue = sliderconfig.minvalue or 0
            local defvalue = sliderconfig.defvalue or 50
            local maxvalue = sliderconfig.maxvalue or 100
            local SliderDef = math.clamp(defvalue, minvalue, maxvalue)
            local DefaultScale =  (SliderDef - minvalue) / (maxvalue - minvalue)
            
            -----Callback-----
            callback = sliderconfig.Callback or function() end
            
            
            -----Variables-----
            local mouse = game.Players.LocalPlayer:GetMouse()
            local uis = game:GetService("UserInputService")
            local Value = minvalue
            
            
            
            
            -----Main Code-----
            
            SliderButton_Frame_InnerButton.MouseButton1Down:Connect(function()
                Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 296) * SliderButton_FrameInnerFrame.AbsoluteSize.X) + tonumber(minvalue)) or 0
                task.spawn(function()
                    pcall(function()
                        callback(Value)
                    end)
                end)
                SliderButton_FrameInnerFrame:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderButton_FrameInnerFrame.AbsolutePosition.X, 0, 296), 0, 4), "InOut", "Quad", 0.05, true)
                moveconnection = mouse.Move:Connect(function()
                    SliderButton_Val.Text = Value
                    Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 296) * SliderButton_FrameInnerFrame.AbsoluteSize.X) + tonumber(minvalue))
                    task.spawn(function()
                        pcall(function()
                            callback(Value)
                        end)
                    end)
                    SliderButton_FrameInnerFrame:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderButton_FrameInnerFrame.AbsolutePosition.X, 0, 296), 0, 4), "InOut", "Quad", 0.05, true)
                end)
                releaseconnection = uis.InputEnded:Connect(function(Mouse)
                    if Mouse.UserInputType == Enum.UserInputType.MouseButton1 then
                        Value = math.floor((((tonumber(maxvalue) - tonumber(minvalue)) / 296) * SliderButton_FrameInnerFrame.AbsoluteSize.X) + tonumber(minvalue))
                        task.spawn(function()
                            pcall(function()
                                callback(Value)
                            end)
                        end)
                        SliderButton_Val.Text = Value
                        SliderButton_FrameInnerFrame:TweenSize(UDim2.new(0, math.clamp(mouse.X - SliderButton_FrameInnerFrame.AbsolutePosition.X, 0, 296), 0, 4), "InOut", "Quad", 0.05, true)
                        moveconnection:Disconnect()
                        releaseconnection:Disconnect()
                    end
                end)
            end)
        end

        function Container:Dropdown(dropdownconfig)
            dropdownconfig.Callback = dropdownconfig.Callback or function() end
            local DropdownButton = Instance.new("TextButton")
            local DropdownButtonUICorner = Instance.new("UICorner")
            local DropdownButton_Title = Instance.new("TextLabel")
            local DropdownButton_CurrentText = Instance.new("TextLabel")
            local DropdownButtonImageLabel = Instance.new("ImageLabel")
            local DropdownScrollingFrame = Instance.new("ScrollingFrame")
            local DropdownScrollingFrameInner = Instance.new("Frame")
            local DropdownScrollingFrameInnerUIListLayout = Instance.new("UIListLayout")
            
            DropdownButton.Name = dropdownconfig.Title or "DropdownButton"
            DropdownButton.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            DropdownButton.BorderSizePixel = 0
            DropdownButton.Position = UDim2.new(0, 0, 1.53999996, 0)
            DropdownButton.Size = UDim2.new(0, 316, 0, 46)
            DropdownButton.ZIndex = 7
            DropdownButton.AutoButtonColor = false
            DropdownButton.Font = Enum.Font.Gotham
            DropdownButton.Text = ""
            DropdownButton.TextColor3 = Color3.fromRGB(220, 220, 220)
            DropdownButton.TextSize = 14.000
            DropdownButton.BackgroundTransparency = 1

            if dropdownconfig.Container == "Left" then
                DropdownButton.Parent = ContainerLeft
            elseif dropdownconfig.Container == "Right" then
                DropdownButton.Parent = ContainerRight
            end

            game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundTransparency = 0}):Play()
            
            DropdownButtonUICorner.CornerRadius = UDim.new(0, 4)
            DropdownButtonUICorner.Name = "DropdownButtonUICorner"
            DropdownButtonUICorner.Parent = DropdownButton
            
            DropdownButton_Title.Name = "DropdownButton_Title"
            DropdownButton_Title.Parent = DropdownButton
            DropdownButton_Title.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            DropdownButton_Title.BackgroundTransparency = 1.000
            DropdownButton_Title.BorderSizePixel = 0
            DropdownButton_Title.Position = UDim2.new(0, 10, 0, 8)
            DropdownButton_Title.Size = UDim2.new(0, 250, 0, 14)
            DropdownButton_Title.ZIndex = 8
            DropdownButton_Title.Font = Enum.Font.Gotham
            DropdownButton_Title.Text = dropdownconfig.Title or "Dropdown 2"
            DropdownButton_Title.TextColor3 = Color3.fromRGB(220, 220, 220)
            DropdownButton_Title.TextSize = 14.000
            DropdownButton_Title.TextXAlignment = Enum.TextXAlignment.Left
            DropdownButton_Title.TextTransparency = 1

            game:GetService("TweenService"):Create(DropdownButton_Title, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            DropdownButton_CurrentText.Name = "DropdownButton_CurrentText"
            DropdownButton_CurrentText.Parent = DropdownButton
            DropdownButton_CurrentText.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
            DropdownButton_CurrentText.BackgroundTransparency = 1.000
            DropdownButton_CurrentText.BorderSizePixel = 0
            DropdownButton_CurrentText.Position = UDim2.new(0, 10, 0, 24)
            DropdownButton_CurrentText.Size = UDim2.new(0, 250, 0, 14)
            DropdownButton_CurrentText.ZIndex = 8
            DropdownButton_CurrentText.Font = Enum.Font.Gotham
            DropdownButton_CurrentText.Text = dropdownconfig.CurrentList or "None"
            DropdownButton_CurrentText.TextColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButton_CurrentText.TextSize = 14.000
            DropdownButton_CurrentText.TextTransparency = 0.500
            DropdownButton_CurrentText.TextXAlignment = Enum.TextXAlignment.Left
            DropdownButton_CurrentText.TextTransparency = 1

            game:GetService("TweenService"):Create(DropdownButton_CurrentText, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            
            DropdownButtonImageLabel.Name = "DropdownButtonImageLabel"
            DropdownButtonImageLabel.Parent = DropdownButton
            DropdownButtonImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownButtonImageLabel.BackgroundTransparency = 1.000
            DropdownButtonImageLabel.BorderSizePixel = 0
            DropdownButtonImageLabel.Position = UDim2.new(0, 286, 0, 14)
            DropdownButtonImageLabel.Rotation = 45.000
            DropdownButtonImageLabel.Size = UDim2.new(0, 18, 0, 18)
            DropdownButtonImageLabel.ZIndex = 8
            DropdownButtonImageLabel.Image = "http://www.roblox.com/asset/?id=6031094678"
            DropdownButtonImageLabel.ImageColor3 = Color3.fromRGB(220, 220, 220)
            DropdownButtonImageLabel.ImageTransparency = 1

            game:GetService("TweenService"):Create(DropdownButtonImageLabel, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{ImageTransparency = 0}):Play()
            
            DropdownScrollingFrame.Name = "DropdownScrollingFrame"
            DropdownScrollingFrame.Parent = DropdownButton
            DropdownScrollingFrame.Active = true
            DropdownScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownScrollingFrame.BackgroundTransparency = 1.000
            DropdownScrollingFrame.BorderSizePixel = 0
            DropdownScrollingFrame.Position = UDim2.new(0, 0, 0, 48)
            DropdownScrollingFrame.Size = UDim2.new(0, 316, 0, 0)
            DropdownScrollingFrame.ZIndex = 8
            DropdownScrollingFrame.BottomImage = "http://www.roblox.com/asset/?id=10083890741"
            DropdownScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
            DropdownScrollingFrame.MidImage = "http://www.roblox.com/asset/?id=10083890741"
            DropdownScrollingFrame.ScrollBarThickness = 0
            DropdownScrollingFrame.TopImage = "http://www.roblox.com/asset/?id=10083890741"
            DropdownScrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(55,55,55)
            
            DropdownScrollingFrameInner.Name = "DropdownScrollingFrameInner"
            DropdownScrollingFrameInner.Parent = DropdownScrollingFrame
            DropdownScrollingFrameInner.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            DropdownScrollingFrameInner.BackgroundTransparency = 1.000
            DropdownScrollingFrameInner.BorderSizePixel = 0
            DropdownScrollingFrameInner.Position = UDim2.new(0, 2, 0, 6)
            DropdownScrollingFrameInner.Size = UDim2.new(0, 100, 0, 100)
            
            DropdownScrollingFrameInnerUIListLayout.Name = "DropdownScrollingFrameInnerUIListLayout"
            DropdownScrollingFrameInnerUIListLayout.Parent = DropdownScrollingFrameInner
            DropdownScrollingFrameInnerUIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
            DropdownScrollingFrameInnerUIListLayout.Padding = UDim.new(0, 4)

            local DropdownButtonUIStroke = Instance.new("UIStroke")
            DropdownButtonUIStroke.Name = "DropdownButtonUIStroke"
            DropdownButtonUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
            DropdownButtonUIStroke.Thickness = 1.2
            DropdownButtonUIStroke.Color = Color3.fromRGB(55, 55, 55)
            DropdownButtonUIStroke.Transparency = 1
            
            DropdownButtonUIStroke.Parent = DropdownButton

            game:GetService("TweenService"):Create(DropdownButtonUIStroke, TweenInfo.new(0.8,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Transparency = 0}):Play()

            local function ResizeDropdown()
                DropdownScrollingFrame.CanvasSize = UDim2.new(0, 0, 0, DropdownScrollingFrameInnerUIListLayout.AbsoluteContentSize.Y + DropdownScrollingFrameInnerUIListLayout.Padding.Offset + 8)
            end
            ResizeDropdown()
            DropdownScrollingFrameInnerUIListLayout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(ResizeDropdown)

            DropdownButton.MouseButton1Click:Connect(function()
                local totallist = 0
                for i, v in pairs(DropdownScrollingFrameInner:GetChildren()) do
                    if v:IsA("TextButton") then
                        totallist = totallist + 1
                    end
                end
                if DropdownScrollingFrame.Size.Y.Offset == 0 then
                    game:GetService("TweenService"):Create(DropdownButtonImageLabel, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = -45}):Play()
                    if totallist > 6 then
                        game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46 + 6 + 184 + 2)}):Play()
                        game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 184), ScrollBarThickness = 6}):Play()
                    else
                        game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46 + 6 + DropdownScrollingFrameInnerUIListLayout.AbsoluteContentSize.Y + DropdownScrollingFrameInnerUIListLayout.Padding.Offset + 4)}):Play()
                        game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, DropdownScrollingFrameInnerUIListLayout.AbsoluteContentSize.Y + DropdownScrollingFrameInnerUIListLayout.Padding.Offset + 4), ScrollBarThickness = 0}):Play()
                    end
                else
                    game:GetService("TweenService"):Create(DropdownButtonImageLabel, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 0}):Play()
                    game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46)}):Play()
                    game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 0), ScrollBarThickness = 0}):Play()
                end
            end)

            if dropdownconfig.CallbackWhenExecuted == true then
                pcall(function()
                    dropdownconfig.Callback(DropdownButton_CurrentText.Text)
                end)
            end

            dropdownconfig.List = dropdownconfig.List or {}

            for i, v in next, dropdownconfig.List do
                local DropdownList = Instance.new("TextButton")
                DropdownList.Name = v or "DropdownList"
                DropdownList.ZIndex = 7
                DropdownList.Size = UDim2.new(0, 304, 0, 26)
                DropdownList.BorderSizePixel = 0
                DropdownList.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                DropdownList.AutoButtonColor = false
                DropdownList.FontSize = Enum.FontSize.Size14
                DropdownList.TextSize = 14
                DropdownList.TextColor3 = Color3.fromRGB(220, 220, 220)
                DropdownList.Text = ""
                DropdownList.Font = Enum.Font.Gotham
                DropdownList.Parent = DropdownScrollingFrameInner
                
                local DropdownListUICorner = Instance.new("UICorner")
                DropdownListUICorner.Name = "DropdownListUICorner"
                DropdownListUICorner.CornerRadius = UDim.new(0, 4)
                DropdownListUICorner.Parent = DropdownList
                
                local DropdownListTextLabel = Instance.new("TextLabel")
                DropdownListTextLabel.Name = "DropdownListTextLabel"
                DropdownListTextLabel.ZIndex = 8
                DropdownListTextLabel.AutomaticSize = Enum.AutomaticSize.Y
                DropdownListTextLabel.Size = UDim2.new(0, 294, 0, 26)
                DropdownListTextLabel.BackgroundTransparency = 1
                DropdownListTextLabel.Position = UDim2.new(0, 10, 0, 0)
                DropdownListTextLabel.BorderSizePixel = 0
                DropdownListTextLabel.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                DropdownListTextLabel.FontSize = Enum.FontSize.Size14
                DropdownListTextLabel.TextSize = 14
                DropdownListTextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
                DropdownListTextLabel.Text = v or "nil text"
                DropdownListTextLabel.TextWrapped = true
                DropdownListTextLabel.Font = Enum.Font.Gotham
                DropdownListTextLabel.TextWrap = true
                DropdownListTextLabel.TextXAlignment = Enum.TextXAlignment.Left
                DropdownListTextLabel.Parent = DropdownList
                
                local DropdownListUIStroke = Instance.new("UIStroke")
                DropdownListUIStroke.Name = "DropdownListUIStroke"
                DropdownListUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                DropdownListUIStroke.Thickness = 1.2
                DropdownListUIStroke.Color = Color3.fromRGB(55, 55, 55)
                DropdownListUIStroke.Parent = DropdownList

                DropdownList.MouseEnter:Connect(function()
                    game:GetService("TweenService"):Create(DropdownList, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(36, 36, 36)}):Play()
                end)
                DropdownList.MouseLeave:Connect(function()
                    game:GetService("TweenService"):Create(DropdownList, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                end)
                DropdownList.MouseButton1Click:Connect(function()
                    game:GetService("TweenService"):Create(DropdownButtonImageLabel, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 0}):Play()
                    DropdownButton_CurrentText.Text = DropdownListTextLabel.Text
                    game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46)}):Play()
                    game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 0), ScrollBarThickness = 0}):Play()
                    pcall(function()
                        dropdownconfig.Callback(DropdownListTextLabel.Text)
                    end)
                end)
            end

            local DropdownList = {}

            function DropdownList:GetValue()
                return DropdownButton_CurrentText.Text
            end
            function DropdownList:ChangeText(newvalue)
                game:GetService("TweenService"):Create(DropdownButton_Title, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 1}):Play()
                wait(0.4)
                DropdownButton_Title.Text = newvalue
                wait(0.1)
                game:GetService("TweenService"):Create(DropdownButton_Title, TweenInfo.new(0.4,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{TextTransparency = 0}):Play()
            end
            function DropdownList:ChangeValue(newvalue, callbackwhenexecuted)
                if callbackwhenexecuted then
                    DropdownButton_CurrentText.Text = newvalue
                    pcall(function()
                        dropdownconfig.Callback(newvalue)
                    end)
                else
                    DropdownButton_CurrentText.Text = newvalue
                end
            end
            function DropdownList:Refresh(newtable)
                local newtable = newtable or {}

                game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46)}):Play()
                game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 0), ScrollBarThickness = 0}):Play()

                wait(0.08)

                for i, v in pairs(DropdownScrollingFrameInner:GetChildren()) do
                    if v:IsA("TextButton") then
                        v:Destroy()
                    end
                end

                for i, v in next, newtable do
                    local DropdownList = Instance.new("TextButton")
                    DropdownList.Name = v or "DropdownList"
                    DropdownList.ZIndex = 7
                    DropdownList.Size = UDim2.new(0, 304, 0, 26)
                    DropdownList.BorderSizePixel = 0
                    DropdownList.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                    DropdownList.AutoButtonColor = false
                    DropdownList.FontSize = Enum.FontSize.Size14
                    DropdownList.TextSize = 14
                    DropdownList.TextColor3 = Color3.fromRGB(220, 220, 220)
                    DropdownList.Text = ""
                    DropdownList.Font = Enum.Font.Gotham
                    DropdownList.Parent = DropdownScrollingFrameInner
                    
                    local DropdownListUICorner = Instance.new("UICorner")
                    DropdownListUICorner.Name = "DropdownListUICorner"
                    DropdownListUICorner.CornerRadius = UDim.new(0, 4)
                    DropdownListUICorner.Parent = DropdownList
                    
                    local DropdownListTextLabel = Instance.new("TextLabel")
                    DropdownListTextLabel.Name = "DropdownListTextLabel"
                    DropdownListTextLabel.ZIndex = 8
                    DropdownListTextLabel.AutomaticSize = Enum.AutomaticSize.Y
                    DropdownListTextLabel.Size = UDim2.new(0, 294, 0, 26)
                    DropdownListTextLabel.BackgroundTransparency = 1
                    DropdownListTextLabel.Position = UDim2.new(0, 10, 0, 0)
                    DropdownListTextLabel.BorderSizePixel = 0
                    DropdownListTextLabel.BackgroundColor3 = Color3.fromRGB(11, 11, 11)
                    DropdownListTextLabel.FontSize = Enum.FontSize.Size14
                    DropdownListTextLabel.TextSize = 14
                    DropdownListTextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
                    DropdownListTextLabel.Text = v or "nil text"
                    DropdownListTextLabel.TextWrapped = true
                    DropdownListTextLabel.Font = Enum.Font.Gotham
                    DropdownListTextLabel.TextWrap = true
                    DropdownListTextLabel.TextXAlignment = Enum.TextXAlignment.Left
                    DropdownListTextLabel.Parent = DropdownList
                    
                    local DropdownListUIStroke = Instance.new("UIStroke")
                    DropdownListUIStroke.Name = "DropdownListUIStroke"
                    DropdownListUIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
                    DropdownListUIStroke.Thickness = 1.2
                    DropdownListUIStroke.Color = Color3.fromRGB(55, 55, 55)
                    DropdownListUIStroke.Parent = DropdownList
    
                    DropdownList.MouseEnter:Connect(function()
                        game:GetService("TweenService"):Create(DropdownList, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(36, 36, 36)}):Play()
                    end)
                    DropdownList.MouseLeave:Connect(function()
                        game:GetService("TweenService"):Create(DropdownList, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{BackgroundColor3 = Color3.fromRGB(11, 11, 11)}):Play()
                    end)
                    DropdownList.MouseButton1Click:Connect(function()
                        game:GetService("TweenService"):Create(DropdownButtonImageLabel, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Rotation = 0}):Play()
                        DropdownButton_CurrentText.Text = DropdownListTextLabel.Text
                        game:GetService("TweenService"):Create(DropdownButton, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 46)}):Play()
                        game:GetService("TweenService"):Create(DropdownScrollingFrame, TweenInfo.new(0.08,Enum.EasingStyle.Quad, Enum.EasingDirection.Out),{Size = UDim2.new(0, 316, 0, 0), ScrollBarThickness = 0}):Play()
                        pcall(function()
                            dropdownconfig.Callback(DropdownListTextLabel.Text)
                        end)
                    end)
                end
            end
            
            return DropdownList
        end

        return Container
    end

    return Window
end

return MasterOogway6147
