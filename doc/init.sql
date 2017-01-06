/*
SQLyog Job Agent v11.11 (64 bit) Copyright(c) Webyog Inc. All Rights Reserved.


MySQL - 5.7.13 : Database - fargo
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fargo` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fargo`;

/*Table structure for table `auth_app_role` */

DROP TABLE IF EXISTS `auth_app_role`;

CREATE TABLE `auth_app_role` (
  `roleId` bigint(20) NOT NULL AUTO_INCREMENT,
  `roleName` varchar(50) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `privilegeList` text,
  `library` bigint(20) DEFAULT NULL,
  `overt` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`roleId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `auth_app_role` */

insert  into `auth_app_role`(`roleId`,`roleName`,`description`,`privilegeList`,`library`,`overt`) values (1,'超级管理员','超级管理员','[473,1199,1206,1207,1208,471,954,1223,1224,1225,1226,1227,1321,1322,1323,1324,1325,955,956,957,958,959,1170,960,1218,1219,1220,1221,1222,961,962,963,964,965,1164,1228,1229,1230,1231,1232,1233,1234,1235,1236,1237,1165,1166,1167,1168,1169,1180,1243,1244,1245,1246,1247,1181,1182,1183,1184,1185,941,1258,1259,1260,1261,1262,942,943,944,945,946,602,644,645,646,647,648,649,650,651,652,653,654,655,669,670,671,672,673,674]',1,0);

/*Table structure for table `auth_app_user` */

DROP TABLE IF EXISTS `auth_app_user`;

CREATE TABLE `auth_app_user` (
  `userId` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) DEFAULT NULL,
  `fullName` varchar(50) DEFAULT NULL,
  `password` varchar(200) DEFAULT NULL,
  `passwordHint` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phoneNumber` bigint(20) DEFAULT NULL,
  `enabled` tinyint(4) DEFAULT NULL,
  `libraryRoleList` text,
  `createTime` datetime DEFAULT NULL,
  `updateTime` datetime DEFAULT NULL,
  `library` bigint(20) DEFAULT NULL,
  `overt` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

/*Data for the table `auth_app_user` */

insert  into `auth_app_user`(`userId`,`userName`,`fullName`,`password`,`passwordHint`,`email`,`phoneNumber`,`enabled`,`libraryRoleList`,`createTime`,`updateTime`,`library`,`overt`) values (32,'sadmin','超级管理员','7c4a8d09ca3762af61e59520943dc26494f8941b','d61d2e835a2d4e00431c78b4893cb372','sadmin2w@abc.com',NULL,1,'[{\r\n      \"libraryRoleId\" : 96,\r\n      \"description\" : \"212122\",\r\n      \"roleList\" : [1],\r\n      \"ifDefault\" : true,\r\n      \"libraryId\" : 1,\r\n      \"overt\" : false\r\n    }]	','2015-01-06 16:30:13','2015-08-13 10:30:42',1,0);

/*Table structure for table `auth_privilege_info` */

DROP TABLE IF EXISTS `auth_privilege_info`;

CREATE TABLE `auth_privilege_info` (
  `privilegeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `privilegeName` varchar(50) DEFAULT NULL,
  `privilegeType` char(3) DEFAULT NULL,
  `formId` bigint(20) DEFAULT NULL,
  `operateName` char(3) DEFAULT NULL,
  `url` varchar(300) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `ifButtonGroup` tinyint(4) DEFAULT NULL,
  `ifHiddenOnTaskRunning` tinyint(4) DEFAULT NULL,
  `iconCode` varchar(300) DEFAULT NULL,
  `sortNo` float DEFAULT NULL,
  `taskType` char(3) DEFAULT NULL,
  `machineId` bigint(20) DEFAULT NULL,
  `enumCodeList` text,
  `operatorRequestType` char(3) DEFAULT NULL,
  `javaScriptFunction` text,
  PRIMARY KEY (`privilegeId`)
) ENGINE=MyISAM AUTO_INCREMENT=1416 DEFAULT CHARSET=utf8;

/*Data for the table `auth_privilege_info` */

insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (471,'系统配置','AWA',0,'','',0,0,0,'fa fa-cog',473,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (473,'工作台','AWA',0,'','',0,0,0,'fa fa-desktop',-1,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (602,'超级系统管理','AWA',0,'','',0,0,0,'fa fa-cogs',602,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (644,'Form对象管理','AWB',1,'','/cfgFormInfo/list/php',602,0,0,'fa fa-th-list',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (645,'Form列表','AWC',1,'AZA','/cfgFormInfo/list',644,0,0,'fa fa-leaf',645,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (646,'Form添加','AWC',1,'AZB','/cfgFormInfo/add',644,0,0,'fa fa-leaf',646,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (647,'Form修改','AWC',1,'AZC','/cfgFormInfo/edit',644,0,0,'fa fa-leaf',647,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (648,'Form删除','AWC',1,'AZD','/cfgFormInfo/delete',644,0,0,'fa fa-leaf',648,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (649,'Form查看','AWC',1,'AZE','/cfgFormInfo/view',644,0,0,'fa fa-leaf',649,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (650,'系统枚举变量管理','AWB',3,'','/cfgEnumInfo/list/php',602,0,0,'fa fa-th-list',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (651,'枚举列表','AWC',3,'AZA','/cfgEnumInfo/list',650,0,0,'fa fa-leaf',651,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (652,'枚举添加','AWC',3,'AZB','/cfgEnumInfo/add',650,0,0,'fa fa-leaf',652,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (653,'枚举修改','AWC',3,'AZC','/cfgEnumInfo/edit',650,0,0,'fa fa-leaf',653,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (654,'枚举删除','AWC',3,'AZD','/cfgEnumInfo/delete',650,0,0,'fa fa-leaf',654,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (655,'枚举查看','AWC',3,'AZE','/cfgEnumInfo/view',650,0,0,'fa fa-leaf',655,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (669,'系统权限维护','AWB',33,'','/authPrivilegeInfo/list/php',602,0,0,'fa fa-th-list',650,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (670,'权限列表','AWC',33,'AZA','/authPrivilegeInfo/list',669,0,0,'fa fa-leaf',670,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (671,'权限添加','AWC',33,'AZB','/authPrivilegeInfo/add',669,0,0,'fa fa-leaf',671,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (672,'权限修改','AWC',33,'AZC','/authPrivilegeInfo/edit',669,0,0,'fa fa-leaf',672,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (673,'权限删除','AWC',33,'AZD','/authPrivilegeInfo/delete',669,0,0,'fa fa-leaf',673,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (674,'权限查看','AWC',33,'AZE','/authPrivilegeInfo/view',669,0,0,'fa fa-leaf',674,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (681,'系统可变属性维护','AWB',45,'','/cfgFixedPropertyDefine/list/php',602,0,0,'fa fa-th-list',644,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (682,'系统可变属性列表','AWC',45,'AZA','/cfgFixedPropertyDefine/list',681,0,0,'fa fa-leaf',682,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (683,'系统可变属性添加','AWC',45,'AZB','/cfgFixedPropertyDefine/add',681,0,0,'fa fa-leaf',683,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (684,'系统可变属性修改','AWC',45,'AZC','/cfgFixedPropertyDefine/edit',681,0,0,'fa fa-leaf',684,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (685,'系统可变属性删除','AWC',45,'AZD','/cfgFixedPropertyDefine/delete',681,0,0,'fa fa-leaf',685,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (686,'系统可变属性查看','AWC',45,'AZE','/cfgFixedPropertyDefine/view',681,0,0,'fa fa-leaf',686,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (694,'用户自定义变量维护','AWB',48,'','/cfgCustomProperty/list/mt/php',471,0,0,'fa fa-th-large',1164,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (695,'用户自定义变量列表','AWC',48,'AZA','/cfgCustomProperty/list',694,0,0,'fa fa-leaf',695,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (696,'用户自定义变量添加','AWC',48,'AZB','/cfgCustomProperty/add',694,0,0,'fa fa-leaf',696,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (697,'用户自定义变量修改','AWC',48,'AZC','/cfgCustomProperty/edit',694,0,0,'fa fa-leaf',697,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (698,'用户自定义变量删除','AWC',48,'AZD','/cfgCustomProperty/delete',694,0,0,'fa fa-leaf',698,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (699,'用户自定义变量查看','AWC',48,'AZE','/cfgCustomProperty/view',694,0,0,'fa fa-leaf',699,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (721,'系统可变属性值维护','AWB',47,'','/cfgFixedPropertyValue/list/php',681,0,0,'fa fa-th-list',721,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (722,'系统可变属性值列表','AWC',47,'AZA','/cfgFixedPropertyValue/list',721,0,0,'fa fa-leaf',722,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (723,'系统可变属性值添加','AWC',47,'AZB','/cfgFixedPropertyValue/add',721,0,0,'fa fa-leaf',723,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (724,'系统可变属性值修改','AWC',47,'AZC','/cfgFixedPropertyValue/edit',721,0,0,'fa fa-leaf',724,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (725,'系统可变属性值删除','AWC',47,'AZD','/cfgFixedPropertyValue/delete',721,0,0,'fa fa-leaf',725,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (726,'系统可变属性值查看','AWC',47,'AZE','/cfgFixedPropertyValue/view',721,0,0,'fa fa-leaf',726,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (941,'系统参数配置','AWB',101,'','/cfgParameter/list/mt/php',471,0,0,'fa fa-gear',1180,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (942,'系统参数配置列表','AWC',101,'AZA','/cfgParameter/list',941,0,0,'fa fa-leaf',942,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (943,'系统参数配置添加','AWC',101,'AZB','/cfgParameter/add',941,0,0,'fa fa-leaf',943,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (944,'系统参数配置修改','AWC',101,'AZC','/cfgParameter/edit',941,0,0,'fa fa-leaf',944,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (945,'系统参数配置删除','AWC',101,'AZD','/cfgParameter/delete',941,0,0,'fa fa-leaf',945,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (946,'系统参数配置查看','AWC',101,'AZE','/cfgParameter/view',941,0,0,'fa fa-leaf',946,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (947,'后台任务管理','AWB',94,'','/stTaskInfo/list/mt/php',471,0,0,'fa fa-tasks',960,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (948,'后台任务列表','AWC',94,'AZA','/stTaskInfo/list',947,0,0,'fa fa-leaf',948,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (949,'后台任务添加','AWC',94,'AZB','/stTaskInfo/add',947,0,0,'fa fa-leaf',949,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (950,'后台任务修改','AWC',94,'AZC','/stTaskInfo/edit',947,0,0,'fa fa-leaf',950,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (951,'后台任务删除','AWC',94,'AZD','/stTaskInfo/delete',947,0,0,'fa fa-leaf',951,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (952,'后台任务查看','AWC',94,'AZE','/stTaskInfo/view',947,0,0,'fa fa-leaf',952,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (954,'系统角色管理','AWB',103,'','/authAppRole/list/mt/php',471,0,0,'fa fa-lock',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (955,'系统角色列表','AWC',103,'AZA','/authAppRole/list',954,0,0,'fa fa-leaf',955,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (956,'系统角色添加','AWC',103,'AZB','/authAppRole/add',954,0,0,'fa fa-leaf',956,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (957,'系统角色修改','AWC',103,'AZC','/authAppRole/edit',954,0,0,'fa fa-leaf',957,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (958,'系统角色删除','AWC',103,'AZD','/authAppRole/delete',954,0,0,'fa fa-leaf',958,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (959,'系统角色查看','AWC',103,'AZE','/authAppRole/view',954,0,0,'fa fa-leaf',959,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (960,'系统用户管理','AWB',102,'','/authAppUser/list/mt/php',471,0,0,'fa fa-users',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (961,'系统用户列表','AWC',102,'AZA','/authAppUser/list',960,0,0,'fa fa-leaf',961,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (962,'系统用户添加','AWC',102,'AZB','/authAppUser/add',960,0,0,'fa fa-leaf',962,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (963,'系统用户修改','AWC',102,'AZC','/authAppUser/edit',960,0,0,'fa fa-leaf',963,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (964,'系统用户删除','AWC',102,'AZD','/authAppUser/delete',960,0,0,'fa fa-leaf',964,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (965,'系统用户查看','AWC',102,'AZE','/authAppUser/view',960,0,0,'fa fa-leaf',965,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1045,'管理服务端维护','AWB',100,'','/stAdminServerInfo/list/mt/php',471,0,0,'fa fa-sitemap',947,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1046,'管理服务端列表','AWC',100,'AZA','/stAdminServerInfo/list',1045,0,0,'fa fa-leaf',1046,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1047,'管理服务端添加','AWC',100,'AZB','/stAdminServerInfo/add',1045,0,0,'fa fa-leaf',1047,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1048,'管理服务端修改','AWC',100,'AZC','/stAdminServerInfo/edit',1045,0,0,'fa fa-leaf',1048,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1049,'管理服务端删除','AWC',100,'AZD','/stAdminServerInfo/delete',1045,0,0,'fa fa-leaf',1049,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1050,'管理服务端查看','AWC',100,'AZE','/stAdminServerInfo/view',1045,0,0,'fa fa-leaf',1050,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1069,'状态机维护','AWB',123,'','/cfgStateMachineDefine/list/php',602,0,0,'fa fa-th-list',681,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1070,'状态机列表','AWC',123,'AZA','/cfgStateMachineDefine/list',1069,0,0,'fa fa-leaf',1070,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1071,'状态机添加','AWC',123,'AZB','/cfgStateMachineDefine/add',1069,0,0,'fa fa-leaf',1071,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1072,'状态机修改','AWC',123,'AZC','/cfgStateMachineDefine/edit',1069,0,0,'fa fa-leaf',1072,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1073,'状态机删除','AWC',123,'AZD','/cfgStateMachineDefine/delete',1069,0,0,'fa fa-leaf',1073,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1074,'状态机查看','AWC',123,'AZE','/cfgStateMachineDefine/view',1069,0,0,'fa fa-leaf',1074,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1076,'状态项维护','AWB',124,'','/cfgStateMachineValue/list/php',1069,0,0,'fa fa-th-list',1076,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1077,'状态项列表','AWC',124,'AZA','/cfgStateMachineValue/list',1076,0,0,'fa fa-leaf',1077,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1078,'状态项添加','AWC',124,'AZB','/cfgStateMachineValue/add',1076,0,0,'fa fa-leaf',1078,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1079,'状态项修改','AWC',124,'AZC','/cfgStateMachineValue/edit',1076,0,0,'fa fa-leaf',1079,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1080,'状态项删除','AWC',124,'AZD','/cfgStateMachineValue/delete',1076,0,0,'fa fa-leaf',1080,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1081,'状态项查看','AWC',124,'AZE','/cfgStateMachineValue/view',1076,0,0,'fa fa-leaf',1081,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1082,'状态项操作维护','AWB',125,'','/cfgStateMachineButton/list/php',1069,0,0,'fa fa-th-list',1082,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1083,'状态项操作列表','AWC',125,'AZA','/cfgStateMachineButton/list',1082,0,0,'fa fa-leaf',1083,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1084,'状态项操作添加','AWC',125,'AZB','/cfgStateMachineButton/add',1082,0,0,'fa fa-leaf',1084,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1085,'状态项操作修改','AWC',125,'AZC','/cfgStateMachineButton/edit',1082,0,0,'fa fa-leaf',1085,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1086,'状态项操作删除','AWC',125,'AZD','/cfgStateMachineButton/delete',1082,0,0,'fa fa-leaf',1086,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1087,'状态项操作查看','AWC',125,'AZE','/cfgStateMachineButton/view',1082,0,0,'fa fa-leaf',1087,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1157,'系统快捷菜单管理','AWB',126,'','/authShortCutPrivilege/list/mt/php',602,0,0,'fa fa-th-list',669,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1158,'系统快捷菜单列表','AWC',126,'AZA','/authShortCutPrivilege/list',1157,0,0,'fa fa-leaf',1158,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1159,'系统快捷菜单添加','AWC',126,'AZB','/authShortCutPrivilege/add',1157,0,0,'fa fa-leaf',1159,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1160,'系统快捷菜单修改','AWC',126,'AZC','/authShortCutPrivilege/edit',1157,0,0,'fa fa-leaf',1160,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1161,'系统快捷菜单删除','AWC',126,'AZD','/authShortCutPrivilege/delete',1157,0,0,'fa fa-leaf',1161,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1162,'系统快捷菜单查看','AWC',126,'AZE','/authShortCutPrivilege/view',1157,0,0,'fa fa-leaf',1162,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1164,'系统公告维护','AWB',127,'','/stSystemNoticeInfo/list/mt/php',471,0,0,'fa fa-bullhorn',694,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1165,'系统公告列表','AWC',127,'AZA','/stSystemNoticeInfo/list',1164,0,0,'fa fa-leaf',1165,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1166,'系统公告添加','AWC',127,'AZB','/stSystemNoticeInfo/add',1164,0,0,'fa fa-leaf',1166,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1167,'系统公告修改','AWC',127,'AZC','/stSystemNoticeInfo/edit',1164,0,0,'fa fa-leaf',1167,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1168,'系统公告删除','AWC',127,'AZD','/stSystemNoticeInfo/delete',1164,0,0,'fa fa-leaf',1168,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1169,'系统公告查看','AWC',127,'AZE','/stSystemNoticeInfo/view',1164,0,0,'fa fa-leaf',1169,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1170,'权限配置','AWC',103,'','/authAppRole/edit/privilege/${objectId}/php',954,1,0,'fa fa-leaf',1170,'',NULL,NULL,'BQA',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1173,'数据库维护','AWB',128,'','/libraryInfo/list/mt/php',602,0,0,'fa fa-th-list',1069,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1174,'数据库列表','AWC',128,'AZA','/libraryInfo/list',1173,0,0,'fa fa-leaf',1174,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1175,'数据库添加','AWC',128,'AZB','/libraryInfo/add',1173,0,0,'fa fa-leaf',1175,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1176,'数据库修改','AWC',128,'AZC','/libraryInfo/edit',1173,0,0,'fa fa-leaf',1176,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1177,'数据库删除','AWC',128,'AZD','/libraryInfo/delete',1173,0,0,'fa fa-leaf',1177,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1178,'数据库查看','AWC',128,'AZE','/libraryInfo/view',1173,0,0,'fa fa-leaf',1178,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1180,'图标管理','AWB',129,'','/cfgIconInfo/list/mt/php',471,0,0,'fa fa-picture-o',941,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1181,'图标列表','AWC',129,'AZA','/cfgIconInfo/list',1180,0,0,'fa fa-leaf',1181,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1182,'图标添加','AWC',129,'AZB','/cfgIconInfo/add',1180,0,0,'fa fa-leaf',1182,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1183,'图标修改','AWC',129,'AZC','/cfgIconInfo/edit',1180,0,0,'fa fa-leaf',1183,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1184,'图标删除','AWC',129,'AZD','/cfgIconInfo/delete',1180,0,0,'fa fa-leaf',1184,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1185,'图标查看','AWC',129,'AZE','/cfgIconInfo/view',1180,0,0,'fa fa-leaf',1185,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1199,'用户信息','AWA',0,'','',0,0,0,'fa fa-user',471,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1206,'个人信息','AWC',102,'','/authAppUser/currentUser/edit/php',1199,0,0,'fa fa-user',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1207,'修改密码','AWC',102,'','/authAppUser/currentUser/changePassword/php',1199,0,0,'fa fa-key',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1208,'用户配置','AWC',102,'','/authAppUser/currentUser/changeSetting/php',1199,0,0,'fa fa-wrench',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1209,'文件管理','AWB',132,'','/fileInfo/list/mt/php',602,0,0,'fa fa-unlink',1157,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1210,'文件列表','AWC',132,'AZA','/fileInfo/list',1209,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1211,'文件添加','AWC',132,'AZB','/fileInfo/add',1209,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1212,'文件修改','AWC',132,'AZC','/fileInfo/edit',1209,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1213,'文件删除','AWC',132,'AZD','/fileInfo/delete',1209,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1214,'文件查看','AWC',132,'AZE','/fileInfo/view',1209,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1218,'系统用户列表','AWC',102,'AZA','/authAppUser/list',960,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1219,'系统用户添加','AWC',102,'AZB','/authAppUser/add',960,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1220,'系统用户修改','AWC',102,'AZC','/authAppUser/edit',960,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1221,'系统用户删除','AWC',102,'AZD','/authAppUser/delete',960,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1222,'系统用户查看','AWC',102,'AZE','/authAppUser/view',960,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1223,'系统角色列表','AWC',103,'AZA','/authAppRole/list',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1224,'系统角色添加','AWC',103,'AZB','/authAppRole/add',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1225,'系统角色修改','AWC',103,'AZC','/authAppRole/edit',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1226,'系统角色删除','AWC',103,'AZD','/authAppRole/delete',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1227,'系统角色查看','AWC',103,'AZE','/authAppRole/view',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1228,'系统公告列表','AWC',127,'AZA','/stSystemNoticeInfo/list',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1229,'系统公告添加','AWC',127,'AZB','/stSystemNoticeInfo/add',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1230,'系统公告修改','AWC',127,'AZC','/stSystemNoticeInfo/edit',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1231,'系统公告删除','AWC',127,'AZD','/stSystemNoticeInfo/delete',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1232,'系统公告查看','AWC',127,'AZE','/stSystemNoticeInfo/view',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1233,'系统公告列表','AWC',127,'AZA','/stSystemNoticeInfo/list',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1234,'系统公告添加','AWC',127,'AZB','/stSystemNoticeInfo/add',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1235,'系统公告修改','AWC',127,'AZC','/stSystemNoticeInfo/edit',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1236,'系统公告删除','AWC',127,'AZD','/stSystemNoticeInfo/delete',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1237,'系统公告查看','AWC',127,'AZE','/stSystemNoticeInfo/view',1164,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1238,'后台任务列表','AWC',94,'AZA','/stTaskInfo/list',947,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1239,'后台任务添加','AWC',94,'AZB','/stTaskInfo/add',947,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1240,'后台任务修改','AWC',94,'AZC','/stTaskInfo/edit',947,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1241,'后台任务删除','AWC',94,'AZD','/stTaskInfo/delete',947,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1242,'后台任务查看','AWC',94,'AZE','/stTaskInfo/view',947,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1243,'图标列表','AWC',129,'AZA','/cfgIconInfo/list',1180,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1244,'图标添加','AWC',129,'AZB','/cfgIconInfo/add',1180,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1245,'图标修改','AWC',129,'AZC','/cfgIconInfo/edit',1180,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1246,'图标删除','AWC',129,'AZD','/cfgIconInfo/delete',1180,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1247,'图标查看','AWC',129,'AZE','/cfgIconInfo/view',1180,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1248,'管理服务端列表','AWC',100,'AZA','/stAdminServerInfo/list',1045,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1249,'管理服务端添加','AWC',100,'AZB','/stAdminServerInfo/add',1045,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1250,'管理服务端修改','AWC',100,'AZC','/stAdminServerInfo/edit',1045,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1251,'管理服务端删除','AWC',100,'AZD','/stAdminServerInfo/delete',1045,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1252,'管理服务端查看','AWC',100,'AZE','/stAdminServerInfo/view',1045,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1253,'用户自定义变量列表','AWC',48,'AZA','/cfgCustomProperty/list',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1254,'用户自定义变量添加','AWC',48,'AZB','/cfgCustomProperty/add',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1255,'用户自定义变量修改','AWC',48,'AZC','/cfgCustomProperty/edit',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1256,'用户自定义变量删除','AWC',48,'AZD','/cfgCustomProperty/delete',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1257,'用户自定义变量查看','AWC',48,'AZE','/cfgCustomProperty/view',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1258,'系统参数配置列表','AWC',101,'AZA','/cfgParameter/list',941,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1259,'系统参数配置添加','AWC',101,'AZB','/cfgParameter/add',941,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1260,'系统参数配置修改','AWC',101,'AZC','/cfgParameter/edit',941,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1261,'系统参数配置删除','AWC',101,'AZD','/cfgParameter/delete',941,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1262,'系统参数配置查看','AWC',101,'AZE','/cfgParameter/view',941,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1263,'用户自定义变量列表','AWC',48,'AZA','/cfgCustomProperty/list',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1264,'用户自定义变量添加','AWC',48,'AZB','/cfgCustomProperty/add',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1265,'用户自定义变量修改','AWC',48,'AZC','/cfgCustomProperty/edit',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1266,'用户自定义变量删除','AWC',48,'AZD','/cfgCustomProperty/delete',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1267,'用户自定义变量查看','AWC',48,'AZE','/cfgCustomProperty/view',694,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1321,'系统角色列表','AWC',103,'AZA','/authAppRole/list',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1322,'系统角色添加','AWC',103,'AZB','/authAppRole/add',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1323,'系统角色修改','AWC',103,'AZC','/authAppRole/edit',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1324,'系统角色删除','AWC',103,'AZD','/authAppRole/delete',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1325,'系统角色查看','AWC',103,'AZE','/authAppRole/view',954,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1347,'用户管理','AWB',135,'','/authOrgUser/list/mt/php',602,0,0,'fa fa-user-md',1173,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1348,'用户列表','AWC',135,'AZA','/authOrgUser/list',1347,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1349,'用户添加','AWC',135,'AZB','/authOrgUser/add',1347,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1350,'用户修改','AWC',135,'AZC','/authOrgUser/edit',1347,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1351,'用户删除','AWC',135,'AZD','/authOrgUser/delete',1347,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1352,'用户查看','AWC',135,'AZE','/authOrgUser/view',1347,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1389,'用户工作台','AWA',0,'','',0,0,0,'fa fa-folder',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1410,'系统可变变量管理','AWB',45,'','/cfgFixedPropertyDefine/list/frameEdit/mt/php',471,0,0,'fa fa-wrench',1045,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1411,'系统可变属性列表','AWC',45,'AZA','/cfgFixedPropertyDefine/list',1410,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1412,'系统可变属性添加','AWC',45,'AZB','/cfgFixedPropertyDefine/add',1410,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1413,'系统可变属性修改','AWC',45,'AZC','/cfgFixedPropertyDefine/edit',1410,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1414,'系统可变属性删除','AWC',45,'AZD','/cfgFixedPropertyDefine/delete',1410,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);
insert  into `auth_privilege_info`(`privilegeId`,`privilegeName`,`privilegeType`,`formId`,`operateName`,`url`,`parent`,`ifButtonGroup`,`ifHiddenOnTaskRunning`,`iconCode`,`sortNo`,`taskType`,`machineId`,`enumCodeList`,`operatorRequestType`,`javaScriptFunction`) values (1415,'系统可变属性查看','AWC',45,'AZE','/cfgFixedPropertyDefine/view',1410,0,0,'fa fa-leaf',0,'',NULL,NULL,'',NULL);

/*Table structure for table `cfg_enum_info` */

DROP TABLE IF EXISTS `cfg_enum_info`;

CREATE TABLE `cfg_enum_info` (
  `enumId` bigint(20) NOT NULL AUTO_INCREMENT,
  `enumName` varchar(50) DEFAULT NULL,
  `enumCode` char(2) DEFAULT NULL,
  `constantName` varchar(50) DEFAULT NULL,
  `values` text,
  `editable` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`enumId`)
) ENGINE=MyISAM AUTO_INCREMENT=694 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_enum_info` */

insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (1,'用户自定义属性数据类型','AV','PROPERTY_DATA_TYPE','[{\"enumValueId\":51,\"code\":\"A\",\"value\":\"布尔型\",\"constantName\":\"BOOLEAN\"},{\"enumValueId\":52,\"code\":\"B\",\"value\":\"整型\",\"constantName\":\"LONG\"},{\"enumValueId\":53,\"code\":\"C\",\"value\":\"浮点型\",\"constantName\":\"DOUBLE\"},{\"enumValueId\":54,\"code\":\"D\",\"value\":\"字符串\",\"constantName\":\"STRING\"},{\"enumValueId\":55,\"code\":\"E\",\"value\":\"文本型\",\"constantName\":\"TEXT\"},{\"enumValueId\":56,\"code\":\"F\",\"value\":\"列表\",\"constantName\":\"ENUM\"},{\"enumValueId\":57,\"code\":\"G\",\"value\":\"日期\",\"constantName\":\"DATE\"},{\"enumValueId\":58,\"code\":\"H\",\"value\":\"Email\",\"constantName\":\"EMAIL\"},{\"enumValueId\":1050,\"code\":\"I\",\"value\":\"百分数\",\"constantName\":\"PERCENT\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (2,'删除状态','AU','DELETE_STATUS','',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (3,'Form对象数据变化拦截类型','BB','FORM_DATA_CHANGE_DOTYPE','[{\"enumValueId\":1,\"code\":\"A\",\"value\":\"None\",\"constantName\":\"NONE\"},{\"enumValueId\":2,\"code\":\"B\",\"value\":\"通用拦截\",\"constantName\":\"COMMON\"},{\"enumValueId\":3,\"code\":\"C\",\"value\":\"自定义拦截\",\"constantName\":\"SPECIAL\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (4,'权限操作类型','AZ','PVIVILEGE_OPERATE_TYPE','[{\"enumValueId\":4,\"code\":\"A\",\"value\":\"列表\",\"constantName\":\"LIST\"},{\"enumValueId\":5,\"code\":\"B\",\"value\":\"添加\",\"constantName\":\"ADD\"},{\"enumValueId\":6,\"code\":\"C\",\"value\":\"修改\",\"constantName\":\"EDIT\"},{\"enumValueId\":7,\"code\":\"D\",\"value\":\"删除\",\"constantName\":\"DELETE\"},{\"enumValueId\":8,\"code\":\"E\",\"value\":\"查看\",\"constantName\":\"VIEW\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (6,'操作项执行方式','BQ','OPERATOR_REQUEST_TYPE','[{\"enumValueId\":9,\"code\":\"A\",\"value\":\"WebGet请求\",\"constantName\":\"WEB_REQUEST\"},{\"enumValueId\":10,\"code\":\"B\",\"value\":\"WebPost请求\",\"constantName\":\"WEB_POST_REQUEST\"},{\"enumValueId\":11,\"code\":\"C\",\"value\":\"AjaxGet请求\",\"constantName\":\"AJAX_GET_REQUEST\"},{\"enumValueId\":12,\"code\":\"D\",\"value\":\"AjaxPost请求\",\"constantName\":\"AJAX_POST_REQUEST\"},{\"enumValueId\":13,\"code\":\"E\",\"value\":\"JavaScript调用\",\"constantName\":\"JAVASCRIPT_REQUEST\"},{\"enumValueId\":14,\"code\":\"F\",\"value\":\"打开新Web请求\",\"constantName\":\"WEB_REQUEST_NEWPAGE\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (24,'是否','10','YES_OR_NO','[{\"enumValueId\":110,\"code\":\"A\",\"value\":\"是\",\"constantName\":\"YES\"},{\"enumValueId\":111,\"code\":\"B\",\"value\":\"否\",\"constantName\":\"NO\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (458,'任务状态','BG','TASK_STATUS','[{\"enumValueId\":945,\"code\":\"A\",\"value\":\"新建\",\"constantName\":\"NEW\"},{\"enumValueId\":946,\"code\":\"B\",\"value\":\"队列等待\",\"constantName\":\"WAITING\"},{\"enumValueId\":947,\"code\":\"C\",\"value\":\"执行中\",\"constantName\":\"RUNNING\"},{\"enumValueId\":948,\"code\":\"D\",\"value\":\"执行成功\",\"constantName\":\"DONE\"},{\"enumValueId\":974,\"code\":\"E\",\"value\":\"执行失败\",\"constantName\":\"FAILURE\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (483,'权限类型','AW','PVIVILEGE_TYPE','[{\"enumValueId\":1058,\"code\":\"A\",\"value\":\"目录\",\"constantName\":\"CATALOG\"},{\"enumValueId\":1059,\"code\":\"B\",\"value\":\"菜单项\",\"constantName\":\"MENU\"},{\"enumValueId\":1060,\"code\":\"C\",\"value\":\"操作项\",\"constantName\":\"OPERATOR1\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (490,'重要程度','BU','IMPORTANCE','[{\"enumValueId\":1094,\"code\":\"A\",\"value\":\"非常重要\",\"constantName\":\"LEVEL_1\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (491,'公告类型','BT','NOTICE_TYPE','[{\"enumValueId\":1093,\"code\":\"A\",\"value\":\"系统公告\",\"constantName\":\"SYSTEM_NOTICE\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (492,'公告状态','BV','NOTICE_STATUS','[{\"enumValueId\":1095,\"code\":\"A\",\"value\":\"新建\",\"constantName\":\"NEW\"},{\"enumValueId\":1096,\"code\":\"B\",\"value\":\"待审核\",\"constantName\":\"PENDING_AUDIT\"},{\"enumValueId\":1097,\"code\":\"C\",\"value\":\"审核中\",\"constantName\":\"AUDITING\"},{\"enumValueId\":1098,\"code\":\"D\",\"value\":\"审核通过\",\"constantName\":\"OK\"},{\"enumValueId\":1100,\"code\":\"E\",\"value\":\"审核不通过\",\"constantName\":\"NOT_OK\"},{\"enumValueId\":1101,\"code\":\"F\",\"value\":\"已发布\",\"constantName\":\"ONLINE\"},{\"enumValueId\":1102,\"code\":\"G\",\"value\":\"已下线\",\"constantName\":\"OFFLINE\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (494,'图标类型','BW','ICON_TYPE','[{\"enumValueId\":1117,\"code\":\"A\",\"value\":\"FontAwesome\",\"constantName\":\"FONT_AWESOME\"}]',NULL);
insert  into `cfg_enum_info`(`enumId`,`enumName`,`enumCode`,`constantName`,`values`,`editable`) values (495,'公告范围','BX','NOTICE_SCOPE','[{\"enumValueId\":1118,\"code\":\"A\",\"value\":\"系统\",\"constantName\":\"SYSTEM_SCOPE\"},{\"enumValueId\":1119,\"code\":\"B\",\"value\":\"库\",\"constantName\":\"LIBRARY_SCOPE\"},{\"enumValueId\":1120,\"code\":\"C\",\"value\":\"角色\",\"constantName\":\"ROLE_SCOPE\"},{\"enumValueId\":1121,\"code\":\"D\",\"value\":\"用户\",\"constantName\":\"USER_SCOPE\"}]',NULL);

/*Table structure for table `cfg_form_info` */

DROP TABLE IF EXISTS `cfg_form_info`;

CREATE TABLE `cfg_form_info` (
  `formId` bigint(20) NOT NULL AUTO_INCREMENT,
  `formName` varchar(50) DEFAULT NULL,
  `formCode` varchar(50) DEFAULT NULL,
  `modelClassName` varchar(300) DEFAULT NULL,
  `parent` bigint(20) DEFAULT NULL,
  `valueChangeDoType` char(3) DEFAULT NULL,
  PRIMARY KEY (`formId`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_form_info` */

insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (1,'Form','cfgFormInfo','com.fargo.basis.model.CfgFormInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (3,'枚举','cfgEnumInfo','com.fargo.basis.model.CfgEnumInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (33,'权限','authPrivilegeInfo','com.fargo.basis.model.AuthPrivilegeInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (45,'系统可变属性','cfgFixedPropertyDefine','com.fargo.basis.model.CfgFixedPropertyDefine',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (47,'系统可变属性值','cfgFixedPropertyValue','com.fargo.basis.model.CfgFixedPropertyValue',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (48,'用户自定义变量','cfgCustomProperty','com.fargo.basis.model.CfgCustomProperty',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (61,'基础对象模型','dmObjectModelInfo','com.fargo.basis.model.DmObjectModelInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (94,'后台任务','stTaskInfo','com.fargo.basis.model.StTaskInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (101,'系统参数配置','cfgParameter','com.fargo.basis.model.CfgParameter',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (102,'系统用户','authAppUser','com.fargo.basis.model.AuthAppUser',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (103,'系统角色','authAppRole','com.fargo.basis.model.AuthAppRole',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (123,'状态机','cfgStateMachineDefine','com.fargo.basis.model.CfgStateMachineDefine',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (124,'状态项','cfgStateMachineValue','com.fargo.basis.model.CfgStateMachineValue',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (125,'状态项操作','cfgStateMachineButton','com.fargo.basis.model.CfgStateMachineButton',0,'BBB');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (126,'系统快捷菜单','authShortCutPrivilege','com.fargo.basis.model.AuthShortCutPrivilege',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (127,'系统公告','stSystemNoticeInfo','com.fargo.basis.model.StSystemNoticeInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (128,'数据库','libraryInfo','com.fargo.basis.model.LibraryInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (129,'图标','cfgIconInfo','com.fargo.basis.model.CfgIconInfo',0,'BBC');
insert  into `cfg_form_info`(`formId`,`formName`,`formCode`,`modelClassName`,`parent`,`valueChangeDoType`) values (135,'用户','authOrgUser','com.fargo.basis.model.AuthOrgUser',0,'BBC');

/*Table structure for table `cfg_icon_info` */

DROP TABLE IF EXISTS `cfg_icon_info`;

CREATE TABLE `cfg_icon_info` (
  `iconId` bigint(20) NOT NULL AUTO_INCREMENT,
  `iconName` varchar(200) DEFAULT NULL,
  `iconCode` varchar(200) DEFAULT NULL,
  `iconType` char(3) DEFAULT NULL,
  `iconFolder` varchar(200) DEFAULT NULL,
  `iconSize` varchar(200) DEFAULT NULL,
  `library` bigint(20) DEFAULT NULL,
  `overt` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`iconId`)
) ENGINE=MyISAM AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_icon_info` */

insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1,'glass','fa fa-glass','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (2,'music','fa fa-music','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (3,'search','fa fa-search','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (4,'envelope-o','fa fa-envelope-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (5,'heart','fa fa-heart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (6,'star','fa fa-star','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (7,'star-o','fa fa-star-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (8,'user','fa fa-user','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (9,'film','fa fa-film','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (10,'th-large','fa fa-th-large','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (11,'th','fa fa-th','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (12,'th-list','fa fa-th-list','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (13,'check','fa fa-check','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (14,'times','fa fa-times','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (15,'search-plus','fa fa-search-plus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (16,'search-minus','fa fa-search-minus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (17,'power-off','fa fa-power-off','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (18,'signal','fa fa-signal','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (19,'cog','fa fa-cog','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (20,'trash-o','fa fa-trash-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (21,'home','fa fa-home','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (22,'file-o','fa fa-file-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (23,'clock-o','fa fa-clock-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (24,'road','fa fa-road','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (25,'download','fa fa-download','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (26,'arrow-circle-o-down','fa fa-arrow-circle-o-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (27,'arrow-circle-o-up','fa fa-arrow-circle-o-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (28,'inbox','fa fa-inbox','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (29,'play-circle-o','fa fa-play-circle-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (30,'repeat','fa fa-repeat','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (31,'refresh','fa fa-refresh','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (32,'list-alt','fa fa-list-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (33,'lock','fa fa-lock','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (34,'flag','fa fa-flag','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (35,'headphones','fa fa-headphones','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (36,'volume-off','fa fa-volume-off','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (37,'volume-down','fa fa-volume-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (38,'volume-up','fa fa-volume-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (39,'qrcode','fa fa-qrcode','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (40,'barcode','fa fa-barcode','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (41,'tag','fa fa-tag','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (42,'tags','fa fa-tags','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (43,'book','fa fa-book','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (44,'bookmark','fa fa-bookmark','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (45,'print','fa fa-print','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (46,'camera','fa fa-camera','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (47,'font','fa fa-font','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (48,'bold','fa fa-bold','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (49,'italic','fa fa-italic','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (50,'text-height','fa fa-text-height','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (51,'text-width','fa fa-text-width','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (52,'align-left','fa fa-align-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (53,'align-center','fa fa-align-center','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (54,'align-right','fa fa-align-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (55,'align-justify','fa fa-align-justify','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (56,'list','fa fa-list','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (57,'outdent','fa fa-outdent','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (58,'indent','fa fa-indent','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (59,'video-camera','fa fa-video-camera','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (60,'picture-o','fa fa-picture-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (61,'pencil','fa fa-pencil','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (62,'map-marker','fa fa-map-marker','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (63,'adjust','fa fa-adjust','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (64,'tint','fa fa-tint','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (65,'pencil-square-o','fa fa-pencil-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (66,'share-square-o','fa fa-share-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (67,'check-square-o','fa fa-check-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (68,'arrows','fa fa-arrows','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (69,'step-backward','fa fa-step-backward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (70,'fast-backward','fa fa-fast-backward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (71,'backward','fa fa-backward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (72,'play','fa fa-play','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (73,'pause','fa fa-pause','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (74,'stop','fa fa-stop','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (75,'forward','fa fa-forward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (76,'fast-forward','fa fa-fast-forward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (77,'step-forward','fa fa-step-forward','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (78,'eject','fa fa-eject','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (79,'chevron-left','fa fa-chevron-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (80,'chevron-right','fa fa-chevron-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (81,'plus-circle','fa fa-plus-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (82,'minus-circle','fa fa-minus-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (83,'times-circle','fa fa-times-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (84,'check-circle','fa fa-check-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (85,'question-circle','fa fa-question-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (86,'info-circle','fa fa-info-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (87,'crosshairs','fa fa-crosshairs','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (88,'times-circle-o','fa fa-times-circle-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (89,'check-circle-o','fa fa-check-circle-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (90,'ban','fa fa-ban','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (91,'arrow-left','fa fa-arrow-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (92,'arrow-right','fa fa-arrow-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (93,'arrow-up','fa fa-arrow-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (94,'arrow-down','fa fa-arrow-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (95,'share','fa fa-share','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (96,'expand','fa fa-expand','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (97,'compress','fa fa-compress','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (98,'plus','fa fa-plus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (99,'minus','fa fa-minus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (100,'asterisk','fa fa-asterisk','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (101,'exclamation-circle','fa fa-exclamation-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (102,'gift','fa fa-gift','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (103,'leaf','fa fa-leaf','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (104,'fire','fa fa-fire','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (105,'eye','fa fa-eye','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (106,'eye-slash','fa fa-eye-slash','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (107,'exclamation-triangle','fa fa-exclamation-triangle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (108,'plane','fa fa-plane','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (109,'calendar','fa fa-calendar','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (110,'random','fa fa-random','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (111,'comment','fa fa-comment','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (112,'magnet','fa fa-magnet','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (113,'chevron-up','fa fa-chevron-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (114,'chevron-down','fa fa-chevron-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (115,'retweet','fa fa-retweet','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (116,'shopping-cart','fa fa-shopping-cart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (117,'folder','fa fa-folder','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (118,'folder-open','fa fa-folder-open','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (119,'arrows-v','fa fa-arrows-v','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (120,'arrows-h','fa fa-arrows-h','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (121,'bar-chart','fa fa-bar-chart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (122,'twitter-square','fa fa-twitter-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (123,'facebook-square','fa fa-facebook-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (124,'camera-retro','fa fa-camera-retro','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (125,'key','fa fa-key','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (126,'cogs','fa fa-cogs','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (127,'comments','fa fa-comments','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (128,'thumbs-o-up','fa fa-thumbs-o-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (129,'thumbs-o-down','fa fa-thumbs-o-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (130,'star-half','fa fa-star-half','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (131,'heart-o','fa fa-heart-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (132,'sign-out','fa fa-sign-out','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (133,'linkedin-square','fa fa-linkedin-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (134,'thumb-tack','fa fa-thumb-tack','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (135,'external-link','fa fa-external-link','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (136,'sign-in','fa fa-sign-in','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (137,'trophy','fa fa-trophy','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (138,'github-square','fa fa-github-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (139,'upload','fa fa-upload','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (140,'lemon-o','fa fa-lemon-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (141,'phone','fa fa-phone','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (142,'square-o','fa fa-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (143,'bookmark-o','fa fa-bookmark-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (144,'phone-square','fa fa-phone-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (145,'twitter','fa fa-twitter','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (146,'facebook','fa fa-facebook','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (147,'github','fa fa-github','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (148,'unlock','fa fa-unlock','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (149,'credit-card','fa fa-credit-card','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (150,'rss','fa fa-rss','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (151,'hdd-o','fa fa-hdd-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (152,'bullhorn','fa fa-bullhorn','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (153,'bell','fa fa-bell','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (154,'certificate','fa fa-certificate','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (155,'hand-o-right','fa fa-hand-o-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (156,'hand-o-left','fa fa-hand-o-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (157,'hand-o-up','fa fa-hand-o-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (158,'hand-o-down','fa fa-hand-o-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (159,'arrow-circle-left','fa fa-arrow-circle-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (160,'arrow-circle-right','fa fa-arrow-circle-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (161,'arrow-circle-up','fa fa-arrow-circle-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (162,'arrow-circle-down','fa fa-arrow-circle-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (163,'globe','fa fa-globe','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (164,'wrench','fa fa-wrench','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (165,'tasks','fa fa-tasks','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (166,'filter','fa fa-filter','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (167,'briefcase','fa fa-briefcase','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (168,'arrows-alt','fa fa-arrows-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (169,'users','fa fa-users','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (170,'link','fa fa-link','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (171,'cloud','fa fa-cloud','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (172,'flask','fa fa-flask','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (173,'scissors','fa fa-scissors','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (174,'files-o','fa fa-files-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (175,'paperclip','fa fa-paperclip','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (176,'floppy-o','fa fa-floppy-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (177,'square','fa fa-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (178,'bars','fa fa-bars','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (179,'list-ul','fa fa-list-ul','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (180,'list-ol','fa fa-list-ol','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (181,'strikethrough','fa fa-strikethrough','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (182,'underline','fa fa-underline','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (183,'table','fa fa-table','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (184,'magic','fa fa-magic','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (185,'truck','fa fa-truck','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (186,'pinterest','fa fa-pinterest','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (187,'pinterest-square','fa fa-pinterest-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (188,'google-plus-square','fa fa-google-plus-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (189,'google-plus','fa fa-google-plus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (190,'money','fa fa-money','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (191,'caret-down','fa fa-caret-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (192,'caret-up','fa fa-caret-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (193,'caret-left','fa fa-caret-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (194,'caret-right','fa fa-caret-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (195,'columns','fa fa-columns','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (196,'sort','fa fa-sort','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (197,'sort-desc','fa fa-sort-desc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (198,'sort-asc','fa fa-sort-asc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (199,'envelope','fa fa-envelope','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (200,'linkedin','fa fa-linkedin','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (201,'undo','fa fa-undo','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (202,'gavel','fa fa-gavel','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (203,'tachometer','fa fa-tachometer','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (204,'comment-o','fa fa-comment-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (205,'comments-o','fa fa-comments-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (206,'bolt','fa fa-bolt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (207,'sitemap','fa fa-sitemap','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (208,'umbrella','fa fa-umbrella','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (209,'clipboard','fa fa-clipboard','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (210,'lightbulb-o','fa fa-lightbulb-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (211,'exchange','fa fa-exchange','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (212,'cloud-download','fa fa-cloud-download','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (213,'cloud-upload','fa fa-cloud-upload','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (214,'user-md','fa fa-user-md','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (215,'stethoscope','fa fa-stethoscope','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (216,'suitcase','fa fa-suitcase','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (217,'bell-o','fa fa-bell-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (218,'coffee','fa fa-coffee','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (219,'cutlery','fa fa-cutlery','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (220,'file-text-o','fa fa-file-text-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (221,'building-o','fa fa-building-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (222,'hospital-o','fa fa-hospital-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (223,'ambulance','fa fa-ambulance','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (224,'medkit','fa fa-medkit','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (225,'fighter-jet','fa fa-fighter-jet','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (226,'beer','fa fa-beer','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (227,'h-square','fa fa-h-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (228,'plus-square','fa fa-plus-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (229,'angle-double-left','fa fa-angle-double-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (230,'angle-double-right','fa fa-angle-double-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (231,'angle-double-up','fa fa-angle-double-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (232,'angle-double-down','fa fa-angle-double-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (233,'angle-left','fa fa-angle-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (234,'angle-right','fa fa-angle-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (235,'angle-up','fa fa-angle-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (236,'angle-down','fa fa-angle-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (237,'desktop','fa fa-desktop','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (238,'laptop','fa fa-laptop','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (239,'tablet','fa fa-tablet','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (240,'mobile','fa fa-mobile','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (241,'circle-o','fa fa-circle-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (242,'quote-left','fa fa-quote-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (243,'quote-right','fa fa-quote-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (244,'spinner','fa fa-spinner','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (245,'circle','fa fa-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (246,'reply','fa fa-reply','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (247,'github-alt','fa fa-github-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (248,'folder-o','fa fa-folder-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (249,'folder-open-o','fa fa-folder-open-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (250,'smile-o','fa fa-smile-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (251,'frown-o','fa fa-frown-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (252,'meh-o','fa fa-meh-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (253,'gamepad','fa fa-gamepad','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (254,'keyboard-o','fa fa-keyboard-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (255,'flag-o','fa fa-flag-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (256,'flag-checkered','fa fa-flag-checkered','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (257,'terminal','fa fa-terminal','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (258,'code','fa fa-code','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (259,'reply-all','fa fa-reply-all','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (260,'star-half-o','fa fa-star-half-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (261,'location-arrow','fa fa-location-arrow','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (262,'crop','fa fa-crop','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (263,'code-fork','fa fa-code-fork','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (264,'chain-broken','fa fa-chain-broken','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (265,'question','fa fa-question','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (266,'info','fa fa-info','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (267,'exclamation','fa fa-exclamation','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (268,'superscript','fa fa-superscript','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (269,'subscript','fa fa-subscript','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (270,'eraser','fa fa-eraser','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (271,'puzzle-piece','fa fa-puzzle-piece','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (272,'microphone','fa fa-microphone','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (273,'microphone-slash','fa fa-microphone-slash','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (274,'shield','fa fa-shield','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (275,'calendar-o','fa fa-calendar-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (276,'fire-extinguisher','fa fa-fire-extinguisher','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (277,'rocket','fa fa-rocket','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (278,'maxcdn','fa fa-maxcdn','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (279,'chevron-circle-left','fa fa-chevron-circle-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (280,'chevron-circle-right','fa fa-chevron-circle-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (281,'chevron-circle-up','fa fa-chevron-circle-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (282,'chevron-circle-down','fa fa-chevron-circle-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (283,'html5','fa fa-html5','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (284,'css3','fa fa-css3','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (285,'anchor','fa fa-anchor','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (286,'unlock-alt','fa fa-unlock-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (287,'bullseye','fa fa-bullseye','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (288,'ellipsis-h','fa fa-ellipsis-h','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (289,'ellipsis-v','fa fa-ellipsis-v','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (290,'rss-square','fa fa-rss-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (291,'play-circle','fa fa-play-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (292,'ticket','fa fa-ticket','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (293,'minus-square','fa fa-minus-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (294,'minus-square-o','fa fa-minus-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (295,'level-up','fa fa-level-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (296,'level-down','fa fa-level-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (297,'check-square','fa fa-check-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (298,'pencil-square','fa fa-pencil-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (299,'external-link-square','fa fa-external-link-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (300,'share-square','fa fa-share-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (301,'compass','fa fa-compass','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (302,'caret-square-o-down','fa fa-caret-square-o-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (303,'caret-square-o-up','fa fa-caret-square-o-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (304,'caret-square-o-right','fa fa-caret-square-o-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (305,'eur','fa fa-eur','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (306,'gbp','fa fa-gbp','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (307,'usd','fa fa-usd','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (308,'inr','fa fa-inr','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (309,'jpy','fa fa-jpy','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (310,'rub','fa fa-rub','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (311,'krw','fa fa-krw','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (312,'btc','fa fa-btc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (313,'file','fa fa-file','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (314,'file-text','fa fa-file-text','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (315,'sort-alpha-asc','fa fa-sort-alpha-asc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (316,'sort-alpha-desc','fa fa-sort-alpha-desc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (317,'sort-amount-asc','fa fa-sort-amount-asc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (318,'sort-amount-desc','fa fa-sort-amount-desc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (319,'sort-numeric-asc','fa fa-sort-numeric-asc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (320,'sort-numeric-desc','fa fa-sort-numeric-desc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (321,'thumbs-up','fa fa-thumbs-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (322,'thumbs-down','fa fa-thumbs-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (323,'youtube-square','fa fa-youtube-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (324,'youtube','fa fa-youtube','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (325,'xing','fa fa-xing','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (326,'xing-square','fa fa-xing-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (327,'youtube-play','fa fa-youtube-play','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (328,'dropbox','fa fa-dropbox','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (329,'stack-overflow','fa fa-stack-overflow','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (330,'instagram','fa fa-instagram','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (331,'flickr','fa fa-flickr','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (332,'adn','fa fa-adn','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (333,'bitbucket','fa fa-bitbucket','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (334,'bitbucket-square','fa fa-bitbucket-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (335,'tumblr','fa fa-tumblr','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (336,'tumblr-square','fa fa-tumblr-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (337,'long-arrow-down','fa fa-long-arrow-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (338,'long-arrow-up','fa fa-long-arrow-up','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (339,'long-arrow-left','fa fa-long-arrow-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (340,'long-arrow-right','fa fa-long-arrow-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (341,'apple','fa fa-apple','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (342,'windows','fa fa-windows','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (343,'android','fa fa-android','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (344,'linux','fa fa-linux','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (345,'dribbble','fa fa-dribbble','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (346,'skype','fa fa-skype','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (347,'foursquare','fa fa-foursquare','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (348,'trello','fa fa-trello','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (349,'female','fa fa-female','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (350,'male','fa fa-male','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (351,'gratipay','fa fa-gratipay','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (352,'sun-o','fa fa-sun-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (353,'moon-o','fa fa-moon-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (354,'archive','fa fa-archive','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (355,'bug','fa fa-bug','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (356,'vk','fa fa-vk','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (357,'weibo','fa fa-weibo','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (358,'renren','fa fa-renren','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (359,'pagelines','fa fa-pagelines','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (360,'stack-exchange','fa fa-stack-exchange','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (361,'arrow-circle-o-right','fa fa-arrow-circle-o-right','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (362,'arrow-circle-o-left','fa fa-arrow-circle-o-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (363,'caret-square-o-left','fa fa-caret-square-o-left','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (364,'dot-circle-o','fa fa-dot-circle-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (365,'wheelchair','fa fa-wheelchair','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (366,'vimeo-square','fa fa-vimeo-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (367,'try','fa fa-try','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (368,'plus-square-o','fa fa-plus-square-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (369,'space-shuttle','fa fa-space-shuttle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (370,'slack','fa fa-slack','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (371,'envelope-square','fa fa-envelope-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (372,'wordpress','fa fa-wordpress','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (373,'openid','fa fa-openid','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (374,'university','fa fa-university','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (375,'graduation-cap','fa fa-graduation-cap','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (376,'yahoo','fa fa-yahoo','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (377,'google','fa fa-google','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (378,'reddit','fa fa-reddit','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (379,'reddit-square','fa fa-reddit-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (380,'stumbleupon-circle','fa fa-stumbleupon-circle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (381,'stumbleupon','fa fa-stumbleupon','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (382,'delicious','fa fa-delicious','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (383,'digg','fa fa-digg','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (384,'pied-piper','fa fa-pied-piper','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (385,'pied-piper-alt','fa fa-pied-piper-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (386,'drupal','fa fa-drupal','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (387,'joomla','fa fa-joomla','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (388,'language','fa fa-language','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (389,'fax','fa fa-fax','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (390,'building','fa fa-building','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (391,'child','fa fa-child','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (392,'paw','fa fa-paw','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (393,'spoon','fa fa-spoon','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (394,'cube','fa fa-cube','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (395,'cubes','fa fa-cubes','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (396,'behance','fa fa-behance','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (397,'behance-square','fa fa-behance-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (398,'steam','fa fa-steam','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (399,'steam-square','fa fa-steam-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (400,'recycle','fa fa-recycle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (401,'car','fa fa-car','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (402,'taxi','fa fa-taxi','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (403,'tree','fa fa-tree','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (404,'spotify','fa fa-spotify','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (405,'deviantart','fa fa-deviantart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (406,'soundcloud','fa fa-soundcloud','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (407,'database','fa fa-database','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (408,'file-pdf-o','fa fa-file-pdf-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (409,'file-word-o','fa fa-file-word-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (410,'file-excel-o','fa fa-file-excel-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (411,'file-powerpoint-o','fa fa-file-powerpoint-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (412,'file-image-o','fa fa-file-image-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (413,'file-archive-o','fa fa-file-archive-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (414,'file-audio-o','fa fa-file-audio-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (415,'file-video-o','fa fa-file-video-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (416,'file-code-o','fa fa-file-code-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (417,'vine','fa fa-vine','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (418,'codepen','fa fa-codepen','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (419,'jsfiddle','fa fa-jsfiddle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (420,'life-ring','fa fa-life-ring','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (421,'circle-o-notch','fa fa-circle-o-notch','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (422,'rebel','fa fa-rebel','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (423,'empire','fa fa-empire','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (424,'git-square','fa fa-git-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (425,'git','fa fa-git','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (426,'hacker-news','fa fa-hacker-news','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (427,'tencent-weibo','fa fa-tencent-weibo','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (428,'qq','fa fa-qq','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (429,'weixin','fa fa-weixin','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (430,'paper-plane','fa fa-paper-plane','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (431,'paper-plane-o','fa fa-paper-plane-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (432,'history','fa fa-history','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (433,'circle-thin','fa fa-circle-thin','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (434,'header','fa fa-header','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (435,'paragraph','fa fa-paragraph','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (436,'sliders','fa fa-sliders','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (437,'share-alt','fa fa-share-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (438,'share-alt-square','fa fa-share-alt-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (439,'bomb','fa fa-bomb','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (440,'futbol-o','fa fa-futbol-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (441,'tty','fa fa-tty','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (442,'binoculars','fa fa-binoculars','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (443,'plug','fa fa-plug','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (444,'slideshare','fa fa-slideshare','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (445,'twitch','fa fa-twitch','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (446,'yelp','fa fa-yelp','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (447,'newspaper-o','fa fa-newspaper-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (448,'wifi','fa fa-wifi','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (449,'calculator','fa fa-calculator','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (450,'paypal','fa fa-paypal','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (451,'google-wallet','fa fa-google-wallet','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (452,'cc-visa','fa fa-cc-visa','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (453,'cc-mastercard','fa fa-cc-mastercard','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (454,'cc-discover','fa fa-cc-discover','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (455,'cc-amex','fa fa-cc-amex','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (456,'cc-paypal','fa fa-cc-paypal','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (457,'cc-stripe','fa fa-cc-stripe','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (458,'bell-slash','fa fa-bell-slash','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (459,'bell-slash-o','fa fa-bell-slash-o','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (460,'trash','fa fa-trash','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (461,'copyright','fa fa-copyright','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (462,'at','fa fa-at','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (463,'eyedropper','fa fa-eyedropper','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (464,'paint-brush','fa fa-paint-brush','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (465,'birthday-cake','fa fa-birthday-cake','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (466,'area-chart','fa fa-area-chart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (467,'pie-chart','fa fa-pie-chart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (468,'line-chart','fa fa-line-chart','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (469,'lastfm','fa fa-lastfm','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (470,'lastfm-square','fa fa-lastfm-square','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (471,'toggle-off','fa fa-toggle-off','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (472,'toggle-on','fa fa-toggle-on','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (473,'bicycle','fa fa-bicycle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (474,'bus','fa fa-bus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (475,'ioxhost','fa fa-ioxhost','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (476,'angellist','fa fa-angellist','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (477,'cc','fa fa-cc','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (478,'ils','fa fa-ils','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (479,'meanpath','fa fa-meanpath','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (480,'buysellads','fa fa-buysellads','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (481,'connectdevelop','fa fa-connectdevelop','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (482,'dashcube','fa fa-dashcube','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (483,'forumbee','fa fa-forumbee','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (484,'leanpub','fa fa-leanpub','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (485,'sellsy','fa fa-sellsy','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (486,'shirtsinbulk','fa fa-shirtsinbulk','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (487,'simplybuilt','fa fa-simplybuilt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (488,'skyatlas','fa fa-skyatlas','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (489,'cart-plus','fa fa-cart-plus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (490,'cart-arrow-down','fa fa-cart-arrow-down','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (491,'diamond','fa fa-diamond','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (492,'ship','fa fa-ship','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (493,'user-secret','fa fa-user-secret','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (494,'motorcycle','fa fa-motorcycle','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (495,'street-view','fa fa-street-view','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (496,'heartbeat','fa fa-heartbeat','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (497,'venus','fa fa-venus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (498,'mars','fa fa-mars','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (499,'mercury','fa fa-mercury','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (500,'transgender','fa fa-transgender','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (501,'transgender-alt','fa fa-transgender-alt','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (502,'venus-double','fa fa-venus-double','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (503,'mars-double','fa fa-mars-double','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (504,'venus-mars','fa fa-venus-mars','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (505,'mars-stroke','fa fa-mars-stroke','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (506,'mars-stroke-v','fa fa-mars-stroke-v','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (507,'mars-stroke-h','fa fa-mars-stroke-h','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (508,'neuter','fa fa-neuter','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (509,'facebook-official','fa fa-facebook-official','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (510,'pinterest-p','fa fa-pinterest-p','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (511,'whatsapp','fa fa-whatsapp','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (512,'server','fa fa-server','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (513,'user-plus','fa fa-user-plus','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (514,'user-times','fa fa-user-times','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (515,'bed','fa fa-bed','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (516,'viacoin','fa fa-viacoin','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (517,'train','fa fa-train','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (518,'subway','fa fa-subway','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (519,'medium','fa fa-medium','BWA','filter',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (520,'bed','fa fa-bed','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (521,'buysellads','fa fa-buysellads','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (522,'cart-arrow-down','fa fa-cart-arrow-down','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (523,'cart-plus','fa fa-cart-plus','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (524,'connectdevelop','fa fa-connectdevelop','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (525,'dashcube','fa fa-dashcube','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (526,'diamond','fa fa-diamond','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (527,'facebook-official','fa fa-facebook-official','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (528,'forumbee','fa fa-forumbee','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (529,'heartbeat','fa fa-heartbeat','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (530,'hotel<spanclass=\"text-muted\">(alias)</span>','fa fa-hotel','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (531,'leanpub','fa fa-leanpub','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (532,'mars','fa fa-mars','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (533,'mars-double','fa fa-mars-double','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (534,'mars-stroke','fa fa-mars-stroke','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (535,'mars-stroke-h','fa fa-mars-stroke-h','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (536,'mars-stroke-v','fa fa-mars-stroke-v','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (537,'medium','fa fa-medium','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (538,'mercury','fa fa-mercury','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (539,'motorcycle','fa fa-motorcycle','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (540,'neuter','fa fa-neuter','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (541,'pinterest-p','fa fa-pinterest-p','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (542,'sellsy','fa fa-sellsy','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (543,'server','fa fa-server','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (544,'ship','fa fa-ship','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (545,'shirtsinbulk','fa fa-shirtsinbulk','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (546,'simplybuilt','fa fa-simplybuilt','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (547,'skyatlas','fa fa-skyatlas','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (548,'street-view','fa fa-street-view','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (549,'subway','fa fa-subway','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (550,'train','fa fa-train','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (551,'transgender','fa fa-transgender','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (552,'transgender-alt','fa fa-transgender-alt','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (553,'user-plus','fa fa-user-plus','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (554,'user-secret','fa fa-user-secret','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (555,'user-times','fa fa-user-times','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (556,'venus','fa fa-venus','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (557,'venus-double','fa fa-venus-double','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (558,'venus-mars','fa fa-venus-mars','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (559,'viacoin','fa fa-viacoin','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (560,'whatsapp','fa fa-whatsapp','BWA','new',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (561,'adjust','fa fa-adjust','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (562,'anchor','fa fa-anchor','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (563,'archive','fa fa-archive','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (564,'area-chart','fa fa-area-chart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (565,'arrows','fa fa-arrows','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (566,'arrows-h','fa fa-arrows-h','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (567,'arrows-v','fa fa-arrows-v','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (568,'asterisk','fa fa-asterisk','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (569,'at','fa fa-at','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (570,'automobile<spanclass=\"text-muted\">(alias)</span>','fa fa-automobile','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (571,'ban','fa fa-ban','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (572,'bank<spanclass=\"text-muted\">(alias)</span>','fa fa-bank','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (573,'bar-chart','fa fa-bar-chart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (574,'bar-chart-o<spanclass=\"text-muted\">(alias)</span>','fa fa-bar-chart-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (575,'barcode','fa fa-barcode','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (576,'bars','fa fa-bars','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (577,'bed','fa fa-bed','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (578,'beer','fa fa-beer','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (579,'bell','fa fa-bell','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (580,'bell-o','fa fa-bell-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (581,'bell-slash','fa fa-bell-slash','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (582,'bell-slash-o','fa fa-bell-slash-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (583,'bicycle','fa fa-bicycle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (584,'binoculars','fa fa-binoculars','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (585,'birthday-cake','fa fa-birthday-cake','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (586,'bolt','fa fa-bolt','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (587,'bomb','fa fa-bomb','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (588,'book','fa fa-book','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (589,'bookmark','fa fa-bookmark','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (590,'bookmark-o','fa fa-bookmark-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (591,'briefcase','fa fa-briefcase','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (592,'bug','fa fa-bug','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (593,'building','fa fa-building','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (594,'building-o','fa fa-building-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (595,'bullhorn','fa fa-bullhorn','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (596,'bullseye','fa fa-bullseye','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (597,'bus','fa fa-bus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (598,'cab<spanclass=\"text-muted\">(alias)</span>','fa fa-cab','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (599,'calculator','fa fa-calculator','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (600,'calendar','fa fa-calendar','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (601,'calendar-o','fa fa-calendar-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (602,'camera','fa fa-camera','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (603,'camera-retro','fa fa-camera-retro','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (604,'car','fa fa-car','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (605,'caret-square-o-down','fa fa-caret-square-o-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (606,'caret-square-o-left','fa fa-caret-square-o-left','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (607,'caret-square-o-right','fa fa-caret-square-o-right','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (608,'caret-square-o-up','fa fa-caret-square-o-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (609,'cart-arrow-down','fa fa-cart-arrow-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (610,'cart-plus','fa fa-cart-plus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (611,'cc','fa fa-cc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (612,'certificate','fa fa-certificate','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (613,'check','fa fa-check','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (614,'check-circle','fa fa-check-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (615,'check-circle-o','fa fa-check-circle-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (616,'check-square','fa fa-check-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (617,'check-square-o','fa fa-check-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (618,'child','fa fa-child','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (619,'circle','fa fa-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (620,'circle-o','fa fa-circle-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (621,'circle-o-notch','fa fa-circle-o-notch','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (622,'circle-thin','fa fa-circle-thin','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (623,'clock-o','fa fa-clock-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (624,'close<spanclass=\"text-muted\">(alias)</span>','fa fa-close','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (625,'cloud','fa fa-cloud','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (626,'cloud-download','fa fa-cloud-download','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (627,'cloud-upload','fa fa-cloud-upload','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (628,'code','fa fa-code','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (629,'code-fork','fa fa-code-fork','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (630,'coffee','fa fa-coffee','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (631,'cog','fa fa-cog','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (632,'cogs','fa fa-cogs','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (633,'comment','fa fa-comment','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (634,'comment-o','fa fa-comment-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (635,'comments','fa fa-comments','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (636,'comments-o','fa fa-comments-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (637,'compass','fa fa-compass','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (638,'copyright','fa fa-copyright','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (639,'credit-card','fa fa-credit-card','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (640,'crop','fa fa-crop','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (641,'crosshairs','fa fa-crosshairs','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (642,'cube','fa fa-cube','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (643,'cubes','fa fa-cubes','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (644,'cutlery','fa fa-cutlery','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (645,'dashboard<spanclass=\"text-muted\">(alias)</span>','fa fa-dashboard','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (646,'database','fa fa-database','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (647,'desktop','fa fa-desktop','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (648,'diamond','fa fa-diamond','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (649,'dot-circle-o','fa fa-dot-circle-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (650,'download','fa fa-download','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (651,'edit<spanclass=\"text-muted\">(alias)</span>','fa fa-edit','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (652,'ellipsis-h','fa fa-ellipsis-h','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (653,'ellipsis-v','fa fa-ellipsis-v','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (654,'envelope','fa fa-envelope','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (655,'envelope-o','fa fa-envelope-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (656,'envelope-square','fa fa-envelope-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (657,'eraser','fa fa-eraser','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (658,'exchange','fa fa-exchange','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (659,'exclamation','fa fa-exclamation','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (660,'exclamation-circle','fa fa-exclamation-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (661,'exclamation-triangle','fa fa-exclamation-triangle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (662,'external-link','fa fa-external-link','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (663,'external-link-square','fa fa-external-link-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (664,'eye','fa fa-eye','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (665,'eye-slash','fa fa-eye-slash','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (666,'eyedropper','fa fa-eyedropper','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (667,'fax','fa fa-fax','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (668,'female','fa fa-female','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (669,'fighter-jet','fa fa-fighter-jet','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (670,'file-archive-o','fa fa-file-archive-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (671,'file-audio-o','fa fa-file-audio-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (672,'file-code-o','fa fa-file-code-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (673,'file-excel-o','fa fa-file-excel-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (674,'file-image-o','fa fa-file-image-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (675,'file-movie-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-movie-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (676,'file-pdf-o','fa fa-file-pdf-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (677,'file-photo-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-photo-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (678,'file-picture-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-picture-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (679,'file-powerpoint-o','fa fa-file-powerpoint-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (680,'file-sound-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-sound-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (681,'file-video-o','fa fa-file-video-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (682,'file-word-o','fa fa-file-word-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (683,'file-zip-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-zip-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (684,'film','fa fa-film','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (685,'filter','fa fa-filter','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (686,'fire','fa fa-fire','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (687,'fire-extinguisher','fa fa-fire-extinguisher','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (688,'flag','fa fa-flag','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (689,'flag-checkered','fa fa-flag-checkered','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (690,'flag-o','fa fa-flag-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (691,'flash<spanclass=\"text-muted\">(alias)</span>','fa fa-flash','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (692,'flask','fa fa-flask','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (693,'folder','fa fa-folder','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (694,'folder-o','fa fa-folder-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (695,'folder-open','fa fa-folder-open','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (696,'folder-open-o','fa fa-folder-open-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (697,'frown-o','fa fa-frown-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (698,'futbol-o','fa fa-futbol-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (699,'gamepad','fa fa-gamepad','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (700,'gavel','fa fa-gavel','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (701,'gear<spanclass=\"text-muted\">(alias)</span>','fa fa-gear','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (702,'gears<spanclass=\"text-muted\">(alias)</span>','fa fa-gears','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (703,'genderless<spanclass=\"text-muted\">(alias)</span>','fa fa-genderless','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (704,'gift','fa fa-gift','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (705,'glass','fa fa-glass','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (706,'globe','fa fa-globe','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (707,'graduation-cap','fa fa-graduation-cap','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (708,'group<spanclass=\"text-muted\">(alias)</span>','fa fa-group','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (709,'hdd-o','fa fa-hdd-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (710,'headphones','fa fa-headphones','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (711,'heart','fa fa-heart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (712,'heart-o','fa fa-heart-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (713,'heartbeat','fa fa-heartbeat','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (714,'history','fa fa-history','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (715,'home','fa fa-home','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (716,'hotel<spanclass=\"text-muted\">(alias)</span>','fa fa-hotel','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (717,'image<spanclass=\"text-muted\">(alias)</span>','fa fa-image','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (718,'inbox','fa fa-inbox','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (719,'info','fa fa-info','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (720,'info-circle','fa fa-info-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (721,'institution<spanclass=\"text-muted\">(alias)</span>','fa fa-institution','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (722,'key','fa fa-key','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (723,'keyboard-o','fa fa-keyboard-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (724,'language','fa fa-language','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (725,'laptop','fa fa-laptop','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (726,'leaf','fa fa-leaf','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (727,'legal<spanclass=\"text-muted\">(alias)</span>','fa fa-legal','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (728,'lemon-o','fa fa-lemon-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (729,'level-down','fa fa-level-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (730,'level-up','fa fa-level-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (731,'life-bouy<spanclass=\"text-muted\">(alias)</span>','fa fa-life-bouy','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (732,'life-buoy<spanclass=\"text-muted\">(alias)</span>','fa fa-life-buoy','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (733,'life-ring','fa fa-life-ring','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (734,'life-saver<spanclass=\"text-muted\">(alias)</span>','fa fa-life-saver','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (735,'lightbulb-o','fa fa-lightbulb-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (736,'line-chart','fa fa-line-chart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (737,'location-arrow','fa fa-location-arrow','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (738,'lock','fa fa-lock','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (739,'magic','fa fa-magic','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (740,'magnet','fa fa-magnet','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (741,'mail-forward<spanclass=\"text-muted\">(alias)</span>','fa fa-mail-forward','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (742,'mail-reply<spanclass=\"text-muted\">(alias)</span>','fa fa-mail-reply','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (743,'mail-reply-all<spanclass=\"text-muted\">(alias)</span>','fa fa-mail-reply-all','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (744,'male','fa fa-male','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (745,'map-marker','fa fa-map-marker','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (746,'meh-o','fa fa-meh-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (747,'microphone','fa fa-microphone','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (748,'microphone-slash','fa fa-microphone-slash','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (749,'minus','fa fa-minus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (750,'minus-circle','fa fa-minus-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (751,'minus-square','fa fa-minus-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (752,'minus-square-o','fa fa-minus-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (753,'mobile','fa fa-mobile','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (754,'mobile-phone<spanclass=\"text-muted\">(alias)</span>','fa fa-mobile-phone','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (755,'money','fa fa-money','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (756,'moon-o','fa fa-moon-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (757,'mortar-board<spanclass=\"text-muted\">(alias)</span>','fa fa-mortar-board','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (758,'motorcycle','fa fa-motorcycle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (759,'music','fa fa-music','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (760,'navicon<spanclass=\"text-muted\">(alias)</span>','fa fa-navicon','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (761,'newspaper-o','fa fa-newspaper-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (762,'paint-brush','fa fa-paint-brush','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (763,'paper-plane','fa fa-paper-plane','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (764,'paper-plane-o','fa fa-paper-plane-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (765,'paw','fa fa-paw','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (766,'pencil','fa fa-pencil','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (767,'pencil-square','fa fa-pencil-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (768,'pencil-square-o','fa fa-pencil-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (769,'phone','fa fa-phone','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (770,'phone-square','fa fa-phone-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (771,'photo<spanclass=\"text-muted\">(alias)</span>','fa fa-photo','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (772,'picture-o','fa fa-picture-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (773,'pie-chart','fa fa-pie-chart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (774,'plane','fa fa-plane','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (775,'plug','fa fa-plug','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (776,'plus','fa fa-plus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (777,'plus-circle','fa fa-plus-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (778,'plus-square','fa fa-plus-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (779,'plus-square-o','fa fa-plus-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (780,'power-off','fa fa-power-off','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (781,'print','fa fa-print','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (782,'puzzle-piece','fa fa-puzzle-piece','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (783,'qrcode','fa fa-qrcode','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (784,'question','fa fa-question','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (785,'question-circle','fa fa-question-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (786,'quote-left','fa fa-quote-left','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (787,'quote-right','fa fa-quote-right','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (788,'random','fa fa-random','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (789,'recycle','fa fa-recycle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (790,'refresh','fa fa-refresh','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (791,'remove<spanclass=\"text-muted\">(alias)</span>','fa fa-remove','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (792,'reorder<spanclass=\"text-muted\">(alias)</span>','fa fa-reorder','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (793,'reply','fa fa-reply','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (794,'reply-all','fa fa-reply-all','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (795,'retweet','fa fa-retweet','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (796,'road','fa fa-road','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (797,'rocket','fa fa-rocket','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (798,'rss','fa fa-rss','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (799,'rss-square','fa fa-rss-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (800,'search','fa fa-search','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (801,'search-minus','fa fa-search-minus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (802,'search-plus','fa fa-search-plus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (803,'send<spanclass=\"text-muted\">(alias)</span>','fa fa-send','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (804,'send-o<spanclass=\"text-muted\">(alias)</span>','fa fa-send-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (805,'server','fa fa-server','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (806,'share','fa fa-share','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (807,'share-alt','fa fa-share-alt','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (808,'share-alt-square','fa fa-share-alt-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (809,'share-square','fa fa-share-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (810,'share-square-o','fa fa-share-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (811,'shield','fa fa-shield','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (812,'ship','fa fa-ship','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (813,'shopping-cart','fa fa-shopping-cart','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (814,'sign-in','fa fa-sign-in','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (815,'sign-out','fa fa-sign-out','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (816,'signal','fa fa-signal','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (817,'sitemap','fa fa-sitemap','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (818,'sliders','fa fa-sliders','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (819,'smile-o','fa fa-smile-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (820,'soccer-ball-o<spanclass=\"text-muted\">(alias)</span>','fa fa-soccer-ball-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (821,'sort','fa fa-sort','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (822,'sort-alpha-asc','fa fa-sort-alpha-asc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (823,'sort-alpha-desc','fa fa-sort-alpha-desc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (824,'sort-amount-asc','fa fa-sort-amount-asc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (825,'sort-amount-desc','fa fa-sort-amount-desc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (826,'sort-asc','fa fa-sort-asc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (827,'sort-desc','fa fa-sort-desc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (828,'sort-down<spanclass=\"text-muted\">(alias)</span>','fa fa-sort-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (829,'sort-numeric-asc','fa fa-sort-numeric-asc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (830,'sort-numeric-desc','fa fa-sort-numeric-desc','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (831,'sort-up<spanclass=\"text-muted\">(alias)</span>','fa fa-sort-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (832,'space-shuttle','fa fa-space-shuttle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (833,'spinner','fa fa-spinner','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (834,'spoon','fa fa-spoon','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (835,'square','fa fa-square','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (836,'square-o','fa fa-square-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (837,'star','fa fa-star','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (838,'star-half','fa fa-star-half','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (839,'star-half-empty<spanclass=\"text-muted\">(alias)</span>','fa fa-star-half-empty','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (840,'star-half-full<spanclass=\"text-muted\">(alias)</span>','fa fa-star-half-full','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (841,'star-half-o','fa fa-star-half-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (842,'star-o','fa fa-star-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (843,'street-view','fa fa-street-view','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (844,'suitcase','fa fa-suitcase','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (845,'sun-o','fa fa-sun-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (846,'support<spanclass=\"text-muted\">(alias)</span>','fa fa-support','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (847,'tablet','fa fa-tablet','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (848,'tachometer','fa fa-tachometer','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (849,'tag','fa fa-tag','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (850,'tags','fa fa-tags','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (851,'tasks','fa fa-tasks','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (852,'taxi','fa fa-taxi','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (853,'terminal','fa fa-terminal','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (854,'thumb-tack','fa fa-thumb-tack','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (855,'thumbs-down','fa fa-thumbs-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (856,'thumbs-o-down','fa fa-thumbs-o-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (857,'thumbs-o-up','fa fa-thumbs-o-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (858,'thumbs-up','fa fa-thumbs-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (859,'ticket','fa fa-ticket','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (860,'times','fa fa-times','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (861,'times-circle','fa fa-times-circle','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (862,'times-circle-o','fa fa-times-circle-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (863,'tint','fa fa-tint','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (864,'toggle-down<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (865,'toggle-left<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-left','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (866,'toggle-off','fa fa-toggle-off','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (867,'toggle-on','fa fa-toggle-on','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (868,'toggle-right<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-right','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (869,'toggle-up<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (870,'trash','fa fa-trash','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (871,'trash-o','fa fa-trash-o','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (872,'tree','fa fa-tree','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (873,'trophy','fa fa-trophy','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (874,'truck','fa fa-truck','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (875,'tty','fa fa-tty','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (876,'umbrella','fa fa-umbrella','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (877,'university','fa fa-university','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (878,'unlock','fa fa-unlock','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (879,'unlock-alt','fa fa-unlock-alt','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (880,'unsorted<spanclass=\"text-muted\">(alias)</span>','fa fa-unsorted','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (881,'upload','fa fa-upload','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (882,'user','fa fa-user','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (883,'user-plus','fa fa-user-plus','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (884,'user-secret','fa fa-user-secret','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (885,'user-times','fa fa-user-times','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (886,'users','fa fa-users','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (887,'video-camera','fa fa-video-camera','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (888,'volume-down','fa fa-volume-down','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (889,'volume-off','fa fa-volume-off','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (890,'volume-up','fa fa-volume-up','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (891,'warning<spanclass=\"text-muted\">(alias)</span>','fa fa-warning','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (892,'wheelchair','fa fa-wheelchair','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (893,'wifi','fa fa-wifi','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (894,'wrench','fa fa-wrench','BWA','web-application',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (895,'ambulance','fa fa-ambulance','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (896,'automobile<spanclass=\"text-muted\">(alias)</span>','fa fa-automobile','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (897,'bicycle','fa fa-bicycle','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (898,'bus','fa fa-bus','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (899,'cab<spanclass=\"text-muted\">(alias)</span>','fa fa-cab','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (900,'car','fa fa-car','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (901,'fighter-jet','fa fa-fighter-jet','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (902,'motorcycle','fa fa-motorcycle','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (903,'plane','fa fa-plane','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (904,'rocket','fa fa-rocket','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (905,'ship','fa fa-ship','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (906,'space-shuttle','fa fa-space-shuttle','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (907,'subway','fa fa-subway','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (908,'taxi','fa fa-taxi','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (909,'train','fa fa-train','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (910,'truck','fa fa-truck','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (911,'wheelchair','fa fa-wheelchair','BWA','transportation',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (912,'circle-thin','fa fa-circle-thin','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (913,'genderless<spanclass=\"text-muted\">(alias)</span>','fa fa-genderless','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (914,'mars','fa fa-mars','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (915,'mars-double','fa fa-mars-double','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (916,'mars-stroke','fa fa-mars-stroke','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (917,'mars-stroke-h','fa fa-mars-stroke-h','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (918,'mars-stroke-v','fa fa-mars-stroke-v','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (919,'mercury','fa fa-mercury','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (920,'neuter','fa fa-neuter','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (921,'transgender','fa fa-transgender','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (922,'transgender-alt','fa fa-transgender-alt','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (923,'venus','fa fa-venus','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (924,'venus-double','fa fa-venus-double','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (925,'venus-mars','fa fa-venus-mars','BWA','gender',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (926,'file','fa fa-file','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (927,'file-archive-o','fa fa-file-archive-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (928,'file-audio-o','fa fa-file-audio-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (929,'file-code-o','fa fa-file-code-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (930,'file-excel-o','fa fa-file-excel-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (931,'file-image-o','fa fa-file-image-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (932,'file-movie-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-movie-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (933,'file-o','fa fa-file-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (934,'file-pdf-o','fa fa-file-pdf-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (935,'file-photo-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-photo-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (936,'file-picture-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-picture-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (937,'file-powerpoint-o','fa fa-file-powerpoint-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (938,'file-sound-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-sound-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (939,'file-text','fa fa-file-text','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (940,'file-text-o','fa fa-file-text-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (941,'file-video-o','fa fa-file-video-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (942,'file-word-o','fa fa-file-word-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (943,'file-zip-o<spanclass=\"text-muted\">(alias)</span>','fa fa-file-zip-o','BWA','file-type',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (944,'circle-o-notch','fa fa-circle-o-notch','BWA','spinner',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (945,'cog','fa fa-cog','BWA','spinner',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (946,'gear<spanclass=\"text-muted\">(alias)</span>','fa fa-gear','BWA','spinner',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (947,'refresh','fa fa-refresh','BWA','spinner',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (948,'spinner','fa fa-spinner','BWA','spinner',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (949,'check-square','fa fa-check-square','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (950,'check-square-o','fa fa-check-square-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (951,'circle','fa fa-circle','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (952,'circle-o','fa fa-circle-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (953,'dot-circle-o','fa fa-dot-circle-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (954,'minus-square','fa fa-minus-square','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (955,'minus-square-o','fa fa-minus-square-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (956,'plus-square','fa fa-plus-square','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (957,'plus-square-o','fa fa-plus-square-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (958,'square','fa fa-square','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (959,'square-o','fa fa-square-o','BWA','form-control',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (960,'cc-amex','fa fa-cc-amex','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (961,'cc-discover','fa fa-cc-discover','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (962,'cc-mastercard','fa fa-cc-mastercard','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (963,'cc-paypal','fa fa-cc-paypal','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (964,'cc-stripe','fa fa-cc-stripe','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (965,'cc-visa','fa fa-cc-visa','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (966,'credit-card','fa fa-credit-card','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (967,'google-wallet','fa fa-google-wallet','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (968,'paypal','fa fa-paypal','BWA','payment',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (969,'area-chart','fa fa-area-chart','BWA','chart',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (970,'bar-chart','fa fa-bar-chart','BWA','chart',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (971,'bar-chart-o<spanclass=\"text-muted\">(alias)</span>','fa fa-bar-chart-o','BWA','chart',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (972,'line-chart','fa fa-line-chart','BWA','chart',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (973,'pie-chart','fa fa-pie-chart','BWA','chart',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (974,'bitcoin<spanclass=\"text-muted\">(alias)</span>','fa fa-bitcoin','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (975,'btc','fa fa-btc','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (976,'cny<spanclass=\"text-muted\">(alias)</span>','fa fa-cny','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (977,'dollar<spanclass=\"text-muted\">(alias)</span>','fa fa-dollar','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (978,'eur','fa fa-eur','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (979,'euro<spanclass=\"text-muted\">(alias)</span>','fa fa-euro','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (980,'gbp','fa fa-gbp','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (981,'ils','fa fa-ils','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (982,'inr','fa fa-inr','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (983,'jpy','fa fa-jpy','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (984,'krw','fa fa-krw','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (985,'money','fa fa-money','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (986,'rmb<spanclass=\"text-muted\">(alias)</span>','fa fa-rmb','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (987,'rouble<spanclass=\"text-muted\">(alias)</span>','fa fa-rouble','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (988,'rub','fa fa-rub','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (989,'ruble<spanclass=\"text-muted\">(alias)</span>','fa fa-ruble','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (990,'rupee<spanclass=\"text-muted\">(alias)</span>','fa fa-rupee','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (991,'shekel<spanclass=\"text-muted\">(alias)</span>','fa fa-shekel','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (992,'sheqel<spanclass=\"text-muted\">(alias)</span>','fa fa-sheqel','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (993,'try','fa fa-try','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (994,'turkish-lira<spanclass=\"text-muted\">(alias)</span>','fa fa-turkish-lira','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (995,'usd','fa fa-usd','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (996,'won<spanclass=\"text-muted\">(alias)</span>','fa fa-won','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (997,'yen<spanclass=\"text-muted\">(alias)</span>','fa fa-yen','BWA','currency',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (998,'align-center','fa fa-align-center','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (999,'align-justify','fa fa-align-justify','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1000,'align-left','fa fa-align-left','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1001,'align-right','fa fa-align-right','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1002,'bold','fa fa-bold','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1003,'chain<spanclass=\"text-muted\">(alias)</span>','fa fa-chain','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1004,'chain-broken','fa fa-chain-broken','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1005,'clipboard','fa fa-clipboard','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1006,'columns','fa fa-columns','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1007,'copy<spanclass=\"text-muted\">(alias)</span>','fa fa-copy','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1008,'cut<spanclass=\"text-muted\">(alias)</span>','fa fa-cut','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1009,'dedent<spanclass=\"text-muted\">(alias)</span>','fa fa-dedent','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1010,'eraser','fa fa-eraser','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1011,'file','fa fa-file','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1012,'file-o','fa fa-file-o','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1013,'file-text','fa fa-file-text','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1014,'file-text-o','fa fa-file-text-o','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1015,'files-o','fa fa-files-o','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1016,'floppy-o','fa fa-floppy-o','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1017,'font','fa fa-font','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1018,'header','fa fa-header','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1019,'indent','fa fa-indent','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1020,'italic','fa fa-italic','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1021,'link','fa fa-link','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1022,'list','fa fa-list','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1023,'list-alt','fa fa-list-alt','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1024,'list-ol','fa fa-list-ol','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1025,'list-ul','fa fa-list-ul','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1026,'outdent','fa fa-outdent','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1027,'paperclip','fa fa-paperclip','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1028,'paragraph','fa fa-paragraph','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1029,'paste<spanclass=\"text-muted\">(alias)</span>','fa fa-paste','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1030,'repeat','fa fa-repeat','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1031,'rotate-left<spanclass=\"text-muted\">(alias)</span>','fa fa-rotate-left','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1032,'rotate-right<spanclass=\"text-muted\">(alias)</span>','fa fa-rotate-right','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1033,'save<spanclass=\"text-muted\">(alias)</span>','fa fa-save','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1034,'scissors','fa fa-scissors','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1035,'strikethrough','fa fa-strikethrough','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1036,'subscript','fa fa-subscript','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1037,'superscript','fa fa-superscript','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1038,'table','fa fa-table','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1039,'text-height','fa fa-text-height','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1040,'text-width','fa fa-text-width','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1041,'th','fa fa-th','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1042,'th-large','fa fa-th-large','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1043,'th-list','fa fa-th-list','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1044,'underline','fa fa-underline','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1045,'undo','fa fa-undo','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1046,'unlink<spanclass=\"text-muted\">(alias)</span>','fa fa-unlink','BWA','text-editor',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1047,'angle-double-down','fa fa-angle-double-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1048,'angle-double-left','fa fa-angle-double-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1049,'angle-double-right','fa fa-angle-double-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1050,'angle-double-up','fa fa-angle-double-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1051,'angle-down','fa fa-angle-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1052,'angle-left','fa fa-angle-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1053,'angle-right','fa fa-angle-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1054,'angle-up','fa fa-angle-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1055,'arrow-circle-down','fa fa-arrow-circle-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1056,'arrow-circle-left','fa fa-arrow-circle-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1057,'arrow-circle-o-down','fa fa-arrow-circle-o-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1058,'arrow-circle-o-left','fa fa-arrow-circle-o-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1059,'arrow-circle-o-right','fa fa-arrow-circle-o-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1060,'arrow-circle-o-up','fa fa-arrow-circle-o-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1061,'arrow-circle-right','fa fa-arrow-circle-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1062,'arrow-circle-up','fa fa-arrow-circle-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1063,'arrow-down','fa fa-arrow-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1064,'arrow-left','fa fa-arrow-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1065,'arrow-right','fa fa-arrow-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1066,'arrow-up','fa fa-arrow-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1067,'arrows','fa fa-arrows','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1068,'arrows-alt','fa fa-arrows-alt','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1069,'arrows-h','fa fa-arrows-h','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1070,'arrows-v','fa fa-arrows-v','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1071,'caret-down','fa fa-caret-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1072,'caret-left','fa fa-caret-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1073,'caret-right','fa fa-caret-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1074,'caret-square-o-down','fa fa-caret-square-o-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1075,'caret-square-o-left','fa fa-caret-square-o-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1076,'caret-square-o-right','fa fa-caret-square-o-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1077,'caret-square-o-up','fa fa-caret-square-o-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1078,'caret-up','fa fa-caret-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1079,'chevron-circle-down','fa fa-chevron-circle-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1080,'chevron-circle-left','fa fa-chevron-circle-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1081,'chevron-circle-right','fa fa-chevron-circle-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1082,'chevron-circle-up','fa fa-chevron-circle-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1083,'chevron-down','fa fa-chevron-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1084,'chevron-left','fa fa-chevron-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1085,'chevron-right','fa fa-chevron-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1086,'chevron-up','fa fa-chevron-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1087,'hand-o-down','fa fa-hand-o-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1088,'hand-o-left','fa fa-hand-o-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1089,'hand-o-right','fa fa-hand-o-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1090,'hand-o-up','fa fa-hand-o-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1091,'long-arrow-down','fa fa-long-arrow-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1092,'long-arrow-left','fa fa-long-arrow-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1093,'long-arrow-right','fa fa-long-arrow-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1094,'long-arrow-up','fa fa-long-arrow-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1095,'toggle-down<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-down','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1096,'toggle-left<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-left','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1097,'toggle-right<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-right','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1098,'toggle-up<spanclass=\"text-muted\">(alias)</span>','fa fa-toggle-up','BWA','directional',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1099,'arrows-alt','fa fa-arrows-alt','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1100,'backward','fa fa-backward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1101,'compress','fa fa-compress','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1102,'eject','fa fa-eject','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1103,'expand','fa fa-expand','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1104,'fast-backward','fa fa-fast-backward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1105,'fast-forward','fa fa-fast-forward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1106,'forward','fa fa-forward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1107,'pause','fa fa-pause','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1108,'play','fa fa-play','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1109,'play-circle','fa fa-play-circle','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1110,'play-circle-o','fa fa-play-circle-o','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1111,'step-backward','fa fa-step-backward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1112,'step-forward','fa fa-step-forward','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1113,'stop','fa fa-stop','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1114,'youtube-play','fa fa-youtube-play','BWA','video-player',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1115,'adn','fa fa-adn','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1116,'android','fa fa-android','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1117,'angellist','fa fa-angellist','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1118,'apple','fa fa-apple','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1119,'behance','fa fa-behance','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1120,'behance-square','fa fa-behance-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1121,'bitbucket','fa fa-bitbucket','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1122,'bitbucket-square','fa fa-bitbucket-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1123,'bitcoin<spanclass=\"text-muted\">(alias)</span>','fa fa-bitcoin','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1124,'btc','fa fa-btc','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1125,'buysellads','fa fa-buysellads','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1126,'cc-amex','fa fa-cc-amex','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1127,'cc-discover','fa fa-cc-discover','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1128,'cc-mastercard','fa fa-cc-mastercard','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1129,'cc-paypal','fa fa-cc-paypal','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1130,'cc-stripe','fa fa-cc-stripe','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1131,'cc-visa','fa fa-cc-visa','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1132,'codepen','fa fa-codepen','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1133,'connectdevelop','fa fa-connectdevelop','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1134,'css3','fa fa-css3','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1135,'dashcube','fa fa-dashcube','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1136,'delicious','fa fa-delicious','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1137,'deviantart','fa fa-deviantart','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1138,'digg','fa fa-digg','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1139,'dribbble','fa fa-dribbble','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1140,'dropbox','fa fa-dropbox','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1141,'drupal','fa fa-drupal','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1142,'empire','fa fa-empire','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1143,'facebook','fa fa-facebook','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1144,'facebook-f<spanclass=\"text-muted\">(alias)</span>','fa fa-facebook-f','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1145,'facebook-official','fa fa-facebook-official','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1146,'facebook-square','fa fa-facebook-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1147,'flickr','fa fa-flickr','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1148,'forumbee','fa fa-forumbee','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1149,'foursquare','fa fa-foursquare','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1150,'ge<spanclass=\"text-muted\">(alias)</span>','fa fa-ge','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1151,'git','fa fa-git','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1152,'git-square','fa fa-git-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1153,'github','fa fa-github','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1154,'github-alt','fa fa-github-alt','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1155,'github-square','fa fa-github-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1156,'gittip<spanclass=\"text-muted\">(alias)</span>','fa fa-gittip','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1157,'google','fa fa-google','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1158,'google-plus','fa fa-google-plus','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1159,'google-plus-square','fa fa-google-plus-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1160,'google-wallet','fa fa-google-wallet','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1161,'gratipay','fa fa-gratipay','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1162,'hacker-news','fa fa-hacker-news','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1163,'html5','fa fa-html5','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1164,'instagram','fa fa-instagram','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1165,'ioxhost','fa fa-ioxhost','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1166,'joomla','fa fa-joomla','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1167,'jsfiddle','fa fa-jsfiddle','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1168,'lastfm','fa fa-lastfm','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1169,'lastfm-square','fa fa-lastfm-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1170,'leanpub','fa fa-leanpub','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1171,'linkedin','fa fa-linkedin','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1172,'linkedin-square','fa fa-linkedin-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1173,'linux','fa fa-linux','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1174,'maxcdn','fa fa-maxcdn','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1175,'meanpath','fa fa-meanpath','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1176,'medium','fa fa-medium','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1177,'openid','fa fa-openid','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1178,'pagelines','fa fa-pagelines','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1179,'paypal','fa fa-paypal','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1180,'pied-piper','fa fa-pied-piper','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1181,'pied-piper-alt','fa fa-pied-piper-alt','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1182,'pinterest','fa fa-pinterest','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1183,'pinterest-p','fa fa-pinterest-p','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1184,'pinterest-square','fa fa-pinterest-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1185,'qq','fa fa-qq','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1186,'ra<spanclass=\"text-muted\">(alias)</span>','fa fa-ra','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1187,'rebel','fa fa-rebel','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1188,'reddit','fa fa-reddit','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1189,'reddit-square','fa fa-reddit-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1190,'renren','fa fa-renren','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1191,'sellsy','fa fa-sellsy','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1192,'share-alt','fa fa-share-alt','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1193,'share-alt-square','fa fa-share-alt-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1194,'shirtsinbulk','fa fa-shirtsinbulk','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1195,'simplybuilt','fa fa-simplybuilt','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1196,'skyatlas','fa fa-skyatlas','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1197,'skype','fa fa-skype','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1198,'slack','fa fa-slack','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1199,'slideshare','fa fa-slideshare','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1200,'soundcloud','fa fa-soundcloud','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1201,'spotify','fa fa-spotify','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1202,'stack-exchange','fa fa-stack-exchange','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1203,'stack-overflow','fa fa-stack-overflow','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1204,'steam','fa fa-steam','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1205,'steam-square','fa fa-steam-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1206,'stumbleupon','fa fa-stumbleupon','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1207,'stumbleupon-circle','fa fa-stumbleupon-circle','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1208,'tencent-weibo','fa fa-tencent-weibo','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1209,'trello','fa fa-trello','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1210,'tumblr','fa fa-tumblr','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1211,'tumblr-square','fa fa-tumblr-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1212,'twitch','fa fa-twitch','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1213,'twitter','fa fa-twitter','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1214,'twitter-square','fa fa-twitter-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1215,'viacoin','fa fa-viacoin','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1216,'vimeo-square','fa fa-vimeo-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1217,'vine','fa fa-vine','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1218,'vk','fa fa-vk','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1219,'wechat<spanclass=\"text-muted\">(alias)</span>','fa fa-wechat','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1220,'weibo','fa fa-weibo','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1221,'weixin','fa fa-weixin','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1222,'whatsapp','fa fa-whatsapp','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1223,'windows','fa fa-windows','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1224,'wordpress','fa fa-wordpress','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1225,'xing','fa fa-xing','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1226,'xing-square','fa fa-xing-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1227,'yahoo','fa fa-yahoo','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1228,'yelp','fa fa-yelp','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1229,'youtube','fa fa-youtube','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1230,'youtube-play','fa fa-youtube-play','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1231,'youtube-square','fa fa-youtube-square','BWA','brand',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1232,'ambulance','fa fa-ambulance','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1233,'h-square','fa fa-h-square','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1234,'heart','fa fa-heart','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1235,'heart-o','fa fa-heart-o','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1236,'heartbeat','fa fa-heartbeat','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1237,'hospital-o','fa fa-hospital-o','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1238,'medkit','fa fa-medkit','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1239,'plus-square','fa fa-plus-square','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1240,'stethoscope','fa fa-stethoscope','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1241,'user-md','fa fa-user-md','BWA','medical',NULL,1,1);
insert  into `cfg_icon_info`(`iconId`,`iconName`,`iconCode`,`iconType`,`iconFolder`,`iconSize`,`library`,`overt`) values (1242,'wheelchair','fa fa-wheelchair','BWA','medical',NULL,1,1);

/*Table structure for table `cfg_library_info` */

DROP TABLE IF EXISTS `cfg_library_info`;

CREATE TABLE `cfg_library_info` (
  `libraryId` bigint(20) NOT NULL AUTO_INCREMENT,
  `libraryName` varchar(50) DEFAULT NULL,
  `path` varchar(200) DEFAULT NULL,
  `identification` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`libraryId`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_library_info` */

insert  into `cfg_library_info`(`libraryId`,`libraryName`,`path`,`identification`) values (1,'默认','default','default');

/*Table structure for table `cfg_parameter_info` */

DROP TABLE IF EXISTS `cfg_parameter_info`;

CREATE TABLE `cfg_parameter_info` (
  `parameterId` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL,
  `value` varchar(200) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `canModify` tinyint(4) DEFAULT NULL,
  `note` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`parameterId`)
) ENGINE=MyISAM AUTO_INCREMENT=1243 DEFAULT CHARSET=utf8;

/*Data for the table `cfg_parameter_info` */

insert  into `cfg_parameter_info`(`parameterId`,`name`,`value`,`description`,`canModify`,`note`) values (2,'ifDistributedDeploy','0','是否分布式部署',1,'是否分布式部署');
insert  into `cfg_parameter_info`(`parameterId`,`name`,`value`,`description`,`canModify`,`note`) values (3,'ifRunInLocalNetwork','0','是否内网运行',0,'是否内网运行');

/*Table structure for table `st_system_notice_info` */

DROP TABLE IF EXISTS `st_system_notice_info`;

CREATE TABLE `st_system_notice_info` (
  `noticeId` bigint(20) NOT NULL AUTO_INCREMENT,
  `noticeName` varchar(50) DEFAULT NULL,
  `noticeType` char(3) DEFAULT NULL,
  `noticeLevel` char(3) DEFAULT NULL,
  `noticeText` varchar(500) DEFAULT NULL,
  `roleList` text,
  `userList` text,
  `createUserId` bigint(20) DEFAULT NULL,
  `status` char(3) DEFAULT NULL,
  `library` bigint(20) DEFAULT NULL,
  `overt` tinyint(4) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`noticeId`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `st_system_notice_info` */

insert  into `st_system_notice_info`(`noticeId`,`noticeName`,`noticeType`,`noticeLevel`,`noticeText`,`roleList`,`userList`,`createUserId`,`status`,`library`,`overt`,`createTime`) values (5,'系统上线公告','BTA','BUA','1.0上线！',NULL,NULL,32,'BVF',1,1,'2015-01-29 16:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
