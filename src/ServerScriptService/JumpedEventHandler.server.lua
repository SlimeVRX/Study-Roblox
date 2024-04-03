-- Introduction to Events

local Players = game:GetService("Players")

function findPlayer()
    -- Getting all players in the game
    local player = Players:GetPlayers()

    -- Looping through all players
    for i, player in ipairs(player) do
        print("Found player: " .. player.Name)
    end    
end

task.wait(1)
findPlayer()