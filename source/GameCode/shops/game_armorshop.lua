local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'
local armor = require 'var.armor'

-- randomShop --

armorTableSize = table.getn(armor)

print(colors("%{bright blue}This is where you can buy Armor"))
print(colors("%{bright cyan}Alty-Chan approves of this shop, since the game is so random!"))
print(colors("%{bright red}Type non-integers to leave!\n"))
for i=1,armorTableSize do
    price = i * 5000
    print(colors("%{bright blue}"..i..". "..armor[i].." - Price: "..price..""))
end
print("\n")
io.write(colors("%{bright blue}Shop ->"))
shopselection = tonumber(io.read())
if shopselection then
    if shopselection < 0 then
        print(colors("%{bright red}That is not armor!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    elseif shopselection > armorTableSize then
        print(colors("%{bright red}That is not armor!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    else
        PayPrice = shopselection * 5000
        if safestate.currentMoney >= PayPrice then
            print(colors("%{bright blue}You got the "..armor[shopselection]..""))
            safestate.currentArmor = armor[shopselection]
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