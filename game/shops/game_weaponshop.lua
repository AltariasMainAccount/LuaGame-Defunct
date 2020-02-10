local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'
local weapon = require 'var.weapon'

-- randomShop --

weaponTableSize = table.getn(weapon)

print(colors("%{bright blue}This is where you can buy Weapons"))
print(colors("%{bright cyan}Alty-Chan advises that you actually play the game!"))
print(colors("%{bright red}Type non-integers to leave!\n"))
for i=1,weaponTableSize do
    price = i * 10000
    print(colors("%{bright blue}"..i..". "..weapon[i].." - Price: "..price..""))
end
print("\n")
io.write(colors("%{bright blue}Shop ->"))
shopselection = tonumber(io.read())
if shopselection then
    if shopselection < 0 then
        print(colors("%{bright red}That is not an weapon!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    elseif shopselection > weaponTableSize then
        print(colors("%{bright red}That is not an weapon!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    else
        PayPrice = shopselection * 10000
        if safestate.currentMoney >= PayPrice then
            print(colors("%{bright blue}You got the "..weapon[shopselection]..""))
            safestate.currentWeapon = weapon[shopselection]
            safestate.currentMoney = safestate.currentMoney - PayPrice
        else
            print(colors("%{bright red}You do not have enough money to purchase this."))
            os.execute("sleep 2")
            os.execute("clear")
            dofile("game/game_shop.lua")
        end
    end
else
    os.execute("sleep 2")
    os.execute("clear")
    dofile("game/game.lua")
end
os.execute("sleep 2")
os.execute("clear")
dofile("game/game.lua")