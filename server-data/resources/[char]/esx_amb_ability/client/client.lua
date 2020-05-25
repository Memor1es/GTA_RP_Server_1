ESX = nil
local ability = nil
local timer   = 0
--local ability_level = 0

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


RegisterNetEvent('esx_amb_ability:generateBandage')
AddEventHandler('esx_amb_ability:generateBandage', function()
    if timer then
        ESX.shownotification("技能冷卻中")
    elseif exports["esx_ability"]:CheckAbilityRange() then
        TriggerEvent("mythic_progressbar:client:progress", {
            name = "loot_body",
            duration = 5 * 1000,
            label = "製作中...",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "anim@heists@money_grab@duffel",
                anim = "enter"
            },
        }, function(status)
            if not status then
                TriggerServerEvent("esx_amb_ability:giveItem",'bandage',1)
                timer = timer + Config.cooltime
            end
        end)
    else
        ESX.shownotification("啊!製作~r~失敗~")
        timer = timer + Config.cooltime
    end
end)

RegisterNetEvent('esx_amb_ability:generateMedkit')
AddEventHandler('esx_amb_ability:generateMedkit', function()
    if timer then
        ESX.shownotification("技能冷卻中")
    elseif exports["esx_ability"]:CheckAbilityRange() then
        TriggerEvent("mythic_progressbar:client:progress", {
            name = "loot_body",
            duration = 5 * 1000,
            label = "製作中...",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "anim@heists@money_grab@duffel",
                anim = "enter"
            },
        }, function(status)
            if not status then
                TriggerServerEvent("esx_amb_ability:giveItem",'medikit',1)
                timer = timer + Config.cooltime
            end
        end)
    else
        ESX.shownotification("啊!製作~r~失敗~")
        timer = timer + Config.cooltime
    end
end)

Citizen.CreateThread(function()
    while true do
        if timer then
            timer = timer -1
            Citizen.Wait(0)
        end
    end
end)
