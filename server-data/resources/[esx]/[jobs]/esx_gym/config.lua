Config = {}
Config.DrawDistance = 10.0
Config.MarkerType = 21
Config.MarkerSize = {x = 0.3, y = 0.3, z = 0.3}
Config.MarkerColour = {r = 50, g = 50, b = 204}
Config.RestTime = 60 -- Time between workouts in seconds

Config.Ability = true
Config.RandomAbility = 5  ---  5/100
Config.IncreseAbility = "str"
Config.DecreseAbility = "int"

Config.Blip = {
    Title = "Gym",
    Pos = {x = -1201.23, y = -1568.87, z = 4.61},
    Sprite = 311,
    Display = 4,
    Scale = 1.0,
    Colour = 7
}

Config.WorkoutScenarios = {
    {"amb@prop_human_muscle_chin_ups@male@base", "base"},
    {"amb@world_human_muscle_free_weights@male@barbell@base", "base"},
    {"amb@world_human_sit_ups@male@base", "base"},
    {"amb@world_human_yoga@male@base", "base_a"},
    {"amb@world_human_push_ups@male@base", "base"},
    {"amb@prop_human_seat_muscle_bench_press@base", "base"}
}

Config.Workouts = {
    {
        x = -1198.90,
        y = -1564.13,
        z = 4.60,
        h = 0,
        label = "舉啞鈴",
        workout = 2,
        duration = 30
    }, {
        x = -1197.77,
        y = -1571.33,
        z = 4.60,
        h = 0,
        label = "仰臥起坐",
        workout = 3,
        duration = 30
    }, {
        x = -1209.95,
        y = -1561.32,
        z = 4.60,
        h = 0,
        label = "舉啞鈴",
        workout = 2,
        duration = 30
    }, {
        x = -1204.25,
        y = -1556.83,
        z = 4.60,
        h = 0,
        label = "瑜珈",
        workout = 4,
        duration = 30
    }, {
        x = -1199.83,
        y = -1571.43,
        z = 4.60,
        h = 30.12,
        label = "引體向上",
        workout = 1,
        duration = 30
    }, {
        x = -1204.95,
        y = -1564.12,
        z = 4.60,
        h = 216.80,
        label = "引體向上",
        workout = 1,
        duration = 30
    }, {
        x = -1194.19,
        y = -1570.19,
        z = 4.60,
        h = 0,
        label = "伏地挺身",
        workout = 5,
        duration = 30
    } --[[{
        x = -1197.10,
        y = -1567.59,
        z = 4.60,
        h = 300.00,
        label = "Bench",
        workout = 6,
        duration = 30
    }]]
    --prison
    , {
        x = 1773.53,
        y = 2596.74,
        z = 45.8,
        h = 82.64,
        label = "引體向上",
        workout = 1,
        duration = 30
    }, {
        x = 1773.66,
        y = 2594.88,
        z = 45.8,
        h = 79.78,
        label = "引體向上",
        workout = 1,
        duration = 30
    }, {
        x = 1764.73,
        y = 2592.67,
        z = 45.8,
        h = 191.82,
        label = "伏地挺身",
        workout = 5,
        duration = 30
    }, {
        x = 1766.77,
        y = 2590.18,
        z = 45.8,
        h = 117.37,
        label = "舉啞鈴",
        workout = 2,
        duration = 30
    }, {
        x = 1766.54,
        y = 2595.34,
        z = 45.8,
        h = 199.43,
        label = "瑜珈",
        workout = 4,
        duration = 30
    }, {
        x = 1770.35,
        y = 2593.36,
        z = 45.8,
        h = 353.34,
        label = "仰臥起坐",
        workout = 3,
        duration = 30
    },{
        x = 1770.46,
        y = 2591.18,
        z = 45.8,
        h = 190.19,
        label = "舉啞鈴",
        workout = 2,
        duration = 30
    }

}

Config.Membership = {
    Price = 100,
    Expire = 1, -- days
    Marker = {x = -1211.62, y = -1576.41, z = 4.61}
}
