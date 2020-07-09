ESX = nil
local StartSweep = false

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
    end
end)

--[[
Citizen.CreateThread(function()
    while true do
        if StartSweep then
            TriggerEvent("mythic_progressbar:client:progress", {
                name = "sweeping",
                duration = Config.SweepTime * 1000,
                label = "掃地中",
                useWhileDead = false,
                canCancel = false,
                controlDisables = {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                },
                animation = {
                    animDict = "amb@world_human_aa_smoke@male@idle_a",
                    anim = "idle_c"
                },
            }, function(status)
                if not status then
					--secondsRemaining = 0
					--print("販毒成功")
                end
            end)
        end
        Citizen.Wait(1000)
    end
end)
--]]

RegisterNetEvent('esx_sweep:sweep')
AddEventHandler('esx_sweep:sweep', function()
    --RemoveBlip(blipRobbery)
    TriggerEvent("mythic_progressbar:client:progress", {
        name = "sweeping",
        duration = Config.SweepTime * 1000,
        label = "掃地中",
        useWhileDead = false,
        canCancel = false,
        controlDisables = {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        },
        animation = {
            animDict = "amb@world_human_janitor@male@idle_a",
            anim = "idle_a"
        },
    }, function(status)
        if not status then
            --secondsRemaining = 0
            --print("販毒成功")
        end
    end)
end)