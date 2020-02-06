local hp = require 'var.hp'
local dmg = require 'var.dmg'
local items = require 'var.item'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'


-- TODO --
print(colors("%{bright green}Stats:"))
print(colors("%{bright blue}User:%{bright green} "..safestate.username..""))
print(colors("%{bright blue}Accessory:%{bright cyan} "..safestate.currentAccessory..""))
print(colors("%{bright blue}Buff:%{bright red} "..safestate.currentBuff..""))
print(colors("%{bright blue}Level:%{bright green} "..safestate.currentLevel..""))
print(colors("%{bright blue}EXP:%{bright green} "..safestate.currentEXP..""))
print(colors("%{bright blue}Weapon:%{bright green} "..safestate.currentItem..", "..safestate.currentitemID..""))
print(colors("%{bright blue}Armor:%{bright green} "..safestate.currentArmor..", "..safestate.currentArmorID..""))
print(colors("%{bright blue}HP:%{bright green} "..safestate.currentHP..""))
print(colors("%{bright blue}ATK:%{bright green} "..safestate.currentDMG..""))
print(colors("%{bright blue}DEF:%{bright green} "..safestate.currentDEF..""))
print(colors("%{bright blue}MP:%{bright green} "..safestate.currentMP..""))
print(colors("%{bright blue}UP:%{bright green} "..safestate.currentUP.."/"..hp.maxUP..""))
io.write(colors("%{bright blue}Press Enter to return to Menu"))
io.read()
os.execute("clear")
dofile("game/game.lua")