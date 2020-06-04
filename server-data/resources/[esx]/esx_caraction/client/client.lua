ESX = nil
local ability = nil
local timer   = 0

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)
--[[
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
    end
end)
--]]


RegisterNetEvent('FlipVehicle')
AddEventHandler('FlipVehicle', function()

    local playerPed = PlayerPedId()
    local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

    if IsPedInAnyVehicle(playerPed, true) then
        vehicle = GetVehiclePedIsIn(playerPed, false)
    end

    while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
        Citizen.Wait(100)
        NetworkRequestControlOfEntity(vehicle)
        attempt = attempt + 1
    end

    if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
        SetEntityQuaternion(vehicle,quat(120, vector3(0, 1, 0)*SetEntityQuaternion(vehicle)) 
    end
end)

