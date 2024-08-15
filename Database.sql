/*
SQLyog Community v13.2.1 (64 bit)
MySQL - 5.6.12-log : Database - ev_direct
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`ev_direct` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `ev_direct`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

insert  into `django_session`(`session_key`,`session_data`,`expire_date`) values 
('8cb0hxd6pnj94vp3gwe1ziboppl77y44','eyJsaWQiOjF9:1rm7AN:SlNh5zntFIulSVnn1URER1s7pzqR-iT_l2-0LfYN1LM','2024-04-01 07:12:15.850790'),
('952iox1c6o06b7v5snaxusqpv0cxgjzw','eyJsaWQiOjJ9:1rgevF:-ZWsH3vtzPVuxqZSIQ3L2VZ9Yax3nXRAAyWC8GChoQY','2024-03-17 06:02:05.427542');

/*Table structure for table `myapp_bookingservice` */

DROP TABLE IF EXISTS `myapp_bookingservice`;

CREATE TABLE `myapp_bookingservice` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `SERVICE_ID_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_bookingservice_SERVICE_ID_id_23e41be0_fk_myapp_service_id` (`SERVICE_ID_id`),
  KEY `myapp_bookingservice_USER_id_4a3be142_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_bookingservice_SERVICE_ID_id_23e41be0_fk_myapp_service_id` FOREIGN KEY (`SERVICE_ID_id`) REFERENCES `myapp_service` (`id`),
  CONSTRAINT `myapp_bookingservice_USER_id_4a3be142_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_bookingservice` */

insert  into `myapp_bookingservice`(`id`,`date`,`status`,`SERVICE_ID_id`,`USER_id`) values 
(1,'2024-03-03','rejected',2,6),
(2,'2024-03-05','accepted',3,1),
(3,'2024-03-05','accepted',1,1),
(4,'2024-03-05','accepted',5,6),
(5,'2024-03-08','pending',6,1),
(6,'2024-03-08','rejected',1,1),
(7,'2024-03-18','rejected',2,1),
(8,'2024-03-18','pending',6,6);

/*Table structure for table `myapp_bookingslot` */

DROP TABLE IF EXISTS `myapp_bookingslot`;

CREATE TABLE `myapp_bookingslot` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `status` varchar(100) NOT NULL,
  `SLOT_ID_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_bookingslot_SLOT_ID_id_aff983ba_fk_myapp_slots_id` (`SLOT_ID_id`),
  KEY `myapp_bookingslot_USER_id_268be050_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_bookingslot_SLOT_ID_id_aff983ba_fk_myapp_slots_id` FOREIGN KEY (`SLOT_ID_id`) REFERENCES `myapp_slots` (`id`),
  CONSTRAINT `myapp_bookingslot_USER_id_268be050_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_bookingslot` */

insert  into `myapp_bookingslot`(`id`,`date`,`status`,`SLOT_ID_id`,`USER_id`) values 
(1,'2024-03-05','approve',2,1),
(2,'2024-03-05','reject',1,1),
(3,'2024-03-05','approve',1,6),
(4,'2024-03-17','approve',1,1);

/*Table structure for table `myapp_category` */

DROP TABLE IF EXISTS `myapp_category`;

CREATE TABLE `myapp_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_category` */

insert  into `myapp_category`(`id`,`name`) values 
(1,'service'),
(2,'Battery replacement'),
(3,'ECU Tuning'),
(4,'Motor replacement'),
(5,'Motor service'),
(6,'Water service');

/*Table structure for table `myapp_charger` */

DROP TABLE IF EXISTS `myapp_charger`;

CREATE TABLE `myapp_charger` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `unit` varchar(100) NOT NULL,
  `amount` varchar(100) NOT NULL,
  `EV_STATION_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_charger_EV_STATION_id_f26e5795_fk_myapp_evstation_id` (`EV_STATION_id`),
  CONSTRAINT `myapp_charger_EV_STATION_id_f26e5795_fk_myapp_evstation_id` FOREIGN KEY (`EV_STATION_id`) REFERENCES `myapp_evstation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_charger` */

insert  into `myapp_charger`(`id`,`unit`,`amount`,`EV_STATION_id`) values 
(1,'110','200',2),
(2,'100','1000',1);

/*Table structure for table `myapp_chat` */

DROP TABLE IF EXISTS `myapp_chat`;

CREATE TABLE `myapp_chat` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` varchar(100) NOT NULL,
  `messages` varchar(100) NOT NULL,
  `FROMID_id` bigint(20) NOT NULL,
  `TOID_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_chat_FROMID_id_c34a39e8_fk_myapp_login_id` (`FROMID_id`),
  KEY `myapp_chat_TOID_id_c3a45261_fk_myapp_login_id` (`TOID_id`),
  CONSTRAINT `myapp_chat_FROMID_id_c34a39e8_fk_myapp_login_id` FOREIGN KEY (`FROMID_id`) REFERENCES `myapp_login` (`id`),
  CONSTRAINT `myapp_chat_TOID_id_c3a45261_fk_myapp_login_id` FOREIGN KEY (`TOID_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_chat` */

insert  into `myapp_chat`(`id`,`date`,`messages`,`FROMID_id`,`TOID_id`) values 
(1,'2024-03-03','hi',9,10),
(2,'2024-03-03','how are you ',9,10),
(3,'2024-03-05','hi',4,10),
(4,'2024-03-05','whre is your location ',4,10),
(5,'2024-03-05','i am in mavoor rd ',4,10),
(6,'2024-03-08','hi',4,10),
(7,'2024-03-08','hloo',4,10),
(8,'2024-03-08','how are you',10,10),
(9,'2024-03-08','hi',11,10),
(10,'2024-03-08','fggh',10,10),
(11,'2024-03-08','tty',10,10),
(12,'2024-03-08','hey',10,10),
(13,'2024-03-08','hey',10,10),
(14,'2024-03-08','hi',10,10),
(15,'2024-03-08','how are you ',4,10),
(16,'2024-03-08','hi',10,10),
(17,'2024-03-08','hlo',10,4),
(18,'2024-03-08','hi',4,10),
(19,'2024-03-08','hloo',4,10),
(20,'2024-03-08','h',10,4),
(21,'2024-03-08','hi',11,9),
(22,'2024-03-08','wht do you want ',11,9),
(23,'2024-03-08','car cleaning ',9,11);

/*Table structure for table `myapp_complaints` */

DROP TABLE IF EXISTS `myapp_complaints`;

CREATE TABLE `myapp_complaints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `complaints` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `replay` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_complaints_USER_id_f1892848_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_complaints_USER_id_f1892848_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_complaints` */

insert  into `myapp_complaints`(`id`,`complaints`,`date`,`replay`,`status`,`USER_id`) values 
(1,'app slow','2024-03-05','We\'re working on it','Replied',1),
(2,'Chat have bugs','2024-03-05','we\'re working on it','Replied',6);

/*Table structure for table `myapp_evcomplaints` */

DROP TABLE IF EXISTS `myapp_evcomplaints`;

CREATE TABLE `myapp_evcomplaints` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `complaints` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `replay` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `EVSTATION_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_evcomplaints_EVSTATION_id_f58b945f_fk_myapp_evstation_id` (`EVSTATION_id`),
  KEY `myapp_evcomplaints_USER_id_fa551fad_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_evcomplaints_EVSTATION_id_f58b945f_fk_myapp_evstation_id` FOREIGN KEY (`EVSTATION_id`) REFERENCES `myapp_evstation` (`id`),
  CONSTRAINT `myapp_evcomplaints_USER_id_fa551fad_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_evcomplaints` */

insert  into `myapp_evcomplaints`(`id`,`complaints`,`date`,`replay`,`status`,`EVSTATION_id`,`USER_id`) values 
(1,'charging ports not supported ','2024-03-03','pending','pending',1,6),
(2,'bad environment ','2024-03-03','We will fix it later. hope you come again','replied',2,6),
(3,'bad services ','2024-03-05','We will fix it later. hope you come again','replied',2,1),
(4,'bad','2024-03-08','pending','pending',1,1);

/*Table structure for table `myapp_evstation` */

DROP TABLE IF EXISTS `myapp_evstation`;

CREATE TABLE `myapp_evstation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `photo` varchar(300) NOT NULL,
  `status` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_evstation_LOGIN_id_9d5e91e8_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_evstation_LOGIN_id_9d5e91e8_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_evstation` */

insert  into `myapp_evstation`(`id`,`station_name`,`place`,`email`,`city`,`state`,`pin`,`photo`,`status`,`phone_number`,`LOGIN_id`) values 
(1,'ola','calicut','ola@gmail.com','calicut','kerala','673004','/media/20240303-113149','approved','6567658769',2),
(2,'KSEB Charging station','Palarivattom','kseb@gmail.com','Ernakulam','Kerala','682025','/media/20240303-214406','approved','9234563890',3);

/*Table structure for table `myapp_feedback` */

DROP TABLE IF EXISTS `myapp_feedback`;

CREATE TABLE `myapp_feedback` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `feedback` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_feedback_USER_id_fce7ccff_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_feedback_USER_id_fce7ccff_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_feedback` */

insert  into `myapp_feedback`(`id`,`feedback`,`date`,`USER_id`) values 
(1,'Good app','2024-03-08',1),
(2,'services is good','2024-03-08',1);

/*Table structure for table `myapp_login` */

DROP TABLE IF EXISTS `myapp_login`;

CREATE TABLE `myapp_login` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_login` */

insert  into `myapp_login`(`id`,`username`,`password`,`type`) values 
(1,'admin','admin','admin'),
(2,'ola@gmail.com','Olaola@123','evstation'),
(3,'kseb@gmail.com','Kseb1@123','evstation'),
(4,'munavermunu80@gmail.com','Munaver','user'),
(9,'adil@gmail.com','123456','user'),
(10,'kj@gmail.com','kjkjkj','worker'),
(11,'am@gmail.com','amina','worker');

/*Table structure for table `myapp_reveiw` */

DROP TABLE IF EXISTS `myapp_reveiw`;

CREATE TABLE `myapp_reveiw` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reveiw` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `type` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_reveiw_LOGIN_id_c9042949_fk_myapp_login_id` (`LOGIN_id`),
  KEY `myapp_reveiw_USER_id_8fe6b486_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_reveiw_LOGIN_id_c9042949_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`),
  CONSTRAINT `myapp_reveiw_USER_id_8fe6b486_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_reveiw` */

insert  into `myapp_reveiw`(`id`,`reveiw`,`date`,`type`,`LOGIN_id`,`USER_id`) values 
(1,'Best electric car tuner','2024-03-03','user',10,6),
(2,'hloo','2024-03-05','user',10,1),
(3,'good tuning centre. good services','2024-03-05','user',10,1);

/*Table structure for table `myapp_service` */

DROP TABLE IF EXISTS `myapp_service`;

CREATE TABLE `myapp_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `services` varchar(100) NOT NULL,
  `WORKERS_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_service_WORKERS_id_cc733bc5_fk_myapp_workers_id` (`WORKERS_id`),
  CONSTRAINT `myapp_service_WORKERS_id_cc733bc5_fk_myapp_workers_id` FOREIGN KEY (`WORKERS_id`) REFERENCES `myapp_workers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_service` */

insert  into `myapp_service`(`id`,`services`,`WORKERS_id`) values 
(1,'stage 1 Tuning',1),
(2,'stage 2 tuning ',1),
(3,'level 3 tuning',1),
(4,'Interior cleaning ',2),
(5,'Exterior cleaning ',2),
(6,'Full cleaning ',2);

/*Table structure for table `myapp_slots` */

DROP TABLE IF EXISTS `myapp_slots`;

CREATE TABLE `myapp_slots` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `charges` varchar(100) NOT NULL,
  `free_slot` varchar(100) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `EV_STATION_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_slots_EV_STATION_id_d83d8945_fk_myapp_evstation_id` (`EV_STATION_id`),
  CONSTRAINT `myapp_slots_EV_STATION_id_d83d8945_fk_myapp_evstation_id` FOREIGN KEY (`EV_STATION_id`) REFERENCES `myapp_evstation` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_slots` */

insert  into `myapp_slots`(`id`,`date`,`charges`,`free_slot`,`unit`,`EV_STATION_id`) values 
(1,'2024-03-05','2000','4','120',2),
(2,'2024-03-09','1999','1','120',2);

/*Table structure for table `myapp_stationreview` */

DROP TABLE IF EXISTS `myapp_stationreview`;

CREATE TABLE `myapp_stationreview` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `reveiw` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `EV_STATION_id` bigint(20) NOT NULL,
  `USER_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_stationreview_EV_STATION_id_055f0010_fk_myapp_evstation_id` (`EV_STATION_id`),
  KEY `myapp_stationreview_USER_id_24804b62_fk_myapp_users_id` (`USER_id`),
  CONSTRAINT `myapp_stationreview_EV_STATION_id_055f0010_fk_myapp_evstation_id` FOREIGN KEY (`EV_STATION_id`) REFERENCES `myapp_evstation` (`id`),
  CONSTRAINT `myapp_stationreview_USER_id_24804b62_fk_myapp_users_id` FOREIGN KEY (`USER_id`) REFERENCES `myapp_users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `myapp_stationreview` */

/*Table structure for table `myapp_users` */

DROP TABLE IF EXISTS `myapp_users`;

CREATE TABLE `myapp_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uname` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `photo` varchar(500) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `phone` varchar(100) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_users_LOGIN_id_80656a2a_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_users_LOGIN_id_80656a2a_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_users` */

insert  into `myapp_users`(`id`,`uname`,`place`,`email`,`city`,`state`,`pin`,`photo`,`gender`,`phone`,`LOGIN_id`) values 
(1,'Munaver','Kappad','munavermunu80@gmail.com','Calicut ','Kerala ','888888','/media/user/20240303220906.jpg','male','9895799780',4),
(6,'Adil','Paloramala','adil@gmail.com','Calicut ','kerala ','673317','/media/user/20240303224113.jpg','male','90485 28740',9);

/*Table structure for table `myapp_workers` */

DROP TABLE IF EXISTS `myapp_workers`;

CREATE TABLE `myapp_workers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `worker_name` varchar(100) NOT NULL,
  `place` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `pin` varchar(100) NOT NULL,
  `phone_number` varchar(100) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `status` varchar(100) NOT NULL,
  `gender` varchar(100) NOT NULL,
  `CATEGORY_id` bigint(20) NOT NULL,
  `LOGIN_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `myapp_workers_CATEGORY_id_78fbc748_fk_myapp_category_id` (`CATEGORY_id`),
  KEY `myapp_workers_LOGIN_id_b2333448_fk_myapp_login_id` (`LOGIN_id`),
  CONSTRAINT `myapp_workers_CATEGORY_id_78fbc748_fk_myapp_category_id` FOREIGN KEY (`CATEGORY_id`) REFERENCES `myapp_category` (`id`),
  CONSTRAINT `myapp_workers_LOGIN_id_b2333448_fk_myapp_login_id` FOREIGN KEY (`LOGIN_id`) REFERENCES `myapp_login` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `myapp_workers` */

insert  into `myapp_workers`(`id`,`worker_name`,`place`,`email`,`city`,`state`,`pin`,`phone_number`,`photo`,`status`,`gender`,`CATEGORY_id`,`LOGIN_id`) values 
(1,'Kunju','Mavoor rd','kj@gmail.com','Calicut ','kerala ','888889','9898989899','/media/worker/20240303225052.jpg','approve','male',3,10),
(2,'Amina','Calicut ','am@gmail.com','Calicut ','Kerala ','848484','888898899','/media/worker/20240305092538.jpg','approve','female',6,11);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
