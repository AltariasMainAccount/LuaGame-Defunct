-- Save File Code goes into this library --

local saveModule = {}

local items = require("source.GameVariables.ItemInit")
local savestate = require("source.GameStates.savestate")
local file = require("source.Libraries.External.file")

function saveModule.loadSave(name)
    json_data = file.jsonRead("SaveFiles/"..name..".json")
    savestate.savedata["name"] = json_data["name"]
    savestate.savedata["level"] = json_data["level"]
    savestate.savedata["experience"] = json_data["experience"]
    savestate.savedata["equipped"]["weapon"] = items["Weapons"][json_data["equipped"]["weapon"]]
    savestate.savedata["equipped"]["armor"] = items["Armor"][json_data["equipped"]["armor"]]
    savestate.savedata["equipped"]["accessory"] = items["Accessories"][json_data["equipped"]["accessory"]]
    savestate.updateStats()
end

function saveModule.saveGame(name)
    file.jsonWrite("SaveFiles/"..name..".json", savestate.savedata)
end

function saveModule.newGame(name)
    savestate.default["name"] = name
    file.jsonWrite("SaveFiles/"..name..".json", savestate["default"])
    savestate.updateStats()
end

return saveModule