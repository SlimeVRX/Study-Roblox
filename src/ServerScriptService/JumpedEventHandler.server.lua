-- Events

local Players = game:GetService("Players")

local function playerJoined(player)
    local function characterAdded(character)
        -- print(character.Name .. " has joined the game")
        local humanoid = character:FindFirstChildOfClass("Humanoid")
        if humanoid ~= nil then
            -- print(character.Name .. " has lived")
            local totalJumps = 0

            -- Getting events
            local jumpedEvent, timesJumped = createCustomEvents(humanoid)

            local function characterJumped()
                if humanoid.Jump == true then
                    -- Increment totalJumps
                    totalJumps = totalJumps + 1

                    -- print(character.Name .. " has jumped")
                    -- changeCharacterColor(character)
                    jumpedEvent:Fire()
                end
            end
            humanoid:GetPropertyChangedSignal("Jump"):Connect(characterJumped)
            
            -- Callback for the times jumped bindablefunction
            timesJumped.OnInvoke = function()
                return totalJumps
            end

        end
    end

    player.CharacterAdded:Connect(characterAdded)
end

function createCustomEvents(humanoid)
    -- Create Custom Event
    local jumpedEvent = Instance.new("BindableEvent")
    jumpedEvent.Name = "Jumped123"
    jumpedEvent.Parent = humanoid

    -- Times jumped bindablefunction
    local timesJumped = Instance.new("BindableFunction")
    timesJumped.Name = "TimesJumped"
    timesJumped.Parent = humanoid

    return jumpedEvent, timesJumped
end

function changeCharacterColor(character)
    local color = getRandomColor()
    for _, part in pairs(character:GetChildren()) do
        if part:IsA("BasePart") then
            part.BrickColor = BrickColor.new(color)
        end
    end
end

function getRandomColor()
    local r = math.random(0, 255)
    local g = math.random(0, 255)
    local b = math.random(0, 255)
    return Color3.fromRGB(r, g, b)
end

Players.PlayerAdded:Connect(playerJoined)