local is_on = false
ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)


RegisterCommand("alarm_on", function(source, args, rawCommand)
    --[[local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    EnableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StartAlarm("PRISON_ALARMS", true)
        is_on = true
        for _,player in ipairs(GetActivePlayers()) do
            if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                TriggerServerEvent("int_prisonfull:setprison",is_on,GetPlayerServerId(GetPlayerPed(player)))
            end
        end
    end)--]]

    --is_on = true
    --[[for _,player in ipairs(GetActivePlayers()) do
        TriggerServerEvent("int_prisonfull:setprison",is_on,GetPlayerServerId(GetPlayerPed(player))
    end--]]
    TriggerServerEvent("int_prisonfull:setflag",true)
    ESX.ShowNotification("警報將在15秒內啟動")
    --print(GetVecDist(GetEntityCoords(GetPlayerPed(-1)), Config.PrisonLoaction))
end, false)

RegisterCommand("alarm_off", function(source, args, rawCommand)
    --[[local alarmIpl = GetInteriorAtCoordsWithType(1787.004,2593.1984,45.7978,"int_prison_main")

    RefreshInterior(alarmIpl)
    DisableInteriorProp(alarmIpl, "prison_alarm")

    Citizen.CreateThread(function()
        while not PrepareAlarm("PRISON_ALARMS") do
            Citizen.Wait(100)
        end
        StopAllAlarms(true)
        is_on = false
        for _,player in ipairs(GetActivePlayers()) do
            if GetPlayerPed(player) ~= GetPlayerPed(-1) then
                TriggerServerEvent("int_prisonfull:setprison",is_on,GetPlayerServerId(GetPlayerPed(player)))
            end
        end
            end)--]]

    --is_on = false
    --[[for _,player in ipairs(GetActivePlayers()) do
        TriggerServerEvent("int_prisonfull:setprison",is_on,GetPlayerServerId(GetPlayerPed(player))
    end--]]
    TriggerServerEvent("int_prisonfull:setflag",false)
    ESX.ShowNotification("警報將在15秒內停止")
end, false)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
    ESX.TriggerServerCallback('int_prisonfull:getflag', function(flag)
        if flag then
            TriggerEvent('int_prisonfull:on')
        end
    end)
end)

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
end)

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
end)



Citizen.CreateThread(function()
    
	while true do
        --flag = TriggerServerEvent('int_prisonfull:getflag')
        local plyPed = GetPlayerPed(-1)
        if GetVecDist(GetEntityCoords(plyPed), Config.PrisonLoaction) < Config.TriggerDistance then
            ESX.TriggerServerCallback('int_prisonfull:getflag', function(flag)
                if flag ~= is_on then
                    if flag then
                        TriggerEvent('int_prisonfull:on')
                    else
                        TriggerEvent('int_prisonfull:off')
                    end
                end
            
            
            end)
        end
        Citizen.Wait(1000*15)
	end
end)



function GetVecDist(v1,v2)
    if not v1 or not v2 or not v1.x or not v2.x then return 0; end
    return math.sqrt(  ( (v1.x or 0) - (v2.x or 0) )*(  (v1.x or 0) - (v2.x or 0) )+( (v1.y or 0) - (v2.y or 0) )*( (v1.y or 0) - (v2.y or 0) )+( (v1.z or 0) - (v2.z or 0) )*( (v1.z or 0) - (v2.z or 0) )  )
end