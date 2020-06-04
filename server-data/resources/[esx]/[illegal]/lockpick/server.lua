ESX = nil

-- ESX
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- ESX.RegisterUsableItem('lockpick', function(source)
-- 	local xPlayer = ESX.GetPlayerFromId(source)

-- 	TriggerClientEvent('lockpick:usar', source)
-- end)



AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
	if item.name == 'lockpick' then
		TriggerClientEvent('lockpick:addcalc', source)
	end
end)

AddEventHandler('esx:onRemoveInventoryItem', function(source, item, count)
	if item.name == 'lockpick' and item.count < 1 then
		TriggerClientEvent('lockpick:removecalc', source)
	end
end)

RegisterNetEvent('lockpick:removeitem')
AddEventHandler('lockpick:removeitem', function()
	local _source = source 
	local xPlayer = ESX.GetPlayerFromId(_source)
		xPlayer.removeInventoryItem('lockpick', 1)
end)

RegisterNetEvent('lockpick:openhtml')
AddEventHandler('lockpick:openhtml', function()
	TriggerClientEvent('lockpick:openlockpick', source)
end)

RegisterNetEvent('lockpick:MinigameComplete')
AddEventHandler('lockpick:MinigameComplete', function() 
	print("win!!")
end)