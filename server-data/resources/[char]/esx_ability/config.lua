Config                            = {}
Config.DrawDistance               = 100.0
--language currently available EN and SV
Config.Locale                     = 'en'

Config.texttime                   = 1000

Config.LevelRange                 = {}

Config.LevelRange.low             = 20

Config.LevelRange.mid             = 50

Config.LevelRange.high            = 100

Config.LevelPercent                 = {}

Config.LevelPercent.low             = 10    -- <low

Config.LevelPercent.mid             = 30    -- low<x<mid

Config.LevelPercent.high            = 50    -- mid<x<high

Config.LevelPercent.veryhigh        = 80    -- >high

Config.AbilityList                 = {
    ["ambulance"] = true,
    ["chef"] = true,
    ["gun"] = true,
    ["lock"] = true,
    ["mechanic"] = true,
    ["none"] = true
}

Config.CronAutoResetLevel          = true

Config.MaxLevelPerDay              = 5
--[[
Config.AbilityList.ambulance       = true

Config.AbilityList.chef       = true

Config.AbilityList.gun       = true

Config.AbilityList.lock       = true

Config.AbilityList.mechanic       = true
--]]