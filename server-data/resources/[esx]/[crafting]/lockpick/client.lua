ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	ESX.PlayerData = ESX.GetPlayerData()
end)


RegisterCommand("entrarcasa", function()
    TriggerServerEvent("lockpick:openhtml")
end)

RegisterCommand("helpnui", function(source, args, rawCommand)
	SetNuiFocus( false, false )
	SendNUIMessage({
		showPlayerMenu = false
	})

end)


RegisterNetEvent('lockpick:openlockpick')
AddEventHandler('lockpick:openlockpick', function()
	SetNuiFocus( true, true )
	SendNUIMessage({
		showPlayerMenu = true
	})

end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer

	item = false

	for i=1, #PlayerData.inventory, 1 do
		if PlayerData.inventory[i].name == 'lockpick' then
			if PlayerData.inventory[i].count > 0 then
				item = true
			end
		end
	end

end)

RegisterNetEvent('lockpick:addcalc')
AddEventHandler('lockpick:addcalc', function()
	item = true
end)

RegisterNetEvent('lockpick:removecalc')
AddEventHandler('lockpick:removecalc', function()
	item = false
end)

-- NUI that get triggered on success
RegisterNUICallback('win', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		showPlayerMenu = false
	})
    ClearPedTasks(GetPlayerPed(-1))
	FreezeEntityPosition(GetPlayerPed(-1),false)
	TriggerEvent('lockpick:MinigameComplete')
    --TriggerServerEvent('lockpick:MinigameComplete')
    --TriggerServerEvent("rs_crafting:CraftingSuccess", CurrentCraft)
end)

-- NUI that get triggered on fail
RegisterNUICallback('lose', function()
	SetNuiFocus(false, false)
	SendNUIMessage({
		showPlayerMenu = false
	})
    ClearPedTasks(GetPlayerPed(-1))
	FreezeEntityPosition(GetPlayerPed(-1),false)
	TriggerEvent('lockpick:MinigameLose')
    --TriggerServerEvent("rs_crafting:CraftingFailed", CurrentCraft)
end)

RegisterNetEvent('lockpick:MinigameComplete')
AddEventHandler('lockpick:MinigameComplete', function()
	-- event of the complete
	TriggerEvent('esx_policejob:unrestrain')
	TriggerEvent('notification', '感覺到手藝上升了一點...', 2)
    TriggerEvent("esx_status:add",'agi',1)
end)

RegisterNetEvent('lockpick:MinigameLose')
AddEventHandler('lockpick:MinigameLose', function()
	-- event of the lose
	--ESX.ShowNotification('~r~解鎖失敗')
	exports['mythic_notify']:SendAlert('error', '解鎖失敗', 5000)
end)