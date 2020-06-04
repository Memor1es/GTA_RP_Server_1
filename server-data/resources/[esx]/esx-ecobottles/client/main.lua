ESX                           = nil

local cachedBins = {}

Citizen.CreateThread(function ()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) 
            ESX = obj 
        end)

        Citizen.Wait(5)
    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(100)
    end
    Citizen.Wait(100)

    for locationIndex = 1, #Config.SellBottleLocations do
        local locationPos = Config.SellBottleLocations[locationIndex]
        local locationName = Config.SellBottleLocationNames[locationIndex]

        if (ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'recycler') and locationName == 'Recycler' then
            local blip = AddBlipForCoord(locationPos)
            SetBlipSprite(blip, 441)

            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 48)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("回收站")
            EndTextCommandSetBlipName(blip)
            --SetBlipDisplay(blip, 4)
        elseif locationName == 'Convenient' then
            local blip = AddBlipForCoord(locationPos)
            SetBlipSprite(blip, 409)

            SetBlipScale(blip, 0.8)
            SetBlipColour(blip, 48)
            SetBlipAsShortRange(blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString("回收站")
            EndTextCommandSetBlipName(blip)
            --SetBlipDisplay(blip, 4)
        end
    end
    
    while true do
        local sleepThread = 500

        local ped = PlayerPedId()
        local pedCoords = GetEntityCoords(ped)

        for locationIndex = 1, #Config.SellBottleLocations do
            local locationPos = Config.SellBottleLocations[locationIndex]
            local locationName = Config.SellBottleLocationNames[locationIndex]
			
            local dstCheck = GetDistanceBetweenCoords(pedCoords, locationPos, true)
            if ESX.PlayerData.job ~= nil and ESX.PlayerData.job.name == 'recycler' and locationName == 'Recycler' then
                sleepThread = 5

                if dstCheck <= 2.5 then
                    ESX.ShowHelpNotification("按下 ~INPUT_CONTEXT~ 來販賣空瓶子")

                    if IsControlJustReleased(0, 38) then
                        TriggerServerEvent("esx-ecobottles:sellBottles", 7)
                    end
                end
            elseif locationName == 'Convenient' then
                if dstCheck <= 5.0 then
                    sleepThread = 5

                    local text = "販賣空瓶子"

                    if dstCheck <= 1.5 then
                        text = "[~g~E~s~] " .. text

                        if IsControlJustReleased(0, 38) then
                            TriggerServerEvent("esx-ecobottles:sellBottles", 1)
                        end
                    end
                    
                    ESX.Game.Utils.DrawText3D(locationPos, text, 1)
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
    
end)

Citizen.CreateThread(function()
    Citizen.Wait(100)

    while true do
        local sleepThread = 5000
        --print(Config.BinsAvailable[1])
        --local entity, entityDst = ESX.Game.GetClosestObject(nil,Config.BinsAvailable)
        local entity, entityDst = ESX.Game.GetClosestEntity(ESX.Game.GetObjects(), false, nil, Config.BinsAvailable)

        if DoesEntityExist(entity) and entityDst <= 1.5 then
            sleepThread = 5

            local binCoords = GetEntityCoords(entity)
            local ped = PlayerPedId()
            ESX.Game.Utils.DrawText3D(binCoords + vector3(0.0, 0.0, 0.5), "[~g~E~s~] 翻垃圾桶", 1)

            if IsControlJustReleased(0, 38) and IsPedOnFoot(ped) then
                if not cachedBins[entity] then
                    cachedBins[entity] = true

                    OpenTrashCan()
                else
                    ESX.ShowNotification("你已經找過這個桶子了!")
                end
            end
        end

        Citizen.Wait(sleepThread)
    end
end)

function OpenTrashCan()
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)

    Citizen.Wait(10000)

    TriggerServerEvent("esx-ecobottles:retrieveBottle")

    ClearPedTasks(PlayerPedId())
end
