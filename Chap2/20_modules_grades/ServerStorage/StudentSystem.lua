local StudentSystem = {}

local MINIMUM_GRADE = 1
local MAXIMUM_GRADE = 10

local students = {
	{
		name = "William",
		class = "H1",
		["times late"] = 0,
		grades = {}
	},
	{
		name = "Sophie",
		class = "H1",
		["times late"] = 0,
		grades = {}
	},
}

function GetStudentInfo(studentName)
	for _, studentInfo in ipairs(students) do
		local currentStudentName = studentInfo["name"]
		if currentStudentName == studentName then
			return studentInfo
		end
	end
	warn("Student [" .. studentName .. "] does not exist.")
end

function isCorrectGrade(grade)
	if typeof(grade) == "number" then
		if grade >= MINIMUM_GRADE and grade <= MAXIMUM_GRADE then
			return true
		end
	end
end

function getGrades(studentName)
	local studentInfo = GetStudentInfo(studentName)
	if studentInfo ~= nil then
		return studentInfo.grades
	end
end

function StudentSystem:addGrade(studentName, grade)
	local grades = getGrades(studentName)
	if grades ~= nil then
		if isCorrectGrade(grade) then
			table.insert(grades, grade)
			print(grades)
			calculateAverage(studentName, grades)
		end
	end
end

function calculateAverage(studentName, grades)
	local sum = 0
	for i, grade in ipairs(grades) do
		sum = sum + grade
	end
	local average = sum / #grades
	print("Average " .. studentName .. " is " .. average)
end

return StudentSystem