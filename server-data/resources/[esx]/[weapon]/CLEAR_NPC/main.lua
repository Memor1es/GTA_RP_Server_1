Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        ClearAreaOfPeds(355.7, -596.4, 27.79, 500, 1)  --ambulance
        Citizen.Wait(5000)
        --ClearAreaOfPeds(296.81, -586.14, 43.26, 500, 1)
        ClearAreaOfPeds(332.52, -589.32, 43.28, 500, 1) --ambulance
        Citizen.Wait(5000)
        ClearAreaOfPeds(349.97, -598.46, 43.28, 500, 1) --ambulance
        Citizen.Wait(5000)
		ClearAreaOfPeds(452.6, -992.8, 30.6, 500, 1) --police
        Citizen.Wait(5000)
        --Citizen.Wait(1000*60*3) --3minutes update
    end
 
end)

local dispatchTypes =
{
	DT_PoliceAutomobile = { ID = 1, ACTIVE = false },
	DT_PoliceHelicopter = { ID = 2, ACTIVE = false },
	DT_FireDepartment = { ID = 3, ACTIVE = false },
	DT_SwatAutomobile = { ID = 4, ACTIVE = false },
	DT_AmbulanceDepartment = { ID = 5, ACTIVE = false },
	DT_PoliceRiders = { ID = 6, ACTIVE = false },
	DT_PoliceVehicleRequest = { ID = 7, ACTIVE = false },
	DT_PoliceRoadBlock = { ID = 8, ACTIVE = false},
	DT_PoliceAutomobileWaitPulledOver = { ID = 9, ACTIVE = false },
	DT_PoliceAutomobileWaitCruising = { ID = 10, ACTIVE = false },
	DT_Gangs = { ID = 11, ACTIVE = false },
	DT_SwatHelicopter = { ID = 12, ACTIVE = false },
	DT_PoliceBoat = { ID = 13, ACTIVE = false },
	DT_ArmyVehicle = { ID = 14, ACTIVE = false },
	DT_BikerBackup = { ID = 15, ACTIVE = false }
}

Citizen.CreateThread(function()
	while true do
		Wait(0)
		if NetworkIsPlayerActive(PlayerId()) then
			for k,v in pairs(dispatchTypes) do
				EnableDispatchService(dispatchTypes[k].ID, dispatchTypes[k].ACTIVE)
			end
			SetMaxWantedLevel(0)
			break;
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0) -- prevent crashing

		-- These natives have to be called every frame.
		SetVehicleDensityMultiplierThisFrame(4.0) -- set traffic density to 0 
		SetPedDensityMultiplierThisFrame(4.0) -- set npc/ai peds density to 0
		SetRandomVehicleDensityMultiplierThisFrame(2.0) -- set random vehicles (car scenarios / cars driving off from a parking spot etc.) to 0
		SetParkedVehicleDensityMultiplierThisFrame(2.0) -- set random parked vehicles (parked car scenarios) to 0
		SetScenarioPedDensityMultiplierThisFrame(4.0, 4.0) -- set random npc/ai peds or scenario peds to 0
		SetGarbageTrucks(false) -- Stop garbage trucks from randomly spawning
		SetRandomBoats(false) -- Stop random boats from spawning in the water.
		SetCreateRandomCops(false) -- disable random cops walking/driving around.
		SetCreateRandomCopsNotOnScenarios(false) -- stop random cops (not in a scenario) from spawning.
        SetCreateRandomCopsOnScenarios(false) -- stop random cops (in a scenario) from spawning.
        SetScenarioTypeEnabled(scenario_name, false)
		
		local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
		ClearAreaOfVehicles(x, y, z, 1000, false, false, false, false, false)
		RemoveVehiclesFromGeneratorsInArea(x - 500.0, y - 500.0, z - 500.0, x + 500.0, y + 500.0, z + 500.0);
	end
end)


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
        DisablePlayerVehicleRewards(PlayerId())
    end
end)

Citizen.CreateThread(function()
    while true do
      Citizen.Wait(100)
      SetPlayerHealthRechargeMultiplier(PlayerId(), 0)
    end
end)

----------------------------------------------------------------------------
--DANO CORONHADA //// PISTOL WHIPPING
----------------------------------------------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
    local ped = PlayerPedId()
        if IsPedArmed(ped, 6) then
       DisableControlAction(1, 140, true)
              DisableControlAction(1, 141, true)
           DisableControlAction(1, 142, true)
        end
    end
end)

--================================ weapon damage ========================


local MeeleWeapons = {    
    ["WEAPON_KNIFE"] = 0.1,
    ["WEAPON_KNUCKLE"] = 0.1,
    ["WEAPON_NIGHTSTICK"] = 0.1,
    ["WEAPON_HAMMER"] = 0.1,
    ["WEAPON_BAT"] = 0.1,
    ["WEAPON_GOLFCLUB"] = 0.1,
    ["WEAPON_CROWBAR"] = 0.1,
    ["WEAPON_BOTTLE"] = 0.1,
    ["WEAPON_DAGGER"] = 0.1,
    ["WEAPON_HATCHET"] = 0.1,
    ["WEAPON_MACHETE"] = 0.1,
    ["WEAPON_FLASHLIGHT"] = 0.1,
    ["WEAPON_SWITCHBLADE"] = 0.1,
    ["WEAPON_POOLCUE"] = 0.1,
    ["WEAPON_UNARMED"] = 0.1
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        --print(GetSelectedPedWeapon(PlayerPedId(-1)))
        --print(GetHashKey('WEAPON_UNARMED'))
        for weapon, modifier in pairs(MeeleWeapons) do
            if GetSelectedPedWeapon(PlayerPedId(-1)) == GetHashKey(weapon) then
            
                SetPlayerMeleeWeaponDamageModifier(PlayerId(-1), v)
            end
        end
    end
end)

Citizen.CreateThread(function()
    while true do
	N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.4) 	 
	Wait(0)
    end
end)