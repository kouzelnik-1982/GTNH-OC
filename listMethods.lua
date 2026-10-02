local component = require('component')
local machine = component.inventory_controller

for k,v in pairs(component.methods(machine.address)) do print(k,v) end
