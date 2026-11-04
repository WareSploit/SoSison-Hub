-- Luau | State.lua | ModuleScript | ReplicatedStorage/SoSisonHub/Core
local State = {}
State.__index = State

function State.new(config, lighting)
    return setmetatable({
        version = config.Version,
        developer = config.Developer,
        volume = config.Audio.DefaultVolume,
        current_sound = nil,
        original_brightness = lighting.Brightness,
        original_clock_time = lighting.ClockTime,
        destroyed = false,
    }, State)
end

function State:SetSound(sound)
    self.current_sound = sound
end

function State:Destroy()
    self.destroyed = true
    if self.current_sound then
        self.current_sound:Stop()
        self.current_sound:Destroy()
        self.current_sound = nil
    end
end

return State
