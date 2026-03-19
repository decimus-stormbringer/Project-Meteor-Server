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
-- Table structure for table `server_battlenpc_mob_types`
--

CREATE DATABASE if NOT EXISTS `ffxiv_server` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ffxiv_server`;

-- Dumping structure for table ffxiv_server.server_eventnpc_mob_types
DROP TABLE IF EXISTS `server_battlenpc_mob_types`;
CREATE TABLE IF NOT EXISTS `server_battlenpc_mob_types` (
  `bnpcId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `actorId` int(10) unsigned NOT NULL,
  `displayName` varchar(255) NOT NULL,
  `speed` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `isHostile` tinyint (3) unsigned NOT NULL DEFAULT '1',
  `detectionType` smallint(5) unsigned NOT NULL DEFAULT '0',
  `detectionRange` smallint(5) unsigned NOT NULL DEFAULT '5',
  `respawnTime` tinyint(3) unsigned NOT NULL DEFAULT '10',
  `combatDelay` smallint(5) unsigned NOT NULL,
  `allegiance` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `currentJob` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `str` smallint(4) unsigned NOT NULL DEFAULT '1',
  `vit` smallint(4) unsigned NOT NULL DEFAULT '1',
  `dex` smallint(4) unsigned NOT NULL DEFAULT '1',
  `int` smallint(4) unsigned NOT NULL DEFAULT '1',
  `mnd` smallint(4) unsigned NOT NULL DEFAULT '1',
  `pie` smallint(4) unsigned NOT NULL DEFAULT '1',
  `att` smallint(4) unsigned NOT NULL DEFAULT '40',
  `acc` smallint(4) unsigned NOT NULL DEFAULT '1',
  `def` smallint(4) unsigned NOT NULL DEFAULT '1',
  `eva` smallint(4) unsigned NOT NULL DEFAULT '1',
  `slash` float NOT NULL DEFAULT '1',
  `pierce` float NOT NULL DEFAULT '1',
  `h2h` float NOT NULL DEFAULT '1',
  `blunt` float NOT NULL DEFAULT '1',
  `fire` float NOT NULL DEFAULT '1',
  `ice` float NOT NULL DEFAULT '1',
  `wind` float NOT NULL DEFAULT '1',
  `lightning` float NOT NULL DEFAULT '1',
  `earth` float NOT NULL DEFAULT '1',
  `water` float NOT NULL DEFAULT '1',
  `element` tinyint(4) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`bnpcId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = 'utf8' */;

--
-- Dumping data for table `server_battlenpc_mob_types`
/*!40000 ALTER TABLE `server_battlenpc_mob_types` DISABLE KEYS */;
REPLACE INTO `server_battlenpc_mob_types` (`bnpcId`, `actorId`, `displayName`, `speed`, `isHostile`, `detectionType`, `detectionRange`, `respawnTime`, `combatDelay`, `allegiance`, `currentjob`, `level`, `str`, `vit`, `dex`, `int`, `mnd`, `pie`, `att`, `acc`, `def`, `eva`, `slash`, `pierce`, `h2h`, `blunt`, `fire`, `ice`, `wind`, `lightning`, `earth`, `water`, `element`) VALUES
(1,2104001,'Rat Test',4,1,0,5,60,4200,0,0,1,		1,1,1,1,1,1,15,1,1,1,		1,1,1,1,1,1,1,1,1,1,0),
(2,2106018,'Sheep Test',4,1,0,5,30,4200,0,0,1,   	1,1,1,1,1,1,15,1,1,1,        1,1,1,1,1,1,1,1,1,1,0);
/*!40000 ALTER TABLE `server_battlenpc_mob_types` ENABLE KEYS */;
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

-- Dump completed on 2017-10-11 14:48:52
