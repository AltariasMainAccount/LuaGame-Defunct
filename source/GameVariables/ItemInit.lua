-- Get all the classes for the individual items --

local Classes = require("source.GameVariables.defaults.ItemClasses")

local debug = require("source.Libraries.External.inspect") -- Shows tables

-- initialization of the things that don't go into the actual game themselves

local RarityDictionary = {
    common = Classes["Rarity"].new("Common", { r = 255, g = 255, b = 255 }),
    uncommon = Classes["Rarity"].new("Uncommon", { r = 153, g = 255, b = 51 }),
    rare = Classes["Rarity"].new("Rare", { r = 51, g = 102, b = 255 }),
    epic = Classes["Rarity"].new("Epic", { r = 153, g = 0, b = 255 }),
    legendary = Classes["Rarity"].new("Legendary", { r = 255, g = 204, b = 0 }),
    mythic = Classes["Rarity"].new("Mythic", { r = 255, g = 102, b = 255 }),
    unobtainable = Classes["Rarity"].new("[!] Unobtainable", { r = 0, g = 153, b = 153 })
}

-- Item initialization and use goes here --
local ItemDictionary = {}

local WeaponDictionary = {
    stick = Classes["Weapon"].new("Stick", "It's a stick.", 10, 10, RarityDictionary["common"]),
    sharp_stick = Classes["Weapon"].new("Sharp Stick", "It's a stick but sharp.", 100, 25, RarityDictionary["uncommon"]),
    big_shot = Classes["Weapon"].new("[[ BIG SHOT ]]", "NOW'S YOUR CHANCE TO BE A [[ BIG SHOT ]]", 999, 999, RarityDictionary["unobtainable"])
}

local ArmorDictionary = {
    coat = Classes["Armor"].new("Coat", "It's a coat. Doesn't have much defense.", 10, RarityDictionary["uncommon"]),
    armor_coat = Classes["Armor"].new("Armored Coat", "It's a coat. It is now armored.", 50, RarityDictionary["rare"]),
    spec_coat = Classes["Armor"].new("Specialized Coat", "It's a coat. It is now specialized around armor.", 250, RarityDictionary["epic"])
}

local AccessoryDictionary = {
    freedom_pin = Classes["Accessory"].new("Freedom Pin", "It's a pin made in america.", "AGI", 10, RarityDictionary["rare"]),
    tech_pin = Classes["Accessory"].new("Technology Pin", "It's a pin made in germany. \nIt says that german tech is the best in the world.", "DEF", 35, RarityDictionary["epic"]),
    brawl_pin = Classes["Accessory"].new("Brawler Pin", "It's a pin made in Spain. It has the aura of a true hero", "ATK", 50, RarityDictionary["legendary"])
}

local UseableDictionary = {
    potion_health_1 = Classes["Useable"].new("Health Potion I", "A health potion, recovers 50 HP", RarityDictionary["common"]),
    potion_health_2 = Classes["Useable"].new("Health Potion II", "A better health potion, recovers 100 HP", RarityDictionary["uncommon"]),
    potion_health_3 = Classes["Useable"].new("Health Potion III", "A greater health potion, recovers a quarter of your total HP", RarityDictionary["rare"]),
    potion_health_4 = Classes["Useable"].new("Health Potion IV", "A special health potion, recovers half of your total HP", RarityDictionary["epic"]),
    potion_health_5 = Classes["Useable"].new("Health Potion V", "A superior health potion, recovers all of your total HP", RarityDictionary["legendary"])
} 
-- Set the values in the ItemDictionary

ItemDictionary.Weapons = WeaponDictionary
ItemDictionary.Armor = ArmorDictionary
ItemDictionary.Accessories = AccessoryDictionary
ItemDictionary.Useables = UseableDictionary

-- Return the filled item dictionary

return ItemDictionary