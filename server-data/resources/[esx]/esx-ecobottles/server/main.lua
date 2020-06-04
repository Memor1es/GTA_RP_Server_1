local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj) 
    ESX = obj 
end)

RegisterServerEvent("esx-ecobottles:sellBottles")
AddEventHandler("esx-ecobottles:sellBottles", function(times)
    local player = ESX.GetPlayerFromId(source)
    
    local currentBottles = player.getInventoryItem("bottle")["count"]
    
    if currentBottles > 0 then
        math.randomseed(os.time())
        local randomMoney = 0
        for i = 1, currentBottles do
            randomMoney = randomMoney + math.random((Config.BottleReward[1] or 1), (Config.BottleReward[2] or 4))
        end
        
        local total = randomMoney * times
        player.removeInventoryItem("bottle", currentBottles)
        player.addMoney(total)

        TriggerClientEvent("esx:showNotification", source, ("你給了回收站 %s 個空罐子 以及得到了 ~g~$%s~s~ 報酬."):format(currentBottles, total))
    else
        TriggerClientEvent("esx:showNotification", source, "你沒有任何空罐子可以給回收站.")
    end
end)

RegisterServerEvent("esx-ecobottles:retrieveBottle")
AddEventHandler("esx-ecobottles:retrieveBottle", function()
    local player = ESX.GetPlayerFromId(source)

    math.randomseed(os.time())
    local luck = math.random(0, 100)
    local randomBottle = math.random((Config.BottleRecieve[1] or 1), (Config.BottleRecieve[2] or 6))

    if luck >= 0 and luck <= 49 then
        TriggerClientEvent("esx:showNotification", source, "垃圾桶內沒有任何東西.")
    elseif luck >= 50 and luck <= 59 then
        local ran = math.random(1,2)
        local targetItem
        local cnt = 1
        if ran == 1 then
            TriggerClientEvent("esx:showNotification", source, ("你找到了 x%s 麵包"):format(cnt))
            targetItem = player.getInventoryItem("bread")
            if targetItem.count + cnt <= targetItem.limit then
                player.addInventoryItem("bread", cnt)
            else
                TriggerClientEvent("esx:showNotification", source, "但是你背包滿了")
            end
        elseif ran == 2 then
            TriggerClientEvent("esx:showNotification", source, ("你找到了 x%s 水"):format(cnt))
            targetItem = player.getInventoryItem("water")
            if targetItem.count + cnt <= targetItem.limit then
                player.addInventoryItem("water", cnt)
            else
                TriggerClientEvent("esx:showNotification", source, "但是你背包滿了")
            end
        end
    elseif luck >= 60 and luck <= 65 then
        local cnt = 1
        TriggerClientEvent("esx:showNotification", source, ("你找到了 x%s 塑膠"):format(cnt))
        local targetItem = player.getInventoryItem("plastic")
        if targetItem.count + cnt <= targetItem.limit then
            player.addInventoryItem("plastic", cnt)
        else
            TriggerClientEvent("esx:showNotification", source, "但是你背包滿了")
        end
    elseif luck >= 70 and luck <= 75 then
        local cnt = 1
        TriggerClientEvent("esx:showNotification", source, ("你找到了 x%s 萬用鑰匙"):format(cnt))
        local targetItem = player.getInventoryItem("lockpick_house")
        if targetItem.count + cnt <= targetItem.limit then
            player.addInventoryItem("lockpick_house", cnt)
        else
            TriggerClientEvent("esx:showNotification", source, "但是你背包滿了")
        end
    else
        player.addInventoryItem("bottle", randomBottle)
        TriggerClientEvent("esx:showNotification", source, ("你找到了 x%s 空罐子"):format(randomBottle))
    end
end)
