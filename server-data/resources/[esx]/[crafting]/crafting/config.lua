crafting = {}

crafting.Version = '1.0.10'

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end)
Citizen.CreateThread(function(...) while not ESX do TriggerEvent('esx:getSharedObject', function(obj) ESX = obj; end); Citizen.Wait(0); end; end)

-- LearnOnCraft: Should the player learn the recipe on crafting it? (If they guess the recipe, they will remember it for future use).
-- NOTE: If you only want players crafting by owning a recipe item, disable this.
crafting.LearnOnCraft = false

-- RequireRecipes: Should the player have the recipe item in their inventory in order for them to craft it?
-- Recipe items are like so: "recipe_bagofdope" (item name) will allow the player to create the "bagofdope" (recipe name and item name).
crafting.RequireRecipes = false

-- Self explanatory
crafting.DrawTextDist = 5.0
crafting.InteractDist = 2.0 
crafting.LoadTableDist = 100.0
crafting.BenchModel = 'prop_tool_bench02_ld'

-- Other option for bench model:
-- 'prop_tool_bench02'

