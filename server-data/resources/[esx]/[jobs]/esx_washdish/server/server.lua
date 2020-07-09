local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('bawl', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('esx_washdish:wash')
end)