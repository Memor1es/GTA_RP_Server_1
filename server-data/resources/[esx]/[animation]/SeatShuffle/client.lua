Citizen.CreateThread(function()

while true do
Citizen.Wait(0)
local ped = GetPlayerPed( -1 )
local vehicle = GetVehiclePedIsIn( ped, false )
local passenger = GetPedInVehicleSeat(vehicle, 0)

  if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
  	if ( IsPedSittingInAnyVehicle( ped ) ) then
  		if IsVehicleSeatFree(vehicle, -1) then
  			if ped == passenger then
  				SetPedIntoVehicle(ped, vehicle, 0)
  			end
  		end
  	end
  end
end
end)