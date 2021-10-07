local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

-- lol --

print(colors("%{bright blue underline}The Local Shops\n"))
print(colors("%{bright blue}1. The Weapon Shop"))
print(colors("%{bright blue}2. The Armor Shop"))
print(colors("%{bright blue}3. The Accessory Shop\n"))
print(colors("%{bright blue}Where do you want to go?"))
io.write(colors("%{bright blue}Choice ->")) 
choice = tonumber(io.read())

if choice then
    if choice == 1 then
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/shops/game_weaponshop.lua")
    elseif choice == 2 then
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/shops/game_armorshop.lua") 
    elseif choice == 3 then
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/shops/game_accessoryshop.lua")
    end
else
    print(colors("%{bright blue}You decided to leave again"))        
    os.execute("sleep 2")
    os.execute("clear")
    dofile("game/game.lua")  
end