local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('startfight', 'admin', function(xPlayer, args, showError)

	xPlayer.triggerEvent("esx_autogang:start")
	
end, true, {help = "開打", validate = true})

