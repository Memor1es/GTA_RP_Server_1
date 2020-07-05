Config                            = {}

Config.DrawDistance               = 100.0
Config.MarkerType                 = 1
Config.MarkerSize                 = { x = 1.5, y = 1.5, z = 0.5 }
Config.MarkerColor                = { r = 50, g = 50, b = 204 }

Config.EnablePlayerManagement     = true
Config.EnableArmoryManagement     = true
Config.EnableESXIdentity          = true -- enable if you're using esx_identity
Config.EnableNonFreemodePeds      = false -- turn this on if you want custom peds
Config.EnableLicenses             = false -- enable if you're using esx_license

Config.EnableHandcuffTimer        = false -- enable handcuff timer? will unrestrain player after the time ends
Config.HandcuffTimer              = 10 * 60000 -- 10 mins

Config.EnableJobBlip              = true -- enable blips for colleagues, requires esx_society

Config.MaxInService               = -1
Config.Locale                     = 'tc'

Config.LeaveKey                   = "H"

Config.PoliceStations = {

	LSPD = {

		Blip = {
			Coords  = vector3(425.1, -979.5, 30.7),
			Sprite  = 60,
			Display = 4,
			Scale   = 1.2,
			Colour  = 29
		},

		Cloakrooms = {
			vector3(452.6, -992.8, 30.6),
			vector3(1850.88, 3693.43, 34.27),
			vector3(-435.45, 6004.5, 31.72)
		},

		Armories = {
			vector3(451.7, -980.1, 30.6),
			vector3(1842.62, 3691.62, 34.27),
			vector3(-438.33, 5988.58, 31.72)
		},

		Vehicles = {
			{
				Spawner = vector3(454.6, -1017.4, 28.4),
				InsideShop = vector3(228.5, -993.5, -99.5),
				SpawnPoints = {
					{ coords = vector3(438.4, -1018.3, 27.7), heading = 90.0, radius = 6.0 },
					{ coords = vector3(441.0, -1024.2, 28.3), heading = 90.0, radius = 6.0 },
					{ coords = vector3(453.5, -1022.2, 28.0), heading = 90.0, radius = 6.0 },
					{ coords = vector3(450.9, -1016.5, 28.1), heading = 90.0, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(473.3, -1018.8, 28.0),
				InsideShop = vector3(228.5, -993.5, -99.0),
				SpawnPoints = {
					{ coords = vector3(475.9, -1021.6, 28.0), heading = 276.1, radius = 6.0 },
					{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(1859.86, 3676.98, 33.65),
				InsideShop = vector3(1859.86, 3676.98, 33.65),
				SpawnPoints = {
					{ coords = vector3(1855.18, 3672.61, 33.68), heading = 276.1, radius = 6.0 },
					--{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(-459.57, 6030.55, 31.34),
				InsideShop = vector3(-459.57, 6030.55, 31.34),
				SpawnPoints = {
					{ coords = vector3(-456.24, 6039.64, 31.34), heading = 134.22, radius = 6.0 },
					{ coords = vector3(-459.04, 6042.94, 31.34), heading = 134.22, radius = 6.0 },
					{ coords = vector3(-462.22, 6045.99, 31.34), heading = 134.22, radius = 6.0 },
					--{ coords = vector3(484.1, -1023.1, 27.5), heading = 302.5, radius = 6.0 }
				}
			},

			{
				Spawner = vector3(543.79, -33.31, 72.14),
				InsideShop = vector3(543.79, -33.31, 72.14),
				SpawnPoints = {
					{ coords = vector3(534.28, -26.38, 70.63), heading = 205.71, radius = 6.0 },
					{ coords = vector3(529.28, -28.98, 70.63), heading = 205.71, radius = 6.0 }
				}
			}
		},

		Helicopters = {
			{
				Spawner = vector3(461.1, -981.5, 43.6),
				InsideShop = vector3(477.0, -1106.4, 43.0),
				SpawnPoints = {
					{ coords = vector3(449.5, -981.2, 43.6), heading = 92.6, radius = 10.0 }
				}
			}
		},

		BossActions = {
			vector3(448.4, -973.2, 30.6),
			vector3(1861.31, 3688.84, 34.27),
			vector3(-437.66, 5999.38, 31.72)
		}

	}

}

Config.AuthorizedWeapons = {
	recruit = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 1500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 80 }
	},

	officer = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	sergeant = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	intendent = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	lieutenant = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	chef = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		--{ weapon = 'WEAPON_ADVANCEDRIFLE', components = { 0, 6000, 1000, 4000, 8000, nil }, price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},

	boss = {
		{ weapon = 'WEAPON_PISTOL50', components = { 0, 0, 1000, 4000, nil }, price = 10000 },
		{ weapon = 'WEAPON_FLAREGUN', price = 50000 },
		--{ weapon = 'WEAPON_PUMPSHOTGUN', components = { 2000, 6000, nil }, price = 70000 },
		{ weapon = 'WEAPON_NIGHTSTICK', price = 0 },
		{ weapon = 'GADGET_PARACHUTE', price = 5000 },
		{ weapon = 'WEAPON_STUNGUN', price = 500 },
		--{ weapon = 'WEAPON_FLASHLIGHT', price = 0 }
	},
}

Config.AuthorizedVehicles = {
	Shared = {
		{ model = 'police', label = 'Police Cruiser', price = 5000 },
		{ model = 'police2', label = 'Police Cruiser', price = 5000 },
		{ model = 'police3', label = 'Police Cruiser', price = 5000 },
		{ model = 'pbus', label = 'Police Prison Bus', price = 5000 },
		--{ model = 'policelte', label = 'Police Policelte', price = 300000 },
		{ model = 'policesuv', label = 'Police Policesuv', price = 20000 },
		{ model = 'policemb', label = 'Police policemb', price = 20000},
	},

	recruit = {

	},

	officer = {
		
	},

	sergeant = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 },
	},

	intendent = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 }
	},

	lieutenant = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 },
		{ model = 'riot', label = 'Police Riot', price = 70000 },
		{ model = 'fbi2', label = 'FIB SUV', price = 60000 },
	},

	chef = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 },
		{ model = 'riot', label = 'Police Riot', price = 70000 },
		{ model = 'fbi2', label = 'FIB SUV', price = 60000 }
	},

	boss = {
		{ model = 'policet', label = 'Police Transporter', price = 18500 },
		{ model = 'policeb', label = 'Police Bike', price = 30500 },
		{ model = 'riot', label = 'Police Riot', price = 70000 },
		{ model = 'fbi2', label = 'FIB SUV', price = 60000 }
	}
}

Config.AuthorizedHelicopters = {
	recruit = {},

	officer = {},

	sergeant = {},

	intendent = {},

	lieutenant = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 800000 }
	},

	chef = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 500000 }
	},

	boss = {
		{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 400000 }
	}
}

-- CHECK SKINCHANGER CLIENT MAIN.LUA for matching elements

Config.Uniforms = {
	recruit_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = 46,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = 45,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	officer_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 0,   ['decals_2'] = 0,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	sergeant_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 1,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 1,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	intendent_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	lieutenant_wear = { -- currently the same as intendent_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 2,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 2,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	chef_wear = {
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	boss_wear = { -- currently the same as chef_wear
		male = {
			['tshirt_1'] = 58,  ['tshirt_2'] = 0,
			['torso_1'] = 55,   ['torso_2'] = 0,
			['decals_1'] = 8,   ['decals_2'] = 3,
			['arms'] = 41,
			['pants_1'] = 25,   ['pants_2'] = 0,
			['shoes_1'] = 25,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 35,  ['tshirt_2'] = 0,
			['torso_1'] = 48,   ['torso_2'] = 0,
			['decals_1'] = 7,   ['decals_2'] = 3,
			['arms'] = 44,
			['pants_1'] = 34,   ['pants_2'] = 0,
			['shoes_1'] = 27,   ['shoes_2'] = 0,
			['helmet_1'] = -1,  ['helmet_2'] = 0,
			['chain_1'] = 0,    ['chain_2'] = 0,
			['ears_1'] = 2,     ['ears_2'] = 0,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	},
	bullet_wear = {
		male = {
			['bproof_1'] = 11,  ['bproof_2'] = 1
		},
		female = {
			['bproof_1'] = 13,  ['bproof_2'] = 1
		}
	},
	gilet_wear = {
		male = {
			['tshirt_1'] = 59,  ['tshirt_2'] = 1,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		},
		female = {
			['tshirt_1'] = 36,  ['tshirt_2'] = 1,
			['bproof_1'] = 0,  ['bproof_2'] = 0  --add
		}
	}

}