ESX = nil

local vehicles = {}
local searchedVehicles = {}
local pickedVehicled = {}
local hasCheckedOwnedVehs = false
local lockDisable = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

RegisterNetEvent('disc-hotwire:forceTurnOver')
AddEventHandler('disc-hotwire:forceTurnOver', function(vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)
    givePlayerKeys(plate)
end)

function givePlayerKeys(plate)
    local vehPlate = plate
    table.insert(vehicles, vehPlate)
end

function hasToggledLock()
    lockDisable = true
    Wait(100)
    lockDisable = false
end

function playLockAnim(vehicle)
    local dict = "anim@mp_player_intmenu@key_fob@"
    RequestAnimDict(dict)

    local veh = vehicle

    while not HasAnimDictLoaded do
        Citizen.Wait(0)
    end

    if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
        TaskPlayAnim(PlayerPedId(), dict, "fob_click_fp", 8.0, 8.0, -1, 48, 1, false, false, false)
    end
end

function toggleLock(vehicle)
    local veh = vehicle

    local plate = GetVehicleNumberPlateText(veh)
    local lockStatus = GetVehicleDoorLockStatus(veh)
    if hasKeys(plate) and not lockDisable then
        print('lock status: ' .. lockStatus)
        if lockStatus == 1 then
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleDoorsLockedForAllPlayers(veh, true)
            exports['mythic_notify']:DoHudText('inform', '車輛已上鎖')
            playLockAnim()
            hasToggledLock()
        elseif lockStatus == 2 then
            SetVehicleDoorsLocked(veh, 1)
            SetVehicleDoorsLockedForAllPlayers(veh, false)
            exports['mythic_notify']:DoHudText('inform', '車輛已解鎖')
            playLockAnim(veh)
            hasToggledLock()
        else
            SetVehicleDoorsLocked(veh, 2)
            SetVehicleDoorsLockedForAllPlayers(veh, true)
            exports['mythic_notify']:DoHudText('inform', '車輛已上鎖')
            playLockAnim()
            hasToggledLock()
        end
        if not IsPedInAnyVehicle(GetPlayerPed(-1), true) then
            Wait(500)
            local flickers = 0
            while flickers < 2 do
                SetVehicleLights(veh, 2)
                Wait(170)
                SetVehicleLights(veh, 0)
                flickers = flickers + 1
                Wait(170)
            end
        end
    end
end

RegisterNetEvent('onyx:pickDoor')
AddEventHandler('onyx:pickDoor', function()
    -- TODO: Lockpicking vehicle doors to gain access
end)

-- Locking vehicles
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        if IsControlJustReleased(0, 303) then
            if IsPedInAnyVehicle(GetPlayerPed(-1), false) then
                local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                toggleLock(veh)
            else
                local veh = GetClosestVehicle(pos.x, pos.y, pos.z, 3.0, 0, 70)
                if DoesEntityExist(veh) then
                    toggleLock(veh)
                end
            end
        end

        -- TODO: Unable to gain access to vehicles without a lockpick or keys
        -- local enteringVeh = GetVehiclePedIsTryingToEnter(GetPlayerPed(-1))
        -- local enteringPlate = GetVehicleNumberPlateText(enteringVeh)

        -- if not hasKeys(entertingPlate) then
        --     SetVehicleDoorsLocked(enteringVeh, 2)
        -- end
    end
end)

local isSearching = false
local isHotwiring = false

-- Has entered vehicle without keys
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local ped = GetPlayerPed(-1)
        if IsPedInAnyVehicle(ped, false) then
            local veh = GetVehiclePedIsIn(ped)
            local driver = GetPedInVehicleSeat(veh, -1)
            local plate = GetVehicleNumberPlateText(veh)
            if driver == ped then
                if not hasKeys(plate) and not isHotwiring and not isSearching then
                    local pos = GetEntityCoords(ped)
                    if hasBeenSearched(plate) then
                        ESX.ShowHelpNotification("按下 ~INPUT_VEH_HEADLIGHT~ ~r~來破壞車輛")
                        -- DrawText3Ds(pos.x, pos.y, pos.z + 0.2, '按下 ~y~[H] ~w~來破換電路')
                    else
                        ESX.ShowHelpNotification("按下 ~INPUT_VEH_HEADLIGHT~ ~r~來破壞車輛\n~s~按下 ~INPUT_DETONATE~ ~y~來尋找鑰匙")
                        -- DrawText3Ds(pos.x, pos.y, pos.z + 0.2, '按下 ~y~[H] ~w~來破換電路或 ~g~[G] ~w~來找鑰匙')
                    end
                    SetVehicleEngineOn(veh, false, true, true)
                    -- Searching
                    if IsControlJustReleased(0, 47) and not isSearching and not hasBeenSearched(plate) then -- G
                        RequestAnimDict("amb@prop_human_bum_bin@base")
                        while not HasAnimDictLoaded("amb@prop_human_bum_bin@base") do
                            Citizen.Wait(100)
                        end

                        if hasBeenSearched(plate) then
                            isSearching = true
                            exports['progressBars']:startUI(5000, "尋找鑰匙中")
                            Citizen.Wait(5000)
                            isSearching = false
                            exports['mythic_notify']:DoHudText('error', '沒找到任何東西')
                        else
                            local rnd = math.random(1, 3)
                            local time_for_find_key = 6000
                            isSearching = true
                            if rnd == 1 then
                                TriggerEvent("mythic_progressbar:client:progress", {
                                    name = "find_key_1",
                                    duration = time_for_find_key,
                                    label = "尋找鑰匙中...",
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
                                        ESX.ShowNotification("~g~你找到這個車牌 [" .. plate .. "] 的鑰匙")
                                        -- exports['mythic_notify']:DoHudText('inform', "你找到這個車牌 [" .. plate .. '] 的鑰匙')
                                        table.insert(vehicles, plate)
                                        TriggerServerEvent('onyx:updateSearchedVehTable', plate)
                                        table.insert(searchedVehicles, plate)
                                        SetVehicleEngineOn(veh, true, true, false)
                                    end
                                    isSearching = false
                                end)
                            else
                                TriggerEvent("mythic_progressbar:client:progress", {
                                    name = "find_key_1",
                                    duration = time_for_find_key,
                                    label = "尋找鑰匙中...",
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
                                        ESX.ShowNotification("~r~沒找到任何東西")
                                        -- exports['mythic_notify']:DoHudText('error', '沒找到任何東西')

                                        -- Update veh table so other players cant search the same vehicle
                                        TriggerServerEvent('onyx:updateSearchedVehTable', plate)
                                        table.insert(searchedVehicles, plate)
                                    end
                                    isSearching = false
                                end)
                            end
                        end
                    end
                    -- Hotwiring
                    if IsControlJustReleased(0, 74) and not isHotwiring then -- E
                        TriggerServerEvent('onyx:reqHotwiring', plate)
                    end
                else
                    --SetVehicleEngineOn(veh, true, true, false)
                end
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isHotwiring then
            DisableControlAction(0, 75, true)  -- Disable exit vehicle
            DisableControlAction(0, 74, true)  -- Lights
        end
    end
end)

RegisterNetEvent('onyx:updatePlates')
AddEventHandler('onyx:updatePlates', function(plate)
    table.insert(vehicles, plate)
end)

RegisterNetEvent('onyx:beginHotwire')
AddEventHandler('onyx:beginHotwire', function(plate)
    local veh = GetVehiclePedIsIn(GetPlayerPed(-1), false)
    RequestAnimDict("veh@std@ds@base")

    while not HasAnimDictLoaded("veh@std@ds@base") do
        Citizen.Wait(100)
    end
    
    local time = (2000 * 3.5)
    local time2 = (1000 * 3.5)
    local time3 = math.random((2500 * 3.5),(4000 * 3.5))
    
    local vehPlate = plate
    isHotwiring = true

    SetVehicleEngineOn(veh, false, true, true)
    SetVehicleLights(veh, 0)
    
    if Config.HotwireAlarmEnabled then
        local alarmChance = math.random(1, Config.HotwireAlarmChance)

        if alarmChance == 1 then
            SetVehicleAlarm(veh, true)
            StartVehicleAlarm(veh)
        end
    end

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
            animDict = "veh@std@ds@base",
            anim = "hotwire",
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
                animDict = "veh@std@ds@base",
                anim = "hotwire",
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
                animDict = "veh@std@ds@base",
                anim = "hotwire",
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
        ESX.ShowNotification("~g~車鎖破壞完畢，車輛已啟動")
        -- exports['mythic_notify']:DoHudText('inform', "你找到這個車牌 [" .. plate .. '] 的鑰匙')
        table.insert(vehicles, vehPlate)
        SetVehicleEngineOn(veh, true, true, false)
    end

    isHotwiring = false
end)

local isRobbing = false
local canRob = false
local prevPed = false
local prevCar = false

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local foundEnt, aimingEnt = GetEntityPlayerIsFreeAimingAt(PlayerId())
        local entPos = GetEntityCoords(aimingEnt)
        local pos = GetEntityCoords(GetPlayerPed(-1))
        local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, entPos.x, entPos.y, entPos.z, true)

        if foundEnt and prevPed ~= aimingEnt and IsPedInAnyVehicle(aimingEnt, false) and IsPedArmed(PlayerPedId(), 7) and dist < 20.0 and not IsPedInAnyVehicle(PlayerPedId()) then
            if not IsPedAPlayer(aimingEnt) then
                prevPed = aimingEnt
                Wait(math.random(300, 700))
                local dict = "random@mugging3"
                RequestAnimDict(dict)
                while not HasAnimDictLoaded(dict) do
                    Citizen.Wait(0)
                end
                local rand = math.random(1, 10)

                if rand > 4 then
                    prevCar = GetVehiclePedIsIn(aimingEnt, false)
                    TaskLeaveVehicle(aimingEnt, prevCar)
                    SetVehicleEngineOn(prevCar, false, false, false)
                    while IsPedInAnyVehicle(aimingEnt, false) do
                        Citizen.Wait(0)
                    end
                    SetBlockingOfNonTemporaryEvents(aimingEnt, true)
                    ClearPedTasksImmediately(aimingEnt)
                    TaskPlayAnim(aimingEnt, dict, "handsup_standing_base", 8.0, -8.0, 0.01, 49, 0, 0, 0, 0)
                    ResetPedLastVehicle(aimingEnt)
                    TaskWanderInArea(aimingEnt, 0, 0, 0, 20, 100, 100)
                    canRob = true
                    beginRobTimer(aimingEnt)
                end
            end
        end
    end
end)

local canTakeKeys = true

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if canRob and not IsEntityDead(prevPed) and IsPlayerFreeAiming(PlayerId()) then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            local entPos = GetEntityCoords(prevPed)
            if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, entPos.x, entPos.y, entPos.z, false) < 3.5 then
                DrawText3Ds(entPos.x, entPos.y, entPos.z, '按下 ~y~[E]~w~ 來搶')
                if IsControlJustReleased(0, 38) then
                    local rand = math.random(1, 10)
                    if rand == 1 then
                        Wait(400)
                        exports['mythic_notify']:DoHudText('inform', '他們不交出鑰匙')
                    else
                        local plate = GetVehicleNumberPlateText(prevCar)
                        exports['progressBars']:startUI(3600, "搶奪鑰匙中")
                        Wait(3600)
                        givePlayerKeys(plate)
                        exports['mythic_notify']:DoHudText('inform', '你拿到了鑰匙')
                    end
                    SetBlockingOfNonTemporaryEvents(prevPed, false)
                    canRob = false
                end
            end
        end
    end
end)

-- if GetDistanceBetweenCoords(pos.x, pos.y, pos.z, entPos.x, entPos.y, entPos.z, false) < 4.5 and canRob then
--     if not IsEntityDead(aimingEnt) then
--         DrawText3Ds(entPos.x, entPos.y, entPos.z, 'Press ~y~[E]~w~ to rob')
--         print('message should pop up')
--         if IsControlJustReleased(0, 38) then
--             local plate = GetVehicleNumberPlateText(prevCar)
--             exports['progressBars']:startUI(3500, "Taking Keys")
--             Wait(3600)
--             givePlayerKeys(plate)
--             exports['mythic_notify']:DoHudText('inform', 'You rob the keys')
--             canRob = false
--         end
--     end

RegisterCommand('weapon', function(source, args)
    GiveWeaponToPed(GetPlayerPed(-1), "WEAPON_PISTOL", 1000, false, false)
end)

function beginRobTimer(entity)
    local timer = 18

    while canRob do
        timer = timer - 1
        if timer == 0 then
            canRob = false
            SetBlockingOfNonTemporaryEvents(entity, false)
        end
        Wait(1000)
    end
end

function isNpc(ped)
    if IsPedAPlayer(ped) then
        return false
    else
        return true
    end
end


RegisterNetEvent('onyx:returnSearchedVehTable')
AddEventHandler('onyx:returnSearchedVehTable', function(plate)
    local vehPlate = plate
    table.insert(searchedVehicles, vehPlate)
end)

function hasBeenSearched(plate)
    local vehPlate = plate
    for k, v in ipairs(searchedVehicles) do
        if v == vehPlate then
            return true
        end
    end
    return false
end

function hasKeys(plate)
    local vehPlate = plate
    for k, v in ipairs(vehicles) do
        if v == vehPlate or v == vehPlate .. ' ' then
            return true
        end
    end
    return false
end

function DrawText3Ds(x, y, z, text)
	local onScreen,_x,_y=World3dToScreen2d(x,y,z)
	local factor = #text / 460
	local px,py,pz=table.unpack(GetGameplayCamCoords())
	
	SetTextScale(0.3, 0.3)
	SetTextFont(1)
	SetTextProportional(1)
	SetTextColour(255, 255, 255, 160)
	SetTextEntry("STRING")
	SetTextCentre(1)
	AddTextComponentString(text)
	DrawText(_x,_y)
	DrawRect(_x,_y + 0.0115, 0.02 + factor, 0.027, 28, 28, 28, 95)
end