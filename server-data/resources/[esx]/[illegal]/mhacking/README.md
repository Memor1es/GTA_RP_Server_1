# FiveM-Scripts
My Public FiveM Scripts

## mhacking
The hacking minigame is inspired by the Hacking Minigame of Alpha Protocol, notoriously known for being horrible to play. You need to find two constant hex code blocks in a fast enough changing table of hexcode. It is purely a visual minigame. In the screen below you will see the left block hovering directly above a solution -- need to move it one down and press space to be accepted as a correct solution.

### Sample Implementation
```
function mycb(success, timeremaining)
	if success then
		print('Success with '..timeremaining..'s remaining.')
		TriggerEvent('mhacking:hide')
	else
		print('Failure')
		TriggerEvent('mhacking:hide')
	end
end


Citizen.CreateThread(function()
  while true do
    Citizen.Wait(0)
    if IsControlJustReleased(1,213) then -- Home key
	  TriggerEvent("mhacking:show")
	  TriggerEvent("mhacking:start",7,35,mycb)
    end
  end
end)
```

### Changelog

#### 20171225
* Initial Release
#### 20180102
* Fixed mhacking not reseting mistakes
#### 20180110
* Added time remaining in ms as a second parameter for the callback function;
* If the player dies, the script now sets the remaining time to 0, and fails the player. 
* Added `mhacking:setmessage` to set messages while waiting for feedback 
* Added `sequentialhack.lua` to handle sequentialhacks without everyone needing to program their own implementation, which can be removed from the `__resource.lua` if one does not need it.

## mtracker
This release is a trackify replacement. In case you do have not played GTA: Online or GTAV, it is a cellphone app that tracks the position of an entity (Player, Civilian, Vehicle, etc.) in the world and instead of displaying a symbol on the map you just get a red dot on your phone and if you travel towards the red dot on your phone you will ultimately meet that entity.

### Sample Implementation
```
targetsEntity = {}
spawnPos = {{-397.80331420898,-2164.9846191406,15.8256015777588},{1227.6180419922,2719.5869140625,40.005180358887}}
stuffSpawned = false

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(1,213) then -- home key
			if not stuffSpawned then
				local vhash = GetHashKey('boxville')
				local dhash = GetHashKey('s_m_y_airworker')
				RequestModel(vhash)
				while not HasModelLoaded(vhash) do
					Citizen.Wait(1)
				end
				local v1 = CreateVehicle(vhash, spawnPos[1][1],spawnPos[1][2],spawnPos[1][3], 0.0, true, false)
				local v2 = CreateVehicle(vhash, spawnPos[2][1],spawnPos[2][2],spawnPos[2][3], 0.0, true, false)
				SetVehicleOnGroundProperly(v1)
				SetVehicleOnGroundProperly(v2)

				RequestModel(dhash)
				while not HasModelLoaded(dhash) do
					Citizen.Wait(1)
				end
				local d1 = CreatePedInsideVehicle(v1, 4, dhash, -1, true, 0)
				local d2 = CreatePedInsideVehicle(v2, 4, dhash, -1, true, 0)
				TaskVehicleDriveWander(d1, v1, 20.0, 536871299)
				TaskVehicleDriveWander(d2, v2, 20.0, 536871299)
				stuffSpawned = true

				table.insert(targetsEntity,v1)
				table.insert(targetsEntity,v2)
				TriggerEvent('mtracker:settargets', targetsEntity)
			end
			TriggerEvent('mtracker:start')
		end
	end
end)
```
This script spawns two boxvilles of the LS Department of Water and Power who drive around randomly through the world. I think the AI script only truely triggers when you are close enough to them, but it is good enough to understand the workings of the app. 


### Changelog

#### 20180102 
* Initial Release
#### 20180103
* Changed isrunning to be an export, as synchronous feedback is needed. 
* Removed an unneeded utility function.