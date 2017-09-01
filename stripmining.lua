-- VERSION: Beta 0.1
-- NAME: stripminig
-- AUTHOR: MC Masterps

local length = 0
local width = 0
local side = 0
local distance = 2

local posMat = 2
local posCoa = 1


function BasicLoop()
	local lengthT = length

	--turn left and move to side 
	turtle.turnLeft()
	local widthT = width
	repeat
		FW()
		widthT = widthT - 1
	until widthT == 0
	turtle.turnRight()

	repeat
		SmallUnit()
		print(lengthT)
		lengthT = lengthT - 1
	until lengthT == 0

	turtle.turnRight()
	widthT = width
	repeat
		FW()
		widthT = widthT - 1
	until widthT == 0
	turtle.turnLeft()

end

function MoveMainTunnel() 
	local widthTi = width * 2
	repeat
		FW()
		widthTi = widthTi - 1
	until widthTi == 0
end

function SmallUnit()
	local distanceLoc = distance	
	
	FW()
	turtle.turnRight()
	MoveMainTunnel() 	-- dig right
	turtle.turnLeft()
	FW()
	turtle.turnLeft()
	MoveMainTunnel() 	-- dig left
	SideTunnel()		-- left tunnel
	turtle.turnLeft()
	FW()
	turtle.turnRight()  
	MoveMainTunnel()	-- dig right
	SideTunnel()		-- right tunnel
	MoveMainTunnel()	-- move left 
	turtle.turnRight()

end

-- checks for blocks, falling blocks and digs/moves forward 
function FW()

	if (turtle.detect()) then
		repeat
			turtle.dig()
			sleep(0.5)
		until not turtle.detect()
	end
	
	turtle.forward()
	
	if (turtle.detectUp()) then
		repeat
			turtle.digUp()
			sleep(0) --test
		until not turtle.detectUp()
	end

	if (not turtle.detectDown()) then
		turtle.select(posMat)
		turtle.placeDown()
	end

end

function SideTunnel()

	local sidetunnel = side - 1
	local widthT = width
	local backWay = side + width - 1

	repeat 
		FW()
		widthT = widthT - 1
	until widthT == 0

	repeat
		FW()
		sidetunnel = sidetunnel - 1
	until sidetunnel == 0

	turtle.turnRight()
	turtle.turnRight()

	repeat
		FW()
		backWay = backWay - 1
	until backWay == 0
end

-- START

local input = 0
print("Welcome to >>Stripmining<< 'Version Beta 0.1'.")
repeat
	print("How many segments?")
	input = io.read()
until tonumber(input) > 0

length = tonumber(input)
print(length)

repeat
	print("Width of main tunnel (odd number eq.: 1, 3, 5, ...)?")
	input = io.read()
until tonumber(input) > 0

width = (tonumber(input) - 1) / 2

repeat
	print("Length of side tunnels?")
	input = io.read()
until tonumber(input) > 0

side = tonumber(input)

print("Fuel level is: " .. tostring(turtle.getFuelLevel()))
print("Place coal in slot " .. tostring(posCoa) .. " and hit enter to refuel.")
input = io.read()

turtle.select(posCoa)
turtle.refuel()

print("Place cobble or stone in slot " .. tostring(posMat) .. ".")
input = io.read()

print("STARTING")
BasicLoop()