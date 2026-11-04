-- SoSison Hub | MM2
local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua"))()
local Config = require(script.Parent.config)
local WindowFactory = require(script.Parent.ui.window)
local app = WindowFactory.create(WindUI, Config)
require(script.Parent.ui.navigation).create(app.Window)
app.WindUI:Notify({Title=Config.Name, Content="Interface initialized.", Duration=4})
return app
