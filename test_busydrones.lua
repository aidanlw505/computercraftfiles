-- Load the busydrones library (assuming it's in the same directory)
os.loadAPI("computercraftfiles/busydrones.lua")

-- Function to display the current direction
local function displayCurrentDirection()
    local currentDir = busydrones.getDirection()
    print("Current Direction: " .. currentDir)
end

-- Test setDirection and getDirection functions
function testDirectionFunctions()
    displayCurrentDirection()

    print("Setting direction to EAST...")
    busydrones.setDirection("EAST")
    displayCurrentDirection()

    print("Setting direction to SOUTH...")
    busydrones.setDirection("SOUTH")
    displayCurrentDirection()

    print("Setting direction to WEST...")
    busydrones.setDirection("WEST")
    displayCurrentDirection()

    print("Setting direction to NORTH...")
    busydrones.setDirection("NORTH")
    displayCurrentDirection()
end

-- Run the test
testDirectionFunctions()
