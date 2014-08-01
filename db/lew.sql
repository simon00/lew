-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Aug 01, 2014 at 09:13 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET FOREIGN_KEY_CHECKS=0;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


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

CREATE TABLE `comment` (
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

CREATE TABLE `event` (
  `event_id` int(11) NOT NULL AUTO_INCREMENT,
  `event_name` varchar(150) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_name`, `event_organizer`, `event_date`, `event_price`, `event_description_short`, `event_description_long`, `event_country`, `event_location`, `event_image`) VALUES
( 'event1', 7, '2014-08-01 18:04:41', 200, 'event descp1', 'long event descp1', 'france', '12 rue des debiles', ''),
( 'event2', 7, '2014-08-01 18:05:15', 2000, 'event descp2', 'long event descp2', 'japan', '12 rue des japonais', ''),
( 'event3', 7, '2014-08-01 18:13:21', 2000, 'event descp3', 'long event descp3', 'china', '12 rue des chinois', ''),
( 'event4', 7, '2014-08-01 18:14:28', 2000, 'event descp4', 'long event descp4', 'taiwan', '12 rue des taiwanais', ''),
( 'event5', 7, '2014-08-01 18:14:54', 180.5, 'event descp5', 'long event descp5', 'suede', '12 rue des suedois', '');

-- --------------------------------------------------------

--
-- Table structure for table `friendship`
--

CREATE TABLE `friendship` (
  `asking_user` int(11) NOT NULL,
  `asked_user` int(11) NOT NULL,
  `friendship_status` tinyint(1) NOT NULL DEFAULT '0',
  `friendship_start_date` timestamp NOT NULL,
  KEY `asking_user` (`asking_user`),
  KEY `asked_user` (`asked_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `friendship`
--

INSERT INTO `friendship` (`asking_user`, `asked_user`, `friendship_status`, `friendship_start_date`) VALUES
(6, 8, 1, '2014-08-01 18:15:23'),
(16, 22, 0, '2014-08-01 18:17:57'),
(25, 29, 0, '2014-08-01 18:18:55'),
(13, 16, 1, '2014-08-01 18:18:55'),
(9, 10, 0, '2014-08-01 18:21:09'),
(12, 22, 0, '2014-08-01 18:21:09'),
(23, 19, 0, '2014-08-01 18:21:09'),
(31, 12, 1, '2014-08-01 18:21:09'),
(6, 22, 1, '2014-08-01 18:21:09'),
(23, 21, 1, '2014-08-01 18:21:09'),
(7, 20, 1, '2014-08-01 18:21:09'),
(11, 23, 1, '2014-08-01 18:21:09'),
(32, 7, 1, '2014-08-01 18:21:09'),
(7, 21, 0, '2014-08-01 18:21:09'),
(6, 27, 1, '2014-08-01 19:11:49'),
(10, 19, 1, '2014-08-01 19:11:49'),
(9, 20, 1, '2014-08-01 19:11:49'),
(21, 25, 1, '2014-08-01 19:11:49'),
(24, 32, 1, '2014-08-01 19:11:49');

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_name` char(31) NOT NULL,
  `flag_small` varchar(255) NOT NULL,
  `flag_large` varchar(255) NOT NULL,
  `learners` int(11) NOT NULL,
  `teachers` int(11) NOT NULL,
  PRIMARY KEY (`language_id`),
  UNIQUE KEY `language_name` (`language_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `language`
--

INSERT INTO `language` ( `language_name`, `flag_small`, `flag_large`, `learners`, `teachers`) VALUES
( 'language1', '', '', 0, 0),
( 'language2', '', '', 0, 0),
( 'language3', '', '', 0, 0),
( 'language4', '', '', 0, 0),
( 'language5', '', '', 0, 0),
( 'language6', '', '', 0, 0),
( 'language7', '', '', 0, 0),
( 'language8', '', '', 0, 0),
( 'language9', '', '', 0, 0),
( 'language10', '', '', 0, 0),
( 'language11', '', '', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `learner`
--

CREATE TABLE `learner` (
  `learner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_lvl` char(20) NOT NULL,
  `priority` tinyint(4) NOT NULL,
  PRIMARY KEY (`learner_id`,`language_id`),
  UNIQUE KEY `learner_id` (`learner_id`,`language_id`),
  KEY `language_id` (`language_id`),
  KEY `learner_id_2` (`learner_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `learner`
--

INSERT INTO `learner` (`learner_id`, `language_id`, `language_lvl`, `priority`) VALUES
(6, 2, '', 1),
(6, 8, '', 2),
(6, 9, '', 0),
(7, 1, '', 0),
(7, 10, '', 0),
(8, 12, '', 0),
(9, 13, '', 0),
(10, 9, '', 0),
(11, 12, '', 0),
(12, 7, '', 0),
(13, 10, '', 0),
(14, 2, '', 0),
(15, 5, '', 0),
(16, 1, '', 0),
(17, 13, '', 0),
(18, 5, '', 0),
(18, 10, '', 0),
(19, 2, '', 0),
(20, 1, '', 0),
(20, 11, '', 0),
(21, 7, '', 0),
(22, 2, '', 0),
(23, 5, '', 0),
(24, 7, '', 0),
(26, 8, '', 0),
(29, 9, '', 0),
(30, 10, '', 0),
(31, 2, '', 0),
(32, 5, '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
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

CREATE TABLE `recevied_reward` (
  `reward_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reward_id`,`user_id`),
  KEY `reward_id` (`reward_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recevied_reward`
--

INSERT INTO `recevied_reward` (`reward_id`, `user_id`, `date`) VALUES
(1, 6, '2014-08-01 18:58:56'),
(1, 7, '2014-08-01 18:58:56'),
(1, 8, '2014-08-01 18:58:56'),
(1, 13, '2014-08-01 18:58:56'),
(1, 17, '2014-08-01 18:58:56'),
(1, 19, '2014-08-01 18:58:56'),
(1, 22, '2014-08-01 18:58:56'),
(1, 32, '2014-08-01 18:58:56'),
(2, 8, '2014-08-01 18:58:56'),
(2, 13, '2014-08-01 18:58:56'),
(2, 17, '2014-08-01 18:58:56'),
(2, 18, '2014-08-01 18:58:56'),
(2, 20, '2014-08-01 18:58:56'),
(2, 21, '2014-08-01 18:58:56'),
(3, 8, '2014-08-01 18:58:56'),
(3, 13, '2014-08-01 18:58:56'),
(3, 14, '2014-08-01 18:58:56'),
(3, 19, '2014-08-01 18:58:56'),
(3, 20, '2014-08-01 18:58:56'),
(3, 22, '2014-08-01 18:58:56'),
(3, 24, '2014-08-01 18:58:56'),
(4, 8, '2014-08-01 18:58:56'),
(4, 16, '2014-08-01 18:58:56'),
(4, 20, '2014-08-01 18:58:56'),
(5, 8, '2014-08-01 18:58:56'),
(5, 9, '2014-08-01 18:58:56'),
(5, 16, '2014-08-01 18:58:56'),
(5, 19, '2014-08-01 18:58:56'),
(6, 10, '2014-08-01 18:58:56'),
(6, 11, '2014-08-01 18:58:56'),
(6, 24, '2014-08-01 18:58:56'),
(6, 25, '2014-08-01 18:58:56'),
(6, 27, '2014-08-01 18:58:56'),
(7, 12, '2014-08-01 18:58:56'),
(7, 13, '2014-08-01 18:58:56'),
(7, 14, '2014-08-01 18:58:56'),
(7, 15, '2014-08-01 18:58:56');

-- --------------------------------------------------------

--
-- Table structure for table `reward`
--

CREATE TABLE `reward` (
  `reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `reward_name` char(50) NOT NULL,
  `description` text NOT NULL,
  `image_not_yet` varchar(255) NOT NULL,
  `image_received` varchar(255) NOT NULL,
  PRIMARY KEY (`reward_id`),
  UNIQUE KEY `reward_name` (`reward_name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `reward`
--

INSERT INTO `reward` ( `reward_name`, `description`, `image_not_yet`, `image_received`) VALUES
( 'reward1', 'blabla', '', ''),
( 'reward2', 'blabla', '', ''),
( 'reward3', 'blabla', '', ''),
( 'reward4', 'blabla', '', ''),
( 'reward5', 'blabla', '', ''),
( 'reward6', 'blabla', '', ''),
( 'reward7', 'blabla', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_lvl` char(20) NOT NULL,
  PRIMARY KEY (`teacher_id`,`language_id`),
  KEY `language_id` (`language_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `language_id`, `language_lvl`) VALUES
(6, 11, ''),
(7, 7, ''),
(8, 10, ''),
(9, 11, ''),
(10, 10, ''),
(11, 9, ''),
(12, 7, ''),
(12, 9, ''),
(13, 7, ''),
(13, 12, ''),
(14, 5, ''),
(15, 2, ''),
(16, 8, ''),
(17, 7, ''),
(19, 6, ''),
(20, 5, ''),
(21, 2, ''),
(22, 1, ''),
(23, 8, ''),
(24, 7, ''),
(25, 8, ''),
(26, 9, ''),
(26, 10, ''),
(26, 13, ''),
(27, 12, ''),
(28, 11, ''),
(29, 11, ''),
(30, 7, ''),
(31, 2, ''),
(32, 12, '');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
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
  `reputation` float NOT NULL DEFAULT '5',
  `skype` varchar(30) NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `birthday` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=33 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` ( `user_name`, `user_lastname`, `user_firstname`, `user_email`, `age`, `gender`, `user_born_country`, `user_current_country`, `user_password`, `user_password_conf`, `registration`, `last_login`, `profile_picture`, `description`, `user_location`, `user_account_level`, `reputation`, `skype`, `facebook`, `birthday`) VALUES
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
SET FOREIGN_KEY_CHECKS=1;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
