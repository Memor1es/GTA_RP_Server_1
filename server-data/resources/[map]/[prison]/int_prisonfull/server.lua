local is_on = false
--ESX = nil

--TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('int_prisonfull:setprison')
AddEventHandler('int_prisonfull:setprison', function(flag)
    is_on = flag
end)
--[[
ESX.RegisterServerCallback('int_prisonfull:getflag', function(source, cb)
	--local xPlayer = ESX.GetPlayerFromId(target)

	cb(is_on)
end)

--]]