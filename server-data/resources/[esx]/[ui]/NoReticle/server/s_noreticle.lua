local Staff = 
{
	"steam:HEXID HERE",
	"steam:HEXID HERE"
}
RegisterServerEvent('testnoreticle')
AddEventHandler('testnoreticle', function(ID)
	local identifiers = GetPlayerIdentifiers(source)
	for i = 1, #identifiers do
		for s = 1, #Staff do
			if Staff[s] == identifiers[i] then 
					TriggerClientEvent('nrcallback', ID, true)
				return true -- Just To End
			end
		end
	end
	TriggerClientEvent('nrcallback', ID, false)
	return false -- Just To End
end)