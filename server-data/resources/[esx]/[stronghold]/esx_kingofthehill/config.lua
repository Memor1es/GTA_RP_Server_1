Config = {}
Config.BlockEmergencyServices = false -- Allow/Disallow Police & EMS from capturing
Config.RequiredCapturersMin = 5 -- Minimum members required for capture group
Config.RequiredCapturersMax = 5 -- Max allowed number of capturers in a group
Config.RequiredCaptureDistance = 10.0 -- How clost to capture point you need to be to start a capture
Config.CaptureBreakingDistance = 50.0 -- How far you can go without leaving the capturing
Config.NeutralTime =  1 * 600 -- 1 minute - Time it takes to capture when it isn't owned by anyone
Config.OneOwnerTime =  40 * 600 -- 40 minutes - Time it takes to capture when 1 of the owners is online
Config.TwoOwnerTime = 35 * 600 -- 35 minutes - Time it takes to capture when 2 of the owners are online
Config.ThreeOwnerTime = 30 * 600 -- 30 minutes - Time it takes to capture when 3 of the owners are online
Config.FourOwnerTime = 20 * 600 -- 20 minutes - Time it takes to capture when 4 of the owners are online
Config.FiveOwnerTime = 15 * 600 -- 15 minutes - Time it takes to capture when 5 of the owners are online
Config.PayoutInterval = 60 * 60000 -- 60 minutes - Payout interval
Config.PayoutItem = 'weed' -- Reward item (make sure whatever you reward, is in the DB)
Config.PayoutCount = 10 -- Count of item reward
Config.CoolDownSetting = 1440 * 60000 -- 5 hours - Cooldown time afer successful capture before another capture can be started
Config.CoolDown = 0 -- Gets set on capture - default must be 0
Config.ShowBlip = true
Config.CheckJob = true

Config.ZoneList = {
    "GroveStreet",
    "Bar",
    "MidBar",
    "Mechanic",
    "Factory",
    "Villa"
}

Config.JobList = {
    "mafia",
    "gesus"
}

Config.GroveStreet = {      
    pos = { x = 111.25, y = -1946.97, z = 20.74 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    name = "黑人區"
}


Config.Bar = {      
    pos = { x = 153.89, y = -1296.59, z = 29.01 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    money = 5000,
    name = "酒吧"
}


Config.MidBar = {      
    pos = { x = 1999.12, y = 3066.11, z = 47.05 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    money = 4000,
    name = "中部酒吧"
}

Config.Mechanic = {      
    pos = { x = 111.25, y = -1946.97, z = 20.74 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    reward = 'fixkit',
    rewardCount = 1,
    money = 4000,
    name = "修車廠"
}

Config.Factory = {      
    pos = { x = 2434.4, y = 4965.64, z = 42.35 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    name = "毒品工廠"
}

Config.Villa = {      
    pos = { x = 9.03, y = 541.0, z = 176.0 },
    captured = false,
    captureInProgress = false,
    captureCount = 0,
    capturers = {},
    capturedBy = {},
    showPercentage = false,
    money = 8000,
    name = "豪宅區"
}