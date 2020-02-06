local hp = require 'var.hp'
local dmg = require 'var.dmg'
local items = require 'var.item'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

-- randomShop --
print(colors("%{bright blue}This is where you can buy Accessories"))
print(colors("%{bright blue}They do nothing, but have sentimental value."))
print(colors("%{bright cyan}Alty-Chan approves!"))
print(colors("%{bright blue}1. A scarf - 1000 Money\n2. A weird TV mask - 2000 Money\n3. The Terminal - 3000 Money\n4. Cyan Neonydium - 4000 Money\n5. LOLCODE - 5000 Money\n6. The Lost ESC Key - 6666 money\n7. The Letter A - 7000 Money\n8. A dictionary of Programming Languages - 8000 Money\n9. Debugged Menu - 9000 Money\n0. Wolfgirl's Collar - 9999 Money\nAnything else. Exit"))
io.write(colors("%{bright blue}Shop >"))
shopselection = io.read()

if shopselection == "1" and safestate.currentMoney > 1000 then
    newmoney = safestate.currentMoney - 1000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "The Cutie's Scarf"
elseif shopselection == "2" and safestate.currentMoney > 2000 then
    newmoney = safestate.currentMoney - 2000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "Broken Analog TV Head"
elseif shopselection == "3" and safestate.currentMoney > 3000 then
    newmoney = safestate.currentMoney - 3000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "The LUA Shell"
elseif shopselection == "4" and safestate.currentMoney > 4000 then
    newmoney = safestate.currentMoney - 4000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "Cyan Neonydium"
elseif shopselection == "5" and safestate.currentMoney > 5000 then
    newmoney = safestate.currentMoney - 5000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "LOLCODE"
elseif shopselection == "6" and safestate.currentMoney > 6700 then
    newmoney = safestate.currentMoney - 6700
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "You still can't escape ;)"
elseif shopselection == "7" and safestate.currentMoney > 7000 then
    newmoney = safestate.currentMoney - 7000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "AAAAAAAAAAAAAAAAA"
elseif shopselection == "8" and safestate.currentMoney > 8000 then
    newmoney = safestate.currentMoney - 8000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "The 'Rosetta Code'"
elseif shopselection == "9" and safestate.currentMoney > 9000 then
    newmoney = safestate.currentMoney - 9000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "The Debugged Menu [debug6]"
elseif shopselection == "0" and safestate.currentMoney > 10000 then
    newmoney = safestate.currentMoney - 10000
    safestate.currentMoney = newmoney
    safestate.currentAccessory = "Wolfgirl's Collar"
else
    os.execute("clear")
    dofile("game/game.lua")
end
os.execute("clear")
dofile("game/game.lua")