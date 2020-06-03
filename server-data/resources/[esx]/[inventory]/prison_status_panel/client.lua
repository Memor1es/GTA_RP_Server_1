ESX = nil
Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj)
            ESX = obj
        end)
        Citizen.Wait(10)
    end
end)

local prisonStatusPanelIsOpen = true
TriggerEvent('chat:addSuggestion', '/prisonstatusui', 'open/close prison status ui')
RegisterCommand('prisonstatusui', function(source, args, rawCommand)
  if prisonStatusPanelIsOpen then
    TriggerEvent("prison_status:close")
  else
    TriggerEvent("prison_status:open")
  end
  TriggerEvent("MF_SkeletalSystem:openSkelly")
end)

Citizen.CreateThread(function()
  TriggerEvent("prison_status:close")
  while true do
    Citizen.wait(1000)
    if prisonStatusPanelIsOpen then
      if IsControlJustPressed(1, 322) then
        TriggerEvent("prison_status:close")
      end
      updateStatus()
    end
  end
end)

RegisterNetEvent("prison_status:open")
AddEventHandler("prison_status:open", function() 
  updateStatus()
  SendNUIMessage({action: 'open'})
  prisonStatusPanelIsOpen = true
  SetNuiFocus(true, true)
end)

RegisterNetEvent("prison_status:close")
AddEventHandler("prison_status:close", function() 
  SendNUIMessage({action: 'close'})
  prisonStatusPanelIsOpen = false
  SetNuiFocus(false, false)
end)

RegisterNetEvent("prison_status:update_bone")
AddEventHandler("prison_status:update_bone", function(data)
  updateBoneStatus(data)
end)

function updateStatus ()
  local ped = PlayerPedId()
  local health = GetEntityHealth(ped)
  local armor = GetPedArmour(ped)
  local canlearn = {}

  TriggerEvent('esx_status:getStatus', 'hunger', function(status)
    food = status.val / 10000
  end)

  TriggerEvent('esx_status:getStatus', 'thirst', function(status)
    thirst = status.val / 10000
  end)

  TriggerEvent('esx_status:getStatus', 'drug', function(status)
    drugs = status.val / 10000
  end)

  TriggerEvent('esx_status:getStatus', 'drunk', function(status)
    drunk = status.val / 10000
  end)
  --gift tree
  TriggerEvent('esx_status:getStatus', 'str', function(status)
    str = status.val 
  end)

  TriggerEvent('esx_status:getStatus', 'agi', function(status)
    agi = status.val 
  end)

  TriggerEvent('esx_status:getStatus', 'int', function(status)
    int = status.val 
  end)

  TriggerEvent('esx_status:getStatus', 'luk', function(status)
    luk = status.val 
  end)

  for k,v in ipairs(Config.AbilityList) do
    if str>v.str and int>v.int and agi>v.agi and luk>v.luk then
      table.insert(canlearn,k)
    end
  end

  if #canlearn then
    SendNUIMessage({
      action = 'update'
      heal = health,
      armor = armor,
      thirst = thirst,
      food = food,
      drugs = drugs,
      drunk = drunk,
      str = str,
      agi = agi,
      int = int,
      luk = luk
      canlearn = canlearn
    })
  else
    SendNUIMessage({
      action = 'update'
      heal = health,
      armor = armor,
      thirst = thirst,
      food = food,
      drugs = drugs,
      drunk = drunk,
      str = str,
      agi = agi,
      int = int,
      luk = luk
    })
  end
end

function updateBoneStatus (data)
  SendNUIMessage({
    action:'update_bone',
    bone: data
  })
end
