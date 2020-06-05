Config = {}

Config.VehicleMenu = false -- enable this if you wan't a vehicle menu. 
--Above disabled by DeadlyEmu#0001 This function is buggy and i CBA to fix it. there is better resources out there which does this job
Config.VehicleMenuButton = 344 -- change this to the key you want to open the menu with. buttons: https://docs.fivem.net/game-references/controls/
Config.RangeCheck = 25.0 -- this is the change you will be able to control the vehicle.

Config.Impound = true --Enable/Disable impound feature
Config.ImpoundPrice = 2000 --Price it will cost player to recover vehicle
Config.ImpoundName = "Impound" --Name to show on blip
Config.RebootRestore = false --send all cars back to the garage on restart of the resource?
Config.ImpoundAutoBan = true --Autoban player if exploit is discovered? (Trying to put car in garage via lua executor) Requires EasyAdmin
Config.AutoBanMessage = "You have been banned for exploiting the the impound system DeadlyEmu#0001" -- Ban message to show

Config.LockGarage = true --True restrict garage(store in one cnat take it out the other) False can take all cars out of all garages



Config.BlipImpound = {
    Sprite = 527,
    Color = 60,
    Display = 2,
    Scale = 0.7
}

Config.DrawDistance = 100.0

--Impounds

Config.CarPounds = {
    Pound_LosSantos = {
        PoundPoint = { x = 408.61, y = -1625.47, z = 28.29 },
        SpawnPoint = { x = 405.64, y = -1643.4, z = 27.61, h = 229.54 }
    },
    
    Pound_Sandy = {
        PoundPoint = { x = 1651.38, y = 3804.84, z = 37.65 },
        SpawnPoint = { x = 1627.84, y = 3788.45, z = 33.77, h = 308.53 }
    },
    
    Pound_Paleto = {
        PoundPoint = { x = -234.82, y = 6198.65, z = 30.94 },
        SpawnPoint = { x = -230.08, y = 6190.24, z = 30.49, h = 140.24 }
    }
}

Config.PoundMarker = {
    r = 0, g = 0, b = 100,     -- Blue Color
    x = 1.5, y = 1.5, z = 1.0  -- Standard Size Circle
}




--Garages
Config.Garages = {
    ["A"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(211.8094329834, -934.98626708984, 24.275938034058)
            },
            ["vehicle"] = {
                ["position"] = vector3(219.86030578613, -932.77551269531, 24.141599655151), 
                ["heading"] = 140.0
            }
        },
        ["camera"] = {  -- camera is not needed just if you want cool effects.
            ["x"] = 224.94281005859, 
            ["y"] = -930.33062744141, 
            ["z"] = 26.571212768555, 
            ["rotationX"] = -31.401574149728, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -243.40157422423 
        }
    },

    ["B"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(273.67422485352, -344.15573120117, 44.919834136963)
            },
            ["vehicle"] = {
                ["position"] = vector3(272.50082397461, -337.40579223633, 44.919834136963), 
                ["heading"] = 160.0
            }
        },
        ["camera"] = { 
            ["x"] = 283.28225708008, 
            ["y"] = -333.24017333984, 
            ["z"] = 50.004745483398, 
            ["rotationX"] = -21.637795701623, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 125.73228356242 
        }
    },

    ["C"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(-1803.8967285156, -341.45928955078, 43.986347198486)
            },
            ["vehicle"] = {
                ["position"] = vector3(-1810.7857666016, -337.13592529297, 43.552074432373), 
                ["heading"] = 320.0
            }
        },
        ["camera"] = { 
            ["x"] = -1813.5513916016, 
            ["y"] = -340.40087890625, 
            ["z"] = 46.962894439697, 
            ["rotationX"] = -39.496062710881, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -42.110235854983 
        }
    },
    --SANDY
    ["D"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(1733.94, 3711.99, 34.15)
            },
            ["vehicle"] = {
                ["position"] = vector3(1723.26, 3715.53, 33.76), 
                ["heading"] = 21.41
            }
        },
        ["camera"] = { 
            ["x"] = 1727.8, 
            ["y"] = 3725.44, 
            ["z"] = 38.51, 
            ["rotationX"] = 0.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 162.0
        }
    },
    --Paleto
        
    ["E"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(52.56, 6487.27, 31.43)
            },
            ["vehicle"] = {
                ["position"] = vector3(60.03, 6481.01, 31.01), 
                ["heading"] = 223.28
            }
        },
        ["camera"] = { 
            ["x"] = 67.84, 
            ["y"] = 6477.62, 
            ["z"] = 35.31, 
            ["rotationX"] = -20.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = 60.0
        }
    },
    --Grapeseed
        
    ["F"] = {
        ["positions"] = {
            ["menu"] = {
                ["position"] = vector3(2567.93, 4652.38, 34.08)
            },
            ["vehicle"] = {
                ["position"] = vector3(2553.09, 4675.0, 33.52), 
                ["heading"] = 10.28
            }
        },
        ["camera"] = { 
            ["x"] = 2558.72, 
            ["y"] = 4680.29, 
            ["z"] = 33.69, 
            ["rotationX"] = 10.0, 
            ["rotationY"] = 0.0, 
            ["rotationZ"] = -220.0
        }
    }
}

Config.Labels = {
    ["menu"] = "Press ~INPUT_CONTEXT~ to open the garage. %s.",
    ["vehicle"] = "'%s'ı to store press ~INPUT_CONTEXT~"
}

Config.Trim = function(value)
    if value then
        return (string.gsub(value, "^%s*(.-)%s*$", "%1"))
    else
        return nil
    end
end

Config.AlignMenu = "right" -- this is where the menu is located [left, right, center, top-right, top-left etc.]