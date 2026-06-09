-- [ SYXE JAILBREAK : CORE PAYLOAD ]
-- Host file ini di GitHub/Pastebin, load via Loader

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- [ UI SETUP ]
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SyxeJailbreakUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local MainFrame = Instance.new("Frame")
MainFrame.Size = UDim2.new(0, 450, 0, 300)
MainFrame.Position = UDim2.new(0.5, -225, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

-- [ HEADER ]
local Header = Instance.new("TextLabel")
Header.Size = UDim2.new(1, 0, 0, 40)
Header.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
Header.TextColor3 = Color3.fromRGB(255, 50, 50) -- Warna Tema
Header.Text = "SYXE JAILBREAKING | USE AT YOUR OWN RISK"
Header.Font = Enum.Font.GothamBold
Header.TextSize = 14
Header.Parent = MainFrame

-- [ DISCLAIMER ]
local Disclaimer = Instance.new("TextLabel")
Disclaimer.Size = UDim2.new(1, 0, 0, 20)
Disclaimer.Position = UDim2.new(0, 0, 0, 40)
Disclaimer.BackgroundTransparency = 1
Disclaimer.TextColor3 = Color3.fromRGB(255, 255, 255)
Disclaimer.Text = "DEVELOPER: SYXE17 | IDEAS: QYREEEN | WE DONATE TO ORPHANAGES"
Disclaimer.Font = Enum.Font.Gotham
Disclaimer.TextSize = 10
Disclaimer.Parent = MainFrame

-- [ MENU BUTTONS CONTAINER ]
local ButtonContainer = Instance.new("Frame")
ButtonContainer.Size = UDim2.new(1, -20, 1, -80)
ButtonContainer.Position = UDim2.new(0, 10, 0, 65)
ButtonContainer.BackgroundTransparency = 1
ButtonContainer.Parent = MainFrame

local Layout = Instance.new("UIGridLayout")
Layout.CellSize = UDim2.new(0, 130, 0, 40)
Layout.CellPadding = UDim2.new(0, 10, 0, 10)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.Parent = ButtonContainer

-- [ FUNCTIONALITY LAYER ]

-- Fungsi Pembuat Tombol
local function CreateFeatureButton(name, callback)
    local btn = Instance.new("TextButton")
    btn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
    btn.TextColor3 = Color3.fromRGB(255, 255, 255)
    btn.Text = name
    btn.Font = Enum.Font.GothamSemibold
    btn.TextSize = 12
    btn.Parent = ButtonContainer
    
    local btnCorner = Instance.new("UICorner")
    btnCorner.CornerRadius = UDim.new(0, 6)
    btnCorner.Parent = btn

    btn.MouseButton1Click:Connect(callback)
end

-- [ FITUR JAILBREAK ]

-- 1. Vehicle Speed Multiplier
local speedActive = false
CreateFeatureButton("Vehicle Speed [ON/OFF]", function()
    speedActive = not speedActive
    if speedActive then
        -- Hooking Vehicle Controller
        local oldNamecall
        oldNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
            local method = getnamecallmethod()
            if method == "SetAttribute" and self:IsA("VehicleSeat") then
                -- Logika modifikasi kecepatan roda/torsi (conceptual)
            end
            return oldNamecall(self, ...)
        end))
    else
        -- Restore hooks
    end
end)

-- 2. Teleport to Jewelry
CreateFeatureButton("TP: Jewelry", function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        -- Koordinat standar Jewelry Store Jailbreak
        char.HumanoidRootPart.CFrame = CFrame.new(142, 20, 1360)
    end
end)

-- 3. Teleport to Bank
CreateFeatureButton("TP: Bank", function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("HumanoidRootPart") then
        -- Koordinat standar Bank Jailbreak
        char.HumanoidRootPart.CFrame = CFrame.new(32, 20, 820)
    end
end)

-- 4. Infinite Nitro
local nitroActive = false
CreateFeatureButton("Infinite Nitro [ON/OFF]", function()
    nitroActive = not nitroActive
    if nitroActive then
        -- Force overwrite NO2 attribute jika ada
        spawn(function()
            while nitroActive and task.wait(0.1) do
                local vehicle = LocalPlayer.Character and LocalPlayer.Character:FindFirstChildWhichIsA("VehicleSeat")
                if vehicle then
                    vehicle:SetAttribute("Nitro", 100)
                end
            end
        end)
    end
end)

-- 5. Walkspeed Modifier
CreateFeatureButton("WalkSpeed 50", function()
    local char = LocalPlayer.Character
    if char and char:FindFirstChild("Humanoid") then
        char.Humanoid.WalkSpeed = 50
    end
end)

-- [ DRAGGABLE UI LOGIC ]
local dragging, dragInput, dragStart, startPos
MainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = MainFrame.Position
    end
end)

MainFrame.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = false
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragging and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        MainFrame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
