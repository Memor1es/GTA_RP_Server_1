ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('onyx:updateSearchedVehTable')
AddEventHandler('onyx:updateSearchedVehTable', function(plate)
    local _source = source
    local vehPlate = plate

    TriggerClientEvent('onyx:returnSearchedVehTable', -1, vehPlate)
end)

RegisterServerEvent('onyx:reqHotwiring')
AddEventHandler('onyx:reqHotwiring', function(plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getInventoryItem('lockpick').count > 0 then
        TriggerClientEvent('onyx:beginHotwire', source, plate)
        local rnd = math.random(1, 2)
        if rnd == 1 then
            xPlayer.removeInventoryItem('lockpick', 1)
            xPlayer.showNotification("你的 ~o~開鎖工具 ~r~壞掉 ~s~了")
            -- TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'error', text = 'Your lockpick has broken'})
        end
    else
        xPlayer.showNotification("你身上 ~r~沒有 ~o~開鎖工具")
        -- TriggerClientEvent('mythic_notify:client:SendAlert', source, {type = 'error', text = 'You have no lockpicks'})
    end
end)