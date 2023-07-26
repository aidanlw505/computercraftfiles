local configFileName = "gps_hosting.cfg"
local startupFileName = "startup"

-- Function to serialize table data to a file
local function saveTableToFile(data, filename)
    local file = fs.open(filename, "w")
    if file then
        file.write(textutils.serializeJSON(data))
        file.close()
    else
        print("Error: Unable to open file for writing.")
    end
end

-- Function to deserialize table data from a file
local function loadTableFromFile(filename)
    if not fs.exists(filename) then return nil end

    local file = fs.open(filename, "r")
    if file then
        local data = textutils.unserializeJSON(file.readAll())
        file.close()
        return data
    else
        print("Error: Unable to open file for reading.")
    end
end

-- Function to set up GPS hosting
local function setupGPSHosting()
    print("GPS Hosting Setup")

    -- Check if the configuration file already exists
    local configData = loadTableFromFile(configFileName)
    if configData then
        print("GPS hosting is already configured.")
    else
        -- Prompt for coordinates and save to the configuration file
        print("Please enter the X, Y, and Z coordinates for this GPS host.")
        write("X: ")
        local x = tonumber(read())
        write("Y: ")
        local y = tonumber(read())
        write("Z: ")
        local z = tonumber(read())

        configData = {x = x, y = y, z = z}
        saveTableToFile(configData, configFileName)

        print("GPS hosting configuration saved.")
    end

    -- Check if the program is in the startup directory, and if not, install it
    if not fs.exists(startupFileName) then
        fs.copy(shell.getRunningProgram(), startupFileName)
        print("GPS hosting setup installed in the startup directory.")
    end

    -- Start the GPS hosting service
    local x, y, z = (configData and configData.x),
                    (configData and configData.y), (configData and configData.z)
    if x and y and z then
        print("Starting GPS hosting at X:" .. x .. ", Y:" .. y .. ", Z:" .. z)
        shell.run("gps", "host", x, y, z)
        print("GPS hosting service started.")
    else
        print("Error: GPS hosting configuration data is missing or invalid.")
    end
end

-- Run the setup function
setupGPSHosting()
