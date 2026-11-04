local SafeCallback={}
function SafeCallback.wrap(label,callback,notify)
 return function(...)
  local ok,result=pcall(callback,...)
  if not ok then warn(("[SoSison] %s failed: %s"):format(label,tostring(result))); if notify then notify({Title="SoSison Hub",Content=label.." failed.",Duration=4}) end end
  return ok,result
 end
end
return SafeCallback
