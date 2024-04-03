-- Introduction to Events

local Players = game:GetService("Players")

function playerJoined(player)
    -- Nested function
    local function characterAdded(character)
        -- Getting the Humanoid
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- Listening to the Jump property
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump then
                    print(player.Name .. " jumped!")
                end
            end)
        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)