-- Luau | Audio.lua | ModuleScript | ReplicatedStorage/SoSisonHub/Features
local SoundService = game:GetService("SoundService")

local AudioFeature = {}

local function stop_current(state)
    local sound = state.current_sound
    if sound then
        state:SetSound(nil)
        sound:Stop()
        sound:Destroy()
    end
end

local function parse_asset_id(value, max_length)
    local text = tostring(value or "")
    if #text == 0 or #text > max_length or not text:match("^%d+$") then
        return nil
    end
    return text
end

function AudioFeature.CreateTab(window, context)
    local state = context.State
    local config = context.Config
    local notify = context.Notify

    local tab = window:Tab({
        Title = "Audio",
        Icon = "volume-2",
    })

    local asset_id = ""

    tab:Section({ Title = "Authorized Roblox audio" })

    tab:Input({
        Title = "Audio asset ID",
        Placeholder = "Numeric asset ID",
        Callback = function(value)
            asset_id = tostring(value or "")
        end,
    })

    tab:Slider({
        Title = "Volume",
        Step = 0.05,
        Value = {
            Min = 0,
            Max = 1,
            Default = state.volume,
        },
        Callback = function(value)
            state.volume = math.clamp(value, 0, 1)
            if state.current_sound then
                state.current_sound.Volume = state.volume
            end
        end,
    })

    tab:Button({
        Title = "Play",
        Callback = function()
            local id = parse_asset_id(asset_id, config.Audio.MaxAssetIdLength)
            if not id then
                notify("Audio", "Enter digits only for a valid asset ID.")
                return
            end

            stop_current(state)

            local sound = Instance.new("Sound")
            sound.Name = "SoSisonHub_Audio"
            sound.SoundId = "rbxassetid://" .. id
            sound.Volume = state.volume
            sound.Looped = false
            sound.Parent = SoundService

            state:SetSound(sound)
            sound:Play()
            notify("Audio", "Playback requested. Asset permissions apply.")
        end,
    })

    tab:Button({
        Title = "Stop",
        Callback = function()
            stop_current(state)
            notify("Audio", "Playback stopped.")
        end,
    })

    return tab
end

return AudioFeature
