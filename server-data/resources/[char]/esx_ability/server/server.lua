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
                xPlayer.triggerEvent("esx_ability:updateability",result[1].ability)
            end

            if result[1].ability_level ~= nil then
                xPlayer.triggerEvent("esx_ability:updatelevel",result[1].ability_level)
            end

            if result[1].today_level ~= nil then
                xPlayer.triggerEvent("esx_ability:settodaylevel",result[1].ability_level)
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
        MySQL.Sync.execute('UPDATE users SET ability_level = ability_level + @num WHERE identifier = @identifier', {
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
        
        MySQL.Sync.execute('UPDATE users SET ability_level = @num WHERE identifier = @identifier', {
            ['@num'] = num,
            ['@identifier'] = xPlayer.identifier
        })
    end
end)

RegisterServerEvent('esx_ability:settodaylevel')
AddEventHandler('esx_ability:settodaylevel', function(num)
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        
        MySQL.Sync.execute('UPDATE users SET today_level = today_level + @num WHERE identifier = @identifier', {
            ['@num'] = num,
            ['@identifier'] = xPlayer.identifier
        })
    end
end)

RegisterServerEvent('esx_ability:setability')
AddEventHandler('esx_ability:setability', function(name)
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        
        MySQL.Sync.execute('UPDATE users SET ability = @name WHERE identifier = @identifier', {
            ['@name'] = name,
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


function ResetDailyLevel(d, h, m)
	--print("Paiement des factures en cours le serveur peut lag momentanément")
	CreateThread(function()
		Wait(0)
		MySQL.Async.fetchAll('SELECT * FROM users', {}, function (result)
			print(#result)
			for i=1, #result, 1 do
				local xPlayer = ESX.GetPlayerFromIdentifier(result[i].identifier)
				
				-- message player if connected
				if xPlayer then
					xPlayer.triggerEvent('esx_ability:settodaylevel',0)
                    
				end -- reset daily ability level either way
               
                MySQL.Async.fetchScalar('SELECT today_level FROM users WHERE identifier = @identifier', 
                {
                    ['@identifier'] = result[i].identifier
                }, function(todaylevel)
                    if todaylevel > 0 then
                        
                        MySQL.Sync.execute('UPDATE users SET today_level =  @num WHERE identifier = @identifier',
                        {
                            ['@num']       = 0,
                            ['@identifier'] = result[i].identifier
                        })
                        
                    end
                end)
				
			end
		end)
	end)
end



if Config.CronAutoResetLevel then
	TriggerEvent('cron:runAt', 8, 0, ResetDailyLevel)
end