-- Introduction to Events

local Players = game:GetService("Players")

function findPlayer()
    local player = Players:FindFirstChildOfClass("Player")
    if player ~= nil then
        print("Found player: " .. player.Name)
    end
end

task.wait(5)
findPlayer()