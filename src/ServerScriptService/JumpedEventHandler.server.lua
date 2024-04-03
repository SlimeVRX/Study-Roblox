-- Introduction to Events

local Players = game:GetService("Players")

function playerJoined(player)
    -- Nested function
    local function characterAdded(character)
        print(character.Name .. " has spawned!")
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)