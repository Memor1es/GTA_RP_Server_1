ESX = nil


TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_mushroom:pickedUpCannabis')
AddEventHandler('esx_mushroom:pickedUpCannabis', function()
	local xPlayer = ESX.GetPlayerFromId(source)
	--[[local xItem = xPlayer.getInventoryItem('mushroom_d')

	if xItem.limit ~= -1 and (xItem.count + 1) > xItem.limit then
		TriggerClientEvent('esx:showNotification', _source, _U('weed_inventoryfull'))
	else
		xPlayer.addInventoryItem(xItem.name, 1)
	end--]]
	xPlayer.addInventoryItem('mushroom_d', 1)
end)

ESX.RegisterServerCallback('esx_mushroom:canPickUp', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	--[[local xItem = xPlayer.getInventoryItem(item)
	print(xItem.limit)
	if xItem == nil then
		cb(true)
	elseif xItem.limit ~= -1 and xItem.count >= xItem.limit then
		cb(false)
	else
		cb(true)
	end--]]
	if xPlayer.canCarryItem(item,1) then
		cb(true)
	else
		cb(false)
	end
end)
