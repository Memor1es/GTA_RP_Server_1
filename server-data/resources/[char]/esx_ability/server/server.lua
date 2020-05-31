local ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_ability:checkability')
AddEventHandler('esx_ability:checkability', function()
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            if result[1].ability ~= nil then
                xPlayer.triggerEvent("esx_ability:setability",result[1].ability)
            end

            if result[1].ability_level ~= nil then
                xPlayer.triggerEvent("esx_ability:setlevel",result[1].ability_level)
            end
        end)
    end
end)

RegisterServerEvent('esx_ability:levelup')
AddEventHandler('esx_ability:levelup', function(num)
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        --[[MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            if result[1].ability ~= nil then
                xPlayer.TriggerEvent("esx_ability:setability",result[1].ability)
            end

            if result[1].ability_level ~= nil then
                xPlayer.TriggerEvent("esx_ability:setlevel",result[1].ability_level)
            end
        end)--]]
        MySQL.Sync.execute('UPDATE user SET ability_level = ability_level + @num WHERE identifier = @identifier', {
            ['@num'] = num,
            ['@identifier'] = xPlayer.identifier
        })
    end
end)

RegisterServerEvent('esx_ability:setlevel')
AddEventHandler('esx_ability:setlevel', function(num)
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        
        MySQL.Sync.execute('UPDATE user SET ability_level = @num WHERE identifier = @identifier', {
            ['@num'] = num,
            ['@identifier'] = xPlayer.identifier
        })
    end
end)


ESX.RegisterCommand('setability', 'admin', function(xPlayer, args, showError)
	if DoesAbilityExist(args.ability) then
		xPlayer.triggerEvent("esx_ability:setability",args.ability)
	else
		showError("天賦不存在")
	end
end, true, {help = "設置天賦", validate = true, arguments = {
	{name = 'playerId', help = "玩家ID", type = 'player'},
	{name = 'ability', help = "天賦", type = 'string'}
}})

ESX.RegisterCommand('resetmylevel', 'admin', function(xPlayer, args, showError)

	xPlayer.triggerEvent("esx_ability:levelreset")
	
end, true, {help = "等級歸零", validate = true})

function DoesAbilityExist(job)
    if Config.AbilityList[job] then
        return true
    end
    return false
end