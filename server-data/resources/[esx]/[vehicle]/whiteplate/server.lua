ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

--RegisterCommand("tablica", function(source, args, raw)
--    local src = source
--    TriggerClientEvent("foka_tablice:command", src)
--end)

RegisterServerEvent('foka_tablice:pay')
AddEventHandler('foka_tablice:pay', function()
	local _source = source
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeMoney(Config.money)
end)