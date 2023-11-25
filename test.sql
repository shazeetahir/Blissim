-- ----------------------------------------------------------------------------
-- MySQL Workbench Migration
-- Migrated Schemata: TEST
-- Source Schemata: TEST
-- Created: Wed Jul  5 15:05:29 2023
-- Workbench Version: 8.0.29
-- ----------------------------------------------------------------------------

SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------------------------------------------------------
-- Schema TEST
-- ----------------------------------------------------------------------------
DROP SCHEMA IF EXISTS `TEST` ;
CREATE SCHEMA IF NOT EXISTS `TEST` ;

-- ----------------------------------------------------------------------------
-- Table TEST.comment
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `TEST`.`comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `review` VARCHAR(2550) NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `IDX_9474526C4584665A` (`product_id` ASC) VISIBLE,
  INDEX `IDX_9474526CA76ED395` (`user_id` ASC) VISIBLE,
  CONSTRAINT `FK_9474526C4584665A`
    FOREIGN KEY (`product_id`)
    REFERENCES `TEST`.`product` (`id`),
  CONSTRAINT `FK_9474526CA76ED395`
    FOREIGN KEY (`user_id`)
    REFERENCES `TEST`.`user` (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 26
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table TEST.doctrine_migration_versions
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `TEST`.`doctrine_migration_versions` (
  `version` VARCHAR(191) NOT NULL,
  `executed_at` DATETIME NULL DEFAULT NULL,
  `execution_time` INT NULL DEFAULT NULL,
  PRIMARY KEY (`version`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table TEST.messenger_messages
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `TEST`.`messenger_messages` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `body` LONGTEXT NOT NULL,
  `headers` LONGTEXT NOT NULL,
  `queue_name` VARCHAR(190) NOT NULL,
  `created_at` DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `available_at` DATETIME NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `delivered_at` DATETIME NULL DEFAULT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`),
  INDEX `IDX_75EA56E0FB7336F0` (`queue_name` ASC) VISIBLE,
  INDEX `IDX_75EA56E0E3BD61CE` (`available_at` ASC) VISIBLE,
  INDEX `IDX_75EA56E016BA31DB` (`delivered_at` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table TEST.product
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `TEST`.`product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Table TEST.user
-- ----------------------------------------------------------------------------
CREATE TABLE IF NOT EXISTS `TEST`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(180) NOT NULL,
  `roles` JSON NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `UNIQ_8D93D649E7927C74` (`email` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;
SET FOREIGN_KEY_CHECKS = 1;





/*
-- Query: SELECT * FROM TEST.user
LIMIT 0, 1000

-- Date: 2023-07-05 15:13
*/
INSERT INTO TEST.user (`email`,`roles`,`password`,`name`) VALUES ('test@test.com','[]','$2y$13$haIXWZ1cfaHp96.TC45XReQHJsvHdcDpIkQeQR4EBQsMxjdgg1gJG','Christophe Jean');
INSERT INTO TEST.user (`email`,`roles`,`password`,`name`) VALUES ('user@test.com','[]','$2y$13$zGLc6gMN6fC851KqQSiu0.4IbofIVyOj3b9UWoJVRFKZVnf5CGQdS','Shahzaib Tahir');





/*
-- Query: SELECT * FROM TEST.product
LIMIT 0, 1000

-- Date: 2023-07-05 15:12
*/

INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Product1','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus cursus placerat mi, sed ornare sapien ultrices non. Vivamus laoreet a mauris non porttitor. Nulla ornare aliquet mollis. Donec non pellen',13.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Ampoule','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',8.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Ampoule dorée','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',7.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Cable alimentation','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',32.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Chargeur','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',12.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Lustre','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',48.99);
INSERT INTO TEST.product (`name`,`description`,`price`) VALUES ('Plafonnier','is, fermentum leo. Donec vel sollicitudin risus, sit amet aliquam eros. Curabitur dapibus, ex sit amet rutrum auctor, ex tellus mattis metus, mattis pretium ante mi nec ',83.99);





/*
-- Query: SELECT * FROM TEST.comment
LIMIT 0, 1000

-- Date: 2023-07-05 15:11
*/
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,1,'C\'est pas mal','2023-07-04 20:34:31');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,1,'Excellent!','2023-07-04 20:34:37');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (2,1,'This works well!','2023-07-04 22:38:12');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (3,1,'Another comment','2023-07-05 10:00:58');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (3,1,'This is another comment !','2023-07-05 10:01:07');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,2,'J\'adore!','2023-07-05 10:36:04');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (2,2,'C\'est pas mal','2023-07-05 10:37:11');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (7,2,'Excellent','2023-07-05 10:37:23');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,2,'Connected user can delete his comment ','2023-07-05 11:16:38');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,2,'This is gooooood','2023-07-05 11:50:06');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,2,'Super!','2023-07-05 11:50:19');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (1,1,'J\'adore :)','2023-07-05 11:50:35');
INSERT INTO TEST.comment (`product_id`,`user_id`,`review`,`date`) VALUES (4,1,'Parfait!','2023-07-05 11:51:08');

