USE `es_extended`;

ALTER TABLE `users` ADD COLUMN `ability` LONGTEXT NULL;
ALTER TABLE `users` ADD COLUMN `ability_level` LONGTEXT NULL;