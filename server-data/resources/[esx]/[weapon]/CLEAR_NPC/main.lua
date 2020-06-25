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


Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1)

        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_CARBINERIFLE'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PISTOL'))
        RemoveAllPickupsOfType(GetHashKey('PICKUP_WEAPON_PUMPSHOTGUN'))
        DisablePlayerVehicleRewards(PlayerId())
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