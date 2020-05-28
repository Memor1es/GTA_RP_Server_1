local is_on = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterCommand("alarm_on", function(source, args, rawCommand)
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    EnableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StartAlarm("PRISON_ALARMS", true)
        is_on = true
        TriggerServerEvent("int_prisonfull:setprison",is_on)
    end)
end, false)

RegisterCommand("alarm_off", function(source, args, rawCommand)
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    DisableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StopAllAlarms(true)
        is_on = false
        TriggerServerEvent("int_prisonfull:setprison",is_on)
    end)
end, false)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('int_prisonfull:getflag', function(flag)
        if flag then
            TriggerEvent('int_prisonfull:on')
        end
    end)
end

RegisterNetEvent('int_prisonfull:on')
AddEventHandler('int_prisonfull:on', function()
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    EnableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StartAlarm("PRISON_ALARMS", true)
        is_on = true
        --TriggerServerEvent("int_prisonfull:setprison",is_on)
    end)
end

RegisterNetEvent('int_prisonfull:off')
AddEventHandler('int_prisonfull:off', function()
    local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    DisableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StopAllAlarms(true)
        is_on = false
        --TriggerServerEvent("int_prisonfull:setprison",is_on)
    end)
end



Citizen.CreateThread(function()
	while true do
		ESX.TriggerServerCallback('int_prisonfull:getflag', function(flag)
            if flag ~= is_on then
                if flag then
                    TriggerEvent('int_prisonfull:on')
                else
                    TriggerEvent('int_prisonfull:off')
                end
            end
        end)
		Citizen.Wait(1000*60)
	end
end)