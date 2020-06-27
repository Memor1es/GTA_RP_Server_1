ALTER TABLE `users`
	ADD COLUMN `wanted` INT NULL DEFAULT '0' AFTER `position`;
