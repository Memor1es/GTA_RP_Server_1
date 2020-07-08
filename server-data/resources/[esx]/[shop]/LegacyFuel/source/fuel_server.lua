ESX = nil

if Config.UseESX then
	TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

	RegisterServerEvent('fuel:pay')
	AddEventHandler('fuel:pay', function(price)
		local xPlayer = ESX.GetPlayerFromId(source)
		local amount = ESX.Math.Round(price)

		if price > 0 then
			xPlayer.removeMoney(amount)
			--xPlayer.addWeapon('WEAPON_PETROLCAN',4500)
		end
	end)

	RegisterServerEvent('fuel:getCan')
	AddEventHandler('fuel:getCan', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.addWeapon('WEAPON_PETROLCAN',4500)
	end)

	RegisterServerEvent('fuel:removeCan')
	AddEventHandler('fuel:removeCan', function()
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeWeapon('WEAPON_PETROLCAN')
	end)

	RegisterServerEvent('fuel:removeCanammo')
	AddEventHandler('fuel:removeCanammo', function(ammo)
		local xPlayer = ESX.GetPlayerFromId(source)
		xPlayer.removeWeaponAmmo('WEAPON_PETROLCAN',ammo)
	end)

end
