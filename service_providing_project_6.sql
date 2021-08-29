/*
SQLyog Ultimate v12.4.1 (64 bit)
MySQL - 5.7.24 : Database - clinic
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;categoriesblog

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
USE `service_providing_project`;



/*Data for the table `addresses` */

/*Table structure for table `admin_logins` */

DROP TABLE IF EXISTS `admin_logins`;

CREATE TABLE `admin_logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `username` text NOT NULL,
  `password` varchar(60) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `admin_logins` */

insert  into `admin_logins`(`id`,`admin_id`,`username`,`password`,`created_at`,`updated_at`) values 
(1,1,'magha','$2y$12$8fsYhC.FkHrdcJfeeJabreyMt7q0bADYB6VnqHYDajzmmwQJkHV6O','2019-08-21 10:14:27',NULL),
(2,2,'hoos','$2yadmins$10$uN6Rpk078CXT2RswSc9e3.EC9h.8XdT77oGZOmU5kY0q6/qLtaGY2','2019-09-03 06:19:21','2019-09-03 06:19:21');

/*Table structure for table `admin_tokens` */

DROP TABLE IF EXISTS `admin_tokens`;

CREATE TABLE `admin_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) NOT NULL,
  `token` varchar(30) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4;

/*Data for the table `admin_tokens` */

insert  into `admin_tokens`(`id`,`admin_id`,`token`,`created_at`,`updated_at`) values 
(13,2,'gctPDferDQnx9bai19CWfS6RuKL4Gf','2019-09-03 06:20:25','2019-09-03 06:20:25'),
(16,1,'TpocllC3lutQfbrPKkyNWlp509HRv4','2019-09-03 07:14:47','2019-09-03 07:14:47');

/*Table structure for table `admins` */

DROP TABLE IF EXISTS `admins`;

CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `email` text NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `admins` */

insert  into `admins`(`id`,`name`,`email`,`user_group_id`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`,`deleted_by`) values 
(1,'Mohammed Agha','dev.magha@gmail.com',1,'2019-08-21 10:14:11',NULL,NULL,NULL,NULL,NULL),
(2,'Hosam','hos@gmaol.com',2,'2019-09-03 06:19:21','2019-09-03 06:19:21',NULL,1,NULL,NULL);

/*Table structure for table `sections` */

DROP TABLE IF EXISTS `sections`;

CREATE TABLE `sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `alias_name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

/*Data for the table `sections` */

insert  into `sections`(`id`,`name`,`alias_name`,`created_at`,`updated_at`) values 
(1,'Home','home','2019-09-02 08:51:15',NULL),
(2,'Categories','category','2019-09-02 08:51:25',NULL),
(3,'Countries','country','2019-09-02 08:51:38',NULL),
(4,'Cities','city','2019-09-02 08:51:44',NULL),
(5,'User Groups','user-group','2019-09-03 08:20:14',NULL),
(6,'Admins','user','2019-09-03 09:07:42',NULL);

DROP TABLE IF EXISTS `subsections`;

CREATE TABLE `subsections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `section_id` int(11) NOT NULL,
  `alias_name` text NOT NULL,
  `name` text NOT NULL,
  `url` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_At` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

/*Data for the table `subsections` */

insert  into `subsections`(`id`,`section_id`,`alias_name`,`name`,`url`,`created_at`,`updated_At`) values 
(1,1,'home','Home','home','2019-09-02 09:13:36',NULL),
(2,2,'category','View Categories','category','2019-09-02 09:13:49',NULL),
(3,2,'category','Add Category','category/add','2019-09-02 09:13:36',NULL),
(4,3,'country','View Countries','country','2019-09-02 11:06:26',NULL),
(5,3,'country','Add Country','country/add','2019-09-02 11:06:42',NULL),
(6,4,'city','View Cities','city','2019-09-02 11:07:08',NULL),
(7,4,'city','Add City','city/add','2019-09-02 11:07:21',NULL),
(8,5,'user-group','Add User Group','user-group/add','2019-09-03 08:22:07',NULL),
(9,6,'admin','Add Admin','admin/add','2019-09-03 09:08:16',NULL);

DROP TABLE IF EXISTS `user_group_sections`;

CREATE TABLE `user_group_sections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `section_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_group_sections` */

insert  into `user_group_sections`(`id`,`user_group_id`,`section_id`,`created_at`,`updated_at`) values 
(1,1,1,'2019-09-02 09:07:04',NULL),
(3,1,3,'2019-09-02 09:07:07',NULL),
(5,1,4,'2019-09-02 09:08:57',NULL),
(6,1,2,'2019-09-02 11:04:40',NULL),
(7,1,5,'2019-09-03 08:21:01',NULL),
(8,2,1,'2019-09-03 08:48:51',NULL),
(9,2,2,'2019-09-03 08:48:51',NULL),
(10,2,4,'2019-09-03 08:48:51',NULL),
(11,1,6,'2019-09-03 09:08:24',NULL);

/*Table structure for table `user_groups` */

DROP TABLE IF EXISTS `user_groups`;

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `deleted_by` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

/*Data for the table `user_groups` */

insert  into `user_groups`(`id`,`name`,`created_at`,`updated_at`,`deleted_at`,`created_by`,`updated_by`,`deleted_by`) values 
(1,'Super Admin','2019-09-02 08:52:33',NULL,NULL,NULL,NULL,NULL),
(2,'Test','2019-09-03 05:48:51','2019-09-03 05:48:51',NULL,1,NULL,NULL);

/*Table structure for table `user_logins` */

DROP TABLE IF EXISTS `user_logins`;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
porfiles