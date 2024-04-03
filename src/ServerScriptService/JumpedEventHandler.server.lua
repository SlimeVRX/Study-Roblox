-- Introduction to Events

local Players = game:GetService("Players")

function findPlayer(username)
    local player = Players:FindFirstChild(username)
    if player ~= nil then
        print("Found player: " .. player.Name)
    else
        print("Player not found " .. username)
    end
end

task.wait(5)
findPlayer("SlimeVRX00")