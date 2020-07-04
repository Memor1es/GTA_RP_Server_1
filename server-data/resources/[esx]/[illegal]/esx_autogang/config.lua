Config = {}
Config.DebugMode = false
Config.DispatchSquads = {
    Ballas = {
        Name = "Ballas",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_BALLAS")
        },
        EnemiesWith = { -- corresponds with esx player job
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89, -- number cooresponts to https://runtime.fivem.net/doc/natives/?_0x1374ABB7C15BAB92
        NumberOfWaves = 5,
        NumberPerWave = 5,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(111.25, -1946.97, 20.74),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_m_y_ballaeast_01'),
            GetHashKey('g_m_y_ballaorig_01'),
            GetHashKey('g_m_y_ballasout_01'),
            GetHashKey('csb_ballasog')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_bat'), type='melee'}
        },
        NPCSpawnPoints = {
            {x=85.85, y=-1958.51, z=21.53, h=317.02},
            {x=78.85, y=-1947.51, z=21.53, h=280.02},
            {x=81.85, y=-1942.51, z=20.53, h=289.02},
            {x=97.85, y=-1916.51, z=20.53, h=154.02},
            {x=116.85, y=-1922.51, z=20.53, h=140.02},
            {x=124.85, y=-1929.64, z=20.53, h=110.02},
            {x=126.85, y=-1942.64, z=20.53, h=86.02},
            {x=112.85, y=-1959.64, z=20.53, h=18.02},
            {x=108.65, y=-1971.64, z=20.53, h=107.02},
            {x=93.65, y=-1976.64, z=20.53, h=64.02},
            {x=85.65, y=-1967.64, z=20.53, h=228.02},
            {x=74.65, y=-1936.64, z=20.53, h=310.02},
            {x=121.65, y=-1935.64, z=20.53, h=104.02}
        },
    },
    Vagos = {
        Name = "Vagos",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 5,
        NumberPerWave = 5,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(332.86, -2039.41, 20.78),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=326.17, y=-2049.51, z=20.02, h=317.13},
            {x=317.17, y=-2042.51, z=20.02, h=325.13},
            {x=314.17, y=-2039.51, z=20.02, h=317.13},
            {x=299.17, y=-2034.51, z=19.02, h=317.13},
            {x=331.17, y=-2020.51, z=21.02, h=151.13},
            {x=334.17, y=-2023.51, z=21.02, h=136.13},
            {x=342.17, y=-2028.51, z=21.02, h=140.13},
            {x=343.17, y=-2030.51, z=21.02, h=138.13},
            {x=351.17, y=-2036.51, z=22.02, h=138.13},
            {x=359.17, y=-2043.51, z=22.02, h=133.13},
            {x=363.17, y=-2046.51, z=22.02, h=125.13},
            {x=370.17, y=-2055.51, z=21.02, h=49.13},
            {x=363.17, y=-2064.51, z=21.02, h=45.13},
            {x=356.17, y=-2073.51, z=21.02, h=47.13},
            {x=356.17, y=-2073.51, z=21.02, h=47.13},
            {x=346.17, y=-2066.51, z=20.02, h=322.13},
            {x=343.17, y=-2063.51, z=20.02, h=314.13}
        },
    },
    Bar = {
        Name = "Bar",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 3,
        NumberPerWave = 2,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(153.89, -1296.59, 29.01),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=167.89, y=-1293.82, z=29.45, h=317.13},
            {x=161.06, y=-1309.68, z=34.34, h=325.13},
            {x=170.32, y=-1301.92, z=35.46, h=59.61},
            {x=167.84, y=-1290.92, z=35.02, h=317.13},
            {x=157.59, y=-1317.87, z=29.19, h=151.13},
            {x=169.35, y=-1270.46, z=29.2, h=136.13},
            {x=161.35, y=-1266.46, z=29.2, h=136.13},
            {x=154.35, y=-1274.46, z=29.2, h=136.13},
            {x=157.06, y=-1315.68, z=34.34, h=325.13},
            {x=169.8, y=-1301.43, z=35.46, h=73.29},
            {x=169.06, y=-1284.14, z=35.02, h=94.07},
            {x=139.15, y=-1292.44, z=29.2, h=136.13},
            {x=129.22, y=-1298.59, z=29.2, h=136.13},
            {x=117.1, y=-1306.37, z=29.2, h=136.13},
            {x=117.49, y=-1281.37, z=28.27, h=136.13},
            {x=125.08, y=-1281.58, z=29.28, h=136.13},
            {x=133.09, y=-1293.73, z=29.2, h=136.13},
        },
    },
    MidBar = {
        Name = "MidBar",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 3,
        NumberPerWave = 2,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(1999.12, 3066.11, 47.05),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=1980.12, y=3061.42, z=47.14, h=317.13},
            {x=1980.37, y=3068.26, z=47.14, h=317.13},
            {x=1980.12, y=3061.42, z=47.14, h=317.13},
            {x=2005.94, y=3047.37, z=47.14, h=317.13},
            {x=2014.22, y=3051.7, z=47.14, h=317.13},
            {x=1986.04, y=3055.75, z=47.14, h=317.13},
            {x=1996.31, y=3048.68, z=47.14, h=317.13},
            {x=1992.69, y=3044.17, z=47.14, h=317.13},
            {x=1982.07, y=3052.02, z=47.14, h=317.13},
            {x=2022.0, y=3069.38, z=47.16, h=317.13},
            {x=2020.92, y=3072.24, z=47.17, h=317.13},
            {x=2004.88, y=3081.88, z=47.06, h=317.13},
            {x=1985.31, y=3092.39, z=46.96, h=317.13},
            {x=1976.57, y=3062.78, z=47.14, h=317.13},
            {x=1977.7, y=3065.74, z=47.14, h=317.13},
            {x=2012.81, y=3045.62, z=47.14, h=317.13},
            {x=2010.45, y=3042.52, z=47.14, h=317.13},
        },
    },
    Villa = {
        Name = "Villa",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 3,
        NumberPerWave = 2,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(1999.12, 3066.11, 47.05),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=24.85, y=541.34, z=176.03, h=317.13},
            {x=5.1, y=539.04, z=179.66, h=317.13},
            {x=11.72, y=536.5, z=179.56, h=317.13},
            {x=15.09, y=537.6, z=179.56, h=317.13},
            {x=24.86, y=540.59, z=179.56, h=317.13},
            {x=26.68, y=544.9, z=179.56, h=317.13},
            {x=17.45, y=527.11, z=178.61, h=317.13},
            {x=28.92, y=537.44, z=176.02, h=317.13},
            {x=1.07, y=533.75, z=175.34, h=317.13},
            {x=12.62, y=531.55, z=174.63, h=317.13},
            {x=-7.24, y=523.74, z=174.82, h=317.13},
            {x=8.49, y=575.58, z=184.12, h=317.13},
            {x=-3.79, y=568.93, z=187.21, h=317.13},
            {x=-12.43, y=565.44, z=186.39, h=317.13},
            {x=-4.73, y=538.14, z=173.89, h=317.13},
            {x=-16.45, y=552.51, z=175.17, h=317.13},
            {x=-18.15, y=558.05, z=180.58, h=317.13},
        },
    },
    Factory = {
        Name = "Factory",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 3,
        NumberPerWave = 2,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(2434.4, 4965.64, 42.35),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=2427.97, y=4970.47, z=42.35, h=317.13},
            {x=2431.6, y=4961.11, z=42.35, h=317.13},
            {x=2432.92, y=4961.35, z=46.82, h=317.13},
            {x=2436.8, y=4957.98, z=46.81, h=317.13},
            {x=2439.3, y=4964.96, z=46.81, h=317.13},
            {x=2441.23, y=4962.47, z=46.81, h=317.13},
            {x=2432.34, y=4971.2, z=42.35, h=317.13},
            {x=2429.77, y=4968.69, z=42.35, h=317.13},
            {x=2430.03, y=4964.67, z=42.35, h=317.13},
            {x=2427.97, y=4970.47, z=42.35, h=317.13},
            {x=2431.6, y=4961.11, z=42.35, h=317.13},
            {x=2432.92, y=4961.35, z=46.82, h=317.13},
            {x=2436.8, y=4957.98, z=46.81, h=317.13},
            {x=2439.3, y=4964.96, z=46.81, h=317.13},
            {x=2441.23, y=4962.47, z=46.81, h=317.13},
            {x=2432.34, y=4971.2, z=42.35, h=317.13},
            {x=2429.77, y=4968.69, z=42.35, h=317.13},
            {x=2430.03, y=4964.67, z=42.35, h=317.13},
        },
    },
    Mechanic = {
        Name = "Mechanic",
        AlliesWith = {
            GetHashKey("AMBIENT_GANG_MEXICAN"),
            GetHashKey("AMBIENT_GANG_SALVA")
        },
        EnemiesWith = {
            'vagos',
            'unemployed',
            'police',
            'cardealer',
            'mechanic',
            'taxi',
            'mafia'
        },
        Event = 89,
        NumberOfWaves = 3,
        NumberPerWave = 2,
        TimeBetweenWaves = math.random(5000, 8000), -- in ms
        TimeBeforeUpAgain = math.random(60000, 80000), -- time here minus time between waves = total wait
        TriggerDistance = 40.78,
        CentralPos = vector3(2434.4, 4965.64, 42.35),
        RepSet = true,
        TauntOnKill = true,
        NPCs = {
            GetHashKey('g_f_y_vagos_01'),
            GetHashKey('ig_ramp_mex'),
            GetHashKey('ig_ortega'),
            GetHashKey('g_m_y_mexgoon_02')
        },
        NPCWeapons = {
            {wep = GetHashKey('weapon_carbinerifle'), type='gun'},
            {wep = GetHashKey('weapon_smg'), type='gun'},
            --{wep = GetHashKey('weapon_rpg'), type='gun'},
            --{wep = GetHashKey('weapon_minigun'), type='gun'},
            --{wep = GetHashKey('weapon_microsmg'), type='gun'},
        },
        NPCSpawnPoints = {
            {x=1196.6, y=2643.56, z=37.84, h=317.13},
            {x=1188.86, y=2654.86, z=37.84, h=317.13},
            {x=1195.6, y=2660.81, z=37.84, h=317.13},
            {x=1169.79, y=2636.96, z=37.84, h=317.13},
            {x=1166.15, y=2643.7, z=37.84, h=317.13},
            {x=1160.05, y=2652.46, z=37.84, h=317.13},
            {x=1158.24, y=2669.45, z=37.84, h=317.13},
            {x=1199.69, y=2662.01, z=37.84, h=317.13},
            {x=1177.91, y=2637.69, z=37.84, h=317.13},
            {x=1172.68, y=2637.3, z=37.84, h=317.13},
            {x=1191.81, y=2653.03, z=40.78, h=317.13},
            {x=1197.44, y=2661.14, z=40.75, h=317.13},
            {x=1196.47, y=2645.2, z=40.78, h=317.13},
            {x=1198.8, y=2642.35, z=40.78, h=317.13},
            {x=1197.54, y=2649.74, z=42.09, h=317.13},
            {x=1153.06, y=2662.19, z=41.48, h=317.13},
            {x=1152.39, y=2667.87, z=41.48, h=317.13},
            {x=1151.96, y=2654.22, z=41.59, h=317.13},
        },
    }

}