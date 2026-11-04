-- Luau | Lighting.lua | ModuleScript | ReplicatedStorage/SoSisonHub/Features
local LightingFeature = {}

function LightingFeature.CreateTab(window, context)
    local config = context.Config
    local state = context.State
    local lighting = context.Lighting
    local notify = context.Notify

    local tab = window:Tab({
        Title = "Visuals",
        Icon = "eye",
    })

    tab:Section({ Title = "Local lighting preferences" })

    tab:Button({
        Title = "Daytime",
        Callback = function()
            lighting.ClockTime = config.Lighting.DayTime
            notify("Visuals", "Local daytime preference applied.")
        end,
    })

    tab:Button({
        Title = "Nighttime",
        Callback = function()
            lighting.ClockTime = config.Lighting.NightTime
            notify("Visuals", "Local nighttime preference applied.")
        end,
    })

    tab:Slider({
        Title = "Brightness",
        Step = 0.1,
        Value = {
            Min = config.Lighting.MinBrightness,
            Max = config.Lighting.MaxBrightness,
            Default = state.original_brightness,
        },
        Callback = function(value)
            lighting.Brightness = math.clamp(value, config.Lighting.MinBrightness, config.Lighting.MaxBrightness)
        end,
    })

    tab:Button({
        Title = "Restore original lighting",
        Callback = function()
            lighting.Brightness = state.original_brightness
            lighting.ClockTime = state.original_clock_time
            notify("Visuals", "Original local lighting restored.")
        end,
    })

    return tab
end

return LightingFeature
