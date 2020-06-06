ESX = nil
local weeds = 10
local sleep = 50

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('esx_drugseller:buy')
AddEventHandler('esx_drugseller:buy', function(item, amount, money)
   local _source = source
   local xPlayer = ESX.GetPlayerFromId(source)
   local moneys = xPlayer.getMoney()

   if item == "seed_weed" and (identifiers == "steam:11000010029352c" or identifiers == "steam:11000011b00ad2") then
		TriggerClientEvent('esx:showNotification', _source, "~g~歡迎特約廠商前來購買，歡迎下次再來！")
	elseif os.date("*t",os.time()).hour<13 then
		TriggerClientEvent('esx:showNotification', _source, "~g~時候還沒到！")
		return
	elseif item == "seed_weed" and (weeds - amount) >= 0 then
		weeds = weeds - amount
	elseif item == "seed_weed" then
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


   if moneys >= money then
   xPlayer.removeMoney(money)
   xPlayer.addInventoryItem(item, amount)
   TriggerClientEvent('esx:showNotification', source, 'You bought ' .. item .. ' for ' .. money .. '$')
   else 
    TriggerClientEvent('esx:showNotification', source, 'You dont have cash for this')
    if item == "seed_weed" then
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