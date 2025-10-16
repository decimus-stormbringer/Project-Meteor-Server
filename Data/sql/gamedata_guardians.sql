--
-- Table structure for table `gamedata_guardians`
--
SET autocommit = 0;
DROP TABLE IF EXISTS `gamedata_guardians`;
CREATE TABLE `gamedata_guardians` (
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
LOCK TABLES `gamedata_guardians` WRITE;
-- Data retrieved from https://finalfantasy.fandom.com/wiki/The_Twelve#Player_Guardian
-- TODO: Update values with verified 1.23b data.
-- Fire, Ice, Wind, Earth, Lightning, Water
INSERT INTO `gamedata_guardians` VALUES (1, 15010, 0, 15011, 4, 15012, 3, 15013, 2, 15014, 2, 15014, 2); -- Halone
INSERT INTO `gamedata_guardians` VALUES (2, 15010, 0, 15011, 4, 15012, 3, 15013, 2, 15014, 2, 15014, 2); -- Menphina
INSERT INTO `gamedata_guardians` VALUES (3, 15010, 2, 15011, 2, 15012, 2, 15013, 3, 15014, 0, 15014, 4); -- Thaliak
INSERT INTO `gamedata_guardians` VALUES (4, 15010, 2, 15011, 2, 15012, 2, 15013, 3, 15014, 0, 15014, 4); -- Nymeia
INSERT INTO `gamedata_guardians` VALUES (5, 15010, 3, 15011, 0, 15012, 4, 15013, 2, 15014, 2, 15014, 2); -- Llymlaen
INSERT INTO `gamedata_guardians` VALUES (6, 15010, 3, 15011, 0, 15012, 4, 15013, 2, 15014, 2, 15014, 2); -- Oschon
INSERT INTO `gamedata_guardians` VALUES (7, 15010, 2, 15011, 2, 15012, 2, 15013, 0, 15014, 4, 15014, 3); -- Byregot
INSERT INTO `gamedata_guardians` VALUES (8, 15010, 2, 15011, 2, 15012, 2, 15013, 0, 15014, 4, 15014, 3); -- Rhalgr
INSERT INTO `gamedata_guardians` VALUES (9, 15010, 4, 15011, 3, 15012, 0, 15013, 2, 15014, 2, 15014, 2); -- Azeyma
INSERT INTO `gamedata_guardians` VALUES (10, 15010, 4, 15011, 3, 15012, 0, 15013, 2, 15014, 2, 15014, 2); -- Nald'thal
INSERT INTO `gamedata_guardians` VALUES (11, 15010, 2, 15011, 2, 15012, 2, 15013, 4, 15014, 3, 15014, 0); -- Nophica
INSERT INTO `gamedata_guardians` VALUES (12, 15010, 2, 15011, 2, 15012, 2, 15013, 4, 15014, 3, 15014, 0); -- Althyk
UNLOCK TABLES;
COMMIT;