-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2014 at 11:18 AM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET FOREIGN_KEY_CHECKS=0;

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lew`
--

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_writer` int(11) NOT NULL,
  `comment_receiver` int(11) NOT NULL,
  `comment_text` text NOT NULL,
  `date` timestamp NOT NULL,
  `validated` tinyint(1) NOT NULL DEFAULT '0',
  `comment_grade` float NOT NULL,
  PRIMARY KEY (`comment_id`),
  KEY `comment_writer` (`comment_writer`,`comment_receiver`),
  KEY `comment_receiver` (`comment_receiver`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` int(11) NOT NULL,
  `event_organizer` int(11) NOT NULL,
  `event_date` timestamp NOT NULL,
  `event_price` float NOT NULL,
  `event_description_short` varchar(150) NOT NULL,
  `event_description_long` text NOT NULL,
  `event_country` char(31) NOT NULL,
  `event_location` varchar(255) NOT NULL,
  `event_image` varchar(255) NOT NULL,
  PRIMARY KEY (`event_id`),
  KEY `event_organizer` (`event_organizer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

DROP TABLE IF EXISTS `friendship`;
CREATE TABLE IF NOT EXISTS `friendship` (
  `asking_user` int(11) NOT NULL,
  `asked_user` int(11) NOT NULL,
  `friendship_status` tinyint(1) NOT NULL DEFAULT '0',
  `friendship_start_date` timestamp NOT NULL,
  KEY `asking_user` (`asking_user`),
  KEY `asked_user` (`asked_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` char(31) NOT NULL,
  `flag_small` varchar(255) NOT NULL,
  `flag_large` varchar(255) NOT NULL,
  `learners` int(11) NOT NULL,
  `teachers` int(11) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

DROP TABLE IF EXISTS `learner`;
CREATE TABLE IF NOT EXISTS `learner` (
  `learner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_lvl` char(20) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  PRIMARY KEY (`learner_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_sender` int(11) NOT NULL,
  `message_recipient` int(11) NOT NULL,
  `content` text NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reported` tinyint(1) NOT NULL DEFAULT '0',
  `moderated` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`message_id`),
  KEY `message_sender` (`message_sender`,`message_recipient`),
  KEY `message_recipient` (`message_recipient`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `recevied_reward`
--

DROP TABLE IF EXISTS `recevied_reward`;
CREATE TABLE IF NOT EXISTS `recevied_reward` (
  `reward_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `reward_id` (`reward_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

DROP TABLE IF EXISTS `reward`;
CREATE TABLE IF NOT EXISTS `reward` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `reward_name` char(50) NOT NULL,
  `description` text NOT NULL,
  `image_not_yet` varchar(255) NOT NULL,
  `image_received` varchar(255) NOT NULL,
  PRIMARY KEY (`reward_id`),
  UNIQUE KEY `reward_name` (`reward_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

DROP TABLE IF EXISTS `teacher`;
CREATE TABLE IF NOT EXISTS `teacher` (
  `teacher_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_lvl` char(20) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` char(20) NOT NULL,
  `user_lastname` char(20) NOT NULL,
  `user_firstname` char(20) NOT NULL,
  `user_email` char(50) NOT NULL,
  `age` tinyint(4) NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `user_born_country` char(32) NOT NULL,
  `user_current_country` char(32) NOT NULL,
  `user_password` char(32) NOT NULL,
  `user_password_conf` char(32) NOT NULL,
  `registration` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_login` timestamp NOT NULL,
  `profile_picture` varchar(256) NOT NULL,
  `description` text NOT NULL,
  `user_location` varchar(30) NOT NULL,
  `user_account_level` tinyint(4) NOT NULL,
  `reputation` float NOT NULL DEFAULT 5,
  `skype` varchar(30) NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_name`, `user_lastname`, `user_firstname`, `user_email`, `age`, `gender`, `user_born_country`, `user_current_country`, `user_password`, `user_password_conf`, `registration`, `last_login`, `profile_picture`, `description`, `user_location`, `user_account_level`, `reputation`, `skype`, `facebook`, `birthday`) VALUES
( 'user1', 'lastname1', 'firstname1', 'email1@example.com', 21, 0, 'Taiwan', 'Taiwan', '', '', '2014-08-01 08:57:44', '2014-08-01 08:57:44', '', '', 'Taipei', 0, 0, '', '', '2014-08-01 08:57:44'),
( 'user2', 'lastname2', 'firstname2', 'email2@example.com', 56, 1, 'China', 'Japan', '', '', '2014-08-01 08:57:44', '2014-08-01 08:57:44', '', '', 'Tokyo', 0, 0, '', '', '2014-08-01 08:57:44'),
( 'user3', 'lastname3', 'firstname3', 'email3@example.com', 54, 1, 'China', 'Japan', '', '', '2014-08-01 08:57:44', '2014-08-01 08:58:51', '', '', 'Tokyo', 0, 0, '', '', '2014-08-01 08:58:51'),
( 'user4', 'lastname4', 'firstname4', 'email4@example.com', 28, 0, 'China', 'Japan', '', '', '2014-08-01 08:57:44', '2014-08-01 09:00:02', '', '', 'Tokyo', 0, 0, '', '', '2014-08-01 09:00:02'),
( 'user5', 'lastname5', 'firstname5', 'email5@example.com', 20, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user6', 'lastname6', 'firstname6', 'email6@example.com', 36, 0, 'China', 'Japan', '', '', '2014-08-01 08:57:44', '2014-08-01 09:00:02', '', '', 'Tokyo', 0, 0, '', '', '2014-08-01 09:00:02'),
( 'user7', 'lastname7', 'firstname7', 'email7@example.com', 28, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user8', 'lastname8', 'firstname8', 'email8@example.com', 19, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user9', 'lastname9', 'firstname9', 'email9@example.com', 25, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user10', 'lastname10', 'firstname', 'email@example.com', 32, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user11', 'lastname11', 'firstname11', 'email11@example.com', 32, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user12', 'lastname12', 'firstname12', 'email12@example.com', 34, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user13', 'lastname13', 'firstname13', 'email13@example.com', 17, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user14', 'lastname14', 'firstname14', 'email14@example.com', 19, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user15', 'lastname15', 'firstname15', 'email15@example.com', 24, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user16', 'lastname16', 'firstname16', 'email16@example.com', 23, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user17', 'lastname17', 'firstname17', 'email17@example.com', 29, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user18', 'lastname18', 'firstname18', 'email18@example.com', 27, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user19', 'lastname19', 'firstname19', 'email19@example.com', 42, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user20', 'lastname20', 'firstname20', 'email20@example.com', 35, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user21', 'lastname21', 'firstname21', 'email21@example.com', 15, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user22', 'lastname22', 'firstname22', 'email22@example.com', 28, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user23', 'lastname23', 'firstname23', 'email23@example.com', 40, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user24', 'lastname24', 'firstname24', 'email24@example.com', 32, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user25', 'lastname25', 'firstname25', 'email25@example.com', 30, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user26', 'lastname26', 'firstname26', 'email26@example.com', 32, 0, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17'),
( 'user27', 'lastname27', 'firstname27', 'email27@example.com', 61, 1, 'France', 'France', '', '', '2014-08-01 09:00:17', '2014-08-01 09:00:17', '', '', 'Paris', 0, 0, 'blabla', 'www.facebook.com/test', '2014-08-01 09:00:17');
--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_writer`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_receiver`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`event_organizer`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `friendship`
--
ALTER TABLE `friendship`
  ADD CONSTRAINT `friendship_ibfk_1` FOREIGN KEY (`asking_user`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `friendship_ibfk_2` FOREIGN KEY (`asked_user`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `learner`
--
ALTER TABLE `learner`
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `learner_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`message_sender`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`message_recipient`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `recevied_reward`
--
ALTER TABLE `recevied_reward`
  ADD CONSTRAINT `recevied_reward_ibfk_1` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`reward_id`),
  ADD CONSTRAINT `recevied_reward_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
