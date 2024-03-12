-- Services

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

-- Variables

local Plr = Players.LocalPlayer
local Char = Plr.Character or Plr.CharacterAdded:Wait()
local Root = Char:WaitForChild("HumanoidRootPart")
local Camera = workspace.CurrentCamera
local math_floor = math.floor
local Drawing_new = Drawing.new
local Drawing_clear = Drawing.clear
local Vec2New = Vector2.new
local isA = game.IsA
local findFirstAncestorOfClass = game.FindFirstAncestorOfClass
local waitForChild = game.WaitForChild
local GetPivot = Char.GetPivot
local WTVP = Camera.WorldToViewportPoint
local Con1, Con2
local Instance_new, Color3_new, math_max = Instance.new, Color3.new, math.max

local ESP = setmetatable({
    Containers = {},
    Settings = {
        DisplayNames = true,
        Distance = true,
        Health = {
            Enabled = true,
            Percentage = true,
            RealValue = true,
        },
        Tracer = {
            Enabled = true,
            From = Vec2New(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y),
            Thickness = 1
        },
        Outline = true,
        OutlineOpacity = 0.7,
        OutlineOnTop = true,
        Rainbow = false,
        TextSize = 16,
    },
    __index = nil,
}, {__call = function(self)
    return self.Settings
end})

-- Misc Functions

local function onCharacterAdded(char)
    Char, Root = char, waitForChild(char, "HumanoidRootPart")
end

local function getPlayerFromRoot(root)
    return root and Players:GetPlayerFromCharacter(isA(root, "Model") or findFirstAncestorOfClass(root, "Model"))
end

local function getWTVP(vec3)
    local screenPos, onScreen = WTVP(Camera, vec3)
    
    return Vec2New(screenPos.X, screenPos.Y), onScreen
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
    options = options or {}
    if self ~= ESP then return error(debug.traceback("Expected ':' not '.' calling member function Add"), 5) end
    if self.Containers[root] then
        self:Remove(root)
    end

    -- Container
    
    local player, Settings = getPlayerFromRoot(root), self()
    
    local container = {
        Active = true,
        Root = root,
        Player = player,
        Name = options.Name or (player and player[Settings.DisplayNames and "DisplayName" or "Name"]) or root.Name,
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
    local outline = Instance_new("Highlight")

    nameLabel.Center = true
    nameLabel.Color = container.Color
    nameLabel.Outline = true
    nameLabel.Size = Settings.TextSize
    nameLabel.Text = container.Name

    statsLabel.Center = true
    statsLabel.Outline = true
    statsLabel.Color = Color3_new(1, 1, 1)
    statsLabel.Size = Settings.TextSize

    tracer.Visible = false
    tracer.Color = container.Color
    tracer.From = Settings.Tracer.From
    tracer.Thickness = Settings.Tracer.Thickness

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
    if self ~= ESP then return error(debug.traceback("Expected ':' not '.' calling member function Remove"), 5) end
    local container = self.Containers[root]

    if container then
        container.Active = false
        
        for _, v in next, container.Connections do
            v:Disconnect()
            v = nil
        end
        
        for _, v in next, container.Draw do
            v.Obj[v.Type == "Outline" and "Destroy" or "Remove"](v.Obj)
            v = nil
        end

        self.Containers[root] = nil
    end
end

function ESP:Unload()
    if self ~= ESP then return error(debug.traceback("Expected ':' not '.' calling member function Unload"), 5) end
    self.UpdateConnection:Disconnect()
    Con1:Disconnect()
    Con2:Disconnect()
    for _, root in next, self.Containers do
        self:Remove(root)
    end
end

-- Scripts

Con1 = Plr.CharacterAdded:Connect(onCharacterAdded)
Con2 = Players.PlayerRemoving:Connect(function(player) if player == Plr then Drawing_clear() end end)

ESP.__index = ESP

ESP.UpdateConnection = RunService.Stepped:Connect(function()
    for root, container in next, ESP.Containers do
        if isAlive(root) then
        	local rootPos = (isA(root, "BasePart") and root.CFrame or isA(root, "Model") and GetPivot(root)).Position
            local screenPos, onScreen, Settings = getWTVP(rootPos), ESP()

            if onScreen and container.Active and (Root.Position - rootPos).Magnitude < container.MaxDistance then
                local texts = 0
                for _, v in next, container.Draw do
                    if v.Type == "Text" and v.Obj.Text ~= "" then
                        texts += 1
                    end
                end
    
                for i = 1, #container.Draw do
                    local v = container.Draw[i]
                    local color = container.Color or Settings.Rainbow and Color3.fromHSV(tick() % 5 / 5, 1, 1) or Color3.new(1,1,1)

                    if v.Type ~= "Outline" then
                        if v.Type == "Text" then
                            v.Obj.Size = Settings.TextSize
                            v.Obj.Position = screenPos - Vec2New(0, (texts - i) * Settings.TextSize)
    
                            if v.Name == "Name" then
                                v.Obj.Text = container.Name
    
                            elseif v.Name == "Stats" then
                                local dist = Settings.Distance and "[ ".. (math_floor((rootPos - Root.Position).Magnitude)).. " ]" or ""
                                local Phealth = Settings.Health.Enabled and Settings.Health.Percentage and root:FindFirstChildOfClass("Humanoid") and "\n [ ".. (math_floor(100 / root:FindFirstChildOfClass("Humanoid").MaxHealth * root:FindFirstChildOfClass("Humanoid").Health * 10) / 10).. "% ]" or ""
                                local Rhealth = Settings.Health.Enabled and Settings.Health.RealValue and root:FindFirstChildOfClass("Humanoid") and "\n [ "..(math_floor(root:FindFirstChildOfClass("Humanoid").Health / 100) * 100).."/"..(math_floor(root:FindFirstChildOfClass("Humanoid").MaxHealth / 100) * 100).." ]" or ""

                                v.Obj.Text = dist..Rhealth..Phealth
                            end
    
                        elseif v.Type == "Line" and Settings.Tracer.Enabled then
                            v.Obj.From = Settings.Tracer.From
                            v.Obj.To = screenPos + Vec2New(0, math_max(texts * Settings.TextSize / 2, Settings.TextSize))
                            v.Obj.Thickness = Settings.Tracer.Thickness
                            v.Obj.Visible = true
                        end
                        
                        v.Obj.Color = color
                        v.Obj.Visible = v.Type ~= "Line" or v.Type == "Line" and Settings.Tracer.Enabled
                    else
                        if Settings.Outline then
                            v.Obj.FillColor = color
                            v.Obj.FillTransparency = Settings.OutlineOpacity
                            v.Obj.OutlineColor = color
                            v.Obj.DepthMode = Enum.HighlightDepthMode[Settings.OutlineOnTop and "AlwaysOnTop" or "Occluded"]
                        end
                        
                        v.Obj.Enabled = Settings.Outline

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
