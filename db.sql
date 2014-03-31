DROP TABLE IF EXISTS `groups`;

#
# Table structure for table 'groups'
#

CREATE TABLE `groups` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Dumping data for table 'groups'
#

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
     (1,'root','Administrator'),
     (2,'members','General User'),
     (3,'admin','admin user');



DROP TABLE IF EXISTS `users`;

#
# Table structure for table 'users'
#

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(80) NOT NULL,
  `salt` varchar(40) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `qq` int(11) unsigned NOT NULL DEFAULT 0,  
  `activation_code` varchar(40) DEFAULT NULL,
  `forgotten_password_code` varchar(40) DEFAULT NULL,
  `forgotten_password_time` int(11) unsigned DEFAULT NULL,
  `remember_code` varchar(40) DEFAULT NULL,
  `created_on` int(11) unsigned NOT NULL,
  `last_login` int(11) unsigned DEFAULT NULL,
  `active` tinyint(1) unsigned DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


#
# Dumping data for table 'users'
#

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `salt`, `email`, `activation_code`, `forgotten_password_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
     ('1',0x7f000001,'admin','59beecdf7fc966e2f17fd8f65a4a9aeb09d4a3d4','9462e8eee0','admin@591.com','',NULL,'1268889823','1268889823','1', 'Admin','istrator','ADMIN','0');


DROP TABLE IF EXISTS `users_groups`;

#
# Table structure for table 'users_groups'
#

CREATE TABLE `users_groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`),
  CONSTRAINT `uc_users_groups` UNIQUE (`user_id`, `group_id`),
  CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
     (1,1,1),
     (2,1,2);


DROP TABLE IF EXISTS `login_attempts`;

#
# Table structure for table 'login_attempts'
#

CREATE TABLE `login_attempts` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ip_address` varbinary(16) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `project`;
CREATE TABLE `project` (

  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `gender` char(1) NOT NULL,
  `ages` tinyint(2) NOT NULL,
  `language` char(5) NOT NULL,
  `content` text,
  `Remarks` text ,  
  `need_music` tinyint(1) NOT NULL DEFAULT 0,
  `type` char(2),
  `actor_count` tinyint(2) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL,
  `price` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),  
  KEY `fk_users_idx` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `actor`;
CREATE TABLE `actor` (
  `user_id` int(11) unsigned NOT NULL ,
  `gender1` char(1) NOT NULL,
  `ages1` tinyint(2) NOT NULL,
  `gender2` char(1) NOT NULL,
  `ages2` tinyint(2) NOT NULL,
  `language1` char(5) NOT NULL,
  `language2` char(5) NOT NULL,
  `language_other` varchar(50) NOT NULL,
  `work_time` text,
  `pricing_content` text,
  `price1` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price2` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price3` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price4` mediumint(8) unsigned NOT NULL DEFAULT 0,    
  `price5` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price6` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price7` mediumint(8) unsigned NOT NULL DEFAULT 0,
  `price8` mediumint(8) unsigned NOT NULL DEFAULT 0,    
  `status` tinyint(1) NOT NULL DEFAULT 0,  
  PRIMARY KEY (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `sample`;
CREATE TABLE `sample` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  `type` char(2),
  `gender` char(1) NOT NULL,
  `ages` tinyint(2) NOT NULL,
  `language` char(5) NOT NULL,
  `emotion` char(10) NOT NULL,    
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `user_id` int(11) unsigned NOT NULL,
  `rank` int(11) unsigned NOT NULL DEFAULT 0,  
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



DROP TABLE IF EXISTS `project_actor`;
CREATE TABLE `project_actor` (

  `project_id` int(11) unsigned NOT NULL,  
  `user_id` int(11) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `price` mediumint(8) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `fk_users_idx` (`user_id`)  
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
