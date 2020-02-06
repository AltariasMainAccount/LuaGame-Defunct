local hp = require 'var.hp'
local dmg = require 'var.dmg'
local items = require 'var.item'
local armor = require 'var.armor'

local savestate = {
    username = "[REDACTED]",
    currentMoney = 0,
    currentItem = "None",
    currentArmor = "None",
    currentAccessory = "None",
    currentBuff = "None",
    currentLevel = 1,
    currentEXP = 0,
    currentitemID = 1,
    currentArmorID = 1,
    currentDMG = nil,
    currentDEF = nil,
    currentMP = 100,
    currentUP = 0,
}

savestate.currentDMG = dmg.playerDMG * savestate.currentitemID / 0.4
savestate.currentDEF = dmg.playerDEF * savestate.currentArmorID / 0.4
savestate.currentHP = 100 * savestate.currentArmorID / 1.2

return savestate