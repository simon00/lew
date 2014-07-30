-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 30, 2014 at 08:10 PM
-- Server version: 5.6.17
-- PHP Version: 5.5.12

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
  `reputation` float NOT NULL,
  `skype` varchar(30) NOT NULL,
  `facebook` varchar(256) NOT NULL,
  `birthday` timestamp NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`,`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`comment_receiver`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`comment_writer`) REFERENCES `user` (`user_id`);

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
  ADD CONSTRAINT `learner_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`),
  ADD CONSTRAINT `learner_ibfk_1` FOREIGN KEY (`learner_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `message_ibfk_2` FOREIGN KEY (`message_recipient`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `message_ibfk_1` FOREIGN KEY (`message_sender`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `recevied_reward`
--
ALTER TABLE `recevied_reward`
  ADD CONSTRAINT `recevied_reward_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `recevied_reward_ibfk_1` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`reward_id`);

--
-- Constraints for table `teacher`
--
ALTER TABLE `teacher`
  ADD CONSTRAINT `teacher_ibfk_2` FOREIGN KEY (`language_id`) REFERENCES `language` (`language_id`),
  ADD CONSTRAINT `teacher_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `user` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
