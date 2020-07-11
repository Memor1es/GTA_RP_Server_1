ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
--[[
AddEventHandler('chatMessage', function(source, name, msg)
	sm = stringsplit(msg, " ");
	if sm[1] == "/ooc" then
		CancelEvent()
		TriggerClientEvent('chatMessage', -1, "OOC | " .. name, { 128, 128, 128 }, string.sub(msg,5))
	end
end)
--]]
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

function getIdentity(source)
	local identifier = string.sub(GetPlayerIdentifiers(source)[2], 9)
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height']
			
		}
	else
        return nil
    end
end

ESX.RegisterCommand('ooc', 'user', function(xPlayer, args, showError)
    --args.playerId.triggerEvent('esx_ambulancejob:revive')
    local source = xPlayer.source
    local name = getIdentity(source)
    
    if string.match(name.firstname, "[A-Za-z]") ~= nil then
        TriggerClientEvent('chat:addMessage', -1, {
            args = { '^2' .. name['firstname'] .. ' ' .. name['lastname'] .. ' [' .. source .. ']', '^0 ' .. args.message }
        })
    else
        TriggerClientEvent('chat:addMessage', -1, {
            args = { '^2' .. name['lastname'] .. name['firstname'] .. ' [' .. source .. ']', '^0 ' .. args.message }
        })
    end
    -- TriggerClientEvent('chatMessage', -1, "OOC | " .. xPlayer.name, { 128, 128, 128 }, args.message)
end, true, {help = "RP外發言(out of character)", validate = true, arguments = {
    {name = 'message', help = "想要輸入的訊息", type = 'string'}

}})

ESX.RegisterCommand('OOC', 'user', function(xPlayer, args, showError)
    --args.playerId.triggerEvent('esx_ambulancejob:revive')	
    TriggerClientEvent('chatMessage', -1, "OOC | " .. xPlayer.name, { 128, 128, 128 }, args.message)

end, true, {help = "RP外發言(out of character)", validate = true, arguments = {
    {name = 'message', help = "想要輸入的訊息", type = 'string'}

}})

ESX.RegisterCommand('adminooc', 'admin', function(xPlayer, args, showError)
    --args.playerId.triggerEvent('esx_ambulancejob:revive')	
    TriggerClientEvent('chatMessage', -1, "OOC | " .. xPlayer.name, { 128, 0, 0 }, args.message)

end, true, {help = "政府官員發言", validate = true, arguments = {
    {name = 'message', help = "想要輸入的訊息", type = 'string'}

}})