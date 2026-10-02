local component = require('component')
local machine = component.inventory_controller
local inv = 4

print('slots: ', machine.getInventorySize(inv))

for i=1, machine.getInventorySize(inv) do
  local stack = machine.getStackInSlot(inv, i)
  if stack and string.find(stack.label, "Fuel") then
    print(i, stack.label, stack.size, stack.damage)
  end
end