local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'


-- TODO --
math.randomseed(os.time())
luckMine = math.random(100)
	 
if luckMine > 90 then
   newCoin = math.random(100) * 5
else
   newCoin = math.random(100)
end
currentCoin = safestate.currentMoney

if luckMine > 90 then
    print(colors("%{bright red}You found a ruby!"))
    print(colors("%{bright red}You sold it for "..newCoin..""))
    safestate.currentMoney = currentCoin + newCoin
    print(colors("%{bright blue}Your new balance is "..safestate.currentMoney.."\n"))
else    
    print(colors("%{bright blue}You mined"))
    print(colors("%{bright blue}You got "..newCoin..""))
    safestate.currentMoney = currentCoin + newCoin
    print(colors("%{bright blue}Your new balance is "..safestate.currentMoney.."\n"))
end
io.write(colors("%{bright blue}Press Enter to return to Menu"))
io.read()
os.execute("clear")
dofile("game/game.lua")