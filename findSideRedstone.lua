local component = require('component')
local machine = component.redstone

for side = 0,5 do
  print(side, machine.getInput(side))
end