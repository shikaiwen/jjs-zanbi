/*
Navicat MySQL Data Transfer

Source Server         : 172.16.7.232开发库
Source Server Version : 50620
Source Host           : 172.16.7.232:33096
Source Database       : zdt

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2016-08-06 18:04:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for org
-- ----------------------------
DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `org_name` varchar(255) DEFAULT NULL COMMENT '组名 如：用户组',
  `org_manager` varchar(255) DEFAULT NULL COMMENT '组管理者  ',
  `type` varchar(255) DEFAULT '1' COMMENT '类型 1：开发 2:产品',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of org
-- ----------------------------
INSERT INTO `org` VALUES ('2', '用户组', 'tmanager', '1');
INSERT INTO `org` VALUES ('3', '交易组', 'tm2', '1');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(255) NOT NULL,
  `is_product_mgr` varchar(255) NOT NULL DEFAULT '0' COMMENT '是否为产品经理 0：否 1：是',
  `role_type` tinyint(255) NOT NULL COMMENT '1：开发 2：产品',
  `zb_rule_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `zb_rule_fk` (`zb_rule_id`),
  CONSTRAINT `zb_rule_fk` FOREIGN KEY (`zb_rule_id`) REFERENCES `zb_rule` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '开发人员', '0', '1', '1');
INSERT INTO `role` VALUES ('2', '产品经理', '1', '2', '2');

-- ----------------------------
-- Table structure for send_record
-- ----------------------------
DROP TABLE IF EXISTS `send_record`;
CREATE TABLE `send_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) DEFAULT NULL,
  `send_time` datetime NOT NULL,
  `remark` varchar(255) NOT NULL COMMENT '这是发送时备注的原文',
  `sender_ip` varchar(255) DEFAULT NULL COMMENT '发送的电脑主机',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='发送主记录表';

-- ----------------------------
-- Records of send_record
-- ----------------------------
INSERT INTO `send_record` VALUES ('1', '1', '2016-07-27 14:45:21', '非常好么么么么么么么么吗', '127.0.0.1');
INSERT INTO `send_record` VALUES ('2', '1', '2016-07-27 14:47:57', '2312341234', '127.0.0.1');
INSERT INTO `send_record` VALUES ('3', '1', '2016-07-27 14:48:48', '111111111', '127.0.0.1');
INSERT INTO `send_record` VALUES ('4', '1', '2016-07-27 14:48:58', '22222222222222222222222', '127.0.0.1');
INSERT INTO `send_record` VALUES ('5', '1', '2016-07-27 14:49:09', '33333333333333333333', '127.0.0.1');
INSERT INTO `send_record` VALUES ('6', '1', '2016-07-27 14:49:29', '44444444444444', '127.0.0.1');
INSERT INTO `send_record` VALUES ('7', '1', '2016-07-27 14:49:37', '555555555555555555555555555555555555555', '127.0.0.1');
INSERT INTO `send_record` VALUES ('8', '1', '2016-07-27 14:49:57', '666666666666666666666666666666', '127.0.0.1');
INSERT INTO `send_record` VALUES ('9', '2', '2016-07-27 17:25:39', '666666666666666666666666666666', '127.0.0.1');
INSERT INTO `send_record` VALUES ('10', '2', '2016-07-27 17:27:44', '77777777777777777777777777', '127.0.0.1');
INSERT INTO `send_record` VALUES ('11', '2', '2016-07-27 17:37:53', '77777777777777777777777777', '127.0.0.1');
INSERT INTO `send_record` VALUES ('12', '2', '2016-07-27 17:47:40', '77777777777777777777777777', '127.0.0.1');
INSERT INTO `send_record` VALUES ('13', '2', '2016-07-27 17:51:01', '88888888', '127.0.0.1');
INSERT INTO `send_record` VALUES ('14', '2', '2016-07-27 17:54:58', '88888888', '127.0.0.1');
INSERT INTO `send_record` VALUES ('15', '2', '2016-07-27 17:56:35', '88888888', '127.0.0.1');
INSERT INTO `send_record` VALUES ('16', '2', '2016-07-27 17:59:03', '88888888', '127.0.0.1');
INSERT INTO `send_record` VALUES ('17', '2', '2016-07-27 17:59:17', '88888888', '127.0.0.1');
INSERT INTO `send_record` VALUES ('18', '2', '2016-07-27 18:02:43', '88888888', '127.0.0.1');

-- ----------------------------
-- Table structure for send_record_detail
-- ----------------------------
DROP TABLE IF EXISTS `send_record_detail`;
CREATE TABLE `send_record_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sender_id` int(10) NOT NULL,
  `receiver_id` int(10) NOT NULL,
  `zb_count` int(11) NOT NULL DEFAULT '0' COMMENT '个数',
  `send_time` datetime NOT NULL,
  `remark` varchar(1000) NOT NULL DEFAULT '' COMMENT '针对每个人的备注，可能为空，因为没有解析出来',
  `send_main_id` int(11) DEFAULT NULL COMMENT '主发送记录id',
  PRIMARY KEY (`id`),
  KEY `send_record_id_pk` (`send_main_id`),
  KEY `receiver_id_worker_fk` (`receiver_id`),
  KEY `sender_id_worker_fk2` (`sender_id`),
  CONSTRAINT `receiver_id_worker_fk` FOREIGN KEY (`receiver_id`) REFERENCES `worker` (`id`),
  CONSTRAINT `send_record_id_pk` FOREIGN KEY (`send_main_id`) REFERENCES `send_record` (`id`),
  CONSTRAINT `sender_id_worker_fk2` FOREIGN KEY (`sender_id`) REFERENCES `worker` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of send_record_detail
-- ----------------------------
INSERT INTO `send_record_detail` VALUES ('1', '1', '1', '1', '2016-07-27 14:45:33', '非常好么么么么么么么么吗', '2');
INSERT INTO `send_record_detail` VALUES ('2', '1', '1', '1', '2016-07-27 14:45:38', '非常好么么么么么么么么吗', '2');
INSERT INTO `send_record_detail` VALUES ('3', '1', '1', '1', '2016-07-27 14:45:40', '非常好么么么么么么么么吗', '2');
INSERT INTO `send_record_detail` VALUES ('4', '1', '1', '1', '2016-07-27 14:47:57', '2312341234', '2');
INSERT INTO `send_record_detail` VALUES ('5', '1', '1', '1', '2016-07-27 14:47:57', '2312341234', '2');
INSERT INTO `send_record_detail` VALUES ('6', '1', '1', '1', '2016-07-27 14:47:57', '2312341234', '2');
INSERT INTO `send_record_detail` VALUES ('7', '1', '1', '1', '2016-07-27 14:48:48', '111111111', '2');
INSERT INTO `send_record_detail` VALUES ('8', '1', '1', '1', '2016-07-27 14:48:48', '111111111', '2');
INSERT INTO `send_record_detail` VALUES ('9', '1', '1', '1', '2016-07-27 14:48:48', '111111111', '2');
INSERT INTO `send_record_detail` VALUES ('10', '1', '1', '1', '2016-07-27 14:48:58', '22222222222222222222222', '2');
INSERT INTO `send_record_detail` VALUES ('11', '1', '1', '1', '2016-07-27 14:48:58', '22222222222222222222222', '2');
INSERT INTO `send_record_detail` VALUES ('12', '1', '1', '1', '2016-07-27 14:48:58', '22222222222222222222222', '2');
INSERT INTO `send_record_detail` VALUES ('13', '1', '1', '1', '2016-07-27 14:49:09', '33333333333333333333', '2');
INSERT INTO `send_record_detail` VALUES ('14', '1', '1', '1', '2016-07-27 14:49:09', '33333333333333333333', '2');
INSERT INTO `send_record_detail` VALUES ('15', '1', '1', '1', '2016-07-27 14:49:09', '33333333333333333333', '2');
INSERT INTO `send_record_detail` VALUES ('16', '1', '1', '1', '2016-07-27 14:49:29', '44444444444444', '2');
INSERT INTO `send_record_detail` VALUES ('17', '1', '1', '1', '2016-07-27 14:49:29', '44444444444444', '2');
INSERT INTO `send_record_detail` VALUES ('18', '1', '1', '1', '2016-07-27 14:49:29', '44444444444444', '2');
INSERT INTO `send_record_detail` VALUES ('19', '1', '1', '1', '2016-07-27 14:49:37', '555555555555555555555555555555555555555', '2');
INSERT INTO `send_record_detail` VALUES ('20', '1', '1', '1', '2016-07-27 14:49:37', '555555555555555555555555555555555555555', '2');
INSERT INTO `send_record_detail` VALUES ('21', '1', '1', '1', '2016-07-27 14:49:37', '555555555555555555555555555555555555555', '2');
INSERT INTO `send_record_detail` VALUES ('22', '1', '1', '1', '2016-07-27 14:49:57', '666666666666666666666666666666', '2');
INSERT INTO `send_record_detail` VALUES ('23', '1', '1', '1', '2016-07-27 14:49:57', '666666666666666666666666666666', '2');
INSERT INTO `send_record_detail` VALUES ('24', '1', '1', '1', '2016-07-27 14:49:57', '666666666666666666666666666666', '2');
INSERT INTO `send_record_detail` VALUES ('25', '2', '1', '1', '2016-07-27 17:25:52', '666666666666666666666666666666', '2');
INSERT INTO `send_record_detail` VALUES ('26', '2', '1', '1', '2016-07-27 17:26:06', '666666666666666666666666666666', '2');
INSERT INTO `send_record_detail` VALUES ('27', '2', '1', '1', '2016-07-27 17:26:09', '666666666666666666666666666666', '2');

-- ----------------------------
-- Table structure for worker
-- ----------------------------
DROP TABLE IF EXISTS `worker`;
CREATE TABLE `worker` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `worker_id` varchar(255) DEFAULT NULL COMMENT '暂时不用',
  `name` varchar(255) DEFAULT NULL,
  `org_id` int(255) DEFAULT NULL COMMENT '所属组id',
  `status` varchar(255) DEFAULT '1' COMMENT '状态 0：禁用 1：可用',
  `role_id` int(11) DEFAULT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `sender_id_unique_key` (`worker_id`) USING HASH,
  KEY `fg1` (`org_id`),
  KEY `role_id_fk` (`role_id`),
  CONSTRAINT `fg1` FOREIGN KEY (`org_id`) REFERENCES `org` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `role_id_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worker
-- ----------------------------
INSERT INTO `worker` VALUES ('1', '1', '测试1', '2', '1', '1');
INSERT INTO `worker` VALUES ('2', '2', '测试2', '2', '1', '2');
INSERT INTO `worker` VALUES ('11', null, 'erer', '2', '1', '1');

-- ----------------------------
-- Table structure for zb_rule
-- ----------------------------
DROP TABLE IF EXISTS `zb_rule`;
CREATE TABLE `zb_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule_name` varchar(255) DEFAULT NULL,
  `zb_count` int(11) DEFAULT NULL,
  `zb_compute_type` varchar(255) DEFAULT NULL COMMENT '暂币计算类型  1:固定 2:根据组织架构公式计算',
  `calculate` varchar(255) DEFAULT NULL COMMENT '计算公式',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of zb_rule
-- ----------------------------
INSERT INTO `zb_rule` VALUES ('1', '普通成员', '5', '1', null);
INSERT INTO `zb_rule` VALUES ('2', '管理者', null, '2', 'sub*5');
