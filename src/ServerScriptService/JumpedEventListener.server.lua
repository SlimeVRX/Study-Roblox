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
                -- Changing head size
                local headScale = math.floor(timesJumpedEvent123:Invoke() / 5) + 1
                local scaleValue = humanoid:FindFirstChild("HeadScale")
                if scaleValue ~= nil then
                    scaleValue.Value = headScale
                end
            end)
        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)