local component = require('component')
local machine = component.transposer

for side = 0,5 do
  print(side, machine.getInventorySize(side))
end