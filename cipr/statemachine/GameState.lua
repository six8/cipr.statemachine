--[[
A convenient class to manage a game's states and transitions.

Based on https://github.com/kikito/stateful.lua
]]--

local cipr = require 'cipr'
local class = cipr.import 'cipr.class'
local Stateful = cipr.import 'stateful_lua/stateful'

local GameState = class.class('cipr.statemachine.GameState'):include(Stateful)

function GameState:initialize() 
    local lastTime = system.getTimer()
    local function enterFrame(event)
        -- Add deltaTime into event
        event.deltaTime, lastTime = event.time - lastTime, event.time
        self:enterFrame(event)
    end

    Runtime:addEventListener('enterFrame', enterFrame)
end

function GameState:enterFrame(event)

end

return GameState