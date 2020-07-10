ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_outlawalert:carJackInProgress')
AddEventHandler('esx_outlawalert:carJackInProgress', function(targetCoords)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, "10-60 偷車發生中")
	TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:burglaryInProgress')
AddEventHandler('esx_outlawalert:burglaryInProgress', function(targetCoords)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, "10-90H 搶劫民宅發生中")
	--TriggerClientEvent('esx_outlawalert:burglaryInProgress', -1, targetCoords)
	TriggerClientEvent('esx_outlawalert:carJackInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:combatInProgress')
AddEventHandler('esx_outlawalert:combatInProgress', function(targetCoords, streetName, playerGender)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawNotify', -1, _U('combat', playerGender, streetName))
	TriggerClientEvent('esx_outlawalert:combatInProgress', -1, targetCoords)
end)

RegisterServerEvent('esx_outlawalert:gunshotInProgress')
AddEventHandler('esx_outlawalert:gunshotInProgress', function(targetCoords, streetName, playerGender)
	if playerGender == 0 then
		playerGender = _U('male')
	else
		playerGender = _U('female')
	end

	TriggerClientEvent('esx_outlawalert:outlawGunShotNotify', -1, "10-71 開槍警報觸發", targetCoords)
	TriggerClientEvent('esx_outlawalert:gunshotInProgress', -1, targetCoords)
end)

ESX.RegisterServerCallback('esx_outlawalert:isVehicleOwner', function(source, cb, plate)
	local identifier = GetPlayerIdentifier(source, 0)

	MySQL.Async.fetchAll('SELECT owner FROM owned_vehicles WHERE owner = @owner AND plate = @plate', {
		['@owner'] = identifier,
		['@plate'] = plate
	}, function(result)
		if result[1] then
			cb(result[1].owner == identifier)
		else
			cb(false)
		end
	end)
end)
