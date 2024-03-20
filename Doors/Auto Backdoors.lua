-- made by realmasteroogway 
-- .gg/6h4pG5Py7P

-- \\ Services / Variables // --

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CurrentRooms = workspace.CurrentRooms
local LatestRoom = ReplicatedStorage.GameData.LatestRoom
local LocalPlayer = game:GetService("Players").LocalPlayer
local Character = LocalPlayer.Character
local RootPart: Part, Collision: Part = Character.HumanoidRootPart, Character.Collision
local Vel, Vec0, Gyro = nil, Vector3.new(), nil
local CamScript, VIM = LocalPlayer.PlayerGui.MainUI.Initiator.Main_Game.Camera, game:GetService("VirtualInputManager")

local Speed = 22

-- \\ Functions // --

local function setupFly(e)
    if e == nil then
        Vel = RootPart:FindFirstChild("BodyVelocity") or Instance.new('BodyVelocity', RootPart)
        Gyro = Instance.new('BodyGyro', RootPart)

        Gyro.cframe = RootPart.CFrame
        Gyro.P = 90000
        Gyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
        Vel.velocity = Vector3.new(0, 0, 0)
        Vel.maxForce = Vector3.new(9e9, 9e9, 9e9)
    else
        Gyro:Destroy()
        Vel:Destroy()
    end
end

local function GetRoom()
    return CurrentRooms:WaitForChild(LatestRoom.Value, 60)
end

local function GetAsset(Room, Name)
    local asset = false
    for i,v in next, Room:WaitForChild("Assets"):GetDescendants() do
        if v.Name == Name then
            asset = v
        end
    end
    return asset
end

local function CreatePath(part: PVInstance, Condition, Y)
    local targetPos = (typeof(part) == "Vector3" and part or part:GetPivot().Position) - Vector3.new(0, Y or 10, 0)

    while (Condition and Condition()) or (Collision.Position.Y - targetPos.Y) > 0.2 and task.wait() do
        Vel.Velocity = Vector3.new(0, -Speed, 0)
    end

    while (Condition and Condition()) or (Collision.Position - targetPos).Magnitude > 0.2 and task.wait() do
        local direction = (targetPos - Collision.Position).Unit * Speed

        Vel.Velocity = direction
    end 

    Vel.Velocity = Vec0
end

-- \\ World Changes // --

setupFly()

if Collision.CanCollide then
    game:GetService("RunService").Stepped:Connect(function(time, deltaTime)
        for i,v in next, LocalPlayer.Character:GetDescendants() do
            if v:IsA("BasePart") and v.CanCollide == true then
                v.CanCollide = false
            end
        end
    end)
end

-- \\ Walk // --

for i = 1, 51 do
    local Room, blitz = GetRoom(), workspace:FindFirstChild("BackdoorRush")

    if blitz and blitz:GetPivot().Position.Y >= Collision.Position.Y + 5 then
        CreatePath(RootPart, nil, 20)
        blitz = workspace:FindFirstChild("BackdoorRush")
        if blitz then
            repeat task.wait() until blitz:GetPivot().Position.Y <= Collision.Position.Y + 10
        end
    end

    local Key, Lever = GetAsset(Room, "KeyObtain"), GetAsset(Room, "TimerLever")
    
    if Lever then
        CreatePath(Lever)
        fireproximityprompt(Lever:FindFirstChildWhichIsA("ProximityPrompt"))
    end

    if Key and not Character:FindFirstChild("KeyBackdoor") then
        CreatePath(Key)
        fireproximityprompt(Key:FindFirstChildWhichIsA("ProximityPrompt"))
    end
    if Key then
        local Prompt = Room.Door.Lock:FindFirstChildOfClass("ProximityPrompt")
        CreatePath((Room.Door.Door.CFrame * CFrame.new(0, 0, 3)).Position, nil, 9)
        CamScript.Disabled = true
        workspace.CurrentCamera.CFrame = CFrame.new(workspace.CurrentCamera.CFrame.Position, Room.Door.Lock.Position)
        VIM:SendKeyEvent(true, Prompt.KeyboardKeyCode, false, game)
        task.wait(Prompt.HoldDuration + .1)
        VIM:SendKeyEvent(false, Prompt.KeyboardKeyCode, false, game)
        CamScript.Disabled = false
    else
        if LatestRoom.Value == 50 then
            CreatePath((Room.Backdoors_Exit.Door.CFrame * CFrame.new(0, 0, 3)).Position, nil, -2)
            setupFly(false)
            break
        else
            CreatePath((Room.Door.Door.CFrame * CFrame.new(0, 0, 3)).Position)
            Room.Door.ClientOpen:FireServer()
            LatestRoom.Changed:Wait()
        end
    end
end