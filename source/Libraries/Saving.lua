-- Save File Code goes into this library --

local saveModule = {}

local items = require("source.GameVariables.ItemInit")
local savestate = require("source.GameStates.savestate")
local file = require("source.Libraries.External.file")

function saveModule.loadSave(name)
    json_data = file.jsonRead("SaveFiles/"..name..".json")
    savestate["name"] = json_data["name"]
    savestate["level"] = json_data["level"]
    savestate["experience"] = json_data["experience"]
    savestate["equipped"]["weapon"] = items["Weapons"][json_data["equipped"]["weapon"]]
    savestate["equipped"]["armor"] = items["Armor"][json_data["equipped"]["armor"]]
    savestate["equipped"]["accessory"] = items["Accessories"][json_data["equipped"]["accessory"]]
    savestate.updateStats()
end

function saveModule.saveGame(name)

end

return saveModule