-- import game libraries
local safestate = require 'states.aaa'
local dmg = require 'var.dmg'
local file

-- import savefile and initiate certain variables -- 
math.randomseed(os.time())
corruptFile = math.random(100)
if corruptFile > 0 and corruptFile <= 10 then
    file = io.open("saveimport/corruptedsaves/corrupted1.txt")
elseif corruptFile >= 11 and corruptFile <= 20 then
    file = io.open("saveimport/corruptedsaves/corrupted2.txt")
elseif corruptFile >= 21 and corruptFile <= 30 then
    file = io.open("saveimport/corruptedsaves/corrupted3.txt")
elseif corruptFile >= 31 and corruptFile <= 40 then
    file = io.open("saveimport/corruptedsaves/corrupted4.txt")
elseif corruptFile >= 41 and corruptFile <= 50 then
    file = io.open("saveimport/corruptedsaves/corrupted5.txt")
elseif corruptFile >= 51 and corruptFile <= 60 then
    file = io.open("saveimport/corruptedsaves/corrupted6.txt")
elseif corruptFile >= 61 and corruptFile <= 70 then
    file = io.open("saveimport/corruptedsaves/corrupted7.txt")
elseif corruptFile >= 71 and corruptFile <= 80 then
    file = io.open("saveimport/corruptedsaves/corrupted8.txt")
elseif corruptFile >= 81 and corruptFile <= 90 then
    file = io.open("saveimport/corruptedsaves/corrupted9.txt")
elseif corruptFile >= 91 and corruptFile <= 100 then
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
safestate.currentDMG = dmg.playerDMG * safestate.currentitemID / 0.4
safestate.currentDEF = dmg.playerDEF * safestate.currentArmorID / 0.4
safestate.currentHP = safestate.currentHP * safestate.currentArmorID / 1.2

-- go to main file --
dofile("game/game.lua")