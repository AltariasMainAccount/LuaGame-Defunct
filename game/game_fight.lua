local defaults = require 'states.defaultstates'
local weapon = require 'var.weapon'
local armor = require 'var.armor'
local safestate = require 'states.aaa'
local colors = require 'lib.ansicolors'
local game = require 'lib.gamescript'
local level = require 'lib.leveling'

-- variable --
money = safestate.currentMoney
math.randomseed(os.time())
drop = math.random(100)
accurateHP = safestate.currentHP + safestate.currentDEF / 0.3
enemyType = math.random(3)
  if enemyType == 1 then
    enemyTypeName = "Easy Enemy"
  elseif enemyType == 2 then
    enemyTypeName = "Medium Enemy"
  else
    enemyTypeName = "Hard Enemy"
  end
-- battle --
    enemyHP = 100 * enemyType
    while enemyHP > 0 do
        os.execute("clear")
        print(colors("%{bright blue}Engage combat against a "..enemyTypeName..""))
        print(colors("%{bright blue}HP: "..accurateHP.." MP: "..safestate.currentMP..""))
        print(colors("%{bright blue}1. Attack with weapon\n2. Magic\n3.Run away"))
        io.write(colors("%{bright blue}Choice -> "))
        fightchoice = io.read()
        if fightchoice == "1" then
            os.execute("clear")
            critchance = math.random(10)
            if critchance > 8 then
                print(colors("%{bright red}A CRITICAL HIT!"))
                updatedenemyHP = enemyHP - safestate.currentDMG * 3
                enemyHP  = updatedenemyHP
            elseif critchance > 2 then
                print(colors("%{bright blue}You struck the enemy with your weapon."))
                updatedenemyHP = enemyHP - safestate.currentDMG
                enemyHP = updatedenemyHP
            else
                print(colors("%{bright blue}You missed your target."))
            end
        os.execute("sleep 1")
        elseif fightchoice == "2" then
            if safestate.currentMP < 10 then
                os.execute("clear")
                print(colors("%{bright blue}You struck the enemy with your weapon instead."))
                updatedenemyHP = enemyHP - safestate.currentDMG
                enemyHP = updatedenemyHP
            else
                os.execute("clear")
                print(colors("%{bright blue}1. Fire Spell 20MP\n2. Ice Spell 40MP\n3. Heal 10MP\n4. %{bright cyan}Cyan Flames %{bright blue}[UP Spell, uses max MP]\n5. Focus [Regain 30 MP]"))
                io.write(colors("%{bright blue}Choice -> "))
                spellchoice = io.read()
                    if spellchoice == "1" then
                        os.execute("clear")
                        print(colors("%{bright blue}You used a fire spell."))
                        print(colors("%{bright blue}You hit your Target."))
                        enemyHP = enemyHP - 40
                        mploss = safestate.currentMP - 20
                        safestate.currentMP = mploss
                        os.execute("sleep 1")
                    elseif spellchoice == "2" then
                        os.execute("clear")
                        print(colors("%{bright blue}You used an ice spell."))
                        print(colors("%{bright blue}You hit your Target."))
                        enemyHP = enemyHP - 30
                        mploss = safestate.currentMP - 40
                        safestate.currentMP = mploss
                        os.execute("sleep 1")
                    elseif spellchoice == "3" then
                        os.execute("clear")
                        print(colors("%{bright cyan}You used your heal."))
                        print(colors("%{bright cyan}You recovered 50 HP."))
                        hpgain = safestate.currentHP
                        safestate.currentHP = hpgain + 50
                        mploss = safestate.currentMP - 10
                        safestate.currentMP = mploss
                        os.execute("sleep 1")
                    elseif spellchoice == "4" and safestate.currentMP > 90 then
                        os.execute("clear")
                        print(colors("%{bright cyan}You used Cyan Flames."))
                        print(colors("%{bright cyan}You hit your Target deadon."))
                        enemyHP = enemyHP - 200
                        mploss = safestate.currentMP - 100
                        safestate.currentMP = mploss
                        os.execute("sleep 1")
                    elseif spellchoice == "5" then
                        os.execute("clear")
                        print(colors("%{bright cyan}You focused."))
                        print(colors("%{bright cyan}You recovered 30 MP."))
                        mpgain = safestate.currentMP + 30
                        safestate.currentMP = mpgain
                        os.execute("sleep 1")
                end
            end
        elseif fightchoice == "3" then
            os.execute("clear")
            print(colors("%{bright red}YOU CAN'T RUN FROM A TERMINAL! =)"))
            os.execute("sleep 1")
        else
            print("e")
        end
        math.randomseed(os.time())
        critchanceenemy = math.random(30)
        if critchanceenemy > 24 then
            print(colors("%{bright red}The enemy hit you. A CRITICAL HIT!"))
            updatedplayerHP = safestate.currentHP - 5 * enemyType * 3
            safestate.currentHP  = updatedplayerHP
            accurateHP = safestate.currentHP + safestate.currentDEF
        elseif critchanceenemy > 6 then
            print(colors("%{bright blue}The enemy hit you."))
            updatedplayerHP = safestate.currentHP - 5 * enemyType
            safestate.currentHP  = updatedplayerHP
            accurateHP = safestate.currentHP + safestate.currentDEF
        else
            print(colors("%{bright blue}The enemy missed you."))
        end
        os.execute("sleep 1")
        if accurateHP <= 0 then
            print(colors("%{bright red}GAME OVER!"))
            os.execute("sleep 1")
            os.execute("clear")
            dofile("main.lua")
        end
end

-- Looting --
money = money + 10 * enemyType
safestate.currentMoney = money
-- Battle Over --
battleOver = 1
level.levelup()
game.dropchance()


