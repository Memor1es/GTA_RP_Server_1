ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('eff:onyoga')
AddEventHandler('eff:onyoga', function()
    local _source = source
    TriggerClientEvent('esx_status:remove', _source, 'stress', 350000)
end)

RegisterServerEvent('eff:onspor')
AddEventHandler('eff:onspor', function()
    local _source = source
    TriggerClientEvent('esx_status:remove', _source, 'thirst', 100000)
end)

RegisterServerEvent('eff:eau')
AddEventHandler('eff:eau', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local gtmny = xPlayer.getMoney(Config.sufiyat)
    if gtmny >= Config.sufiyat then
        xPlayer.removeMoney(Config.sufiyat)
        xPlayer.addInventoryItem('water', 1)
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'error', text = 'Vous n\'avez pas assez d\'argent.', length = 5000 })
    end
end)