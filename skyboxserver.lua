local ReplicatedStorage = game:GetService("ReplicatedStorage")
local skyRemote = ReplicatedStorage:WaitForChild("ChangeSkybox")

-- GUI Setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0

-- Title label (your shoutout)
local title = Instance.new("TextLabel", frame)
title.Size = UDim2.new(1, 0, 0, 30)
title.Position = UDim2.new(0, 0, 0, 0)
title.BackgroundTransparency = 1
title.Text = "FUCKING MADE BY ADAM!"
title.TextColor3 = Color3.fromRGB(255, 0, 0)
title.Font = Enum.Font.Arcade
title.TextScaled = true
title.TextStrokeTransparency = 0
title.TextStrokeColor3 = Color3.new(0,0,0)

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0, 40)
textbox.Position = UDim2.new(0, 10, 0, 40)
textbox.PlaceholderText = "Enter Skybox ID (numbers only)"
textbox.Text = ""
textbox.TextScaled = true
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.new(1, 1, 1)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 90)
button.Text = "Change Skybox"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
button.TextColor3 = Color3.new(1,1,1)

button.MouseButton1Click:Connect(function()
    local id = textbox.Text:match("%d+")
    if id then
        skyRemote:FireServer(id)
    else
        textbox.Text = "❌ Invalid ID!"
    end
end)
