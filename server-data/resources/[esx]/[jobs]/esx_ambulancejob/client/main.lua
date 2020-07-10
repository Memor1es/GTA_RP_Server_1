local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
  }

  local firstSpawn, PlayerLoaded = true, false

  isDead = false
  ESX = nil

  local DeadanimGroup = {
	{label = 'lying_dead_player0a', type = 'animloop', data = {lib = 'missfinale_c1@', anim = 'lying_dead_player0'}},
	{label = 'lying_dead_player0b', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_player0'}},				
	{label = 'lying_idle_crew2', type = 'animloop', data = {lib = 'missheist_agency3amcs_4b', anim = 'lying_idle_crew2'}},
	{label = 'lying_dead_brad', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_brad'}},
	{label = 'dead_a', type = 'animloop', data = {lib = 'dead', anim = 'dead_a'}},
	{label = 'dead_b', type = 'animloop', data = {lib = 'dead', anim = 'dead_b'}},
	{label = 'dead_c', type = 'animloop', data = {lib = 'dead', anim = 'dead_c'}},
	{label = 'dead_d', type = 'animloop', data = {lib = 'dead', anim = 'dead_d'}},
	{label = 'dead_e', type = 'animloop', data = {lib = 'dead', anim = 'dead_e'}},
	{label = 'dead_f', type = 'animloop', data = {lib = 'dead', anim = 'dead_f'}},
	{label = 'dead_g', type = 'animloop', data = {lib = 'dead', anim = 'dead_g'}},
	{label = 'dead_h', type = 'animloop', data = {lib = 'dead', anim = 'dead_h'}},
	{label = 'dead_c', type = 'animloop', data = {lib = 'missfbi5ig_12', anim = 'dead_c'}},
	{label = 'trevor_dead_idle_pt', type = 'animloop', data = {lib = 'missfinale_a_ig_2', anim = 'trevor_dead_idle_pt'}},
	{label = 'crew_dead_crew2', type = 'animloop', data = {lib = 'missheist_agency3amcs_4b', anim = 'crew_dead_crew2'}},
	{label = 'dead_idle', type = 'animloop', data = {lib = 'misslamar1dead_body', anim = 'dead_idle'}},
	{label = 'lying_dead_brad', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_brad'}},
	{label = 'dead_black_ops', type = 'animloop', data = {lib = 'misssolomon_5@end', anim = 'dead_black_ops'}},
	{label = 'dead_ped', type = 'animloop', data = {lib = 'random@crash_rescue@dead_ped', anim = 'dead_ped'}},
	
}
local DeadanimGroupCheck = { -- with swim list
	{label = 'lying_dead_player0a', type = 'animloop', data = {lib = 'missfinale_c1@', anim = 'lying_dead_player0'}},
	{label = 'lying_dead_player0b', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_player0'}},				
	{label = 'lying_idle_crew2', type = 'animloop', data = {lib = 'missheist_agency3amcs_4b', anim = 'lying_idle_crew2'}},
	{label = 'lying_dead_brad', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_brad'}},
	{label = 'dead_a', type = 'animloop', data = {lib = 'dead', anim = 'dead_a'}},
	{label = 'dead_b', type = 'animloop', data = {lib = 'dead', anim = 'dead_b'}},
	{label = 'dead_c', type = 'animloop', data = {lib = 'dead', anim = 'dead_c'}},
	{label = 'dead_d', type = 'animloop', data = {lib = 'dead', anim = 'dead_d'}},
	{label = 'dead_e', type = 'animloop', data = {lib = 'dead', anim = 'dead_e'}},
	{label = 'dead_f', type = 'animloop', data = {lib = 'dead', anim = 'dead_f'}},
	{label = 'dead_g', type = 'animloop', data = {lib = 'dead', anim = 'dead_g'}},
	{label = 'dead_h', type = 'animloop', data = {lib = 'dead', anim = 'dead_h'}},
	{label = 'dead_c', type = 'animloop', data = {lib = 'missfbi5ig_12', anim = 'dead_c'}},
	{label = 'trevor_dead_idle_pt', type = 'animloop', data = {lib = 'missfinale_a_ig_2', anim = 'trevor_dead_idle_pt'}},
	{label = 'crew_dead_crew2', type = 'animloop', data = {lib = 'missheist_agency3amcs_4b', anim = 'crew_dead_crew2'}},
	{label = 'dead_idle', type = 'animloop', data = {lib = 'misslamar1dead_body', anim = 'dead_idle'}},
	{label = 'lying_dead_brad', type = 'animloop', data = {lib = 'missprologueig_6', anim = 'lying_dead_brad'}},
	{label = 'dead_black_ops', type = 'animloop', data = {lib = 'misssolomon_5@end', anim = 'dead_black_ops'}},
	{label = 'dead_ped', type = 'animloop', data = {lib = 'random@crash_rescue@dead_ped', anim = 'dead_ped'}},
	{label = 'idle', type = 'animloop', data = {lib = 'swimming@base', anim = 'idle'}},
}
RegisterNetEvent('esx_ambulancejob:DeadAnimation')
AddEventHandler('esx_ambulancejob:DeadAnimation', function()	
	
	local rand = math.random(1, #DeadanimGroup)
	if not HasAnimDictLoaded(DeadanimGroup[rand].data.lib) then
		RequestAnimDict(DeadanimGroup[rand].data.lib)
	end
	--print(DeadanimGroup[rand].label)
	TaskPlayAnim(GetPlayerPed(-1), DeadanimGroup[rand].data.lib, DeadanimGroup[rand].data.anim, 8.0, -8.0, -1, 9, 0, false, false, false)		
end)

RegisterNetEvent('esx_ambulancejob:DeadAnimationSwim')
AddEventHandler('esx_ambulancejob:DeadAnimationSwim', function()	
	
	if not HasAnimDictLoaded('swimming@base') then
		RequestAnimDict('swimming@base')
	end
	--print(DeadanimGroup[rand].label)
	TaskPlayAnim(GetPlayerPed(-1), 'swimming@base', 'idle', 8.0, -8.0, -1, 9, 0, false, false, false)		
end)
  
  Citizen.CreateThread(function()
	  while ESX == nil do
		  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		  Citizen.Wait(0)
	  end
  
	  while ESX.GetPlayerData().job == nil do
		  Citizen.Wait(100)
	  end
  
	  PlayerLoaded = true
	  ESX.PlayerData = ESX.GetPlayerData()
  end)
  
  RegisterNetEvent('esx:playerLoaded')
  AddEventHandler('esx:playerLoaded', function(xPlayer)
	  ESX.PlayerData = xPlayer
	  PlayerLoaded = true
  end)
  
  RegisterNetEvent('esx:setJob')
  AddEventHandler('esx:setJob', function(job)
	  ESX.PlayerData.job = job
  end)
  
  AddEventHandler('esx:onPlayerSpawn', function()
	  isDead = false
  
	  if firstSpawn then
		  firstSpawn = false
  
		  if Config.AntiCombatLog then
			  while not PlayerLoaded do
				  Citizen.Wait(1000)
			  end
  
			  ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(shouldDie)
				  if shouldDie then
					  ESX.ShowNotification(_U('combatlog_message'))
					  RemoveItemsAfterRPDeath()
				  end
			  end)
		  end
	  end
  end)
  
  -- Create blips
  Citizen.CreateThread(function()
	  for k,v in pairs(Config.Hospitals) do
		  local blip = AddBlipForCoord(v.Blip.coords)
  
		  SetBlipSprite(blip, v.Blip.sprite)
		  SetBlipScale(blip, v.Blip.scale)
		  SetBlipColour(blip, v.Blip.color)
		  SetBlipAsShortRange(blip, true)
  
		  BeginTextCommandSetBlipName('STRING')
		  AddTextComponentSubstringPlayerName(_U('blip_hospital'))
		  EndTextCommandSetBlipName(blip)
	  end
  end)
  
  -- Disable most inputs when dead
  Citizen.CreateThread(function()
	  while true do
		  Citizen.Wait(0)
  
		  if isDead then
			  DisableAllControlActions(0)
			  EnableControlAction(0, 47, true)
			  EnableControlAction(0, 57, true)
			  EnableControlAction(0, 245, true)
			  EnableControlAction(0, 38, true)
		  else
			  Citizen.Wait(500)
		  end
	  end
  end)
  
function OnPlayerDeath()
	local sec = 1000
	isDead = true
	ESX.UI.Menu.CloseAll()
	TriggerServerEvent('esx_ambulancejob:setDeathStatus', true)
  
	StartDeathTimer()
	--StartDistressSignal()
  
	--StartScreenEffect('DeathFailOut', 0, false)
	StartScreenEffect('SwitchSceneNeutral', 0, false)
	Citizen.Wait(10)
	print(123)
	local coords = GetEntityCoords(GetPlayerPed(-1))
	NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, 0, true, false)
	ClearPedBloodDamage(GetPlayerPed(-1))
	SetEntityHealth(GetPlayerPed(-1), 200)
	SetPlayerInvincible(GetPlayerPed(-1), true)
	SetPedDiesInWater(GetPlayerPed(-1), false)	
	if IsEntityInWater(GetPlayerPed(-1)) then
		TriggerEvent('esx_ambulancejob:DeadAnimationSwim')	
	else
		TriggerEvent('esx_ambulancejob:DeadAnimation')	
	end
  end
  
  RegisterNetEvent('esx_ambulancejob:useItem')
  AddEventHandler('esx_ambulancejob:useItem', function(itemName)
	  ESX.UI.Menu.CloseAll()
  
	  if itemName == 'medikit' then
		  local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		  local playerPed = PlayerPedId()
  
		  ESX.Streaming.RequestAnimDict(lib, function()
			  TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
  
			  Citizen.Wait(500)
			  while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				  Citizen.Wait(0)
				  DisableAllControlActions(0)
			  end
  
			  TriggerEvent('esx_ambulancejob:heal', 'big', true)
			  ESX.ShowNotification(_U('used_medikit'))
		  end)
  
	  elseif itemName == 'bandage' then
		  local lib, anim = 'anim@heists@narcotics@funding@gang_idle', 'gang_chatting_idle01' -- TODO better animations
		  local playerPed = PlayerPedId()
  
		  ESX.Streaming.RequestAnimDict(lib, function()
			  TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0, false, false, false)
  
			  Citizen.Wait(500)
			  while IsEntityPlayingAnim(playerPed, lib, anim, 3) do
				  Citizen.Wait(0)
				  DisableAllControlActions(0)
			  end
  
			  TriggerEvent('esx_ambulancejob:heal', 'small', true)
			  ESX.ShowNotification(_U('used_bandage'))
		  end)
	  end
  end)
  
  function StartDistressSignal()
	  Citizen.CreateThread(function()
		  local timer = Config.BleedoutTimer
  
		  while timer > 0 and isDead do
			  Citizen.Wait(0)
			  timer = timer - 30
  
			  SetTextFont(1)
			  SetTextScale(0.45, 0.45)
			  SetTextColour(185, 185, 185, 255)
			  SetTextDropshadow(0, 0, 0, 0, 255)
			  SetTextDropShadow()
			  SetTextOutline()
			  BeginTextCommandDisplayText('STRING')
			  AddTextComponentSubstringPlayerName(_U('distress_send'))
			  EndTextCommandDisplayText(0.175, 0.805)
  
			  if IsControlJustReleased(0, 47) then
				  SendDistressSignal()
				  break
			  end
		  end
	  end)
  end
  
  function SendDistressSignal()
	  local playerPed = PlayerPedId()
	  local coords = GetEntityCoords(playerPed)
  
	  ESX.ShowNotification(_U('distress_sent'))
	  TriggerServerEvent('esx_ambulancejob:onPlayerDistress')
  end
  
  function DrawGenericTextThisFrame()
	  SetTextFont(1)
	  SetTextScale(0.0, 0.5)
	  SetTextColour(255, 255, 255, 255)
	  SetTextDropshadow(0, 0, 0, 0, 255)
	  SetTextDropShadow()
	  SetTextOutline()
	  SetTextCentre(true)
  end
  
  function secondsToClock(seconds)
	  local seconds, hours, mins, secs = tonumber(seconds), 0, 0, 0
  
	  if seconds <= 0 then
		  return 0, 0
	  else
		  local hours = string.format('%02.f', math.floor(seconds / 3600))
		  local mins = string.format('%02.f', math.floor(seconds / 60 - (hours * 60)))
		  local secs = string.format('%02.f', math.floor(seconds - hours * 3600 - mins * 60))
  
		  return mins, secs
	  end
  end
  
  function StartDeathTimer()
	  local canPayFine = false
  
	  if Config.EarlyRespawnFine then
		  ESX.TriggerServerCallback('esx_ambulancejob:checkBalance', function(canPay)
			  canPayFine = canPay
		  end)
	  end
  
	  local earlySpawnTimer = ESX.Math.Round(Config.EarlyRespawnTimer / 1000)
	  local bleedoutTimer = ESX.Math.Round(Config.BleedoutTimer / 1000)
  
	  Citizen.CreateThread(function()
		  -- early respawn timer
		  while earlySpawnTimer > 0 and isDead do
			  Citizen.Wait(1000)
  
			  if earlySpawnTimer > 0 then
				  earlySpawnTimer = earlySpawnTimer - 1
			  end
		  end
  
		  -- bleedout timer
		  while bleedoutTimer > 0 and isDead do
			  Citizen.Wait(1000)
  
			  if bleedoutTimer > 0 then
				  bleedoutTimer = bleedoutTimer - 1
			  end
		  end
	  end)
  
	  Citizen.CreateThread(function()
		  local text, timeHeld
  
		  -- early respawn timer
		  while earlySpawnTimer > 0 and isDead do
			  Citizen.Wait(0)
			  text = _U('respawn_available_in', secondsToClock(earlySpawnTimer))
  
			  DrawGenericTextThisFrame()
  
			  SetTextEntry('STRING')
			  AddTextComponentString(text)
			  DrawText(0.5, 0.8)
		  end
  
		  -- bleedout timer
		  while bleedoutTimer > 0 and isDead do
			  Citizen.Wait(0)
			  text = _U('respawn_bleedout_in', secondsToClock(bleedoutTimer))
  
			  if not Config.EarlyRespawnFine then
				  text = text .. _U('respawn_bleedout_prompt')
  
				  if IsControlPressed(0, 38) and timeHeld > 60 then
					  RemoveItemsAfterRPDeath()
					  break
				  end
			  elseif Config.EarlyRespawnFine and canPayFine then
				  text = text .. _U('respawn_bleedout_fine', ESX.Math.GroupDigits(Config.EarlyRespawnFineAmount))
  
				  if IsControlPressed(0, 38) and timeHeld > 60 then
					  TriggerServerEvent('esx_ambulancejob:payFine')
					  RemoveItemsAfterRPDeath()
					  break
				  end
			  end
  
			  if IsControlPressed(0, 38) then
				  timeHeld = timeHeld + 1
			  else
				  timeHeld = 0
			  end
  
			  DrawGenericTextThisFrame()
  
			  SetTextEntry('STRING')
			  AddTextComponentString(text)
			  DrawText(0.5, 0.8)
		  end
  
		  if bleedoutTimer < 1 and isDead then
			  RemoveItemsAfterRPDeath()
		  end
	  end)
  end
  
  function RemoveItemsAfterRPDeath()
	  TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
  
	  Citizen.CreateThread(function()
		  DoScreenFadeOut(800)
  
		  while not IsScreenFadedOut() do
			  Citizen.Wait(10)
		  end
  
		  ESX.TriggerServerCallback('esx_ambulancejob:removeItemsAfterRPDeath', function()
			  local formattedCoords = {
				  x = Config.RespawnPoint.coords.x,
				  y = Config.RespawnPoint.coords.y,
				  z = Config.RespawnPoint.coords.z
			  }
  
			  ESX.SetPlayerData('loadout', {})
			  RespawnPed(PlayerPedId(), formattedCoords, Config.RespawnPoint.heading)
			  
			  StopScreenEffect('SwitchSceneNeutral')
			  --StopScreenEffect('DeathFailOut')
			  DoScreenFadeIn(800)
		  end)
	  end)
  end
  
  function RespawnPed(ped, coords, heading)
	  SetEntityCoordsNoOffset(ped, coords.x, coords.y, coords.z, false, false, false, true)
	  NetworkResurrectLocalPlayer(coords.x, coords.y, coords.z, heading, true, false)
	  SetPlayerInvincible(ped, false)
	  ClearPedBloodDamage(ped)
  
	  TriggerServerEvent('esx:onPlayerSpawn')
	  TriggerEvent('esx:onPlayerSpawn')
	  TriggerEvent('playerSpawned') -- compatibility with old scripts, will be removed soon
  end
  
  RegisterNetEvent('esx_phone:loaded')
  AddEventHandler('esx_phone:loaded', function(phoneNumber, contacts)
	  local specialContact = {
		  name       = 'Ambulance',
		  number     = 'ambulance',
		  base64Icon = 'data:image/png;base64,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'
	  }
  
	  TriggerEvent('esx_phone:addSpecialContact', specialContact.name, specialContact.number, specialContact.base64Icon)
  end)
  
  AddEventHandler('esx:onPlayerDeath', function(data)
	  OnPlayerDeath()
  end)
  
  RegisterNetEvent('esx_ambulancejob:revive')
  AddEventHandler('esx_ambulancejob:revive', function()
	  local playerPed = PlayerPedId()
	  local coords = GetEntityCoords(playerPed)
	  TriggerServerEvent('esx_ambulancejob:setDeathStatus', false)
  
	  DoScreenFadeOut(800)
  
	  while not IsScreenFadedOut() do
		  Citizen.Wait(50)
	  end
  
	  local formattedCoords = {
		  x = ESX.Math.Round(coords.x, 1),
		  y = ESX.Math.Round(coords.y, 1),
		  z = ESX.Math.Round(coords.z, 1)
	  }
  
	  RespawnPed(playerPed, formattedCoords, 0.0)
	  StopScreenEffect('SwitchSceneNeutral')
	  --StopScreenEffect('DeathFailOut')
	  DoScreenFadeIn(800)
  end)
  
  -- Load unloaded IPLs
  if Config.LoadIpl then
	  RequestIpl('Coroner_Int_on') -- Morgue
  end

function GetDeath()
	return isDead
end

