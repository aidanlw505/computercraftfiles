-- Load the busydrones library (assuming it's in the same directory)
os.loadAPI("computercraftfiles/busydrones")

-- Function to display the current direction
local function displayCurrentDirection()
    local currentDir = busydrones.getDirection()
    print("Current Direction: " .. currentDir)
end

-- Test setDirection and getDirection functions
function testDirectionFunctions()
    displayCurrentDirection()

    print("Setting direction to EAST...")
    busydrones.setDirection(DIRECTIONS.EAST)
    displayCurrentDirection()

    print("Setting direction to SOUTH...")
    busydrones.setDirection(DIRECTIONS.SOUTH)
    displayCurrentDirection()

    print("Setting direction to WEST...")
    busydrones.setDirection(DIRECTIONS.WEST)
    displayCurrentDirection()

    print("Setting direction to NORTH...")
    busydrones.setDirection(DIRECTIONS.NORTH)
    displayCurrentDirection()
end

-- Run the test
testDirectionFunctions()
