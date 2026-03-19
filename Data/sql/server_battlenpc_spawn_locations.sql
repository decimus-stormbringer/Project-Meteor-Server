-- MySQL dump 10.13  Distrib 5.7.18, for Win64 (x86_64)
--
-- Host: localhost    Database: ffxiv_server
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `server_battlenpc_spawn_locations`
--
CREATE DATABASE if NOT EXISTS `ffxiv_server` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ffxiv_server`;

DROP TABLE IF EXISTS `server_battlenpc_spawn_locations`;
CREATE TABLE IF NOT EXISTS `server_battlenpc_spawn_locations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `bnpcId` int(10) unsigned NOT NULL,
  `uniqueId` varchar(255) NOT NULL DEFAULT '',
  `zoneId` smallint(5) unsigned NOT NULL,
  `posX` float NOT NULL,
  `posY` float NOT NULL,
  `posZ` float NOT NULL,
  `rot` float NOT NULL,
  `privateArea` varchar(32) NOT NULL DEFAULT '',
  `privateAreaLevel` int(11) NOT NULL DEFAULT '0',
  `hp` int(10) unsigned NOT NULL DEFAULT '100',
  `hpMax`  int(10) unsigned NOT NULL DEFAULT '100',
  `hpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `mp` int(10) unsigned NOT NULL DEFAULT '100',
  `mpMax` smallint(5) unsigned NOT NULL DEFAULT '100',
  `mpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `tpp` smallint(5) unsigned NOT NULL DEFAULT '100',
  `actorState` smallint(5) unsigned NOT NULL DEFAULT '0',
  `animId` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roams` boolean NOT NULL DEFAULT '1',
  `roamDelay` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `modelSize` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `immunity` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = 'utf8' */;

--
-- Dumping data for table `server_battlenpc_spawn_locations`
/*!40000 ALTER TABLE `server_battlenpc_spawn_locations` DISABLE KEYS */;
REPLACE INTO `server_battlenpc_spawn_locations` (`id`, `bnpcId`, `uniqueId`, `zoneId`, `posX`, `posY`, `posZ`, `rot`, `privateArea`, `privateAreaLevel`, `hp`, `hpMax`, `hpp`, `mp`, `mpp`, `mpMax`, `tpp`, `actorState`, `animId`, `roams`, `roamDelay`, `modelSize`, `immunity`) VALUES
(1,1,'wharf_rat_1',			170,-17,184.4,-66,-2.51,'',0,		100,100,100,100,100,100,100,		0,0,1,8,1,0),
(2,1,'wharf_rat_2',			170,-10,183.6,-70,-3.14,'',0,		100,100,100,100,100,100,100,		0,0,1,8,1,0),
(3,1,'wharf_rat_3',			170,-15,184.5,-75,-3.15,'',0,		100,100,100,100,100,100,100,		0,0,1,8,1,0),
(4,2,'sheep_1',				170,-12.5,183.6,-72.1,0,'',0,		100,100,100,100,100,100,100,		0,0,1,8,1,0),
(5,2,'sheep_2',				170,-10.4,183.6,-66,0,'',0,			100,100,100,100,100,100,100,		0,0,1,8,1,0);


/*!40000 ALTER TABLE `server_battlenpc_spawn_locations` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-11 14:47:29
