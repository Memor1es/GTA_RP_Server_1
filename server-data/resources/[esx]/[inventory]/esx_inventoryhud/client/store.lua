local trunkData = nil

RegisterNetEvent("esx_inventoryhud:openStoreInventory")
AddEventHandler(
    "esx_inventoryhud:openStoreInventory",
    function(data, blackMoney, cashMoney, inventory, weapons)
        setTrunkInventoryData(data, blackMoney, cashMoney, inventory, weapons)
        openTrunkInventory()
    end
)

RegisterNetEvent("esx_inventoryhud:refreshStoreInventory")
AddEventHandler(
    "esx_inventoryhud:refreshStoreInventory",
    function(data, blackMoney, cashMoney, inventory, weapons)
        setTrunkInventoryData(data, blackMoney, cashMoney, inventory, weapons)
    end
)

function setTrunkInventoryData(data, blackMoney, cashMoney, inventory, weapons)
    trunkData = data

    SendNUIMessage(
        {
            action = "setInfoText",
            text = data.text
        }
    )

    items = {}

    if blackMoney > 0 then
        accountData = {
            label = _U("black_money"),
            count = blackMoney,
            type = "item_account",
            name = "black_money",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end
    
    if cashMoney > 0 then
        accountData = {
            label = _U("cash"),
            count = cashMoney,
            type = "item_money",
            name = "cash",
            usable = false,
            rare = false,
            weight = -1,
            canRemove = false
        }
        table.insert(items, accountData)
    end

    if inventory ~= nil then
        for key, value in pairs(inventory) do
            if inventory[key].count <= 0 then
                inventory[key] = nil
            else
                inventory[key].type = "item_standard"
                inventory[key].usable = false
                inventory[key].rare = false
                inventory[key].weight = -1
                inventory[key].canRemove = false
                table.insert(items, inventory[key])
            end
        end
    end

    if Config.IncludeWeapons and weapons ~= nil then
        for key, value in pairs(weapons) do
            local weaponHash = GetHashKey(weapons[key].name)
            if weapons[key].name ~= "WEAPON_UNARMED" then
                table.insert(
                    items,
                    {
                        label = weapons[key].label,
                        count = weapons[key].ammo,
                        weight = -1,
                        type = "item_weapon",
                        name = weapons[key].name,
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

function openStoreInventory()
    loadPlayerInventory()
    isInInventory = true

    SendNUIMessage(
        {
            action = "display",
            type = "store"
        }
    )

    SetNuiFocus(true, true)
end

RegisterNUICallback(
    "PutIntoStore",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            local count = tonumber(data.number)

            if data.item.type == "item_weapon" then
                count = GetAmmoInPedWeapon(PlayerPedId(), GetHashKey(data.item.name))
            end

            --TriggerServerEvent("esx_trunk:putItem", trunkData.plate, data.item.type, data.item.name, count, trunkData.max, trunkData.myVeh, data.item.label)
            TriggerServerEvent('esx_store:putItem', owner, data.current.type, data.current.value, tonumber(data2.value))
        end

        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)

RegisterNUICallback(
    "TakeFromStore",
    function(data, cb)
        if IsPedSittingInAnyVehicle(playerPed) then
            return
        end

        if type(data.number) == "number" and math.floor(data.number) == data.number then
            --TriggerServerEvent("esx_trunk:getItem", trunkData.plate, data.item.type, data.item.name, tonumber(data.number), trunkData.max, trunkData.myVeh)
            TriggerServerEvent('esx_store:getItem', owner, data.current.type, data.current.value, quantity)
        end

        Wait(250)
        loadPlayerInventory()

        cb("ok")
    end
)
