local args = {...}
local component = require('component')

local side = tonumber(args[1])
local slot = tonumber(args[2])

while true do

  local stack = component.transposer.getStackInSlot(side,slot)

  if stack then
    print(stack.label, stack.size)
  else
    print('EMPTY')
  end

  os.sleep(1)

end