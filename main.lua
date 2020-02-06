local colors = require 'lib.ansicolors'
local safestate = require 'states.aaa'

-- menu --
print(colors("%{bright blue}luagame V0.958\n%{bright red}The Clappening of 2020\n"))
print(colors("%{bright blue}1 - New Game"))
print(colors("%{bright blue}2 - Import Save File"))
print(colors("%{bright blue}3 - Credits"))
print(colors("%{bright blue}4 - Story"))
print(colors("%{bright blue}5 - Exit Game"))
io.write(colors("%{bright blue}Select Option: "))
selopt = io.read()

if selopt == "1" then
    io.write(colors("%{bright blue}Username: "))
    username = io.read()
    safestate.username = username
    print(colors("%{bright blue}Starting new game..."))
    os.execute("sleep 0.5")
    os.execute("clear")
    dofile("game/game.lua")
elseif selopt == "2" then
    print(colors("%{bright red}\nThis feature is still very buggy and has to be done locally.\nThe feature is currently only used for debugging and stuff.\nPress enter to proceed"))
    io.read()
    print(colors("%{bright blue}Trying to import safestate from saveimport/saveimport.txt..."))
    os.execute("sleep 0.5")
    os.execute("clear")
    dofile("saveImport.lua")
elseif selopt == "3" then
    os.execute("clear")
    print(colors("%{bright green}luagame made by Altarias"))
    print(colors("%{bright green}ansicolors made by kikito on github"))
    io.write(colors("%{bright red}Press enter to continue\n"))
    io.read()
    os.execute("clear")
    dofile("main.lua")
elseif selopt == "4" then
    print(colors("%{bright red}Todo - STORY LINE"))
    io.write(colors("%{bright red}Press enter to continue\n"))
    io.read()
    os.execute("clear")
    dofile("main.lua")
elseif selopt == "5" then
    print(colors("%{bright red}Are you sure you want to quit?"))
    io.write(colors("%{bright blue}[Y/N] -> "))
    seloptquit = io.read()
    if seloptquit == "Y" then
        os.execute("sleep 2")
        os.execute("clear")
        print(colors("%{bright green}Thanks for playing luagame!%{bright red} <3"))
    else
        os.execute("sleep 2")
        os.execute("clear")
        dofile("main.lua")
    end
else
    os.execute("sleep 2")
    os.execute("clear")
    dofile("main.lua")
end
