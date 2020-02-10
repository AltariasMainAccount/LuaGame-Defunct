-- import game libraries
local safestate = require 'states.aaa'
local defaults = require 'states.defaultstates'


-- import savefile and initiate certain variables -- 
local file = io.open("saveimport/saveimport.txt")
local tbllines = {}
local i = 0

-- overwrite the table --
if file then
    for line in file:lines() do
     i = i + 1
     tbllines[i] = line
    end
    file:close()
else
    error('file not found')
end

-- import safestate (tonumber if the value should be a number) --
safestate.username = tbllines[1]
safestate.currentMoney = tonumber(tbllines[2])
safestate.currentItem = tbllines[3]
safestate.currentArmor = tbllines[4]
safestate.currentAccessory = tbllines[5]
safestate.currentBuff = tbllines[6]
safestate.currentLevel = tonumber(tbllines[7])
safestate.currentEXP = tonumber(tbllines[8])
safestate.currentitemID = tonumber(tbllines[9])
safestate.currentArmorID = tonumber(tbllines[10])

-- reset variables --
safestate.currentDMG = defaults.playerDMG * safestate.currentitemID / 0.4
safestate.currentDEF = defaults.playerDEF * safestate.currentArmorID / 0.4
safestate.currentHP = 100 * safestate.currentArmorID / 1.2

-- go to main file --
dofile("game/game.lua")