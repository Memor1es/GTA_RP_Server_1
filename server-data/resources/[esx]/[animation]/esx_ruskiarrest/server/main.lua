-- Skrypt od strony Serwera

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_ruski_areszt:startAreszt')
AddEventHandler('esx_ruski_areszt:startAreszt', function(arrest)
	local arrestPlayer = ESX.GetPlayerFromId(arrest)
	TriggerClientEvent('esx_ruski_areszt:aresztowany', source, arrestPlayer.source)
	TriggerClientEvent('esx_ruski_areszt:aresztuj', arrestPlayer.source, source)
end)