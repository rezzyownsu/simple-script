-- Server-side receiver (for skybox change)

local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Create remote event if it doesn't exist
local skyRemote = ReplicatedStorage:FindFirstChild("ChangeSkybox") or Instance.new("RemoteEvent", ReplicatedStorage)
skyRemote.Name = "ChangeSkybox"

skyRemote.OnServerEvent:Connect(function(player, skyId)
    local Lighting = game:GetService("Lighting")

    -- Remove old skybox
    for _, v in pairs(Lighting:GetChildren()) do
        if v:IsA("Sky") then
            v:Destroy()
        end
    end

    -- Create new one with user input
    local sky = Instance.new("Sky")
    for _, face in pairs({"Bk","Dn","Ft","Lf","Rt","Up"}) do
        sky["Skybox"..face] = "rbxassetid://"..skyId
    end
    sky.Parent = Lighting
end)
