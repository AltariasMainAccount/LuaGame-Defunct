local items = require("source.GameVariables.ItemInit")

local userdata = { -- userdata = default variables
    stats = {
        hp = 100,
        mp = 100,
        atk = 10,
        def = 10,
        agi = 5
    }
}

local savestate = { -- savestate = savefile of user.
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
        weapon = items.Weapons["stick"],
        armor = items.Armor["coat"],
        accessory = items.Accessories["tech_pin"]
    }
}

function savestate.updateStats()
    -- hp only changes with level
    savestate.stats["hp"] = userdata.stats["hp"] + (5 * savestate.level) -- 5 HP per level

    -- mp only changes with level
    savestate.stats["mp"] = userdata.stats["mp"] + (10 * savestate.level) -- 10 MP per level

    -- agility (speed) only changes with level, gets used for some spells.
    savestate.stats["agi"] = userdata.stats["agi"] + (3 * savestate.level) -- 3 AGI per level

    -- Update the strength of the player with weapon strength and level
    savestate.stats["atk"] = userdata.stats["atk"] + savestate.equipped["weapon"]["strength"] + (3 * savestate.level) -- 3 strength points for each level
    -- Generate maxDamage based on Hypixel Skyblock, this is the actual stat that gets used.
    savestate.stats["maxDamage"] = (5 + savestate.equipped["weapon"]["damage"]) * (1 + savestate.stats["atk"] / 100)
    
    -- Update the defense with the level and the armor 
    savestate.stats["def"] = userdata.stats["def"] + (3 * savestate.level) -- 3 defense points for each level
    savestate.stats["def"] = userdata.stats["def"] + savestate.equipped["armor"]["defense"] -- the equipped armor will add it's defense to the defense total
    -- Generate dmg_reduction based on Hypixel Skyblock, this is the actual thing that gets used.
    savestate.stats["dmg_reduction"] = savestate.stats["def"] / (savestate.stats["def"]+100)
end

return savestate