local default = require 'states.defaultstates'
local weapon = require 'var.weapon'
local armor = require 'var.armor'

local savestate = {
    username = "[REDACTED]",
    currentMoney = 0,
    currentWeapon = "None",
    currentArmor = "None",
    currentAccessory = "None",
    currentBuff = "None",
    currentLevel = 1,
    currentEXP = 0,
    currentWeaponID = 1,
    currentArmorID = 1,
    currentDMG = nil,
    currentDEF = nil,
    currentMP = 100,
    currentUP = 0,
}

savestate.currentDMG = default.playerDMG * savestate.currentWeaponID / 0.4
savestate.currentDEF = default.playerDEF * savestate.currentArmorID / 0.4
savestate.currentHP = 100 * savestate.currentArmorID / 1.2

return savestate