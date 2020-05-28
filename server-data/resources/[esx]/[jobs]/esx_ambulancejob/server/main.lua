ESX = nil
local playersHealing, deadPlayers = {}, {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx_ambulancejob:revive')
AddEventHandler('esx_ambulancejob:revive', function(playerId)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and xPlayer.job.name == 'ambulance' then
		local xTarget = ESX.GetPlayerFromId(playerId)

		if xTarget then
			xPlayer.showNotification(_U('revive_complete_award', xTarget.name, Config.ReviveReward))
			xPlayer.addMoney(Config.ReviveReward)
			xTarget.triggerEvent('esx_ambulancejob:revive')
		else
			xPlayer.showNotification(_U('revive_fail_offline'))
		end
	elseif xPlayer and xPlayer.job.name == 'Sambulance' then
		local xTarget = ESX.GetPlayerFromId(playerId)

		if xTarget then
			xPlayer.showNotification(_U('revive_complete_award', xTarget.name, Config.ReviveReward))
			xTarget.triggerEvent('esx_ambulancejob:revive')
		else
			xPlayer.showNotification(_U('revive_fail_offline'))
		end
	end
end)

RegisterNetEvent('esx_ambulancejob:heal')
AddEventHandler('esx_ambulancejob:heal', function(target, type)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:heal', target, type)
	end
end)

RegisterNetEvent('esx_ambulancejob:putInVehicle')
AddEventHandler('esx_ambulancejob:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name == 'ambulance' then
		TriggerClientEvent('esx_ambulancejob:putInVehicle', target)
	end
end)

TriggerEvent('esx_phone:registerNumber', 'ambulance', _U('alert_ambulance'), true, true)

TriggerEvent('esx_society:registerSociety', 'ambulance', 'Ambulance', 'society_ambulance', 'society_ambulance', 'society_ambulance', {type = 'public'})

ESX.RegisterServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	if Config.RemoveCashAfterRPDeath then
		if xPlayer.getMoney() > 0 then
			xPlayer.removeMoney(xPlayer.getMoney())
		end

		if xPlayer.getAccount('black_money').money > 0 then
			xPlayer.setAccountMoney('black_money', 0)
		end
	end

	if Config.RemoveItemsAfterRPDeath then
		for i=1, #xPlayer.inventory, 1 do
			if xPlayer.inventory[i].count > 0 then
				xPlayer.setInventoryItem(xPlayer.inventory[i].name, 0)
			end
		end
	end

	local playerLoadout = {}
	if Config.RemoveWeaponsAfterRPDeath then
		for i=1, #xPlayer.loadout, 1 do
			xPlayer.removeWeapon(xPlayer.loadout[i].name)
		end
	else -- save weapons & restore em' since spawnmanager removes them
		for i=1, #xPlayer.loadout, 1 do
			table.insert(playerLoadout, xPlayer.loadout[i])
		end

		-- give back wepaons after a couple of seconds
		Citizen.CreateThread(function()
			Citizen.Wait(5000)
			for i=1, #playerLoadout, 1 do
				if playerLoadout[i].label ~= nil then
					xPlayer.addWeapon(playerLoadout[i].name, playerLoadout[i].ammo)
				end
			end
		end)
	end

	cb()
end)

if Config.EarlyRespawnFine then
	ESX.RegisterServerCallback('esx_ambulancejob:checkBalance', function(source, cb)
		local xPlayer = ESX.GetPlayerFromId(source)
		local bankBalance = xPlayer.getAccount('bank').money

		cb(bankBalance >= Config.EarlyRespawnFineAmount)
	end)

	RegisterNetEvent('esx_ambulancejob:payFine')
	AddEventHandler('esx_ambulancejob:payFine', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		local fineAmount = Config.EarlyRespawnFineAmount

		xPlayer.showNotification(_U('respawn_bleedout_fine_msg', ESX.Math.GroupDigits(fineAmount)))
		xPlayer.removeAccountMoney('bank', fineAmount)
	end)
end

ESX.RegisterServerCallback('esx_ambulancejob:getItemAmount', function(source, cb, item)
	local xPlayer = ESX.GetPlayerFromId(source)
	local quantity = xPlayer.getInventoryItem(item).count

	cb(quantity)
end)

ESX.RegisterServerCallback('esx_ambulancejob:buyJobVehicle', function(source, cb, vehicleProps, type)
	local xPlayer = ESX.GetPlayerFromId(source)
	local price = getPriceFromHash(vehicleProps.model, xPlayer.job.grade_name, type)

	-- vehicle model not found
	if price == 0 then
		cb(false)
	else
		if xPlayer.getMoney() >= price then
			xPlayer.removeMoney(price)

			MySQL.Async.execute('INSERT INTO owned_vehicles (owner, vehicle, plate, type, job, `stored`) VALUES (@owner, @vehicle, @plate, @type, @job, @stored)', {
				['@owner'] = xPlayer.identifier,
				['@vehicle'] = json.encode(vehicleProps),
				['@plate'] = vehicleProps.plate,
				['@type'] = type,
				['@job'] = xPlayer.job.name,
				['@stored'] = true
			}, function (rowsChanged)
				cb(true)
			end)
		else
			cb(false)
		end
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:storeNearbyVehicle', function(source, cb, nearbyVehicles)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundPlate, foundNum

	for k,v in ipairs(nearbyVehicles) do
		local result = MySQL.Sync.fetchAll('SELECT plate FROM owned_vehicles WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = v.plate,
			['@job'] = xPlayer.job.name
		})

		if result[1] then
			foundPlate, foundNum = result[1].plate, k
			break
		end
	end

	if not foundPlate then
		cb(false)
	else
		MySQL.Async.execute('UPDATE owned_vehicles SET `stored` = true WHERE owner = @owner AND plate = @plate AND job = @job', {
			['@owner'] = xPlayer.identifier,
			['@plate'] = foundPlate,
			['@job'] = xPlayer.job.name
		}, function (rowsChanged)
			if rowsChanged == 0 then
				cb(false)
			else
				cb(true, foundNum)
			end
		end)
	end
end)

function getPriceFromHash(hashKey, jobGrade, type)
	if type == 'helicopter' then
		local vehicles = Config.AuthorizedHelicopters[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	elseif type == 'car' then
		local vehicles = Config.AuthorizedVehicles[jobGrade]

		for k,v in ipairs(vehicles) do
			if GetHashKey(v.model) == hashKey then
				return v.price
			end
		end
	end

	return 0
end

RegisterNetEvent('esx_ambulancejob:removeItem')
AddEventHandler('esx_ambulancejob:removeItem', function(item)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem(item, 1)

	if item == 'bandage' then
		xPlayer.showNotification(_U('used_bandage'))
	elseif item == 'medikit' then
		xPlayer.showNotification(_U('used_medikit'))
	elseif item == 'jackknife' then
		xPlayer.showNotification(_U('used_jackknife'))
		xPlayer.addInventoryItem('dirtyjackknife', 1)
	elseif item == 'plasma' then
		xPlayer.showNotification(_U('used_plasma'))
	elseif item == 'mor' then
		xPlayer.showNotification(_U('used_mor'))
	elseif item == 'lido' then
		xPlayer.showNotification(_U('used_lido'))
	elseif item == 'dirtyjackknife' then
		xPlayer.showNotification(_U('used_dirtyjackknife'))
		xPlayer.addInventoryItem('jackknife', 1)
	end
end)

RegisterNetEvent('esx_ambulancejob:giveItem')
AddEventHandler('esx_ambulancejob:giveItem', function(itemName, amount)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.job.name ~= 'ambulance' then
		print(('[esx_ambulancejob] [^2INFO^7] "%s" attempted to spawn in an item!'):format(xPlayer.identifier))
		return
	end

	if xPlayer.canCarryItem(itemName, amount) then
		xPlayer.addInventoryItem(itemName, amount)
	else
		xPlayer.showNotification(_U('max_item'))
	end
end)

TriggerEvent('es:addGroupCommand', 'revive', 'admin', function(source, args, user)
	if args[1] then
		local playerId = tonumber(args[1])
		
		if playerId and ESX.GetPlayerFromId(playerId) then
			TriggerClientEvent('esx_ambulancejob:revive', playerId)
		else
			TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
		end
	else
		TriggerClientEvent('esx_ambulancejob:revive', source)
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, { help = _U('revive_help'), params = {{ name = 'playerId' }} })

ESX.RegisterUsableItem('medikit', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('medikit', 1)

		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'medikit')

		Citizen.Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterUsableItem('bandage', function(source)
	if not playersHealing[source] then
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeInventoryItem('bandage', 1)

		playersHealing[source] = true
		TriggerClientEvent('esx_ambulancejob:useItem', source, 'bandage')

		Citizen.Wait(10000)
		playersHealing[source] = nil
	end
end)

ESX.RegisterServerCallback('esx_ambulancejob:getDeathStatus', function(source, cb)
	local identifier = GetPlayerIdentifiers(source)[1]

	MySQL.Async.fetchScalar('SELECT is_dead FROM users WHERE identifier = @identifier', {
		['@identifier'] = identifier
	}, function(isDead)
		if isDead then
			print(('[esx_ambulancejob] [^2INFO^7] "%s" attempted combat logging'):format(identifier))
		end

		cb(isDead)
	end)
end)

RegisterNetEvent('esx_ambulancejob:setDeathStatus')
AddEventHandler('esx_ambulancejob:setDeathStatus', function(isDead)
	local identifier = GetPlayerIdentifiers(source)[1]

	if type(isDead) == 'boolean' then
		MySQL.Sync.execute('UPDATE users SET is_dead = @isDead WHERE identifier = @identifier', {
			['@identifier'] = identifier,
			['@isDead'] = isDead
		})
	end
end)

RegisterNetEvent('esx_ambulancejob:setEffect')
AddEventHandler('esx_ambulancejob:setEffect', function(EffectName,target)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer == nil then
		return
	end
	
	if EffectName == 'weed' then
		TriggerClientEvent('esx_drugeffects:onWeed', target)
	elseif EffectName == 'mor' then
		TriggerClientEvent('esx_drugeffects:onmor', target)
	elseif EffectName == 'meth' then
		TriggerClientEvent('esx_drugeffects:onMeth', target)
	elseif EffectName == 'coke' then
		TriggerClientEvent('esx_drugeffects:onCoke', target)
	elseif EffectName == 'opium' then
		TriggerClientEvent('esx_drugeffects:onOpium', target)
	end
end)

RegisterCommand('setjobSambulance', function(source, args)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	if xPlayer then

		if xPlayer.getInventoryItem('Sambulancelicense') ~= nil then
			if xPlayer.getInventoryItem('Sambulancelicense').count >0 then
				xPlayer.setJob("Sambulance", 0)
			end
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'U are not online.' } })
	end
end)


ESX.RegisterCommand('revive', 'admin', function(xPlayer, args, showError)
	--if args[1] then
		--local playerId = tonumber(args[1])
		
		if ESX.GetPlayerFromId(args.playerId) then
			TriggerClientEvent('esx_ambulancejob:revive', args.playerId)
		else
			--TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			xPlayer.triggerEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
		end
	--end

end, true, {help = _U('revive_help'), validate = true, arguments = {
    {name = 'playerId', help = "玩家ID", type = 'player'}

}})

ESX.RegisterCommand('reviveme', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_ambulancejob:revive')
end, true, {help = _U('revive_help'), validate = true

})

ESX.RegisterCommand('heal', 'admin', function(xPlayer, args, showError)
	--if args[1] then
		--local playerId = tonumber(args[1])
		
		if ESX.GetPlayerFromId(args.playerId) then
			if GetPlayerName(args.playerId) then
				--print(('esx_basicneeds: %s healed %s'):format(GetPlayerIdentifier(source, 0), GetPlayerIdentifier(playerId, 0)))
				TriggerClientEvent('esx_basicneeds:healPlayer', args.playerId)
				xPlayer.triggerEvent('chat:addMessage', source, { args = { '^5HEAL', 'You have been healed.' } })
			else
				xPlayer.triggerEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			end
		else
			--TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
			xPlayer.triggerEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Player not online.' } })
		end
	--end

end, true, {help = "幫復", validate = true, arguments = {
    {name = 'playerId', help = "玩家ID", type = 'player'}

}})

ESX.RegisterCommand('healme', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_basicneeds:healPlayer')
end, true, {help = "回復體力", validate = true

})

RegisterNetEvent('esx:onPlayerDeath')
AddEventHandler('esx:onPlayerDeath', function(data)
	deadPlayers[source] = 'dead'
	TriggerClientEvent('esx_ambulancejob:setDeadPlayers', -1, deadPlayers)
end)

RegisterNetEvent('esx_ambulancejob:onPlayerDistress')
AddEventHandler('esx_ambulancejob:onPlayerDistress', function()
	--local xPlayer = ESX.GetPlayerFromId(source)
	--xPlayer.showNotification("送出")
	if deadPlayers[source] then
		--print("send")
		--xPlayer.showNotification("送了")
		deadPlayers[source] = 'distress'
		TriggerClientEvent('esx_ambulancejob:setDeadPlayers', -1, deadPlayers)
	end
end)

RegisterNetEvent('esx:onPlayerSpawn')
AddEventHandler('esx:onPlayerSpawn', function()
	if deadPlayers[source] then
		deadPlayers[source] = nil
		TriggerClientEvent('esx_ambulancejob:setDeadPlayers', -1, deadPlayers)
	end
end)

AddEventHandler('esx:playerDropped', function(playerId, reason)
	if deadPlayers[playerId] then
		deadPlayers[playerId] = nil
		TriggerClientEvent('esx_ambulancejob:setDeadPlayers', -1, deadPlayers)
	end
end)