-- SoSison Hub bootstrap
local OWNER = "YOUR_GITHUB_USERNAME" -- replace before publishing
local REPOSITORY = "SoSison-Hub"
local BRANCH = "main"
local BUILD_PATH = "dist/SoSisonHub.lua"
assert(OWNER ~= "YOUR_GITHUB_USERNAME", "Set your GitHub username in loader.lua")
local url = ("https://raw.githubusercontent.com/%s/%s/%s/%s"):format(OWNER, REPOSITORY, BRANCH, BUILD_PATH)
local ok, source = pcall(function() return game:HttpGet(url) end)
if not ok or type(source) ~= "string" or #source < 100 then
    error("[SoSison] Could not download GUI build. Check repo and dist path.")
end
local compile = loadstring or load
assert(compile, "[SoSison] This environment cannot load the bundled GUI.")
local chunk, err = compile(source)
assert(chunk, "[SoSison] GUI build compile error: " .. tostring(err))
return chunk()
