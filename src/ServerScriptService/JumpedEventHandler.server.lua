-- Introduction to Events

local Players = game:GetService("Players")

function playerJoined(player)
    print(player.Name .. " has joined the game!")
end

Players.PlayerAdded:Connect(playerJoined)