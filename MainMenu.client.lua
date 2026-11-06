
-- MM2 REMAKE | BLACK x CRIMSON
-- Main Menu | Mobile / PC / Tablet

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "MM2MainMenu"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromScale(0.55, 0.65)
main.Position = UDim2.fromScale(0.225, 0.175)
main.BackgroundColor3 = Color3.fromRGB(12, 12, 15)
main.Parent = gui

Instance.new("UICorner", main).CornerRadius = UDim.new(0, 15)

local scale = Instance.new("UIScale")
scale.Scale = 1
scale.Parent = main

local outline = Instance.new("UIStroke")
outline.Color = Color3.fromRGB(200, 25, 45)
outline.Thickness = 2
outline.Parent = main

local function createLabel(text, size, pos, color)
    local label = Instance.new("TextLabel")
    label.Size = size
    label.Position = pos
    label.BackgroundTransparency = 1
    label.Text = text
    label.TextColor3 = color
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Parent = main
    return label
end

createLabel(
    "MURDER MYSTERY",
    UDim2.fromScale(0.9, 0.18),
    UDim2.fromScale(0.05, 0.05),
    Color3.fromRGB(220, 35, 55)
)

createLabel(
    "2 REMAKE",
    UDim2.fromScale(0.9, 0.1),
    UDim2.fromScale(0.05, 0.22),
    Color3.new(1, 1, 1)
)

local function createButton(text, y, callback)
    local button = Instance.new("TextButton")
    button.Size = UDim2.fromScale(0.65, 0.15)
    button.Position = UDim2.fromScale(0.175, y)
    button.BackgroundColor3 = Color3.fromRGB(35, 35, 42)
    button.Text = text
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextScaled = true
    button.Font = Enum.Font.GothamBold
    button.Parent = main

    Instance.new("UICorner", button).CornerRadius =
        UDim.new(0, 8)

    button.MouseEnter:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(180, 25, 45)
        }):Play()
    end)

    button.MouseLeave:Connect(function()
        TweenService:Create(button, TweenInfo.new(0.15), {
            BackgroundColor3 = Color3.fromRGB(35, 35, 42)
        }):Play()
    end)

    button.Activated:Connect(callback)

    return button
end

createButton("PLAY", 0.38, function()
    gui:Destroy()
    print("Play selected")
end)

createButton("SETTINGS", 0.56, function()
    print("Settings selected")
end)

createButton("CREDITS", 0.74, function()
    print("MM2 Remake | Created by You")
end)

print("MM2 Main Menu Loaded")
