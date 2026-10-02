local component = require('component')
local event = require('event')
local term = require('term')

local reactorSide = 4

local quadLabel = "Quad Fuel Rod (Uranium)"
local dualLabel = "Dual Fuel Rod (Uranium)"

local slotMap = {
  [12] = quadLabel,
  [20] = quadLabel,
  [28] = quadLabel,
  [2] = dualLabel,
  [10] = dualLabel,
  [21] = dualLabel
}

while true do

  term.clear()
  print('Scanning...')

  for slot,fuel in pairs(slotMap) do
    local stack = component.transposer.getStackInSlot(reactorSide,slot)

    if stack then
      print('Slot ' .. slot .. ': ' .. stack.label)
    else
      print('Slot ' .. slot .. ': Empty. Expected: ' .. fuel)
    end  
  end

  if event.pull(1) == 'interrupted' then
    print('Shutting down reacThor.')
    break
  end

end