
-- MM2 Mobile Remake
-- Device Selection Menu
-- Roblox Studio: LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local selectedDevice = nil

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "MM2DeviceMenu"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromScale(0.65, 0.55)
main.Position = UDim2.fromScale(0.175, 0.225)
main.BackgroundColor3 = Color3.fromRGB(15, 15, 18)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius =
    UDim.new(0, 16)

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(190, 25, 45)
stroke.Thickness = 2
stroke.Parent = main

local title = Instance.new("TextLabel")
title.Size = UDim2.fromScale(1, 0.22)
title.BackgroundTransparency = 1
title.Text = "MM2 REMAKE"
title.TextColor3 = Color3.fromRGB(255, 45, 65)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = main

local subtitle = Instance.new("TextLabel")
subtitle.Size = UDim2.fromScale(1, 0.12)
subtitle.Position = UDim2.fromScale(0, 0.2)
subtitle.BackgroundTransparency = 1
subtitle.Text = "SELECT YOUR DEVICE"
subtitle.TextColor3 = Color3.new(1, 1, 1)
subtitle.TextScaled = true
subtitle.Font = Enum.Font.Gotham
subtitle.Parent = main

local function createButton(text, position, device)
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromScale(0.27, 0.32)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Parent = main

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 10)

    button.MouseButton1Click:Connect(function()
        selectedDevice = device

        TweenService:Create(
            button,
            TweenInfo.new(0.2),
            {BackgroundColor3 = Color3.fromRGB(190, 25, 45)}
        ):Play()

        subtitle.Text = "Selected: " .. device

        task.wait(0.6)
        gui:Destroy()

        print("MM2 device selected:", selectedDevice)
    end)

    return button
end

createButton("MOBILE", UDim2.fromScale(0.04, 0.48), "Mobile")
createButton("PC", UDim2.fromScale(0.365, 0.48), "PC")
createButton("TABLET", UDim2.fromScale(0.69, 0.48), "Tablet")

print("MM2 Device Menu Loaded")
