local is_on = false
--ESX = nil

--TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('int_prisonfull:setprison')
AddEventHandler('int_prisonfull:setprison', function(flag)
    is_on = flag
    for _,player in ipairs(GetActivePlayers()) do
        local ped = GetPlayerPed(player)

        if DoesEntityExist(ped) then
            if is_on then
                TriggerClientEvent('int_prisonfull:on',player)
            else
                TriggerClientEvent('int_prisonfull:off',player)
            end
        end
    end
end)
--[[
ESX.RegisterServerCallback('int_prisonfull:getflag', function(source, cb)
	--local xPlayer = ESX.GetPlayerFromId(target)

	cb(is_on)
end)
--]]

RegisterNetEvent('int_prisonfull:getflag')
AddEventHandler('int_prisonfull:getflag', function(flag)
    return is_on
end)
