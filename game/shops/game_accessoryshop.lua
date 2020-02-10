local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'
local accessory = require 'var.accessories'

-- randomShop --

accessoryTableSize = table.getn(accessory)

print(colors("%{bright blue}This is where you can buy Accessories"))
print(colors("%{bright blue}They do nothing, but have sentimental value."))
print(colors("%{bright cyan}Alty-Chan approves!"))
print(colors("%{bright red}Type non-integers to leave!\n"))
for i=2,accessoryTableSize do
    price = i * 1000
    print(colors("%{bright blue}"..i - 1..". "..accessory[i].." - Price: "..price..""))
end
print("\n")
io.write(colors("%{bright blue}Shop ->"))
shopselection = tonumber(io.read())
if shopselection then
    if shopselection < 2 then
        print(colors("%{bright red}That is not an Accessory!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    elseif shopselection > accessoryTableSize then
        print(colors("%{bright red}That is not an Accessory!"))
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game_shop.lua")    
    else
        PayPrice = shopselection * 1000
        if safestate.currentMoney >= PayPrice then
            print(colors("%{bright blue}You got the "..accessory[shopselection]..""))
            safestate.currentAccessory = accessory[shopselection]
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

