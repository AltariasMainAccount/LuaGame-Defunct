local weapon = require 'var.weapon'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

print(colors("%{bright blue}Welcome to the debug menu!"))
print(colors("%{bright blue}1. Countable Infinite Money"))
print(colors("%{bright blue}2. Countable Infinite HP"))
print(colors("%{bright blue}3. Countable Infinite MP"))
print(colors("%{bright blue}4. Dev Gear"))
print(colors("%{bright red}5. Magic OOBE (Out-Of-Bounds-Experience)"))
debug = io.read()

if debug == "1" then
    newmoney = safestate.currentMoney + 999999999
    safestate.currentMoney = newmoney
elseif debug == "2" then
    newHP = safestate.currentHP + 99999999999
    safestate.currentHP = newHP
elseif debug == "3" then
    newMP = safestate.currentMP + 99999999999
    safestate.currentMP = newMP
elseif debug == "4" then
    safestate.currentWeapon = "Developer's Blade of Hatred"
    safestate.currentArmor = "Cyan Foxgirl's Attire"
    safestate.currentAccessory = "The Missing Poster"
    safestate.currentBuff = "Twinsanity [BETA]"
    safestate.currentWeaponID = 999
    safestate.currentArmorID = 999
elseif debug == "5" then
    print(colors("%{bright red}Going out of bounds. Your save file will be gone."))
    os.execute("sleep 3")
    dofile("saveCorrupt.lua")
else
    os.execute("clear")
    dofile("game/game.lua")
end
os.execute("clear")
dofile("game/game.lua")