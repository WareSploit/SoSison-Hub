-- Luau | Logger.lua | ModuleScript | ReplicatedStorage/SoSisonHub/Core
local Logger = {}

local PREFIX = "[SoSison Hub]"

local function format_message(level, ...)
    local parts = table.create(select("#", ...))
    for index = 1, select("#", ...) do
        parts[index] = tostring(select(index, ...))
    end
    return string.format("%s [%s] %s", PREFIX, level, table.concat(parts, " "))
end

function Logger.Info(...)
    print(format_message("INFO", ...))
end

function Logger.Warn(...)
    warn(format_message("WARN", ...))
end

function Logger.Error(...)
    warn(format_message("ERROR", ...))
end

return table.freeze(Logger)
