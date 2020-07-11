ESX = nil
local PlayerData = {}

Citizen.CreateThread(function()
    while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

-- Display markers
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		
		if PlayerData.job and PlayerData.job.name ~= 'police' then

			local playerPed = PlayerPedId()
			local coords    = GetEntityCoords(playerPed)
			local isInMarker, hasExited, letSleep = false, false, true
			local currentStation, currentPart, currentPartNum

			for k,v in pairs(Config.place) do

				for i=1, #v.net, 1 do
					local distance = GetDistanceBetweenCoords(coords, v.net[i].position, true)
					

					if distance < Config.DrawDistance then
						--DrawMarker(20, v.net[i].position, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 1.0, 1.0, 1.0, Config.MarkerColor.r, Config.MarkerColor.g, Config.MarkerColor.b, 100, false, true, 2, true, false, false, false)
						letSleep = false
					end

					if distance < Config.MarkerSize.x then
                        --isInMarker, currentStation, currentPart, currentPartNum = true, k, 'Cloakroom', i
						--ESX.ShowHelpNotification("按下 ~INPUT_CONTEXT~ 來更換 ~y~衣服~s~")
						ESX.Game.Utils.DrawText3D(v.net[i].position + vector3(0.0, 0.0, 0.5), v.net[i].text, 1)
					end
				end
				
			end

			if letSleep then
				Citizen.Wait(500)
			end

		else
			Citizen.Wait(500)
		end
	end
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


