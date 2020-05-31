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