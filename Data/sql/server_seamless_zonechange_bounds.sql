/*
MySQL Data Transfer
Source Host: localhost
Source Database: ffxiv_server
Target Host: localhost
Target Database: ffxiv_server
Date: 8/14/2016 9:43:11 AM
*/

SET FOREIGN_KEY_CHECKS = 0;
SET autocommit = 0;

-- ----------------------------
-- Table structure for server_seamless_zonechange_bounds
-- ----------------------------
CREATE TABLE `server_seamless_zonechange_bounds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `regionId` int(10) unsigned NOT NULL,
  `zoneId1` int(10) unsigned NOT NULL,
  `zoneId2` int(10) unsigned NOT NULL,
  `zone1_boundingbox_x1` float NOT NULL,
  `zone1_boundingbox_y1` float NOT NULL,
  `zone1_boundingbox_x2` float NOT NULL,
  `zone1_boundingbox_y2` float NOT NULL,
  `zone2_boundingbox_x1` float NOT NULL,
  `zone2_boundingbox_y1` float NOT NULL,
  `zone2_boundingbox_x2` float NOT NULL,
  `zone2_boundingbox_y2` float NOT NULL,
  `merge_boundingbox_x1` float NOT NULL,
  `merge_boundingbox_y1` float NOT NULL,
  `merge_boundingbox_x2` float NOT NULL,
  `merge_boundingbox_y2` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('1', '101', '133', '230',		'-457', '131', '-436', '142',				'-460',	'92', '-439', '100',					'-454', '101', '-439', '128');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('2', '101', '133', '230',		'-486', '228', '-501', '218',				'-482',	'255', '-503', '242',					'-490', '238', '-501', '229');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('3', '101', '133', '128',		'-85', '165', '-79', '185',					'-51', '149', '-47', '167',						'-71', '160', '-69', '174');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('4', '101', '133', '230',		'-483', '200', '-496', '181',				'-506', '206', '-514', '177',					'-500', '198', '-505', '185');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('5', '101', '128', '130',		'877', '-285', '885', '-283',				'922', '-354', '932', '-362',					'901', '-304', '887', '-332');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('6', '101', '130', '135',		'990.1', '-1544', '988.4', '-1556.4',		'913', '-1628', '928', '-1630',			 		'950', '-1576', '962', '-1635');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('7', '101', '128', '129',		'-469.7', '-604', '-477', '-614',			'-546.1', '-667.2', '-554.5', '-676.8',			'-522', '-616', '-495', '-645');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('8', '101', '129', '135',		'-996.2', '-1301.1', '-984.2', '-1308.3',	'-987.7', '-1384.8', '-988', '-1398.4',			'-977.3', '-1363.6', '-977.5', '-1327.2');

INSERT INTO `server_seamless_zonechange_bounds` VALUES ('9', '102', '143', '145',		'693.2', '592.4', '675.8', '584.6',			'780.8', '689.7', '798.3', '697.5',				'728.5', '645', '745.5', '637');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('10', '102', '143', '148',		'-1118.6', '-3.4', '-1101', '3.4',			'-1249.5', '3.4', '-1266.1', '-3.4',			'-1187.2', '-8.9', '-1180.8', '8.9');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('11', '102', '143', '147',		'-230.2', '836.1', '-210.6', '839.2',		'-302', '1018.2', '-282.5', '1016.9',	 		'-298', '912.2', '-306.4', '935.1');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('12', '102', '143', '144',		'742.5', '-322.7', '760.2', '-320.1',		'799.9', '-551.1', '802.3', '-570.3',			'783.6', '-400.5', '810.4', '-409.7');

INSERT INTO `server_seamless_zonechange_bounds` VALUES ('13', '103', '150', '151',		'922.5', '-700.5', '933.5', '-707.5',		'1194.3', '-946.5', '1189.4', '-966.8',			'1100.4', '-831', '1075', '-838.2');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('14', '103', '150', '154',		'452.5', '119.2', '435.5', '108.1',			'380.5', '410.5', '388.5', '421.8',				'375.3', '215.2', '387.5', '228');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('15', '103', '150', '153',		'-648.8', '-836.5', '-659.8', '-819.5',		'-1058.9', '-506.4', '-1075.4', '-522.6',		'-832.8', '-657.9', '-831.4', '-685.7');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('16', '103', '150', '152',		'-840.5', '-1350.5', '-857.5', '-1351.8',	'-901.9', '-1603.5', '-890.1', '-1607.1',		'-918.3', '-1478', '-869.6', '-1464.4');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('17', '103', '206', '150',		'-194.5', '-1085.8', '-189.5', '-1090.1',	'-197.1', '-1075.2', '-186.95', '-1073',		'-194.5', '-1079.1', '-189.5', '-1081.86');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('18', '103', '155', '206',		'115', '-1219', '55', '-1217',				'102.5', '-1239.5', '90.6', '-1234.2',			'98.9', '-1223.9', '106.1', '-1231.8');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('19', '103', '155', '150',		'317.5', '-1021.96', '322.5', '-1025.9',	'313', '-1011.2', '326.9', '-1009',				'317.5', '-1014.8', '322.5', '-1018.05');

INSERT INTO `server_seamless_zonechange_bounds` VALUES ('20', '104', '170', '175',		 '87', '178', '110', '189',					'89', '142', '108', '150',						'94', '158', '108', '167');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('21', '104', '175', '209',		 '-134', '84', '-95', '92',					'-120', '139', '-82', '143',					'-120', '125', '-96', '124');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('22', '104', '170', '175',		'-70', '-47', '-47', '-17',					'-117', '-43', '-108', '-28',					'-99', '-43', '-86', '-28');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('23', '104', '170', '175',		'-39', '-33', '-24', '-9',					'22', '-7', '23', '22',							'-7', '-26', '-1', '-4');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('24', '104', '175', '209',		'-243', '82', '-208', '107',				'-264', '138', '-230', '173',					'-254', '109', '-220', '128');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('25', '104', '175', '209',		'0', '173', '24', '179',					'-23', '204', '9', '232',						'-6', '185', '13', '201');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('26', '104', '175', '209',		 '-20', '99', '5', '119',					'-57', '124', '-31', '145',						'-41', '115', '-15', '127');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('27', '104', '170', '172',		 '-596', '-405.5', '-621.3', '-403.6',		'-828.5', '-336.6', '-833.5', '-297.2',			'-689.3', '-419.5', '-659.4', '-402.9');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('28', '104', '170', '173',		 '-229', '-733.3', '-222.2', '-739.4',		'-473.9', '-913.4', '-472.5', '-927.5',			'-390.4', '-851.9', '-377.6', '-876.1');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('29', '104', '170', '171',		 '749.7', '-585', '732', '-568.7',			'931.5', '-624.5', '914.5', '-599.9',			'877', '-595.5', '874.3', '-629.9');
INSERT INTO `server_seamless_zonechange_bounds` VALUES ('30', '104', '170', '174',		 '1433.9', '465.4', '1428.1', '475.5',		'1446.5', '480.4', '1440.5', '485.7',			'1441.8', '478.5', '1432.5', '479.5');





COMMIT;