ESX              = nil
local PlayerData = {}
isindeal = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		local sleep = 500
		local playercoords = GetEntityCoords(GetPlayerPed(-1))

		for i, v in pairs(Config.Location) do
		   if GetDistanceBetweenCoords(playercoords.x, playercoords.y, playercoords.z, Config.Location["coords"].x, Config.Location["coords"].y, Config.Location["coords"].z) <= 0.3 and isindeal == false then
		   sleep = 5
		   --DrawMarker(Config.Location["type"], Config.Location["coords"].x, Config.Location["coords"].y, Config.Location["coords"].z, 0.0, 0.0, 360.0, 0.0, 0.0, 0.0, Config.Location["size"], 50, 150, 50, 100)
		   ESX.Game.Utils.DrawText3D(Config.Location["coordst"], Config.Location["text"], Config.Location["textscale"])
		   if IsControlJustReleased(0, Config.Location["key"]) then
			SetEntityHeading(GetPlayerPed(-1), Config.Location["coords"].heading)
			SetEntityCoords(GetPlayerPed(-1), Config.Location["coords"].x, Config.Location["coords"].y, Config.Location["coords"].z)
			FreezeEntityPosition(GetPlayerPed(-1), true)
			Wait(1000)
			RequestAnimDict("timetable@jimmy@doorknock@")
             while not HasAnimDictLoaded( "timetable@jimmy@doorknock@") do
                 Citizen.Wait(0)
             end
			 TaskPlayAnim(GetPlayerPed(-1), "timetable@jimmy@doorknock@" ,"knockdoor_idle" ,8.0, -8.0, -1, 0, 0, false, false, false )
			 Wait(3000)
			 FreezeEntityPosition(GetPlayerPed(-1), false)
			 --TaskGoStraightToCoord(GetPlayerPed(-1), Config.Location["gocoords"].x, Config.Location["gocoords"].y, Config.Location["gocoords"].z, 1.0, 500)
			 Wait(2000)
			 DoScreenFadeOut(600)
			 Wait(700)
			 RequestModel(-1835459726)
			 while not HasModelLoaded(-1835459726) do
				 Wait(0)
			 end
			 ped = CreatePed(4, -1835459726, Config.Location["coordst"], 79.32, false, true)
			 Wait(3000)
			 DoScreenFadeIn(600)
			 SetEntityCoords(GetPlayerPed(-1), Config.Location["gocoords"]["x"], Config.Location["gocoords"]["y"], Config.Location["gocoords"]["z"] - 1)
			 FreezeEntityPosition(GetPlayerPed(-1), true)
			 SetEntityHeading(GetPlayerPed(-1), 266.12)
			 isindeal = true
			 opendrugmenu()
		   end
		   end
		end
		if isindeal == true then
			sleep = 5
		if IsControlJustReleased(0, 73) then
			ESX.ShowAdvancedNotification("Jimmy The Plug", "Information", "下次見", "CHAR_WADE", 9) 
			isindeal = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
			DeletePed(ped)
		end
	    end
	Citizen.Wait(sleep)
	end
end)

opendrugmenu = function()
	ESX.UI.Menu.Open(
		'default', GetCurrentResourceName(), 'drugs',
		{
            title  = 'Jimmy The Plug' ,
            align = 'center',
			elements = {
				{label = "大麻 $100", type = "slider", value = 1, min = 1, max = 5, price = 100, item = "seed_weed"},
				--{label = "安非 $500", type = "slider", value = 1, min = 1, max = 5, price = 500, item = "seed_meth"},
				{label = "圖紙 $10000", type = "slider", value = 1, min = 1, max = 5, price = 10000, item = "recipe_lockpick"},
            }
		},
		function(data, menu)
			local name = data.current.item
			local amount = data.current.value
			local money = data.current.value * data.current.price

			TriggerServerEvent('esx_drugseller:buy', name, amount, money)
        end,
        function(data, menu)
			menu.close()
			ESX.ShowAdvancedNotification("Jimmy The Plug", "Information", "下次見", "CHAR_WADE", 9) 
			isindeal = false
			FreezeEntityPosition(GetPlayerPed(-1), false)
			DeletePed(ped)
        end
	)
end