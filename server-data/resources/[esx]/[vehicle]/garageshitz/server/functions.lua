UpdateGarage = function(vehicleProps, newGarage)
	local sqlQuery = [[
		UPDATE
			owned_vehicles
		SET
			garage = @garage, vehicle = @newVehicle, `stored`='1'
		WHERE
			plate = @plate
	]]

	MySQL.Async.execute(sqlQuery, {
		["@plate"] = vehicleProps["plate"],
		["@garage"] = newGarage,
		["@newVehicle"] = json.encode(vehicleProps)
	}, function(rowsChanged)
		if rowsChanged > 0 then
			
		end
	end)
end