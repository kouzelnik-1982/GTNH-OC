local component = require('component')
local transposer = component.transposer

local M = {
  suckItem = function(source, sink, sourceSlot, sinkSlot)
    return transposer.transferItem(source,sink,1,sourceSlot,sinkSlot)
  end
}

local args = {...}

if #args > 0 then
  local source = tonumber(args[1])
  local sink = tonumber(args[2])
  local sourceSlot = tonumber(args[3])
  local sinkSlot = tonumber(args[4])

  local moved, reason = M.suckItem(source,sink,sourceSlot,sinkSlot)

  print('moved:', moved)
  print('reason:', reason)
end


return M