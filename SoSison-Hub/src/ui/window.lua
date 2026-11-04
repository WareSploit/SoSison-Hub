local Factory={}
function Factory.create(WindUI,Config)
 local window=WindUI:CreateWindow({Title=Config.Name,Author=Config.Game.." | v"..Config.Version,Folder="SoSisonHub",Icon="shield",Theme=Config.Theme,OpenButton={Enabled=true}})
 return {WindUI=WindUI,Window=window}
end
return Factory
