ESX                  = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(10)
  end
end)

local barraON = true
local isDiving = false
local voice = false

Citizen.CreateThread(function()
	TriggerEvent("templarrp_status:desativar")
  while true do
    Citizen.Wait(2000)
        local ped = PlayerPedId()
        local health = GetEntityHealth(ped)
        local armor = GetPedArmour(ped)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            food = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'drug', function(status)
            drugs = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'drunk', function(status)
            drunk = status.val / 10000
        end)
        --gift tree
        TriggerEvent('esx_status:getStatus', 'str', function(status)
            str = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'agi', function(status)
            agi = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'int', function(status)
            int = status.val / 10000
        end)

        TriggerEvent('esx_status:getStatus', 'luk', function(status)
            luk = status.val / 10000
        end)


        SendNUIMessage({
			stats = true,
            heal = health,
            voiceVolume = volume,
            armor = armor,
            thirst = thirst,
            food = food,
            drugs = drugs,
            drunk = drunk,
            str = str,
            agi = agi,
            int = int,
            luk = luk
        });

  end
end)

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(500)
        local diving = GetPlayerUnderwaterTimeRemaining(PlayerId())

        if diving > 100 and diving <= 1500.00 then
            diving = 100
        else
            diving = diving *10
        end

        if IsPedSwimmingUnderWater(GetPlayerPed(-1)) then
            isDiving = true

            SendNUIMessage({
                isDiving = isDiving,
                diving = diving
            });
        end

  end
end)


--[[RegisterCommand("barras",function()
	TriggerEvent("templarrp_status:hud")
end)]]

TriggerEvent('chat:addSuggestion', '/hud2', 'Ativa/Desativa o hud da vida, comida, etc..')

RegisterNetEvent("templarrp_status:hud")
AddEventHandler("templarrp_status:hud", function()
    if barraON then 
        barraON = false
        opacity = 0
    else
        barraON = true
        opacity = 255
    end

    SendNUIMessage({
        update = true,
        opacity = opacity,
    });
	
end)

RegisterNetEvent("templarrp_status:ativar")
AddEventHandler("templarrp_status:ativar", function()
        barraON = true
        opacity = 255

    SendNUIMessage({
        update = true,
        opacity = opacity,
    });
	
end)

RegisterNetEvent("templarrp_status:desativar")
AddEventHandler("templarrp_status:desativar", function()
        barraON = false
        opacity = 0

    SendNUIMessage({
        update = true,
        opacity = opacity,
    });
	
end)

Citizen.CreateThread(function() while true do Citizen.Wait(30000) collectgarbage() end end) -- Fix RAM leaks by collecting garbage
