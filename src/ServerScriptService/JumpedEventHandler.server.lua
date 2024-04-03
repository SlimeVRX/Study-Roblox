-- Introduction to Events

local Players = game:GetService("Players")

function playerJoined(player)
    -- Nested function
    local function characterAdded(character)
        -- Getting the Humanoid
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- Total Jump Count
            local jumpCount = 0

            -- Getting custom events
            local jumpedEvent, timesJumped = createCustomEvents(humanoid)

            -- Listening to the Jump property
            humanoid:GetPropertyChangedSignal("Jump"):Connect(function()
                if humanoid.Jump then
                    -- Incrementing the jump count
                    jumpCount = jumpCount + 1

                    -- Firing custom event
                    jumpedEvent:Fire()
                end
            end)

            -- Callback for the timesJumped BindableFunction
            timesJumped.OnInvoke = function()
                return jumpCount
            end
        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

function createCustomEvents(humanoid)
    -- Creating Jump Event
    local jumpedEvent = Instance.new("BindableEvent")
    jumpedEvent.Name = "Jumped123"
    jumpedEvent.Parent = humanoid

    -- Times jumped bindablefunction
    local timesJumped = Instance.new("BindableFunction")
    timesJumped.Name = "TimesJumped123"
    timesJumped.Parent = humanoid

    -- Returing events
    return jumpedEvent, timesJumped
end

Players.PlayerAdded:Connect(playerJoined)