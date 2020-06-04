Crafting = {}
-- You can configure locations here
Crafting.Locations = {
    [1] = {x = 1015.003, y = -3158.878, z = -38.907},
    [2] = {x = 1175.433, y = 2635.81, z = 37.755},
    [3] = {x = 3535.75, y = 3660.17, z = 28.12}, --實驗室
    --[3] = {x = -1154.895, y = -2022.624, z = 13.176}, --修車廠4
}
--[[
    You can add or remove if you want, be sure to use the right format like this:
    ["item_name"] = {
        label = "Item Label",
        needs = {
            ["item_to_use_name"] = {label = "Item Use Label", count = 1}, 
            ["item_to_use_name2"] = {label = "Item Use Label", count = 2},
        },
        threshold = 0,
    },

    #! 
        Threshold level is a level that gets saved (in the database) by crafting, if you craft succefully you gain points, if you fail you lose points.
        The threshold level can be changed to your liking.
    #!

    Also if you don't have the items below make sure to remove it and create your own version.
]]--

--all item to check succeess or failed
Crafting.Items = {
    ["circuitboard"] = {
        label = "電路板",
        needs = {
            ["metalscrap"] = {label = "未知", count = 5},
            ["plastic"] = {label = "未知", count = 2},
            ["copperwire"] = {label = "未知", count = 2},
        },
        threshold = 0,
    },
    ["electronicparts"] = {
        label = "電子零件",
        needs = {
            ["metalscrap"] = {label = "未知", count = 2},
            ["plastic"] = {label = "未知", count = 1},
            ["copperwire"] = {label = "未知", count = 1},
        },
        threshold = 0,--100
    },
    ["raspberry"] = {
        label = "解碼器",
        needs = {
            ["circuitboard"] = {label = "未知", count = 1},
            ["electronicparts"] = {label = "未知", count = 1},
            ["writer"] = {label = "未知", count = 1},
            ["chip"] = {label = "未知", count = 1},
        },
        threshold = 0,--250
    },
    ["NTG"] = {
        label = "硝化甘油",
        needs = {
            ["oil"] = {label = "未知", count = 2},
        },
        threshold = 0,--250
    },
    --[[["motor"] = {
        label = "馬達",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--200
    },--]]
    ["handcuffs"] = {
        label = "手銬",
        needs = {
            ["metalscrap"] = {label = "未知", count = 2},
            ["electronicparts"] = {label = "未知", count = 1},
        },
        threshold = 100,--250
    },
    ["copperwire"] = {
        label = "銅線",
        needs = {
            ["copper"] = {label = "未知", count = 5},
        },
        threshold = 0,
    },
    ["blowtorch"] = {
        label = "噴燈",
        needs = {
            ["blowpipe"] = {label = "未知", count = 1},
            ["gazbottle"] = {label = "未知", count = 1},
            ["electronicparts"] = {label = "未知", count = 1},
        },
        threshold = 0,
    },
    --[[["drill"] = {
        label = "鑽孔機",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 2},
            ["circuitboard"] = {label = "電路板", count = 2},
        },
        threshold = 0,--250
    },--]]
    --[[["fixkit"] = {
        label = "修復包",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 5},
            ["plastic"] = {label = "塑膠", count = 5},
            ["rubber"] = {label = "橡皮筋", count = 5},
            ["copperwire"] = {label = "銅線", count = 5},
        },
        threshold = 0,--350
    },--]]
    --[[["weapon_pistol"] = {
        label = "子彈",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 18},
            ["plastic"] = {label = "塑膠", count = 10},
            ["copper"] = {label = "銅", count = 8},
        },
        threshold = 0,--450
    },--]]
    --[[["clip"] = {
        label = "彈夾",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 10},
            ["copper"] = {label = "銅", count = 5},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--450
    },--]]
    --[[["weapon_combatpistol"] = {
        label = "Combat Pistol",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 22},
            ["plastic"] = {label = "塑膠", count = 36},
            ["rubber"] = {label = "橡皮筋", count = 10},
            ["superlockpick"] = {label = "Advanced lockpick", count = 1},
        },
        threshold = 600,
    },--]]
}

Crafting.NormalItems = {
    ["circuitboard"] = {
        label = "電路板",
        needs = {
            ["metalscrap"] = {label = "未知", count = 5},
            ["plastic"] = {label = "未知", count = 2},
            ["copperwire"] = {label = "未知", count = 2},
        },
        threshold = 0,
    },
    ["electronicparts"] = {
        label = "電子零件",
        needs = {
            ["metalscrap"] = {label = "未知", count = 2},
            ["plastic"] = {label = "未知", count = 1},
            ["copperwire"] = {label = "未知", count = 1},
        },
        threshold = 0,--100
    },
    ["raspberry"] = {
        label = "解碼器",
        needs = {
            ["circuitboard"] = {label = "未知", count = 1},
            ["electronicparts"] = {label = "未知", count = 1},
            ["writer"] = {label = "未知", count = 1},
        },
        threshold = 0,--250
    },
    --[[["motor"] = {
        label = "馬達",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--200
    },--]]
    ["handcuffs"] = {
        label = "手銬",
        needs = {
            ["metalscrap"] = {label = "未知", count = 2},
            ["electronicparts"] = {label = "未知", count = 1},
        },
        threshold = 100,--250
    },
    ["blowtorch"] = {
        label = "噴燈",
        needs = {
            ["blowpipe"] = {label = "未知", count = 1},
            ["gazbottle"] = {label = "未知", count = 1},
            ["electronicparts"] = {label = "未知", count = 1},
        },
        threshold = 0,
    },
    --[[["drill"] = {
        label = "鑽孔機",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 2},
            ["circuitboard"] = {label = "電路板", count = 2},
        },
        threshold = 0,--250
    },--]]
    --[[["fixkit"] = {
        label = "修復包",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 5},
            ["plastic"] = {label = "塑膠", count = 5},
            ["rubber"] = {label = "橡皮筋", count = 5},
            ["copperwire"] = {label = "銅線", count = 5},
        },
        threshold = 0,--350
    },--]]
    --[[["weapon_pistol"] = {
        label = "子彈",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 18},
            ["plastic"] = {label = "塑膠", count = 10},
            ["copper"] = {label = "銅", count = 8},
        },
        threshold = 0,--450
    },--]]
    --[[["clip"] = {
        label = "彈夾",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 10},
            ["copper"] = {label = "銅", count = 5},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--450
    },--]]
    --[[["weapon_combatpistol"] = {
        label = "Combat Pistol",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 22},
            ["plastic"] = {label = "塑膠", count = 36},
            ["rubber"] = {label = "橡皮筋", count = 10},
            ["superlockpick"] = {label = "Advanced lockpick", count = 1},
        },
        threshold = 600,
    },--]]
}

Crafting.MetalItems = {
    ["copperwire"] = {
        label = "銅線",
        needs = {
            ["copper"] = {label = "未知", count = 5},
        },
        threshold = 0,
    },
    --[[["motor"] = {
        label = "馬達",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--200
    },--]]
    --[[["drill"] = {
        label = "鑽孔機",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 2},
            ["circuitboard"] = {label = "電路板", count = 2},
        },
        threshold = 0,--250
    },--]]
    --[[["fixkit"] = {
        label = "修復包",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 5},
            ["plastic"] = {label = "塑膠", count = 5},
            ["rubber"] = {label = "橡皮筋", count = 5},
            ["copperwire"] = {label = "銅線", count = 5},
        },
        threshold = 0,--350
    },--]]
    --[[["weapon_pistol"] = {
        label = "子彈",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 18},
            ["plastic"] = {label = "塑膠", count = 10},
            ["copper"] = {label = "銅", count = 8},
        },
        threshold = 0,--450
    },--]]
    --[[["clip"] = {
        label = "彈夾",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 10},
            ["copper"] = {label = "銅", count = 5},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--450
    },--]]
    --[[["weapon_combatpistol"] = {
        label = "Combat Pistol",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 22},
            ["plastic"] = {label = "塑膠", count = 36},
            ["rubber"] = {label = "橡皮筋", count = 10},
            ["superlockpick"] = {label = "Advanced lockpick", count = 1},
        },
        threshold = 600,
    },--]]
}

Crafting.ChemistryItems = {
    ["NTG"] = {
        label = "硝化甘油",
        needs = {
            ["oil"] = {label = "未知", count = 2},
        },
        threshold = 0,--250
    },
    --[[["motor"] = {
        label = "馬達",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--200
    },--]]
    --[[["drill"] = {
        label = "鑽孔機",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 2},
            ["plastic"] = {label = "塑膠", count = 2},
            ["electronicparts"] = {label = "電子零件", count = 2},
            ["circuitboard"] = {label = "電路板", count = 2},
        },
        threshold = 0,--250
    },--]]
    --[[["fixkit"] = {
        label = "修復包",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 5},
            ["plastic"] = {label = "塑膠", count = 5},
            ["rubber"] = {label = "橡皮筋", count = 5},
            ["copperwire"] = {label = "銅線", count = 5},
        },
        threshold = 0,--350
    },--]]
    --[[["weapon_pistol"] = {
        label = "子彈",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 18},
            ["plastic"] = {label = "塑膠", count = 10},
            ["copper"] = {label = "銅", count = 8},
        },
        threshold = 0,--450
    },--]]
    --[[["clip"] = {
        label = "彈夾",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 10},
            ["copper"] = {label = "銅", count = 5},
            ["electronicparts"] = {label = "電子零件", count = 1},
        },
        threshold = 0,--450
    },--]]
    --[[["weapon_combatpistol"] = {
        label = "Combat Pistol",
        needs = {
            ["metalscrap"] = {label = "金屬廢料", count = 22},
            ["plastic"] = {label = "塑膠", count = 36},
            ["rubber"] = {label = "橡皮筋", count = 10},
            ["superlockpick"] = {label = "Advanced lockpick", count = 1},
        },
        threshold = 600,
    },--]]
}