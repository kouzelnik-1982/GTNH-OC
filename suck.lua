local component = require('component')
local transposer = component.transposer

local M = {
  suckItem = function(source, sink, sourceSlot, sinkSlot)
    return transposer.transferItem(source,sink,1,sourceSlot,sinkSlot)
  end
}

local args = {...}

return M




LSC
IV 8A energy hatch (in)
IV Buff Dynamo (out)

Reactor
Pump HV
Large SS Pipes

LHE
In Hatch LV
Out Hatch LV
Out Hatch IV

Turbines
6x Buff Dynamo Hatch IV

DT

10x P2P Tunnel
6x Large HSS-E Turbine