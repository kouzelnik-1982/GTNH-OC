local component = require('component')
local redstone = component.redstone

local M = {
  emit = function(side, powerOn)
    local power
    if powerOn then
      power = 15
    else
      power = 0
    end
    return redstone.setOutput(side, power)
  end
}

return M