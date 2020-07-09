local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('sweep', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('esx_sweep:sweep')
end)