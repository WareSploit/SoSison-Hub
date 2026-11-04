local Cleanup={}; Cleanup.__index=Cleanup
function Cleanup.new() return setmetatable({items={}},Cleanup) end
function Cleanup:Add(item) table.insert(self.items,item); return item end
function Cleanup:Destroy()
 for i=#self.items,1,-1 do local x=self.items[i]; if typeof(x)=="RBXScriptConnection" then x:Disconnect() elseif type(x)=="function" then pcall(x) elseif x and x.Destroy then pcall(function() x:Destroy() end) end end
 table.clear(self.items)
end
return Cleanup
