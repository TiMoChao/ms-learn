/*
 Navicat Premium Data Transfer

 Source Server         : self_mysql58
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : 127.0.0.1:3306
 Source Schema         : seckill

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 14/09/2022 14:16:04
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `activity_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '活动Id',
  `activity_name` varchar(50) NOT NULL DEFAULT '' COMMENT '活动名称',
  `product_id` int unsigned NOT NULL COMMENT '商品Id',
  `start_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动开始时间',
  `end_time` int unsigned NOT NULL DEFAULT '0' COMMENT '活动结束时间',
  `total` int unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '活动状态',
  `sec_speed` int unsigned NOT NULL DEFAULT '0' COMMENT '每秒限制多少个商品售出',
  `buy_limit` int unsigned NOT NULL COMMENT '购买限制',
  `buy_rate` decimal(2,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '购买限制',
  PRIMARY KEY (`activity_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='@活动数据表';

-- ----------------------------
-- Records of activity
-- ----------------------------
BEGIN;
INSERT INTO `activity` VALUES (1, '香蕉大甩卖', 1, 1530928052, 1663401795, 20, 0, 1, 1, 0.20);
INSERT INTO `activity` VALUES (2, '苹果大甩卖', 2, 1530928052, 1663401795, 20, 0, 1, 1, 0.20);
INSERT INTO `activity` VALUES (3, '桃子大甩卖', 3, 1530928052, 1663401795, 20, 0, 1, 1, 0.20);
INSERT INTO `activity` VALUES (4, '梨子大甩卖', 4, 1530928052, 1663401795, 20, 0, 1, 1, 0.20);
INSERT INTO `activity` VALUES (15, '测试秒杀99', 3, 1573300360, 1663401795, 100, 0, 1, 1, 0.20);
COMMIT;

-- ----------------------------
-- Table structure for client_details
-- ----------------------------
DROP TABLE IF EXISTS `client_details`;
CREATE TABLE `client_details` (
  `client_id` varchar(128) NOT NULL,
  `client_secret` varchar(128) NOT NULL,
  `access_token_validity_seconds` int NOT NULL,
  `refresh_token_validity_seconds` int NOT NULL,
  `registered_redirect_uri` varchar(128) NOT NULL,
  `authorized_grant_types` varchar(128) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of client_details
-- ----------------------------
BEGIN;
INSERT INTO `client_details` VALUES ('clientId', 'clientSecret', 1800, 18000, 'http://127.0.0.1', '[\"password\",\"refresh_token\"]');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `product_id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '商品Id',
  `product_name` varchar(50) NOT NULL DEFAULT '' COMMENT '商品名称',
  `total` int unsigned NOT NULL DEFAULT '0' COMMENT '商品数量',
  `status` tinyint unsigned NOT NULL DEFAULT '0' COMMENT '商品状态',
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='@商品数据表';

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` VALUES (1, '香蕉', 100, 1);
INSERT INTO `product` VALUES (2, '苹果', 100, 1);
INSERT INTO `product` VALUES (3, '桃子', 100, 1);
INSERT INTO `product` VALUES (4, '梨子', 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(64) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `age` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES (1, 'user', 'password', 25);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
