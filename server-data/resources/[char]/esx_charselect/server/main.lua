ESX               = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ur:checkRegistration')
AddEventHandler('ur:checkRegistration', function()
    if ESX == nil then
        return 
    end
    
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)

    if xPlayer ~= nil then
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier = @identifier',{
            ['@identifier'] = xPlayer.identifier
        }, function(result)
            if result[1].firstname == nil and result[1].lastname == nil and result[1].dateofbirth == nil and result[1].sex == nil and result[1].height == nil then
                TriggerClientEvent('ur:warnning', _source)
            else
                TriggerClientEvent('ur:hasRegistraion', _source)
            end
        end)
    end
end)

RegisterServerEvent("charselect:createsign")
AddEventHandler("charselect:createsign", function(xPlayer)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local player = xPlayer.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier=@username", {['@username'] = player})
    if result[1] then
        if xPlayer ~= nil then
            local accounts = json.decode(result[1].accounts)
            if accounts.money == nil then
                TriggerClientEvent("charselect:createsign", _source, (result[1].firstname .. " " .. result[1].lastname), xPlayer.job.label, ("Cash: " .. " 0 " .. "$"))
            else
                TriggerClientEvent("charselect:createsign", _source, (result[1].firstname .. " " .. result[1].lastname), xPlayer.job.label, ("Cash: " .. accounts.money .. "$"))
            end
        end
    end
end)    
--[[
RegisterServerEvent("charselect:select")
AddEventHandler("charselect:select", function(xPlayer)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local player = xPlayer.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT * FROM characters WHERE identifier=@username", {['@username'] = player})
    if xPlayer ~= nil then
        if result[1] then   
            TriggerClientEvent("charselect:animation", _source, true)
        else
        end
    end
end)    
--]]
RegisterServerEvent("charselect:lastpos")
AddEventHandler("charselect:lastpos", function(xPlayer)
    local _source = source
    local xPlayer  = ESX.GetPlayerFromId(_source)
    local player = xPlayer.getIdentifier()
    local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier=@username", {['@username'] = player})
    if (result) then
        if xPlayer ~= nil then
            TriggerClientEvent("charselect:lastpos", _source, json.decode(result[1].position))
        end
    end
end)
