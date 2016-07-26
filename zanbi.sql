/*
Navicat MySQL Data Transfer

Source Server         : localDB
Source Server Version : 50536
Source Host           : 127.0.0.1:3306
Source Database       : zanbi

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2016-07-26 08:08:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for send_record
-- ----------------------------
DROP TABLE IF EXISTS `send_record`;
CREATE TABLE `send_record` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(10) DEFAULT NULL,
  `receiver_id` varchar(10) DEFAULT NULL,
  `send_time` datetime DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL COMMENT '这是发送时备注的原文',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='发送主记录表';

-- ----------------------------
-- Records of send_record
-- ----------------------------

-- ----------------------------
-- Table structure for send_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `send_record_detail`;
CREATE TABLE `send_record_detail` (
  `id` int(11) NOT NULL,
  `sender_id` varchar(10) NOT NULL,
  `receiver_id` varchar(10) NOT NULL,
  `send_time` datetime DEFAULT NULL,
  `remark` varchar(1000) DEFAULT NULL COMMENT '针对每个人的备注，可能为空，因为没有解析出来',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send_record_detail
-- ----------------------------

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `sender_id` varchar(255) NOT NULL,
  `sender_name` varchar(255) DEFAULT NULL,
  `zb_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`sender_id`),
  UNIQUE KEY `sender_id_unique_key` (`sender_id`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker
-- ----------------------------

-- ----------------------------
-- Table structure for zb_role
-- ----------------------------
DROP TABLE IF EXISTS `zb_role`;
CREATE TABLE `zb_role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  `zb_count` int(11) DEFAULT NULL,
  `zb_compute_type` varchar(255) DEFAULT NULL COMMENT '暂币计算类型  1:固定 2:根据组织架构公式计算',
  `calculate` varchar(255) DEFAULT NULL COMMENT '计算公式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zb_role
-- ----------------------------
INSERT INTO `zb_role` VALUES ('1', '普通成员', '5', '1', null);
INSERT INTO `zb_role` VALUES ('2', '管理者', '20', '1', null);
INSERT INTO `zb_role` VALUES ('3', '高级管理者', '-1', '1', null);
