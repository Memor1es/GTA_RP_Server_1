local empresaEvent = nil
local PlayerData              = {}
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)
RegisterNetEvent("esx_inventoryhud:openEmpresaInventory")
AddEventHandler(
    "esx_inventoryhud:openEmpresaInventory",
    function(data,empresa)
		empresaEvent = empresa
        setEmpresaInventoryData(data)
        openEmpresaInventory()
    end
)

function refreshEmpresaInventory()
	
    ESX.TriggerServerCallback(empresaEvent .. ":getStockItems",function(items)
		ESX.TriggerServerCallback(empresaEvent .. ':getArmoryWeapons', function(weapons)
			--if empresaEvent == "esx_policejob" then
			--	if (PlayerData.job.grade_name == "boss" or PlayerData.job.grade_name == "comandantegoe"  ) then	
			--		setEmpresaInventoryData({items = items,weapons = weapons})
			--	else
			--		setEmpresaInventoryData({items = items,weapons = {}})
			--	end
			--else
				setEmpresaInventoryData({items = items,weapons = weapons})
			--end
		end)
    end)
end

function setEmpresaInventoryData(data)

    items = {}
    local propertyItems = data.items
    local propertyWeapons = data.weapons

    for i = 1, #propertyItems, 1 do
        local item = propertyItems[i]

        if item.count > 0 then
            item.type = "item_standard"
            item.usable = false
            item.rare = false
            item.limit = -1
            item.canRemove = false

            table.insert(items, item)
        end
    end

    for i = 1, #propertyWeapons, 1 do
        local weapon = propertyWeapons[i]

        if propertyWeapons[i].name ~= "WEAPON_UNARMED" then
            if weapon.count > 0 then
				table.insert(
					items,
					{
						label = ESX.GetWeaponLabel(weapon.name),
						count = weapon.count,
						limit = -1,
						type = "item_weapon",
						name = weapon.name,
						usable = false,
						rare = false,
						canRemove = false
					}
				)
			end
        end
    end

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openEmpresaInventory()
    loadPlayerInventory()
    isInInventory = true
    SendNUIMessage(
        {
            action = "display",
            type = "empresa",
			empresaName = empresaEvent
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoEmpresa",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
				--exports['mythic_notify']:DoHudText('error', "Desiquipa a Arma antes de a guardar")
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
				ESX.TriggerServerCallback(tostring(data.empresa) .. ":addArmoryWeapon", function()
				end, data.item.name, true)
            end
			if data.item.type == "item_standard" then
				TriggerServerEvent(tostring(data.empresa) .. ":putStockItems", data.item.name, count)
			end
        end

        Wait(150)
        refreshEmpresaInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromEmpresa",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
			if data.item.type == "item_weapon" then
				 ESX.TriggerServerCallback(tostring(data.empresa) .. ":removeArmoryWeapon", function()
				 end, data.item.name)
			else
            TriggerServerEvent(tostring(data.empresa) .. ":getStockItem", data.item.name, tonumber(data.number))
			end
        end

        Wait(150)
        refreshEmpresaInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
