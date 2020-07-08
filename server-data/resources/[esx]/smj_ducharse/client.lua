ESX          = nil

---------------------------------------------------------- Config ----------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------
local command = true -- false = /smutsig
local isSmutsig = false
local TreDMe = false -- necesitas 3dme: https://github.com/Sheamle/3dme pon false para que no salga nada encima de tu personaje
local debug = true -- log f8
local duschar = { 
	["Lägenhetsdusch1"] = { ["x"] = 1764.86, ["y"] = 2580.84, ["z"] = 44.8, ["h"] = 92.74},
	["Lägenhetsdusch2"] = { ["x"] = 1764.86, ["y"] = 2582.93, ["z"] = 44.8, ["h"] = 92.74},
	["Lägenhetsdusch3"] = { ["x"] = 1761.9, ["y"] = 2582.93, ["z"] = 44.8, ["h"] = 267.56},
	["Lägenhetsdusch4"] = { ["x"] = 1761.9, ["y"] = 2580.84, ["z"] = 44.8, ["h"] = 267.56}
	
	--	["Dusch1"] = { ["x"] = -1382.77, ["y"] = -1328.39, ["z"] = 3.3, ["h"] = 261.38}, --Ducha Publica
    --	["Dusch2"] = { ["x"] = -1243.76, ["y"] = -1537.76, ["z"] = 3.45, ["h"] = 260.36}, --Ducha Publica
	--["Lägenhetsdusch1"] = { ["x"] = 254.39, ["y"] = -1000.25, ["z"] = -99.78, ["h"] = 177.36}, --Ducha de apartamento 1
	--["Lägenhetsdusch1"] = { ["x"] = 1398.2, ["y"] = -602.5, ["z"] = -0.87, ["h"] = 329.18}, --Ducha de casa nikola
	--["Lägenhetsdusch1"] = { ["x"] = 336.5, ["y"] = -204.35, ["z"] = -56.25, ["h"] = 131.0}, --Ducha del motel
	--["Lägenhetsdusch1"] = { ["x"] = 155.18, ["y"] = -1000.09, ["z"] = -99.5, ["h"] = 131.0}, --Ducha del motel
	--["Lägenhetsdusch1"] = { ["x"] = 1005.31, ["y"] = -121.63, ["z"] = 74.18, ["h"] = 150.49}, --Ducha clubmotero
	--["Lägenhetsdusch1"] = { ["x"] = 155.02, ["y"] = -1000.35, ["z"] = -99.6, ["h"] = 121.93} --Ducha motel
} 
local blips = { -- blips på mappen, för allmänna duschar
    --	{title="Ducha", colour=38, id=355, x = -1382.77, y = -1328.39, z = 4.0},
	--{title="Ducha", colour=38, id=355, x = -1243.76, y = -1537.76, z = 4.0}
}
----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- Status ----------------------------------------------------------
local scriptStatus = true
----------------------------------------------------------------------------------------------------------------------------
-- Ponga scriptStatus en ,true, si desea que sea un estado, false para que no sea un estado. 
----------------------------------------------------------------------------------------------------------------------------
-- Si es cierto, el jugador se ensuciará cuando el estado sea superior al 75%, falso entonces es aleatorio.
----------------------------------------------------------------------------------------------------------------------------
---------------------------------------------------------- Scriptet --------------------------------------------------------

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(120000)
		local smutsigRisk = math.random(100)
		if not isSmutsig and not scriptStatus and smutsigRisk <= 5 then -- 5% que te ensucias si no tienes esx_status
			isSmutsig = true
			Wait(500)
			if debug then
				--print('Blev smutsig random, smutsigRisk: ' .. smutsigRisk)
			end
		end
	end
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)
  
Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.35)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
      BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5000)
		if isSmutsig then
			TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'flugor')
			if TreDMe then
				ESX.ShowNotification('~o~Necesitas ~b~ducharte~o~ ya!')
			end
			Wait(500)
		end
	end
end)

AddEventHandler('esx_status:loaded', function(status)
	if scriptStatus then
	TriggerEvent('esx_status:registerStatus', 'dirty', 0, '#593400', function(status)
		return false
	end, function(status)
		status.add(25)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(5000)

			local playerPed  = PlayerPedId()

			TriggerEvent('esx_status:getStatus', 'dirty', function(status)
				if status.val >= 900000 then
					isSmutsig = true
				else
				Wait(500)
				end
			end)
		end
	end)
	end
end)

RegisterNetEvent('loffe_smutsig:syncFlugor')
AddEventHandler('loffe_smutsig:syncFlugor', function(ped, stop)
		local Player = ped
		local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

		local particleDictionary = "core"
		local particleName = "ent_amb_fly_swarm"

		RequestNamedPtfxAsset(particleDictionary)

		while not HasNamedPtfxAssetLoaded(particleDictionary) do
			isSmutsig = false
			Citizen.Wait(0)
		end

		SetPtfxAssetNextCall(particleDictionary)

		bone = GetPedBoneIndex(PlayerPed, 11816)

		effect = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect2 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect3 = StartParticleFxLoopedOnPedBone(particleName, PlayerPed, 0.0, 0.0, -0.6, 0.0, 0.0, 20.0, bone, 2.2, false, false, false)
		Wait(25)
		effect4 = StartParticleFxLoopedOnPedBone("exp_grd_bzgas_smoke", PlayerPed, 0.0, 0.0, 0.1, 0.0, 0.0, 20.0, bone, 1, false, false, false)
		Wait(600)
		StopParticleFxLooped(effect, 0)
		Wait(25)
		StopParticleFxLooped(effect2, 0)
		Wait(25)
		StopParticleFxLooped(effect3, 0)
		Wait(25)
		StopParticleFxLooped(effect4, 0)
		Wait(25)
end)

Citizen.CreateThread(function()
	while true do
      
	Citizen.Wait(5)
      
		local coords = GetEntityCoords(GetPlayerPed(-1))
		for k, v in pairs(duschar) do
			if GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true) < 100 then
				DrawMarker(27, v["x"], v["y"], v["z"], 0.0, 0.0, 0.0, 0, 0.0, 0.0, 2.0, 2.0, 2.0, 0, 0, 0, 0, false, true, 2, false, false, false, false)
				if GetDistanceBetweenCoords(coords, v["x"], v["y"], v["z"], true) < 1.5 then
					DrawText3D(v["x"], v["y"], v["z"]+0.9, '[~r~E~s~] ~b~洗澡', 1.5)
					if IsControlPressed(0, 38) then
						isSmutsig = false
						local hashSkin = GetHashKey("mp_m_freemode_01") 	
						SetEntityCoords(GetPlayerPed(-1), v["x"], v["y"], v["z"])
						SetEntityHeading(GetPlayerPed(-1), v["h"])
						FreezeEntityPosition(GetPlayerPed(-1), true)
						if GetEntityModel(GetPlayerPed(-1)) == hashSkin then -- kille
							if debu then
								print("kille")
							end
							TriggerEvent('skinchanger:getSkin', function(skin)
								local clothesSkin = {
								['tshirt_1'] = 15, ['tshirt_2'] = 0,
								['torso_1'] = 15, ['torso_2'] = 0,
								['arms'] = 15,
								['pants_1'] = 61, ['pants_2'] = 5,
								['shoes_1'] = 34, ['shoes_2'] = 0,
							}
							TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

						end)
						else
							if debug then
								print("tjej")
							end
							TriggerEvent('skinchanger:getSkin', function(skin)
								local clothesSkin = {
								['tshirt_1'] = 15, ['tshirt_2'] = 0,
								['torso_1'] = 15, ['torso_2'] = 0,
								['arms'] = 15,
								['pants_1'] = 15, ['pants_2'] = 0,
								['shoes_1'] = 35, ['shoes_2'] = 0,
							}
							TriggerEvent('skinchanger:loadClothes', skin, clothesSkin)

							end)
						end
						Citizen.Wait(500)
						TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'vatten', v["x"], v["y"], v["z"])
						Citizen.Wait(2500)
						if scriptStatus then
							TriggerEvent('esx_status:set', 'dirty', 0)
							isSmutsig = false
						end
						Citizen.Wait(1000)
						TriggerServerEvent('loffe_smutsig:sync', GetPlayerServerId(PlayerId()), 'flugor')
						Citizen.Wait(6500)
						FreezeEntityPosition(GetPlayerPed(-1), false)
					end
				end
			end
		end
	end
end)

RegisterNetEvent('loffe_smutsig:syncVatten')
AddEventHandler('loffe_smutsig:syncVatten', function(ped, x, y, z)
		if debug then
			print("vatten")
		end
		local Player = ped
		local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))

		local particleDictionary = "core"
		local particleName = "exp_sht_steam"
		local animDictionary = 'mp_safehouseshower@male@'
		local animDictionary2 = 'mp_safehouseshower@female@'
		local animName = 'male_shower_idle_b'
		local animName2 = 'shower_idle_b'
		
		RequestAnimDict(animDictionary)

		while not HasAnimDictLoaded(animDictionary) do
			Citizen.Wait(0)
		end
		
		local hashSkin = GetHashKey("mp_m_freemode_01") 
				
		RequestAnimDict(animDictionary2)

		while not HasAnimDictLoaded(animDictionary2) do
			Citizen.Wait(0)
		end		
		TaskPlayAnim(PlayerPed, animDictionary, animName, 8.0, -8.0, -1, 0, 0, false, false, false)
		
		RequestNamedPtfxAsset(particleDictionary)

		while not HasNamedPtfxAssetLoaded(particleDictionary) do
			Citizen.Wait(0)
		end

		SetPtfxAssetNextCall(particleDictionary)
		
		local coords = GetEntityCoords(playerPed)
		local effect = StartParticleFxLoopedAtCoord(particleName, x, y, z+2.6, 0.0, 180.0, 0.0, 5.0, false, false, false, false)
		Wait(25)
		Wait(10000)
		DeleteEntity(prop)
		while not DoesParticleFxLoopedExist(effect) do
		Wait(5)
		end
		StopParticleFxLooped(effect, 0)
		Wait(25)
		StopParticleFxLooped(effect, 0)
		ClearPedTasks(PlayerPed)
		ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
		TriggerEvent('skinchanger:loadSkin', skin)
		Wait(25)
		StopParticleFxLooped(effect, 0)
		end)
		SetPedWetnessHeight(PlayerPed, 1.0)
end)

RegisterCommand("smutsig", function(source)  
	if command then
		if scriptStatus then
			TriggerEvent('esx_status:set', 'dirty', 900000)
			TriggerEvent("pNotify:SendNotification",{
				text = ('Todo el mundo a tu alrededor ahora siente lo mal que hueles!'),
				type = "warning",
				timeout = (5000),
				layout = "bottomCenter",
				queue = "global"
			})
		else
			isSmutsig = not isSmutsig
		end
	else
		TriggerEvent("pNotify:SendNotification",{
			text = ('No puedes ensuciarte más...'),
			type = "error",
			timeout = (5000),
			layout = "bottomCenter",
			queue = "global"
		})
	end
end, false)

function DrawText3D(x, y, z, text, scale)
    local onScreen, _x, _y = World3dToScreen2d(x, y, z)
    local pX, pY, pZ = table.unpack(GetGameplayCamCoords())
 
    SetTextScale(scale, scale)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextEntry("STRING")
    SetTextCentre(1)
    SetTextColour(255, 255, 255, 215)
 
    AddTextComponentString(text)
    DrawText(_x, _y)
 
    local factor = (string.len(text)) / 230
    DrawRect(_x, _y + 0.0250, 0.095 + factor, 0.06, 41, 11, 41, 100)
end
