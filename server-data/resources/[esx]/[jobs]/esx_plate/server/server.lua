local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('plate', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('esx_plate:plate')
end)