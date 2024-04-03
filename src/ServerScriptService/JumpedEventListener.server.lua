local Players = game:GetService("Players")

function playerJoined(player)
    -- Nested function
    local function characterAdded(character)
        -- Getting the Humanoid
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- Waiting for the Jumped123 event
            local JumpedEvent123 = humanoid:WaitForChild("Jumped123")
            local timesJumpedEvent123 = humanoid:WaitForChild("TimesJumped123")

            -- Listening to custom event
            JumpedEvent123.Event:Connect(function()
                -- Printing the amount of times the player jumped                
                print(player.Name .. " jumped! " .. timesJumpedEvent123:Invoke() .. " times!")
            end)
        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)