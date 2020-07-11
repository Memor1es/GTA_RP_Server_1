ESX = nil
local onspor = false

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
      end
end)


-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Halteres.x,Config.Coords.Halteres.y, Config.Coords.Halteres.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Halteres"
			if dstCheck <= 0.65 then
				text = "Travaillez les Halteres, Appuyez sur la touche[~g~E~s~] "
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Halteres()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Halteres, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Halteres2.x,Config.Coords.Halteres2.y, Config.Coords.Halteres2.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Halteres"
			if dstCheck <= 0.65 then
				text = "Travaillez les Halteres, Appuyez sur la touche[~g~E~s~] "
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Halteres2()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Halteres2, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Tractions.x, Config.Coords.Tractions.y, Config.Coords.Tractions.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Tractions"
			if dstCheck <= 0.65 then
				text = "Travaillez les Tractions , Appuyez sur la touche[~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Tractions()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Tractions, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Tractions2.x, Config.Coords.Tractions2.y, Config.Coords.Tractions2.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Tractions"
			if dstCheck <= 0.65 then
				text = "Travaillez les Tractions , Appuyez sur la touche[~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Tractions2()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Tractions2, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.YogaYap.x, Config.Coords.YogaYap.y, Config.Coords.YogaYap.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Yoga"
			if dstCheck <= 0.65 then
				text = "Faire du yoga, Appuyez sur la touche[~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            yogayap()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.YogaYap, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Abdos.x, Config.Coords.Abdos.y, Config.Coords.Abdos.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Abdos"
			if dstCheck <= 0.65 then
				text = "Travaillez les abdos , Appuyez sur la touche [~g~E~s~] "
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Abdos()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Abdos, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Abdos2.x, Config.Coords.Abdos2.y, Config.Coords.Abdos2.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Abdos"
			if dstCheck <= 0.65 then
				text = "Travaillez les abdos , Appuyez sur la touche [~g~E~s~] "
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Abdos2()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Abdos2, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Pompes.x, Config.Coords.Pompes.y, Config.Coords.Pompes.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Pompes"
			if dstCheck <= 0.65 then
				text = "Pour faire des Pompes, Appuyez sur la touche[~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Pompes()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Pompes, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Pompes2.x, Config.Coords.Pompes2.y, Config.Coords.Pompes2.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Pompes"
			if dstCheck <= 0.65 then
				text = "Pour faire des Pompes, Appuyez sur la touche[~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            Pompes2()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Pompes2, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)

Citizen.CreateThread(function()
	Citizen.Wait(100)
	while true do
		local sleepThread = 500
		local ped = PlayerPedId()
		local pedCoords = GetEntityCoords(ped)
		local dstCheck = GetDistanceBetweenCoords(pedCoords, Config.Coords.Eau.x, Config.Coords.Eau.y, Config.Coords.Eau.z, true)
		if dstCheck <= 5.0 then
			sleepThread = 5
			local text = "Machine à eau"
			if dstCheck <= 0.65 then
				text = "Pour obtenir de l'eau, Appuyez sur la touche [~g~E~s~]"
				if IsControlJustPressed(0, 38) then
					if not onspor then
            		Eau()
					end
				end
			end
			ESX.Game.Utils.DrawText3D(Config.Coords.Eau, text, 0.6)
		end
		if dstCheck >= 7.0 then
			Citizen.Wait(5000)
		else 
			Citizen.Wait(5)
		end
	end
end)


-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
function Halteres()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Halteres.h)
  SetEntityCoords(playerPed, Config.Coords.Halteres.x,Config.Coords.Halteres.y,Config.Coords.Halteres.z-0.95)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "kol_calis", duration = Config.Halterestemps * 1000, label = "Halteres que vous travaillez.."})
  Citizen.Wait(Config.Halterestemps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté', 5000)
  FreezeEntityPosition(playerPed, false)
  ClearPedTasksImmediately(playerPed)
end

function Halteres2()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Halteres2.h)
  SetEntityCoords(playerPed, Config.Coords.Halteres2.x,Config.Coords.Halteres2.y,Config.Coords.Halteres2.z-0.95)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "world_human_muscle_free_weights", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "kol_calis", duration = Config.Halteres2temps * 1000, label = "Halteres que vous travaillez.."})
  Citizen.Wait(Config.Halteres2temps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté', 5000)
  FreezeEntityPosition(playerPed, false)
  ClearPedTasksImmediately(playerPed)
end

function Tractions()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Tractions.h)
  SetEntityCoords(playerPed, Config.Coords.Tractions.x,Config.Coords.Tractions.y,Config.Coords.Tractions.z-1.05)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "barfiks_cek", duration = Config.Tractionstemps * 1000, label = "Vous faies des Tractions.."})
  Citizen.Wait(Config.Tractionstemps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  FreezeEntityPosition(playerPed, false)
	ClearPedTasksImmediately(playerPed)
end
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
function Tractions2()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Tractions2.h)
  SetEntityCoords(playerPed, Config.Coords.Tractions2.x,Config.Coords.Tractions2.y,Config.Coords.Tractions2.z-1.05)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "prop_human_muscle_chin_ups", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "barfiks_cek", duration = Config.Tractions2temps * 1000, label = "Vous faies des Tractions.."})
  Citizen.Wait(Config.Tractions2temps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  FreezeEntityPosition(playerPed, false)
	ClearPedTasksImmediately(playerPed)
end

function yogayap()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.YogaYap.h)
  SetEntityCoords(playerPed, Config.Coords.YogaYap.x,Config.Coords.YogaYap.y,Config.Coords.YogaYap.z-0.95)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "world_human_yoga", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "yoga_c", duration = Config.yogasuresi * 1000, label = "Tu fais du yoga.."})
  Citizen.Wait(Config.yogasuresi * 1000)
  if Config.removestressonyoga then
    TriggerServerEvent('eff:onyoga', _source)
  end
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté et votre stress a diminué.', 5000)
  FreezeEntityPosition(playerPed, false)
  ClearPedTasksImmediately(playerPed)
end

function Abdos()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
	TriggerEvent("mythic_progbar:client:progress", {name = "mekik_cek", duration = Config.abdostemps * 1000, label = "Vous faites des Abdos.."})
  Citizen.Wait(Config.abdostemps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  FreezeEntityPosition(playerPed, false)
	ClearPedTasksImmediately(playerPed)
end
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
function Abdos2()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  FreezeEntityPosition(playerPed, true)
	TaskStartScenarioInPlace(playerPed, "world_human_sit_ups", 0, true)
	TriggerEvent("mythic_progbar:client:progress", {name = "mekik_cek", duration = Config.abdos2temps * 1000, label = "Vous faites des Abdos.."})
  Citizen.Wait(Config.abdos2temps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  onspor = false
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  FreezeEntityPosition(playerPed, false)
	ClearPedTasksImmediately(playerPed)
end

function Pompes()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Pompes.h)
  SetEntityCoords(playerPed, Config.Coords.Pompes.x,Config.Coords.Pompes.y,Config.Coords.Pompes.z-0.95)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "sinav_cek", duration = Config.Pompestemps * 1000, label = "Faire des Pompess.."})
  Citizen.Wait(Config.Pompestemps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  onspor = false
  ClearPedTasksImmediately(playerPed)
  FreezeEntityPosition(playerPed, false)
end

function Pompes2()
  local _source = source
  local playerPed = PlayerPedId()
  onspor = true
  SetEntityHeading(playerPed, Config.Coords.Pompes2.h)
  SetEntityCoords(playerPed, Config.Coords.Pompes2.x,Config.Coords.Pompes2.y,Config.Coords.Pompes2.z-0.95)
  FreezeEntityPosition(playerPed, true)
  TaskStartScenarioInPlace(playerPed, "world_human_push_ups", 0, true)
  TriggerEvent("mythic_progbar:client:progress", {name = "sinav_cek", duration = Config.Pompes2temps * 1000, label = "Faire des Pompess.."})
  Citizen.Wait(Config.Pompes2temps * 1000)
  if Config.removedrinkonspor then
    TriggerServerEvent('eff:onspor', _source)
  end
  exports['mythic_notify']:SendAlert('inform', 'Votre soif a augmenté..', 5000)
  onspor = false
  ClearPedTasksImmediately(playerPed)
  FreezeEntityPosition(playerPed, false)
end
-- E.F.F. ©| Discord : https://discord.gg/y3v2SfP
function Eau()
  local _source = source
  local playerPed = PlayerPedId()
  SetEntityHeading(playerPed, Config.Coords.Eau.h)
    SetEntityCoords(playerPed, Config.Coords.Eau.x,Config.Coords.Eau.y,Config.Coords.Eau.z-0.95)
    local dict = 'anim@amb@clubhouse@tutorial@bkr_tut_ig3@'
	Citizen.Wait(1000)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
    end
    TaskPlayAnim(playerPed, dict, 'machinic_loop_mechandplayer', 8.0, -8.0, 5000, 1, 0, false, false, false)
    TriggerEvent("mythic_progbar:client:progress", {name = "su_al", duration = Config.eautemps * 1000, label = "Vous prenez de l'eau.."})
    Citizen.Wait(Config.eautemps * 1000)
    TriggerServerEvent('eff:eau', _source)
    ClearPedTasksImmediately(playerPed)
end