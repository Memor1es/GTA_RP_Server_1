CREATE TABLE IF NOT EXISTS `known_recipes` (
  `identifier` varchar(50) DEFAULT NULL,
  `data` longtext
);

CREATE TABLE IF NOT EXISTS `craftingtables` (
  `location` longtext
);

INSERT INTO `items` (`name`, `label`,`limit`) VALUES
  ( 'craftingtable', 'Crafting Table', 10),
  ( 'recipe_IronCircle', '製作方法: 鐵環', 10),

  ( 'recipe_handcuffs', '製作方法: 手銬', 10),
  ( 'recipe_stick', '製作方法: 樹枝', 10),
  ( 'recipe_locpick', '製作方法: 開鎖工具', 10),
  ( 'recipe_string', '製作方法: 線', 10),
  ( 'recipe_fishingrod', '製作方法: 釣竿', 10),
  ( 'recipe_bomb', '製作方法: 炸藥', 10),
  ( 'recipe_thermal_charge', '製作方法: 鋁熱炸藥', 10),
  ( 'recipe_laptop_h', '製作方法: 駭客筆電', 10),

  ( 'NTG', '硝化甘油', 20),
  ( 'stick', '樹枝', 64),
  ( 'string', '線', 64)
  ;
