local gamescript = {}
local weapon = require 'var.weapon'
local armor = require 'var.armor'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

local function dropchance()
    math.randomseed(os.time())
    -- Generates the chance to get a drop
    Drop = math.random(1000)
    DropType = math.random(100)
    -- Weapon Generation
    DropSelectionWeapon = math.random(20)
    -- Armor Generation
    DropSelectionArmor = math.random(11)
    -- Drop Chance Calculator
    if drop > 800 then
        if DropType < 50 then 
            print("You got a drop: "..weapon[DropSelectionWeapon].."")
            io.write(colors("%{bright blue}Pick it up? [Y/N] ->"))
            UseWeapon = io.read()
                if UseWeapon == "Y" then
                    print(colors("%{bright blue}You picked up the %{bright green}"..weapon[DropSelectionWeapon]..""))
                    safestate.currentWeapon = weapon[DropSelectionWeapon]
                    PreWeaponID = DropSelectionWeapon
                    safestate.currentWeaponID = PreWeaponID
                    safestate.currentDMG = 1 * safestate.currentWeaponID / 0.1
                else
                    print(colors("%{bright blue}You decided to leave the %{bright green}"..weapon[DropSelectionWeapon]..""))
                end
                dofile("game/game.lua")
        elseif DropType > 50 then
            print(colors("%{bright blue}You got a drop: %{bright green}"..armor[DropSelectionArmor]..""))
            io.write(colors("%{bright blue}Pick it up? [Y/N] ->"))
            UseArmor = io.read()
                if UseArmor == "1" then
                    print(colors("%{bright blue}You picked up the %{bright green}"..armor[DropSelectionArmor].."%{bright blue} and put it on."))
                    safestate.currentArmor = armor[DropSelectionArmor]
                    PreArmorID = dropSelectionArmor
                    safestate.currentArmorID = PreArmorID
                else
                    print(colors("%{bright blue}You decided to leave the %{bright green}"..armor[DropSelectionArmor]..""))
                end
                dofile("game/game.lua")
        else
            print("Sadly, your drop was corrupted. :p")
        end
    else
        dofile("game/game.lua")
    end
end

gamescript.dropchance = dropchance

return gamescript