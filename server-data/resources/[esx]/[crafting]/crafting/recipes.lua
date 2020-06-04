Recipes = {
  --[[["bagofdope"] = {
    "weed",        "weed",  "dopebag",
     false,  "drugscales",      false,
     false,         false,      false,
  },--]]
  ["IronCircle"] = {
    "iron",        "iron",      "iron",
    "iron",        false,      "iron",
    "iron",       "iron",      "iron",
  },
  ["handcuffs"] = {
    false,        "iron",      false,
    "IronCircle",        false,      "IronCircle",
    false,       false,      false,
  },
  ["lockpick"] = {
    false,        "iron",      false,
    "IronCircle",        "gold",      "IronCircle",
    false,       "IronCircle",      false,
  },
  ["stick"] = {
    false,        false,      false,
    false,        "wood",      false,
    false,       "wood",      false,
  },
  ["string"] = {
    false,        false,      false,
    false,        "wool",      false,
    false,       false,      false,
  },
  ["fishingrod"] = {
    false,        false,      "stick",
    false,        "stick",      "string",
    "stick",       false,      "string",
  },
  ["bomb"] = { --NTG 硝化甘油
    "plastic",        "NTG",      "plastic",
    "plastic",        "string",      "plastic",
    "plastic",       "NTG",      "plastic",
  },
  ["thermal_charge"] = { 
    "iron",        "iron",      "iron",
    "iron",        "bomb",      "iron",
    "iron",       "iron",      "iron",
  },
  ["laptop_h"] = { 
    "electronicparts",        "copperwire",      "electronicparts",
    "electronicparts",        "raspberry",      "electronicparts",
    "electronicparts",       "copperwire",      "electronicparts",
  },
  ["rope"] = { 
    "wool",        "wool",      "wool",
    "wool",        false,      "wool",
    "wool",       "wool",      "wool",
  },
}

KeepItems = {
  --[[["bagofdope"] = {
     false,         false,      false,
     false,          true,      false,
     false,         false,      false,
  },--]]
  ["IronCircle"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
 },
  ["handcuffs"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["lockpick"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["stick"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["string"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["fishingrod"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["bomb"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["thermal_charge"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["laptop_h"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
  ["rope"] = {
    false,         false,      false,
    false,          false,      false,
    false,         false,      false,
  },
}

RecipeRewards = {
  --["bagofdope"] = 5,
  ["IronCircle"] = 1,
  ["handcuffs"] = 1,
  ["lockpick"] = 1,
  ["stick"] = 4,
  ["string"] = 9,
  ["fishingrod"] = 1,
  ["bomb"] = 1,
  ["thermal_charge"] = 1,
  ["laptop_h"] = 1,
  ["rope"] = 1,
}

CraftTime = {
  --["bagofdope"] = 1.0,
  ["IronCircle"] = 1.0,
  ["handcuffs"] = 3.0,
  ["lockpick"] = 3.0,
  ["stick"] = 1.0,
  ["string"] = 1.0,
  ["fishingrod"] = 3.0,
  ["bomb"] = 5.0,
  ["thermal_charge"] = 8.0,
  ["laptop_h"] = 8.0,
  ["rope"] = 3.0,
}