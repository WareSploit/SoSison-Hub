local Navigation={}
local tabs={{"Sheriff","shield"},{"Murderer","swords"},{"Player","user"},{"Visuals","eye"},{"Farm","coins"},{"Teleport","map-pin"},{"Troll","smile"},{"Animations","person-standing"},{"Music","music"},{"Chat","messages-square"},{"SoSison Users","users"},{"Mobile","smartphone"},{"Config Hub","folder"},{"Settings","settings"},{"Server","server"}}
function Navigation.create(window)
 local created={}
 for _,item in ipairs(tabs) do created[item[1]]=window:Tab({Title=item[1],Icon=item[2]}) end
 return created
end
return Navigation
