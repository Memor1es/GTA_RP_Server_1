ESX             = nil
local ShopItems = {}
local weeds = 10
local sleep = 50

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
		for i=1, #shopResult, 1 do
			if shopResult[i].name then
				if ShopItems[shopResult[i].store] == nil then
					ShopItems[shopResult[i].store] = {}
				end

				table.insert(ShopItems[shopResult[i].store], {
					label = shopResult[i].label,
					item  = shopResult[i].item,
					price = shopResult[i].price,
				})
			else
				print(('esx_shops: invalid item "%s" found!'):format(shopResult[i].item))
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_shops:requestDBItems', function(source, cb)
	cb(ShopItems)
end)

RegisterServerEvent('esx_shops:buyItem')
AddEventHandler('esx_shops:buyItem', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		print('esx_shops: ' .. xPlayer.identifier .. ' attempted to exploit the shop!')
		return
	end
	
	local identifiers = GetPlayerIdentifiers(source)[1]
	if itemName == "seed_weed" and (identifiers == "steam:11000010029352c" or identifiers == "steam:11000011b00ad2") then
		TriggerClientEvent('esx:showNotification', _source, "~g~歡迎特約廠商前來購買，歡迎下次再來！")
	elseif itemName == "seed_weed" and (weeds - amount) >= 0 then
		weeds = weeds - amount
	elseif itemName == "seed_weed" then
		local minute = sleep / 60000
		if minute >= 60 then
			-- TriggerClientEvent('esx:showNotification', _source, "~g~賣菜郎 ~s~目前只剩下 " .. weeds .. " 個 ~y~大麻種子，~g~請等待 " .. minute  .. " 分 " .. second .. " 秒後進貨！")
			TriggerClientEvent('esx:showNotification', _source, "~g~賣菜郎 ~s~目前只剩下 " .. weeds .. " 個 ~y~種子~s~，~r~蔬果剛銷售完畢，備料中！")
		elseif minute >= 20 then
			TriggerClientEvent('esx:showNotification', _source, "~g~賣菜郎 ~s~目前只剩下 " .. weeds .. " 個 ~y~種子~s~，~o~蔬果配送中！")
		else
			TriggerClientEvent('esx:showNotification', _source, "~g~賣菜郎 ~s~目前只剩下 " .. weeds .. " 個 ~y~種子~s~，~g~蔬果即將送達！")
		end
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getMoney() >= price then
		-- can the player carry the said amount of x item?
		if xPlayer.canCarryItem(itemName, amount) then
			xPlayer.removeMoney(price)
			xPlayer.addInventoryItem(itemName, amount)
			xPlayer.showNotification(_U('bought', amount, itemLabel, ESX.Math.GroupDigits(price)))
		else
			xPlayer.showNotification(_U('player_cannot_hold'))
			if itemName == "seed_weed" then
				weeds = weeds + amount
			end
		end
	else
		local missingMoney = price - xPlayer.getMoney()
		xPlayer.showNotification(_U('not_enough', ESX.Math.GroupDigits(missingMoney)))
		if itemName == "seed_weed" then
				weeds = weeds + amount
		end
	end
end)

Citizen.CreateThread(function()
	local sell = false
	while true do
		if weeds ~= 10 and sell == false then
			sleep = 7200000
			sell = true
		elseif weeds ~= 10 and sell == true then
			if sleep ~= 0 then
				sleep = sleep - 50
			else
				weeds = 10
				sell = false
			end
		end
		Citizen.Wait(50)
	end
end)
