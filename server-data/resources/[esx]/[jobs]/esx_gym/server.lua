ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

-- Check if membership already exists
function getMembership(identifier)
    local result = MySQL.Sync.fetchAll(
                       'SELECT id FROM gym_memberships WHERE identifier = @identifier',
                       {['@identifier'] = identifier})
    if #result > 0 then return true end
    return false
end

-- Check if membership already exists
ESX.RegisterServerCallback('esx_gym:checkMembership', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer == nil then return false end
    local membership = getMembership(xPlayer.getIdentifier())
    cb(membership)
end)

ESX.RegisterServerCallback('esx_gym:buyMembership', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)

    -- Check if membership already exists
    if getMembership(xPlayer.getIdentifier()) then
        xPlayer.showNotification("You already own a membership")
        cb(false)
        return
    end

    -- Create a new subscription
    MySQL.Async.insert(
        "INSERT INTO gym_memberships (identifier, expire) VALUES (@identifier, FROM_UNIXTIME(@expire))",
        {
            ['@identifier'] = xPlayer.getIdentifier(),
            ['@expire'] = os.time() + (Config.Membership.Expire * 86400)
        }, function()
            xPlayer.showNotification("Thank you for shopping with us")
            cb(true)
        end)
end)

-- Check membership expirations
function CheckExpirations(d, h, m)
    print("Check gym expirations")
    MySQL.Async.fetchAll(
        "SELECT id, identifier FROM gym_memberships WHERE expire <= FROM_UNIXTIME(@expire)",
        {['@expire'] = os.time()}, function(result)
            for i = 1, #result, 1 do
                local xPlayer =
                    ESX.GetPlayerFromIdentifier(result[i].identifier)

                if xPlayer ~= nil then
                    xPlayer.showNotification("Your gym membership ~r~expired.")
                end

                MySQL.Sync.execute(
                    'DELETE FROM gym_memberships WHERE identifier = @identifier',
                    {['@identifier'] = result[i].identifier})
            end
        end)
end

-- Register cron checks
for i = 0, 23, 1 do TriggerEvent('cron:runAt', i, 0, CheckExpirations) end

