Config = {}
Config.Locale = 'en'
Config.IncludeCash = true -- Include cash in inventory?
Config.IncludeWeapons = true -- Include weapons in inventory?
Config.IncludeAccounts = true -- Include accounts (bank, black money, ...)?
Config.ExcludeAccountsList = {"bank"} -- List of accounts names to exclude from inventory
Config.OpenControl = 289 -- Key for opening inventory. Edit html/js/config.js to change key for closing it.

Config.LimitItems = 27

-- List of item names that will close ui when used
Config.CloseUiItems = {"headbag", "fishingrod","whitepaper", "radio","lockpick","petcontrol", "guitar2", "guitar3", "guitar4", "refpetroil", "RIFLE_BULLET", "SMG_BULLET", "SHOTGUN_BULLET", "SNIPER_BULLET", "PISTOL_BULLET"}

Config.ShopBlipID = 52
Config.LiquorBlipID = 93
--Config.YouToolBlipID = 402
Config.PrisonShopBlipID = 110
Config.WeedStoreBlipID = 140
--Config.WeaponShopBlipID = 110

Config.ShopLength = 14
--Config.LiquorLength = 10
Config.YouToolLength = 2
Config.PrisonShopLength = 2

Config.Color = 2
Config.WeaponColor = 1

Config.WeaponLiscence = {x = 451.07, y = -976.33, z = 30.69}
Config.LicensePrice = 15000

Config.Shops = {
    RegularShop = {
        Locations = {
			{x = 373.875,   y = 325.896,  z = 102.566},
			{x = 2557.458,  y = 382.282,  z = 107.622},
			{x = -3038.939, y = 585.954,  z = 6.908},
			{x = -3241.927, y = 1001.462, z = 11.830},
			{x = 547.431,   y = 2671.710, z = 41.156},
			{x = 1961.464,  y = 3740.672, z = 31.343},
			{x = 2678.916,  y = 3280.671, z = 54.241},
            {x = 1729.216,  y = 6414.131, z = 34.037},
            {x = -48.519,   y = -1757.514, z = 28.421},
			{x = 1163.373,  y = -323.801,  z = 68.205},
			{x = -707.501,  y = -914.260,  z = 18.215},
			{x = -1820.523, y = 792.518,   z = 137.118},
            {x = 1698.388,  y = 4924.404,  z = 41.063},
            {x = 25.723,   y = -1346.966, z = 28.497}, 
        },
        Items = {
            {name = 'water'},
            {name = 'icetea'},
            {name = 'sumol'},
            {name = 'fanta'},
            {name = 'whiskycoca'},
            {name = 'wine'},
            {name = 'whisky'},
            {name = 'superbock'},
            {name = 'mateurose'},
            {name = 'vporto'},
            {name = 'champanhe'},
            {name = 'vodkpur'},
            {name = 'pasteldenata'},
            {name = 'bread'},
            {name = 'chickensandwich'},
            {name = 'heartstopper'},
            {name = 'cigarette'},
            {name = 'hifi'},
            {name = 'oxycutter'},
            {name = 'net_cracker'},
            {name = 'phone'},
            {name = 'cuffs'},
            {name = 'cuff_keys'},
			{name = 'contract'},
            {name = 'advancedlockpick'},
            {name = 'lockpick'}
        }
    },

    RobsLiquor = {
		Locations = {
			{x = 1135.808,  y = -982.281,  z = 45.415},
			{x = -1222.915, y = -906.983,  z = 11.326},
			{x = -1487.553, y = -379.107,  z = 39.163},
			{x = -2968.243, y = 390.910,   z = 14.043},
			{x = 1166.024,  y = 2708.930,  z = 37.157},
			{x = 1392.562,  y = 3604.684,  z = 33.980}
        },
        Items = {
            {name = 'water'},
            {name = 'icetea'},
            {name = 'sumol'},
            {name = 'fanta'},
            {name = 'whiskycoca'},
            {name = 'wine'},
            {name = 'whisky'},
            {name = 'superbock'},
            {name = 'mateurose'},
            {name = 'vporto'},
            {name = 'champanhe'},
            {name = 'vodkpur'},
            {name = 'pasteldenata'},
            {name = 'bread'},
            {name = 'chickensandwich'},
            {name = 'heartstopper'},
            {name = 'cigarette'},
            {name = 'hifi'},
            {name = 'oxycutter'},
            {name = 'net_cracker'},
            {name = 'phone'},
            {name = 'cuffs'},
            {name = 'cuff_keys'},
			{name = 'contract'},
            {name = 'advancedlockpick'},
            {name = 'lockpick'}
        }
	},

    YouTool = {
        Locations = {
            --{x = 2748.0, y = 3473.0, z = 55.68},
        },
        Items = {
            {name = 'water'},
            {name = 'icetea'},
            {name = 'sumol'},
            {name = 'fanta'},
            {name = 'whiskycoca'},
            {name = 'wine'},
            {name = 'whisky'},
            {name = 'superbock'},
            {name = 'mateurose'},
            {name = 'vporto'},
            {name = 'champanhe'},
            {name = 'vodkpur'},
            {name = 'pasteldenata'},
            {name = 'bread'},
            {name = 'chickensandwich'},
            {name = 'heartstopper'},
            {name = 'cigarette'},
            {name = 'hifi'},
            {name = 'oxycutter'},
            {name = 'net_cracker'},
            {name = 'phone'},
            {name = 'cuffs'},
            {name = 'cuff_keys'},
			{name = 'contract'},
            {name = 'advancedlockpick'},
            {name = 'lockpick'}
        }
    },

    PrisonShop = {
        Locations = {
            {x = 18.33, y = -1111.24, z = 29.80},
        },
        Items = {
            {name = "bulletproof"},
            {name = "yusuf"},
            {name = "grip"},
			{name = "clip"},
            {name = "flashlight"},
            {name = "silencieux"},
            {name = "oxygenmask"}
        }
    },

    WeaponShop = {
        Locations = {
            --{ x = 18.33, y = -1111.24, z = 28.80 },
        },
        Weapons = {
            --{name = "bulletproof"},
           -- {name = "yusuf"},
            --{name = "grip"},
           -- {name = "flashlight"},
            --{name = "silencieux"},
            --{name = "oxygenmask"}
        },
        Ammo = {
            --{name = "9mm_rounds", weaponhash = "WEAPON_PISTOL", ammo = 24},
            --{name = "shotgun_shells", weaponhash = "WEAPON_PUMPSHOTGUN", ammo = 12}
        },
        Items = {

        }
    },
}