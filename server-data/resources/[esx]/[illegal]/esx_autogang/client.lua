-- create ballas and vagos custom dispatch areas
-- create different versions of config to spawn different shit
--[[Citizen.CreateThread(function()
	TriggerServerEvent('dispatch:createDispatch', Config)
end)--]]

ESX=nil

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
end)


-- Example of turning off a dispatch
-- Citizen.CreateThread(function()
-- 	-- waits 10s then turns off ballas disptach
-- 	Citizen.Wait(10000)
-- 	TriggerServerEvent('dispatch:stopDispatch', {'Ballas'})
-- end)

RegisterNetEvent('esx_autogang:start')
AddEventHandler('esx_autogang:start', function()
	TriggerServerEvent('dispatch:createDispatch', Config)
end)