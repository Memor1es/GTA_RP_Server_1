USE `essentialmode`;

CREATE TABLE `gym_memberships` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`identifier` VARCHAR(50) NOT NULL,
	`expire` TIMESTAMP NOT NULL,
	PRIMARY KEY(`id`)
);