-- Luau | SoSisonHub.client.lua | LocalScript | StarterPlayerScripts
-- In-experience bootstrap. Requires ModuleScripts mapped by Rojo.
local Players = game:GetService("Players")
local Lighting = game:GetService("Lighting")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
if not player then
    error("[SoSison Hub] LocalPlayer unavailable; this must run as a LocalScript.")
end

local hub_folder = ReplicatedStorage:WaitForChild("SoSisonHub", 15)
if not hub_folder then
    error("[SoSison Hub] ReplicatedStorage.SoSisonHub missing. Check Rojo sync.")
end

local function require_module(parent, name)
    local module = parent:WaitForChild(name, 10)
    if not module or not module:IsA("ModuleScript") then
        error(string.format("[SoSison Hub] ModuleScript '%s' missing under %s", name, parent:GetFullName()))
    end
    return require(module)
end

local Config = require_module(hub_folder, "Config")
local Core = hub_folder:WaitForChild("Core")
local Features = hub_folder:WaitForChild("Features")
local UI = hub_folder:WaitForChild("UI")

local Logger = require_module(Core, "Logger")
local StateClass = require_module(Core, "State")
local AudioFeature = require_module(Features, "Audio")
local LightingFeature = require_module(Features, "Lighting")
local WindowUI = require_module(UI, "Window")

local wind_ui_module = ReplicatedStorage:WaitForChild("WindUI", 15)
if not wind_ui_module or not wind_ui_module:IsA("ModuleScript") then
    error("[SoSison Hub] Add the WindUI ModuleScript to ReplicatedStorage.")
end

local WindUI = require(wind_ui_module)
local State = StateClass.new(Config, Lighting)

local function notify(title, content)
    WindUI:Notify({
        Title = title,
        Content = content,
        Duration = 3,
    })
end

local context = {
    Player = player,
    Config = Config,
    State = State,
    Lighting = Lighting,
    WindUI = WindUI,
    Notify = notify,
}

local ok, result = pcall(function()
    local window = WindowUI.Create(context)
    LightingFeature.CreateTab(window, context)
    AudioFeature.CreateTab(window, context)

    local settings = window:Tab({
        Title = "Settings",
        Icon = "settings",
    })

    settings:Section({ Title = "Session" })
    settings:Paragraph({
        Title = "About",
        Desc = Config.Name .. "\n" .. Config.Developer .. "\nVersion " .. Config.Version,
    })

    settings:Button({
        Title = "Restore defaults",
        Callback = function()
            Lighting.Brightness = State.original_brightness
            Lighting.ClockTime = State.original_clock_time
            State.volume = Config.Audio.DefaultVolume
            State:Destroy()
            notify(Config.Name, "Local settings restored.")
        end,
    })

    if window.SelectTab then
        window:SelectTab(1)
    end

    return window
end)

if not ok then
    Logger.Error("Startup failed:", result)
    error(result)
end

Logger.Info("Initialized", Config.Name, "v" .. Config.Version, "for", player.Name)
notify(Config.Name, "Hub initialized.")
