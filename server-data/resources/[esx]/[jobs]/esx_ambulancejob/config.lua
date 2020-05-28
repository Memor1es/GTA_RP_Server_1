Config                            = {}

Config.DrawDistance               = 100.0

Config.Marker                     = { type = 1, x = 1.5, y = 1.5, z = 0.5, r = 0, g = 255, b = 128, a = 100, rotate = false }

Config.ReviveReward               = 200  -- revive reward, set to 0 if you don't want it enabled
Config.AntiCombatLog              = true -- enable anti-combat logging?
Config.LoadIpl                    = true -- disable if you're using fivem-ipl or other IPL loaders

Config.Locale                     = 'tc'

local second = 1000
local minute = 60 * second

Config.EarlyRespawnTimer          = 10 * minute  -- Time til respawn is available
Config.BleedoutTimer              = 30 * minute -- Time til the player bleeds out

Config.ReviveDuration			  = 5 * 1000

Config.EnablePlayerManagement     = false

Config.RemoveWeaponsAfterRPDeath  = false
Config.RemoveCashAfterRPDeath     = false
Config.RemoveItemsAfterRPDeath    = false

-- Let the player pay for respawning early, only if he can afford it.
Config.EarlyRespawnFine           = false
Config.EarlyRespawnFineAmount     = 5000

Config.RespawnPoint = { coords = vector3(355.0, -596, 27.79), heading = 48.5 }

Config.Hospitals = {

	CentralLosSantos = {

		Blip = {
			coords = vector3(301.94, -586.14, 42.29),
			sprite = 61,
			scale  = 1.2,
			color  = 2
		},
		--cloak room
		AmbulanceActions = {
			vector3(312.17, -603.23, 42.29)
			--vector3(336.1, -580.73, 27.79)
		},
		--藥店
		Pharmacies = {
			--vector3(341.02, -586.35, 27.79)
			vector3(316.09, -588.84, 42.29)
		},

		Vehicles = {
			{
				Spawner = vector3(314.55, -557.36, 28.74),
				InsideShop = vector3(446.7, -1355.6, 43.5), --not ok
				Marker = { type = 36, x = 1.0, y = 1.0, z = 1.0, r = 100, g = 50, b = 200, a = 100, rotate = true },
				SpawnPoints = {
					--{ coords = vector3(326.64, -555.3, 28.74), heading = 227.6, radius = 4.0 },
					--{ coords = vector3(335.87, -558.24, 28.74), heading = 227.6, radius = 4.0 },
					--{ coords = vector3(343.54, -560.91, 28.74), heading = 227.6, radius = 6.0 }
					{ coords = vector3(327.02, -564.1, 28.78), heading = 338.62, radius = 4.0 },
					{ coords = vector3(337.55, -570.77, 28.8), heading = 338.62, radius = 4.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(338.55, -588.12, 74.17),
				InsideShop = vector3(341.9, -581.42, 74.17),
				Marker = { type = 34, x = 1.5, y = 1.5, z = 1.5, r = 100, g = 150, b = 150, a = 100, rotate = true },
				SpawnPoints = {
					{ coords = vector3(352.69, -583.15, 74.14), heading = 142.7, radius = 10.0 },
					{ coords = vector3(351.01, -592.09, 74.17), heading = 142.7, radius = 10.0 }
				}
			}
		},

		FastTravels = {
		},

		FastTravelsPrompt = {
		}

	}
}

Config.AuthorizedVehicles = {

	ambulance = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 5000}
	},

	doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 4500}
	},

	chief_doctor = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 3000}
	},

	boss = {
		{ model = 'ambulance', label = 'Ambulance Van', price = 2000}
	}

}

Config.AuthorizedHelicopters = {

	ambulance = {},

	doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 }
	},

	chief_doctor = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 150000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 300000 }
	},

	boss = {
		{ model = 'buzzard2', label = 'Nagasaki Buzzard', price = 10000 },
		{ model = 'seasparrow', label = 'Sea Sparrow', price = 250000 }
	}

}
