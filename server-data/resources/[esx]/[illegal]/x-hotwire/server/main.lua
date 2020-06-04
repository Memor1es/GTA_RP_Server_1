ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)
--[[
Citizen.CreateThread(function()
    TriggerEvent('disc-base:registerItemUse', 'lockpick', function(source, item)
        TriggerClientEvent('disc-hotwire:hotwire', source, true)
    end)
end)
RegisterNetEvent('ARPF:removeKit')
AddEventHandler('ARPF:removeKit', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    xPlayer.removeInventoryItem('lockpick', 1)
end)
--]]


RegisterServerEvent('disc-hotwire:givereward')
AddEventHandler('disc-hotwire:givereward', function(source,cashreward,itemreward, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    if cashreward ~= nil then 
        xPlayer.addMoney(cashreward)
    elseif itemreward ~= nil then 
        xPlayer.addInventoryItem(itemreward, count)
    end
end)

RegisterNetEvent('ARPF:GiveKeys')
AddEventHandler('ARPF:GiveKeys', function(closestplayer,veh,plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    nameplayer = GetPlayerName(_source)
    TriggerClientEvent("ARPF:recivekeys", closestplayer, nameplayer,veh,plate)
end)


ESX.RegisterServerCallback('disc-hotwire:checkOwner', function(source, cb, plate)
    
    MySQL.Async.fetchAll('SELECT * FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function(results)
        if results then
            cb(#results == 1)
        else
            cb(false)
        end
    end)

end)

RegisterServerEvent("disc-hotwire:AddItem")
AddEventHandler("disc-hotwire:AddItem", function(item_name,count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local targetItem = xPlayer.getInventoryItem(item_name)
    if targetItem.count + count < targetItem.limit then
        xPlayer.addInventoryItem(item_name, count)
    else
        TriggerClientEvent("esx:showNotification", source, "物品已達上限")
    end
    
end)

RegisterServerEvent("disc-hotwire:AddMoney")
AddEventHandler("disc-hotwire:AddMoney", function(count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addMoney(count)
end)

RegisterServerEvent('hotwireNotify')
AddEventHandler('hotwireNotify', function()
	TriggerClientEvent("hotwireEnable", source)
end)


--if you need you can translate it to your language
RegisterServerEvent('hotwireInProgress')
AddEventHandler('hotwireInProgress', function(street1, street2, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1.."~r~ and ~w~"..street2)
	TriggerClientEvent("outlawNotify", -1, "~r~偷車事件發生，性別 ~w~"..sex.." ，靠近 ~r~ "..street1.." ~w~ 以及 ~r~ "..street2)
end)
--if you need you can translate it to your language too
RegisterServerEvent('hotwireInProgressS1')
AddEventHandler('hotwireInProgressS1', function(street1, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1)
	TriggerClientEvent("outlawNotify", -1, "~r~偷車事件發生，性別 ~w~"..sex.." ~r~靠近 ~w~"..street1)
end)

RegisterServerEvent('hotwireInProgressPos')
AddEventHandler('hotwireInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('hotwirePlace', -1, gx, gy, gz)
end)


ESX.RegisterUsableItem('lockpick', function(source)
    -- Lockpick the closest car to them
    --local xPlayer = ESX.GetPlayerFromId(source)
    --xPlayer.removeInventoryItem('lockpick', 1)
    TriggerClientEvent('MF_LockPicking:StartMinigame',source)
end)

RegisterServerEvent('MF_LockPicking:MinigameComplete')
AddEventHandler('MF_LockPicking:MinigameComplete', function(didWin)
    if didWin then
        TriggerClientEvent('disc-hotwire:hotwire', source, true)
    end
end)