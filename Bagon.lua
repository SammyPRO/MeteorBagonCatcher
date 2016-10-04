
name = "Bagon Catcher"
author = "Sam"
description = [[Bagon Catcher @ Meteor Falls Uses Sync and False swipe]]


function onPathAction()


    if isPokemonUsable(2) and getRemainingPowerPoints(2, "False Swipe") >= 1 then
        if getMapName() == "Pokecenter Rustboro City" then
            moveToMap("Rustboro City")
        elseif getMapName() == "Rustboro City" then
            if not isMounted() then
                useItem("Bicycle")
            elseif isMounted() then
                moveToMap("Route 115")
            else
                moveToMap("Route 115")    
            end
        elseif getMapName() == "Route 115" then
            moveToCell(58, 30)
        elseif getMapName() == "Meteor falls 1F 1R" then
            if ( getPlayerX() == 18 and getPlayerY() == 4 ) then
                moveToCell(22, 5)
            else
                moveToCell(22, 5)
            end
        elseif getMapName() == "Meteor falls B1F 1R"  then
            if ( getPlayerX() == 2 and getPlayerY() == 30 ) or ( getPlayerX() == 8 and getPlayerY() == 15 )  then            
                return moveToCell(22, 21) or moveToMap("Meteor Falls B1F 2R")
            else
                return moveToCell(22, 21) or moveToMap("Meteor Falls B1F 2R")
            end
            
        elseif getMapName() == "Meteor Falls 1F 2R" then
            if getPlayerX() == 33 and getPlayerY() == 40 then
                moveToCell(11, 35)
            else
                moveToCell(11, 35)
            end
        
            
        elseif getMapName() == "Meteor Falls B1F 2R" then
                moveToRectangle(6, 19, 11, 21)
        end
    else
        if getMapName() == "Meteor Falls B1F 2R" then    
            return useItem("Escape Rope")
        else
            return useItem("Escape Rope")
        end
    end
end

function onBattleAction()
    if isWildBattle() and ( isOpponentShiny()  or getOpponentName() == "Bagon") then
        if getActivePokemonNumber() ~= 2 or not isPokemonUsable(2) then
            return sendPokemon(2) or sendPokemon(4) or sendUsablePokemon() or sendAnyPokemon()
        elseif ( getActivePokemonNumber() == 2 ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or sendAnyPokemon() or run()
        elseif getOpponentHealth() == 1 then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or attack() or run()
        end
    end

    return run() or sendUsablePokemon() or sendAnyPokemon()

end
