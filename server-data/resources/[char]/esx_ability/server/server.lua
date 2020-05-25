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
                xPlayer.TriggerEvent("esx_ability:setability",result[1].ability)
            end

            if result[1].ability_level ~= nil then
                xPlayer.TriggerEvent("esx_ability:setlevel",result[1].ability_level)
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


