Config = {}

Config.BottleRecieve = { 1, 6 } -- This is the math random ex. math.random(1, 6) this will give you 1 - 6 bottles when searching a bin.
Config.BottleReward = { 2, 4 } -- This is the math random ex. math.random(1, 4) this will give a random payout between 1 - 4

-- Here you add all the bins you are going to search.
--[[
Config.BinsAvailable = {
    "prop_bin_01a",
    --"1437508529",
    "prop_bin_03a",
    --"-130812911",
    "prop_bin_05a",
    --"1329570871",
    "prop_dumpster_4b",
    --682791951
    "prop_bin_08a",
    "prop_bin_08open",
    "prop_bin_14a",
    "prop_skip_10a",
    "prop_skip_06a",
    "prop_skip_04",
    "prop_skip_02a",
    "prop_recyclebin_05_a",
    "prop_recyclebin_04_a",
    "prop_recyclebin_04_b",
    "prop_dumpster_02b",
    "prop_dumpster_02a",
    "prop_bindelperro",
    "prop_bin_beach_01a",
    "prop_bin_12a",
    "prop_bin_14b",
    -------------------------
    "prop_recyclebin_02a",
    "prop_bin_08b",
    "prop_bin_07a",
    "prop_recyclebin_01a",
    "prop_skip_05a",
    "prop_bin_07b",
    "prop_bin_beach_01d",
    "prop_dumpster_3a",
    "prop_skip_05b",
    "prop_skip_08a",
    "prop_recyclebin_02_c",
    "prop_bin_delpiero_b",
    "zprop_bin_01a_old",
    "prop_recyclebin_03_a",
    "prop_bin_07c",
    "prop_bin_10b",
    "prop_bin_10a",
    "prop_bin_11a",
    "prop_bin_06a",
    "prop_skip_03",
    "prop_bin_07d",
    "prop_bin_11b",
    "prop_skip_01a",
    "prop_bin_04a",
    "prop_dumpster_4a",
    "prop_dumpster_01a",
    "prop_recyclebin_02b",
    "prop_bin_delpiero",
    "prop_bin_09a",
    "prop_bin_02a",
    "prop_recyclebin_02_d",
    "prop_bin_13a"
}--]]
Config.BinsAvailable = {
    [GetHashKey("prop_bin_01a")] = true,
    [GetHashKey("prop_bin_03a")] = true,
    [GetHashKey("prop_bin_05a")] = true
}
--[[
Config.BinsAvailable["1437508529"] = true
Config.BinsAvailable["-130812911"] = true
Config.BinsAvailable["1329570871"] = true
Config.BinsAvailable["682791951"] = true
Config.BinsAvailable["-1096777189"] = true
Config.BinsAvailable["1748268526"] = true
Config.BinsAvailable["-96647174"] = true
Config.BinsAvailable["-14708062"] = true
Config.BinsAvailable["811169045"] = true
Config.BinsAvailable["-58485588"] = true
Config.BinsAvailable["666561306"] = true
Config.BinsAvailable["-2096124444"] = true
Config.BinsAvailable["998415499"] = true

Config.BinsAvailable["prop_bin_01a"] = true
Config.BinsAvailable["prop_bin_03a"] = true
Config.BinsAvailable["prop_bin_05a"] = true
--]]

--Config.BinsAvailable = "prop_bin_01a"
    

Config.SellBottleLocationNames = {
    "Recycler", "Convenient", "Convenient", "Convenient",
}

-- This is where you add the locations where you sell the bottles.
Config.SellBottleLocations = {
    vector3(820.1, -487.44, 29.4),
    vector3(29.337753295898, -1770.3348388672, 29.607357025146),
    vector3(388.30194091797, -874.88238525391, 29.295169830322),
    vector3(26.877752304077, -1343.0764160156, 29.497024536133),
}