ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterCommand('adminooc', 'admin', function(xPlayer, args, showError)
    xPlayer.triggerEvent('mdt:toggle')

end, true, {help = "mdt", validate = true})