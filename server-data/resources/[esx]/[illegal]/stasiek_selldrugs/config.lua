Config                            = {}
Config.Locale = 'tc' -- your language, It would be nice if you send me your translation on fivem forum
Config.TimeToSell = 15 -- how many seconds player have to wait/stand near ped
Config.CallCops = true -- if true and if ped reject your offer then there is [Config.CallCopsPercent]% to call cops
Config.CopsRequiredToSell = 2 -- required cops on server to sell drugs
Config.CallCopsPercent = 1 -- (min1) if 1 cops will be called every time=100%, 2=50%, 3=33%, 4=25%, 5=20%
Config.PedRejectPercent = 4 -- (min1) if 1 ped reject offer=100%, 2=50%, 3=33%, 4=25%, 5=20%
Config.PlayAnimation = true -- just play animation when sold
Config.SellPooch = true -- if true, players can sell pooch like weed_pooch, meth_pooch
Config.SellSingle = false -- if true, players can sell single item like weed, meth
Config.SellWeed = true	-- if true, players can sell weed
Config.SellMeth = true	-- if true, players can sell meth
Config.SellCoke = true	-- if true, players can sell coke
Config.SellOpiu = true	-- if true, players can sell opium
Config.SellGold = true	-- if true, players can sell gold
Config.SellSilver = true	-- if true, players can sell silver
Config.SellJew = true -- if true, players can sell jew
Config.WeedPrice = 300	-- sell price for single, not pooch (black money)
Config.MethPrice = 750	-- sell price for single, not pooch (black money)
Config.CokePrice = 750	-- sell price for single, not pooch (black money)
Config.OpiuPrice = 750	-- sell price for single, not pooch (black money)
Config.GoldBarPrice = 20000-- sell price for single, not pooch (black money)
Config.SilverBarPrice = 10000	-- sell price for single, not pooch (black money)
Config.JewelsPrice = 3000

Config.USBReward = true
Config.USBChance = 3  --3/100


--Config.DistanceFromCity = 10000 -- set distance that player cant sell drugs too far from city
Config.DistanceFromCity = 300 -- set distance that player cant sell drugs too far from city  --1160
--Config.CityPoint = {x= -255.94, y= -983.93, z= 30.21}  --成市中心
Config.CityPoint = {
    sea = {x= -1397.67, y= -1325.24, z= 3.89},--左邊外海
    center = {x= 1025.93, y= -455.89, z= 63.67},--427
    black = {x = -649.11, y = -243.89, z = 54.31},--697
    michael = {x= 164.85, y= -1850.50, z= 26.91}}--131
--Config.CityPoint = {x= -1852.01, y= -1233.01, z= 15.01}  --左邊突起
Config.SellMany = true