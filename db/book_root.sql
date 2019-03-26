/*
 Navicat Premium Data Transfer

 Source Server         : Terminal
 Source Server Type    : MySQL
 Source Server Version : 100135
 Source Host           : localhost:3306
 Source Schema         : ta_book

 Target Server Type    : MySQL
 Target Server Version : 100135
 File Encoding         : 65001

 Date: 20/03/2019 12:57:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_root
-- ----------------------------
DROP TABLE IF EXISTS `book_root`;
CREATE TABLE `book_root` (
  `id`          varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`   varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time` datetime(0)  NOT NULL
  COMMENT '创建时间',
  `update_time` datetime(0)  NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`    char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '删除标记',
  `remarks`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
