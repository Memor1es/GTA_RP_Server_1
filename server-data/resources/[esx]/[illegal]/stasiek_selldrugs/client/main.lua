ESX = nil
local selling = false
local secondsRemaining
local sold = false
local playerHasDrugs = false
local pedIsTryingToSellDrugs = false
local PlayerData		= {}
local playerHasNormalDrugs = false
local playerHasExpensiveDrugs = false
local player_is_in_normal = false
local player_is_in_expensive = false
local now_city = nil

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

--TIME TO SELL
Citizen.CreateThread(function()
	while true do
		if selling then
			--[[if secondsRemaining > 0 then
				secondsRemaining = secondsRemaining - 1
				ESX.ShowNotification(_U('remained') .. secondsRemaining .. 's')
			end--]]
			TriggerEvent("mythic_progressbar:client:progress", {
                name = "selling_drugs",
                duration = secondsRemaining * 1000,
                label = "保持靜止，嘗試販賣物品",
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
					secondsRemaining = 0
					--print("販毒成功")
                end
            end)
			Citizen.Wait(1000)
		end
		Citizen.Wait(100)
	end
end)

currentped = nil
Citizen.CreateThread(function()
	local sleep = 5*1000
	local is_in = false
	while true do
		Wait(sleep)
		local player = GetPlayerPed(-1)
		local pid = PlayerPedId()
  		local playerloc = GetEntityCoords(player, 0)
		local handle, ped = FindFirstPed()
		local success
		repeat
			if now_city ~= nil then
				success, ped = FindNextPed(handle)
				local pos = GetEntityCoords(ped)
				local distance = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
				local distanceFromCity = GetDistanceBetweenCoords(Config.CityPoint[now_city].x, Config.CityPoint[now_city].y, Config.CityPoint[now_city].z, playerloc['x'], playerloc['y'], playerloc['z'], false)
				is_in = true
				--[[print("x")
				print(Config.CityPoint.x)
				print(playerloc['x'])
				print("y")
				print(Config.CityPoint.y)
				print(playerloc['y'])
				print("z")
				print(Config.CityPoint.z)
				print(playerloc['z'])
				print(distanceFromCity)--]]
				if IsPedInAnyVehicle(GetPlayerPed(-1)) == false then
					if DoesEntityExist(ped)then
						if IsPedDeadOrDying(ped) == false then
							if IsPedInAnyVehicle(ped) == false then
								local pedType = GetPedType(ped)
								if pedType ~= 28 and IsPedAPlayer(ped) == false then
									currentped = pos
									if distance <= 3 and ped  ~= GetPlayerPed(-1) and ped ~= oldped and IsControlJustPressed(1, 38) then
										--TriggerServerEvent('check')
										TriggerServerEvent('CheckNormal')
										TriggerServerEvent('CheckExpensive')
										--print(k)
										--print("x: " .. Config.CityPoint[now_city].x .. "y: " .. Config.CityPoint[now_city].y .. "z: " ..Config.CityPoint[now_city].z)
										--local result
										--result = playerHasDrugs and 1 or 0
										--print("playerHasDrugs: " ..result)
										--result = sold and 1 or 0
										--print("sold: " ..result)
										--result = selling and 1 or 0
										--print("selling: " ..result)
										if distanceFromCity < Config.DistanceFromCity and playerHasNormalDrugs==true and ( now_city=="black" or now_city=="michael" ) then
											TriggerServerEvent('check')
											if playerHasDrugs and sold == false and selling == false then 
												--PED REJECT OFFER
												local random = math.random(1, Config.PedRejectPercent)
												if random == Config.PedRejectPercent then
													ESX.ShowNotification(_U('reject'))
													oldped = ped
													--PED CALLING COPS
													if Config.CallCops then
														local randomReport = math.random(1, Config.CallCopsPercent)
														print(Config.CallCopsPercent)
														if randomReport == Config.CallCopsPercent then
															TriggerServerEvent('drugsNotify')
														end
													end
													TriggerEvent("sold")
												--PED ACCEPT OFFER
												else
													player_is_in_normal = true
													SetEntityAsMissionEntity(ped)
													ClearPedTasks(ped)

													SetBlockingOfNonTemporaryEvents(ped, true)
													SetPedDiesWhenInjured(ped, false)
													SetPedCanPlayAmbientAnims(ped, true)
													SetPedCanRagdollFromPlayerImpact(ped, false)
													SetEntityInvincible(ped, true)
													FreezeEntityPosition(ped, true)
													FreezeEntityPosition(ped,true)
													TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

													oldped = ped										
													--TaskStandStill(ped, 9)
													pos1 = GetEntityCoords(ped)
													TriggerEvent("sellingdrugs")
												end
											end
										elseif distanceFromCity < Config.DistanceFromCity and playerHasExpensiveDrugs==true and ( now_city=="sea" or now_city=="center" ) then
											TriggerServerEvent('check')
											if playerHasDrugs and sold == false and selling == false then 
												--PED REJECT OFFER
												local random = math.random(1, Config.PedRejectPercent)
												if random == Config.PedRejectPercent then
													ESX.ShowNotification(_U('reject'))
													oldped = ped
													--PED CALLING COPS
													if Config.CallCops then
														local randomReport = math.random(1, Config.CallCopsPercent)
														print(Config.CallCopsPercent)
														if randomReport == Config.CallCopsPercent then
															TriggerServerEvent('drugsNotify')
														end
													end
													TriggerEvent("sold")
												--PED ACCEPT OFFER
												else
													player_is_in_expensive = true
													SetEntityAsMissionEntity(ped)
													ClearPedTasks(ped)

													SetBlockingOfNonTemporaryEvents(ped, true)
													SetPedDiesWhenInjured(ped, false)
													SetPedCanPlayAmbientAnims(ped, true)
													SetPedCanRagdollFromPlayerImpact(ped, false)
													SetEntityInvincible(ped, true)
													FreezeEntityPosition(ped, true)
													FreezeEntityPosition(ped,true)
													TaskStartScenarioInPlace(ped, "WORLD_HUMAN_SMOKING", 0, true);

													oldped = ped										
													--TaskStandStill(ped, 9)
													pos1 = GetEntityCoords(ped)
													TriggerEvent("sellingdrugs")
												end
											end
										else
											--ESX.ShowNotification(_U('too_far_away_from_city'))
										end
									end
								end
							end
						end
					end
				end
			end
		until not success

		EndFindPed(handle)
		if is_in then
			sleep = 10
			is_in = false
		else
			sleep = 5*1000
		end
	end	
end)

--check location

Citizen.CreateThread(function()
	local sleep = 5*1000
	while true do
		Wait(sleep)
		local player = GetPlayerPed(-1)
		local playerloc = GetEntityCoords(player, 0)
		local is_in = false  
		for k,v in pairs(Config.CityPoint) do
			local distanceFromCity = GetDistanceBetweenCoords(v.x, v.y, v.z, playerloc['x'], playerloc['y'], playerloc['z'], false)
			if distanceFromCity < Config.DistanceFromCity then
				now_city = k
				is_in = true
			end
		end
		if is_in == false then
			now_city = nil
			sleep = 5*1000
		else
			sleep = 100
		end
	end
end)


Citizen.CreateThread(function()
	while true do
		Wait(100)
		if selling then
			local player = GetPlayerPed(-1)
  			local playerloc = GetEntityCoords(player, 0)
			local distance = GetDistanceBetweenCoords(pos1.x, pos1.y, pos1.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
			local pid = PlayerPedId()
			--TOO FAR
			if distance > 5 then
				ESX.ShowNotification(_U('too_far_away'))
				selling = false
				SetEntityAsMissionEntity(oldped)
				SetPedAsNoLongerNeeded(oldped)
				FreezeEntityPosition(oldped,false)
			end
			--SUCCESS
			if secondsRemaining <= 1 then
				selling = false
				SetEntityAsMissionEntity(oldped)
				SetPedAsNoLongerNeeded(oldped)
				FreezeEntityPosition(oldped,false)
				StopAnimTask(pid, "amb@prop_human_bum_bin@idle_b","idle_d", 1.0)
				playerHasDrugs = false
				playerHasNormalDrugs = false
				playerHasExpensiveDrugs = false
				sold = false
				if player_is_in_normal then
					TriggerServerEvent('sellNormalDrugs')
				elseif player_is_in_expensive then
					TriggerServerEvent('sellExpensiveDrugs')
				end
				--TriggerServerEvent('sellDrugs')
				player_is_in_expensive = false
				player_is_in_normal =false
			end	
			
			if secondsRemaining == 5 and Config.PlayAnimation then
				Citizen.Wait(1100) 
				RequestAnimDict("amb@prop_human_bum_bin@idle_b")
				while (not HasAnimDictLoaded("amb@prop_human_bum_bin@idle_b")) do 
					Citizen.Wait(0) 
				end
				TaskPlayAnim(pid,"amb@prop_human_bum_bin@idle_b","idle_d",100.0, 200.0, 0.3, 120, 0.2, 0, 0, 0)
			end
		end	
	end
end)	
		
RegisterNetEvent('sellingdrugs')
AddEventHandler('sellingdrugs', function()
	secondsRemaining = Config.TimeToSell + 1
	selling = true
end)

RegisterNetEvent('sold')
AddEventHandler('sold', function()
	sold = false
	selling = false
	secondsRemaining = 0
end)

--Info that you dont have drugs
RegisterNetEvent('nomoredrugs')
AddEventHandler('nomoredrugs', function()
	ESX.ShowNotification(_U('no_more_drugs'))
	playerHasDrugs = false
	sold = false
	selling = false
	secondsRemaining = 0
end)

--Show help notification ("PRESS E...")
RegisterNetEvent('playerhasdrugs')
AddEventHandler('playerhasdrugs', function()
	ESX.ShowHelpNotification(_U('input'))
	playerHasDrugs = true
end)

RegisterNetEvent('playerhasnormaldrugs')
AddEventHandler('playerhasnormaldrugs', function()
	ESX.ShowNotification("擁有一般毒品")
	--playerHasDrugs = true
	playerHasNormalDrugs = true
end)

RegisterNetEvent('playerhasexpensivedrugs')
AddEventHandler('playerhasexpensivedrugs', function()
	ESX.ShowNotification("擁有高級貨品")
	--playerHasDrugs = true
	playerHasExpensiveDrugs = true
end)

--DISPATCH BEGIN (better do not touch)
--Only if Config.CallCops = true
GetPlayerName()
RegisterNetEvent('outlawNotify')
AddEventHandler('outlawNotify', function(alert)
		if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
            Notify(alert)
        end
end)

function Notify(text)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(text.."\n\n")
    DrawNotification(false, false)
end


--Config
local timer = 1 --in minutes - Set the time during the player is outlaw
local showOutlaw = true --Set if show outlaw act on map
local blipTime = 25 --in second
local showcopsmisbehave = true --show notification when cops steal too
--End config

local timing = timer * 60000 --Don't touche it

Citizen.CreateThread(function()
    while true do
        Wait(500)
        if NetworkIsSessionStarted() then
            DecorRegister("IsOutlaw",  3)
            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 1)
            return
        end
    end
end)

Citizen.CreateThread( function()
    while true do
        Wait(100)
        
		if pedIsTryingToSellDrugs then
			local plyPos = GetEntityCoords(GetPlayerPed(-1),  true)
			local s1, s2 = Citizen.InvokeNative( 0x2EB41072B4C1E4C0, plyPos.x, plyPos.y, plyPos.z, Citizen.PointerValueInt(), Citizen.PointerValueInt() )
			local street1 = GetStreetNameFromHashKey(s1)
			local street2 = GetStreetNameFromHashKey(s2)


            DecorSetInt(GetPlayerPed(-1), "IsOutlaw", 2)
			if PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave == false then
			elseif PlayerData.job ~= nil and PlayerData.job.name == 'police' and showcopsmisbehave then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "男" --male/change it to your language
					else
						sex = "女" --female/change it to your language
					end
					TriggerServerEvent('drugsInProgressPos', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('drugsInProgressS1', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('drugsInProgress', street1, street2, sex)
					end
				end)
				Wait(3000)
				pedIsTryingToSellDrugs = false
			else
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
					local sex = nil
					if skin.sex == 0 then
						sex = "male"
					else
						sex = "female"
					end
					TriggerServerEvent('drugsInProgressPos', plyPos.x, plyPos.y, plyPos.z)
					if s2 == 0 then
						TriggerServerEvent('drugsInProgressS1', street1, sex)
					elseif s2 ~= 0 then
						TriggerServerEvent('drugsInProgress', street1, street2, sex)
					end
				end)
				Wait(3000)
				pedIsTryingToSellDrugs = false
			end
        end
    end
end)

RegisterNetEvent('drugsPlace')
AddEventHandler('drugsPlace', function(tx, ty, tz)
	if PlayerData.job.name == 'police' then
		local transT = 250
		local Blip = AddBlipForCoord(tx, ty, tz)
		SetBlipSprite(Blip,  10)
		SetBlipColour(Blip,  1)
		SetBlipAlpha(Blip,  transT)
		SetBlipAsShortRange(Blip,  false)
		while transT ~= 0 do
			Wait(blipTime * 4)
			transT = transT - 1
			SetBlipAlpha(Blip,  transT)
			if transT == 0 then
				SetBlipSprite(Blip,  2)
				return
			end
		end
	end
end)


RegisterNetEvent('drugsEnable')
AddEventHandler('drugsEnable', function()
	pedIsTryingToSellDrugs = true
end)
--DISPATCH END
