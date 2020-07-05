------------------------------------------
--	iEnsomatic RealisticVehicleFailure  --
------------------------------------------
--
--	Created by Jens Sandalgaard
--
--	This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
--
--	https://github.com/iEns/RealisticVehicleFailure
--
ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)



local function checkWhitelist(id)
	for key, value in pairs(RepairWhitelist) do
		if id == value then
			return true
		end
	end	
	return false
end

TriggerEvent('es:addGroupCommand', 'clear', 'admin', function(source, args, user)
	print('here')
    TriggerClientEvent('RealisticVehicleFailure:repair', source)
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end, {help = 'repair your car'})

--[[
AddEventHandler('chatMessage', function(source, _, message)
	local msg = string.lower(message)
	local identifier = GetPlayerIdentifiers(source)[1]
	if msg == "/repair" then
		CancelEvent()
		if RepairEveryoneWhitelisted == true then
			--TriggerClientEvent('iens:repair', source)
			TriggerClientEvent('RealisticVehicleFailure:repair', source)
		else
			if checkWhitelist(identifier) then
				TriggerClientEvent('iens:repair', source)
			else
				TriggerClientEvent('iens:notAllowed', source)
			end
		end
	end
end)
--]]
ESX.RegisterServerCallback('RealisticVehicleFailure:RemoveMoney', function(source, cb, price)
	--print(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	--print(xPlayer)
    if (xPlayer.getMoney() >= price) then
        xPlayer.removeMoney(price)
        cb(price)
    else
        cb(-1)
    end
end)

RegisterServerEvent('RealisticVehicleFailure:addMoney')
AddEventHandler('RealisticVehicleFailure:addMoney', function(price)
	print(price)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(price)
end)