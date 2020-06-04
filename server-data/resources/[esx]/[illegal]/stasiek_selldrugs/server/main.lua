ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('sellDrugs')
AddEventHandler('sellDrugs', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	local x = 0
	local blackMoney = 0
	local drugType = nil
	
	if Config.SellMany ==false then
		if Config.SellWeed and weedqty > 0 or Config.SellWeed and weedqtySingle > 0 then
			if weedqty > 0 and Config.SellPooch then
				drugType = 'weed_pooch'
				if weedqty == 1 then
					x = 1
				elseif weedqty == 2 then
					x = math.random(1,2)
				elseif weedqty == 3 then
					x = math.random(1,3)
				elseif weedqty == 4 then
					x = math.random(1,4)
				elseif weedqty >= 5 then
					x = math.random(1,5)
				end
			elseif weedqtySingle > 0 and Config.SellSingle then
				drugType = 'weed'
				if weedqtySingle == 1 then
					x = 1
				elseif weedqtySingle == 2 then
					x = math.random(1,2)
				elseif weedqtySingle == 3 then
					x = math.random(1,3)
				elseif weedqtySingle == 4 then
					x = math.random(1,4)
				elseif weedqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellMeth and methqty > 0 or Config.SellMeth and methqtySingle > 0 then
			if methqty > 0 and Config.SellPooch then
				drugType = 'meth_pooch'
				if methqty == 1 then
					x = 1
				elseif methqty == 2 then
					x = math.random(1,2)
				elseif methqty == 3 then
					x = math.random(1,3)
				elseif methqty == 4 then
					x = math.random(1,4)
				elseif methqty >= 5 then
					x = math.random(1,5)
				end
			elseif methqtySingle > 0 and Config.SellSingle then
				drugType = 'meth'
				if methqtySingle == 1 then
					x = 1
				elseif methqtySingle == 2 then
					x = math.random(1,2)
				elseif methqtySingle == 3 then
					x = math.random(1,3)
				elseif methqtySingle == 4 then
					x = math.random(1,4)
				elseif methqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellCoke and cokeqty > 0 or Config.SellCoke and cokeqtySingle > 0 then
				if cokeqty > 0 and Config.SellPooch then
				drugType = 'coke_pooch'
				if cokeqty == 1 then
					x = 1
				elseif cokeqty == 2 then
					x = math.random(1,2)
				elseif cokeqty == 3 then
					x = math.random(1,3)
				elseif cokeqty == 4 then
					x = math.random(1,4)
				elseif cokeqty >= 5 then
					x = math.random(1,5)
				end
			elseif cokeqtySingle > 0 and Config.SellSingle then
				drugType = 'coke'
				if cokeqtySingle == 1 then
					x = 1
				elseif cokeqtySingle == 2 then
					x = math.random(1,2)
				elseif cokeqtySingle == 3 then
					x = math.random(1,3)
				elseif cokeqtySingle == 4 then
					x = math.random(1,4)
				elseif cokeqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
				if opiuqty > 0 and Config.SellPooch then
				drugType = 'opium_pooch'
				if opiuqty == 1 then
					x = 1
				elseif opiuqty == 2 then
					x = math.random(1,2)
				elseif opiuqty == 3 then
					x = math.random(1,3)
				elseif opiuqty == 4 then
					x = math.random(1,4)
				elseif opiuqty >= 5 then
					x = math.random(1,5)
				end
			elseif opiuqtySingle > 0 and Config.SellSingle then
				drugType = 'opium'
				if opiuqtySingle == 1 then
					x = 1
				elseif opiuqtySingle == 2 then
					x = math.random(1,2)
				elseif opiuqtySingle == 3 then
					x = math.random(1,3)
				elseif opiuqtySingle == 4 then
					x = math.random(1,4)
				elseif opiuqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		
		if drugType=='weed_pooch' then	--pooch
			blackMoney = Config.WeedPrice * 5 * x
		elseif drugType=='meth_pooch' then
			blackMoney = Config.MethPrice * 5 * x
		elseif drugType=='coke_pooch' then
			blackMoney = Config.CokePrice * 5 * x
		elseif drugType=='opium_pooch' then
			blackMoney = Config.OpiuPrice * 5 * x
		elseif drugType=='weed' then	--single
			blackMoney = Config.WeedPrice * x
		elseif drugType=='meth' then
			blackMoney = Config.MethPrice * x
		elseif drugType=='coke' then
			blackMoney = Config.CokePrice * x
		elseif drugType=='opium' then
			blackMoney = Config.OpiuPrice * x
		end
		
		if drugType ~= nil then
			TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. '~b~'..tostring(x)..'~w~' .. _U(drugType) .. blackMoney .. '$')
			xPlayer.removeInventoryItem(drugType, x)
		end
		
		--xPlayer.addAccountMoney('black_money', blackMoney)
		xPlayer.addMoney(blackMoney)
		TriggerClientEvent('sold', _source)
	else
		local total = 0
		if (weedqty >0 or methqty > 0 or cokeqty > 0 or opiuqty > 0 or silverqty > 0 or goldqty > 0 or jewqty>0 and not Config.SellSingle) or (weedqtySingle >0 or methqtySingle > 0 or cokeqtySingle > 0 or opiuqtySingle > 0 and Config.SellSingle) then
			if Config.SellWeed and weedqty > 0 or Config.SellWeed and weedqtySingle > 0 then
				if weedqty > 0 and Config.SellPooch then
					drugType = 'weed_pooch'
					if weedqty == 1 then
						x = math.random(0,2)
						total = total + x
					elseif weedqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif weedqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif weedqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif weedqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif weedqtySingle > 0 and Config.SellSingle then
					drugType = 'weed'
					if weedqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif weedqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif weedqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif weedqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif weedqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then	
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellMeth and methqty > 0 or Config.SellMeth and methqtySingle > 0 then
				if methqty > 0 and Config.SellPooch then
					drugType = 'meth_pooch'
					if methqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif methqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif methqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif methqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif methqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif methqtySingle > 0 and Config.SellSingle then
					drugType = 'meth'
					if methqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif methqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif methqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif methqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif methqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellCoke and cokeqty > 0 or Config.SellCoke and cokeqtySingle > 0 then
					if cokeqty > 0 and Config.SellPooch then
					drugType = 'coke_pooch'
					if cokeqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif cokeqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif cokeqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif cokeqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif cokeqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif cokeqtySingle > 0 and Config.SellSingle then
					drugType = 'coke'
					if cokeqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif cokeqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif cokeqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif cokeqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif cokeqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then

					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
					if opiuqty > 0 and Config.SellPooch then
					drugType = 'opium_pooch'
					if opiuqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif opiuqtySingle > 0 and Config.SellSingle then
					drugType = 'opium'
					if opiuqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
				if opiuqty > 0 and Config.SellPooch then
					drugType = 'opium_pooch'
					if opiuqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif opiuqtySingle > 0 and Config.SellSingle then
					drugType = 'opium'
					if opiuqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
		
			if Config.SellSilver and silverqty > 0 then
				
				drugType = 'silverbar'
				if silverqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif silverqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif silverqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif silverqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif silverqty >= 5 then
					x = math.random(0,5)
					total = total + x
				end
				
				blackMoney = Config.SilverBarPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end

			if Config.SellGold and goldqty > 0 then
				
				drugType = 'goldbar'
				if goldqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif goldqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif goldqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif goldqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif goldqty >= 5 then
					x = math.random(0,5)
					total = total + x
				end
				
				blackMoney = Config.GoldBarPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end

			if Config.SellJew and jewqty > 0 then
				
				drugType = 'jewels'
				if jewqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif jewqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif jewqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif jewqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif jewqty >= 5 then
					x = math.random(0,5)
					total = total + x
				end
				
				blackMoney = Config.JewelsPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end

		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		if total == 0 then
			TriggerClientEvent('esx:showNotification', _source, '顧客沒有喜歡的商品')
		end
		TriggerClientEvent('sold', _source)
	end

end)


RegisterServerEvent('CheckNormal')
AddEventHandler('CheckNormal', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	--check cops count on server
	
		if Config.SellWeed then
			if Config.SellPooch and weedqty > 0 or Config.SellSingle and weedqtySingle > 0 then
				TriggerClientEvent('playerhasnormaldrugs', _source)
				return
			end
		end
		if Config.SellMeth then
			if Config.SellPooch and  methqty > 0 or Config.SellSingle and  methqtySingle > 0 then
				TriggerClientEvent('playerhasnormaldrugs', _source)
				return
			end
		end
		if Config.SellCoke then
			if Config.SellPooch and  cokeqty > 0 or Config.SellSingle and  cokeqtySingle > 0 then
				TriggerClientEvent('playerhasnormaldrugs', _source)
				return
			end
		end
		if Config.SellOpiu then
			if Config.SellPooch and  opiuqty > 0 or Config.SellSingle and  opiuqtySingle > 0 then
				TriggerClientEvent('playerhasnormaldrugs', _source)
				return
			end
		end
		
end)


RegisterServerEvent('CheckExpensive')
AddEventHandler('CheckExpensive', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	--check cops count on server
	
		if Config.SellGold then
			if Config.SellGold and goldqty > 0 then
				TriggerClientEvent('playerhasexpensivedrugs', _source)
				return
			end
		end
		if Config.SellSilver then
			if Config.SellSilver and  silverqty > 0 then
				TriggerClientEvent('playerhasexpensivedrugs', _source)
				return
			end
		end
		if Config.SellJew then
			if Config.SellJew and jewqty > 0 then
				TriggerClientEvent('playerhasexpensivedrugs', _source)
				return
			end
		end
	
end)



RegisterServerEvent('drugsNotify')
AddEventHandler('drugsNotify', function()
	TriggerClientEvent("drugsEnable", source)
end)

--if you need you can translate it to your language
RegisterServerEvent('drugsInProgress')
AddEventHandler('drugsInProgress', function(street1, street2, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1.."~r~ and ~w~"..street2)
	TriggerClientEvent("outlawNotify", -1, "~r~銷售非法物品，性別 ~w~"..sex.." ，靠近 ~r~ "..street1.." ~w~ 以及 ~r~ "..street2)
end)
--if you need you can translate it to your language too
RegisterServerEvent('drugsInProgressS1')
AddEventHandler('drugsInProgressS1', function(street1, sex)
      --TriggerClientEvent("outlawNotify", -1, "~r~Selling drugs by ~w~"..sex.."~r~near~w~"..street1)
	TriggerClientEvent("outlawNotify", -1, "~r~銷售非法物品，性別 ~w~"..sex.." ~r~靠近 ~w~"..street1)
end)

RegisterServerEvent('drugsInProgressPos')
AddEventHandler('drugsInProgressPos', function(gx, gy, gz)
	TriggerClientEvent('drugsPlace', -1, gx, gy, gz)
end)


RegisterServerEvent('check')
AddEventHandler('check', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local xPlayers = ESX.GetPlayers()
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	--check cops count on server
	local cops = 0
	for i=1, #xPlayers, 1 do
 		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
 		if xPlayer.job.name == 'police' then
				cops = cops + 1
		end
	end
	
	if cops >= Config.CopsRequiredToSell then
		if Config.SellWeed then
			if Config.SellPooch and weedqty > 0 or Config.SellSingle and weedqtySingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellMeth then
			if Config.SellPooch and  methqty > 0 or Config.SellSingle and  methqtySingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellCoke then
			if Config.SellPooch and  cokeqty > 0 or Config.SellSingle and  cokeqtySingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellOpiu then
			if Config.SellPooch and  opiuqty > 0 or Config.SellSingle and  opiuqtySingle > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellGold then
			if Config.SellGold and goldqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellSilver then
			if Config.SellSilver and  silverqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		if Config.SellJew then
			if Config.SellJew and jewqty > 0 then
				TriggerClientEvent('playerhasdrugs', _source)
				return
			end
		end
		TriggerClientEvent('nomoredrugs', _source)
	else
		TriggerClientEvent('esx:showNotification', _source, _U('must_be') .. Config.CopsRequiredToSell .. _U('to_sell_drugs'))
	end
end)

RegisterServerEvent('sellNormalDrugs')
AddEventHandler('sellNormalDrugs', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	local x = 0
	local blackMoney = 0
	local drugType = nil
	
	if Config.SellMany ==false then
		if Config.SellWeed and weedqty > 0 or Config.SellWeed and weedqtySingle > 0 then
			if weedqty > 0 and Config.SellPooch then
				drugType = 'weed_pooch'
				if weedqty == 1 then
					x = 1
				elseif weedqty == 2 then
					x = math.random(1,2)
				elseif weedqty == 3 then
					x = math.random(1,3)
				elseif weedqty == 4 then
					x = math.random(1,4)
				elseif weedqty >= 5 then
					x = math.random(1,5)
				end
			elseif weedqtySingle > 0 and Config.SellSingle then
				drugType = 'weed'
				if weedqtySingle == 1 then
					x = 1
				elseif weedqtySingle == 2 then
					x = math.random(1,2)
				elseif weedqtySingle == 3 then
					x = math.random(1,3)
				elseif weedqtySingle == 4 then
					x = math.random(1,4)
				elseif weedqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellMeth and methqty > 0 or Config.SellMeth and methqtySingle > 0 then
			if methqty > 0 and Config.SellPooch then
				drugType = 'meth_pooch'
				if methqty == 1 then
					x = 1
				elseif methqty == 2 then
					x = math.random(1,2)
				elseif methqty == 3 then
					x = math.random(1,3)
				elseif methqty == 4 then
					x = math.random(1,4)
				elseif methqty >= 5 then
					x = math.random(1,5)
				end
			elseif methqtySingle > 0 and Config.SellSingle then
				drugType = 'meth'
				if methqtySingle == 1 then
					x = 1
				elseif methqtySingle == 2 then
					x = math.random(1,2)
				elseif methqtySingle == 3 then
					x = math.random(1,3)
				elseif methqtySingle == 4 then
					x = math.random(1,4)
				elseif methqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellCoke and cokeqty > 0 or Config.SellCoke and cokeqtySingle > 0 then
				if cokeqty > 0 and Config.SellPooch then
				drugType = 'coke_pooch'
				if cokeqty == 1 then
					x = 1
				elseif cokeqty == 2 then
					x = math.random(1,2)
				elseif cokeqty == 3 then
					x = math.random(1,3)
				elseif cokeqty == 4 then
					x = math.random(1,4)
				elseif cokeqty >= 5 then
					x = math.random(1,5)
				end
			elseif cokeqtySingle > 0 and Config.SellSingle then
				drugType = 'coke'
				if cokeqtySingle == 1 then
					x = 1
				elseif cokeqtySingle == 2 then
					x = math.random(1,2)
				elseif cokeqtySingle == 3 then
					x = math.random(1,3)
				elseif cokeqtySingle == 4 then
					x = math.random(1,4)
				elseif cokeqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
				if opiuqty > 0 and Config.SellPooch then
				drugType = 'opium_pooch'
				if opiuqty == 1 then
					x = 1
				elseif opiuqty == 2 then
					x = math.random(1,2)
				elseif opiuqty == 3 then
					x = math.random(1,3)
				elseif opiuqty == 4 then
					x = math.random(1,4)
				elseif opiuqty >= 5 then
					x = math.random(1,5)
				end
			elseif opiuqtySingle > 0 and Config.SellSingle then
				drugType = 'opium'
				if opiuqtySingle == 1 then
					x = 1
				elseif opiuqtySingle == 2 then
					x = math.random(1,2)
				elseif opiuqtySingle == 3 then
					x = math.random(1,3)
				elseif opiuqtySingle == 4 then
					x = math.random(1,4)
				elseif opiuqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		
		if drugType=='weed_pooch' then	--pooch
			blackMoney = Config.WeedPrice * 5 * x
		elseif drugType=='meth_pooch' then
			blackMoney = Config.MethPrice * 5 * x
		elseif drugType=='coke_pooch' then
			blackMoney = Config.CokePrice * 5 * x
		elseif drugType=='opium_pooch' then
			blackMoney = Config.OpiuPrice * 5 * x
		elseif drugType=='weed' then	--single
			blackMoney = Config.WeedPrice * x
		elseif drugType=='meth' then
			blackMoney = Config.MethPrice * x
		elseif drugType=='coke' then
			blackMoney = Config.CokePrice * x
		elseif drugType=='opium' then
			blackMoney = Config.OpiuPrice * x
		end
		
		if drugType ~= nil then
			TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. '~b~'..tostring(x)..'~w~' .. _U(drugType) .. blackMoney .. '$')
			xPlayer.removeInventoryItem(drugType, x)
		end
		
		--xPlayer.addAccountMoney('black_money', blackMoney)
		xPlayer.addMoney(blackMoney)
		TriggerClientEvent('sold', _source)
	else
		local total = 0
		if (weedqty >0 or methqty > 0 or cokeqty > 0 or opiuqty > 0 or silverqty > 0 or goldqty > 0 or jewqty>0 and not Config.SellSingle) or (weedqtySingle >0 or methqtySingle > 0 or cokeqtySingle > 0 or opiuqtySingle > 0 and Config.SellSingle) then
			if Config.SellWeed and weedqty > 0 or Config.SellWeed and weedqtySingle > 0 then
				if weedqty > 0 and Config.SellPooch then
					drugType = 'weed_pooch'
					if weedqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif weedqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif weedqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif weedqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif weedqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif weedqtySingle > 0 and Config.SellSingle then
					drugType = 'weed'
					if weedqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif weedqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif weedqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif weedqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif weedqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then	
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellMeth and methqty > 0 or Config.SellMeth and methqtySingle > 0 then
				if methqty > 0 and Config.SellPooch then
					drugType = 'meth_pooch'
					if methqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif methqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif methqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif methqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif methqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif methqtySingle > 0 and Config.SellSingle then
					drugType = 'meth'
					if methqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif methqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif methqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif methqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif methqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellCoke and cokeqty > 0 or Config.SellCoke and cokeqtySingle > 0 then
					if cokeqty > 0 and Config.SellPooch then
					drugType = 'coke_pooch'
					if cokeqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif cokeqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif cokeqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif cokeqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif cokeqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif cokeqtySingle > 0 and Config.SellSingle then
					drugType = 'coke'
					if cokeqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif cokeqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif cokeqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif cokeqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif cokeqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then

					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
					if opiuqty > 0 and Config.SellPooch then
					drugType = 'opium_pooch'
					if opiuqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif opiuqtySingle > 0 and Config.SellSingle then
					drugType = 'opium'
					if opiuqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end
			if Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
				if opiuqty > 0 and Config.SellPooch then
					drugType = 'opium_pooch'
					if opiuqty == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqty == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqty == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqty == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqty >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				elseif opiuqtySingle > 0 and Config.SellSingle then
					drugType = 'opium'
					if opiuqtySingle == 1 then
						x = math.random(0,1)
						total = total + x
					elseif opiuqtySingle == 2 then
						x = math.random(0,2)
						total = total + x
					elseif opiuqtySingle == 3 then
						x = math.random(0,3)
						total = total + x
					elseif opiuqtySingle == 4 then
						x = math.random(0,4)
						total = total + x
					elseif opiuqtySingle >= 5 then
						x = math.random(0,5)
						total = total + x
					end
				end
				if drugType=='weed_pooch' then	--pooch
					blackMoney = Config.WeedPrice * 5 * x
				elseif drugType=='meth_pooch' then
					blackMoney = Config.MethPrice * 5 * x
				elseif drugType=='coke_pooch' then
					blackMoney = Config.CokePrice * 5 * x
				elseif drugType=='opium_pooch' then
					blackMoney = Config.OpiuPrice * 5 * x
				elseif drugType=='weed' then	--single
					blackMoney = Config.WeedPrice * x
				elseif drugType=='meth' then
					blackMoney = Config.MethPrice * x
				elseif drugType=='coke' then
					blackMoney = Config.CokePrice * x
				elseif drugType=='opium' then
					blackMoney = Config.OpiuPrice * x
				end

				if drugType ~= nil and x~=0 then
					
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)

					if Config.USBReward then
						local luck = math.random(1,100)
						if luck <= Config.USBChance then
							xPlayer.addInventoryItem("drugItem", 1)
						end
					end

				end
			end
		
			

		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		if total == 0 then
			TriggerClientEvent('esx:showNotification', _source, '顧客沒有喜歡的商品')
		end
		TriggerClientEvent('sold', _source)
	end

end)


RegisterServerEvent('sellExpensiveDrugs')
AddEventHandler('sellExpensiveDrugs', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local weedqty = xPlayer.getInventoryItem('weed_pooch').count
	local weedqtySingle = xPlayer.getInventoryItem('weed').count
	local methqty = xPlayer.getInventoryItem('meth_pooch').count
	local methqtySingle = xPlayer.getInventoryItem('meth').count
	local cokeqty = xPlayer.getInventoryItem('coke_pooch').count
	local cokeqtySingle = xPlayer.getInventoryItem('coke').count
	local opiuqty = xPlayer.getInventoryItem('opium_pooch').count
	local opiuqtySingle = xPlayer.getInventoryItem('opium').count
	local silverqty = xPlayer.getInventoryItem('silverbar').count
	local goldqty = xPlayer.getInventoryItem('goldbar').count
	local jewqty = xPlayer.getInventoryItem('jewels').count
	local x = 0
	local blackMoney = 0
	local drugType = nil
	
	if Config.SellMany ==false then
		if Config.SellWeed and weedqty > 0 or Config.SellWeed and weedqtySingle > 0 then
			if weedqty > 0 and Config.SellPooch then
				drugType = 'weed_pooch'
				if weedqty == 1 then
					x = 1
				elseif weedqty == 2 then
					x = math.random(1,2)
				elseif weedqty == 3 then
					x = math.random(1,3)
				elseif weedqty == 4 then
					x = math.random(1,4)
				elseif weedqty >= 5 then
					x = math.random(1,5)
				end
			elseif weedqtySingle > 0 and Config.SellSingle then
				drugType = 'weed'
				if weedqtySingle == 1 then
					x = 1
				elseif weedqtySingle == 2 then
					x = math.random(1,2)
				elseif weedqtySingle == 3 then
					x = math.random(1,3)
				elseif weedqtySingle == 4 then
					x = math.random(1,4)
				elseif weedqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellMeth and methqty > 0 or Config.SellMeth and methqtySingle > 0 then
			if methqty > 0 and Config.SellPooch then
				drugType = 'meth_pooch'
				if methqty == 1 then
					x = 1
				elseif methqty == 2 then
					x = math.random(1,2)
				elseif methqty == 3 then
					x = math.random(1,3)
				elseif methqty == 4 then
					x = math.random(1,4)
				elseif methqty >= 5 then
					x = math.random(1,5)
				end
			elseif methqtySingle > 0 and Config.SellSingle then
				drugType = 'meth'
				if methqtySingle == 1 then
					x = 1
				elseif methqtySingle == 2 then
					x = math.random(1,2)
				elseif methqtySingle == 3 then
					x = math.random(1,3)
				elseif methqtySingle == 4 then
					x = math.random(1,4)
				elseif methqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellCoke and cokeqty > 0 or Config.SellCoke and cokeqtySingle > 0 then
				if cokeqty > 0 and Config.SellPooch then
				drugType = 'coke_pooch'
				if cokeqty == 1 then
					x = 1
				elseif cokeqty == 2 then
					x = math.random(1,2)
				elseif cokeqty == 3 then
					x = math.random(1,3)
				elseif cokeqty == 4 then
					x = math.random(1,4)
				elseif cokeqty >= 5 then
					x = math.random(1,5)
				end
			elseif cokeqtySingle > 0 and Config.SellSingle then
				drugType = 'coke'
				if cokeqtySingle == 1 then
					x = 1
				elseif cokeqtySingle == 2 then
					x = math.random(1,2)
				elseif cokeqtySingle == 3 then
					x = math.random(1,3)
				elseif cokeqtySingle == 4 then
					x = math.random(1,4)
				elseif cokeqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		elseif Config.SellOpiu and opiuqty > 0 or Config.SellOpiu and opiuqtySingle > 0 then
				if opiuqty > 0 and Config.SellPooch then
				drugType = 'opium_pooch'
				if opiuqty == 1 then
					x = 1
				elseif opiuqty == 2 then
					x = math.random(1,2)
				elseif opiuqty == 3 then
					x = math.random(1,3)
				elseif opiuqty == 4 then
					x = math.random(1,4)
				elseif opiuqty >= 5 then
					x = math.random(1,5)
				end
			elseif opiuqtySingle > 0 and Config.SellSingle then
				drugType = 'opium'
				if opiuqtySingle == 1 then
					x = 1
				elseif opiuqtySingle == 2 then
					x = math.random(1,2)
				elseif opiuqtySingle == 3 then
					x = math.random(1,3)
				elseif opiuqtySingle == 4 then
					x = math.random(1,4)
				elseif opiuqtySingle >= 5 then
					x = math.random(1,5)
				end
			end
		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		
		if drugType=='weed_pooch' then	--pooch
			blackMoney = Config.WeedPrice * 5 * x
		elseif drugType=='meth_pooch' then
			blackMoney = Config.MethPrice * 5 * x
		elseif drugType=='coke_pooch' then
			blackMoney = Config.CokePrice * 5 * x
		elseif drugType=='opium_pooch' then
			blackMoney = Config.OpiuPrice * 5 * x
		elseif drugType=='weed' then	--single
			blackMoney = Config.WeedPrice * x
		elseif drugType=='meth' then
			blackMoney = Config.MethPrice * x
		elseif drugType=='coke' then
			blackMoney = Config.CokePrice * x
		elseif drugType=='opium' then
			blackMoney = Config.OpiuPrice * x
		end
		
		if drugType ~= nil then
			TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. '~b~'..tostring(x)..'~w~' .. _U(drugType) .. blackMoney .. '$')
			xPlayer.removeInventoryItem(drugType, x)
		end
		
		--xPlayer.addAccountMoney('black_money', blackMoney)
		xPlayer.addMoney(blackMoney)
		TriggerClientEvent('sold', _source)
	else
		local total = 0
		if (silverqty > 0 or goldqty > 0 or jewqty>0 and not Config.SellSingle) or (weedqtySingle >0 or methqtySingle > 0 or cokeqtySingle > 0 or opiuqtySingle > 0 and Config.SellSingle) then
			if Config.SellSilver and silverqty > 0 then
				
				drugType = 'silverbar'
				if silverqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif silverqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif silverqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif silverqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif silverqty >= 5 then
					x = math.random(0,5)
					total = total + x
				end
				
				blackMoney = Config.SilverBarPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end

			if Config.SellGold and goldqty > 0 then
				
				drugType = 'goldbar'
				if goldqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif goldqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif goldqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif goldqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif goldqty >= 5 then
					x = math.random(0,5)
					total = total + x
				end
				
				blackMoney = Config.GoldBarPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)
				end
			end

			if Config.SellJew and jewqty > 0 then
				
				drugType = 'jewels'
				if jewqty == 1 then
					x = math.random(0,1)
					total = total + x
				elseif jewqty == 2 then
					x = math.random(0,2)
					total = total + x
				elseif jewqty == 3 then
					x = math.random(0,3)
					total = total + x
				elseif jewqty == 4 then
					x = math.random(0,4)
					total = total + x
				elseif jewqty >= 5 then
					x = math.random(0,5)
					total = total + x
				elseif jewqty >= 6 then
					x = math.random(0,6)
					total = total + x
				elseif jewqty >= 7 then
					x = math.random(0,7)
					total = total + x
				elseif jewqty >= 8 then
					x = math.random(0,8)
					total = total + x
				elseif jewqty >= 9 then
					x = math.random(0,9)
					total = total + x
				elseif jewqty >= 10 then
					x = math.random(0,10)
					total = total + x
				elseif jewqty >= 20 then
					x = math.random(10,20)
					total = total + x
				elseif jewqty < 20 then
					x = math.random(0,jewqty)
					total = total + x
				end
				
				blackMoney = Config.JewelsPrice * x

				if drugType ~= nil and x~=0 then
					TriggerClientEvent('esx:showNotification', _source, _U('you_have_sold') .. "~b~ "..tostring(x).." ~w~" .. _U(drugType) .. blackMoney .. '$')
					xPlayer.removeInventoryItem(drugType, x)
					xPlayer.addMoney(blackMoney)

					if Config.USBReward then
						local luck = math.random(1,100)
						if luck <= Config.USBChance then
							xPlayer.addInventoryItem("drugItem", 1)
						end
					end

				end
			end

		else
			TriggerClientEvent('nomoredrugs', _source)
			return
		end
		if total == 0 then
			TriggerClientEvent('esx:showNotification', _source, '顧客沒有喜歡的商品')
		end
		TriggerClientEvent('sold', _source)
	end

end)