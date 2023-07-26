---@diagnostic disable: unused-function, unused-local
DIRECTIONS = {
    NORTH = 0, -- Positive Z
    EAST = 1, -- Positive X
    SOUTH = 2, -- Negative Z
    WEST = 3 -- Negative X
}

function setDirection(direction)
    if currentDirection == nil then currentDirection = getDirection() end

    local ddirection = (direction - currentDirection) % 4

    if ddirection == 0 then
        return
    elseif ddirection == 1 then
        turtle.turnLeft()
        return
    elseif ddirection == 2 then
        turtle.turnRight()
        return
    else
        turtle.turnRight()
        turtle.turnRight()
        return
    end
end

function getDirection()
    -- turn right until there is no block in front of you,
    -- if you are surrounded by blocks, break the one in front
    for i = 1, 5, 1 do if turtle.detect() then turtle.turnRight() end end

    local oldX, _, oldZ = gps.locate()
    turtle.forward()
    local newX, _, newZ = gps.locate()
    turtle.back()

    local dx = newX - oldX
    local dz = newZ - oldZ

    if dx > 0 then
        return DIRECTIONS.NORTH
    elseif dx < 0 then
        return DIRECTIONS.SOUTH
    elseif dz > 0 then
        return DIRECTIONS.EAST
    else
        return DIRECTIONS.WEST
    end
end

local function mineArea(x, y, z, dir, w, d, h) end

local function mineForward() end

-- local function deforestArea()
--
-- end
--
-- local function buildStructures()
--
-- end
--
-- local function harvestCrops()
--
-- end
--
-- local function returnHome()
--
-- end
--
-- local function refuelTurtle()
--
-- end
--
-- local function retreiveChest()
--
-- end
