local Keys = {
    ["ESC"] = 322,
    ["F1"] = 288,
    ["F2"] = 289,
    ["F3"] = 170,
    ["F5"] = 166,
    ["F6"] = 167,
    ["F7"] = 168,
    ["F8"] = 169,
    ["F9"] = 56,
    ["F10"] = 57,
    ["~"] = 243,
    ["1"] = 157,
    ["2"] = 158,
    ["3"] = 160,
    ["4"] = 164,
    ["5"] = 165,
    ["6"] = 159,
    ["7"] = 161,
    ["8"] = 162,
    ["9"] = 163,
    ["-"] = 84,
    ["="] = 83,
    ["BACKSPACE"] = 177,
    ["TAB"] = 37,
    ["Q"] = 44,
    ["W"] = 32,
    ["E"] = 38,
    ["R"] = 45,
    ["T"] = 245,
    ["Y"] = 246,
    ["U"] = 303,
    ["P"] = 199,
    ["["] = 39,
    ["]"] = 40,
    ["ENTER"] = 18,
    ["CAPS"] = 137,
    ["A"] = 34,
    ["S"] = 8,
    ["D"] = 9,
    ["F"] = 23,
    ["G"] = 47,
    ["H"] = 74,
    ["K"] = 311,
    ["L"] = 182,
    ["LEFTSHIFT"] = 21,
    ["Z"] = 20,
    ["X"] = 73,
    ["C"] = 26,
    ["V"] = 0,
    ["B"] = 29,
    ["N"] = 249,
    ["M"] = 244,
    [","] = 82,
    ["."] = 81,
    ["-"] = 84,
    ["LEFTCTRL"] = 36,
    ["LEFTALT"] = 19,
    ["SPACE"] = 22,
    ["RIGHTCTRL"] = 70,
    ["HOME"] = 213,
    ["PAGEUP"] = 10,
    ["PAGEDOWN"] = 11,
    ["DELETE"] = 178,
    ["LEFT"] = 174,
    ["RIGHT"] = 175,
    ["TOP"] = 27,
    ["DOWN"] = 173,
    ["NENTER"] = 201,
    ["N4"] = 108,
    ["N5"] = 60,
    ["N6"] = 107,
    ["N+"] = 96,
    ["N-"] = 97,
    ["N7"] = 117,
    ["N8"] = 61,
    ["N9"] = 118
}

Config = {}

Config.CheckOwnership = false -- If true, Only owner of vehicle can store items in trunk.
Config.AllowPolice = true -- If true, police will be able to search players' trunks.

Config.Locale = 'tc'

Config.OpenKey = Keys["H"]

-- Limit, unit can be whatever you want. Originally grams (as average people can hold 25kg)
Config.Limit = 125000

-- Default weight for an item:
-- weight == 1 : The item do not affect character inventory weight
-- weight > 1 : The item cost place on inventory
-- weight < 0 : The item add place on inventory. Smart people will love it.
Config.localWeight = {
    coke_pooch = 1000,
	code_pooch = 1000,
    opium_pooch = 1000,
    meth_pooch = 1000,
    weed_pooch = 1000,
	amfa_pooch = 1000,
	morf_pooch = 100,
    bitcoin = 500,
    BULLETPROOF = 10000,
    clip = 10000,
    bandage = 10000,
    medikit = 20000,
    nitro = 20000,
    lockpick = 10000,
    repairkit = 20000,
    fixkit = 20000,
    WEAPON_MICROSMG =25000,
    WEAPON_HEAVYSHOTGUN = 25000,
    WEAPON_ASSAULTRIFLE = 25000,
    WEAPON_SPECIALCARBINE = 25000,
    WEAPON_COMBATPDW = 25000,
    WEAPON_COMPACTRIFLE = 25000,
    WEAPON_MARKSMANRIFLE_MK2 = 25000,
    WEAPON_PISTOL = 25000,
    WEAPON_COMBATPISTOL = 25000,
    WEAPON_APPISTOL = 25000,
    WEAPON_SNSPISTOL = 25000,
    WEAPON_HEAVYPISTOL = 25000,
    WEAPON_VINTAGEPISTOL = 25000,
    WEAPON_MARKSMANPISTOL = 25000,
    WEAPON_MACHINEPISTOL = 25000,
    bread = 20000,
    water = 20000
}

Config.DefaultWeight = 100000

Config.VehicleLimit = {
    [0] = 100000, --Compact
    [1] = 100000, --Sedan
    [2] = 500000, --SUV
    [3] = 40000, --Coupes
    [4] = 30000, --Muscle
    [5] = 100000, --Sports Classics
    [6] = 60000, --Sports
    [7] = 50000, --Super
    [8] = 25000, --Motorcycles
    [9] = 100000, --Off-road
    [10] = 5000000, --Industrial
    [11] = 5000000, --Utility
    [12] = 1000000, --Vans
    [13] = 0, --Cycles
    [14] = 100000, --Boats
    [15] = 100000, --Helicopters
    [16] = 0, --Planes
    [17] = 100000, --Service
    [18] = 100000, --Emergency
    [19] = 0, --Military
    [20] = 100000, --Commercial
    [21] = 0 --Trains
}

Config.VehiclePlate = {
    taxi = "TAXI",
    cop = "LSPD",
    ambulance = "EMS0",
    mecano = "MECA"
}
