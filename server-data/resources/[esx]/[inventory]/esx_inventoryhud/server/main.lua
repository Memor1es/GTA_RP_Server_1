ESX = nil
ServerItems = {}
itemShopList = {}

TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end)

ESX.RegisterServerCallback("esx_inventoryhud:getPlayerInventory", function(source, cb, target)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if targetXPlayer ~= nil then
			cb({inventory = targetXPlayer.inventory, money = targetXPlayer.getMoney(), accounts = targetXPlayer.accounts, weapons = targetXPlayer.loadout})
		else
			cb(nil)
		end
	end
)


RegisterServerEvent("esx_inventoryhud:tradePlayerItem")
AddEventHandler("esx_inventoryhud:tradePlayerItem", function(from, target, type, itemName, itemCount)
		local _source = from

		local sourceXPlayer = ESX.GetPlayerFromId(_source)
		local targetXPlayer = ESX.GetPlayerFromId(target)

		if type == "item_standard" then
			local sourceItem = sourceXPlayer.getInventoryItem(itemName)
			local targetItem = targetXPlayer.getInventoryItem(itemName)

			if itemCount > 0 and sourceItem.count >= itemCount then
				if targetItem.limit ~= -1 and (targetItem.count + itemCount) > targetItem.limit then
				--if targetXPlayer.canCarryItem(itemName, itemCount) then
				else
					sourceXPlayer.removeInventoryItem(itemName, itemCount)
					targetXPlayer.addInventoryItem(itemName, itemCount)
				end
			end
		elseif type == "item_money" then
			if itemCount > 0 and sourceXPlayer.getMoney() >= itemCount then
				sourceXPlayer.removeMoney(itemCount)
				targetXPlayer.addMoney(itemCount)
			end
		elseif type == "item_account" then
			if itemCount > 0 and sourceXPlayer.getAccount(itemName).money >= itemCount then
				sourceXPlayer.removeAccountMoney(itemName, itemCount)
				targetXPlayer.addAccountMoney(itemName, itemCount)
			end
		elseif type == "item_weapon" then
			if not targetXPlayer.hasWeapon(itemName) then
				sourceXPlayer.removeWeapon(itemName)
				targetXPlayer.addWeapon(itemName, itemCount)
			end
		end
	end
)

function getInventoryCount(pPlayer)
	local count = 0
	local itemWeight = 0
		
	for i=1, #pPlayer.inventory, 1 do
		if pPlayer.inventory[i] ~= nil and pPlayer.inventory[i].count > 0 then
			count = count + 1
		end
	end
  
	for i=1, #pPlayer.loadout, 1 do
		if pPlayer.loadout[i] ~= nil then
			count = count + 1
		end
	end
	
	return count
end

RegisterServerEvent('esx:onAddInventoryItem')
AddEventHandler('esx:onAddInventoryItem', function(source, item, count)
  local source_ = source
  local xPlayer = ESX.GetPlayerFromId(source_)
  local currentInventoryCount = getInventoryCount(xPlayer)
  TriggerEvent('esx_inventoryhud:Update',source_)
  if currentInventoryCount > Config.LimitItems then
	ESX.CreatePickup('item_standard', item.name, count, item.label..'['..count..']', source_)
    TriggerClientEvent('esx:showNotification', source_, '~r~Sem espaço para ~y~' .. count .. '  ~b~ ' .. item.label .. '')
    xPlayer.removeInventoryItem(item.name, count)
    TriggerEvent('esx_inventoryhud:Update',source_)
  end
end)

RegisterCommand("openinventory", function(source, args, rawCommand)
		if IsPlayerAceAllowed(source, "inventory.openinventory") then
			local target = tonumber(args[1])
			local targetXPlayer = ESX.GetPlayerFromId(target)

			if targetXPlayer ~= nil then
				TriggerClientEvent("esx_inventoryhud:openPlayerInventory", source, target, targetXPlayer.name)
			else
				TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("no_player") })
				TriggerClientEvent("chatMessage", source, "^1" .. _U("no_player"))
			end
		else
			TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = _U("no_permissions") })
			TriggerClientEvent("chatMessage", source, "^1" .. _U("no_permissions"))
		end
	end
)

RegisterServerEvent("suku:sendShopItems")
AddEventHandler("suku:sendShopItems", function(source, itemList)
	itemShopList = itemList
end)

--AddEventHandler('onMySQLReady', function()
	--itemShopList = {}
	--local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
	--local itemInformation = {}
--
	--for i=1, #itemResult, 1 do
--
		--if itemInformation[itemResult[i].name] == nil then
			--itemInformation[itemResult[i].name] = {}
		--end
--
		--itemInformation[itemResult[i].name].name = itemResult[i].name
		--itemInformation[itemResult[i].name].label = itemResult[i].label
		--itemInformation[itemResult[i].name].limit = itemResult[i].limit
		--itemInformation[itemResult[i].name].rare = itemResult[i].rare
		--itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
		--itemInformation[itemResult[i].name].price = itemResult[i].price
--
		--for _, v in pairs(Config.Shops.RegularShop.Items) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_standard",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = itemInformation[itemResult[i].name].limit,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "regular"
				--})
			--end
		--end
--
		--for _, v in pairs(Config.Shops.RobsLiquor.Items) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_standard",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = itemInformation[itemResult[i].name].limit,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "robsliquor"
				--})
			--end
		--end
--
		--for _, v in pairs(Config.Shops.YouTool.Items) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_standard",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = itemInformation[itemResult[i].name].limit,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "youtool"
				--})
			--end
		--end
--
		--for _, v in pairs(Config.Shops.PrisonShop.Items) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_standard",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = itemInformation[itemResult[i].name].limit,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "prison"
				--})
			--end
		--end
--
		--local weapons = Config.Shops.WeaponShop.Weapons
		--for _, v in pairs(Config.Shops.WeaponShop.Weapons) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_weapon",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = 1,
					--ammo = v.ammo,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "weaponshop"
				--})
			--end
		--end
--
		--local ammo = Config.Shops.WeaponShop.Ammo
		--for _,v in pairs(Config.Shops.WeaponShop.Ammo) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_ammo",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = 1,
					--weaponhash = v.weaponhash,
					--ammo = v.ammo,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "weaponshop"
				--})
			--end
		--end
--
		--for _, v in pairs(Config.Shops.WeaponShop.Items) do
			--if v.name == itemResult[i].name then
				--table.insert(itemShopList, {
					--type = "item_standard",
					--name = itemInformation[itemResult[i].name].name,
					--label = itemInformation[itemResult[i].name].label,
					--limit = itemInformation[itemResult[i].name].limit,
					--rare = itemInformation[itemResult[i].name].rare,
					--can_remove = itemInformation[itemResult[i].name].can_remove,
					--price = itemInformation[itemResult[i].name].price,
					--count = 99999999,
					--shop = "weaponshop"
				--})
			--end
		--end
	--end
--end)

ESX.RegisterServerCallback("suku:getShopItems", function(source, cb, shoptype)
	itemShopList = {}
	local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
	local itemInformation = {}

	for i=1, #itemResult, 1 do

		if itemInformation[itemResult[i].name] == nil then
			itemInformation[itemResult[i].name] = {}
		end

		itemInformation[itemResult[i].name].name = itemResult[i].name
		itemInformation[itemResult[i].name].label = itemResult[i].label
		itemInformation[itemResult[i].name].limit = itemResult[i].limit
		itemInformation[itemResult[i].name].rare = itemResult[i].rare
		itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
		itemInformation[itemResult[i].name].price = itemResult[i].price

		if shoptype == "regular" then
			for _, v in pairs(Config.Shops.RegularShop.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
		if shoptype == "robsliquor" then
			for _, v in pairs(Config.Shops.RobsLiquor.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
		if shoptype == "youtool" then
			for _, v in pairs(Config.Shops.YouTool.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
		if shoptype == "prison" then
			for _, v in pairs(Config.Shops.PrisonShop.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
		if shoptype == "weaponshop" then
			local weapons = Config.Shops.WeaponShop.Weapons
			for _, v in pairs(Config.Shops.WeaponShop.Weapons) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_weapon",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = 1,
						ammo = v.ammo,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end

			local ammo = Config.Shops.WeaponShop.Ammo
			for _,v in pairs(Config.Shops.WeaponShop.Ammo) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_ammo",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = 1,
						weaponhash = v.weaponhash,
						ammo = v.ammo,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
			
			for _, v in pairs(Config.Shops.WeaponShop.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
	end
	Wait(250)
	cb(itemShopList)
end)

ESX.RegisterServerCallback("suku:getCustomShopItems", function(source, cb, shoptype, customInventory)
	itemShopList = {}
	local itemResult = MySQL.Sync.fetchAll('SELECT * FROM items')
	local itemInformation = {}

	for i=1, #itemResult, 1 do

		if itemInformation[itemResult[i].name] == nil then
			itemInformation[itemResult[i].name] = {}
		end

		itemInformation[itemResult[i].name].name = itemResult[i].name
		itemInformation[itemResult[i].name].label = itemResult[i].label
		itemInformation[itemResult[i].name].limit = itemResult[i].limit
		itemInformation[itemResult[i].name].rare = itemResult[i].rare
		itemInformation[itemResult[i].name].can_remove = itemResult[i].can_remove
		itemInformation[itemResult[i].name].price = itemResult[i].price

		if shoptype == "normal" then
			for _, v in pairs(customInventory.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
		
		if shoptype == "weapon" then
			local weapons = customInventory.Weapons
			for _, v in pairs(customInventory.Weapons) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_weapon",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = 1,
						ammo = v.ammo,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end

			local ammo = customInventory.Ammo
			for _,v in pairs(customInventory.Ammo) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_ammo",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = 1,
						weaponhash = v.weaponhash,
						ammo = v.ammo,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end

			for _, v in pairs(customInventory.Items) do
				if v.name == itemResult[i].name then
					table.insert(itemShopList, {
						type = "item_standard",
						name = itemInformation[itemResult[i].name].name,
						label = itemInformation[itemResult[i].name].label,
						limit = itemInformation[itemResult[i].name].limit,
						rare = itemInformation[itemResult[i].name].rare,
						can_remove = itemInformation[itemResult[i].name].can_remove,
						price = itemInformation[itemResult[i].name].price,
						count = 99999999
					})
				end
			end
		end
	end
	Wait(250)
	cb(itemShopList)
end)

RegisterNetEvent("suku:SellItemToPlayer")
AddEventHandler("suku:SellItemToPlayer",function(source, type, item, count)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if type == "item_standard" then
        local targetItem = xPlayer.getInventoryItem(item)
		if targetItem.limit == -1 or ((targetItem.count + count) <= targetItem.limit) then
		--if xPlayer.canCarryItem(item, count) then
            local list = itemShopList
            for i = 1, #list, 1 do
				if list[i].name == item then
					local totalPrice = count * list[i].price
					if xPlayer.getMoney() >= totalPrice then
						xPlayer.removeMoney(totalPrice)
						xPlayer.addInventoryItem(item, count)
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste '..count.." "..list[i].label })
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你沒有足夠的錢!' })
					end
				end
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '背包沒有足夠的空間!' })
        end
	end
	
	if type == "item_weapon" then
        local targetItem = xPlayer.getInventoryItem(item)
		if targetItem.count < 1 then
		--if xPlayer.canCarryItem(item, count) then
            local list = itemShopList
            for i = 1, #list, 1 do
				if list[i].name == item then
					local targetWeapon = xPlayer.hasWeapon(tostring(list[i].name)) 
					if not targetWeapon then
						local totalPrice = 1 * list[i].price
						if xPlayer.getMoney() >= totalPrice then
							xPlayer.removeMoney(totalPrice)
							xPlayer.addWeapon(list[i].name, list[i].ammo)
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste '..list[i].label })
						else
							TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你沒有足夠的錢!' })
						end
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你已經有這個武器!' })
					end
				end
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你已經有這個武器!' })
        end
	end
	
	if type == "item_ammo" then
		local targetItem = xPlayer.getInventoryItem(item)
		local list = itemShopList
		for i = 1, #list, 1 do
			if list[i].name == item then
				local targetWeapon = xPlayer.hasWeapon(list[i].weaponhash)
				if targetWeapon then
					local totalPrice = count * list[i].price
					local ammo = count * list[i].ammo
					if xPlayer.getMoney() >= totalPrice then
						xPlayer.removeMoney(totalPrice)
						TriggerClientEvent("suku:AddAmmoToWeapon", source, list[i].weaponhash, ammo)
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Compraste '..count.." "..list[i].label })
					else
						TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你沒有足夠的錢!' })
					end
				else
					TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你沒有這種彈藥的武器!' })
				end
            end
        end
    end
end)

AddEventHandler('esx:playerLoaded', function (source)
    GetLicenses(source)
end)

function GetLicenses(source)
    TriggerEvent('esx_license:getLicenses', source, function (licenses)
        TriggerClientEvent('suku:GetLicenses', source, licenses)
    end)
end

RegisterServerEvent('suku:buyLicense')
AddEventHandler('suku:buyLicense', function ()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer.get('money') >= Config.LicensePrice then
		xPlayer.removeMoney(Config.LicensePrice)
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = '你註冊了武器許可證' })
		TriggerEvent('esx_license:addLicense', _source, 'weapon', function ()
			GetLicenses(_source)
		end)
	else
		TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = '你沒有足夠的錢!' })
	end
end)

ESX.RegisterServerCallback("esx_inventoryhud:getFastWeapons",function(source,cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	MySQL.Async.fetchAll(
		'SELECT * FROM user_fastItems WHERE identifier = @identifier',
		{
			['@identifier'] = xPlayer.identifier
		},
		function(result)
			
			local fastWeapons = {
				[1] = nil,
				[2] = nil,
				[3] = nil
			}
			for i=1, #result, 1 do
				fastWeapons[result[i].slot] = result[i].weapon
			end
			cb(fastWeapons)

		end
	)
end)

RegisterServerEvent("esx_inventoryhud:changeFastItem")
AddEventHandler("esx_inventoryhud:changeFastItem",function(slot,weapon)
	local xPlayer = ESX.GetPlayerFromId(source)
	while not xPlayer do Citizen.Wait(0); ESX.GetPlayerFromId(source); end
	if slot ~= 0 then
		MySQL.Async.fetchAll(
		'SELECT * FROM user_fastItems WHERE identifier = @identifier AND weapon=@weapon',
		{
			['@identifier'] = xPlayer.identifier,
			['@weapon'] = weapon
		},
		function(result)
			if result[1] == nil then
				MySQL.Async.execute(
					'INSERT INTO user_fastItems (identifier, weapon, slot) VALUES (@identifier, @weapon, @slot)',
					{
						['@identifier']  = xPlayer.identifier,
						['@weapon']      = weapon,
						['@slot'] = slot
					}
				)
			else
				MySQL.Async.execute(
					'UPDATE user_fastItems SET slot = @slot WHERE identifier = @identifier AND weapon=@weapon',
					{
						['@identifier']  = xPlayer.identifier,
						['@weapon']      = weapon,
						['@slot'] = slot
					}
				)
			end
		end
		)
	else
		MySQL.Async.execute(
		'DELETE FROM user_fastItems WHERE identifier = @identifier AND weapon=@weapon',
		{
			['@identifier']  = xPlayer.identifier,
			['@weapon']      = weapon
		})
	end
end)