local oop = require("source.Libraries.External.jsoop")
local console = require("source.Libraries.Console")

local ItemClasses = {}

local Item = Class({
    name = "Undefined",
    description = "You're not supposed to have this.",
    rarity = "Undefined",
    constructor = function(self, name, desc, rarity)
        self.name = name
        self.description = desc
        self.rarity = rarity
    end
})

local Rarity = Class ({
    name = "Undefined",
    color = { r = 0, g = 0, b = 0 },
    constructor = function(self, name, color)
        self.name = name
        self.color = color
    end
})

local Weapon = Extends({
    damage = 10,
    strength = 5,
    constructor = function(self, name, desc, dmg, atk, rarity)
        self.name = name
        self.description = desc
        self.damage = dmg
        self.strength = atk
        self.rarity = rarity
    end,
    inspect = function(self)
        console.use24(self.name, self.rarity["color"])
        print("\n"..self.description)
        print("Damage: "..self.damage)
        print("Strength: "..self.strength.."\n")
        console.use24(self.rarity["name"].." Weapon", self.rarity["color"])
    end
}, Item)

local Armor = Extends({
    defense = 10,
    constructor = function(self, name, desc, def, rarity)
        self.name = name
        self.description = desc
        self.defense = def
        self.rarity = rarity
    end,
    inspect = function(self)
        console.use24(self.name, self.rarity["color"])
        print("\n"..self.description)
        print("Defense: "..self.defense.."\n")
        console.use24(self.rarity["name"].." Armor", self.rarity["color"])
    end
}, Item)

local Accessory = Extends({
    stat = "atk",
    boost = 10,
    constructor = function(self, name, desc, stat, boost, rarity)
        self.name = name
        self.description = desc
        self.stat = stat
        self.boost = boost
        self.rarity = rarity
    end,
    inspect = function(self)
        console.use24(self.name, self.rarity["color"])
        print("\n"..self.description)
        print(self.stat..": "..self.boost.."\n")
        console.use24(self.rarity["name"].." Accessory", self.rarity["color"])
    end
}, Item)

local Useable = Extends({
    constructor = function(self, name, desc, rarity)
        self.name = name
        self.description = desc
        self.rarity = rarity
    end,
    inspect = function(self)
        console.use24(self.name, self.rarity["color"])
        print("\n"..self.description)
        print("Useable in battle\n")
        console.use24(self.rarity["name"].." Useable", self.rarity["color"])
    end
}, Item)

ItemClasses.Item = Item
ItemClasses.Rarity = Rarity
ItemClasses.Weapon = Weapon
ItemClasses.Armor = Armor
ItemClasses.Accessory = Accessory
ItemClasses.Useable = Useable

return ItemClasses