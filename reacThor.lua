local component = require('component')
local event = require('event')
local term = require('term')

local reactorSide = 4

local quadLabel = {
  live = "Quad Fuel Rod (Uranium)",
  depleted = "Quad Fuel Rod (Depleted Uranium)"
}
local dualLabel = {
  live = "Dual Fuel Rod (Uranium)",
  depleted = "Dual Fuel Rod (Depleted Uranium)"
}

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

    local msgPrefix = 'Slot ' .. slot .. ': '
    if stack then
      if stack.label == fuel.live then
        print(msgPrefix .. 'OK - ' .. stack.label)
      elseif stack.label == fuel.depleted then
        print(msgPrefix .. 'DEPLETED - ' .. stack.label)
      else
        print(msgPrefix .. 'WRONG - ' .. stack.label)
        -- Shutdown reactor - Give reacThor a few tries before shutting down. Implement a counter of invalid states.
      end
    else
      print(msgPrefix .. 'EMPTY. Expected: ' .. fuel.live)
      -- Shutdown
    end  
  end

  if event.pull(1) == 'interrupted' then
    print('Shutting down reacThor.')
    break
  end

end