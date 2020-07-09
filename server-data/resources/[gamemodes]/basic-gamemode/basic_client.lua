AddEventHandler('onClientMapStart', function()
  exports.spawnmanager:setAutoSpawn(true)
  exports.spawnmanager:forceRespawn()
end)

AddEventHandler("playerSpawned", function()
	local ped = GetPlayerPed(-1)
	if GetPedMaxHealth(ped) ~= 200 and not IsEntityDead(ped) then
		SetPedMaxHealth(ped, 200)
		SetEntityHealth(ped, GetEntityHealth(ped) + 25)
	end
end)