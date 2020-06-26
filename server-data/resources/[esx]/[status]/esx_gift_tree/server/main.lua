ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
	ESX = obj
end)

ESX.RegisterCommand('setstr', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_gift_tree:setstr',args.value)
end, true, {help = "設置力量", validate = true, arguments = {
    {name = 'value', help = "數值", type = 'number'}
}
})

ESX.RegisterCommand('setagi', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_gift_tree:setagi',args.value)
end, true, {help = "設置敏捷", validate = true, arguments = {
    {name = 'value', help = "數值", type = 'number'}
}
})

ESX.RegisterCommand('setint', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_gift_tree:setint',args.value)
end, true, {help = "設置智慧", validate = true, arguments = {
    {name = 'value', help = "數值", type = 'number'}
}
})

ESX.RegisterCommand('setluk', 'admin', function(xPlayer, args, showError)
	xPlayer.triggerEvent('esx_gift_tree:setluk',args.value)
end, true, {help = "設置幸運", validate = true, arguments = {
    {name = 'value', help = "數值", type = 'number'}
}
})

ESX.RegisterUsableItem('book', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.triggerEvent('esx_status:add','int',1)
	xPlayer.triggerEvent('notification', '感覺到智力上升了一點...', 2)
end)

ESX.RegisterUsableItem('luck1', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.triggerEvent('esx_gift_tree:randomluk',1,20)
end)

ESX.RegisterUsableItem('luck2', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.triggerEvent('esx_gift_tree:randomluk',20,40)
end)

ESX.RegisterUsableItem('luck3', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.triggerEvent('esx_gift_tree:randomluk',40,60)
end)

ESX.RegisterUsableItem('luck4', function(source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.triggerEvent('esx_gift_tree:randomluk',60,100)
end)