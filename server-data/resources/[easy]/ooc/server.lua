ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
end)

function stringsplit(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t={} ; i=1
    for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
        t[i] = str
        i = i + 1
    end
    return t
end

ESX.RegisterCommand('ooc', 'admin', function(xPlayer, args, showError)
    --args.playerId.triggerEvent('esx_ambulancejob:revive')	
    TriggerClientEvent('chatMessage', -1, "OOC | " .. xPlayer.name, { 128, 128, 128 }, args.message)

end, true, {help = _U('revive_help'), validate = true, arguments = {
    {name = 'message', help = "想要輸入的訊息", type = 'string'}

}})

ESX.RegisterCommand('OOC', 'admin', function(xPlayer, args, showError)
    --args.playerId.triggerEvent('esx_ambulancejob:revive')	
    TriggerClientEvent('chatMessage', -1, "OOC | " .. xPlayer.name, { 128, 128, 128 }, args.message)

end, true, {help = _U('revive_help'), validate = true, arguments = {
    {name = 'message', help = "想要輸入的訊息", type = 'string'}

}})