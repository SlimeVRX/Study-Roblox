local Players = game:GetService("Players")

local function playerJoined(player)

    local function characterAdded(character)
        -- print(character.Name .. " has joined the game")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- Wait Jumped event
            local jumpedEvent = humanoid:WaitForChild("Jumped123")
            local timesJumped = humanoid:WaitForChild("TimesJumped")

            -- Listen to Jumped event
            jumpedEvent.Event:Connect(function()
                print(player.Name .. " has jumped " .. timesJumped:Invoke() .. " times")

                -- Calculating head size
                local headScale = math.floor(timesJumped:Invoke() / 5) + 1
                -- Changing head size
                local scaleValue = humanoid:FindFirstChild("HeadScale")
                if scaleValue ~= nil then
                    scaleValue.Value = headScale
                end
            end)
        end
    end

    player.CharacterAdded:Connect(characterAdded)
end

Players.PlayerAdded:Connect(playerJoined)