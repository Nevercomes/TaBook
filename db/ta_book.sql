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

 Date: 20/03/2019 20:36:28
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_borrow_buy
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow_buy`;
CREATE TABLE `book_borrow_buy` (
  `id`                   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NOT NULL,
  `create_by`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NOT NULL
  COMMENT '创建者',
  `update_by`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`          datetime(0)   NOT NULL
  COMMENT '创建时间',
  `update_time`          datetime(0)   NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`             char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NOT NULL
  COMMENT '删除标记',
  `remarks`              varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '备注',
  `status`               varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NOT NULL
  COMMENT '借书申请的状态',
  `requester_words`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '申请者借书申请的留言',
  `requester_words_done` varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '借书者对所有者的评价、留言',
  `requester_give_score` decimal(2, 2) NULL DEFAULT NULL
  COMMENT '借书者对所有者的打分',
  `owner_words_done`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '所有者对借书者的评价、留言',
  `owner_give_score`     decimal(2, 2) NULL DEFAULT NULL
  COMMENT '所有者对借书者的打分',
  `cancel`               char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci           NULL DEFAULT NULL
  COMMENT '申请者撤销请求标记',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_class
-- ----------------------------
DROP TABLE IF EXISTS `book_class`;
CREATE TABLE `book_class` (
  `id`           varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL,
  `create_by`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '创建者',
  `update_by`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '更新者',
  `create_time`  datetime(0)   NOT NULL
  COMMENT '创建时间',
  `update_time`  datetime(0)   NOT NULL
  COMMENT '更新时间',
  `del_flag`     char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '删除标记',
  `remarks`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '备注',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '指向root的指针',
  `ISBN`         varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL,
  `version`      varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '版本 （第几版）不一定输入 可能在 root以名字输入',
  `press`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '出版社',
  `year`         varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '年份',
  `score`        decimal(2, 2) NULL DEFAULT NULL
  COMMENT '分数',
  `intro`        varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '简介',
  `img_id`       varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '图片id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`book_root_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_comment_long
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_long`;
CREATE TABLE `book_comment_long` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time` datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time` datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`    char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '删除标记',
  `remarks`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '备注',
  `title`       varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL,
  `content`     text CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL,
  `score`       decimal(2, 2)  NULL DEFAULT NULL,
  `like_num`    decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_reply`;
CREATE TABLE `book_comment_reply` (
  `id`              varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NOT NULL,
  `create_by`       varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NOT NULL
  COMMENT '创建者',
  `update_by`       varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`     datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time`     datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`        char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NOT NULL
  COMMENT '删除标记',
  `remarks`         varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NULL DEFAULT NULL
  COMMENT '备注',
  `book_comment_id` varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci       NULL DEFAULT NULL
  COMMENT '指向长书评的指针',
  `like_num`        decimal(10, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_comment_short
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_short`;
CREATE TABLE `book_comment_short` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time` datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time` datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`    char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '删除标记',
  `remarks`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '备注',
  `content`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL,
  `score`       decimal(2, 2)  NULL DEFAULT NULL,
  `like_num`    decimal(10, 0) NULL DEFAULT NULL
  COMMENT '点赞数',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_instance
-- ----------------------------
DROP TABLE IF EXISTS `book_instance`;
CREATE TABLE `book_instance` (
  `id`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL,
  `create_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL
  COMMENT '创建者',
  `update_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`   datetime(0) NOT NULL
  COMMENT '创建时间',
  `update_time`   datetime(0) NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`      char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL
  COMMENT '删除标记',
  `remarks`       varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '备注',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '指向class的指针',
  `user_add_id`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '指向book_user_add的指针',
  `owner_id`      varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '书籍所有者id',
  `holder_id`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '书籍当前持有者的id',
  `school_id`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '学校id/额外冗余',
  `status`        varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '书籍当前状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`book_class_id`) USING BTREE,
  INDEX `index2`(`owner_id`) USING BTREE,
  INDEX `index3`(`holder_id`) USING BTREE,
  INDEX `index4`(`school_id`) USING BTREE,
  INDEX `index5`(`user_add_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

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
  `name`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '书名',
  `author`      varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '作者',
  `sort_seq`    varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '分类序列 定长01字符串',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_user_add
-- ----------------------------
DROP TABLE IF EXISTS `book_user_add`;
CREATE TABLE `book_user_add` (
  `id`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL,
  `create_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL
  COMMENT '创建者',
  `update_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`   datetime(0)   NOT NULL
  COMMENT '创建时间',
  `update_time`   datetime(0)   NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`      char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL
  COMMENT '删除标记',
  `remarks`       varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '备注',
  `owner_id`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '所有者id',
  `book_root_id`  varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '指向book_root的指针',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '指向book_class的指针',
  `user_add_id`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '指向book_user_add的指针',
  `name`          varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
  `author`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
  `press`         varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
  `year`          varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL,
  `owner_comment` varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL
  COMMENT '书籍上传时所有者留下的评价，可修改',
  `type`          varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '书籍上架类型，0下架，1借书，2卖书',
  `price`         decimal(4, 2) NULL DEFAULT NULL
  COMMENT '上架卖书，书籍价格',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_notice
-- ----------------------------
DROP TABLE IF EXISTS `msg_notice`;
CREATE TABLE `msg_notice` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
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
  `type`        char(1) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '类型',
  `title`       varchar(45) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '标题',
  `content`     text CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL
  COMMENT '内容',
  `status`      varchar(4) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_notice_record
-- ----------------------------
DROP TABLE IF EXISTS `msg_notice_record`;
CREATE TABLE `msg_notice_record` (
  `id`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL,
  `msg_notice_id` varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci     NULL DEFAULT NULL
  COMMENT '通知通告ID',
  `user_id`       varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci     NULL DEFAULT NULL
  COMMENT '接受人',
  `read_flag`     char(1) CHARACTER SET utf8
  COLLATE utf8_general_ci     NULL DEFAULT '0'
  COMMENT '阅读标记',
  `read_time`     datetime(0) NULL DEFAULT NULL
  COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`msg_notice_id`) USING BTREE,
  INDEX `index2`(`user_id`) USING BTREE,
  INDEX `index3`(`read_flag`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_campus
-- ----------------------------
DROP TABLE IF EXISTS `sys_campus`;
CREATE TABLE `sys_campus` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
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
  `school_id`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id`          varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL,
  `create_by`   varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time` datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time` datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`    char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '删除标记',
  `remarks`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '备注',
  `value`       varchar(100) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '值',
  `label`       varchar(100) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '标签',
  `type`        varchar(100) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '类型',
  `description` varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '描述',
  `sort`        decimal(10, 0) NULL DEFAULT NULL
  COMMENT '排序（升序）',
  `parent_id`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '父级id',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `create_time` datetime(0)  NOT NULL
  COMMENT '创建时间',
  `type`        char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '日志类型',
  `title`       varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '日志标题',
  `user_agent`  varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '用户代理',
  `remote_addr` varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '操作IP地址',
  `request_uri` varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '请求uri',
  `method`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '操作方式',
  `params`      longtext CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL
  COMMENT '操作提交的数据',
  `exception`   text CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL
  COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
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
  `school_id`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `name`        varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '角色名称',
  `en_name`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '英文名称',
  `role_type`   varchar(4) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '角色类型',
  `data_scope`  char(1) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '数据范围',
  `is_sys`      varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '是否系统数据',
  `useable`     varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci    NULL DEFAULT NULL
  COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`del_flag`) USING BTREE,
  INDEX `index2`(`en_name`(191)) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_school
-- ----------------------------
DROP TABLE IF EXISTS `sys_school`;
CREATE TABLE `sys_school` (
  `id`          varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL,
  `create_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '创建者',
  `update_by`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time` datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time` datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`    char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NOT NULL
  COMMENT '删除标记',
  `remarks`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '备注',
  `name`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL,
  `useable`     char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci   NULL DEFAULT NULL
  COMMENT '是否可用',
  `sort`        decimal(10, 0) NULL DEFAULT NULL
  COMMENT '排序（升序）',
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id`           varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL,
  `create_by`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '创建者',
  `update_by`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`  datetime(0) NOT NULL
  COMMENT '创建时间',
  `update_time`  datetime(0) NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`     char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NOT NULL
  COMMENT '删除标记',
  `login_ip`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '最后登录的ip',
  `login_time`   datetime(0) NULL DEFAULT NULL
  COMMENT '最后的登录时间',
  `login_flag`   char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '是否可登录',
  `remarks`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '备注',
  `school_id`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '学校id',
  `campus_id`    varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '校区id',
  `account_name` varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '账户名',
  `nick_name`    varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '昵称',
  `avatar_url`   varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '头像url',
  `intro`        varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '个性签名',
  `password`     varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '密码/加密',
  `mail`         varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '邮箱',
  `phone`        varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '手机',
  `QQ`           varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT 'QQ',
  `is_real`      char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '是否实名认证',
  `real_name`    varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '真实姓名',
  `real_class`   varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci NULL DEFAULT NULL
  COMMENT '班级',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`school_id`) USING BTREE,
  INDEX `index2`(`campus_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci NOT NULL
  COMMENT '用户编号',
  `role_id` varchar(64) CHARACTER SET utf8
  COLLATE utf8_general_ci NOT NULL
  COMMENT '角色编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_book
-- ----------------------------
DROP TABLE IF EXISTS `user_book`;
CREATE TABLE `user_book` (
  `id`           varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL,
  `create_by`    varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL
  COMMENT '创建者',
  `update_by`    varchar(45) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`  datetime(0)    NOT NULL
  COMMENT '创建时间',
  `update_time`  datetime(0)    NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`     char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NOT NULL
  COMMENT '删除标记',
  `remarks`      varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '备注',
  `user_id`      varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '指向sys_user的指针',
  `name`         varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci    NULL DEFAULT NULL
  COMMENT '姓名',
  `credit_score` decimal(10, 0) NULL DEFAULT NULL
  COMMENT '信誉分数',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`user_id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user_favorites
-- ----------------------------
DROP TABLE IF EXISTS `user_favorites`;
CREATE TABLE `user_favorites` (
  `id`            varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL,
  `create_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL
  COMMENT '创建者',
  `update_by`     varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '更新者',
  `create_time`   datetime(0) NOT NULL
  COMMENT '创建时间',
  `update_time`   datetime(0) NULL DEFAULT NULL
  COMMENT '更新时间',
  `del_flag`      char(1) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NOT NULL
  COMMENT '删除标记',
  `remarks`       varchar(255) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL
  COMMENT '备注',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4
  COLLATE utf8mb4_general_ci  NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
)
  ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci
  ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
