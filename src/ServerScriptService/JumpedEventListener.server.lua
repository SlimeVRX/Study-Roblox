local Players = game:GetService("Players")

function playerJoined(player)
    -- Nested function
    local function characterAdded(character)
        -- Getting the Humanoid
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- Waiting for the Jumped123 event
            local Jumped123Event = humanoid:WaitForChild("Jumped123")

            -- Listening to custom event
            Jumped123Event.Event:Connect(function()
                print(player.Name .. " jumped!")
            end)

        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)