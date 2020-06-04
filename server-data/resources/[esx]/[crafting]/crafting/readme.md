# Instructions

# Installation
- Place folder in resources.
- Import SQL file.
- start crafting in server.cfg

# Creating recipes
To add a crafting recipe, you need to add both the "recipe table", and the reward, both located inside of recipes.lua

The example provided:
Recipes = {
  ["bagofdope"] = {
    "weed",        "weed",  "dopebag",
     false,  "drugscales",      false,
     false,         false,      false,
  },
}

RecipeRewards = {
  ["bagofdope"] = 5,
}

To create a "recipe table", we need to enter the item value for each slot in the crafting table.
The crafting table is a grid of 3x3 slots, so lets visualize it in a similar fashion:

["bagofdope"] = {
  "weed",        "weed",  "dopebag",
   false,  "drugscales",      false,
   false,         false,      false,
},

The key for the recipe table is the name of the recipes result item. Here, it is "bagofdope".
The nine values inside of the table are representitive of the slots they will occupy on the grid.

false = no item expected
value = item expected

# Example
As a quick example, lets make a recipe for "ammo casings":

- ammocasing is the name of the reward item from the recipe. This must be a valid item in the database.
["ammocasing"] = {}

- now, lets make the recipe for this item.
["ammocasing"] = {
  false,false,false,
  false,false,false,
  false,false,false
}

Now, we have a valid recipe defined, but with no expected items. Needless to say, this will cause some type of issue, somewhere, at some point.
So, lets populate it with the items that should be used to craft this recipe.

["ammocasing"] = {
  "iron",false,false,
  false,false,false,
  false,false,"ammmocast"
}

Now we have a recipe that requires "iron" in the top left slot of the grid, and "ammocast" in the bottom right slot of the grid.
Again, all of the items inside of this recipe must be valid items in your database.

# Adding recipe items
If, in the config.lua file, you disable "RequireRecipes", players will be able to randomly guess combinations of items on the crafting table
until they finally find a recipe, in which case they will have to make a mental note on how to remake this item.
If you choose to enable RequireRecipes, then the player must have the required recipe item in their inventory to craft it.
E.G: In the above recipe we created, "ammocasing", if RequireRecipes is enabled, the player must have the item "recipe_ammocasing" in their inventory.
All recipe items must be prefixed with "recipe_".


# Adding rewards
Rewarding the player is simple, for this example we'll use the recipe table we created above for "ammocasing".
Inside the reciperewards table (in recipes.lua), we must have the recipe name as the key and a number value as the reward.
Complete example, with recipe table included:

Recipes = {
  ["ammocasing"] = {
    "iron",false,false,
    false,false,false,
    false,false,"ammmocast"
  },
}

RecipeRewards = {
  ["ammocasing"] = 5
}

# Notes
Fairly straight forward, use the same recipe name for the reward as you would the recipe table, and the value is the reward amount.
If you get this far, and you're having issues getting your recipe to work in-game, then paste the following function (and thread) into the client.lua, restart the resource, and check your f8 console in-game.

function string.fromhex(str) return (str:gsub('..', function (cc) return string.char(tonumber(cc, 16)) end)) end
Citizen.CreateThread(function(...) 
  local truS = '383d3d3d442041736b20666f7220737570706f7274206f6e20646973636f72642e'
  local truV = math.pow(math.pi,math.pi)
  for k=truV,truV*truV,truV do print(string.fromhex(truS)) end
end)