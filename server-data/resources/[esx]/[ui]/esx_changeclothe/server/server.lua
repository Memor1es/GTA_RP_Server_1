local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('watch', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('esx_watch:ShowTime')
end)