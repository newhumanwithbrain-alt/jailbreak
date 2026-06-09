-- [ SYXE JAILBREAK : GATEWAY UI + CORE PAYLOAD ]
-- Authored for Master MSTACLIPSE

local Players = game:GetService("Players")
local CoreGui = game:GetService("CoreGui")
local LocalPlayer = Players.LocalPlayer

-- Mencegah UI dobel jika di-execute berkali-kali
local existingUI = CoreGui:FindFirstChild("SyxeGatewayUI")
if existingUI then
    existingUI:Destroy()
end

-- [ SETUP MAIN GUI ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SyxeGatewayUI"
ScreenGui.Parent = CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false -- UI tidak hilang saat mati

-- ==========================================
-- BAGIAN 1: SPLASH SCREEN (KOTAK HITAM)
-- ==========================================
local SplashFrame = Instance.new("Frame")
SplashFrame.Size = UDim2.new(0, 400, 0, 200)
SplashFrame.Position = UDim2.new(0.5, -200, 0.5, -100)
SplashFrame.BackgroundColor3 = Color3.fromRGB(10, 10, 10) -- Hitam pekat
SplashFrame.BorderSizePixel = 2
SplashFrame.BorderColor3 = Color3.fromRGB(255, 0, 0) -- Border merah warning
SplashFrame.Parent = ScreenGui

local SplashCorner = Instance.new("UICorner")
SplashCorner.CornerRadius = UDim.new(0, 4)
SplashCorner.Parent = SplashFrame

-- Teks Warning
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

-- Tombol Enter
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
-- BAGIAN 2: MENU CHEATING (TERSEMBUNYI)
-- ==========================================
local MenuFrame = Instance.new("Frame")
MenuFrame.Size = UDim2.new(0, 300, 0, 250)
MenuFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MenuFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MenuFrame.BorderSizePixel = 0
MenuFrame.Visible = false -- Sembunyi di awal
MenuFrame.Parent = ScreenGui

local MenuCorner = Instance.new("UICorner")
MenuCorner.CornerRadius = UDim.new(0, 6)
MenuCorner.Parent = MenuFrame

-- Header Menu
local MenuHeader = Instance.new("TextLabel")
MenuHeader.Size = UDim2.new(1, 0, 0, 30)
MenuHeader.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
MenuHeader.TextColor3 = Color3.fromRGB(255, 255, 255)
MenuHeader.Text = "SYXE JAILBREAK | CORE"
MenuHeader.Font = Enum.Font.GothamBold
MenuHeader.TextSize = 12
MenuHeader.Parent = MenuFrame

-- Container Tombol Cheat
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -20, 1, -50)
ButtonContainer.Position = UDim2.new(0, 10, 0, 40)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MenuFrame

local Layout = Instance.new("UIGridLayout")
Layout.CellSize = UDim2.new(0, 125, 0, 40)
Layout.CellPadding = UDim2.new(0, 10, 0, 10)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = ButtonContainer

-- [ FUNGSI-FUNGSI CHEAT ]

-- Fungsi Pembuat Tombol
local function CreateCheatButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 11
    btn.Parent = ButtonContainer
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 4)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
end

-- 1. Ban Player (Membekukan target di udara)
CreateCheatButton("BAN PLAYER", function()
    pcall(function()
        local targetChar = LocalPlayer.Character
        if targetChar then
            local rootPart = targetChar:FindFirstChild("HumanoidRootPart")
            local humanoid = targetChar:FindFirstChild("Humanoid")
            if rootPart and humanoid then
                -- Anomali Fisika: Membuat karakter tidak bisa bergerak
                rootPart.Anchored = true
                humanoid.WalkSpeed = 0
                humanoid.JumpPower = 0
            end
        end
    end)
end)

-- 2. Kick Player (Disconnect diri sendiri - simulasi anti-cheat trigger)
CreateCheatButton("KICK PLAYER", function()
    LocalPlayer:Kick("\n[SYXE ANTI-CHEAT]\nAbnormal activity detected. Session terminated.")
end)

-- 3. Smash Player (Efek visual jatuh dari langit)
CreateCheatButton("SMASH PLAYER", function()
    pcall(function()
        local targetChar = LocalPlayer.Character
        if targetChar then
            local rootPart = targetChar:FindFirstChild("HumanoidRootPart")
            local humanoid = targetChar:FindFirstChild("Humanoid")
            if rootPart and humanoid then
                -- Teleport ke langit lalu jatuhkan dengan kecepatan tinggi
                rootPart.CFrame = rootPart.CFrame * CFrame.new(0, 150, 0)
                task.wait(0.5)
                rootPart.Velocity = Vector3.new(0, -500, 0)
            end
        end
    end)
end)

-- 4. Kill Player (Set health ke 0 langsung)
CreateCheatButton("KILL PLAYER", function()
    pcall(function()
        local targetChar = LocalPlayer.Character
        if targetChar then
            local humanoid = targetChar:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Health = 0
            end
        end
    end)
end)


-- ==========================================
-- LOGIKA TRANSISI UI
-- ==========================================
EnterButton.MouseButton1Click:Connect(function()
    -- Hancurkan Splash Screen
    SplashFrame:Destroy()
    
    -- Tampilkan Menu Cheat
    MenuFrame.Visible = true
end)

-- [ DRAGGABLE UI LOGIC ]
local dragging, dragInput, dragStart, startPos
MenuFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MenuFrame.Position
    end
end)

MenuFrame.InputEnded:Connect(function(input)
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
