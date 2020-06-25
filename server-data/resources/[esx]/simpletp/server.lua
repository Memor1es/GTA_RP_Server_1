ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('simpletp:firstspawnmoney')
AddEventHandler('simpletp:firstspawnmoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	print(xPlayer.getMoney())
	xPlayer.addMoney(10000)
	xPlayer.addInventoryItem('phone', 1)
end)