local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('rag', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.triggerEvent('esx_cleantable:clean')
end)