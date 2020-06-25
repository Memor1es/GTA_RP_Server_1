ESX                  = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)


AddEventHandler('esx_status:loaded', function(status)

  --strength
  TriggerEvent('esx_status:registerStatus', 'str', 0, '#8F15A5', 
    function(status) --is visable
      if status.val > 0 then
        return false  
      else
        return false 
      end
    end,
    function(status)  --per tick to do
      --status.remove(1500)
    end
  )
  --agility
  TriggerEvent('esx_status:registerStatus', 'agi', 0, '#8F15A5', 
    function(status) --is visable
      if status.val > 0 then
        return false  
      else
        return false 
      end
    end,
    function(status)  --per tick to do
      --status.remove(1500)
    end
  )
  --intelligence
  TriggerEvent('esx_status:registerStatus', 'int', 0, '#8F15A5', 
    function(status) --is visable
      if status.val > 0 then
        return false  
      else
        return false 
      end
    end,
    function(status)  --per tick to do
      --status.remove(1500)
    end
  )
  --luck
  TriggerEvent('esx_status:registerStatus', 'luk', 0, '#8F15A5', 
    function(status) --is visable
      if status.val > 0 then
        return false  
      else
        return false 
      end
    end,
    function(status)  --per tick to do
      --status.remove(1500)
    end
  )
--[[
	Citizen.CreateThread(function()

		while true do

			Wait(1000)

			TriggerEvent('esx_status:getStatus', 'drunk', function(status)
				
				if status.val > 0 then
					
          local start = true

          if IsAlreadyDrunk then
            start = false
          end

          local level = 0

          if status.val <= 250000 then
            level = 0
          elseif status.val <= 500000 then
            level = 1
          else
            level = 2
          end

          if level ~= DrunkLevel then
            Drunk(level, start)
          end

          IsAlreadyDrunk = true
          DrunkLevel     = level
				end

				if status.val == 0 then
          
          if IsAlreadyDrunk then
            Reality()
          end

          IsAlreadyDrunk = false
          DrunkLevel     = -1

				end

			end)

		end

	end)--]]

end)


RegisterNetEvent('esx_gift_tree:setstr')
AddEventHandler('esx_gift_tree:setstr', function(value)
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'str', value)

end)

RegisterNetEvent('esx_gift_tree:setint')
AddEventHandler('esx_gift_tree:setint', function(value)
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'int', value)

end)

RegisterNetEvent('esx_gift_tree:setagi')
AddEventHandler('esx_gift_tree:setagi', function(value)
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'agi', value)

end)

RegisterNetEvent('esx_gift_tree:setluk')
AddEventHandler('esx_gift_tree:setluk', function(value)
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'luk', value)

end)

RegisterNetEvent('esx_gift_tree:randomluk')
AddEventHandler('esx_gift_tree:randomluk', function(floor, ceil)
  -- restore hunger & thirst
  local luck = math.random(floor,ceil)
	TriggerEvent('esx_status:set', 'luk', luck)
  TriggerEvent('esx_ability:setText','獲得了天分點數' .. luck)
end)