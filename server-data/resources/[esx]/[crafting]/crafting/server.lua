MySQL.ready(function(...) crafting.SqlReady = true; end)

function crafting:Awake(...) 
  while not self.SqlReady do Citizen.Wait(0); end
  self.CraftingTables = {}
  MySQL.Async.fetchAll('SELECT * FROM craftingtables',{},function(data)
    for k,v in pairs(data) do
      local loc = json.decode(v.location)
      self.CraftingTables[k] = vector4(loc.x,loc.y,loc.z,loc.heading)
    end
    self.Started = true
  end)
end

function crafting:Start(source)
  local recipes = {}
  local busy = true
  local xPlayer = ESX.GetPlayerFromId(source);
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  MySQL.Async.fetchAll('SELECT * FROM known_recipes WHERE identifier=@identifier',{['@identifier'] = xPlayer.getIdentifier()},function(retData)
    if retData and retData[1] then
      for k,v in pairs(json.decode(retData[1].data)) do
        if v and v == true then
          recipes[k] = v
        end
      end
    end
    busy = false
  end)
  while busy or not self.Started do Citizen.Wait(0); end
  TriggerClientEvent('crafting:Respond',source,true,recipes,self.CraftingTables)
end

function crafting:UseTable(source)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do Citizen.Wait(0); end
  local item = xPlayer.getInventoryItem('craftingtable')
  if item and item.count and item.count > 0 then
    xPlayer.removeInventoryItem('craftingtable',1)
    TriggerClientEvent('crafting:PlaceTable', source)
  end
end

function crafting:CraftItem(source,name,label,learn)
  local xPlayer = ESX.GetPlayerFromId(source)
  while not xPlayer do xPlayer = ESX.GetPlayerFromId(source); Citizen.Wait(0); end
  local recipe = Recipes[name]
  if recipe then
    local hasAll = true
    local notEnough = {}
    local counts = {}
    for k,v in pairs(recipe) do
      if v then
        local item = xPlayer.getInventoryItem(v)
        counts[v] = counts[v] and counts[v]+1 or 1
        if not item or (item.count and item.count < counts[v]) then
          hasAll = false
          table.insert(notEnough,item.label.." : Have - "..item.count.." : Need - "..counts[v])
        end
      end
    end
    if hasAll then
      for k,v in pairs(recipe) do
        if v then 
          local keep = (KeepItems[name] and KeepItems[name][k] or false)
          if not keep then
            xPlayer.removeInventoryItem(v,1); 
          end
        end
      end
      local rewardAmount = RecipeRewards[name]
      xPlayer.addInventoryItem(name,rewardAmount)
      if learn then
        MySQL.Async.fetchAll('SELECT * FROM known_recipes WHERE identifier=@identifier',{['@identifier'] = xPlayer.getIdentifier()},function(data)
          if data and data[1] then
            local recipes = json.decode(data[1].data)
            recipes[name] = true
            MySQL.Async.execute('UPDATE known_recipes SET data=@data WHERE identifier=@identifier',{['@identifier'] = xPlayer.getIdentifier(), ['@data'] = json.encode(recipes)})
          else
            local recipes = {}
            recipes[name] = true
            MySQL.Async.execute('INSERT INTO known_recipes SET identifier=@identifier,data=@data',{['@identifier'] = xPlayer.getIdentifier(), ['@data'] = json.encode(recipes)})
          end
        end)
      end
    end
    TriggerClientEvent('crafting:CraftRespond',source,hasAll,label,notEnough)
  end
end

function crafting:TablePlaced(pos)
  self.CraftingTables[#self.CraftingTables+1] = pos
  MySQL.Async.execute('INSERT INTO craftingtables SET location=@location',{['@location'] = json.encode({x=pos.x,y=pos.y,z=pos.z,heading=pos.w}) })
  TriggerClientEvent('crafting:SyncTables', -1, self.CraftingTables)
end

RegisterNetEvent('crafting:TablePlaced')
AddEventHandler('crafting:TablePlaced', function(...) crafting:TablePlaced(...); end)

RegisterNetEvent('crafting:TryCraft')
AddEventHandler('crafting:TryCraft', function(...) crafting:CraftItem(source,...); end)

RegisterNetEvent('crafting:Start')
AddEventHandler('crafting:Start', function(...) crafting:Start(source); end)

ESX.RegisterUsableItem('craftingtable', function(...) crafting:UseTable(...); end)

Citizen.CreateThread(function(...) crafting:Awake(...); end)