local State={Values={}}
function State.Set(key,value) State.Values[key]=value end
function State.Get(key,default) local v=State.Values[key]; if v==nil then return default end; return v end
return State
