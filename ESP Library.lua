-- Services

local Players = game:GetService("Players")
local RS = game:GetService("RunService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Root = Char:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera
local math_floor = math.floor
local Drawing_new = Drawing.new
local isA = game.IsA
local GetPivot = Char.GetPivot
local WTVP = Camera.WorldToViewportPoint

local ESP = {
    Containers = {},
    Settings = {
        DisplayNames = true,
        Distance = true,
        Health = {
            Enabled = true,
            Percentage = true,
            RealValue = true,
        },
        Tracer = true,
        TracerFrom = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y),
        TracerThickness = 1,
        Outline = true,
        OutlineOpacity = 0.7,
        OutlineOnTop = true,
        Rainbow = false,
        TextSize = 16,
    },
    __index = nil,
}

-- Misc Functions

local function onCharacterAdded(char)
    Char, Root = char, char:WaitForChild("HumanoidRootPart")
end

local function getPlayerFromRoot(root)
    return Players:GetPlayerFromCharacter(isA(root, "Model") and root or root:FindFirstAncestorOfClass("Model"))
end

local function getWTVP(vec3)
    local screenPos, onScreen = WTVP(Camera, vec3)
    
    return Vector2.new(screenPos.X, screenPos.Y), onScreen
end

local function isAlive(root)
    if root.Parent == nil then
        return false
    elseif root.Parent:FindFirstChildOfClass("Humanoid") and root.Parent.Humanoid.Health <= 0 or root:FindFirstChildOfClass("Humanoid") and root:FindFirstChildOfClass("Humanoid").Health <= 0 then
        return false
    end
    return true
end

-- Functions

function ESP:Add(root, options)
    if self.Containers[root] then
        self:Remove(root)
    end
    if options == nil then options = {} end

    -- Container
    
    local player = getPlayerFromRoot(root)
    
    local container = {
        Active = true,
        Root = root,
        Player = player,
        Name = options.Name or (player and player[self.Settings.DisplayNames and "DisplayName" or "Name"]) or root.Name,
        Color = options.Color or (player and player.Team and player.TeamColor.Color) or Color3.new(1, 1, 1),
        OutlineFocus = options.OutlineFocus or (player and player.Character) or (root.Parent and root.Parent.ClassName == "Model" and root.Parent) or root,
        MaxDistance = options.MaxDistance or math.huge,
        Connections = {},
        Draw = {},
    }

    -- Draw

    local nameLabel = Drawing_new("Text")
    local statsLabel = Drawing_new("Text")
    local tracer = Drawing_new("Line")
    local outline = Instance.new("Highlight")

    nameLabel.Center = true
    nameLabel.Color = container.Color
    nameLabel.Outline = true
    nameLabel.Size = self.Settings.TextSize
    nameLabel.Text = container.Name

    statsLabel.Center = true
    statsLabel.Outline = true
    statsLabel.Color = Color3.new(1, 1, 1)
    statsLabel.Size = self.Settings.TextSize

    tracer.Visible = false
    tracer.Color = container.Color
    tracer.From = self.Settings.TracerFrom
    tracer.Thickness = self.Settings.TracerThickness

    outline.Enabled = false
    outline.FillColor = container.Color
    outline.FillTransparency = 0.75
    outline.OutlineColor = container.Color
    outline.OutlineTransparency = 0
    outline.Parent = container.OutlineFocus

    -- Connections

    if player then
        container.Connections.changeTeam = player:GetPropertyChangedSignal("Team"):Connect(function()
            self:Remove(root)
        end)
    end

    -- Indexing

    container.Draw[#container.Draw + 1] = { Type = "Text", Name = "Name", Obj = nameLabel }
    container.Draw[#container.Draw + 1] = { Type = "Text", Name = "Stats", Obj = statsLabel }
    container.Draw[#container.Draw + 1] = { Type = "Line", Name = "Tracer", Obj = tracer }
    container.Draw[#container.Draw + 1] = { Type = "Outline", Name = "Outline", Obj = outline }
    self.Containers[root] = container
    
    return container
end

function ESP:Remove(root)
    local container = self.Containers[root]

    if container then
        container.Active = false
        
        for _, v in next, container.Connections do
            v:Disconnect(); v = nil
        end
        
        for _, v in next, container.Draw do
            v.Obj[v.Type == "Outline" and "Destroy" or "Remove"](v.Obj); v = nil
        end

        self.Containers[root] = nil
    end
end

-- Scripts

onCharacterAdded(Char)
Plr.CharacterAdded:Connect(onCharacterAdded)
Players.PlayerRemoving:Connect(function(player) if player == Plr then Drawing.clear() end end)

ESP.__index = ESP

ESP.UpdateConnection = RS.Stepped:Connect(function()
    for root, container in next, ESP.Containers do
        if isAlive(root) then
        	local rootPos = (isA(root, "BasePart") and root.CFrame or isA(root, "Model") and GetPivot(root)).Position
            local screenPos, onScreen = getWTVP(rootPos)

            if onScreen and container.Active and (Root.Position - rootPos).Magnitude < container.MaxDistance then
                local texts = 0
                for _, v in next, container.Draw do
                    if v.Type == "Text" and v.Obj.Text ~= "" then
                        texts += 1
                    end
                end
    
                for i = 1, #container.Draw do
                    local v = container.Draw[i]
                    local color = container.Color or ESP.Settings.Rainbow and Color3.fromHSV(tick() % 5 / 5, 1, 1) or Color3.new(1,1,1)

                    if v.Type ~= "Outline" then
                        if v.Type == "Text" then
                            v.Obj.Size = ESP.Settings.TextSize
                            v.Obj.Position = screenPos - Vector2.new(0, (texts - i) * ESP.Settings.TextSize)
    
                            if v.Name == "Name" then
                                v.Obj.Text = container.Name
    
                            elseif v.Name == "Stats" then
                                local dist = ESP.Settings.Distance and "[ ".. (math_floor((rootPos - Root.Position).Magnitude)).. " ]" or ""
                                local Phealth = ESP.Settings.Health.Enabled and ESP.Settings.Health.Percentage and root:FindFirstChildOfClass("Humanoid") and "\n [ ".. (math_floor(100 / root:FindFirstChildOfClass("Humanoid").MaxHealth * root:FindFirstChildOfClass("Humanoid").Health * 10) / 10).. "% ]" or ""
                                local Rhealth = ESP.Settings.Health.Enabled and ESP.Settings.Health.RealValue and root:FindFirstChildOfClass("Humanoid") and "\n [ "..(math_floor(root:FindFirstChildOfClass("Humanoid").Health / 100) * 100).."/"..(math_floor(root:FindFirstChildOfClass("Humanoid").MaxHealth / 100) * 100).." ]" or ""

                                v.Obj.Text = dist..Rhealth..Phealth
                            end
    
                        elseif v.Type == "Line" and ESP.Settings.Tracer then
                            v.Obj.From = ESP.Settings.TracerFrom
                            v.Obj.To = screenPos + Vector2.new(0, math.max(texts * ESP.Settings.TextSize / 2, ESP.Settings.TextSize))
                            v.Obj.Thickness = ESP.Settings.TracerThickness
                            v.Obj.Visible = true
                        end
                        
                        v.Obj.Color = color
                        v.Obj.Visible = v.Type ~= "Line" or v.Type == "Line" and ESP.Settings.Tracer
                    else
                        if ESP.Settings.Outline then
                            v.Obj.FillColor = color
                            v.Obj.FillTransparency = ESP.Settings.OutlineOpacity
                            v.Obj.OutlineColor = color
                            v.Obj.DepthMode = Enum.HighlightDepthMode[ESP.Settings.OutlineOnTop and "AlwaysOnTop" or "Occluded"]
                        end
                        
                        v.Obj.Enabled = ESP.Settings.Outline

                        -- Refresh outline visibility

                        v.Obj.Parent = game
                        v.Obj.Parent = container.OutlineFocus
                    end
                end
            else
                for _, v in next, container.Draw do
                    if v.Type ~= "Outline" then
                        v.Obj.Visible = false
                    else
                        v.Obj.Enabled = false
                    end
                end
            end
        else
            ESP:Remove(root)
        end
    end
end)

return ESP
