local cam = -1

function crafting:Awake(...)
  while not ESX do Citizen.Wait(0); end
  while not ESX.IsPlayerLoaded() do Citizen.Wait(0); end
  self.Tables = {}
  self.CraftingItems = {}
  for k,v in pairs(Recipes) do
    for k,v in pairs(v) do
      if v and not self.CraftingItems[v] then
        self.CraftingItems[v] = v
      end
    end
  end
  self.Open = false;
  self.PlayerData = ESX.GetPlayerData();
  TriggerServerEvent('crafting:Start')
end

function crafting:Respond(...)
  local args = {...}
  self.SpawnedTables = {}
  self.CraftingTables = args[3] or {}
  self.Learned = args[2] or {}
  self:Update()  
end

function crafting:Update(...)
  local interactText = "Press [~r~E~s~] to use the crafting bench."
  local lastCheck = 0
  local lastPos = false
  while true do
    Citizen.Wait(0)

    local plyPed = GetPlayerPed(-1)
    local plyPos = GetEntityCoords(plyPed)

    if (GetGameTimer() - lastCheck > 5000) or (lastPos and GetXYDist(plyPos.x,plyPos.y,plyPos.z, lastPos.x,lastPos.y,lastPos.z) > 100.0) then
      lastCheck = GetGameTimer()
      lastPos = plyPos
      for k,v in pairs(self.CraftingTables) do
        local dist = GetXYDist(plyPos.x,plyPos.y,plyPos.z, v.x,v.y,v.z)
        if not self.SpawnedTables[v] then
          if dist < self.LoadTableDist then
            self:SpawnTable(v)
          end
        else
          if dist > (self.LoadTableDist*2) then
            self:DespawnTable(v)
          end
        end
      end
    end

    local closest,closestDist = self:GetClosestTable()
    if closestDist and closestDist < self.DrawTextDist and self.SpawnedTables[closest] then
      DrawText3D(closest.x,closest.y,closest.z+1.5, interactText, 100.0, true)
      if IsControlJustPressed(0, 38) then
        self:UseTable(closest)
      end
    end
  end
end

function crafting:SpawnTable(pos)
  self.SpawnedTables[pos] = true
  local hash = GetHashKey(self.BenchModel)
  RequestModel(hash);
  while not HasModelLoaded(hash) do RequestModel(hash); Citizen.Wait(0); end  
  local newTable = CreateObject(hash, pos.x,pos.y,pos.z, false,false,false) or nil
  SetEntityHeading(newTable,pos.w)
  SetEntityAsMissionEntity(newTable,true,true)
  FreezeEntityPosition(newTable,true)
  self.SpawnedTables[pos] = newTable
  SetModelAsNoLongerNeeded(hash)
end

function crafting:DespawnTable(pos)
  local obj = self.SpawnedTables[pos]
  if not obj then return; end
  SetEntityAsMissionEntity(obj,true,true)
  DeleteObject(obj)
  DeleteEntity(obj)
  self.SpawnedTables[pos] = nil
end

function crafting:UseTable(pos)  
  local right,fwd,up,posB = GetEntityMatrix(self.SpawnedTables[pos])
  local tPos = pos.xyz + (fwd*0.8)
  local pPos = GetEntityCoords(GetPlayerPed(-1))
  if (GetXYDist(pPos.x,pPos.y,pPos.z, tPos.x,tPos.y,tPos.z) > 1.1) then
    TaskGoStraightToCoord(GetPlayerPed(-1), tPos.x, tPos.y, tPos.z, 10.0, 10, pos.w+90.0, 0.5)
  end
  while (GetXYDist(pPos.x,pPos.y,pPos.z, tPos.x,tPos.y,tPos.z) > 1.15) do pPos = GetEntityCoords(GetPlayerPed(-1)); Citizen.Wait(0); end

  local curCam = GetRenderingCam()
  cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", pos.x,pos.y,pos.z+1.5,-90.0,0.0,pos.w+90.0, 100.00, false, 0)
  SetCamActive(cam,true)
  RenderScriptCams(true, 1, 1000, 1, 1);
  SetCamActiveWithInterp(curCam, cam, 1, 1000, 1);

  Citizen.Wait(1000);

  self.Crafting = true
  self:DoUi();
  while self.Crafting do Citizen.Wait(0); end

  SetCamActive(cam, false)
  DestroyCam(cam, true)
  RenderScriptCams(false, 1, 1000, 1, 1);
  FreezeEntityPosition(GetPlayerPed(-1), false)
end

function crafting:GetClosestTable()
  local closest,closestDist
  local pos = GetEntityCoords(GetPlayerPed(-1))
  for k,v in pairs(self.CraftingTables) do
    local dist = GetXYDist(pos.x,pos.y,pos.z, v.x,v.y,v.z)
    if not closestDist or dist < closestDist then
      closest = v
      closestDist = dist
    end
  end 
  if closest then return closest,closestDist else return false,999999; end
end


function crafting:DoUi(...)
  local plyData = ESX.GetPlayerData()

  local craftingItems = {}
  local knownRecipes = {}
  for k,v in pairs(plyData.inventory) do
    if self.CraftingItems[v.name] and v.count > 0 then
      table.insert(craftingItems,{name = v.name, count = v.count})
    end

    local st,fn = string.find(v.name,"recipe_")
    local hasRecipe = false
    if st and fn and v.count and v.count > 0 then
      hasRecipe = true
      table.insert(knownRecipes,string.sub(v.name,fn+1))
    end

    if not hasRecipe and st and fn then
      if self.Learned[string.sub(v.name,fn+1)] then
        table.insert(knownRecipes,string.sub(v.name,fn+1))
      end
    end
  end

  self.Open = not self.Open;
  SendNUIMessage({
    type = 'openUI',
    enable = self.Open,
    require = self.RequireRecipes;
    recipes = Recipes,
    items = craftingItems,
    knownRecipes = knownRecipes,
  });
  if self.Open == true then
    print("open is true")
  end
  SetNuiFocus(self.Open,self.Open);

  if self.Crafting and not self.Open then self.Crafting = false; end
  if self.Crafting == false then
    print("crafting is false")
  end
end

function crafting:PostData(data)
  if data then
    local plyPed = GetPlayerPed(-1)
    self:DoUi()

    local dict = 'anim@amb@business@coc@coc_unpack_cut_left@'
    local anim = 'coke_cut_v5_coccutter'
    while not HasAnimDictLoaded(dict) do RequestAnimDict(dict) Citizen.Wait(0); end;

    local craftTime = (CraftTime[data] or 3.0)

    TaskPlayAnim(plyPed, dict, anim, 8.0, 8.0, craftTime * 1000, 1, 1.0, 0,0,0);
    exports['progressBars']:startUI(craftTime * 1000, "Crafting")
    Wait(craftTime * 1000)

    ClearPedTasksImmediately(plyPed)

    local plyInv = ESX.GetPlayerData().inventory
    local itemName
    for k,v in pairs(plyInv) do
      if v.name == data then
        itemName = v.label
      end
    end

    self.Crafting = false
    if itemName then
      local learn = false
      if self.LearnOnCraft and not self.Learned[data] then 
        learn = true
        self.Learned[data] = true
        ESX.ShowNotification("You learned the recipe for: "..itemName) 
      end
      TriggerServerEvent('crafting:TryCraft',data,itemName,learn)
    end
  end
end

function crafting:PlaceTable(...)
  local plyPed = GetPlayerPed(-1)
  local forward,right,up,pPos = GetEntityMatrix(plyPed)
  local pos = (pPos + forward)
  local heading = GetEntityHeading(plyPed)
  local location = vector4(pos.x,pos.y,pos.z-1.0,heading - 90.0)
  ESX.ShowNotification("You placed a Crafting Bench. Loading...")
  TriggerServerEvent('crafting:TablePlaced',location)
end

function crafting:SyncTables(data)
  self.CraftingTables = data
end

function crafting:CraftRespond(response,label,items)
  if response then
    ESX.ShowNotification("You crafted: "..label)
  else
    ESX.ShowNotification("You failed to craft: "..label)
    for k,v in pairs(items) do
      ESX.ShowNotification(v)
    end
  end
end
--[[
function crafting:LeaveTable()

end
--]]
RegisterNetEvent('crafting:PlaceTable')
AddEventHandler('crafting:PlaceTable', function(...) crafting:PlaceTable(...); end)

RegisterNetEvent('crafting:CraftRespond')
AddEventHandler('crafting:CraftRespond', function(...) crafting:CraftRespond(...); end)

RegisterNetEvent('crafting:Respond')
AddEventHandler('crafting:Respond', function(...) crafting:Respond(...); end)

RegisterNetEvent('crafting:SyncTables')
AddEventHandler('crafting:SyncTables', function(...) crafting:SyncTables(...); end)

RegisterNUICallback('dopost', function(data, cb) crafting:PostData(data); if cb then cb(true); end; end)
RegisterNUICallback('close', function(data, cb) crafting:DoUi(); if cb then cb(true); end; end)

--RegisterNUICallback('leave', function(data, cb) crafting:DoUi(); if cb then cb(true); end; end)

Citizen.CreateThread(function(...) crafting:Awake(...); end)