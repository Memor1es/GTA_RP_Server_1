local houseOwner = nil

RegisterNetEvent("esx_inventoryhud:openMotelInventory")
AddEventHandler(
    "esx_inventoryhud:openMotelInventory",
    function(data,owner)
		houseOwner = owner
        setMotelInventoryData(data)
        openMotelInventory()
    end
)

function refreshMotelInventory()
    ESX.TriggerServerCallback(
        "esx_motel:getMotelInventory",
        function(inventory)
            setMotelInventoryData(inventory)
        end,
        houseOwner
    )
end

function setMotelInventoryData(data)
    items = {}

    local blackMoney = data.blackMoney
    local propertyItems = data.items
    local propertyWeapons = data.weapons

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            limit = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

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
            table.insert(
                items,
                {
                    label = ESX.GetWeaponLabel(weapon.name),
                    count = 250,
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

    SendNUIMessage(
        {
            action = "setSecondInventoryItems",
            itemList = items
        }
    )
end

function openMotelInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "motel",
			owner = houseOwner
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoMotel",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                --count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
                count = 250
            end

            TriggerServerEvent("esx_motel:putItem", data.owner, data.item.type, data.item.name, count)
        end

        Wait(150)
        refreshMotelInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromMotel",
    function(data, cb)
		
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end
		--exports['mythic_notify']:DoHudText('error', data.item.type .. " " .. data.item.name)
        if type(data.number) == "number" and math.floor(data.number) == data.number then
            TriggerServerEvent("esx_motel:getItem", data.owner, data.item.type, data.item.name, tonumber(data.number))
        end

        Wait(150)
        refreshMotelInventory()
        Wait(150)
        loadPlayerInventory()

        cb("ok")
    end
)
