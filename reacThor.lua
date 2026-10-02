local component = require('component')
local event = require('event')
local term = require('term')

local sucker = require('suck')

local reactorSide = 4
local quadSide = 3
local dualSide = 0
local disposalSide = 2

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

local scanInterval = 1
local failureThreshold = 5
local failureCounter = 0

while true do

  term.clear()

  local failure = false
  print('Scanning...')

  for slot,fuel in pairs(slotMap) do
    local stack = component.transposer.getStackInSlot(reactorSide,slot)

    local msgPrefix = 'Slot ' .. slot .. ': '
    if stack then
      if stack.label == fuel.live then
        print(msgPrefix .. 'OK - ' .. stack.label)
      elseif stack.label == fuel.depleted then
        print(msgPrefix .. 'DEPLETED - ' .. stack.label)
        print('Replacing...')
        sucker.suckItem(reactorSide,disposalSide,slot,1)
        local sourceSide
        if stack.label == quadLabel.depleted then
          sourceSide = quadSide
        elseif stack.label == dualLabel.depleted then
          sourceSide = dualSide
        end
        sucker.suckItem(sourceSide,reactorSide,1,slot)
        print('Replacement successful')
      else
        print(msgPrefix .. 'WRONG - ' .. stack.label .. ' - Expected: ' .. fuel.live)
        failure = true
      end
    else
      print(msgPrefix .. 'EMPTY - Expected: ' .. fuel.live)
      failure = true
    end  
  end

  if failureCounter >= 5 then
    print('Failure threshold (' .. failureThreshold .. ') reached. Commencing reactor shutdown...')
    -- shut down reactor
    print('Reactor shutdown completed')
    break
  end  

  if failure then
    failureCounter = failureCounter + 1
  else
    failureCounter = 0
  end

  if event.pull(scanInterval) == 'interrupted' then
    print('Shutting down reacThor.')
    break
  end

end