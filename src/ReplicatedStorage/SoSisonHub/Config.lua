-- Luau | Config.lua | ModuleScript | ReplicatedStorage/SoSisonHub
local Config = {
    Name = "SoSison Hub",
    Developer = "SoSison Prime",
    Version = "0.2.0",
    Theme = "Dark",
    WindowSize = Vector2.new(620, 460),
    Audio = {
        DefaultVolume = 0.5,
        MaxAssetIdLength = 20,
    },
    Lighting = {
        MinBrightness = 0,
        MaxBrightness = 5,
        DayTime = 14,
        NightTime = 0,
    },
}

return table.freeze(Config)
