-- Check if github.lua exists in the root directory
if not fs.exists("github.lua") then
    -- Download github.lua using pastebin
    print("Downloading github.lua...")
    shell.run("pastebin", "get", "wPtGKMam", "github.lua")
    print("github.lua downloaded.")
end

-- Remove the existing 'computercraftfiles' folder if it exists
if fs.exists("computercraftfiles") and fs.isDir("computercraftfiles") then
    fs.delete("computercraftfiles")
end

-- Download the git repository to the 'computercraftfiles' folder
print("Downloading the git repository...")
shell.run("github", "aidanlw505", "computercraftfiles", "./", "./")
print("Git repository downloaded to 'computercraftfiles'.")
