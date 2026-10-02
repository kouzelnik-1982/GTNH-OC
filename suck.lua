local component = require('component')
local transposer = component.transposer

local M = {
  suckItem = function(source, sink, sourceSlot, sinkSlot)
    return transposer.transferItem(source,sink,1,sourceSlot,sinkSlot)
  end
}

local args = {...}

return M