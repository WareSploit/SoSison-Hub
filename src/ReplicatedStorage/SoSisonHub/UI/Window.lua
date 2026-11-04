-- Luau | Window.lua | ModuleScript | ReplicatedStorage/SoSisonHub/UI
local WindowUI = {}

function WindowUI.Create(context)
    local WindUI = context.WindUI
    local config = context.Config
    local notify = context.Notify

    local window = WindUI:CreateWindow({
        Title = config.Name,
        Icon = "command",
        Author = config.Developer,
        Folder = "SoSisonHub",
        Size = UDim2.fromOffset(config.WindowSize.X, config.WindowSize.Y),
        Transparent = true,
        Theme = config.Theme,
        Resizable = true,
        SideBarWidth = 190,
        ScrollBarEnabled = true,
    })

    window:Tag({
        Title = "v" .. config.Version,
        Color = Color3.fromRGB(125, 95, 220),
    })

    local home = window:Tab({
        Title = "Home",
        Icon = "house",
    })

    home:Section({ Title = "Dashboard" })
    home:Paragraph({
        Title = config.Name,
        Desc = "Developer: " .. config.Developer
            .. "\nVersion: " .. config.Version
            .. "\nModular Luau build",
    })

    home:Button({
        Title = "System status",
        Callback = function()
            notify(config.Name, "Interface initialized.")
        end,
    })

    return window
end

return WindowUI
