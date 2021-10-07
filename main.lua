local items = require("source.GameVariables.ItemInit")

local console = require("source.Libraries.Console")
local saveModule = require("source.Libraries.Saving")
local savestate = require("source.GameStates.savestate")

local texture = require("source.GameAssets.GameTextures_eng")

local debug = require("source.Libraries.External.inspect")

-- Switchcase

local switchCase = {
	[1] = function()	-- Case 1
        local name = console.getInput("Your name")
        saveModule.newGame(name)
	end,
	[2] = function()	-- Case 2
        local name = console.getInput("Savefile Name")
        saveModule.loadSave(name)
	end,
	[3] = function()	-- Case 3 
        os.execute("clear")
        print(texture["mainMenuHeader"])
        print(texture["mainMenuCredits"])
        print(texture["mainMenuFooter"])
        io.read()
	end,
    [4] = function()
        print("Story goes here")
    end,
    [5] = function()
        print("Exit goes here")
    end
}

-- menu --
while true do
    os.execute("clear")
    print(texture["mainMenuHeader"])
    print(texture["mainMenuBody"])
    print(texture["mainMenuFooter"])
    io.write("Select Option: ")
    local a = io.read("*number")
    io.read()
    local selection = switchCase[a]
    if(selection) then
        selection()
    else				-- the else is for the switchCase default
        os.execute("sleep 2")
        os.execute("clear")
        dofile("main.lua")
    end
end