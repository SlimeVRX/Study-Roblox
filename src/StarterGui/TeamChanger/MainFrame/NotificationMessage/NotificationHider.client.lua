-- Scripted by Madpoint83

--[[
	NOTE:
		
	This script is provided as we are not explaining the functionality
	of this script within the book itself.
	Feel free to study this code yourself.
--]]

local message = script.Parent
local lastChange = 0

--

function update()
	-- Updating current change
	local currentTime = os.time()
	lastChange = currentTime
	
	task.spawn(function()
		-- Waiting before removing text
		task.wait(5)
		
		-- Checking if there was no change while waiting
		if lastChange == currentTime then
			-- Removing text
			message.Text = ""
		end
	end)
end

--

message:GetPropertyChangedSignal("Text"):Connect(update)