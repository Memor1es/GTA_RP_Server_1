ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local activity = 0
local activitySource = 0
local cooldown = 0

RegisterServerEvent('esx_carthief:pay')
AddEventHandler('esx_carthief:pay', function(payment)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	--xPlayer.addAccountMoney('black_money',tonumber(payment))
	xPlayer.addMoney(tonumber(payment))
	TriggerClientEvent('esx:showNotification', _source, '這趟走私車賺了' .. '~g~ $' .. tonumber(payment) .. '')
	--Add cooldown
	cooldown = Config.CooldownMinutes * 60000
end)

ESX.RegisterServerCallback('esx_carthief:anycops',function(source, cb)
  local anycops = 0
  local playerList = ESX.GetPlayers()
  for i=1, #playerList, 1 do
    local _source = playerList[i]
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerjob = xPlayer.job.name
    if playerjob == 'police' then
      anycops = anycops + 1
    end
  end
  cb(anycops)
end)

ESX.RegisterServerCallback('esx_carthief:isActive',function(source, cb)
  cb(activity, cooldown)
end)

RegisterServerEvent('esx_carthief:registerActivity')
AddEventHandler('esx_carthief:registerActivity', function(value)
	activity = value
	if value == 1 then
		activitySource = source
		--carthiefCooldown = 30 * 60000
		--Send notification to cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local identifiers = GetPlayerIdentifiers(xPlayers[i])[1]
			if xPlayer.job.name == 'police' or identifiers == "steam:11000011456dd03" then
				TriggerClientEvent('esx_carthief:setcopnotification', xPlayers[i])
			end
		end
	else
		--carthiefCooldown = 30 * 60000
		activitySource = 0
	end
end)

RegisterServerEvent('esx_carthief:alertcops')
AddEventHandler('esx_carthief:alertcops', function(cx,cy,cz)
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local identifiers = GetPlayerIdentifiers(xPlayers[i])[1]
		if xPlayer.job.name == 'police' or identifiers == "steam:11000011456dd03" then
			TriggerClientEvent('esx_carthief:setcopblip', xPlayers[i], cx,cy,cz)
		end
	end
end)

RegisterServerEvent('esx_carthief:stopalertcops')
AddEventHandler('esx_carthief:stopalertcops', function()
	local source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	local xPlayers = ESX.GetPlayers()
	
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		local identifiers = GetPlayerIdentifiers(xPlayers[i])[1]
		if xPlayer.job.name == 'police' or identifiers == "steam:11000011456dd03" then
			TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
		end
	end
end)

AddEventHandler('playerDropped', function ()
	local _source = source
	if _source == activitySource then
		--Remove blip for all cops
		local xPlayers = ESX.GetPlayers()
		for i=1, #xPlayers, 1 do
			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
			local identifiers = GetPlayerIdentifiers(xPlayers[i])[1]
			if xPlayer.job.name == 'police' or identifiers == "steam:11000011456dd03" then
				TriggerClientEvent('esx_carthief:removecopblip', xPlayers[i])
			end
		end
		--Set activity to 0
		activity = 0
		activitySource = 0
	end
end)

--Cooldown manager
AddEventHandler('onResourceStart', function(resource)
	while true do
		Wait(5000)
		if cooldown > 0 then
			cooldown = cooldown - 5000
		end
	end
end)


RegisterCommand('ticket', function(source, args)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then

		if xPlayer.getInventoryItem('carthieflicense') ~= nil then
			if xPlayer.getInventoryItem('carthieflicense').count >0 then

				local item = 'carthiefticket'
				local count = tonumber(args[1])

				if count then
					if xPlayer.getInventoryItem(item) then
						xPlayer.addInventoryItem(item, count)
					else
						TriggerClientEvent('esx:showNotification', source, _U('invalid_item'))
					end
				else
					TriggerClientEvent('esx:showNotification', source, _U('invalid_amount'))
				end
			else
				TriggerClientEvent('esx:showNotification', source, "你沒有車行執照")
			end
		else
			TriggerClientEvent('esx:showNotification', source, "請先打聽車行執照")
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'U are not online.' } })
	end
end)

RegisterServerEvent("esx_carthief:RemoveItem")
AddEventHandler("esx_carthief:RemoveItem", function(item_name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.removeInventoryItem(item_name, 1)
end)

ESX.RegisterServerCallback('esx_carthief:getItemAmount', function(source, cb, item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local qtty = xPlayer.getInventoryItem(item).count
    cb(qtty)
end)

RegisterServerEvent("esx_carthief:AddItem")
AddEventHandler("esx_carthief:AddItem", function(item_name)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    xPlayer.addInventoryItem(item_name, 1)
end)

RegisterServerEvent('esx_carthief:AddCooldown')
AddEventHandler('esx_carthief:AddCooldown', function(time)
	--Add cooldown
	cooldown = time * 60000
end)