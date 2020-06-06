Config               = {}

Config.DrawDistance  = 1000
Config.Size          = { x = 2.5, y = 2.5, z = 0.5 }
Config.Color         = { r = 0, g = 128, b = 255, a = 0 }
Config.Type          = 1

Config.Locale        = 'tc'

Config.LicenseEnable = false -- only turn this on if you are using esx_license
Config.LicensePrice  = 5000

Config.Zones = {
	
	GunShop2 = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(94.14,-1291.45,29.27),
		}
	},

	GunShop = {
		Legal = true,
		Items = {},
		Locations = {
			vector3(-659.75, -936.17, 20.83),
			vector3(810.62, -2159.38, 28.62),
			vector3(1695.87, 3761.1, 33.71),
			vector3(-327.88, 6084.83, 30.45),
			vector3(250.36, -51.95, 68.94),
			vector3(22.65, -1105.23, 28.8),
			vector3(2565.34, 295.46, 107.73),
			vector3(-1115.24, 2699.28, 17.55),
			vector3(839.91, -1032.4, 27.19),
			vector3(-1307.43, -396.39, 35.7)
		}
	},

	BlackWeashop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(94.14,-1291.45,29.27)
		}
	},

	MysteryShop = {
		Legal = false,
		Items = {},
		Locations = {
			vector3(-587.94,293.45,89.2),
		}
	}

}
