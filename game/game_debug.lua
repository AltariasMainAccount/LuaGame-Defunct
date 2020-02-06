local hp = require 'var.hp'
local dmg = require 'var.dmg'
local items = require 'var.item'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

print(colors("%{bright blue}Welcome to the debug menu!"))
print(colors("%{bright blue}1. 999999999 Money"))
print(colors("%{bright blue}2. 999999999 MP"))
print(colors("%{bright red}3. ?!?!??!?!?!?!?!??!!??!?!?!?!?!?!?!?!??!??!000000"))
debug = io.read()


if debug == "1" then
    newmoney = safestate.currentMoney + 999999999
    safestate.currentMoney = newmoney
elseif debug == "2" then
    newMP = safestate.currentMP + 999999999
    safestate.currentMP = newMP
elseif debug == "3" then
    print(colors("%{bright red} SAY GOODBYE TO YOUR STUPID SAFE FILE, RETARD =)"))
    os.execute("sleep 3")
    dofile("saveCorrupt.lua")
else
    os.execute("clear")
    dofile("game/game.lua")
end