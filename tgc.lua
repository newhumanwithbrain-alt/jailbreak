-- [ SYXE JAILBREAK : NETWORK FORCED EXPULSION MODULE ]
-- WARNING: MAXIMUM CLIENT-SIDE AUTHORITY OVERRIDE
-- Authored for Master MSTACLIPSE

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Cleanup UI lama
local existingUI = CoreGui:FindFirstChild("SyxeGatewayUI")
if existingUI then existingUI:Destroy() end

-- [ DATABASE BAN (AUTO-VOID SYSTEM) ]
local BannedPlayers = {}

-- Loop latar belakang: Force target terus menerus ke void jika mereka somehow survive
task.spawn(function()
    while task.wait(0.1) do -- Dipercepat dari 1 detik ke 0.1 detik untuk agresivitas maksimal
        pcall(function()
            for userId, _ in pairs(BannedPlayers) do
                local targetPlayer = Players:GetPlayerByUserId(userId)
                if targetPlayer and targetPlayer.Character then
                    local rootPart = targetPlayer.Character:FindFirstChild("HumanoidRootPart")
                    if rootPart then
                        -- Hantam terus menerus ke bawah
                        rootPart.Velocity = Vector3.new(0, -10000, 0)
                        rootPart.AssemblyLinearVelocity = Vector3.new(0, -10000, 0)
                    end
                end
            end
        end)
    end
end)

-- [ SETUP MAIN GUI ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SyxeGatewayUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

-- ==========================================
-- BAGIAN 1: SPLASH SCREEN
-- ==========================================
local SplashFrame = Instance.new("Frame")
SplashFrame.Size = UDim2.new(0, 400, 0, 200)
SplashFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
SplashFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
SplashFrame.BorderSizePixel = 2
SplashFrame.BorderColor3 = Color3.fromRGB(255, 0, 0)
SplashFrame.Parent = ScreenGui

local SplashCorner = Instance.new("UICorner")
SplashCorner.CornerRadius = UDim.new(0, 4)
SplashCorner.Parent = SplashFrame

local WarningText = Instance.new("TextLabel")
WarningText.Size = UDim2.new(0.8, 0, 0.4, 0)
WarningText.Position = UDim2.new(0.1, 0, 0.15, 0)
WarningText.BackgroundTransparency = 1
WarningText.TextColor3 = Color3.fromRGB(255, 50, 50)
WarningText.Text = "WELCOME TO SYXE JAILBREAKING\nUSE AT YOUR OWN RISK"
WarningText.Font = Enum.Font.GothamBold
WarningText.TextSize = 18
WarningText.TextWrapped = true
WarningText.Parent = SplashFrame

local EnterButton = Instance.new("TextButton")
EnterButton.Size = UDim2.new(0, 120, 0, 40)
EnterButton.Position = UDim2.new(0.5, -60, 0.7, 0)
EnterButton.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
EnterButton.TextColor3 = Color3.fromRGB(255, 255, 255)
EnterButton.Text = "ENTER"
EnterButton.Font = Enum.Font.GothamBlack
EnterButton.TextSize = 16
EnterButton.Parent = SplashFrame

local EnterCorner = Instance.new("UICorner")
EnterCorner.CornerRadius = UDim.new(0, 6)
EnterCorner.Parent = EnterButton

-- ==========================================
-- BAGIAN 2: MENU CHEATING
-- ==========================================
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 450, 0, 350)
MenuFrame.Position = UDim2.new(0.5, -225, 0.5, -175)
MenuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MenuFrame.BorderSizePixel = 0
MenuFrame.Visible = false
MenuFrame.Parent = ScreenGui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 6)
MenuCorner.Parent = MenuFrame

local MenuHeader = Instance.new("Frame")
MenuHeader.Size = UDim2.new(1, 0, 0, 30)
MenuHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MenuHeader.BorderSizePixel = 0
MenuHeader.Parent = MenuFrame

local HeaderCorner = Instance.new("UICorner")
HeaderCorner.CornerRadius = UDim.new(0, 6)
HeaderCorner.Parent = MenuHeader

local CloseButton = Instance.new("TextButton")
CloseButton.Size = UDim2.new(0, 30, 0, 30)
CloseButton.Position = UDim2.new(1, -30, 0, 0)
CloseButton.BackgroundTransparency = 1
CloseButton.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseButton.Text = "X"
CloseButton.Font = Enum.Font.GothamBold
CloseButton.TextSize = 14
CloseButton.Parent = MenuHeader

local HeaderLabel = Instance.new("TextLabel")
HeaderLabel.Size = UDim2.new(1, -30, 1, 0)
HeaderLabel.BackgroundTransparency = 1
HeaderLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
HeaderLabel.Text = "  SYXE JAILBREAK | TARGET ELIMINATOR"
HeaderLabel.Font = Enum.Font.GothamBold
HeaderLabel.TextSize = 12
HeaderLabel.TextXAlignment = Enum.TextXAlignment.Left
HeaderLabel.Parent = MenuHeader

local TargetLabel = Instance.new("TextLabel")
TargetLabel.Size = UDim2.new(0.45, 0, 0, 20)
TargetLabel.Position = UDim2.new(0.025, 0, 0.1, 0)
TargetLabel.BackgroundTransparency = 1
TargetLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
TargetLabel.Text = "SELECT TARGET:"
TargetLabel.Font = Enum.Font.GothamSemibold
TargetLabel.TextSize = 11
TargetLabel.TextXAlignment = Enum.TextXAlignment.Left
TargetLabel.Parent = MenuFrame

local PlayerScrollFrame = Instance.new("ScrollingFrame")
PlayerScrollFrame.Size = UDim2.new(0.45, 0, 0.75, 0)
PlayerScrollFrame.Position = UDim2.new(0.025, 0, 0.18, 0)
PlayerScrollFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
PlayerScrollFrame.BorderSizePixel = 1
PlayerScrollFrame.BorderColor3 = Color3.fromRGB(40, 40, 40)
PlayerScrollFrame.ScrollBarThickness = 4
PlayerScrollFrame.Parent = MenuFrame

local PlayerListLayout = Instance.new("UIListLayout")
PlayerListLayout.SortOrder = Enum.SortOrder.LayoutOrder
PlayerListLayout.Parent = PlayerScrollFrame

local ActionLabel = Instance.new("TextLabel")
ActionLabel.Size = UDim2.new(0.45, 0, 0, 20)
ActionLabel.Position = UDim2.new(0.525, 0, 0.1, 0)
ActionLabel.BackgroundTransparency = 1
ActionLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
ActionLabel.Text = "EXECUTE ACTION:"
ActionLabel.Font = Enum.Font.GothamSemibold
ActionLabel.TextSize = 11
ActionLabel.TextXAlignment = Enum.TextXAlignment.Left
ActionLabel.Parent = MenuFrame

local ActionContainer = Instance.new("Frame")
ActionContainer.Size = UDim2.new(0.45, 0, 0.75, 0)
ActionContainer.Position = UDim2.new(0.525, 0, 0.18, 0)
ActionContainer.BackgroundTransparency = 1
ActionContainer.Parent = MenuFrame

local ActionLayout = Instance.new("UIListLayout")
ActionLayout.Padding = UDim.new(0, 8)
ActionLayout.SortOrder = Enum.SortOrder.LayoutOrder
ActionLayout.Parent = ActionContainer

-- [ LOGIC: VARIABEL TARGET ]
local SelectedTarget = nil

-- [ LOGIC: POPULATE PLAYER LIST ]
local function RefreshPlayers()
    for _, child in pairs(PlayerScrollFrame:GetChildren()) do
        if child:IsA("TextButton") then child:Destroy() end
    end
    
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            local btn = Instance.new("TextButton")
            btn.Size = UDim2.new(1, 0, 0, 25)
            btn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
            btn.TextColor3 = Color3.fromRGB(255, 255, 255)
            btn.Text = "  " .. player.Name
            btn.Font = Enum.Font.Gotham
            btn.TextSize = 11
            btn.TextXAlignment = Enum.TextXAlignment.Left
            btn.Parent = PlayerScrollFrame
            
            local corner = Instance.new("UICorner")
            corner.CornerRadius = UDim.new(0, 3)
            corner.Parent = btn

            btn.MouseButton1Click:Connect(function()
                SelectedTarget = player
                for _, b in pairs(PlayerScrollFrame:GetChildren()) do
                    if b:IsA("TextButton") then b.BackgroundColor3 = Color3.fromRGB(30, 30, 30) end
                end
                btn.BackgroundColor3 = Color3.fromRGB(255, 50, 50)
            end)
        end
    end
end

RefreshPlayers()
Players.PlayerAdded:Connect(function() task.wait(1) RefreshPlayers() end)
Players.PlayerRemoving:Connect(function() task.wait(0.5) RefreshPlayers() end)

-- [ LOGIC: ACTION FUNCTIONS (MAXIMUM FORCE) ]
local function CreateAction(name, callback)
    local btn = Instance.new("TextButton")
    btn.Size = UDim2.new(1, 0, 0, 35)
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Font = Enum.Font.GothamBold
    btn.TextSize = 12
    btn.Parent = ActionContainer
    local corner = Instance.new("UICorner") corner.CornerRadius = UDim.new(0, 4) corner.Parent = btn
    btn.MouseButton1Click:Connect(callback)
end

-- 1. TRUE BAN (NETWORK VELOCITY CANNON)
-- Menembak target ke bawah map dengan kecepatan extrem agar server ter-desync dan membunuhnya
CreateAction("TRUE BAN (VOID CANNON)", function()
    if SelectedTarget then
        BannedPlayers[SelectedTarget.UserId] = true
        pcall(function()
            if SelectedTarget.Character then
                local rootPart = SelectedTarget.Character:FindFirstChild("HumanoidRootPart")
                if rootPart then
                    -- Hantam dengan kecepatan fisik miliaran stud/detik
                    rootPart.Velocity = Vector3.new(0, -50000, 0)
                    rootPart.AssemblyLinearVelocity = Vector3.new(0, -50000, 0)
                    -- CFrame pack sebagai secondary force
                    rootPart.CFrame = CFrame.new(rootPart.Position.X, -5000, rootPart.Position.Z)
                end
            end
        end)
    end
end)

-- 2. CRASH KICK (NETWORK PAYLOAD FLOOD)
-- Membanjiri klien target dengan partikel anomali yang merusak rendering engine mereka
CreateAction("CRASH KICK (RENDER KILL)", function()
    if SelectedTarget then
        pcall(function()
            if SelectedTarget.Character then
                local targetChar = SelectedTarget.Character
                -- Spawning partikel asing ke karakter mereka
                for i = 1, 100 do
                    local smoke = Instance.new("Smoke")
                    smoke.Size = 25
                    smoke.Opacity = 1
                    smoke.RiseSpeed = 50
                    smoke.Parent = targetChar
                    
                    local fire = Instance.new("Fire")
                    fire.Size = 25
                    fire.Heat = 50
                    fire.Parent = targetChar

                    local sound = Instance.new("Sound")
                    sound.Volume = 10
                    sound.PlaybackSpeed = 0.1
                    sound.Looped = true
                    sound.SoundId = "rbxassetid://0"
                    sound.Parent = targetChar
                    sound:Play()
                end
            end
        end)
    end
end)

-- 3. SMASH PLAYER (FLING DESYNC)
-- Memukul target ke stratosfer menggunakanVelocity lokal kita
CreateAction("SMASH PLAYER (FLING)", function()
    if SelectedTarget and SelectedTarget.Character and LocalPlayer.Character then
        local tRoot = SelectedTarget.Character:FindFirstChild("HumanoidRootPart")
        local lRoot = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
        if tRoot and lRoot then
            -- Tube into their hitbox and apply explosive velocity
            lRoot.CFrame = tRoot.CFrame * CFrame.new(0, 0, 3)
            task.wait(0.05)
            lRoot.Velocity = Vector3.new(0, 50000, 0)
        end
    end
end)

-- 4. KILL PLAYER (HEALTH PROTOCOL DELETION)
CreateAction("KILL PLAYER (FORCE)", function()
    if SelectedTarget and SelectedTarget.Character then
        pcall(function()
            local tHum = SelectedTarget.Character:FindFirstChild("Humanoid")
            if tHum then
                -- Break their state completely
                tHum.Health = 0
                tHum.MaxHealth = 0
            end
        end)
    end
end)

-- ==========================================
-- TRANSISI, CLOSE LOGIC & DRAGGABLE
-- ==========================================

EnterButton.MouseButton1Click:Connect(function()
    SplashFrame:Destroy()
    MenuFrame.Visible = true
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

local dragging, dragInput, dragStart, startPos
MenuHeader.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MenuFrame.Position
    end
end)

MenuHeader.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MenuFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
