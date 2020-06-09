local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('spawn', 'admin', function(xPlayer, args, showError)

	xPlayer.triggerEvent("pd-spawn")
	
end, true, {help = "出生", validate = true})

