Config              = {}
Config.DrawDistance = 100.0
Config.CopsRequired = 2
Config.BlipUpdateTime = 5000 --In milliseconds. I used it on 3000. If you want instant update, 50 is more than enough. Even 100 is good. I hope it doesn't kill FPS and the server.
Config.CooldownMinutes = 30
Config.Locale = 'en'
Config.ShowBlip = false

Config.Zones = {
	VehicleSpawner = {
		Pos   = {x = 759.01, y = -3195.18, z = 4.97},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Colour    = 6, --BLIP
		Id        = 229, --BLIP
	},
}

Config.VehicleSpawnPoint = {
      Pos   = {x = 767.71, y = -3195.20, z = 5.50},
      Size  = {x = 3.0, y = 3.0, z = 1.0},
      Type  = -1,
}

Config.Delivery = {
	--Desert
	--Trevor Airfield 9.22KM
	Delivery1 = {
		Pos      = {x = 3515, y = 3758.16, z = 29.68},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 28800,
		Cars = {'zentorno','t20','reaper','italigtb','pfister811'},
	},
	Delivery2 = {
		Pos      = {x = -1134.43, y = 2693.3, z = 18.23},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 28800,
		Cars = {'zentorno','t20','reaper','italigtb','pfister811'},
	},
	Delivery3 = {
		Pos      = {x = -127.26, y = 2793.48, z = 52.54},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 28800,
		Cars = {'zentorno','t20','reaper','italigtb','pfister811'},
	},
	--Lighthouse 9.61KM
	Delivery4 = {
		Pos      = {x = 2931.1 , y = 4630.58, z = 48.24},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 30500,
		Cars = {'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	Delivery5 = {
		Pos      = {x = 2133.91 , y = 4780.36, z = 40.4},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 30500,
		Cars = {'sultanrs','osiris','cyclone','ruston','turismor'},
	},
	--House in Paleto 12.94KM
	Delivery7 = {
		Pos      = {x = 1540.45, y = 6335.93, z = 23.77},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 34500,
		Cars = {'entityxf','sheava','gp1','vagner','neon'},
	},
	--Great Ocean Highway 10.47KM
	Delivery10 = {
		Pos      = {x = 93.3, y = 6358.15, z = 30.81},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 31700,
		Cars = {'nero','seven70','tempesta','xa21','raiden'},
	},
	--Marina Drive Desert 8.15KM
	Delivery13 = {
		Pos      = {x = 895.02, y = 3603.87, z = 31.72},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 33350,
		Cars = {'specter','comet5','nightshade','sc1','banshee2'},
	},
	-- need to change car 
	Delivery14 = {
		Pos      = {x = -440.84, y = 6142.46, z = 30.91},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 29400,
		Cars = {'specter','comet5','nightshade','sc1','banshee2'},
	},
	Delivery15 = {
		Pos      = {x = -511.92, y = 5261.18, z = 80.04},
		Size  = {x = 3.0, y = 3.0, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = 1,
		Payment  = 32200,
		Cars = {'specter','comet5','nightshade','sc1','banshee2'},
	},
}
