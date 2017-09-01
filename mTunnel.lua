function TunnelSegment(repeats)
  --print("Segment")
  while (repeats > 0) do
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    turtle.turnLeft()
    turtle.dig()
    turtle.up()
    turtle.dig()
    turtle.turnRight()
    turtle.turnRight()
    turtle.dig()
    turtle.down()
    turtle.dig()
    turtle.turnLeft()
    repeats = repeats - 1;
  end
end

function SingleTunnel(l)
  --print("SingleTunnel")
  local l1 = l * 1;
  while (l1 > 0) do
    turtle.dig()
    turtle.forward()
    turtle.digUp()
    l1 = l1 - 1;
  end
  
  turtle.turnRight()
  turtle.turnRight()

  local l2 = l * 1;  
  while (l2 > 0) do
    turtle.forward()
    l2 = l2 - 1;
  end
end

function SideTunnel(length)
  --print("SideTunnel")
  turtle.turnLeft()
  turtle.forward()
  SingleTunnel(length)
  turtle.forward()
  turtle.forward()  
  SingleTunnel(length)
  turtle.forward()
  turtle.turnRight()    
end

function Fuellevel()
  print("Fuellevel is: " .. turtle.getFuelLevel())
  print("Wanna refuel? -> y/n")
  local answer = tostring(read())

  if (answer == "y") or (answer == "Y") then
    print("Place FUEL in Slot 1 and press ENTER!")
    local tmp = read()
    turtle.select(1)
    turtle.refuel()
    print("Turtle refuled. Fuellevel is: " .. turtle.getFuelLevel())
  end
end

function CheckFuel(minLevel)
  if turtle.getFuelLevel() < minLevel then
	print("Fuel is low (" .. turtle.getFuelLevel() .. ")")
	print("Place FUEL in Slot 1 and press ENTER!")
    local tmp = read()
    turtle.select(1)
    turtle.refuel()
    print("Turtle refuled. Fuellevel is: " .. turtle.getFuelLevel())
  end
end


local arg1, arg2 = ...;

term.clear()
print("Master's Strip-Miner - Beta 0.1")
print("")
print("Tunnel length: ".. arg1*3);
print("Corridor length: ".. arg2);

local rep = arg1 * 1;
local minFLevel

if arg3 == nil then
	minFLevel = 100
else 
  minFLevel = arg3 * 1;
end

Fuellevel()

while (rep > 0) do
  TunnelSegment(3)
  CheckFuel(minFLevel)
  SideTunnel(arg2*1)
  rep = rep - 1;
end

print("FERTIG")