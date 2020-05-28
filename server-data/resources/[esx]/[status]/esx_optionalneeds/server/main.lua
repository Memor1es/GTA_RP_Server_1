ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)
--[[
ESX.RegisterUsableItem('beer', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('beer', 1)

	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_beer'))
	TriggerEvent('Radiant_Drunk:GetDrunk')
	xPlayer.addInventoryItem('bottle', 1)

end)
--]]
ESX.RegisterUsableItem('enery', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('enery', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_enery'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('saucisson', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('saucisson', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_saucisson'))
end)

ESX.RegisterUsableItem('grapperaisin', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('grapperaisin', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_grapperaisin'))
end)

ESX.RegisterUsableItem('phatchips', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('phatchips', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_phatchips'))
end)

ESX.RegisterUsableItem('bolcacahuetes', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('bolcacahuetes', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'hunger', 100000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_bolcacahuetes'))
end)

ESX.RegisterUsableItem('drpepper', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('drpepper', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_drpepper'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('jusfruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jusfruit', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jusfruit'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('icetea', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('icetea', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_icetea'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('limonade', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('limonade', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_limonade'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('jager', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jager', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jager'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('rhum', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('rhum', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_rhum'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	
end)

ESX.RegisterUsableItem('jagerbomb', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jagerbomb', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jagerbomb'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('jagercerbere', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('jagercerbere', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_jagercerbere'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('martini', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('martini', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_martini'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('mojito', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('mojito', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_mojito'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('tequila', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('tequila', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_tequila'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('vodka', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodka', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vodka'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('vodkaenergy', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkaenergy', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vodkaenergy'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('vodkafruit', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('vodkafruit', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_vodkafruit'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('whisky', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whisky', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_whisky'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('choya', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('choya', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_choya'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('baileys', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('baileys', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_baileys'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('whiskycoca', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('whiskycoca', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 20*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 100000)
	TriggerClientEvent('esx_status:add', source, 'drunk', 250000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_whiskycoca'))
	TriggerClientEvent('Radiant_Drunk:GetDrunk',source)
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('painkiller', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('painkiller', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_painkiller'))
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('Antibiotics', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Antibiotics', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_Antibiotics'))
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('Stomach_medicine', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Stomach_medicine', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_Stomach_medicine'))
	xPlayer.addInventoryItem('bottle', 1)

end)


ESX.RegisterUsableItem('ointment', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('ointment', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx:showNotification', source, _U('used_ointment'))

end)


ESX.RegisterUsableItem('run_water', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('run_water', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_run_water'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('Grapefruit_leaf', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('Grapefruit_leaf', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx:showNotification', source, _U('used_Grapefruit_leaf'))

end)

ESX.RegisterUsableItem('c_medicine1', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('c_medicine1', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx:showNotification', source, _U('used_c_medicine1'))

end)

ESX.RegisterUsableItem('c_medicine2', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('c_medicine2', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx:showNotification', source, _U('used_c_medicine2'))

end)

ESX.RegisterUsableItem('c_medicine3', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('c_medicine3', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress', 10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_c_medicine3'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('c_medicine4', function(source)

	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('c_medicine4', 1)
	TriggerClientEvent('esx_status:remove', source, 'stress',10*10000)
	TriggerClientEvent('esx_status:add', source, 'thirst', 50000)
	TriggerClientEvent('esx_basicneeds:onDrink', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_c_medicine4'))
	xPlayer.addInventoryItem('bottle', 1)

end)

ESX.RegisterUsableItem('adrenaline_shot', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('adrenaline_shot', 1) -- item name and how many removed on usage
	TriggerClientEvent('esx_optionalneeds:onAdrenaline', source)
end)

ESX.RegisterUsableItem('hotdog', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)

	xPlayer.removeInventoryItem('hotdog', 1)

	TriggerClientEvent('esx_status:add', source, 'hunger', 500000)
	TriggerClientEvent('esx_basicneeds:onEat', source)
	TriggerClientEvent('esx:showNotification', source, _U('used_hotdog'))
end)
