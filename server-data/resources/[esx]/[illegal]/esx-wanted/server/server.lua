ESX                = nil
truyna			={}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent("esx-wanted:sendMugshot")
AddEventHandler("esx-wanted:sendMugshot", function(url)
	TriggerClientEvent("esx-wanted:syncMugshot", -1, url)
end)

RegisterServerEvent("esx-wanted:location")
AddEventHandler("esx-wanted:location", function(coords)
	local xPlayer = ESX.GetPlayerFromId(source)
	local name = xPlayer.getName()
	TriggerClientEvent("esx-wanted:showBlip", -1, source, coords, name)
end)

RegisterCommand("wanted", function(src, args, raw)
	local xPlayer = ESX.GetPlayerFromId(src)
	if xPlayer["job"]["name"] == Config.Job then
		local wantedPlayer = args[1]
		local wantedTime = tonumber(args[2])
		local wantedReason = args[3]
		if GetPlayerName(wantedPlayer) ~= nil then
			if wantedTime ~= nil then
				TriggerClientEvent("esx-wanted:getMugshot", wantedPlayer, wantedPlayer)
				WantedPlayer(wantedPlayer, wantedTime, wantedReason)
				TriggerClientEvent("esx:showNotification", src, GetPlayerName(wantedPlayer) .. " wanted in " .. wantedTime .. " min!")				
				if args[3] ~= nil then
					GetWantedPlayerName(wantedPlayer, function(Firstname, Lastname)
						TriggerClientEvent('chat:addMessage', -1, { args = { "WANTED",  Firstname .. " " .. Lastname .. " is wanted for reason: " .. args[3] }, color = { 249, 166, 0 } })
					end)
				end
			else
				TriggerClientEvent("esx:showNotification", src, "Time is invalid!")
			end
		else
			TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "You are not a cop!")
	end
end)

RegisterCommand("unwanted", function(src, args)

	local xPlayer = ESX.GetPlayerFromId(src)

	if xPlayer["job"]["name"] == Config.Job then

		local wantedPlayer = args[1]

		if GetPlayerName(wantedPlayer) ~= nil then
			UnWanted(wantedPlayer)
		else
			TriggerClientEvent("esx:showNotification", src, "This ID is not online!")
		end
	else
		TriggerClientEvent("esx:showNotification", src, "You are not a cop!")
	end
end)

RegisterServerEvent("esx-wanted:wantedPlayer")
AddEventHandler("esx-wanted:wantedPlayer", function(targetSrc, wantedTime, wantedReason)
	local src = source
	local targetSrc = tonumber(targetSrc)
	TriggerClientEvent("esx-wanted:getMugshot", targetSrc, targetSrc)	
	WantedPlayer(targetSrc, wantedTime, wantedReason)
end)

RegisterServerEvent("esx-wanted:unWantedPlayer")
AddEventHandler("esx-wanted:unWantedPlayer", function(targetIdentifier)
	local src = source
	local xPlayer = ESX.GetPlayerFromIdentifier(targetIdentifier)

	if xPlayer ~= nil then
		UnWanted(xPlayer.source)
	else
		MySQL.Async.execute(
			"UPDATE users SET wanted = @newWantedTime WHERE identifier = @identifier",
			{
				['@identifier'] = targetIdentifier,
				['@newWantedTime'] = 0
			}
		)
	end

	TriggerClientEvent("esx:showNotification", src, xPlayer.name .. " Unwanted!")
end)

RegisterServerEvent("esx-wanted:updateWantedTime")
AddEventHandler("esx-wanted:updateWantedTime", function(newWantedTime)
	local src = source

	EditwantedTime(src, newWantedTime)
end)

RegisterServerEvent("esx-wanted:unWanted")
AddEventHandler("esx-wanted:unWanted", function()
	TriggerClientEvent('esx-wanted:unWanted', -1, source)
end)

function WantedPlayer(wantedPlayer, wantedTime, wantedReason)
	print(wantedPlayer)
	local targetPlayer = ESX.GetPlayerFromId(wantedPlayer)
	local name = targetPlayer.getName()
	local Reason = wantedReason
	if Reason == nil or Reason == "" then
		Reason = 'Không rõ'
	end
	TriggerClientEvent("esx-wanted:wantedPlayer", wantedPlayer, wantedTime)
	TriggerClientEvent("esx-wanted:openui", -1, name, wantedTime, wantedPlayer, Reason)

	EditwantedTime(wantedPlayer, wantedTime)
end

function UnWanted(wantedPlayer)
	TriggerClientEvent("esx-wanted:unWantedPlayer", wantedPlayer)
	EditwantedTime(wantedPlayer, 0)
end

function EditwantedTime(source, wantedTime)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier
	MySQL.Async.execute(
       "UPDATE users SET wanted = @newWantedTime WHERE identifier = @identifier",
        {
			['@identifier'] = Identifier,
			['@newWantedTime'] = tonumber(wantedTime)
		}
	)
end

function GetWantedPlayerName(playerId, data)
	local Identifier = ESX.GetPlayerFromId(playerId).identifier
	MySQL.Async.fetchAll("SELECT firstname, lastname FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
		data(result[1].firstname, result[1].lastname)
	end)
end

ESX.RegisterServerCallback("esx-wanted:retrieveWantededPlayers", function(source, cb)	
	local wantededPersons = {}
	MySQL.Async.fetchAll("SELECT firstname, lastname, wanted, identifier FROM users WHERE wanted > @wanted", { ["@wanted"] = 0 }, function(result)
		for i = 1, #result, 1 do
			table.insert(wantededPersons, { name = result[i].firstname .. " " .. result[i].lastname, wantedTime = result[i].wanted, identifier = result[i].identifier })
		end
		cb(wantededPersons)
	end)
end)

ESX.RegisterServerCallback("esx-wanted:retrieveWantedTime", function(source, cb)
	local src = source
	local xPlayer = ESX.GetPlayerFromId(src)
	local Identifier = xPlayer.identifier
	MySQL.Async.fetchAll("SELECT wanted FROM users WHERE identifier = @identifier", { ["@identifier"] = Identifier }, function(result)
		local WantedTime = tonumber(result[1].wanted)
		if WantedTime ~= nil and WantedTime > 0 then
			cb(true, WantedTime)
		else
			cb(false, 0)
		end
	end)
end)