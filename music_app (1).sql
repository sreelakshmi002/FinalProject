-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 12, 2024 at 09:14 AM
-- Server version: 5.6.16
-- PHP Version: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `music_app`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session'),
(25, 'Can add feedtable', 7, 'add_feedtable'),
(26, 'Can change feedtable', 7, 'change_feedtable'),
(27, 'Can delete feedtable', 7, 'delete_feedtable'),
(28, 'Can view feedtable', 7, 'view_feedtable'),
(29, 'Can add upload', 8, 'add_upload'),
(30, 'Can change upload', 8, 'change_upload'),
(31, 'Can delete upload', 8, 'delete_upload'),
(32, 'Can view upload', 8, 'view_upload'),
(33, 'Can add user', 9, 'add_user'),
(34, 'Can change user', 9, 'change_user'),
(35, 'Can delete user', 9, 'delete_user'),
(36, 'Can view user', 9, 'view_user'),
(37, 'Can add rating_tbl', 10, 'add_rating_tbl'),
(38, 'Can change rating_tbl', 10, 'change_rating_tbl'),
(39, 'Can delete rating_tbl', 10, 'delete_rating_tbl'),
(40, 'Can view rating_tbl', 10, 'view_rating_tbl'),
(41, 'Can add music_recommendation', 11, 'add_music_recommendation'),
(42, 'Can change music_recommendation', 11, 'change_music_recommendation'),
(43, 'Can delete music_recommendation', 11, 'delete_music_recommendation'),
(44, 'Can view music_recommendation', 11, 'view_music_recommendation');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(7, 'music_app', 'feedtable'),
(11, 'music_app', 'music_recommendation'),
(10, 'music_app', 'rating_tbl'),
(8, 'music_app', 'upload'),
(9, 'music_app', 'user'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2024-03-21 12:15:30.254058'),
(2, 'auth', '0001_initial', '2024-03-21 12:15:32.223431'),
(3, 'admin', '0001_initial', '2024-03-21 12:15:32.629789'),
(4, 'admin', '0002_logentry_remove_auto_add', '2024-03-21 12:15:32.645436'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2024-03-21 12:15:32.676699'),
(6, 'contenttypes', '0002_remove_content_type_name', '2024-03-21 12:15:32.973665'),
(7, 'auth', '0002_alter_permission_name_max_length', '2024-03-21 12:15:33.145571'),
(8, 'auth', '0003_alter_user_email_max_length', '2024-03-21 12:15:33.380019'),
(9, 'auth', '0004_alter_user_username_opts', '2024-03-21 12:15:33.395652'),
(10, 'auth', '0005_alter_user_last_login_null', '2024-03-21 12:15:33.567580'),
(11, 'auth', '0006_require_contenttypes_0002', '2024-03-21 12:15:33.583209'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2024-03-21 12:15:33.598859'),
(13, 'auth', '0008_alter_user_username_max_length', '2024-03-21 12:15:33.770770'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2024-03-21 12:15:33.942693'),
(15, 'auth', '0010_alter_group_name_max_length', '2024-03-21 12:15:34.099013'),
(16, 'auth', '0011_update_proxy_permissions', '2024-03-21 12:15:34.130273'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2024-03-21 12:15:34.349072'),
(18, 'music_app', '0001_initial', '2024-03-21 12:15:34.583521'),
(19, 'sessions', '0001_initial', '2024-03-21 12:15:34.739816'),
(20, 'music_app', '0002_rating_tbl', '2024-04-11 10:30:11.361503'),
(21, 'music_app', '0003_auto_20240411_1649', '2024-04-11 11:20:07.330177'),
(22, 'music_app', '0004_auto_20240411_1657', '2024-04-11 11:27:13.794175');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('06uosud95cbuvl8vrcx7ao19ohlwen4j', 'eyJ1aWQiOjR9:1rrCBW:B2W7nvPtBprb4mMeZyZ9i__ikEoEagCcHG3FM9cGpZ4', '2024-04-15 07:34:26.103237'),
('15v6ttxnr5znyygkdo6feisu34kpssx6', 'eyJ1aWQiOjR9:1rurEs:xO2gCjiR93wzXRcy5r7_IxLQ533-P5GKUcbrEakgXWs', '2024-04-25 10:01:02.450645'),
('8wjwa6n23xeuntv352rf3xcixwxm78if', 'eyJkZXRhaWxzIjoiYWRtaW4ifQ:1rvAkp:LUmDLdtfEBaGtN6SJTeCc3TNgUf15hJFF8GZJ9UtlwY', '2024-04-26 06:51:19.046651'),
('9bzvpzrm2afupyzgja03d10voy6csxvr', 'e30:1rrza9:XSOq3WMb2E4O8bojxm0z1o_F7_VVgx_mSmPOYgi8cBE', '2024-04-17 12:19:09.674391'),
('cx9fncjt6kctj4nnkie6a4mf2q3glzgn', 'eyJ1aWQiOjJ9:1rnbv7:S6pI0X41m00hSN6EV_deMX8Y6kzONqUiQCOdExxm6-c', '2024-04-05 10:14:41.798384'),
('sred8dtofrjprjdbdbwimpq7wdmajpsq', 'eyJ1aWQiOjR9:1rutyq:rIZ_sFAPT4jecykSab7OMxZ06oKsWAo4OpZA6UW0GKw', '2024-04-25 12:56:40.283552'),
('wodpdd24gnl7zvpxz628p69362lqogmw', 'eyJ1aWQiOjN9:1rpRQg:k6zPJFdHvaYTwPnTUFAFAIAK4tDhDtxlG2AOAz0EVWs', '2024-04-10 11:26:50.718379');

-- --------------------------------------------------------

--
-- Table structure for table `music_app_feedtable`
--

CREATE TABLE IF NOT EXISTS `music_app_feedtable` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user` varchar(150) NOT NULL,
  `feedback` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `music_app_feedtable`
--

INSERT INTO `music_app_feedtable` (`id`, `user`, `feedback`) VALUES
(1, '1', 'aDsfghjk'),
(2, '5', 'very good exp');

-- --------------------------------------------------------

--
-- Table structure for table `music_app_music_recommendation`
--

CREATE TABLE IF NOT EXISTS `music_app_music_recommendation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `description` varchar(150) NOT NULL,
  `musics` varchar(150) NOT NULL,
  `emotion` varchar(150) NOT NULL,
  `language` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `music_app_music_recommendation`
--

INSERT INTO `music_app_music_recommendation` (`id`, `name`, `description`, `musics`, `emotion`, `language`) VALUES
(1, 'abc', 'good', 'test.mp3', 'happy', 'malayalam');

-- --------------------------------------------------------

--
-- Table structure for table `music_app_rating_tbl`
--

CREATE TABLE IF NOT EXISTS `music_app_rating_tbl` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(150) NOT NULL,
  `ratings` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `music_app_rating_tbl`
--

INSERT INTO `music_app_rating_tbl` (`id`, `user_id`, `ratings`) VALUES
(1, '4', '13.25'),
(2, '4', '13'),
(3, '4', '14'),
(4, '4', '14');

-- --------------------------------------------------------

--
-- Table structure for table `music_app_upload`
--

CREATE TABLE IF NOT EXISTS `music_app_upload` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `music` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `music_app_user`
--

CREATE TABLE IF NOT EXISTS `music_app_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `phone_number` varchar(120) NOT NULL,
  `email` varchar(120) NOT NULL,
  `password` varchar(120) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `music_app_user`
--

INSERT INTO `music_app_user` (`id`, `name`, `phone_number`, `email`, `password`) VALUES
(1, 'treesa', '8723456789', 'jerin@gmail.com', 'Abc@12434'),
(3, 'abc', '8723456789', 'sree@gmail.com', 'Sree1234'),
(4, 'jerin', '8723456789', 'jerin@gmail.com', 'Jerin1234'),
(5, 'arya', '8723456789', 'arya@gmail.com', 'Arya@1234');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
