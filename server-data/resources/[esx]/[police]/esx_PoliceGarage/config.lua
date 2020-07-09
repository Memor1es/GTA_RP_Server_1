--------------------------------
------- Created by Hamza -------
-------------------------------- 

Config = {}

Config.Locale = 'fr'

Config.KeyToOpenCarGarage = 38			-- default 38 is E
Config.KeyToOpenHeliGarage = 38			-- default 38 is E
Config.KeyToOpenBoatGarage = 38			-- default 38 is E
Config.KeyToOpenExtraGarage = 38		-- default 38 is E

Config.PoliceDatabaseName = 'police'	-- set the exact name from your jobs database for police

--Police Car Garage:
Config.CarZones = {
	PoliceCarGarage = {
		Pos = {
			{x = 453.63,  y = -1017.6, z = 28.45},
		}
	}
}

--Police Heli Garage:
Config.HeliZones = {
	PoliceHeliGarage = {
		Pos = {
			{x = 448.65,  y = -981.25, z = 43.69},
			{x = 632.216,  y = -156.131, z = 54.037}
		}
	}
}

--Police Boat Garage:
Config.BoatZones = {
	PoliceBoatGarage = {
		Pos = {
			{x = 1538.69,  y = 3901.5, z = 30.35},
			{x = 2000.42,  y = 4500, z = 33.437}
		}
	}
}

--Police Car Garage Blip Settings:
Config.CarGarageSprite = 357
Config.CarGarageDisplay = 4
Config.CarGarageScale = 0.65
Config.CarGarageColour = 38
Config.CarGarageName = "Politsei Garaaz"
Config.EnableCarGarageBlip = false

-- Police Heli Garage Blip Settings:
Config.HeliGarageSprite = 43
Config.HeliGarageDisplay = 4
Config.HeliGarageScale = 0.65
Config.HeliGarageColour = 38
Config.HeliGarageName = "Politsei helikopter"
Config.EnableHeliGarageBlip = false

-- Police Boat Garage Blip Settings:
Config.BoatGarageSprite = 427
Config.BoatGarageDisplay = 4
Config.BoatGarageScale = 0.65
Config.BoatGarageColour = 38
Config.BoatGarageName = "Politsei Paat"
Config.EnableBoatGarageBlip = false

-- Police Extra Menu Blip Settings:
Config.ExtraGarageSprite = 566
Config.ExtraGarageDisplay = 4
Config.ExtraGarageScale = 0.65
Config.ExtraGarageColour = 38
Config.ExtraGarageName = "Auto Lisad"
Config.EnableExtraGarageBlip = false

-- Police Car Garage Marker Settings:
Config.PoliceCarMarker = 27 												-- marker type
Config.PoliceCarMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 			-- rgba color of the marker
Config.PoliceCarMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.CarDraw3DText = "[E] 打開車庫"			-- set your desired text here

-- Police Heli Garage Marker Settings:
Config.PoliceHeliMarker = 27 												-- marker type
Config.PoliceHeliMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.PoliceHeliMarkerScale = { x = 5.5, y = 5.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.HeliDraw3DText = "[E] 打開車庫"		-- set your desired text here

-- Police Boat Garage Marker Settings:
Config.PoliceBoatMarker = 27 												-- marker type
Config.PoliceBoatMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.PoliceBoatMarkerScale = { x = 3.0, y = 3.0, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.BoatDraw3DText = "[E] 打開車庫"		-- set your desired text here

-- Police Extra Garage Marker Settings:
Config.PoliceExtraMarker = 27 												-- marker type
Config.PoliceExtraMarkerColor = { r = 50, g = 50, b = 204, a = 100 } 		-- rgba color of the marker
Config.PoliceExtraMarkerScale = { x = 2.5, y = 2.5, z = 1.0 }  				-- the scale for the marker on the x, y and z axis
Config.ExtraDraw3DText = "按下 ~g~[E]~s~ ~y~其他選單~s~"		-- set your desired text here

-- Police Cars:
Config.PoliceVehicles = {
		{ model = '', label = '-----Voitures-----'},
		{ model = 'police', label = 'Cruiser'},
		{ model = 'police2', label = 'Buffalo'},
		{ model = 'police3', label = 'Interceptor'},
		{ model = 'police4', label = 'Cruiser Unmarked'},
		{ model = 'fbi', label = 'Buffalo Unmarked'},
		{ model = 'fbi2', label = 'SUV Unmarked'},
		{ model = '', label = '-----Motos--------'},		
		{ model = 'policeb', label = 'Moto'},		
		{ model = '', label = '-----Utilitaires--'},		
		{ model = 'sultan', label = 'Véhicule de Formation'},
		{ model = 'pbus', label = 'Police Prison Bus'},
		{ model = 'policet', label = 'Fourgon de transport'},
		{ model = 'riot', label = 'Fourgon Blindé'},
		{ model = 'riot2', label = 'Fourgon antiémeute'}		
}

-- Police Helicopters:
Config.PoliceHelicopters = {
	{ model = 'polmav', label = 'Police Maverick', livery = 0, price = 0 }
}

-- Police Boats:
Config.PoliceBoats = {
	{ model = 'predator', label = 'Police Predator', livery = 0, price = 0 }
}

-- Commands:
Config.RepairCommand = 'paranda'
Config.CleanCommand = 'puhasta'

-- Menu Labels & Titles:
Config.LabelStoreVeh = "歸還車輛"
Config.LabelGetVeh = "上車"
Config.TitlePoliceGarage = "車庫"

-- ESX.ShowNotifications:
Config.VehicleParked = "車輛已歸還!"
Config.NoVehicleNearby = "沒有車在附近!"
Config.CarOutFromPolGar = "拉出 ~b~車輛~s~~y~車庫~s~!"
Config.HeliOutFromPolGar = "拉出 ~b~直升機~s~~y~停機坪~s~!"
Config.BoatOutFromPolGar = "拉出 ~b~船~s~~y~船艙~s~!"
Config.VehRepNotify = "~b~車輛~s~~y~維修中~s~, 請稍後!"
Config.VehRepDoneNotify = "~b~車輛~s~~y~維修完成~s~!"
Config.VehCleanNotify = "~b~車輛~s~~y~清洗中~s~, 請稍後!"
Config.VehCleanDoneNotify = "~b~車輛~s~~y~清洗完成~s~!"

-- ProgressBars text
Config.Progress1 = "AUTO PARANDAMINE"
Config.Progress2 = "AUTO PUHASTAMINE"

-- ProgressBar Timers, in seconds:
Config.RepairTime = 5					-- time to repair vehicle
Config.CleanTime = 3.5					-- time to clean vehicle

Config.VehicleLoadText = "等待車輛"			-- text on screen when vehicle model is being loaded

-- Distance from garage marker to the point where /fix and /clean shall work
Config.Distance = 20

Config.DrawDistance      = 100.0
Config.TriggerDistance 	 = 3.0
Config.Marker 			 = {Type = 27, r = 0, g = 127, b = 22}

-- Police Extra Menu Positions:
Config.ExtraZones = {
	ExtraPositions = {
		Pos = {
			{x = 454.7,  y = -1024.32, z = 28.49},
			{x = 467.6,  y = 2530.54, z = 33.437}
		}
	}
}