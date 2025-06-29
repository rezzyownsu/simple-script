-- GUI that sends skybox ID to server
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local skyRemote = ReplicatedStorage:WaitForChild("ChangeSkybox")

-- GUI setup
local screenGui = Instance.new("ScreenGui", game.CoreGui)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 150)
frame.Position = UDim2.new(0.5, -150, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(30,30,30)
frame.BorderSizePixel = 0

local textbox = Instance.new("TextBox", frame)
textbox.Size = UDim2.new(1, -20, 0, 40)
textbox.Position = UDim2.new(0, 10, 0, 10)
textbox.PlaceholderText = "Enter Skybox ID (numbers only)"
textbox.Text = ""
textbox.TextScaled = true
textbox.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
textbox.TextColor3 = Color3.new(1, 1, 1)

local button = Instance.new("TextButton", frame)
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 60)
button.Text = "Change Skybox"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(70, 0, 100)
button.TextColor3 = Color3.new(1,1,1)

-- On button press
button.MouseButton1Click:Connect(function()
    local id = textbox.Text:match("%d+")
    if id then
        skyRemote:FireServer(id)
    else
        textbox.Text = "❌ Invalid ID!"
    end
end)
