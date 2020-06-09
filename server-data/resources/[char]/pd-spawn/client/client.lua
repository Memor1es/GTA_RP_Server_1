local new = false
local k = 270.0
local cam

RegisterNetEvent("pd-spawn")
AddEventHandler("pd-spawn", function()
    pos = GetEntityCoords(PlayerPedId())
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x, pos.y, pos.z + 200.0, 270.00, 0.00, 0.00, 80.00, 0, 0)
    SetCamActive(cam, true)
    RenderScriptCams(true, false, 1, true, true)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityVisible(PlayerPedId(), false, false)
    
    SetNuiFocus(true, true)
    SendNUIMessage({ display = true })
end)

RegisterNUICallback("spawn", function(data)
    if data.choice == "spawn" then
        new = false
        SetNuiFocus(false)
        SendNUIMessage({ display = false })
        
        DoScreenFadeOut(500)
        Citizen.Wait(500)
        
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true, false)
        
        RenderScriptCams(false, false, 0, true, true)
        SetCamActive(cam, false)
        DestroyCam(cam, true)

        DoScreenFadeIn(500)
    else
        new = false
        speed = 0.7

        DoScreenFadeOut(500)
        Citizen.Wait(500)
        SetCamRot(cam, 270.0)
        SetCamActive(cam, true)
        new = true
        k = 270.0

        DoScreenFadeIn(500)
        
        SetEntityCoords(PlayerPedId(), config.coords[data.choice].x, config.coords[data.choice].y, config.coords[data.choice].z, 0, 0, 0, 0)
        pos = GetEntityCoords(PlayerPedId())

        SetCamCoord(cam, pos.x, pos.y, pos.z + 200.0)
        i = pos.z + 200.0

        while i > config.coords[data.choice].z + 1.5 do
            Citizen.Wait(5)
            i = i - speed
            SetCamCoord(cam, pos.x, pos.y, i)
            if i <= config.coords[data.choice].z + 35.0 and k < 360.0 then
                if speed - 0.0078 >= 0.05 then
                    speed = speed - 0.0078
                end

                k = k + 0.75
                SetCamRot(cam, k)
            end
            
            if not new then break end
        end
    end
end)
