-- import game libraries
local safestate = require 'states.aaa'
local defaults = require 'states.defaultstates'
local file

-- import savefile and initiate certain variables -- 
math.randomseed(os.time())
CorruptFile = math.random(100)
if CorruptFile > 0 and CorruptFile <= 10 then
    file = io.open("saveimport/corruptedsaves/corrupted1.txt")
elseif CorruptFile >= 11 and CorruptFile <= 20 then
    file = io.open("saveimport/corruptedsaves/corrupted2.txt")
elseif CorruptFile >= 21 and CorruptFile <= 30 then
    file = io.open("saveimport/corruptedsaves/corrupted3.txt")
elseif CorruptFile >= 31 and CorruptFile <= 40 then
    file = io.open("saveimport/corruptedsaves/corrupted4.txt")
elseif CorruptFile >= 41 and CorruptFile <= 50 then
    file = io.open("saveimport/corruptedsaves/corrupted5.txt")
elseif CorruptFile >= 51 and CorruptFile <= 60 then
    file = io.open("saveimport/corruptedsaves/corrupted6.txt")
elseif CorruptFile >= 61 and CorruptFile <= 70 then
    file = io.open("saveimport/corruptedsaves/corrupted7.txt")
elseif CorruptFile >= 71 and CorruptFile <= 80 then
    file = io.open("saveimport/corruptedsaves/corrupted8.txt")
elseif CorruptFile >= 81 and CorruptFile <= 90 then
    file = io.open("saveimport/corruptedsaves/corrupted9.txt")
elseif CorruptFile >= 91 and CorruptFile <= 100 then
    file = io.open("saveimport/corruptedsaves/corrupted10.txt")
end

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
safestate.currentHP = safestate.currentHP * safestate.currentArmorID / 1.2

-- go to main file --
dofile("game/game.lua")