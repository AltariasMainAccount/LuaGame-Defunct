-- vars --
local safestate = require 'states.aaa'
local level = {}

local function levelup()
    levelup = "declarepls"
    level = safestate.currentLevel
    EXP = safestate.currentEXP
    if battleOver == 1 then
        safestate.currentEXP = EXP + 10
        if EXP >= 100 then
            print("Level Up!")
            safestate.currentLevel = level + 1
            print("New Level: "..safestate.currentLevel.."")
            EXP = 0
            safestate.currentEXP = EXP
        else
            print("Your Experience Points are "..safestate.currentEXP.."/100")
        end
    end
end

level.levelup = levelup

return level