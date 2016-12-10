/*
MySQL Data Transfer
Source Host: localhost
Source Database: crm
Target Host: localhost
Target Database: crm
Date: 2016/12/10 22:42:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for b_gather
-- ----------------------------
CREATE TABLE `b_gather` (
  `id` int(11) NOT NULL auto_increment,
  `owner_usr` int(11) default NULL,
  `creater` varchar(50) default NULL,
  `createTime` datetime default NULL,
  `updater` varchar(50) default NULL,
  `updateTime` datetime default NULL,
  `remark` longtext,
  `c_id` int(11) NOT NULL,
  `c_name` varchar(200) NOT NULL,
  `c_type` varchar(10) default NULL,
  `payer` varchar(100) default NULL,
  `pay_date` datetime default NULL,
  `pay_type` varchar(100) default NULL,
  `bill_code` varchar(100) default NULL,
  `handler` varchar(100) default NULL,
  `total` double default NULL,
  `statusid` varchar(100) default NULL,
  `status` varchar(10) default NULL,
  `auditor` varchar(50) default NULL,
  `audit_date` datetime default NULL,
  `audit_idea` longtext,
  `code` varchar(100) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_need_gather
-- ----------------------------
CREATE TABLE `b_need_gather` (
  `id` int(11) NOT NULL auto_increment,
  `sale_id` int(11) NOT NULL,
  `pid` int(11) default NULL,
  `owner_usr` int(11) default NULL,
  `shareId` longtext,
  `read_shareId` longtext,
  `creator` varchar(50) default NULL,
  `createTime` datetime default NULL,
  `updater` varchar(50) default NULL,
  `updateTime` datetime default NULL,
  `remark` longtext,
  `c_id` int(11) NOT NULL,
  `c_name` varchar(200) NOT NULL,
  `c_type` varchar(10) default NULL,
  `build_date` datetime default NULL,
  `sale_code` varchar(100) default NULL,
  `total` double default NULL,
  `payed` double default NULL,
  `balance` double default NULL,
  `over_flag` char(1) default NULL,
  `status` varchar(20) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKEE08F9675C892D95` (`pid`),
  KEY `FKEE08F967BCDAE372` (`sale_id`),
  CONSTRAINT `FKEE08F9675C892D95` FOREIGN KEY (`pid`) REFERENCES `b_gather` (`id`),
  CONSTRAINT `FKEE08F967BCDAE372` FOREIGN KEY (`sale_id`) REFERENCES `b_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_order
-- ----------------------------
CREATE TABLE `b_order` (
  `id` int(11) NOT NULL auto_increment,
  `owner_usr` int(11) default NULL,
  `creater` varchar(50) default NULL,
  `createTime` datetime default NULL,
  `updater` varchar(50) default NULL,
  `updateTime` datetime default NULL,
  `remark` longtext,
  `code` varchar(100) default NULL,
  `order_date` date default NULL,
  `c_id` int(11) default NULL,
  `c_name` varchar(100) default NULL,
  `c_type` varchar(20) default NULL,
  `linkman` varchar(100) default NULL,
  `telephone` varchar(100) default NULL,
  `address` varchar(200) default NULL,
  `seller` varchar(100) default NULL,
  `total` double default NULL,
  `agio` double default NULL,
  `agio_total` double default NULL,
  `auditor` varchar(100) default NULL,
  `audit_date` date default NULL,
  `status_id` varchar(255) default NULL,
  `status` varchar(20) default NULL,
  `audit_reason` longtext,
  `custom1` varchar(100) default NULL,
  `custom2` varchar(100) default NULL,
  `custom3` varchar(100) default NULL,
  `custom4` varchar(100) default NULL,
  `choice1` varchar(100) default NULL,
  `choice2` varchar(100) default NULL,
  `choice3` varchar(100) default NULL,
  `choice4` varchar(100) default NULL,
  `time1` datetime default NULL,
  `time2` datetime default NULL,
  `share_flag` char(1) default NULL,
  `share_ids` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_order_detail
-- ----------------------------
CREATE TABLE `b_order_detail` (
  `id` int(11) NOT NULL auto_increment,
  `p_name` varchar(100) default NULL,
  `spec` varchar(100) default NULL,
  `unit` varchar(100) default NULL,
  `amount` double default NULL,
  `price` double default NULL,
  `agio` double default NULL,
  `total` double default NULL,
  `remark` varchar(200) default NULL,
  `order_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1D34F31F9758EB0B` (`order_id`),
  KEY `FK1D34F31F2D6ECC0A` (`p_id`),
  CONSTRAINT `FK1D34F31F2D6ECC0A` FOREIGN KEY (`p_id`) REFERENCES `b_product` (`id`),
  CONSTRAINT `FK1D34F31F9758EB0B` FOREIGN KEY (`order_id`) REFERENCES `b_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_product
-- ----------------------------
CREATE TABLE `b_product` (
  `id` int(11) NOT NULL auto_increment,
  `ptype_id` int(11) NOT NULL,
  `sort` int(11) default NULL,
  `creater` varchar(100) default NULL,
  `createTime` datetime default NULL,
  `updater` varchar(100) default NULL,
  `updateTime` datetime default NULL,
  `remark` longtext,
  `status` char(1) default NULL,
  `code` varchar(50) default NULL,
  `name` varchar(100) NOT NULL,
  `model` varchar(100) default NULL,
  `spec` varchar(100) default NULL,
  `unit` varchar(100) default NULL,
  `color` varchar(100) default NULL,
  `product_size` varchar(100) default NULL,
  `bar_code` varchar(100) default NULL,
  `provider` varchar(200) default NULL,
  `stock` double default NULL,
  `price` double default NULL,
  `buy_price` double default NULL,
  `picture` varchar(200) default NULL,
  `pycode` varchar(30) default NULL,
  `custom1` varchar(100) default NULL,
  `custom2` varchar(100) default NULL,
  `custom3` varchar(100) default NULL,
  `custom4` varchar(100) default NULL,
  `choice1` varchar(100) default NULL,
  `choice2` varchar(100) default NULL,
  `choice3` varchar(100) default NULL,
  `choice4` varchar(100) default NULL,
  `time1` datetime default NULL,
  `time2` datetime default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK3C4FF21274E695EA` (`ptype_id`),
  CONSTRAINT `FK3C4FF21274E695EA` FOREIGN KEY (`ptype_id`) REFERENCES `b_product_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for b_product_type
-- ----------------------------
CREATE TABLE `b_product_type` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) NOT NULL,
  `fcode` varchar(100) default NULL,
  `code` varchar(100) default NULL,
  `name` varchar(100) NOT NULL,
  `remark` longtext,
  `sort` int(11) default NULL,
  `create_time` datetime default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for c_company
-- ----------------------------
CREATE TABLE `c_company` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `pycode` varchar(100) default NULL,
  `code` varchar(50) default NULL,
  `grade` varchar(100) default NULL,
  `source` varchar(100) default NULL,
  `c_type` varchar(10) default NULL,
  `m_type` varchar(10) default NULL,
  `region_id` int(11) default NULL,
  `region_name` varchar(100) default NULL,
  `province` varchar(50) default NULL,
  `city` varchar(50) default NULL,
  `fax` varchar(50) default NULL,
  `postcode` varchar(50) default NULL,
  `tel1` varchar(50) default NULL,
  `tel2` varchar(50) default NULL,
  `mobile` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  `web` varchar(200) default NULL,
  `address` varchar(200) default NULL,
  `dealing` varchar(100) default NULL,
  `scale` varchar(100) default NULL,
  `register_money` varchar(50) default NULL,
  `kind` varchar(100) default NULL,
  `trade` varchar(100) default NULL,
  `legal_person` varchar(50) default NULL,
  `bank` varchar(100) default NULL,
  `account` varchar(100) default NULL,
  `tax_code` varchar(100) default NULL,
  `buy_flag` char(1) default NULL,
  `creater` varchar(50) default NULL,
  `create_time` datetime default NULL,
  `updater` varchar(50) default NULL,
  `update_time` datetime default NULL,
  `status` varchar(10) default NULL,
  `remark` longtext,
  `next_touch_date` datetime default NULL,
  `next_service_date` datetime default NULL,
  `first_touch_date` datetime default NULL,
  `last_touch_date` datetime default NULL,
  `next_touch_aim` longtext,
  `dispense_person` varchar(50) default NULL,
  `dispense_date` datetime default NULL,
  `apply_user_id` int(11) default NULL,
  `s_person` varchar(50) default NULL,
  `s_reason` longtext,
  `s_date` datetime default NULL,
  `plan_callback_reason` longtext,
  `plan_callback_date` datetime default NULL,
  `cur_link_flag` char(1) default NULL,
  `cur_buy_flag` char(1) default NULL,
  `freeze_leave_day` int(11) default NULL,
  `custom1` varchar(100) default NULL,
  `custom2` varchar(100) default NULL,
  `custom3` varchar(100) default NULL,
  `custom4` varchar(100) default NULL,
  `choice1` varchar(100) default NULL,
  `choice2` varchar(100) default NULL,
  `choice3` varchar(100) default NULL,
  `choice4` varchar(100) default NULL,
  `time1` datetime default NULL,
  `time2` datetime default NULL,
  `share_flag` char(1) default NULL,
  `share_ids` longtext,
  `quality` varchar(100) default NULL,
  `owner_usr` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK1BADD0A1A16E2733` (`owner_usr`),
  CONSTRAINT `FK1BADD0A1A16E2733` FOREIGN KEY (`owner_usr`) REFERENCES `s_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for c_company_linkman
-- ----------------------------
CREATE TABLE `c_company_linkman` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) NOT NULL,
  `pycode` varchar(50) default NULL,
  `code` varchar(100) default NULL,
  `sex` varchar(10) default NULL,
  `birthday` date default NULL,
  `department` varchar(100) default NULL,
  `duty` varchar(100) default NULL,
  `office_tel` varchar(50) default NULL,
  `home_tel` varchar(50) default NULL,
  `mobile` varchar(50) default NULL,
  `email` varchar(100) default NULL,
  `qq_num` varchar(50) default NULL,
  `qq_name` varchar(50) default NULL,
  `postcode` varchar(50) default NULL,
  `address` varchar(200) default NULL,
  `fax` varchar(50) default NULL,
  `other_link` varchar(200) default NULL,
  `hobby` varchar(200) default NULL,
  `taboo` varchar(200) default NULL,
  `main_flag` char(1) default NULL,
  `creater` varchar(50) default NULL,
  `create_time` datetime default NULL,
  `updater` varchar(50) default NULL,
  `update_time` datetime default NULL,
  `remark` longtext,
  `custom1` varchar(100) default NULL,
  `custom2` varchar(100) default NULL,
  `custom3` varchar(100) default NULL,
  `custom4` varchar(100) default NULL,
  `choice1` varchar(100) default NULL,
  `choice2` varchar(100) default NULL,
  `choice3` varchar(100) default NULL,
  `choice4` varchar(100) default NULL,
  `time1` datetime default NULL,
  `time2` datetime default NULL,
  `m_type` varchar(10) default NULL,
  `share_flag` char(1) default NULL,
  `share_ids` longtext,
  `c_id` int(11) default NULL,
  `owner_usr` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK8F058182A16E2733` (`owner_usr`),
  KEY `FK8F058182E0637FA4` (`c_id`),
  CONSTRAINT `FK8F058182A16E2733` FOREIGN KEY (`owner_usr`) REFERENCES `s_user` (`id`),
  CONSTRAINT `FK8F058182E0637FA4` FOREIGN KEY (`c_id`) REFERENCES `c_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for c_company_touch
-- ----------------------------
CREATE TABLE `c_company_touch` (
  `id` int(11) NOT NULL auto_increment,
  `c_id` int(11) default NULL,
  `link_man` varchar(50) default NULL,
  `link_fashion` varchar(100) default NULL,
  `link_type` varchar(100) default NULL,
  `link_time` datetime default NULL,
  `content` longtext,
  `user_name` varchar(50) default NULL,
  `next_touch_date` datetime default NULL,
  `next_touch_aim` longtext,
  `creater` varchar(50) default NULL,
  `create_time` datetime default NULL,
  `updater` varchar(50) default NULL,
  `update_time` datetime default NULL,
  `remark` longtext,
  `custom1` varchar(100) default NULL,
  `custom2` varchar(100) default NULL,
  `custom3` varchar(100) default NULL,
  `custom4` varchar(100) default NULL,
  `choice1` varchar(100) default NULL,
  `choice2` varchar(100) default NULL,
  `choice3` varchar(100) default NULL,
  `choice4` varchar(100) default NULL,
  `time1` datetime default NULL,
  `time2` datetime default NULL,
  `m_type` varchar(10) default NULL,
  `share_flag` char(1) default NULL,
  `share_ids` longtext,
  `owner_usr` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKE3905621A16E2733` (`owner_usr`),
  KEY `FKE3905621E0637FA4` (`c_id`),
  CONSTRAINT `FKE3905621A16E2733` FOREIGN KEY (`owner_usr`) REFERENCES `s_user` (`id`),
  CONSTRAINT `FKE3905621E0637FA4` FOREIGN KEY (`c_id`) REFERENCES `c_company` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for c3p0testtable
-- ----------------------------
CREATE TABLE `c3p0testtable` (
  `a` char(1) default NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_access_group
-- ----------------------------
CREATE TABLE `s_access_group` (
  `Id` int(11) NOT NULL auto_increment,
  `name` varchar(255) default NULL,
  `dpte` longtext,
  `remark` longtext,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_city
-- ----------------------------
CREATE TABLE `s_city` (
  `id` int(11) NOT NULL auto_increment,
  `pid` int(11) default NULL,
  `name` varchar(100) default NULL,
  `pycode` varchar(50) default NULL,
  `postcode` varchar(50) default NULL,
  `areacode` varchar(50) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC9A6A1B75399121B` (`pid`),
  CONSTRAINT `FKC9A6A1B75399121B` FOREIGN KEY (`pid`) REFERENCES `s_province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_dictionary_class
-- ----------------------------
CREATE TABLE `s_dictionary_class` (
  `id` int(11) NOT NULL auto_increment,
  `remark` longtext,
  `code` varchar(100) default NULL,
  `name` varchar(100) default NULL,
  `chineseTableName` varchar(100) default NULL,
  `englishTableName` varchar(100) default NULL,
  `available` varchar(10) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_dictionary_detail
-- ----------------------------
CREATE TABLE `s_dictionary_detail` (
  `id` int(11) NOT NULL auto_increment,
  `sort` int(11) default NULL,
  `remark` longtext,
  `value` varchar(200) default NULL,
  `sysFlag` char(1) default NULL,
  `pid` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FK9AD3C34E5403E6AD` (`pid`),
  CONSTRAINT `FK9AD3C34E5403E6AD` FOREIGN KEY (`pid`) REFERENCES `s_dictionary_class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_popedom
-- ----------------------------
CREATE TABLE `s_popedom` (
  `id` int(11) NOT NULL auto_increment,
  `remark` longtext,
  `pid` int(11) NOT NULL,
  `code` varchar(50) default NULL,
  `name` varchar(200) default NULL,
  `istable` varchar(100) default NULL,
  `actionName` varchar(100) default NULL,
  `methodName` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_province
-- ----------------------------
CREATE TABLE `s_province` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(100) default NULL,
  `pycode` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_role
-- ----------------------------
CREATE TABLE `s_role` (
  `id` int(11) NOT NULL auto_increment,
  `remark` longtext,
  `name` varchar(100) default NULL,
  `popedom` longtext,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_user
-- ----------------------------
CREATE TABLE `s_user` (
  `id` int(11) NOT NULL auto_increment,
  `creator` varchar(100) default NULL,
  `createTime` datetime default NULL,
  `updater` varchar(100) default NULL,
  `updateTime` datetime default NULL,
  `remark` longtext,
  `name` varchar(100) default NULL,
  `cnname` varchar(100) default NULL,
  `password` varchar(100) default NULL,
  `address` varchar(200) default NULL,
  `telephone` varchar(100) default NULL,
  `email` varchar(100) default NULL,
  `beginDate` date default NULL,
  `endDate` date default NULL,
  `access_fileLevel` varchar(50) default NULL,
  `menus` longtext,
  `popedom` longtext,
  `status` varchar(10) default NULL,
  `commendman` varchar(50) default NULL,
  `movetelephone` varchar(20) default NULL,
  `nowaddress` varchar(200) default NULL,
  `nowtelephone` varchar(20) default NULL,
  `identitycode` varchar(20) default NULL,
  `insurancecode` varchar(20) default NULL,
  `instancylinkman` varchar(50) default NULL,
  `instancytelephone` varchar(50) default NULL,
  `sex` varchar(10) default NULL,
  `birthday` date default NULL,
  `personneltype` varchar(50) default NULL,
  `duty` varchar(50) default NULL,
  `workdate` date default NULL,
  `highschool` varchar(100) default NULL,
  `finishschool` varchar(100) default NULL,
  `finishschooldate` date default NULL,
  `consortname` varchar(100) default NULL,
  `youngonename` varchar(100) default NULL,
  `officetelephone` varchar(20) default NULL,
  `consorttelephone` varchar(20) default NULL,
  `avocation` longtext,
  `consortcompany` varchar(200) default NULL,
  `strongsuit` longtext,
  `communicate` longtext,
  `bringup` longtext,
  `organise` longtext,
  `analyse` longtext,
  `planing` longtext,
  `empolder` longtext,
  `relation` longtext,
  `role_id` int(11) default NULL,
  `group_Id` int(11) default NULL,
  `access_group_id` int(11) default NULL,
  PRIMARY KEY  (`id`),
  KEY `FKC9AEF417F26BFB5A` (`role_id`),
  KEY `FKC9AEF417710BAEEF` (`group_Id`),
  KEY `FKC9AEF417400C2171` (`access_group_id`),
  CONSTRAINT `FKC9AEF417400C2171` FOREIGN KEY (`access_group_id`) REFERENCES `s_access_group` (`Id`),
  CONSTRAINT `FKC9AEF417710BAEEF` FOREIGN KEY (`group_Id`) REFERENCES `s_user_group` (`id`),
  CONSTRAINT `FKC9AEF417F26BFB5A` FOREIGN KEY (`role_id`) REFERENCES `s_role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for s_user_group
-- ----------------------------
CREATE TABLE `s_user_group` (
  `id` int(11) NOT NULL auto_increment,
  `remark` longtext,
  `name` varchar(100) default NULL,
  `principal` varchar(50) default NULL,
  `incumbent` varchar(200) default NULL,
  `pid` int(11) NOT NULL,
  `fcode` varchar(50) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `b_gather` VALUES ('1', null, null, null, null, null, null, '1', '中国石化', null, null, '2016-12-29 16:21:03', null, null, 'Java之旅', '9999', null, '开启', null, null, null, null);
INSERT INTO `b_gather` VALUES ('2', null, null, null, null, null, null, '2', '张裕解百纳', null, null, '2016-12-21 16:23:25', null, null, '世界您好', '8888', null, '关闭', null, null, null, null);
INSERT INTO `b_gather` VALUES ('3', null, null, null, null, null, null, '3', '工商银行', null, null, '2016-12-21 16:24:39', null, null, '凯文.米特尼克', '6666', null, '开启', null, null, null, null);
INSERT INTO `b_gather` VALUES ('4', null, null, null, null, null, null, '4', '暴风科技', null, null, '2016-12-21 16:25:21', null, null, '百年孤独', '5566', null, '开启', null, null, null, null);
INSERT INTO `b_gather` VALUES ('5', null, null, null, null, null, null, '5', '张裕A', null, null, '2016-12-20 16:26:24', null, null, '一千零一夜', '999999', null, '开启', null, null, null, null);
INSERT INTO `b_gather` VALUES ('6', null, null, null, null, null, null, '6', '中国神华', null, null, '2016-12-22 16:27:37', null, null, '蒂姆伯纳斯.李', '1122', null, '关闭', null, null, null, null);
INSERT INTO `b_need_gather` VALUES ('1', '1', null, null, null, null, 'Java之旅', null, null, null, null, '1', '中国石化', null, '2016-12-21 15:04:57', '0000', '999', '99', '900', '是', null);
INSERT INTO `b_need_gather` VALUES ('2', '2', null, null, null, null, '世界您好', null, null, null, null, '1', '工商银行', null, '2016-12-21 15:21:12', '0001', '1999', '99', '1900', '否', null);
INSERT INTO `b_need_gather` VALUES ('3', '3', null, null, null, null, '一千零一夜', null, null, null, null, '2', '张裕解百纳', null, '2016-12-30 15:24:11', '0002', '9999', '9', '9990', '是', null);
INSERT INTO `b_need_gather` VALUES ('4', '4', null, null, null, null, '百年孤独', null, null, null, null, '3', '张裕A', null, '2016-12-22 15:25:04', '0003', '8800', '88', '8888', '否', null);
INSERT INTO `b_need_gather` VALUES ('5', '5', null, null, null, null, '挑战极限', null, null, null, null, '4', '中国神华', null, '2016-12-27 15:26:46', '0004', '6666', '66', '6600', '是', null);
INSERT INTO `b_need_gather` VALUES ('6', '6', null, null, null, null, '精通Java', null, null, null, null, '5', '暴风科技', null, '2016-12-14 15:28:10', '0005', '5632', '66', '5566', '是', null);
INSERT INTO `b_order` VALUES ('1', '1', '小明', null, null, null, null, '0000', '2016-12-21', '1', '中国石化', null, null, null, null, '小灰灰', '99', '0.88', '0.66', '世界您好', null, null, '开启', null, null, null, null, null, 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', null, null, null, null);
INSERT INTO `b_order` VALUES ('2', '2', '小灰灰', null, null, null, null, '0001', '2016-12-14', '2', '工商银行', null, null, null, null, null, '999', null, '0.99', 'Java之旅', null, null, '关闭', null, null, null, null, null, '一千零一夜', '一千零一夜', '一千零一夜', '一千零一夜', null, null, null, null);
INSERT INTO `b_order` VALUES ('3', '3', '凯文.米特尼克', null, null, null, null, '0002', '2016-12-22', '3', '格力电器', null, null, null, null, null, '9999', null, '0.4567', '精通Java', null, null, '开启', null, null, null, null, null, '百年孤独', '百年孤独', '百年孤独', '百年孤独', null, null, null, null);
INSERT INTO `b_order` VALUES ('4', '4', '小红', null, null, null, null, '0003', '2016-12-15', '4', '暴风科技', null, null, null, null, null, '8888', null, '0.888', '黑夜独行', null, null, '关闭', null, null, null, null, null, '世界您好', '世界您好', '世界您好', '世界您好', null, null, null, null);
INSERT INTO `b_order` VALUES ('5', '5', 'love', null, null, null, null, '0004', '2016-12-27', '5', '中国神华', null, null, null, null, null, '19999', null, '0.1234', '有魔力的纸币', null, null, '开启', null, null, null, null, null, '没有方向的风', '没有方向的风', '没有方向的风', '没有方向的风', null, null, null, null);
INSERT INTO `b_order` VALUES ('6', '6', '蒂姆伯纳斯.李', null, null, null, null, '0005', '2016-12-15', '6', '潍柴动力', null, null, null, null, null, '5566', null, '0.4567', '一千零一夜', null, null, '关闭', null, null, null, null, null, '黑夜独行', '黑夜独行', '黑夜独行', '黑夜独行', null, null, null, null);
INSERT INTO `b_order` VALUES ('8', null, 'admin', null, 'admin', null, '', '1111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('9', null, 'admin', null, 'admin', null, '', '1111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('10', null, 'admin', null, 'admin', null, '11111111111111', '1111111', null, null, '', null, '11111111', '111111111', '1111111111', '一千零一夜', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('11', null, 'admin', null, 'admin', null, '', '1111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('12', null, 'admin', null, 'admin', null, '', '11111111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('13', null, 'admin', null, 'admin', null, '', '11111111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_order` VALUES ('14', null, 'admin', null, 'admin', null, '', '1111111111111', null, null, '', null, '', '', '', '---', null, null, null, null, null, null, null, null, '', '', '', '', '1', '1', '1', '1', null, null, null, null);
INSERT INTO `b_product` VALUES ('1', '1', null, null, null, null, null, 'aaa', null, '0001', '扫地机器人', '小家电', '特级产品', 'aaa4', 'red', '40*15*12', 'aaa5', 'aaa6', '9999', '4567', null, null, 'aaa', null, null, null, null, 'Java之旅', 'Java之旅', 'Java之旅', 'Java之旅', null, null);
INSERT INTO `b_product` VALUES ('2', '2', null, null, null, null, null, 'bbb', null, '0002', '雷神笔记本', '大家电', '一级产品', 'bbb4', 'black', '100*50*12', 'bbb5', 'bbb6', '8888', '5566', null, null, 'bbb', null, null, null, null, '百年孤独', '百年孤独', '百年孤独', '百年孤独', null, null);
INSERT INTO `b_product` VALUES ('3', '3', null, null, null, null, null, 'ccc', null, '0003', '乐视手机', '通信', '二级产品', 'ccc4', 'ccafd', '4567*1234*8906', 'ccc5', 'ccc6', '7777', '5566', null, null, 'ccc', null, null, null, null, '一千零一夜', '一千零一夜', '一千零一夜', '一千零一夜', null, null);
INSERT INTO `b_product` VALUES ('5', '4', null, '', '2016-07-27 10:32:22', '', null, '', null, '0004', '格力空调', '大家电', '三级产品', '', '', '1234*5678*90', '', '', '6666', '55666', null, null, '', '', '', '', '', '没有方向的风', '没有方向的风', '没有方向的风', '没有方向的风', null, null);
INSERT INTO `b_product` VALUES ('6', '5', null, '', '2016-07-27 10:42:47', '', null, '', null, '0005', '海尔冰箱', '大家电', '四级产品', '', '', '123*4567*890', '', '', '5555', '5566', null, '2016/7/6.jpg', 'bbb3', '', '', '', '', '世界您好', '世界您好', '世界您好', '世界您好', null, null);
INSERT INTO `b_product` VALUES ('7', '6', null, '', '2016-07-27 14:35:25', '', null, '', null, '0006', '智能机器人', '电器', '五级产品', '', '', '123*4567*890', '', '', '4444', '5566', null, '2016/7/7.jpg', '', '', '', '', '', '黑夜独行', '黑夜独行', '黑夜独行', '黑夜独行', null, null);
INSERT INTO `b_product` VALUES ('8', '7', null, '', '2016-07-27 15:09:31', '', null, '', null, '0007', '充电宝', '小家电', '六级产品', '', '', '123*4567*890', '', '', '3333', '5566', null, '2016/7/8.jpg', '', '', '', '', '', '指尖的力量', '指尖的力量', '指尖的力量', '指尖的力量', null, null);
INSERT INTO `b_product` VALUES ('9', '6', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('10', '7', null, 'admin', null, '', null, '', null, '00', 'aaaaaaaaaa', '00', '', '', '', '0', '', '', null, null, null, null, 'a', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('11', '7', null, 'admin', null, '', null, '', null, '00', 'aaaaaaaaaa', '00', '', '', '', '0', '', '', null, null, null, null, 'a', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('12', '6', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('13', '7', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('14', '9', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('15', '8', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('16', '9', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('17', '1', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('18', '2', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('19', '3', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('20', '5', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('21', '6', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('22', '7', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('25', '7', null, 'admin', null, '', null, '', null, '', '4444444444444', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('27', '5', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('28', '1', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('29', '3', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('30', '1', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('31', '1', null, 'admin', null, '', null, '', null, '', 'aaaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('32', '1', null, 'admin', null, '', null, '', null, '', '111111111111111111111111111', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('33', '2', null, '', null, '', null, '', null, '', 'aaaaaaaaaaaaaa', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('34', '1', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, '', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('35', '1', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('36', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('37', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('38', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('39', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('40', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('41', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('42', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product` VALUES ('43', '3', null, 'admin', null, '', null, '', null, 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', '', '', '', '', '', '', '', null, null, null, null, 'aaaaaaaaaaa', '', '', '', '', '1', '1', '1', '1', null, null);
INSERT INTO `b_product_type` VALUES ('1', '0', null, '001', '超级商城', '001', null, null);
INSERT INTO `b_product_type` VALUES ('2', '1', null, '002', '家电', '002', null, null);
INSERT INTO `b_product_type` VALUES ('3', '2', null, '003', '通信', '003', null, null);
INSERT INTO `b_product_type` VALUES ('4', '2', null, '004', '大家电', '004', null, null);
INSERT INTO `b_product_type` VALUES ('5', '2', null, '0055', '小家电', '0055', null, null);
INSERT INTO `b_product_type` VALUES ('6', '2', null, '006', '智能电器', '006', null, null);
INSERT INTO `b_product_type` VALUES ('7', '1', null, '007', '汽车', '007', null, null);
INSERT INTO `b_product_type` VALUES ('8', '1', null, '008', '图书', '008', null, null);
INSERT INTO `b_product_type` VALUES ('9', '1', null, '009', '金融理财', 'aaa', null, null);
INSERT INTO `b_product_type` VALUES ('10', '1', null, '0010', '家装、家具', '111', null, null);
INSERT INTO `b_product_type` VALUES ('20', '2', null, 'aaa2', '内衣', 'aaa3', null, '2016-07-21 11:54:35');
INSERT INTO `b_product_type` VALUES ('21', '1', null, 'bbb2', '旅行', 'bbb3', null, '2016-07-21 11:56:50');
INSERT INTO `b_product_type` VALUES ('22', '2', null, 'ccc2', '生活用品', 'ccc3', null, '2016-07-21 14:44:30');
INSERT INTO `b_product_type` VALUES ('23', '2', null, 'ddd2', '床上用品', 'dd3', null, '2016-07-21 14:45:54');
INSERT INTO `b_product_type` VALUES ('24', '2', null, 'eee2', '白条', 'ee3', null, '2016-07-21 14:49:42');
INSERT INTO `b_product_type` VALUES ('31', '2', null, '223', '女装', '224', null, '2016-08-17 16:50:13');
INSERT INTO `b_product_type` VALUES ('32', '2', null, '12322', '男装', '12322', null, '2016-09-19 09:55:06');
INSERT INTO `b_product_type` VALUES ('33', '2', null, '222', '珠宝', '222', null, '2016-09-19 09:56:12');
INSERT INTO `b_product_type` VALUES ('34', '1', null, '999', '奢侈品', '999', null, '2016-09-19 10:16:49');
INSERT INTO `b_product_type` VALUES ('35', '2', null, '999', '黄金', '999', null, '2016-09-19 10:16:52');
INSERT INTO `b_product_type` VALUES ('36', '3', null, 'aaaaaaaaaa', '电脑', '测试', null, '2016-11-30 18:14:34');
INSERT INTO `c_company` VALUES ('1', '中国石化', null, '00000000', '特级客户', '中国石化AAA', 'aa', 'aaa', null, '中国', '地球村', '地球村的城市', null, null, '13333333', null, null, 'dongzheng@163.com', null, null, '期货原油', '巨型公司', null, '石油化工', '金融理财', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-01 15:12:49', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, 'Java之旅', 'Java之旅', 'Java之旅', 'Java之旅', null, null, null, null, '优秀客户', null);
INSERT INTO `c_company` VALUES ('2', '工商银行', null, '00000001', '超级客户', '工商银行AAA', 'bbb3', 'bbb4', null, '日本', '小小如我', '小小如我的城市', null, null, '232432153', null, null, 'test1@163.com', null, null, '股指期权', '特大型公司', null, '金融理财', '人工智能', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-01 15:46:53', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '一千零一夜', '一千零一夜', '一千零一夜', '一千零一夜', null, null, null, null, '一般客户', null);
INSERT INTO `c_company` VALUES ('3', '中国神华', null, '00000002', '一级客户', '中国神华AAA', 'ccc3', 'ccc4', null, '美国', '大大如您', '大大如您的城市', null, null, '245672345', null, null, 'test2@163.com', null, null, '房地产', '超大型公司', null, '家装家居', '大数据', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-06-08 15:47:01', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '百年孤独', '百年孤独', '百年孤独', '百年孤独', null, null, null, null, '垃圾客户', null);
INSERT INTO `c_company` VALUES ('4', '格力电器', null, '00000003', '二级客户', '格力电器AAA', 'ddd3', 'ddd4', null, '英国', '曾经我也辉煌过', '经我也辉煌过的城市', null, null, '23456', null, null, 'test3@163.com', null, null, '无人机', '大型公司', null, '男装女装', '企业对企业之间的营销', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-08-10 15:47:08', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '世界您好', '世界您好', '世界您好', '世界您好', null, null, null, null, '土豪客户', null);
INSERT INTO `c_company` VALUES ('5', '乐视网', null, '00000004', '三级客户', '乐视网AAA', 'eee3', 'eee4', null, '法国', '浪漫主义', '浪漫主义的城市', null, null, '23456', null, null, 'test4@163.com', null, null, '人工智能', '小型公司', null, '智能电器', '无人机', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-12 15:47:13', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '巨人大厦', '巨人大厦', '巨人大厦', '巨人大厦', null, null, null, null, '美女客户', null);
INSERT INTO `c_company` VALUES ('6', '巨人网络', null, '00000005', '普通客户', '巨人网络AAA', 'fff3', 'fff4', null, '意大利', '鬼哭狼嚎村', '鬼哭狼嚎村的城市', null, null, '56789', null, null, 'test5@163.com', null, null, '法拉利汽车', '超小型公司', null, '无人机', '服装城', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2016-07-09 15:47:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '没有方向的风', '没有方向的风', '没有方向的风', '没有方向的风', null, null, null, null, '潜在客户', null);
INSERT INTO `c_company` VALUES ('7', '77777777', '77777777777', '777777777', '777777777777', '7777777777', '77', '77', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `c_company` VALUES ('8', '1111111111', '', '11111111', '', '', '', null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('9', '1111111111aaaaaaa', '', '11111111aaa', '', '', '', null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('10', 'vvvvvvvvvvvvvvvvvvvvvvv', '', 'vvvvvvvvvvvvvvvvvvv', '一级客户', '中国神华AAA', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '大型公司', '', '', '企业对企业之间的营销', '', '', '', '', '1', 'admin', null, 'admin', null, null, 'vvvvvvvvvvvvvvvv', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('11', 'aaaaaaaaaaaaaa', '', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', '一级客户', '格力电器AAA', null, null, null, null, '曾经我也辉煌过', '浪漫主义的城市', '', '', null, null, '', '', '', '', '', '大型公司', '', '', '大数据', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('12', '111111111', '', '1111111', '', '', null, null, null, null, '曾经我也辉煌过', '浪漫主义的城市', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('13', '111111111', '', '11111', '', '', null, null, null, null, '曾经我也辉煌过', '经我也辉煌过的城市', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('14', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('15', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('16', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('17', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('18', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company` VALUES ('19', '111111111', '', '11111', '', '', null, null, null, null, '', '', '', '', null, null, '', '', '', '', '', '', '', '', '', '', '', '', '', '1', 'admin', null, 'admin', null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '', '', '', '', '', '', '', '', null, null, null, null, '', '3');
INSERT INTO `c_company_linkman` VALUES ('1', '小灰灰', '18', '4567', '男', '2016-12-06', '搬砖部', '董事长', '110120130', '111', '1453742693', '1453742693@qq.com', '1969994567', '向钱看', '111', '111', '111', '111', '11', '111', '', '111', '2016-12-06 14:08:19', '111', '2016-12-20 14:08:26', '11', '11', '11', '11', '11', 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', 'Java之旅即将开始,请系好安全带...', '2016-12-06 14:08:55', '2016-12-28 14:08:59', '11', '', '11', '1', '4');
INSERT INTO `c_company_linkman` VALUES ('112', '喜数女', null, null, '女', null, '运维部', '总经理', '1453742693', null, '1453742693', '1969994350@qq.com', '1453742693', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '世界您好', '世界您好', '世界您好', '世界您好', null, null, null, null, null, null, null);
INSERT INTO `c_company_linkman` VALUES ('113', '世界您好', null, null, '女', null, '研发部', '董事会', '1969994350', null, '1453742693', '1234@qq.com', '1969994350', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '一千零一夜', '一千零一夜', '一千零一夜', '一千零一夜', null, null, null, null, null, null, null);
INSERT INTO `c_company_linkman` VALUES ('114', 'Java之旅', null, null, '男', null, '实施部', 'CEO', '1969994350', null, '1453742693', '4567@qq.com', '1453742693', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '百年孤独', '百年孤独', '百年孤独', '百年孤独', null, null, null, null, null, null, null);
INSERT INTO `c_company_linkman` VALUES ('115', '一千零一夜', null, null, '女', null, '搬砖的', '大搬运工', '1453742693', null, '1969994350', '1234@qq.com', '1969994350', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '黑夜独行', '黑夜独行', '黑夜独行', '黑夜独行', null, null, null, null, null, null, null);
INSERT INTO `c_company_linkman` VALUES ('116', '蒂姆博纳斯.李', null, null, '男', null, '写网页的', 'www万维网', '1453742693', null, '1969994350', '1969994350@163.com', '1453742693', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '没有方向的风', '没有方向的风', '没有方向的风', '没有方向的风', null, null, null, null, null, null, null);
INSERT INTO `c_company_linkman` VALUES ('117', 'qqqqqqqqqqqqq', '', '', '---', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 'admin', null, 'admin', null, '', '', '', '', '', '1', '1', '1', '1', null, null, null, null, null, null, '3');
INSERT INTO `c_company_linkman` VALUES ('118', 'aaaaaaaaaaaaaaaaaa', '', '', '2', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 'admin', null, 'admin', null, '', '', '', '', '', '1', '1', '1', '1', null, null, null, null, null, null, '3');
INSERT INTO `c_company_linkman` VALUES ('119', '一千零一夜', '', '', '男', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 'admin', null, 'admin', null, '', '', '', '', '', '1', '1', '1', '1', null, null, null, null, null, null, '3');
INSERT INTO `c_company_linkman` VALUES ('120', 'Java是后期V5的英雄', '', '', '---', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '0', 'admin', null, 'admin', null, '', '', '', '', '', '1', '1', '1', '1', null, null, null, null, null, null, '3');
INSERT INTO `c_company_touch` VALUES ('1', '1', '小灰灰', '手机联系一次', '手机通信', '2016-12-22 15:51:50', '与小灰灰联系过一次', 'Java之旅', '2016-12-28 15:53:26', null, null, null, null, '2016-12-21 17:56:16', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3');
INSERT INTO `c_company_touch` VALUES ('2', '2', '世界您好', '电脑联系二次', '电脑通信', '2016-12-27 15:54:25', '与搬砖的联系', '一千零一夜', '2016-12-20 15:54:45', null, null, null, null, '2016-12-22 17:56:20', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4');
INSERT INTO `c_company_touch` VALUES ('3', '1', '一千零一夜', '万维网联系一次', '网页通信', '2016-12-15 15:55:26', '与蒂姆伯纳斯.李联系一次', '百年孤独', '2016-12-23 15:54:55', null, null, null, null, '2016-12-23 17:56:23', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5');
INSERT INTO `c_company_touch` VALUES ('4', '2', '没有方向的风', '电话联系过一次', '无线通信', '2016-12-07 15:56:51', '股票要涨了', '黑夜独行', '2016-12-29 15:57:14', null, null, null, null, '2016-12-22 17:56:26', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6');
INSERT INTO `c_company_touch` VALUES ('5', '2', '黑夜独行', '代码联系过一次', '代码通信', '2016-12-16 15:57:52', '如何学习Java', '世界您好', '2016-12-15 15:57:24', null, null, null, null, '2016-12-08 17:56:30', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7');
INSERT INTO `c_company_touch` VALUES ('6', '2', '百年孤独', '电脑联系过一次', 'Java之旅即将开始,请系好安全带...', '2016-12-07 16:00:08', '写代码的', '没有方向的风', '2016-12-22 16:00:25', null, null, null, null, '2016-12-30 17:56:33', null, null, null, null, null, null, null, null, null, null, null, null, null, null, '8');
INSERT INTO `c_company_touch` VALUES ('7', '1', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `c_company_touch` VALUES ('8', '2', '小灰灰', '手机联系一次', '', null, '', null, null, '', 'admin', null, 'admin', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3');
INSERT INTO `s_access_group` VALUES ('1', 'admin', '2,', null);
INSERT INTO `s_access_group` VALUES ('2', 'Java之旅', null, null);
INSERT INTO `s_access_group` VALUES ('3', '世界您好', null, null);
INSERT INTO `s_access_group` VALUES ('4', '百年孤独', null, null);
INSERT INTO `s_access_group` VALUES ('5', '一千零一夜', null, null);
INSERT INTO `s_access_group` VALUES ('6', '黑夜独行', null, null);
INSERT INTO `s_access_group` VALUES ('7', '没有方向的风', null, null);
INSERT INTO `s_access_group` VALUES ('8', 'aaaaaaaaaaaaaaa', null, 'aaaaaaaaaa');
INSERT INTO `s_access_group` VALUES ('9', 'vvvvvvvvvvvvvvvvvvvvvvv', null, 'vvvvvvvvv');
INSERT INTO `s_dictionary_class` VALUES ('1', 'aaa1', 'aaa2', 'aaa3', 'aaa4', 'aaa5', 'aaa6');
INSERT INTO `s_dictionary_detail` VALUES ('3', '1', 'aaa', 'bbb', '1', '1');
INSERT INTO `s_popedom` VALUES ('1', 'aaa1', '0', 'aaa2', '测试', 'aa', 'company', 'companyListaaaaaaaaaaaaaa');
INSERT INTO `s_popedom` VALUES ('3', 'bbb1', '0', 'customerVisit/visit', '客户拜访', 'bb', 'companyAction', 'customerVisit/visit');
INSERT INTO `s_popedom` VALUES ('4', 'ccc1', '0', 'load4LinkManMain', '联系人列表', 'cc', 'companyLinkmanAction', 'load4LinkManMain');
INSERT INTO `s_popedom` VALUES ('5', 'ddd1', '0', 'load4CompanyTouchMain', '联系记录列表', 'dd', 'aaaa', 'bbb');
INSERT INTO `s_popedom` VALUES ('6', 'eee1', '1', 'eee2', '测试2', 'table', 'eee5', 'eee6');
INSERT INTO `s_popedom` VALUES ('7', 'fff', '3', 'fff2', 'fff3', 'table', '', 'fff5');
INSERT INTO `s_role` VALUES ('1', null, '管理员', '1,aaa2,company,companyList:3,load4Visit,companyAction,load4Visit:4,load4LinkManMain,companyLinkmanAction,load4LinkManMain:5,load4CompanyTouchMain,aaaa,bbb:');
INSERT INTO `s_role` VALUES ('2', null, 'Java之旅', null);
INSERT INTO `s_role` VALUES ('3', null, '世界您好', null);
INSERT INTO `s_role` VALUES ('4', null, '一千零一夜', null);
INSERT INTO `s_role` VALUES ('5', null, '百年孤独', null);
INSERT INTO `s_role` VALUES ('6', null, '黑夜独行', null);
INSERT INTO `s_role` VALUES ('7', null, '小灰灰', null);
INSERT INTO `s_role` VALUES ('8', null, '没有方向的风', '');
INSERT INTO `s_role` VALUES ('9', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('10', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('11', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('12', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('13', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('14', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_role` VALUES ('15', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaaaaaaa', null);
INSERT INTO `s_user` VALUES ('1', null, '2016-12-29 09:36:30', null, '2016-12-20 09:36:52', null, '张裕解百纳', '张裕解百纳', null, null, null, null, '2016-12-12', '2016-12-19', null, null, null, '启用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '7', '5', '7');
INSERT INTO `s_user` VALUES ('3', 'admin', '2010-05-24 15:23:59', null, '2010-05-25 14:17:28', null, 'admin', 'admin', '123456', null, null, null, '2016-05-01', '2017-03-14', null, null, '1,aaa2,company,companyList:3,load4Visit,companyAction,load4Visit:4,load4LinkManMain,companyLinkmanAction,load4LinkManMain:5,load4CompanyTouchMain,aaaa,bbb:', '启用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '1', '1', '1');
INSERT INTO `s_user` VALUES ('4', null, '2016-12-20 09:36:13', null, '2016-12-21 09:36:33', null, 'Java之旅', 'Java之旅', '123456', null, null, null, '1960-09-01', '2016-11-02', null, null, null, '启用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '2', '2', '2');
INSERT INTO `s_user` VALUES ('5', null, '2016-12-30 09:36:16', null, '2016-12-28 09:36:38', null, '世界您好', '世界您好', '123456', null, null, null, '2016-09-01', '2018-09-05', null, null, '1,aaa2,company,companyList:3,load4Visit,companyAction,load4Visit:4,load4LinkManMain,companyLinkmanAction,load4LinkManMain:5,load4CompanyTouchMain,aaaa,bbb:', '启用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '3', '3', '3');
INSERT INTO `s_user` VALUES ('6', null, '2016-12-15 09:36:19', null, '2016-12-07 09:36:41', null, '一千零一夜', '一千零一夜', '123456', null, null, null, '2016-12-29', '2016-12-14', null, null, null, '禁用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '4', '4', '4');
INSERT INTO `s_user` VALUES ('7', null, '2016-11-30 09:36:22', null, '2016-12-14 09:36:45', null, '百年孤独', '百年孤独', '123456', null, null, null, '2016-12-24', '2016-12-22', null, null, null, '启用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '5', '5', '5');
INSERT INTO `s_user` VALUES ('8', null, '2016-12-13 09:36:26', null, '2016-12-04 09:36:48', null, '黑夜独行', '黑夜独行', '123456', null, null, null, '2016-12-21', '2016-12-27', null, null, null, '禁用', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, '6', '6', '6');
INSERT INTO `s_user` VALUES ('9', 'admin', null, 'admin', null, '', 'aaaaaaaaaa', '', '', '', '', '', null, null, null, null, null, '1', '', '', '', '', '', '', '', '', '1', null, '1', '', null, '', '', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '1', '1');
INSERT INTO `s_user` VALUES ('10', 'admin', null, 'admin', null, '', '1111111111', '', '', '', '', '', null, null, null, null, null, '1', '', '', '', '', '', '', '', '', '1', null, '1', '', null, '', '', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '1', '1');
INSERT INTO `s_user` VALUES ('11', 'admin', null, 'admin', null, '', '1111111111', 'aaaaaaaaaaaa', '111111111111111111111', '', '', '', null, null, null, null, null, '1', 'aaaaaaaaaaaa', '', '', '', '', '', '', '', '1', null, '1', '', null, '', '', null, '', '', '', '', '', '', '', '', '', '', '', '', '', '', null, '1', '1');
INSERT INTO `s_user_group` VALUES ('1', null, 'admin', null, null, '0', null);
INSERT INTO `s_user_group` VALUES ('2', 'test', '研发部', '翟金恒', '软件研发', '1', null);
INSERT INTO `s_user_group` VALUES ('3', '无', '市场部', 'Java之旅', '市场相关', '2', null);
INSERT INTO `s_user_group` VALUES ('4', 'aaa3', '部门1', 'aaa', 'aaa2', '3', null);
INSERT INTO `s_user_group` VALUES ('5', 'bbb3', '部门2', 'bbb', 'bbb2', '4', null);
INSERT INTO `s_user_group` VALUES ('6', 'ccc3', '部门3', 'ccc', 'ccc2', '5', null);
INSERT INTO `s_user_group` VALUES ('7', '', 'aaaaaa', '', '', '5', null);
INSERT INTO `s_user_group` VALUES ('8', 'aaaaaaaaaa', 'vvvvvvvvvvvvvvvvvvvvvvv', 'aaaaaaaaaa', 'aaaaaaaaaa', '1', null);
INSERT INTO `s_user_group` VALUES ('9', 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaa', 'aaaaaaaaaaaaa', 'aaaaaaaaaaaaaaaa', '6', null);
INSERT INTO `s_user_group` VALUES ('10', 'vvvvvvvvvv', 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaa', 'aaaaavvvvv', '8', null);
INSERT INTO `s_user_group` VALUES ('11', 'aaaaaaaaaa', 'aaaaaaaaaaaaaaaa', 'aaaaaaaaaaaaaaa', 'aaaaaaaa', '4', null);
