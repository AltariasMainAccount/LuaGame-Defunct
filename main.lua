local items = require("source.GameVariables.ItemInit")

local console = require("source.Libraries.Console")
local saveModule = require("source.Libraries.Saving")
local savestate = require("source.GameStates.savestate")

local debug = require("source.Libraries.External.inspect")

-- Switchcase

local switchCase = {
	[1] = function()	-- Case 1
        print("New game goes here")
	end,
	[2] = function()	-- Case 2
        local name = console.getInput("Save Name")
        saveModule.loadSave(name)
        print(debug(savestate))
	end,
	[3] = function()	-- Case 3 
        print("Credits goes here")
	end,
    [4] = function()
        print("Story goes here")
    end,
    [5] = function()
        print("Exit goes here")
    end
}

-- menu --
print("LuaGame BetaTest")
print([[
1. New Game
2. Load Game
3. Credits
4. Story
5. Exit Game    
]])
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
