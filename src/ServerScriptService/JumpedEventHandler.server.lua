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

                    -- Change the character's color
                    changeCharacterColor(character)
                end
            end)
        end
    end

    -- Listen for the .characterAdded event
    player.CharacterAdded:Connect(characterAdded)
end

function changeCharacterColor(character)
    -- Random color
    local newColor = getRandomColor()

    -- Looping through all BaseParts in the character
    for _, basePart in ipairs(character:GetChildren()) do
        if basePart:IsA("BasePart") then
            basePart.Color = newColor
        end
    end
end

function getRandomColor()
    return Color3.fromRGB(
        math.random(0, 255),
        math.random(0, 255),
        math.random(0, 255)
    )
end

Players.PlayerAdded:Connect(playerJoined)