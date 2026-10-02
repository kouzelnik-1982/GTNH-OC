local args = {...}
local component = require('component')
local machine = component.transposer

local inv = tonumber(args[1])

local invSize = machine.getInventorySize(inv)

if invSize then
  print('slots: ', invSize)

  for i=1, invSize do
    local stack = machine.getStackInSlot(inv, i)
    if stack and string.find(stack.label, "Fuel") then
      print(i, stack.label, stack.size, stack.damage)
    elseif not stack then
      print(i, "EMPTY")
    end
  end
else
  print('No inventory found.')
end