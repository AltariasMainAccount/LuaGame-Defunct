local gamescript = {}
local item = require 'var.item'
local armor = require 'var.armor'
local safestate = require 'states.aaa'

local function dropchance()
    math.randomseed(os.time())
    -- Generates the chance to get a drop
    drop = math.random(1000)
    dropType = math.random(100)
    -- Weapon Generation
    dropSelectionWeapon = math.random(20)
    -- Armor Generation
    dropSelectionArmor = math.random(11)
    -- Drop Chance Calculator
    if drop > 800 then
        if dropType < 50 then 
            print("You got a drop: "..item[dropSelectionWeapon].."")
            io.write("DEBUG_INPUT >")
            useItem = io.read()
                if useItem == "1" then
                    print("You picked up the "..item[dropSelectionWeapon].."")
                    safestate.currentItem = item[dropSelectionWeapon]
                    preWeaponID = dropSelectionWeapon
                    safestate.currentitemID = preWeaponID
                    safestate.currentDMG = 1 * safestate.currentitemID / 0.1
                else
                    print("You decided to leave the "..item[dropSelectionWeapon].."")
                end
                dofile("game/game.lua")
        elseif dropType > 50 then
            print("You got a drop: "..armor[dropSelectionArmor].."")
            io.write("DEBUG_INPUT >")
            useItem = io.read()
                if useItem == "1" then
                    print("You picked up the "..armor[dropSelectionArmor].." and put it on.")
                    safestate.currentArmor = armor[dropSelectionArmor]
                    preArmorID = dropSelectionArmor
                    safestate.currentArmorID = preArmorID
                else
                    print("You decided to leave the "..armor[dropSelectionArmor].."")
                end
                dofile("game/game.lua")
        else
            print("Sadly, your drop was corrupted.")
        end
    else
        dofile("game/game.lua")
    end
end

gamescript.dropchance = dropchance
gamescript.generatedrop = generatedrop

return gamescript