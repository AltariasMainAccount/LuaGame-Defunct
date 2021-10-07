local items = require("source.GameVariables.ItemInit")
local WeaponCall = items.Weapons
local ArmorCall = items.Armor

local savestate = {}

local userdata = { -- userdata = default variables
    name = "Undefined",
    level = 1,
    experience = 10,
    stats = {
        hp = 100,
        mp = 100,
        atk = 10,
        def = 10,
        agi = 5
    },
    equipped = {
        weapon = "stick",
        armor = "coat",
        accessory = "freedom_pin"
    }
}

local savedata = { -- savestate = savefile of user.
    name = "Undefined",
    level = 1,
    experience = 10,
    stats = {
        hp = 100,
        mp = 100,
        atk = 10,
        def = 10,
        agi = 5
    },
    equipped = {
        weapon = "stick",
        armor = "coat",
        accessory = "tech_pin"
    }
}

-- The actual addresses used for the weapons, armors and in some cases accessories
-- The program doesn't like it when you just use these things.

local weaponAddress = WeaponCall[savedata.equipped["weapon"]]
local armorAddress = ArmorCall[savedata.equipped["armor"]]

function savestate.updateStats()
    -- hp only changes with level
    savedata.stats["hp"] = userdata.stats["hp"] + (5 * savedata.level) -- 5 HP per level

    -- mp only changes with level
    savedata.stats["mp"] = userdata.stats["mp"] + (10 * savedata.level) -- 10 MP per level

    -- agility (speed) only changes with level, gets used for some spells.
    savedata.stats["agi"] = userdata.stats["agi"] + (3 * savedata.level) -- 3 AGI per level

    -- Update the strength of the player with weapon strength and level
    savedata.stats["atk"] = userdata.stats["atk"] + weaponAddress["strength"] + (3 * savedata.level) -- 3 strength points for each level
    -- Generate maxDamage based on Hypixel Skyblock, this is the actual stat that gets used.
    savedata.stats["maxDamage"] = (5 + weaponAddress["damage"]) * (1 + savedata.stats["atk"] / 100)
    
    -- Update the defense with the level and the armor 
    savedata.stats["def"] = userdata.stats["def"] + (3 * savedata.level) -- 3 defense points for each level
    savedata.stats["def"] = userdata.stats["def"] + armorAddress["defense"] -- the equipped armor will add it's defense to the defense total
    -- Generate dmg_reduction based on Hypixel Skyblock, this is the actual thing that gets used.
    savedata.stats["dmg_reduction"] = savedata.stats["def"] / (savedata.stats["def"]+100)
end

savestate.default = userdata
savestate.savedata = savedata

return savestate