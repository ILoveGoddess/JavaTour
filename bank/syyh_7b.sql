/*
MySQL Data Transfer
Source Host: localhost
Source Database: syyh_7b
Target Host: localhost
Target Database: syyh_7b
Date: 2016/12/10 22:51:54
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for bank
-- ----------------------------
CREATE TABLE `bank` (
  `Bank_id` varchar(10) NOT NULL,
  `Bank_Name` varchar(40) default NULL,
  `Bank_Longitude` decimal(15,10) default NULL,
  `Bank_Latitude` decimal(15,10) default NULL,
  `Bank_IP` varchar(15) default NULL,
  PRIMARY KEY  (`Bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for bank_equipment
-- ----------------------------
CREATE TABLE `bank_equipment` (
  `EquipmentEach_ID` varchar(10) NOT NULL,
  `Equipment_id` varchar(10) default NULL,
  `Bank_id` varchar(10) default NULL,
  `Equipment_Value` decimal(10,2) default NULL,
  `Equipment_BuyDate` date default NULL,
  `Status` char(1) default NULL,
  `Depreciation_Value` decimal(10,2) default NULL,
  PRIMARY KEY  (`EquipmentEach_ID`),
  KEY `FK_BANK_EQU_BANDEQUME_BANK` (`Bank_id`),
  KEY `FK47E14B4BEA58C9D5` (`Equipment_id`),
  KEY `FK47E14B4B2E8E7C79` (`Bank_id`),
  CONSTRAINT `FK47E14B4B2E8E7C79` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK47E14B4BEA58C9D5` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`),
  CONSTRAINT `FK_BANK_EQU_BANDEQUME_BANK` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK_BANK_EQU_ZLMX_EQUIPMEN` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for department
-- ----------------------------
CREATE TABLE `department` (
  `Department_id` bigint(20) NOT NULL auto_increment,
  `Department_Name` varchar(40) default NULL,
  PRIMARY KEY  (`Department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for equipmentmaintain
-- ----------------------------
CREATE TABLE `equipmentmaintain` (
  `Maintain_ID` bigint(20) NOT NULL,
  `EquipmentEach_ID` varchar(10) default NULL,
  `Maintain_Date` date default NULL,
  `Maintain_Result` varchar(255) default NULL,
  PRIMARY KEY  (`Maintain_ID`),
  KEY `FK_EQUIPMEN_BANKEQUIP_BANK_EQU` (`EquipmentEach_ID`),
  KEY `FK9DF62D19C0DBB81E` (`EquipmentEach_ID`),
  CONSTRAINT `FK9DF62D19C0DBB81E` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`),
  CONSTRAINT `FK_EQUIPMEN_BANKEQUIP_BANK_EQU` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for equipmenttype
-- ----------------------------
CREATE TABLE `equipmenttype` (
  `Equipment_id` varchar(10) NOT NULL,
  `Equipment_Name` varchar(40) default NULL,
  PRIMARY KEY  (`Equipment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fault_repair
-- ----------------------------
CREATE TABLE `fault_repair` (
  `RepairID` bigint(20) NOT NULL auto_increment,
  `Group_id` bigint(20) default NULL,
  `EquipmentEach_ID` varchar(10) default NULL,
  `PITYPE_Id` bigint(20) default NULL,
  `Equipment_id` varchar(10) default NULL,
  `Bank_id` varchar(10) default NULL,
  `Login_ID` varchar(10) default NULL,
  `Fault_Repair_Begin_Date` date default NULL,
  `Repair_Status` char(1) default NULL,
  `Allocate_Status` char(1) default NULL,
  `Fault_Repair_End_Date` date default NULL,
  `Fault_Repair_Evaluation` varchar(255) default NULL,
  PRIMARY KEY  (`RepairID`),
  KEY `FK_FAULT_RE_RELATIONS_FAULT_RE` (`PITYPE_Id`),
  KEY `FK29A3984AC0DBB81E` (`EquipmentEach_ID`),
  KEY `FK29A3984AEA58C9D5` (`Equipment_id`),
  KEY `FK29A3984A8BB06F5A` (`Login_ID`),
  KEY `FK29A3984A2E8E7C79` (`Bank_id`),
  KEY `FK29A3984ACC79E242` (`Group_id`),
  KEY `FK29A3984A32646EB1` (`PITYPE_Id`),
  CONSTRAINT `FK29A3984A2E8E7C79` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK29A3984A32646EB1` FOREIGN KEY (`PITYPE_Id`) REFERENCES `fault_repair_type` (`PITYPE_Id`),
  CONSTRAINT `FK29A3984A8BB06F5A` FOREIGN KEY (`Login_ID`) REFERENCES `users` (`Login_ID`),
  CONSTRAINT `FK29A3984AC0DBB81E` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`),
  CONSTRAINT `FK29A3984ACC79E242` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK29A3984AEA58C9D5` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`),
  CONSTRAINT `FK_FAULT_RE_BANK_EQUI_BANK_EQU` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`),
  CONSTRAINT `FK_FAULT_RE_PI_GRUOP__PI_GROUP` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK_FAULT_RE_RELATIONS_BANK` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK_FAULT_RE_RELATIONS_EQUIPMEN` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`),
  CONSTRAINT `FK_FAULT_RE_RELATIONS_FAULT_RE` FOREIGN KEY (`PITYPE_Id`) REFERENCES `fault_repair_type` (`PITYPE_Id`),
  CONSTRAINT `FK_FAULT_RE_USER_FAUL_USERS` FOREIGN KEY (`Login_ID`) REFERENCES `users` (`Login_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for fault_repair_type
-- ----------------------------
CREATE TABLE `fault_repair_type` (
  `PITYPE_Id` bigint(20) NOT NULL auto_increment,
  `PITYPE_Value` varchar(40) default NULL,
  PRIMARY KEY  (`PITYPE_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for functions
-- ----------------------------
CREATE TABLE `functions` (
  `Func_ID` bigint(20) NOT NULL,
  `Func_Name` varchar(40) default NULL,
  PRIMARY KEY  (`Func_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for globals
-- ----------------------------
CREATE TABLE `globals` (
  `Global_id` bigint(20) NOT NULL,
  `Key_1` varchar(10) default NULL,
  `Value_1` varchar(30) default NULL,
  `Key_2` varchar(10) default NULL,
  `Value_2` varchar(30) default NULL,
  `Key_3` varchar(10) default NULL,
  `Value_3` varchar(30) default NULL,
  `Description` varchar(100) default NULL,
  PRIMARY KEY  (`Global_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for gwym
-- ----------------------------
CREATE TABLE `gwym` (
  `Job_ID` bigint(20) NOT NULL,
  `ymbh` bigint(20) NOT NULL,
  PRIMARY KEY  (`Job_ID`,`ymbh`),
  KEY `FK30A00413833D4D` (`ymbh`),
  KEY `FK30A0047A4F47B` (`Job_ID`),
  CONSTRAINT `FK30A00413833D4D` FOREIGN KEY (`ymbh`) REFERENCES `xtymb` (`ymbh`),
  CONSTRAINT `FK30A0047A4F47B` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`),
  CONSTRAINT `FK_GWYM_GWYM2_XTYMB` FOREIGN KEY (`ymbh`) REFERENCES `xtymb` (`ymbh`),
  CONSTRAINT `FK_GWYM_GWYM_JOB` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for job
-- ----------------------------
CREATE TABLE `job` (
  `Job_ID` bigint(20) NOT NULL auto_increment,
  `Group_id` bigint(20) default NULL,
  `Name` varchar(40) default NULL,
  `Description` varchar(100) default NULL,
  PRIMARY KEY  (`Job_ID`),
  KEY `FK_JOB_RELATIONS_PI_GROUP` (`Group_id`),
  KEY `FK19BBDCC79E242` (`Group_id`),
  CONSTRAINT `FK19BBDCC79E242` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK_JOB_RELATIONS_PI_GROUP` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for logs
-- ----------------------------
CREATE TABLE `logs` (
  `log_id` bigint(20) NOT NULL auto_increment,
  `Checkin_time` datetime default NULL,
  `Checkout_time` datetime default NULL,
  `Users_id` varchar(10) default NULL,
  PRIMARY KEY  (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pi_equipment_table
-- ----------------------------
CREATE TABLE `pi_equipment_table` (
  `ID` bigint(20) NOT NULL,
  `Login_ID` varchar(10) default NULL,
  `Bank_id` varchar(10) default NULL,
  `Group_id` bigint(20) default NULL,
  `Equipment_id` varchar(10) default NULL,
  `PITYPE_Id` bigint(20) default NULL,
  `EquipmentEach_ID` varchar(10) default NULL,
  `PI_Date` date default NULL,
  `PI_Evaluation` varchar(255) default NULL,
  `PI_Status` char(1) default NULL,
  `Status` char(1) default NULL,
  PRIMARY KEY  (`ID`),
  KEY `FK_PI_EQUIP_RELATIONS_FAULT_RE` (`PITYPE_Id`),
  KEY `FK4E9F397C0DBB81E` (`EquipmentEach_ID`),
  KEY `FK4E9F397EA58C9D5` (`Equipment_id`),
  KEY `FK4E9F3978BB06F5A` (`Login_ID`),
  KEY `FK4E9F3972E8E7C79` (`Bank_id`),
  KEY `FK4E9F397CC79E242` (`Group_id`),
  KEY `FK4E9F39732646EB1` (`PITYPE_Id`),
  CONSTRAINT `FK4E9F3972E8E7C79` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK4E9F39732646EB1` FOREIGN KEY (`PITYPE_Id`) REFERENCES `fault_repair_type` (`PITYPE_Id`),
  CONSTRAINT `FK4E9F3978BB06F5A` FOREIGN KEY (`Login_ID`) REFERENCES `users` (`Login_ID`),
  CONSTRAINT `FK4E9F397C0DBB81E` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`),
  CONSTRAINT `FK4E9F397CC79E242` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK4E9F397EA58C9D5` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_BANK` FOREIGN KEY (`Bank_id`) REFERENCES `bank` (`Bank_id`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_BANK_EQU` FOREIGN KEY (`EquipmentEach_ID`) REFERENCES `bank_equipment` (`EquipmentEach_ID`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_EQUIPMEN` FOREIGN KEY (`Equipment_id`) REFERENCES `equipmenttype` (`Equipment_id`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_FAULT_RE` FOREIGN KEY (`PITYPE_Id`) REFERENCES `fault_repair_type` (`PITYPE_Id`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_PI_GROUP` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK_PI_EQUIP_RELATIONS_USERS` FOREIGN KEY (`Login_ID`) REFERENCES `users` (`Login_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for pi_group
-- ----------------------------
CREATE TABLE `pi_group` (
  `Group_id` bigint(20) NOT NULL auto_increment,
  `Group_Name` varchar(40) default NULL,
  PRIMARY KEY  (`Group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for piwoker
-- ----------------------------
CREATE TABLE `piwoker` (
  `Woker_id` bigint(20) NOT NULL auto_increment,
  `Group_id` bigint(20) default NULL,
  `Worker_Name` varchar(40) default NULL,
  `Worker_Tel_1` varchar(40) default NULL,
  `Worker_Tel_2` varchar(40) default NULL,
  PRIMARY KEY  (`Woker_id`),
  KEY `FK_PIWOKER_GROUPWORK_PI_GROUP` (`Group_id`),
  KEY `FKDEA7C627CC79E242` (`Group_id`),
  CONSTRAINT `FKDEA7C627CC79E242` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`),
  CONSTRAINT `FK_PIWOKER_GROUPWORK_PI_GROUP` FOREIGN KEY (`Group_id`) REFERENCES `pi_group` (`Group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
CREATE TABLE `users` (
  `Login_ID` varchar(10) NOT NULL,
  `Job_ID` bigint(20) default NULL,
  `Department_id` bigint(20) default NULL,
  `Login_Password` varchar(30) default NULL,
  `User_Name` varchar(40) default NULL,
  `User_Status` char(1) default NULL,
  PRIMARY KEY  (`Login_ID`),
  KEY `FK_USERS_JOBUSER_JOB` (`Job_ID`),
  KEY `FK6A68E087448F179` (`Department_id`),
  KEY `FK6A68E087A4F47B` (`Job_ID`),
  CONSTRAINT `FK6A68E087448F179` FOREIGN KEY (`Department_id`) REFERENCES `department` (`Department_id`),
  CONSTRAINT `FK6A68E087A4F47B` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`),
  CONSTRAINT `FK_USERS_DEPARTMEN_DEPARTME` FOREIGN KEY (`Department_id`) REFERENCES `department` (`Department_id`),
  CONSTRAINT `FK_USERS_JOBUSER_JOB` FOREIGN KEY (`Job_ID`) REFERENCES `job` (`Job_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for xtymb
-- ----------------------------
CREATE TABLE `xtymb` (
  `ymbh` bigint(20) NOT NULL,
  `Func_ID` bigint(20) default NULL,
  `ymmc` varchar(20) default NULL,
  `URL` varchar(200) default NULL,
  `IMG` varchar(100) default NULL,
  PRIMARY KEY  (`ymbh`),
  KEY `FK_XTYMB_RELATIONS_FUNCTION` (`Func_ID`),
  KEY `FK6D19352345A7B32` (`Func_ID`),
  CONSTRAINT `FK6D19352345A7B32` FOREIGN KEY (`Func_ID`) REFERENCES `functions` (`Func_ID`),
  CONSTRAINT `FK_XTYMB_RELATIONS_FUNCTION` FOREIGN KEY (`Func_ID`) REFERENCES `functions` (`Func_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `bank` VALUES ('00000', '兴业银行', '111.0000000000', '30.0000000000', '192.168.4.249');
INSERT INTO `bank` VALUES ('00001', '建设银行', '120.0000000000', '40.0000000000', '192.168.4.249');
INSERT INTO `bank` VALUES ('00006', '工商银行', '9999.0000000000', '5933.0000000000', '192.168.4.249');
INSERT INTO `bank` VALUES ('006', '中华银行', '10.0000000000', '10.0000000000', '192.168.4.249');
INSERT INTO `bank` VALUES ('1', '2', '3.0000000000', '4.0000000000', '5');
INSERT INTO `bank` VALUES ('2', '2', '3.0000000000', '3.0000000000', '3.3.3.3.1');
INSERT INTO `bank_equipment` VALUES ('001', '001', '1', null, '2016-10-19', '1', null);
INSERT INTO `bank_equipment` VALUES ('003', '003', '2', '5000.00', '2015-08-04', '1', '3.00');
INSERT INTO `bank_equipment` VALUES ('005', '004', '1', '234.00', '2016-10-13', '1', '12.00');
INSERT INTO `bank_equipment` VALUES ('006', '001', null, null, '2016-10-18', '1', null);
INSERT INTO `bank_equipment` VALUES ('11', '001', '00006', '11.00', '2016-10-12', '0', '11.00');
INSERT INTO `bank_equipment` VALUES ('7', '002', '00000', '88.00', '2016-10-11', '0', '66.00');
INSERT INTO `department` VALUES ('1', '董事会');
INSERT INTO `department` VALUES ('3', '理财经理');
INSERT INTO `department` VALUES ('4', '柜员');
INSERT INTO `department` VALUES ('5', '大堂经理');
INSERT INTO `department` VALUES ('6', '个贷客户经理');
INSERT INTO `department` VALUES ('7', '营业主管');
INSERT INTO `department` VALUES ('8', '零售银行部');
INSERT INTO `department` VALUES ('10', '公司银行部');
INSERT INTO `department` VALUES ('11', '基盘业务部门');
INSERT INTO `department` VALUES ('12', '1');
INSERT INTO `equipmenttype` VALUES ('001', '打印机');
INSERT INTO `equipmenttype` VALUES ('002', 'ATM');
INSERT INTO `equipmenttype` VALUES ('003', 'aaa');
INSERT INTO `equipmenttype` VALUES ('004', '004');
INSERT INTO `equipmenttype` VALUES ('005', 'hhhh');
INSERT INTO `fault_repair_type` VALUES ('1', '自动提款机');
INSERT INTO `fault_repair_type` VALUES ('3', '电脑');
INSERT INTO `fault_repair_type` VALUES ('4', '冰箱');
INSERT INTO `fault_repair_type` VALUES ('5', '洗衣机');
INSERT INTO `functions` VALUES ('1', '系统管理');
INSERT INTO `functions` VALUES ('2', '报修管理');
INSERT INTO `functions` VALUES ('3', '巡检管理');
INSERT INTO `gwym` VALUES ('1', '1');
INSERT INTO `gwym` VALUES ('1', '2');
INSERT INTO `gwym` VALUES ('1', '3');
INSERT INTO `gwym` VALUES ('1', '4');
INSERT INTO `gwym` VALUES ('1', '6');
INSERT INTO `gwym` VALUES ('1', '7');
INSERT INTO `gwym` VALUES ('1', '8');
INSERT INTO `gwym` VALUES ('1', '9');
INSERT INTO `gwym` VALUES ('1', '10');
INSERT INTO `gwym` VALUES ('1', '11');
INSERT INTO `gwym` VALUES ('1', '13');
INSERT INTO `gwym` VALUES ('1', '14');
INSERT INTO `gwym` VALUES ('1', '15');
INSERT INTO `gwym` VALUES ('1', '16');
INSERT INTO `gwym` VALUES ('1', '17');
INSERT INTO `gwym` VALUES ('1', '18');
INSERT INTO `gwym` VALUES ('1', '19');
INSERT INTO `job` VALUES ('1', null, '高级管理员', '测试功能');
INSERT INTO `job` VALUES ('5', null, '666', '234');
INSERT INTO `job` VALUES ('7', null, '小明', '世界您好a');
INSERT INTO `job` VALUES ('8', null, '小红', '世界您好');
INSERT INTO `job` VALUES ('12', null, 'dd', 'f');
INSERT INTO `logs` VALUES ('1', '2016-10-26 00:00:00', null, 'admin');
INSERT INTO `logs` VALUES ('2', '2016-12-10 00:00:00', null, '世界您好');
INSERT INTO `pi_group` VALUES ('1', 'A组');
INSERT INTO `pi_group` VALUES ('2', 'BB组');
INSERT INTO `pi_group` VALUES ('3', 'CCC组3dddd');
INSERT INTO `pi_group` VALUES ('4', '小红');
INSERT INTO `pi_group` VALUES ('5', '');
INSERT INTO `pi_group` VALUES ('6', '');
INSERT INTO `pi_group` VALUES ('7', '001');
INSERT INTO `pi_group` VALUES ('8', '小明');
INSERT INTO `pi_group` VALUES ('9', '小明');
INSERT INTO `pi_group` VALUES ('10', 'aa');
INSERT INTO `piwoker` VALUES ('3', '10', '小明', '1234567', '1234567');
INSERT INTO `piwoker` VALUES ('4', '7', 'test', '1234567', '1234567');
INSERT INTO `piwoker` VALUES ('8', null, 'XIAO', '15737310437', '15737310437');
INSERT INTO `piwoker` VALUES ('9', null, 'q', '15737310437', '15737310437');
INSERT INTO `users` VALUES ('1', '1', '1', '1', '1', '1');
INSERT INTO `users` VALUES ('admin', '1', '1', '123456', 'admin', '1');
INSERT INTO `users` VALUES ('love', '1', '3', '1234', 'love', '1');
INSERT INTO `users` VALUES ('世界您好', '1', '3', '1234', '世界您好', '1');
INSERT INTO `users` VALUES ('小明', '1', '1', 'xiaoming', '小明', '1');
INSERT INTO `users` VALUES ('小红', '5', '3', 'xiaohong', '小红', '1');
INSERT INTO `users` VALUES ('灰太狼', '5', '3', 'aaaa', '灰太狼', '1');
INSERT INTO `xtymb` VALUES ('1', '1', '用户管理', 'user/userList.do', null);
INSERT INTO `xtymb` VALUES ('2', '1', '部门管理', 'dept/deptList.do', null);
INSERT INTO `xtymb` VALUES ('3', '1', '日志管理', 'log/logList.do', null);
INSERT INTO `xtymb` VALUES ('4', '1', '银行设备种类管理', 'equipmentType/equipmentTypeList.do', null);
INSERT INTO `xtymb` VALUES ('5', '1', '全局变量管理', '../xtgl/globalsList.do', null);
INSERT INTO `xtymb` VALUES ('6', '1', '银行网点管理', 'bank/banklist.do', null);
INSERT INTO `xtymb` VALUES ('7', '2', '网点查看报修信息', '../sbbx/sbbx!listw.do', null);
INSERT INTO `xtymb` VALUES ('8', '2', '巡检中心查看报修信息', '../sbbx/sbbx!list.do', null);
INSERT INTO `xtymb` VALUES ('9', '1', '岗位管理', 'job/jobList.do?first=1', null);
INSERT INTO `xtymb` VALUES ('10', '1', '巡检工管理', 'inspectionWorker/inspectionWorkerList.do', null);
INSERT INTO `xtymb` VALUES ('11', '1', '巡检组管理', 'inspectionGroup/inspectionGroupList.do', null);
INSERT INTO `xtymb` VALUES ('12', '1', '设备问题报修管理', 'repairtype/repairtypeList.do', null);
INSERT INTO `xtymb` VALUES ('13', '2', '网点设备报修', '../sbbx/sbbx!presavew.do', null);
INSERT INTO `xtymb` VALUES ('14', '2', '值班员报修', '../sbbx/sbbx!presavez.do', null);
INSERT INTO `xtymb` VALUES ('15', '3', '网点对巡检确认', 'inspection/wdryList.do', null);
INSERT INTO `xtymb` VALUES ('16', '2', '网点对报修确认', '../sbbx/sbbx!listw.do?rs=1', null);
INSERT INTO `xtymb` VALUES ('17', '2', '巡检中心分配小组', '../sbbx/sbbx!list.do?rs=0&as=0', null);
INSERT INTO `xtymb` VALUES ('18', '2', '维修工确认维修', '../sbbx/sbbx!listg.do', null);
INSERT INTO `xtymb` VALUES ('19', '3', '设备巡检', 'inspection/sbxjList.do?y=n', null);
