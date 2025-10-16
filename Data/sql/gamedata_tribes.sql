--
-- Table structure for table `gamedata_tribes`
--
SET autocommit = 0;
DROP TABLE IF EXISTS `gamedata_tribes`;
CREATE TABLE `gamedata_tribes` (
    `id` smallint(5) NOT NULL,
    `bonus1Type` int(11) NOT NULL,
    `bonus1Value` smallint(6) NOT NULL,
    `bonus2Type` int(11) NOT NULL,
    `bonus2Value` smallint(6) NOT NULL,
    `bonus3Type` int(11) NOT NULL,
    `bonus3Value` smallint(6) NOT NULL,
    `bonus4Type` int(11) NOT NULL,
    `bonus4Value` smallint(6) NOT NULL,
    `bonus5Type` int(11) NOT NULL,
    `bonus5Value` smallint(6) NOT NULL,
    `bonus6Type` int(11) NOT NULL,
    `bonus6Value` smallint(6) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
LOCK TABLES `gamedata_tribes` WRITE;
-- Data retrieved from https://web.archive.org/web/20131222130419/http://valk.dancing-mad.com/tables/attribute-table/
-- TODO: Update values with verified 1.23b data. Data retrieved is from ARR 2.0
-- Strength, Vitality, Dexterity, Intelligence, Mind, Piety
INSERT INTO `gamedata_tribes` VALUES (0, 15004, 0, 15005, 0, 15006, 0, 15007, 0, 15008, 0, 15009, 0); -- Clanless
INSERT INTO `gamedata_tribes` VALUES (1, 15004, 4, 15005, 3, 15006, 2, 15007, 4, 15008, 1, 15009, 4); -- Midlander Male
INSERT INTO `gamedata_tribes` VALUES (2, 15004, 4, 15005, 3, 15006, 2, 15007, 4, 15008, 1, 15009, 4); -- Midlander Female
INSERT INTO `gamedata_tribes` VALUES (3, 15004, 6, 15005, 5, 15006, 3, 15007, 1, 15008, 3, 15009, 0); -- Highlander Male
INSERT INTO `gamedata_tribes` VALUES (4, 15004, 2, 15005, 1, 15006, 6, 15007, 5, 15008, 0, 15009, 4); -- Wildwood Male
INSERT INTO `gamedata_tribes` VALUES (5, 15004, 2, 15005, 1, 15006, 6, 15007, 5, 15008, 0, 15009, 4); -- Wildwood Female
INSERT INTO `gamedata_tribes` VALUES (6, 15004, 3, 15005, 2, 15006, 3, 15007, 6, 15008, 3, 15009, 1); -- Duskwight Male
INSERT INTO `gamedata_tribes` VALUES (7, 15004, 3, 15005, 2, 15006, 3, 15007, 6, 15008, 3, 15009, 1); -- Duskwight Female
INSERT INTO `gamedata_tribes` VALUES (8, 15004, 1, 15005, 1, 15006, 5, 15007, 4, 15008, 3, 15009, 4); -- Plainsfolk Male
INSERT INTO `gamedata_tribes` VALUES (9, 15004, 1, 15005, 1, 15006, 5, 15007, 4, 15008, 3, 15009, 4); -- Plainsfolk Female
INSERT INTO `gamedata_tribes` VALUES (10, 15004, 0, 15005, 0, 15006, 3, 15007, 4, 15008, 5, 15009, 6); -- Dunesfolk Male
INSERT INTO `gamedata_tribes` VALUES (11, 15004, 0, 15005, 0, 15006, 3, 15007, 4, 15008, 5, 15009, 6); -- Dunesfolk Female
INSERT INTO `gamedata_tribes` VALUES (12, 15004, 4, 15005, 3, 15006, 5, 15007, 1, 15008, 2, 15009, 3); -- Seeker of the Sun Female
INSERT INTO `gamedata_tribes` VALUES (13, 15004, 1, 15005, 0, 15006, 4, 15007, 2, 15008, 6, 15009, 5); -- Keeper of the Moon Female
INSERT INTO `gamedata_tribes` VALUES (14, 15004, 5, 15005, 6, 15006, 1, 15007, 0, 15008, 4, 15009, 2); -- Sea Wolf Male
INSERT INTO `gamedata_tribes` VALUES (15, 15004, 3, 15005, 4, 15006, 0, 15007, 3, 15008, 5, 15009, 3); -- Hellsguard Male
UNLOCK TABLES;
COMMIT;