ESX = nil
local ability = nil
local text_timer = 0
local ability_level = 0


Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
    
    while ability == nil do
        Citizen.Wait(50)
        TriggerServerEvent("esx_ability:checkability")
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

RegisterNetEvent('esx_ability:setability')
AddEventHandler('esx_ability:setability', function(skill)
    ability = skill
    TriggerServerEvent('esx_ability:setability',skill)
end)

RegisterNetEvent('esx_ability:setlevel')
AddEventHandler('esx_ability:setlevel', function(level)
    ability_level = level
    TriggerServerEvent('esx_ability:setlevel',level)
end)

RegisterNetEvent('esx_ability:levelup')
AddEventHandler('esx_ability:levelup', function(num)
    ability_level = ability_level + num
    TriggerServerEvent('esx_ability:levelup',num)
end)

RegisterNetEvent('esx_ability:levelreset')
AddEventHandler('esx_ability:levelreset', function()
    ability_level = 0
    TriggerServerEvent('esx_ability:setlevel',0)
end)

function GetAbility()
	return ability
end

function GetAbilityLevel()
	return ability_level
end

function parseability()
    return ability_level
end

function CheckAbilityRange()
    local ran = math.random(0,100)
    --ran = math.random(0,100)
    if ability_level <= Config.LevelRange.low then
        if ran <= Config.LevelPercent.low then
            return true
        end
    elseif ability_level <= Config.LevelRange.mid then
        if ran <= Config.LevelPercent.mid then
            return true
        end
    elseif ability_level <= Config.LevelRange.high then
        if ran <= Config.LevelPercent.high then
            return true
        end
    else
        if ran <= Config.LevelPercent.veryhigh then
            return true
        end
    end

	return false
end

function DrawMissionText(text)
    SetTextScale(0.5, 0.5)
    SetTextFont(1)
    SetTextProportional(1)
    SetTextEdge(2, 0, 0, 0, 150)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextOutline()
    AddTextComponentString(text)
    DrawText(0.5,0.955)
end

RegisterNetEvent('esx_ability:setText')
AddEventHandler('esx_ability:setText', function(text)
    if text_timer <=0 then
        text_timer = Config.texttime
        Citizen.CreateThread(function()
            while text_timer do
                DrawMissionText(text)
                Citizen.Wait(0)
            end
        end)
    end
end)

Citizen.CreateThread(function()
    while true do
        if text_timer then
            text_timer = text_timer -1
            Citizen.Wait(0)
        end
    end
end)


