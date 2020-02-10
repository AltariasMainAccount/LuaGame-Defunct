local default = require 'states.defaultstates'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'

item = safestate.currentItem
playerhp = default.playerStartHealth
safestate.currrentItemID = 1
battleOver = 0

-- menu selection --
print(colors("%{bright blue}- Game Menu -"))
print(colors("%{bright yellow}WARNING: The game doesn't get saved\nAfter you leave the game, your progress is lost forever.\nHowever, Save File importing exists [but is in beta]"))
print(colors("%{bright blue}1. Fight Enemy"))
print(colors("%{bright blue}2. Fight Bosses"))
print(colors("%{bright blue}3. Shop"))
print(colors("%{bright blue}4. Stats"))
print(colors("%{bright blue}5. Go to the mine"))
print(colors("%{bright blue}6. Exit Game"))
io.write(colors("%{bright blue}<-[0]-> "))
selopt = io.read()

if selopt == "1" then    
    os.execute("clear")
    dofile("game/game_fight.lua")
elseif selopt == "2" then
    os.execute("clear")
    print(colors("%{bright red}It's killing me, lol :')"))
    dofile("game/game_bossloader.lua")
elseif selopt == "3" then
    os.execute("clear")
    dofile("game/game_shop.lua")
elseif selopt == "4" then
    os.execute("clear")
    dofile("game/game_stats.lua")
elseif selopt == "5" then
    os.execute("clear")
    dofile("game/game_mine.lua")
elseif selopt == "6" then
    os.execute("clear")
    print(colors("%{bright redbg}Another warning:              \nThe game doesn't get saved    \nAfter you leave the game,     \nyour progress is lost forever."))
    print(colors("%{bright underline red}Are you sure you want to quit?"))
    io.write(colors("%{bright blue}[Y/N] -> "))
    seloptquit = io.read()
    if seloptquit == "Y" then
        os.execute("sleep 2")
        os.execute("clear")
        print(colors("%{bright green}Thanks for playing luagame!%{bright red} <3"))
    else
        os.execute("sleep 2")
        os.execute("clear")
        dofile("game/game.lua")
    end
elseif selopt == "debug6" then
    os.execute("clear")
    print(colors("%{bright red underline}DEBUG_MENU"))    
    dofile("game/game_debug.lua")
else
    os.execute("clear")
    print(colors("%{bright red}TODO: Error - Invalid Input"))
    dofile("game/game.lua")
end