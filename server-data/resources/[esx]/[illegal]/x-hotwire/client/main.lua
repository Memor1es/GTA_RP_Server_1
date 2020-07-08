-- Base from DiscworldZA edited by xerxes468893#0001 
--[[
change log

Added ability to give others your keys 

Added ability to search a car once to find either keys, cash, or items in the car

Added ability to kill the driver of a car and take the keys

I still am working on it for esx cops and stuff 


]]
---------------------------------------------------------------------------------------
ESX = nil
myKeys = {}
latestveh = nil
factor = 0
local searchedVehs = {}
local hotwiredVehs = {}
local isActive = false
local haskeys = {}
local Time = 10 * 1000 -- Time for each stage (ms)
local animDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
local anim = "machinic_loop_mechandplayer"
local flags = 49
local trackedVehicles = {}
local hassearched = {}
local PlayerData = {}
local pedIsTryingToHotwire = false
local showcopsmisbehave = true --show notification when cops steal too
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local blipTime = 25 --in second

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(0)
    end

    while ESX.GetPlayerData().job == nil do
        Citizen.Wait(10)
    end

    ESX.PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
    ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsPedGettingIntoAVehicle(playerPed) then
            local vehicle = GetVehiclePedIsTryingToEnter(playerPed)
            local plate = GetVehicleNumberPlateText(vehicle)
            if plate ~= nil then
                TrackVehicle(plate, vehicle)
            end
        end
        --Test In Vehicles (Helps with Spawning Vehicles)
        if IsPedInAnyVehicle(playerPed) then
            local vehicle = GetVehiclePedIsIn(playerPed)
            local plate = GetVehicleNumberPlateText(vehicle)
            if plate ~= nil then
                TrackVehicle(plate, vehicle)
            end
        end
    end
end)


RegisterCommand("givekeys", function(source,args,raw)
  arg = args[1]
  vehicle = VehicleInFront()
  plate = GetVehicleNumberPlateText(vehicle)
  ped = GetPlayerPed(-1)
  if GetVehiclePedIsIn(ped, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) then
    local t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 3) then
      if plate ~= nil then 
        TriggerServerEvent("ARPF:GiveKeys", GetPlayerServerId(t),vehicle,plate)
        exports['mythic_notify']:SendAlert('success', '你把你的鑰匙給'.. GetPlayerName(GetPlayerServerId(t)), 5000)
      else
        exports['mythic_notify']:SendAlert('error', '您無法給鑰匙，因為車牌 # 沒有找到 ¯\\_(ツ)_/¯', 5000)
      end
    else
      exports['mythic_notify']:SendAlert('error', '您附近沒有人提供您的鑰匙以使其更接近', 5000)
    end
  elseif IsPedInAnyVehicle(ped, false) then
    veh = GetVehiclePedIsIn(ped, false)
    plate = GetVehicleNumberPlateText(veh) 
    local t, distance = GetClosestPlayer()
    if (distance ~= -1 and distance < 3) then
      if plate ~= nil then 
        TriggerServerEvent("ARPF:GiveKeys", GetPlayerServerId(t),veh,plate)
        exports['mythic_notify']:SendAlert('success', '你把你的鑰匙給'.. GetPlayerName(GetPlayerServerId(t)), 5000)
      else
        exports['mythic_notify']:SendAlert('error', '您無法給鑰匙，因為車牌 # 沒有找到 ¯\\_(ツ)_/¯', 5000)
      end
    else
      exports['mythic_notify']:SendAlert('error', '您附近沒有人提供您的鑰匙以使其更接近', 5000)
    end
  else
  exports['mythic_notify']:SendAlert('error', '您需要在車外，看著車來給鑰匙或坐在車裡', 6000)
  end
end, false)

-- Shows a notification on the player's screen 
--[[function ShowNotification( text )
    SetNotificationTextEntry("STRING")
    AddTextComponentSubstringPlayerName(text)
    DrawNotification(false, false)
end

RegisterCommand('car2', function(source, args, rawCommand) -- use this as an example for spawning cars out of this script
    local x,y,z = table.unpack(GetOffsetFromEntityInWorldCoords(PlayerPedId(), 0.0, 8.0, 0.5))
    local veh = args[1]
    if veh == nil then veh = "adder" end
    vehiclehash = GetHashKey(veh)
    RequestModel(vehiclehash)
    
    Citizen.CreateThread(function() 
        local waiting = 0
        while not HasModelLoaded(vehiclehash) do
            waiting = waiting + 100
            Citizen.Wait(100)
            if waiting > 5000 then
                ShowNotification("~r~Could not load the vehicle model in time, a crash was prevented.")
                break
            end
        end

        veh = CreateVehicle(vehiclehash, x, y, z, GetEntityHeading(PlayerPedId())+90, 1, 0)
        plate = GetVehicleNumberPlateText(veh)
        TrackVehicle(plate, veh)
        TaskEnterVehicle(GetPlayerPed(-1), veh, 100, -1, 2, 16, 0)
        TriggerEvent("ARPF:spawn:recivekeys", veh,plate)
    end)
end)]]

RegisterNetEvent('ARPF:spawn:recivekeys')
AddEventHandler('ARPF:spawn:recivekeys', function(vehicle,plate)
  ped = GetPlayerPed(-1)
  if vehicle ~= nil or plate ~= nil then 
    vehicle = GetVehiclePedIsIn(ped, false)
  end
  TrackVehicle(plate, vehicle)
  trackedVehicles[plate].canTurnOver = true
end)

RegisterNetEvent('ARPF:recivekeys')
AddEventHandler('ARPF:recivekeys', function(name,vehicle,plates)
    ped = GetPlayerPed(-1)
    plypos = GetEntityCoords(ped, false)
    if IsPedInAnyVehicle(ped, 0) then
        veh = GetVehiclePedIsIn(ped, false)
        local plate = GetVehicleNumberPlateText(veh)
        if plates == plate then 
            TrackVehicle(plate, veh)
            trackedVehicles[plate].canTurnOver = true
            exports['mythic_notify']:SendAlert('error', '您從'..name.."拿到鑰匙，用於車牌:"..plate, 6000)
        else
            print("[Debug - Error]: The vehicle plates did not match!")
        end
    else
        veh = VehicleInFront()
        local plate = GetVehicleNumberPlateText(veh)
        if plates == plate then 
            TrackVehicle(plate, veh)
            trackedVehicles[plate].canTurnOver = true
            exports['mythic_notify']:SendAlert('error', '您從'..name.."拿到鑰匙，用於車牌:"..plate, 6000)
        else
            print("[Debug - Error]: The vehicle plates did not match!")
        end
    end
end)

RegisterNetEvent('disc-hotwire:forceTurnOver')
AddEventHandler('disc-hotwire:forceTurnOver', function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    TrackVehicle(plate, vehicle)
    trackedVehicles[plate].canTurnOver = true
end)

RegisterCommand("lockpicktest", function(source,args,raw)
    --local vehicle = VehicleInFront()
    --SetVehicleDoorsLocked(vehicle, 2)
    TriggerEvent("disc-hotwire:hotwire", true)
end, false) -- test for lockpick as an item 

RegisterNetEvent('disc-hotwire:hotwire')
AddEventHandler('disc-hotwire:hotwire', function(useditem)
    local ped = GetPlayerPed(-1)
    local playerPed = GetPlayerPed(-1)
    --vehicle = GetVehiclePedIsIn(ped, false)
    local vehicle = VehicleInFront()
    state = GetVehicleDoorLockStatus(vehicle)
    print(state)
    print("pass 1")
    if GetVehiclePedIsIn(ped, false) == 0 and DoesEntityExist(vehicle) and IsEntityAVehicle(vehicle) and state == 2 and useditem then
        print("pass 1 1")
        if isActive then
            return
        end
        print("pass 1 2")
        local playerPed = GetPlayerPed(-1)

        print("pass 1 3")
        local plate = GetVehicleNumberPlateText(vehicle)

        if GetIsVehicleEngineRunning(vehicle) or IsVehicleEngineStarting(vehicle) then
            return
        end
        print("pass 1 4")
        if state ~= 2 then
            return
        end
        print("pass 1 5")
        isActive = true
        chance = math.random(1,4)
        time = 10000
        print("pass 1 6")
        exports['progressBars']:startUI(time, "解鎖車門中")
        lockpicking = true
        print("pass 1 7")
        TriggerEvent("animation:lockpickinvtestoutside")
        print("pass 1 8")
        SetVehicleDoorsShut(vehicle, true)
            Citizen.Wait(time)
            exports['mythic_notify']:SendAlert('success', '車門解鎖!')
            if chance == 2 then 
                TriggerServerEvent('ARPF:removeKit')
                exports['mythic_notify']:SendAlert('inform', '你的開鎖工具壞了.')
            end
            alarmChance = math.random(100)
        if alarmChance <= 55 then
            local pPed = GetPlayerPed(-1)
            local pPos = GetEntityCoords(pPed)
            local sPlates = GetVehicleNumberPlateText(vehicle)
            TriggerServerEvent('esx_outlawalert:carJackInProgress', {
                x = ESX.Math.Round(pPos.x, 1),
                y = ESX.Math.Round(pPos.y, 1),
                z = ESX.Math.Round(pPos.z, 1)
            })
            --[[TriggerServerEvent('esx_addons_gcphone:startCall', 'police', ('偷車發生中. 車牌: ' .. sPlates), PlayerCoords, {

            PlayerCoords = { x = pPos.x, y = pPos.y, z = pPos.z },
            })--]]
            Citizen.Wait(2000)
            SetVehicleAlarm(vehicle, true)
            SetVehicleAlarmTimeLeft(vehicle, 30 * 1000)
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        else
            SetVehicleDoorsLocked(vehicle, 1)
            SetVehicleDoorsLockedForAllPlayers(vehicle, false)
        end
            SetVehicleDoorsLocked(vehicle, 1)
            lockpicking = false
            Citizen.Wait(1000)
        isActive = false
    elseif useditem and IsPedInAnyVehicle(playerPed) then 
        print("pass 2 1")
        if isActive then
            return
        end
        print("pass 2 2")
        local playerPed = GetPlayerPed(-1)

        print("pass 2 3")
        local veh = GetVehiclePedIsIn(playerPed)
        local plate = GetVehicleNumberPlateText(veh)

        if GetIsVehicleEngineRunning(veh) or IsVehicleEngineStarting(veh) then
            return
        end
        print("pass 2 4")
        if trackedVehicles[plate].canTurnOver then
            return
        end
        chance = math.random(1,5)
        print("pass 2 5")
        time = 1000 * 3.5
        time2 = 1000 * 3.5
        time3 = math.random(2000,3500) 
        --[[stress = exports['ARPF-Base_esx']:getStressLevel()
        print("pass 2 6")
        curstresslevel = math.ceil(stress / 100)
        time = 2500
        time2 = 3500
        time3 = math.random(2000,3500) 
        if curstresslevel >= 20 then 
            time = 3500
            time2 = 5000
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        elseif curstresslevel >= 45 then 
            time = 4500
            time2 = 6250
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        elseif curstresslevel >= 75 then 
            time = 5555
            time2 = 7777
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        end]]
        print("pass 2 7")
        isActive = true
        TriggerEvent("animation:repaircar", time)
        local pPed = GetPlayerPed(-1)
        local pPos = GetEntityCoords(pPed)
        TriggerServerEvent('esx_outlawalert:carJackInProgress', {
            x = ESX.Math.Round(pPos.x, 1),
            y = ESX.Math.Round(pPos.y, 1),
            z = ESX.Math.Round(pPos.z, 1)
        })
        --[[TriggerServerEvent('esx_addons_gcphone:startCall', 'police', ('偷車發生中. 車牌: ' .. sPlates), PlayerCoords, {
            PlayerCoords = { x = pPos.x, y = pPos.y, z = pPos.z },
        })--]]
        TriggerEvent("mythic_progressbar:client:progress", {
            name = "use_fixkit",
            duration = 500,
            label = "先拆坐墊...",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@prop_human_bum_bin@base",
                anim = "base",
            },
            prop = {
                model = "prop_paper_bag_small",
            }
        }, function(status)
            if not status then
                -- Do Something If Event Wasn't Cancelled
                SetVehicleBodyHealth(vehicle, 1000.00)
                SetVehicleEngineHealth(vehicle, 700.00)
                SetVehicleDeformationFixed(vehicle)
                SetVehicleUndriveable(vehicle, false)
                ESX.ShowNotification(_U('veh_repaired'))
                TriggerServerEvent("esx_mechanicjob:useFixKit")
            end
            isBusy = false
        end)
        exports['progressBars']:startUI(time, "先拆坐墊...") --Ripping apart under panel
        Citizen.Wait(time)
        Citizen.Wait(500)
        exports['progressBars']:startUI(time2, "換煞車皮...") --Stripping wires
        Citizen.Wait(time2)
        Citizen.Wait(500)
        exports['progressBars']:startUI(time3, "看看有沒有八萬一...") --Twisting Wires
        Citizen.Wait(time3)
        Citizen.Wait(500)
        exports['mythic_notify']:SendAlert('success', '引擎啟動!') --Ignition Wired
        print("pass 2 8")
        alarmChance = math.random(100)
        if alarmChance <= 100 then
            local pPed = GetPlayerPed(-1)
            local pPos = GetEntityCoords(pPed)
            local sPlates = GetVehicleNumberPlateText(veh)
            --TriggerServerEvent('esx_outlawalert:carJackInProgress',)
            --[[TriggerServerEvent('esx_outlawalert:carJackInProgress', {
                x = ESX.Math.Round(pPos.x, 1),
                y = ESX.Math.Round(pPos.y, 1),
                z = ESX.Math.Round(pPos.z, 1)
            })--]]
            
            
            Citizen.Wait(2000)
            SetVehicleAlarm(veh, true)
            SetVehicleAlarmTimeLeft(veh, 30 * 1000)
            --SetVehicleDoorsLocked(veh, 1)
            --SetVehicleDoorsLockedForAllPlayers(veh, false)
            ClearPedTasksImmediately(playerPed)
            TaskEnterVehicle(playerPed, veh, 10.0, -1, 1.0, 16, 0)
        else
            --SetVehicleDoorsLocked(veh, 1)
            --SetVehicleDoorsLockedForAllPlayers(veh, false)
            ClearPedTasksImmediately(playerPed)
            TaskEnterVehicle(playerPed, veh, 10.0, -1, 1.0, 16, 0)
        end
        if chance == 2 then 
            TriggerServerEvent('nfwlock:removeKit')
            exports['mythic_notify']:SendAlert('inform', '你的開鎖工具壞了.')
        end
        trackedVehicles[plate].canTurnOver = true
        isActive = false
    elseif not useditem and IsPedInAnyVehicle(GetPlayerPed(-1)) then 
        print("pass 3 1")
        if isActive then
            return
        end
        print("pass 3 2")
        local playerPed = GetPlayerPed(-1)

        if not IsPedInAnyVehicle(playerPed) then
            return
        end
        print("pass 3 3")
        veh = GetVehiclePedIsIn(playerPed)
        plate = GetVehicleNumberPlateText(veh)

        if GetIsVehicleEngineRunning(veh) or IsVehicleEngineStarting(veh) then
            return
        end
        print("pass 3 4")
        if trackedVehicles[plate].canTurnOver then
            return
        end
        print("pass 2 5")
        time = (1000 * 3.5)
        time2 = (1000 * 3.5)
        time3 = math.random((2500 * 3.5),(4000 * 3.5))
        --[[stress = exports['ARPF-Base_esx']:getStressLevel()
        print("pass 2 6")
        curstresslevel = math.ceil(stress / 100)
        time = (2500 * 3.5)
        time2 = (3500 * 3.5)
        time3 = math.random((2500 * 3.5),(4000 * 3.5)) 
        if curstresslevel >= 20 then 
            time = (3500 * 3.5)
            time2 = (5000 * 3.5)
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        elseif curstresslevel >= 45 then 
            time = (4500 * 3.5)
            time2 = (6250 * 3.5)
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        elseif curstresslevel >= 75 then 
            time = (5555 * 3.5)
            time2 = (7777 * 3.5)
            exports['mythic_notify']:SendAlert('inform', 'Lockpicking will take longer since you are stressed out!')
        end]]
        print("pass 2 7")
        isActive = true
        TriggerEvent("animation:repaircar", time)
        local pPed = GetPlayerPed(-1)
        local pPos = GetEntityCoords(pPed)
        local sPlates = GetVehicleNumberPlateText(veh)
        TriggerServerEvent('esx_outlawalert:carJackInProgress', {
            x = ESX.Math.Round(pPos.x, 1),
            y = ESX.Math.Round(pPos.y, 1),
            z = ESX.Math.Round(pPos.z, 1)
        })
        --[[TriggerServerEvent('esx_addons_gcphone:startCall', 'police', ('偷車發生中. 車牌: ' .. sPlates), PlayerCoords, {

            PlayerCoords = { x = pPos.x, y = pPos.y, z = pPos.z },
        })--]]
        
        local cancel = false
        local complete = false
        TriggerEvent("mythic_progressbar:client:progress", {
            name = "thief_car1",
            duration = time,
            label = "先拆坐墊...",
            useWhileDead = false,
            canCancel = true,
            controlDisables = {
                disableMovement = true,
                disableCarMovement = true,
                disableMouse = false,
                disableCombat = true,
            },
            animation = {
                animDict = "amb@prop_human_bum_bin@base",
                anim = "base",
            },
            prop = {
                model = "prop_paper_bag_small",
            }
        }, function(status)
            if not status then
                -- Do Something If Event Wasn't Cancelled
                complete = true
            else
                cancel = true
            end
        end)

        while complete == false and cancel == false do
            Citizen.Wait(50)
        end

        if complete == true then
            complete = false
            TriggerEvent("mythic_progressbar:client:progress", {
                name = "thief_car2",
                duration = time2,
                label = "再換煞車皮...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@prop_human_bum_bin@base",
                    anim = "base",
                },
                prop = {
                    model = "prop_paper_bag_small",
                }
            }, function(status)
                if not status then
                    -- Do Something If Event Wasn't Cancelled
                    complete = true
                else
                    cancel = true
                end
            end)
        end

        while complete == false and cancel == false do
            Citizen.Wait(50)
        end

        if complete == true then
            complete = false
            TriggerEvent("mythic_progressbar:client:progress", {
                name = "thief_car2",
                duration = time3,
                label = "然後看看有沒有八萬一...",
                useWhileDead = false,
                canCancel = true,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@prop_human_bum_bin@base",
                    anim = "base",
                },
                prop = {
                    model = "prop_paper_bag_small",
                }
            }, function(status)
                if not status then
                    -- Do Something If Event Wasn't Cancelled
                    complete = true
                else
                    cancel = true
                end
            end)
        end

        while complete == false and cancel == false do
            Citizen.Wait(50)
        end
        --[[
        exports['progressBars']:startUI(time, "先拆坐墊...")
        Citizen.Wait(time)
        Citizen.Wait(500)
        exports['progressBars']:startUI(time2, "換煞車皮...")
        Citizen.Wait(time2)
        Citizen.Wait(500)
        exports['progressBars']:startUI(time3, "看看有沒有八萬一...")
        Citizen.Wait(time3)
        Citizen.Wait(500)
        ]]--

        if complete == true then
            exports['mythic_notify']:SendAlert('success', '引擎啟動!')
            ClearPedSecondaryTask(playerPed)
            print("pass 2 8")
            alarmChance = math.random(100)
            if alarmChance <= 75 then
                local pPed = GetPlayerPed(-1)
                local pPos = GetEntityCoords(pPed)
                --local sPlates = GetVehicleNumberPlateText(veh)
                --[[TriggerServerEvent('esx_outlawalert:carJackInProgress', {
                    x = ESX.Math.Round(pPos.x, 1),
                    y = ESX.Math.Round(pPos.y, 1),
                    z = ESX.Math.Round(pPos.z, 1)
                })--]]
                
                Citizen.Wait(2000)
                SetVehicleAlarm(veh, true)
                SetVehicleAlarmTimeLeft(veh, 30 * 1000)
                SetVehicleDoorsLocked(veh, 1)
                SetVehicleDoorsLockedForAllPlayers(veh, false)
                ClearPedTasksImmediately(playerPed)
                TaskEnterVehicle(playerPed, veh, 10.0, -1, 1.0, 16, 0)
            else
                SetVehicleDoorsLocked(veh, 1)
                SetVehicleDoorsLockedForAllPlayers(veh, false)
                ClearPedTasksImmediately(playerPed)
                TaskEnterVehicle(playerPed, veh, 10.0, -1, 1.0, 16, 0)
            end
            --StopAnimTask(player_entity, animDict, anim, 1.0)
            Citizen.Wait(500)
            RemoveAnimDict(animDict)
            trackedVehicles[plate].canTurnOver = true
            isActive = false
        else
            isActive = false
        end
    end
end)

function searchvehicle()
     local veh = GetVehiclePedIsUsing(GetPlayerPed(-1))
     plate = GetVehicleNumberPlateText(veh)
    if  trackedVehicles[plate].canTurnOver == false then

        if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            exports['mythic_notify']:SendAlert('error', '你不在車子上?')
          return
        end
        exports['progressBars']:startUI(5000,"尋找中")
        Citizen.Wait(5000)
        Citizen.Wait(100)
        local luck = math.random(1,100)
        print(luck)
        if not IsPedInAnyVehicle(GetPlayerPed(-1), false) then
            exports['mythic_notify']:SendAlert('error', '你不在車子上?')
          return
        end
        if luck >= 99 then
          exports['progressBars']:startUI(2000,"找到鑰匙並使用")
          Citizen.Wait(2000)
          trackedVehicles[plate].canTurnOver = true
        elseif luck <= 5 then 
            exports['progressBars']:startUI(2000,"找到金錢並拿取...")
            cashreward = math.random(80,250)
            exports['mythic_notify']:SendAlert('success', '找到 $'..cashreward)
            TriggerServerEvent("disc-hotwire:AddMoney", cashreward)
        elseif luck >= 65 and luck < 75 then
            maths = math.random(1,4)
            if maths == 1 then  
                item = "bread"
                count = 1
                exports['progressBars']:startUI(2000,"找到麵包並拿走...")
                exports['mythic_notify']:SendAlert('success', '找到 '..count.." "..item)
                TriggerServerEvent("disc-hotwire:AddItem", item, count)
            elseif maths == 2 then 
                item = "medikit"
                count = 1
                exports['progressBars']:startUI(2000,"找到醫療包並拿走...")
                exports['mythic_notify']:SendAlert('success', '找到 '..count.." "..item)
                TriggerServerEvent("disc-hotwire:AddItem", item, count)
            elseif maths == 3 then 
                item = "water"
                count = 1
                exports['progressBars']:startUI(2000,"找到水並拿走...")
                exports['mythic_notify']:SendAlert('success', '找到 '..count.." "..item)
                TriggerServerEvent("disc-hotwire:AddItem", item, count)
            elseif maths == 4 then 
                item = "writer"
                count = 2
                exports['progressBars']:startUI(2000,"找到寫入器並拿走...")
                exports['mythic_notify']:SendAlert('success', '找到 '..count.." "..item)
                TriggerServerEvent("disc-hotwire:AddItem", item, count)
            --[[elseif maths == 4 then 
                item = "lockpick"
                count = 2
                exports['progressBars']:startUI(2000,"Found and grabing lockpick...")
                exports['mythic_notify']:SendAlert('success', 'Found '..count.." "..item)
                TriggerServerEvent("disc-hotwire:givereward", source, item, count)--]]
            end
        else
          exports['mythic_notify']:SendAlert('error', '你並沒有在車裡找到任何東西!')  
        end
        hassearched[plate] = true
    end
 end

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    local playerPed = GetPlayerPed(-1)
    local coords = GetEntityCoords(playerPed)
    local veh = GetVehiclePedIsIn(playerPed)
    local plate = GetVehicleNumberPlateText(veh)
    local check_is_spawn = 0
    local is_spawn_veh = false
    seat = GetPedInVehicleSeat(veh, index)
    if IsPedInAnyVehicle(playerPed, false) and GetPedInVehicleSeat(GetVehiclePedIsIn(GetPlayerPed(-1), false), -1) == GetPlayerPed(-1) then
        if trackedVehicles[plate] ==nil then
            TrackVehicle(plate, vehicle)
        end
        if not trackedVehicles[plate].canTurnOver then
          local vehPos = GetWorldPositionOfEntityBone(veh, GetEntityBoneIndexByName(veh, "bonnet"))
            if hassearched[plate] == false or hassearched[plate] == nil then
                ESX.ShowHelpNotification("按下 ~INPUT_VEH_HEADLIGHT~ ~r~來破壞車輛\n~s~按下 ~INPUT_HUD_SPECIAL~ ~y~來尋找鑰匙")
                -- DrawText3Ds(vehPos.x, vehPos.y, vehPos.z, "按下 [H] 來破壞車輛 / [Z] 來尋找鑰匙")
            elseif hassearched[plate] == true then 
                ESX.ShowHelpNotification("按下 ~INPUT_VEH_HEADLIGHT~ ~r~來破壞車輛")
                -- DrawText3Ds(vehPos.x, vehPos.y, vehPos.z, "按下 [H] 來破壞車輛")
            end
            if IsControlJustPressed(0, 304) then
                useds = false
                TriggerEvent("disc-hotwire:hotwire", useds)
            end
            if IsControlJustPressed(0, 20) and not hassearched[plate] == true then 
                searchvehicle()
            else

            end
            
        end
    end
  end
end)

Citizen.CreateThread( function()
    while true do
        Citizen.Wait(1)
        local robbing = false
        if GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) ~= nil and GetVehiclePedIsTryingToEnter(GetPlayerPed(-1)) ~= 0 then
          robbing = true
          local curveh = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
          local plate = GetVehicleNumberPlateText(curveh)
          TrackVehicle(plate,curveh)
        if trackedVehicles[plate].canTurnOver == false then
            local pedDriver = GetPedInVehicleSeat(curveh, -1)
            if pedDriver ~= 0 and (not IsPedAPlayer(pedDriver) or IsEntityDead(pedDriver)) then
              if IsEntityDead(pedDriver) then
                    -- add your alert
                    exports['progressBars']:startUI(5000,"搜索鑰匙")
                    Citizen.Wait(5000)
                    trackedVehicles[plate].canTurnOver = true
              else
                if GetEntityModel(curveh) ~= GetHashKey("taxi") then
                  
                    if math.random(100) > 95 then
                        -- add your alert
                        exports['progressBars']:startUI(5000,"搜索鑰匙") 
                        Citizen.Wait(5000)    
                        trackedVehicles[plate].canTurnOver = true
                    else
                        SetVehicleDoorsLocked(curveh, 2)
                        Citizen.Wait(1000)
                        TriggerEvent("civilian:alertPolice",20.0,"lockpick",targetVehicle)
                        TaskReactAndFleePed(pedDriver, GetPlayerPed(-1))
                        SetPedKeepTask(pedDriver, true)
                        ClearPedTasksImmediately(GetPlayerPed(-1))
                        Citizen.Wait(2000)
                  end
                else
                  SetPedIntoVehicle(GetPlayerPed(-1), curveh, 2) -- if taxi get into back seat 
                  SetPedIntoVehicle(GetPlayerPed(-1), curveh, 1) -- if taxi get into back seat 
                end
              end
            end
          end
        end
        if not robbing then
          Wait(100)
        end
    end
end)

RegisterNetEvent('animation:repaircar')
AddEventHandler('animation:repaircar', function(secounts)

inanimation = true

    ClearPedTasksImmediately(IPed)
    if not handCuffed then

      local lPed = GetPlayerPed(-1)

      RequestAnimDict("mini@repair")
      while not HasAnimDictLoaded("mini@repair") do
        Citizen.Wait(0)
      end
      
      if IsEntityPlayingAnim(lPed, "mini@repair", "fixing_a_player", 3) then
        ClearPedSecondaryTask(lPed)
        TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
      else
        ClearPedTasksImmediately(IPed)
        TaskPlayAnim(lPed, "mini@repair", "fixing_a_player", 8.0, -8, -1, 16, 0, 0, 0, 0)
        seccount = secounts
        while seccount > 0 do
          Citizen.Wait(1000)
          seccount = seccount - 1

        end
        ClearPedSecondaryTask(lPed)
      end   
    else
      ClearPedSecondaryTask(lPed)
    end
inanimation = false
end)
function DrawText3Ds(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    
    --SetTextScale(0.35, 0.35)
    SetTextScale(0.6, 0.6)
    SetTextFont(1)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 370
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 41, 11, 41, 68)
end

RegisterNetEvent('animation:lockpickinvtestoutside')
AddEventHandler('animation:lockpickinvtestoutside', function()
    local lPed = GetPlayerPed(-1)
    RequestAnimDict("veh@break_in@0h@p_m_one@")
    while not HasAnimDictLoaded("veh@break_in@0h@p_m_one@") do
        Citizen.Wait(0)
    end
    while lockpicking do
            TaskPlayAnim(lPed, "veh@break_in@0h@p_m_one@", "low_force_entry_ds", 1.0, 1.0, 1.0, 16, 0.0, 0, 0, 0)
            Citizen.Wait(2000)

        Citizen.Wait(1)
    end
    ClearPedTasks(lPed)
end)


function TrackVehicle(plate, vehicle)
    if trackedVehicles[plate] == nil then
        trackedVehicles[plate] = {}
        trackedVehicles[plate].vehicle = vehicle
        trackedVehicles[plate].canTurnOver = false
    --else
        --trackedVehicles[plate].canTurnOver = false
    end
    ESX.TriggerServerCallback('disc-hotwire:checkOwner', function(owner)
        if owner then
            trackedVehicles[plate].canTurnOver = true
        end
    end, plate)
end

function VehicleInFront()
  local player = PlayerPedId()
    local pos = GetEntityCoords(player)
    local entityWorld = GetOffsetFromEntityInWorldCoords(player, 0.0, 2.0, 0.0)
    local rayHandle = CastRayPointToPoint(pos.x, pos.y, pos.z, entityWorld.x, entityWorld.y, entityWorld.z, 30, player, 0)
    local _, _, _, _, result = GetRaycastResult(rayHandle)
    return result
end

function loadAnimDict(dict)
    while (not HasAnimDictLoaded(dict)) do
      RequestAnimDict(dict)
      
      Citizen.Wait(1)
    end
end

--Disable All Cars Not tracked or Turned over

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        for k, v in pairs(trackedVehicles) do
            --if not v.canTurnOver or v.state == 0 then
            if not v.canTurnOver then
                local pedDriver = GetPedInVehicleSeat(v.vehicle, -1)
                if IsPedAPlayer(pedDriver) then
                    SetVehicleEngineOn(v.vehicle, false, false)
                end
            elseif v.state == 1 then
                SetVehicleEngineOn(v.vehicle, true, false)
                v.state = -1
            end
        end
    end
end)

--Turnover key
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if IsControlJustReleased(1, 244) then
            local playerPed = GetPlayerPed(-1)
            local vehicle = GetVehiclePedIsIn(playerPed)
            local isTurned = GetIsVehicleEngineRunning(vehicle)
            local plate = GetVehicleNumberPlateText(vehicle)
            if trackedVehicles[plate] == nil then
                TrackVehicle(plate, vehicle)
            end

            if isTurned then
                trackedVehicles[plate].state = 0
            elseif trackedVehicles[plate].canTurnOver then
                trackedVehicles[plate].state = 1
            elseif trackedVehicles[plate] ~= nil then
                ESX.TriggerServerCallback('disc-hotwire:checkOwner', function(owner)
                    if owner then
                        trackedVehicles[plate].canTurnOver = true
                        trackedVehicles[plate].state = 1
                    end
                end, plate)
            end
        end
    end
end)

function GetPlayers()
    local players = {}

    for i = 0, 256 do
        if NetworkIsPlayerActive(i) then
            table.insert(players, i)
        end
    end

    return players
end

function GetClosestPlayer()
  local players = GetPlayers()
  local closestDistance = -1
  local closestPlayer = -1
  local ply = GetPlayerPed(-1)
  local plyCoords = GetEntityCoords(ply, 0)
  
  for index,value in ipairs(players) do
    local target = GetPlayerPed(value)
    if(target ~= ply) then
      local targetCoords = GetEntityCoords(GetPlayerPed(value), 0)
      local distance = GetDistanceBetweenCoords(targetCoords["x"], targetCoords["y"], targetCoords["z"], plyCoords["x"], plyCoords["y"], plyCoords["z"], true)
      if(closestDistance == -1 or closestDistance > distance) then
        closestPlayer = value
        closestDistance = distance
      end
    end
  end
  
  return closestPlayer, closestDistance
end


RegisterNetEvent('hotwireEnable')
AddEventHandler('hotwireEnable', function()
	pedIsTryingToHotwire = true
end)


Citizen.CreateThread( function()
    while true do
        Wait(500)
        if pedIsTryingToHotwire then
            local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
            local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
            local street1 = GetStreetNameFromHashKey(s1)
            local street2 = GetStreetNameFromHashKey(s2)
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
			if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' and showcopsmisbehave == false then
			elseif ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' and showcopsmisbehave then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "male" --male/change it to your language
					else
						sex = "female" --female/change it to your language
					end
					TriggerServerEvent('hotwireInProgressPos', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('hotwireInProgressS1', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('hotwireInProgress', street1, street2, sex)
					end
				end)
				Wait(3000)
				pedIsTryingToHotwire = false
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "male"
					else
						sex = "female"
					end
					TriggerServerEvent('hotwireInProgressPos', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('hotwireInProgressS1', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('hotwireInProgress', street1, street2, sex)
					end
				end)
				Wait(3000)
				pedIsTryingToHotwire = false
			end
        end
    end
end)

--DISPATCH BEGIN (better do not touch)
--Only if Config.CallCops = true

--GetPlayerName()
RegisterNetEvent('outlawNotify')
AddEventHandler('outlawNotify', function(alert)
		if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'police' then
            Notify(alert)
        end
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
    DrawNotification(false, false)
end


RegisterNetEvent('hotwirePlace')
AddEventHandler('hotwirePlace', function(tx, ty, tz)
	if PlayerData.job.name == 'police' then
		local transT = 250
		local Blip = AddBlipForCoord(tx, ty, tz)
		SetBlipSprite(Blip,  10)
		SetBlipColour(Blip,  1)
		SetBlipAlpha(Blip,  transT)
		SetBlipAsShortRange(Blip,  false)
		while transT ~= 0 do
			Wait(blipTime * 4)
			transT = transT - 1
			SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				return
			end
		end
	end
end)

Citizen.CreateThread(function()

--[[enum VehicleLockStatus = {
    None = 0,
    Unlocked = 1,
    Locked = 2,
    LockedForPlayer = 3,
    StickPlayerInside = 4, -- Doesn't allow players to exit the vehicle with the exit vehicle key.
    CanBeBrokenInto = 7, -- Can be broken into the car. If the glass is broken, the value will be set to 1
    CanBeBrokenIntoPersist = 8, -- Can be broken into persist
    CannotBeTriedToEnter = 10, -- Cannot be tried to enter (Nothing happens when you press the vehicle enter key).
}]]--
    while true do
      
        local playerPed = PlayerPedId()
        local vehicle = GetVehiclePedIsTryingToEnter(playerPed)

        if DoesEntityExist(vehicle) then
			local lockStatus = GetVehicleDoorLockStatus(vehicle)

			if lockStatus == 7 or lockStatus == 8 then
                --ClearPedTasks(playerPed)
                SetVehicleDoorsLocked(vehicle, 2)
			end
        end
        Citizen.Wait(500)

    end
    
  end)