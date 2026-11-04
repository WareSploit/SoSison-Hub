local Format={}
function Format.Number(v) return tostring(math.floor(tonumber(v) or 0)) end
return Format
