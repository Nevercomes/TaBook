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

 Date: 13/05/2019 22:29:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book_borrow_buy
-- ----------------------------
DROP TABLE IF EXISTS `book_borrow_buy`;
CREATE TABLE `book_borrow_buy`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `requester_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请发起人',
  `book_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '指向书籍实例副本的指针',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '借书申请的状态',
  `requester_words` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '申请者借书申请的留言',
  `requester_words_done` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '借书者对所有者的评价、留言',
  `requester_give_score` decimal(2, 2) NULL DEFAULT NULL COMMENT '借书者对所有者的打分',
  `owner_words_done` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有者对借书者的评价、留言',
  `owner_words_confirm` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '确认借书申请的',
  `owner_give_score` decimal(2, 2) NULL DEFAULT NULL COMMENT '所有者对借书者的打分',
  `cancel` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '申请者撤销请求标记',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '借书1 买书2',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_borrow_buy
-- ----------------------------
INSERT INTO `book_borrow_buy` VALUES ('62471d04a27342a5b235b0167f344ffa', 'sun-0', 'sun-0', '2019-05-06 10:18:03', '2019-05-06 10:18:03', '0', NULL, 'sun-1', '10c8565b9e8545ceb1cb7daa8ba72a9e', '1', '下半年,中美合拍的...文体两开花', NULL, 0.00, NULL, NULL, 0.00, NULL, '2');
INSERT INTO `book_borrow_buy` VALUES ('e5308a3798034223994be8383ccd3f59', 'sun-0', 'sun-0', '2019-05-06 09:27:58', '2019-05-06 09:27:58', '0', NULL, 'sun-1', '10c8565b9e8545ceb1cb7daa8ba72a9e', '1', '下半年,中美合拍的...文体两开花', NULL, 0.00, NULL, NULL, 0.00, NULL, '1');

-- ----------------------------
-- Table structure for book_comment_long
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_long`;
CREATE TABLE `book_comment_long`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `title` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校id/冗余',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级书籍id',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务逻辑身份/冗余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_comment_long
-- ----------------------------
INSERT INTO `book_comment_long` VALUES ('122d4c8faa5d4852b0fbd43c36cf3908', 'sun-0', 'sun-0', '2019-05-06 10:49:24', '2019-05-06 10:49:24', '0', NULL, '大碗宽面', '你看这碗它又大又圆，你看这面它又长又宽', '9.5', NULL, '042840c6cbcf46fb8799ea0fb963818e', NULL);

-- ----------------------------
-- Table structure for book_comment_reply
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_reply`;
CREATE TABLE `book_comment_reply`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_comment_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向长书评的指针',
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校id/冗余',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务逻辑身份/冗余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_comment_reply
-- ----------------------------
INSERT INTO `book_comment_reply` VALUES ('50d2ec4db646418e89de5ea67b81b6c2', 'sun-0', 'sun-0', '2019-05-06 10:53:39', '2019-05-06 10:53:39', '0', NULL, '122d4c8faa5d4852b0fbd43c36cf3908', NULL, '开花开花', NULL);

-- ----------------------------
-- Table structure for book_comment_short
-- ----------------------------
DROP TABLE IF EXISTS `book_comment_short`;
CREATE TABLE `book_comment_short`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校id/冗余',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '一级书籍id',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务逻辑身份/冗余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_comment_short
-- ----------------------------
INSERT INTO `book_comment_short` VALUES ('69f173e94d4841499287d068d4cbab0f', 'sun-0', 'sun-0', '2019-05-06 10:41:56', '2019-05-06 10:41:56', '0', NULL, '大家好，我是练习时长两年半的...', '8.9', NULL, '042840c6cbcf46fb8799ea0fb963818e', NULL);

-- ----------------------------
-- Table structure for book_index_borrow
-- ----------------------------
DROP TABLE IF EXISTS `book_index_borrow`;
CREATE TABLE `book_index_borrow`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否处于显示状态 显示1（默认） 不显示0',
  `expired_time` datetime(0) NULL DEFAULT NULL COMMENT '设置的失效时间',
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可能存在的排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_index_buy
-- ----------------------------
DROP TABLE IF EXISTS `book_index_buy`;
CREATE TABLE `book_index_buy`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否处于显示状态 显示1（默认） 不显示0',
  `expired_time` datetime(0) NULL DEFAULT NULL COMMENT '设置的失效时间',
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可能存在的排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_index_head
-- ----------------------------
DROP TABLE IF EXISTS `book_index_head`;
CREATE TABLE `book_index_head`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '推荐的类型 book1 comment2 other3',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `book_comment_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `other_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跳转到他处的url',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否处于显示状态 显示1（默认） 不显示0',
  `expired_time` datetime(0) NULL DEFAULT NULL COMMENT '设置的失效时间',
  `img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '配图的url',
  `sort` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '可能存在的排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_info_add
-- ----------------------------
DROP TABLE IF EXISTS `book_info_add`;
CREATE TABLE `book_info_add`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向book_root的指针',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向book_class的指针',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `author` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `press` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `year` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `owner_comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍上传时所有者留下的评价，可修改',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍上架类型，0下架，1借书，2卖书',
  `price` decimal(4, 2) NULL DEFAULT NULL COMMENT '上架卖书，书籍价格',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务逻辑身份/冗余',
  `new_percent` int(4) NULL DEFAULT NULL COMMENT '新旧程度 旧0->100新 百分数表示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_info_add
-- ----------------------------
INSERT INTO `book_info_add` VALUES ('3351036305e54dbdb775bfc29facb203', 'sun-0', 'sun-0', '2019-05-05 23:38:18', '2019-05-05 23:38:18', '0', NULL, '01a2d02d741642ad912296bff9317860', '4d1a91e36bf2479991adb817def68bc7', '富爸爸，穷爸爸', '（美）罗伯特・T・清崎 ', '世界图书出版公司', '2000-09 ', '我真的没有开挂', '1', 0.00, NULL, 80);
INSERT INTO `book_info_add` VALUES ('7c825f3a04b24100bd1784bf96fb10ab', 'sun-0', 'sun-0', '2019-05-05 00:00:00', '2019-05-05 00:00:00', '0', NULL, '07f1152d82a24921b4c27e8de0e71e35', 'e1b981a733674ea984e03fa66c3b252d', NULL, NULL, NULL, NULL, '', NULL, NULL, NULL, NULL);
INSERT INTO `book_info_add` VALUES ('847dbeb852964efaae46ac0a4fa9cfdf', 'sun-0', 'sun-0', '2019-05-05 23:47:28', '2019-05-05 23:47:28', '0', NULL, '01a2d02d741642ad912296bff9317860', 'b0c4acaeb4a94ebf8f891e0db4c06ee8', '富爸爸，穷爸爸', '（美）罗伯特・T・清崎 ', '译林出版社', '2010-09', '我真的没有开挂', '1', 0.00, NULL, 80);
INSERT INTO `book_info_add` VALUES ('b9ac3a5019524b339264b88448bf2f25', 'sun-0', 'sun-0', '2019-05-06 08:27:24', '2019-05-06 08:27:25', '0', NULL, '716a9265e589434f963c4da3dde5a13b', 'a173307fbbe640f397c0bb914c36af14', '我的天才女友', '[意]埃莱娜·费兰特 ', '双生法术出版社', '2012-09', '我真的没有开挂', '1', 0.00, NULL, 80);
INSERT INTO `book_info_add` VALUES ('f37e171b420e43b897d8bce28324ae17', 'sun-0', 'sun-0', '2019-05-05 23:42:30', '2019-05-05 23:42:30', '0', NULL, '01a2d02d741642ad912296bff9317860', NULL, '富爸爸，穷爸爸', '（美）罗伯特・T・清崎 ', '译林出版社', '2010-09', '我真的没有开挂', '1', 0.00, NULL, 80);

-- ----------------------------
-- Table structure for book_info_class
-- ----------------------------
DROP TABLE IF EXISTS `book_info_class`;
CREATE TABLE `book_info_class`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向root的指针',
  `ISBN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `version` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '版本 （第几版）不一定输入 可能在 root以名字输入',
  `press` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '出版社',
  `year` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '年份',
  `score` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分数',
  `intro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '简介',
  `img_url` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`book_root_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_info_class
-- ----------------------------
INSERT INTO `book_info_class` VALUES ('0441835c298948d5acca6f044c6a2e4f', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'd9678b3db44a412e9dbcd06534185abb', NULL, NULL, ' 人民文学出版社 ', ' 1991-2 ', '8.9', '对于“人艰不拆”四个字最彻底的违抗', 'https://img3.doubanio.com/view/subject/m/public/s1070222.jpg');
INSERT INTO `book_info_class` VALUES ('04f34385f15b4733aa8457d8387c9659', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '48fa57930d4c4344ae1fbe0c5ba265dc', NULL, NULL, ' 人民文学出版社 ', ' 1999-04 ', '8.9', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1067491.jpg');
INSERT INTO `book_info_class` VALUES ('0541d45596cf4595a79deafc05e70640', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'b278ad1515a94cbcb6dab5c80047e01b', NULL, NULL, ' 江苏文艺出版社 ', ' 2005-1 ', '8.6', NULL, 'https://img3.doubanio.com/view/subject/m/public/s26384792.jpg');
INSERT INTO `book_info_class` VALUES ('06bc9b57f61141fd9bbdb3360a161121', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '39a1947efc2e45b49b0b672e09bc6e5d', NULL, NULL, ' 花城出版社 ', ' 1996-06 ', '8.4', '蚊子血还是饭黏子？', 'https://img3.doubanio.com/view/subject/m/public/s3695882.jpg');
INSERT INTO `book_info_class` VALUES ('06ff132cf8164155a46412473ed70ce0', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '0698a5a8b60d4ca0823d1ec379b98461', NULL, NULL, ' 上海译文出版社 ', ' 2007-7 ', '8.7', '暗恋的极致', 'https://img1.doubanio.com/view/subject/m/public/s2611329.jpg');
INSERT INTO `book_info_class` VALUES ('07276d5e4a564070aa4c1fd0e492340f', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '42e58292f4f34cf38311810bb4ba9b09', NULL, NULL, '', ' 2009-12-1 ', '8.8', '我们现在怎样做母亲', 'https://img3.doubanio.com/view/subject/m/public/s4124434.jpg');
INSERT INTO `book_info_class` VALUES ('07ae4565e9fb4aad81219b49c839d0a3', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '262d32f741d34906b200b3286589e127', NULL, NULL, ' 广西师范大学出版社 ', ' 2002-2 ', '8.2', '静美又残酷，无限柔软的川端', 'https://img3.doubanio.com/view/subject/m/public/s1056010.jpg');
INSERT INTO `book_info_class` VALUES ('080c1927ccae4ee3903bacde74c415b6', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '9229dabf856d46c5b80c1e9ec42e43bf', NULL, NULL, '', ' 2012-05-01 ', '8.7', NULL, 'https://img3.doubanio.com/view/subject/m/public/s9038826.jpg');
INSERT INTO `book_info_class` VALUES ('081970206bf048daa74a4a69eadc8d58', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '61e085f8a4774b66a26dc7b5d2c0f427', NULL, NULL, '', ' 1990-6 ', '8.2', '复杂矛盾的日本民族', 'https://img3.doubanio.com/view/subject/m/public/s1074166.jpg');
INSERT INTO `book_info_class` VALUES ('0882c2066a994df4bc05a4a0ec1b6024', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'b7ffc5c78c7841ff9834a8a1084eaa3c', NULL, NULL, ' 人民文学出版社 ', ' 2003-8 ', '9.0', '献给长成了大人的孩子们', 'https://img3.doubanio.com/view/subject/m/public/s1103152.jpg');
INSERT INTO `book_info_class` VALUES ('0903aba157f74250a649a0312244d6c0', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '4acb6a3be517483abc06cb794cff5896', NULL, NULL, ' 作家出版社 ', ' 2002-8 ', '8.0', '你们不会彼此遗忘。只会彼此消失', 'https://img3.doubanio.com/view/subject/m/public/s3237601.jpg');
INSERT INTO `book_info_class` VALUES ('09c3c525b94145bbb8dcfedff892dbcf', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'be0f49528a0a4af784cc65a3f0395b6b', NULL, NULL, ' 上海译文出版社 ', ' 2001-8 ', '8.1', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1029647.jpg');
INSERT INTO `book_info_class` VALUES ('0a1143e24b414386b676c4051842ee16', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '44b69d19fbe64fad9adf81d84f6bebf5', NULL, NULL, ' 上海译文出版社 ', ' 1991-12-1 ', '9.0', '完美的复仇，金庸用法语写作应该就是这样', 'https://img3.doubanio.com/view/subject/m/public/s3248016.jpg');
INSERT INTO `book_info_class` VALUES ('0a5d1be7397e4f819b55f246c5aacebc', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '58e3516e0bd843d8bad29395dfbcb796', NULL, NULL, ' 中国人民大学出版社 ', ' 2006-5 ', '8.6', '营销防骗指南', 'https://img3.doubanio.com/view/subject/m/public/s1657785.jpg');
INSERT INTO `book_info_class` VALUES ('0b8ae0f181ff447a9e9378911c9025e9', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '930c6412a4944963868401a08cd8d694', NULL, NULL, ' 华文出版社 ', ' 2004-1 ', '8.4', '象牙塔里的金庸群侠', 'https://img1.doubanio.com/view/subject/m/public/s1068707.jpg');
INSERT INTO `book_info_class` VALUES ('0ca2b4e2afca45c2b352b3d884f69308', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '1b62de5fe3dd4337bf3a697dde51deff', NULL, NULL, ' 人民文学出版社 ', '', '8.7', '鲁迅的旧事重提', 'https://img3.doubanio.com/view/subject/m/public/s2875823.jpg');
INSERT INTO `book_info_class` VALUES ('0f402edf515c467d847ba49292e9e93c', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'a90c2a8de78a487d8ecb2ac1465782e4', NULL, NULL, ' 河北教育出版社 ', ' 2005-2 ', '8.3', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1240228.jpg');
INSERT INTO `book_info_class` VALUES ('1022dc484f494a139484bf8b0d9a83d1', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, 'b0cdf4afcefa421caf9111679cb74f4e', NULL, NULL, ' 人民文学出版社 ', ' 1997-12 ', '8.7', '中国乡村史诗', 'https://img1.doubanio.com/view/subject/m/public/s9137567.jpg');
INSERT INTO `book_info_class` VALUES ('10546e87bd9a4d70b775e6495e1b4aab', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '124717ced8f0438b8af169f1f07d40d0', NULL, NULL, ' 上海锦绣文章出版社 ', ' 2009-1 ', '9.0', '治愈', 'https://img3.doubanio.com/view/subject/m/public/s3721175.jpg');
INSERT INTO `book_info_class` VALUES ('10c7307b7dfe4c8bb35af243191fcb4b', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '06391670b8894ace851dba5b520b2d4f', NULL, NULL, '', ' 1999-04 ', '8.6', '不识张郎是张郎', 'https://img1.doubanio.com/view/subject/m/public/s1829709.jpg');
INSERT INTO `book_info_class` VALUES ('13b23d8c70594d82b775fec8772aa130', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '8973871d6f12483099b08f36babfbb17', NULL, NULL, ' 北京十月文艺出版社 ', ' 2009-5 ', '8.4', '如果你是高加林，你要如何选择？', 'https://img3.doubanio.com/view/subject/m/public/s3847911.jpg');
INSERT INTO `book_info_class` VALUES ('14a8116a1e9f42298b712ca666f19a1f', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'c23b01e3d6044418abac0364d47005eb', NULL, NULL, ' 人民文学出版社 ', ' 2006-5 ', '8.7', '阿婆代表作之一', 'https://img1.doubanio.com/view/subject/m/public/s1683067.jpg');
INSERT INTO `book_info_class` VALUES ('163c4c0eb34049afac9dc470c8b449bd', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '728aee42ac394be5bc729b37e2042876', NULL, NULL, ' 长江文艺出版社 ', ' 2010-10 ', '8.2', '定做一个刻着“不过如此”的章，盖在封面上', 'https://img3.doubanio.com/view/subject/m/public/s4512594.jpg');
INSERT INTO `book_info_class` VALUES ('1857532467ca4c5e9b4720ca3285cb0f', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '86625ecd605249d9a86144d9664751f6', NULL, NULL, ' 南海出版公司 ', ' 2011-6 ', '9.2', '尼采所谓的永劫复归，一场无始无终的梦魇', 'https://img3.doubanio.com/view/subject/m/public/s6384944.jpg');
INSERT INTO `book_info_class` VALUES ('1889993596d54321be749e8472923510', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '1aa04ca64b384a66af7a1fd8db552118', NULL, NULL, ' 陕西师范大学出版社 ', ' 2005-7 ', '8.5', '林语堂的《红楼梦》', 'https://img1.doubanio.com/view/subject/m/public/s1395779.jpg');
INSERT INTO `book_info_class` VALUES ('18c644c539f346619d78b32721e6e77c', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '612caf11cda7405bb8012854b7d4a858', NULL, NULL, ' 南海出版公司 ', ' 2007-8 ', '8.0', '不能说偷，是窃，窃你懂吗', 'https://img3.doubanio.com/view/subject/m/public/s2686452.jpg');
INSERT INTO `book_info_class` VALUES ('1992215722c6401a81645f353c131d6c', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'd1658e7f9a564846b8bf99c7572d5e15', NULL, NULL, ' 重庆出版社 ', ' 2005-5 ', '9.3', '凛冬将至。无比宏大的世界观', 'https://img3.doubanio.com/view/subject/m/public/s1358984.jpg');
INSERT INTO `book_info_class` VALUES ('1a5b2c5a434043aaaa76567ba3a05cf3', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '986994b8a4d44456995bc1310b6b1964', NULL, NULL, ' 文化艺术出版社 ', ' 1997 ', '9.1', '活过，爱过，写过', 'https://img3.doubanio.com/view/subject/m/public/s1016763.jpg');
INSERT INTO `book_info_class` VALUES ('1a6357fa73a848bda072d72dfc6bb4e7', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '1e0a44840a6e474cb1f2c186ffaaff7e', NULL, NULL, ' 译林出版社 ', ' 1993-7-1 ', '8.2', '阴谋与爱情', 'https://img3.doubanio.com/view/subject/m/public/s1988674.jpg');
INSERT INTO `book_info_class` VALUES ('1b5da5f30862475daca38ff5636a3140', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '10c9945f387e4fe29f80cb1ff2916076', NULL, NULL, ' 世界图书出版公司 ', ' 2003-11 ', '8.5', '灰姑娘在十九世纪', 'https://img3.doubanio.com/view/subject/m/public/s5924326.jpg');
INSERT INTO `book_info_class` VALUES ('1bd05632d47f43acbcbe5b76248b8717', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '23e33899a85749b8a817246f7c06ae9e', NULL, NULL, ' 春风文艺出版社 ', ' 2002-5 ', '9.0', '这是你的罪孽与福祉', 'https://img1.doubanio.com/view/subject/m/public/s1151479.jpg');
INSERT INTO `book_info_class` VALUES ('1cb8cfeed9274d91b5052539a52fa7b4', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '313daf0065f544eb91d0a8c2bc291267', NULL, NULL, ' 辽宁教育出版社 ', ' 2002-2 ', '8.3', '黑暗世界中的点滴亮光', 'https://img3.doubanio.com/view/subject/m/public/s1672971.jpg');
INSERT INTO `book_info_class` VALUES ('1ffda1bbeffb47e0a12a6b88cc7a88f5', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'e156d3262aca4fd5b088a57e4f960432', NULL, NULL, ' 译林出版社 ', ' 2006-8 ', '8.8', '每一座城市都只在想象中耸立，又在描述中坍圮', 'https://img3.doubanio.com/view/subject/m/public/s1804710.jpg');
INSERT INTO `book_info_class` VALUES ('20164def29be48b5bbd90b8a6efe4641', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, 'bbf86492552d49f8b5891fd0c78b533e', NULL, NULL, ' 译林出版社 ', ' 1997-8 ', '9.0', NULL, 'https://img1.doubanio.com/view/subject/m/public/s2832939.jpg');
INSERT INTO `book_info_class` VALUES ('20fb908deffd49d2b7b82a5b608dec82', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '8973871d6f12483099b08f36babfbb17', NULL, NULL, ' 人民文学出版社 ', ' 2008-3 ', '8.9', '童谣杀人案', 'https://img3.doubanio.com/view/subject/m/public/s2962510.jpg');
INSERT INTO `book_info_class` VALUES ('210b25b4f6b645efb7dedbfb2dbcc9a7', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, 'c0fd4caa7638427cb16bdcf7e17aac58', NULL, NULL, ' 人民文学出版社 ', ' 2017-4-1 ', '8.1', NULL, 'https://img3.doubanio.com/view/subject/m/public/s29418322.jpg');
INSERT INTO `book_info_class` VALUES ('2138d0aae55847bb8ec1b369a44439b8', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '331cb592948647d9813a3446b91a69e3', NULL, NULL, '', ' 2007-2 ', '8.3', NULL, 'https://img3.doubanio.com/view/subject/m/public/s2523433.jpg');
INSERT INTO `book_info_class` VALUES ('21536c24185d4147801877d44d912187', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'b90206a5a13b46a8985f9406ca1408ba', NULL, NULL, ' 上海译文出版社 ', ' 2001-2 ', '8.0', '村上之发轫，多少人的青春启蒙', 'https://img3.doubanio.com/view/subject/m/public/s1228930.jpg');
INSERT INTO `book_info_class` VALUES ('21549fd0e71b4f06873559b3ce20c40c', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '3803bd26788046d5bfd907d74eb4f26b', NULL, NULL, ' 群众出版社 ', ' 1981-8 ', '9.2', '侦探小说鼻祖', 'https://img3.doubanio.com/view/subject/m/public/s1229240.jpg');
INSERT INTO `book_info_class` VALUES ('2231729d1a16488fa974059158da16d2', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '3ce26258c61542c29dbfde3e04feb6fb', NULL, NULL, ' 江苏文艺出版社 ', ' 2010-01 ', '8.5', '所有你曾热爱却正在遗忘的人和事', 'https://img3.doubanio.com/view/subject/m/public/s4130990.jpg');
INSERT INTO `book_info_class` VALUES ('2250e67142834e9999c86716c1e9dfde', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '30a102a390f746d99520258efc6be4c7', NULL, NULL, ' 人民文学出版社 ', ' 2000-9 ', '8.9', '渐入佳境，魔法世界全貌初现', 'https://img3.doubanio.com/view/subject/m/public/s1557672.jpg');
INSERT INTO `book_info_class` VALUES ('2334ff3eaadf42bbb5da5b6eff730cc3', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '8b8a9c73b9ba409cb629eb6f67622859', NULL, NULL, ' 上海社会科学院出版社 ', ' 2003-7 ', '8.6', '日常的奇迹', 'https://img3.doubanio.com/view/subject/m/public/s1137441.jpg');
INSERT INTO `book_info_class` VALUES ('23a4c579b9ce499c82941d667b2e3032', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'c2f30e5a02f740ba96e679cade25eee6', NULL, NULL, ' 万卷出版公司 ', ' 2009-08-01 ', '8.1', NULL, 'https://img3.doubanio.com/view/subject/m/public/s3947864.jpg');
INSERT INTO `book_info_class` VALUES ('23c7a5ff53854df0a5fedc0c85a2f720', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '5372f76c66574531949a016e16973cd4', NULL, NULL, ' 上海译文出版社 ', ' 2007-3 ', '9.0', '一把刀的锋刃不容易越过；因此智者说得救之道是困难的', 'https://img3.doubanio.com/view/subject/m/public/s2347562.jpg');
INSERT INTO `book_info_class` VALUES ('24057e5aefd34d1883f4ad01def87fab', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, 'd97371fc07844b5e9087b7be8d1e0d5d', NULL, NULL, ' 上海人民出版社 ', ' 2007-9 ', '8.8', '唯有希望与爱可以驱散阴霾', 'https://img3.doubanio.com/view/subject/m/public/s2651394.jpg');
INSERT INTO `book_info_class` VALUES ('24e0e32800e74ff48387dc4d1b51e9fe', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '537815c43dbd4eff8b2c30b843fb4aec', NULL, NULL, ' 译林出版社 ', ' 1998-7 ', '8.6', '澳洲乱世情', 'https://img3.doubanio.com/view/subject/m/public/s2781615.jpg');
INSERT INTO `book_info_class` VALUES ('25127047f8d34c50a1ef8a83c370848b', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'e8931f30fe764115a5cd07bbeaa74849', NULL, NULL, ' 人民文学出版社 ', ' 1996-12 ', '9.6', '谁解其中味？', 'https://img1.doubanio.com/view/subject/m/public/s1070959.jpg');
INSERT INTO `book_info_class` VALUES ('2525d1bc107e4ca3a64fd849a95ad9f5', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '7419a8f441e749939469a906d03447be', NULL, NULL, ' 长江文艺出版社 ', ' 2010-7-1 ', '8.1', '自毁而偏执的东霓', 'https://img3.doubanio.com/view/subject/m/public/s4397380.jpg');
INSERT INTO `book_info_class` VALUES ('2560299347844c62801bef909615fc35', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '263078edccb14d7b9c7288afc177f8f3', NULL, NULL, ' 东方出版社 ', ' 2008-1 ', '8.3', '不悔梦归处 只恨太匆匆', 'https://img3.doubanio.com/view/subject/m/public/s2892553.jpg');
INSERT INTO `book_info_class` VALUES ('25cdc63765374ee69137fa65c5695a17', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'f0a9026dda8346de98d4e1acd142f929', NULL, NULL, ' 新世界出版社 ', ' 2009-12 ', '8.8', '原作名切题', 'https://img1.doubanio.com/view/subject/m/public/s4293097.jpg');
INSERT INTO `book_info_class` VALUES ('26b0db51422a4a4b8b93169e3a827ec4', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '2060d004c1fe411f9f0e6dbd0851f244', NULL, NULL, ' 译林出版社 ', ' 2000-9 ', '9.3', '革命时期的爱情，随风而逝', 'https://img1.doubanio.com/view/subject/m/public/s1078958.jpg');
INSERT INTO `book_info_class` VALUES ('275a8d503783481584115a4b28503e32', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '3144b10623784443888182401a3e1634', NULL, NULL, ' 新世纪出版社 ', ' 2009-12 ', '9.0', NULL, 'https://img1.doubanio.com/view/subject/m/public/s4158947.jpg');
INSERT INTO `book_info_class` VALUES ('27989d2bb5b640a8970534e9c1f98808', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '3dc63bafe814425898d4be56f25e540b', NULL, NULL, ' 百花文艺出版社 ', ' 2005-01 ', '8.9', '萧红的童年往事', 'https://img3.doubanio.com/view/subject/m/public/s1167060.jpg');
INSERT INTO `book_info_class` VALUES ('2876062673f94043ba546661d990a7d8', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '642357e8bc514df195d4deebb0ae9c00', NULL, NULL, ' 人民文学出版社 ', ' 2001-1 ', '8.5', NULL, 'https://img1.doubanio.com/view/subject/m/public/s27009357.jpg');
INSERT INTO `book_info_class` VALUES ('2887ea54770c4cca9d29b48c45792f4b', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, 'a7d7c54afa2641bf93aada8e24f32268', NULL, NULL, '', ' 2000-2-1 ', '8.6', '月明星稀的晚上，看不见的，看见了', 'https://img1.doubanio.com/view/subject/m/public/s1385508.jpg');
INSERT INTO `book_info_class` VALUES ('2a4a406bb0444b89b5fdb103f02112f7', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '5d55ff0299d8481a814a361587da61d6', NULL, NULL, ' 长江文艺出版社 ', ' 2004-4 ', '8.2', '我们都是 狼的传人？', 'https://img3.doubanio.com/view/subject/m/public/s1466042.jpg');
INSERT INTO `book_info_class` VALUES ('2bfeca7f9ab34d86a8160002fb1cec07', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '76fbb3bc29124556be877d73b35ead86', NULL, NULL, ' 中国友谊出版公司 ', ' 2006-9 ', '8.7', '历史本就是一件件“事儿”拼成的', 'https://img3.doubanio.com/view/subject/m/public/s1872653.jpg');
INSERT INTO `book_info_class` VALUES ('2da5662c94c14422a69b7f52ec26242a', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '6b773faf7d064952ae40b4991e1db3cd', NULL, NULL, ' 南海出版公司 ', ' 2003-1 ', '8.7', '真正懂孩子的教育经', 'https://img3.doubanio.com/view/subject/m/public/s1067911.jpg');
INSERT INTO `book_info_class` VALUES ('2f4cc097aed940a2810a8e7f8ff308f4', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '87697eb5362c4278b2fc2ac06d65ab07', NULL, NULL, ' 上海人民出版社 ', ' 2016-1 ', '8.8', NULL, 'https://img3.doubanio.com/view/subject/m/public/s28332051.jpg');
INSERT INTO `book_info_class` VALUES ('316de46178254a33bab8be838cb01e2e', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'eeef20250adf46a38d1a6176dba07f79', NULL, NULL, ' 新世界出版社 ', ' 2005-6 ', '8.8', '乱世的英雄史诗', 'https://img1.doubanio.com/view/subject/m/public/s1520169.jpg');
INSERT INTO `book_info_class` VALUES ('31bca0f4a72f4d0580d37c9b1ec0d0fe', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'b7165928e6834fc984d2e9dd2816f413', NULL, NULL, ' 上海古籍出版社 ', ' 1998-12-01 ', '9.0', NULL, 'https://img1.doubanio.com/view/subject/m/public/s9130587.jpg');
INSERT INTO `book_info_class` VALUES ('323aa2792b4047ac87cf8a385e2b368d', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '9775c2b122f946da9a5f98fcd1cac294', NULL, NULL, ' 电子工业出版社 ', ' 2011-8 ', '9.1', '了解IT领域的入门读物', 'https://img3.doubanio.com/view/subject/m/public/s6807265.jpg');
INSERT INTO `book_info_class` VALUES ('32d93517dbba46bcac6247af6e8dd5c0', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'f85f01d00e8c4b0eb80d6d3c655e56bd', NULL, NULL, ' 京华出版社 ', ' 2006-3 ', '8.7', '中国现代文学史上第一篇真正的现代白话小说', 'https://img1.doubanio.com/view/subject/m/public/s1426308.jpg');
INSERT INTO `book_info_class` VALUES ('3307d9da680b432ebfb2ec94e071b1de', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'f4c7b18f642a41dcb5801c1e110405b8', NULL, NULL, ' 上海译文出版社 ', ' 2001-8 ', '8.3', '灾星下出生的恋人们', 'https://img3.doubanio.com/view/subject/m/public/s2333463.jpg');
INSERT INTO `book_info_class` VALUES ('333be05d92d2468c8786e01a9bd70028', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'cc05278f083f45f1be8cc81ad9765ebb', NULL, NULL, ' 上海译文出版社 ', ' 2003-4 ', '9.3', '一个预言和一个寓言，令人窒息的政治恐怖', 'https://img3.doubanio.com/view/subject/m/public/s1089916.jpg');
INSERT INTO `book_info_class` VALUES ('385b165094e4416d97b0606393625ddd', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '4cba1a99347c48cda959ba317d8e2a91', NULL, NULL, ' 北京十月文艺出版社 ', ' 2006-10 ', '8.4', '抵不过时间', 'https://img1.doubanio.com/view/subject/m/public/s3007857.jpg');
INSERT INTO `book_info_class` VALUES ('39d863b991c34c898bfc63ee3f5e1e46', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '2a2a202491554e2e99c77fadb0f3acd2', NULL, NULL, ' 天津人民出版社 ', ' 2004-7 ', '8.6', '一场误会中的两段爱情，东方式的含蓄隐忍', 'https://img3.doubanio.com/view/subject/m/public/s1127135.jpg');
INSERT INTO `book_info_class` VALUES ('3b2f3315abec473fb8856a525076bc7f', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, 'dae8228e48a0455ab066dfccca8fe086', NULL, NULL, ' 新世界出版社 ', ' 2007-2 ', '8.0', '爱情才是终极的奢侈品', 'https://img1.doubanio.com/view/subject/m/public/s5813979.jpg');
INSERT INTO `book_info_class` VALUES ('3e3df88bed4743af9b8607ef0b9efa1e', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, 'ffe8af2d40b2423f887c9c19dfcf831c', NULL, NULL, ' 广西师范大学出版社 ', ' 2013-1-1 ', '8.8', '在这里看见中国', 'https://img3.doubanio.com/view/subject/m/public/s24468373.jpg');
INSERT INTO `book_info_class` VALUES ('3e48152c2f374c37b822f28f2a6640c3', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '833bb202e1d74d05aa3907bd32ca8b81', NULL, NULL, ' 作家出版社 ', ' 2006-3 ', '8.0', '三个生命的交逢，灵魅清冷', 'https://img1.doubanio.com/view/subject/m/public/s1513548.jpg');
INSERT INTO `book_info_class` VALUES ('3eac81b921354ae18959f0f32ada4955', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '618290cacd664f3788dbe8894ec91033', NULL, NULL, ' 新世界出版社 ', ' 2006-9 ', '8.1', NULL, 'https://img1.doubanio.com/view/subject/m/public/s4596329.jpg');
INSERT INTO `book_info_class` VALUES ('3ecdcabb3946450abb2cde268adb097a', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'db871b69a7ac4c0d95106158a58f2985', NULL, NULL, ' 中信出版集团 ', ' 2017-2 ', '8.4', '人类面临的新议题', 'https://img3.doubanio.com/view/subject/m/public/s29287103.jpg');
INSERT INTO `book_info_class` VALUES ('4131cf2011de4a268321b99bedf7f12f', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '4c9b663dcb5645ad99e85622c611aa78', NULL, NULL, ' 四川科学技术出版社 ', ' 2005-6 ', '8.7', '量子之外，没有真相', 'https://img3.doubanio.com/view/subject/m/public/s26040205.jpg');
INSERT INTO `book_info_class` VALUES ('422b690ecb3d4598ba45c0f2873f0029', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '18d762b11dad45948b82c5e8190994e6', NULL, NULL, ' 上海译文出版社 ', ' 2003-4 ', '8.1', '背负诅咒的少年，平行世界中的奥德赛', 'https://img3.doubanio.com/view/subject/m/public/s1094940.jpg');
INSERT INTO `book_info_class` VALUES ('429cfcf1a5a04c8498ff1578213b4e64', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '833821c91e4947e5930fa9e2ece55f5e', NULL, NULL, ' 上海译文出版社 ', ' 2010-8 ', '9.0', '人生在世，永远也不该演戏作假', 'https://img3.doubanio.com/view/subject/m/public/s4468484.jpg');
INSERT INTO `book_info_class` VALUES ('44754d70dd814c7ab0bb6932e70a1ae2', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '50dc07043c174b73add3a65d6f7d61e4', NULL, NULL, ' 中信出版社 ', ' 2014-11 ', '9.1', '跟着人类一同走过十万年', 'https://img3.doubanio.com/view/subject/m/public/s27814883.jpg');
INSERT INTO `book_info_class` VALUES ('462c2ac960504a26b544e539c8ae5bb2', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '6b9ef0fcc6ea4680b298886622fd09d9', NULL, NULL, ' 北京联合出版公司 ', ' 2018-1 ', '9.2', '以血书写的文学', 'https://img3.doubanio.com/view/subject/m/public/s29651121.jpg');
INSERT INTO `book_info_class` VALUES ('474b47668ecf462e9430672b7a861f6b', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'dd14266c3ef74b409431a4e0626daef8', NULL, NULL, ' 上海人民出版社 ', ' 2000-08 ', '9.1', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1817027.jpg');
INSERT INTO `book_info_class` VALUES ('497f8f9b53b046c7ac16f47e771b8c6d', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '73ac2ccf4b0e4d31871ce05c088989e6', NULL, NULL, ' 南海出版公司 ', ' 2009-3-1 ', '8.6', '你自己就是最大的宝藏', 'https://img1.doubanio.com/view/subject/m/public/s3668327.jpg');
INSERT INTO `book_info_class` VALUES ('4b30a73a910d4667b3f2a06340ffb92a', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'b0a2672f3e5c4e7d8b5752f155bb86df', NULL, NULL, '', ' 2009-6 ', '8.6', '公民养成手册', 'https://img1.doubanio.com/view/subject/m/public/s4146437.jpg');
INSERT INTO `book_info_class` VALUES ('4c35f8764d18481f976f4aaa40a12231', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '3646bc37c2004533b02a1cb91a5b3f74', NULL, NULL, ' 北京十月文艺出版社 ', ' 2007-6 ', '8.8', '哀而不伤', 'https://img3.doubanio.com/view/subject/m/public/s2393243.jpg');
INSERT INTO `book_info_class` VALUES ('4c6402b3288540a380c7de84fe818cb6', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '64ca7be46f6b4ad9bd6be13b87a2523f', NULL, NULL, ' 译林出版社 ', ' 2002-9 ', '8.4', '你听说过鹦鹉螺号吗？', 'https://img3.doubanio.com/view/subject/m/public/s1817666.jpg');
INSERT INTO `book_info_class` VALUES ('4d1a91e36bf2479991adb817def68bc7', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '01a2d02d741642ad912296bff9317860', NULL, NULL, ' 世界图书出版公司 ', ' 2000-09 ', '8.2', '人穷穷观念，人富钱生钱', 'https://img3.doubanio.com/view/subject/m/public/s1429010.jpg');
INSERT INTO `book_info_class` VALUES ('4d5ad70d766f454d8dc7cac3d4550493', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, 'b03c564191b44ebba5b81b02aef8d68a', NULL, NULL, ' 南海出版公司 ', ' 2011-9 ', '8.4', NULL, 'https://img3.doubanio.com/view/subject/m/public/s6942170.jpg');
INSERT INTO `book_info_class` VALUES ('4df33fe8bfc1436f9367779f853dbcc3', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '8e510675dd1c40488e802e3e2de9bed5', NULL, NULL, ' 上海译文出版社 ', ' 2002-12 ', '8.6', '交叉平行蒙太奇', 'https://img1.doubanio.com/view/subject/m/public/s1801057.jpg');
INSERT INTO `book_info_class` VALUES ('4e63c9779f974824b5f2ca3956383483', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'ec1a3b71d5c8429d9cb373f2495895c4', NULL, NULL, ' 现代出版社 ', ' 2011-1 ', '8.4', '现实不如梦中的圆满', 'https://img3.doubanio.com/view/subject/m/public/s4599550.jpg');
INSERT INTO `book_info_class` VALUES ('5036702cf621482ca707cf0895d51975', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'bf3b72372df14f16b76abf0e071b1818', NULL, NULL, ' 广州出版社 花城出版社 ', ' 2008-3 ', '8.8', '武侠的解构，流氓的狂欢', 'https://img3.doubanio.com/view/subject/m/public/s3134040.jpg');
INSERT INTO `book_info_class` VALUES ('50e3e720b9ae4fad9bd0f98393a953f0', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'a4a196e7070d496b80c59098e22355e9', NULL, NULL, ' 花城出版社 ', ' 1999-3 ', '8.8', '能把性爱写得如此坦荡的，大概只有王二了', 'https://img3.doubanio.com/view/subject/m/public/s1076372.jpg');
INSERT INTO `book_info_class` VALUES ('50f64b10c78a49d4bdadeade96d7053a', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'c5c9c404e38040efa9ee4d76b7e2576a', NULL, NULL, '', ' 2001 ', '9.1', '一部简明的“中国政治制度史”', 'https://img3.doubanio.com/view/subject/m/public/s1319205.jpg');
INSERT INTO `book_info_class` VALUES ('5302ae51db4d40e8b0c8977905cbf146', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '9acac1e69b1b4cc8915765d2cdc37fe1', NULL, NULL, ' 人民文学出版社 ', ' 2004-06 ', '8.3', '梦，就像黛西家的那一缕绿光', 'https://img3.doubanio.com/view/subject/m/public/s1005875.jpg');
INSERT INTO `book_info_class` VALUES ('540cbd62939f47498178d360e963ad63', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '0236414215b44c0caf85cf3e2fdd220c', NULL, NULL, ' 人民文学出版社 ', ' 2003-01 ', '8.6', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1070937.jpg');
INSERT INTO `book_info_class` VALUES ('55239b1dbf3a4c75b9b72a8a5d3af3d4', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '6f4c4a6fc1384c17a85ecf77e1504f81', NULL, NULL, ' 作家出版社 ', ' 2007-9 ', '8.1', NULL, 'https://img1.doubanio.com/view/subject/m/public/s2742719.jpg');
INSERT INTO `book_info_class` VALUES ('5548abc728d946448413fc67e1e8b61a', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '7dba849028844869881cf10c3891dc06', NULL, NULL, ' 浙江文艺出版社 ', ' 2017-1-1 ', '8.8', '满地都是六便士，他却抬头看见了月亮', 'https://img1.doubanio.com/view/subject/m/public/s29634528.jpg');
INSERT INTO `book_info_class` VALUES ('57b2574095674157ab16b5a7b1197a70', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '348856008ebc4dbcb86c40bfab2c45f2', NULL, NULL, ' 花城出版社 ', ' 1997-3 ', '8.4', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1077099.jpg');
INSERT INTO `book_info_class` VALUES ('57c54b4bad634136b47049576fd59d44', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '5541fdd94d6d4bfc83c2d40bd62ba943', NULL, NULL, ' 作家出版社 ', ' 2011-10 ', '8.8', '翻手为苍凉，覆手为繁华', 'https://img3.doubanio.com/view/subject/m/public/s6987353.jpg');
INSERT INTO `book_info_class` VALUES ('584631207f1f48f9bcec87c8cf9e25b6', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'e8c9a20a24f54270a6c8594e33cbef84', NULL, NULL, ' 长江文艺出版社 ', ' 2010-3 ', '8.4', '只言片语的温暖', 'https://img3.doubanio.com/view/subject/m/public/s4219471.jpg');
INSERT INTO `book_info_class` VALUES ('587e4c4cb9b041549176fe765189a7e3', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '4ca685deed054a67a349fb0a3419af91', NULL, NULL, ' 吉林文史出版社 ', ' 2007-1 ', '8.4', '成熟的心智通向更完善的自我', 'https://img3.doubanio.com/view/subject/m/public/s2144391.jpg');
INSERT INTO `book_info_class` VALUES ('5992eb4bcbe2412e8982e9cd4c50dd06', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '4aae0b1e4a3f4035af55caffd0fc05fb', NULL, NULL, '', ' 2009-10 ', '8.7', '不必追', 'https://img1.doubanio.com/view/subject/m/public/s3984108.jpg');
INSERT INTO `book_info_class` VALUES ('59a4d24d950a481080a9fa1531eefe5f', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '4161ccee67554ce8bd46c5c2f89393d8', NULL, NULL, ' 中国发展出版社 ', ' 2008-1 ', '8.3', '西方世界最持久的人文畅销书', 'https://img3.doubanio.com/view/subject/m/public/s27266511.jpg');
INSERT INTO `book_info_class` VALUES ('5aae73b800e54f55ab35dccf7370b890', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'b7563506bbf8448194c49760d94e2fbe', NULL, NULL, ' 上海译文出版社 ', ' 2006-8 ', '8.4', '另一种生活', 'https://img1.doubanio.com/view/subject/m/public/s1999119.jpg');
INSERT INTO `book_info_class` VALUES ('5b34e703705a4512ba4ed74330dba7f6', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'f652cc4976644f46960c507c813273cc', NULL, NULL, ' 文化发展出版社(原印刷工业出版社) ', ' 2012-8 ', '8.3', '要么瘦，要么死', 'https://img3.doubanio.com/view/subject/m/public/s10685385.jpg');
INSERT INTO `book_info_class` VALUES ('5bbd3dd5d13040ec9faafa3ab415769e', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '378028c83e524513a58dd8e81b6fb4f7', NULL, NULL, ' 广西师范大学出版社 ', ' 2009-10-1 ', '8.1', '作为一种美学的孤独', 'https://img3.doubanio.com/view/subject/m/public/s4075572.jpg');
INSERT INTO `book_info_class` VALUES ('5cce47afebe74d45bbe8eaea10dfc644', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '4d89d054f1454310a0ac8e3deb4ad975', NULL, NULL, ' 南海出版公司 ', ' 1998-9 ', '8.7', '余华的悲凉，都在那一碗炒猪肝里了', 'https://img3.doubanio.com/view/subject/m/public/s1074291.jpg');
INSERT INTO `book_info_class` VALUES ('5e609e98eab84b83a0ea2809d09d02a5', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '1b89a452a2ab4455a41145ce7435ef7c', NULL, NULL, ' 皇冠出版社 ', ' 1976 ', '9.0', '关于漂泊的一切', 'https://img3.doubanio.com/view/subject/m/public/s3563113.jpg');
INSERT INTO `book_info_class` VALUES ('600a14eba7f640639f41f8b2e4c5045e', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '493f1cbb03204f478d4e3143636b2282', NULL, NULL, ' 人民文学出版社 ', ' 1982-6 ', '8.3', '潜藏于残缺下的美与崇高', 'https://img3.doubanio.com/view/subject/m/public/s4493741.jpg');
INSERT INTO `book_info_class` VALUES ('614140918e1c4119a687c5471e3bc5ff', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'd698911d33aa4385911627a563e57470', NULL, NULL, ' 上海世纪出版集团 ', ' 2006-4-1 ', '8.8', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1738643.jpg');
INSERT INTO `book_info_class` VALUES ('61b8af0b58e74ee09dfcdae1d05e8747', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, 'bec231b8d98c406b8d1cd9f64852f1e7', NULL, NULL, '花城出版社 ', ' 1997-3-1 ', '8.5', '一段姻缘，需要一座城的倾覆来成全', 'https://img3.doubanio.com/view/subject/m/public/s1077102.jpg');
INSERT INTO `book_info_class` VALUES ('61c726bf68cc4fefbf0ad788471be4b1', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '3cd1052b45cb4968b0178f2a71b7731d', NULL, NULL, ' 人民文学出版社 ', ' 2017-4 ', '9.0', NULL, 'https://img3.doubanio.com/view/subject/m/public/s29376146.jpg');
INSERT INTO `book_info_class` VALUES ('62f8899393704dcdbed7644f62122659', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, 'ab6df9cc72124c0582d8a945838ade82', NULL, NULL, ' 湖北长江出版集团，长江文艺出版社 ', ' 2008-11 ', '8.6', '刘慈欣获中国科幻银河奖的中短篇小说集', 'https://img3.doubanio.com/view/subject/m/public/s5961934.jpg');
INSERT INTO `book_info_class` VALUES ('63e22f7b9989499ba3794a2b83c84c9e', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '619ba1ed6d7b4f589d1df051ef3aea78', NULL, NULL, ' 四川文艺出版社 ', ' 2015-12 ', '9.0', NULL, 'https://img3.doubanio.com/view/subject/m/public/s29071620.jpg');
INSERT INTO `book_info_class` VALUES ('65e29665194947d687dadbae30d6b45c', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '1a36e49b66d244949c8da0c278ffb0cf', NULL, NULL, ' 哈尔滨出版社 ', ' 2005-6 ', '8.5', '曹七巧就像希克厉，一个扭曲的英雄', 'https://img3.doubanio.com/view/subject/m/public/s2976745.jpg');
INSERT INTO `book_info_class` VALUES ('664023df70ff4e8389859bca8df86a24', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '28a5806f7c46491c9e91813e7ec8e1b1', NULL, NULL, ' 作家出版社 ', ' 2012-8-1 ', '9.3', '生的苦难与伟大', 'https://img3.doubanio.com/view/subject/m/public/s29053580.jpg');
INSERT INTO `book_info_class` VALUES ('665d7f1f55a24b44a69cf0c187002936', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '09f80d77f4314b9aaf6ec30cc9a15f47', NULL, NULL, ' 人民文学出版社 ', ' 2007-10 ', '9.0', NULL, 'https://img1.doubanio.com/view/subject/m/public/s2752367.jpg');
INSERT INTO `book_info_class` VALUES ('667aa7d2a5f6453dac6efdbf9c0d7325', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '5d9eb34a9add4ae491535ad1f450b8ec', NULL, NULL, ' 北岳文艺出版社 ', ' 2002-4 ', '8.6', '如水一般的忧愁与怅惘', 'https://img1.doubanio.com/view/subject/m/public/s1595557.jpg');
INSERT INTO `book_info_class` VALUES ('676e40bf008e48bba60b9eacbac3aebf', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'b2b805fa8fd942628c23903da0569d4f', NULL, NULL, '', ' 2010-10 ', '8.7', NULL, 'https://img1.doubanio.com/view/subject/m/public/s4494379.jpg');
INSERT INTO `book_info_class` VALUES ('6771075bafac4f14a07798c0f72a6a8c', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'bf8766ffb7b64d8c986e2cbcedea65f8', NULL, NULL, ' 北京十月文艺出版社 ', ' 2006-12 ', '8.6', '世钧，我们回不去了', 'https://img1.doubanio.com/view/subject/m/public/s2838737.jpg');
INSERT INTO `book_info_class` VALUES ('697bdf63f2a048afa7b1177199601ec6', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'b2b454f4a9064ebca22304e3f504b680', NULL, NULL, ' 南海出版公司 ', ' 2013-10-1 ', '8.2', '并不是一切都消失在了时间的长河里', 'https://img3.doubanio.com/view/subject/m/public/s27094300.jpg');
INSERT INTO `book_info_class` VALUES ('6a2dc1f4e8d24e3ea0d24d516834aab8', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '901a4e1defbc45c0992f98b152f6bb7d', NULL, NULL, ' 广西师范大学出版社 ', ' 2010-10 ', '8.9', NULL, 'https://img3.doubanio.com/view/subject/m/public/s4526465.jpg');
INSERT INTO `book_info_class` VALUES ('6ad086fbc9d0491f9241cb0cf6641415', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'aa32a52028d14214bd4cef4284493fb1', NULL, NULL, ' 江苏凤凰文艺出版社 ', ' 2015-7 ', '8.2', '莉迪亚死了，可他们还不知道', 'https://img3.doubanio.com/view/subject/m/public/s28109182.jpg');
INSERT INTO `book_info_class` VALUES ('6c3a22d8db3745caa54849628754891c', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '651cbcab30034c82b4ebf7f20325fb57', NULL, NULL, ' 重庆出版社 ', ' 2008-5 ', '9.3', '无边的黑暗森林，比第一部更为恢弘壮丽', 'https://img3.doubanio.com/view/subject/m/public/s3078482.jpg');
INSERT INTO `book_info_class` VALUES ('6cca6de628534fea8bf789306e681c5e', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '670adc0f7cff4f5ba4742f9cd98569b7', NULL, NULL, ' 上海锦绣文章出版社 ', ' 2008-5 ', '8.8', '王小波与李银河的两地书', 'https://img3.doubanio.com/view/subject/m/public/s4661043.jpg');
INSERT INTO `book_info_class` VALUES ('6e67ebe488c042f6b9ba9fda6b37bd71', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '6af59a0657e84d3cb7b8e7608afa5637', NULL, NULL, ' 人民文学出版社 ', ' 2017-1 ', '8.5', '两个女人，50年的友谊和战争', 'https://img1.doubanio.com/view/subject/m/public/s29164777.jpg');
INSERT INTO `book_info_class` VALUES ('6f29a1ee54e442498d2d4433e28196c5', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '044fcee5853c4054ba342b9fa6aafd08', NULL, NULL, ' 人民文学出版社 ', ' 2005-10 ', '8.8', '感情线纷乱的一部。再见邓布利多', 'https://img3.doubanio.com/view/subject/m/public/s1447381.jpg');
INSERT INTO `book_info_class` VALUES ('6fad809136644c519bc058b71ce47bd1', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '57c81fec77c648a9afbd34a22e6c9d7a', NULL, NULL, '', ' 1994-5 ', '9.1', '“有情皆孽，无人不冤”', 'https://img1.doubanio.com/view/subject/m/public/s23632058.jpg');
INSERT INTO `book_info_class` VALUES ('727054fe4bdf46f0842d24062d54ab9a', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '861e6f46c9d4496ab91a4a6d10a97158', NULL, NULL, ' 北方文艺出版社 ', ' 2006-4 ', '8.8', '生活就是个缓慢受锤的过程，至少还可以特立独行', 'https://img3.doubanio.com/view/subject/m/public/s1670642.jpg');
INSERT INTO `book_info_class` VALUES ('72e1eb31700449969a42732dd77c4543', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '54f00f5906e14e2d927897d642aad7e1', NULL, NULL, ' 吉林出版集团有限责任公司 ', '', '8.3', '令人无从怜悯的绝望', 'https://img3.doubanio.com/view/subject/m/public/s6100756.jpg');
INSERT INTO `book_info_class` VALUES ('73400fd57f8b45249d0a41284703bcc8', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '9939d54eb6444ea382ec19719787d98d', NULL, NULL, ' 广西师范大学出版社 ', ' 2010-10 ', '8.0', '梁文道的私密日记', 'https://img1.doubanio.com/view/subject/m/public/s3705488.jpg');
INSERT INTO `book_info_class` VALUES ('752acdc65eaa47b2ae8d3ca3413f8f66', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '4fa459716ace47f68b9ced4bd0a352a0', NULL, NULL, ' 南海出版公司 ', ' 2009-6 ', '8.4', '无缘由的恨，冰冷彻骨', 'https://img3.doubanio.com/view/subject/m/public/s3814606.jpg');
INSERT INTO `book_info_class` VALUES ('7602356f832a4b40b908ef3371120a31', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '8cdedc3a7471474184d070d0a978f436', NULL, NULL, ' 人民文学出版社 ', ' 2004-8 ', '8.8', '取经之路就在脚下', 'https://img3.doubanio.com/view/subject/m/public/s1627374.jpg');
INSERT INTO `book_info_class` VALUES ('7666052a8a5b4c3ab212a90b0074cfdf', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '9f4c92a71ff94ceca6e200002c82e528', NULL, NULL, ' 上海译文出版社 ', ' 2008-4 ', '8.8', NULL, 'https://img3.doubanio.com/view/subject/m/public/s2990934.jpg');
INSERT INTO `book_info_class` VALUES ('77ee32e717f54ba5a8da012e47281ece', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'ceca5248914948d58b9deed7c245bed4', NULL, NULL, ' 中信出版社 浙江人民出版社 ', ' 2007-1 ', '8.8', '这是一个最好的时代，也是一个最坏的时代', 'https://img3.doubanio.com/view/subject/m/public/s10431840.jpg');
INSERT INTO `book_info_class` VALUES ('7b52e42db6ef4ac1a05e94a3e90683ce', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '250cfa0c4952441992449feb7d5795c7', NULL, NULL, ' 上海译文出版社 ', ' 2002-6 ', '8.3', '深入村上春树的心灵腹地', 'https://img3.doubanio.com/view/subject/m/public/s1231290.jpg');
INSERT INTO `book_info_class` VALUES ('7b5abedc22c64402a4319baf0b497476', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '4e71e06fbc14401f850960225e80d1a8', NULL, NULL, ' 浙江人民美术出版社 ', ' 2007-11 ', '9.5', '热血，梦想，希望', 'https://img1.doubanio.com/view/subject/m/public/s1492518.jpg');
INSERT INTO `book_info_class` VALUES ('7cdba0225e33414e8b4dfd9e39f1b3ad', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'f78b516240674997a6c13accaeb0ee63', NULL, NULL, ' 人民文学出版社 ', ' 1998-05 ', '9.2', '是非成败转头空', 'https://img3.doubanio.com/view/subject/m/public/s1076932.jpg');
INSERT INTO `book_info_class` VALUES ('7e9fadb95bf244b78d47d5bd19429b3e', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, 'ba79986535bd4943a75416de5836e0d3', NULL, NULL, '', ' 1994-5 ', '9.0', '武侠的壳，政治斗争的核', 'https://img3.doubanio.com/view/subject/m/public/s2157335.jpg');
INSERT INTO `book_info_class` VALUES ('7eb277b551e7413a9011cfe20e52380d', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '2a6a886040584f52919de4706ab185ff', NULL, NULL, '', ' 2003-7 ', '8.7', '平淡，坚忍，温情', 'https://img3.doubanio.com/view/subject/m/public/s1015872.jpg');
INSERT INTO `book_info_class` VALUES ('7edc1ecffced4c9086e518bf081b43fb', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, 'c488754d968a433abd7ddda50b522dc6', NULL, NULL, ' 中国青年出版社 ', ' 1997-10 ', '9.1', '沉默是沉默者的通行证', 'https://img1.doubanio.com/view/subject/m/public/s1447349.jpg');
INSERT INTO `book_info_class` VALUES ('8124f0d1de4b4449858e66d521a74e5b', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '7b9d8e98f48444f8b2d6b84e05cacb33', NULL, NULL, ' 上海译文出版社 ', ' 2008-7 ', '8.7', NULL, 'https://img1.doubanio.com/view/subject/m/public/s3435158.jpg');
INSERT INTO `book_info_class` VALUES ('813eef8f5c424a0783e9faf8713315ce', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '0a03db122b094f63934dc11c5d86e6d9', NULL, NULL, ' 北京十月文艺出版社 ', ' 2010-4-1 ', '9.3', '栗树荫下，我出卖你，你出卖我', 'https://img1.doubanio.com/view/subject/m/public/s4371408.jpg');
INSERT INTO `book_info_class` VALUES ('8394a47a6fa6490b8c35c841ede6f057', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '1b34c1a6c99d459787a62c87faf9c008', NULL, NULL, '', ' 2004-12-1 ', '8.4', '独居生活之乐', 'https://img3.doubanio.com/view/subject/m/public/s7059163.jpg');
INSERT INTO `book_info_class` VALUES ('84eaae0573f2481394e9b01f4d32c4c1', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '10c8973ff37f488b9d2249e8d52c945b', NULL, NULL, ' 广西民族出版社 ', ' 2002-1 ', '8.0', '最早的荒野求生', 'https://img3.doubanio.com/view/subject/m/public/s1242786.jpg');
INSERT INTO `book_info_class` VALUES ('84f835d659c6446eac3febbb3366698b', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'd9ceec3f08ee4034984094127ac979b2', NULL, NULL, ' 中信出版社 ', ' 2011-10-24 ', '8.7', '完美主义者的最高形态', 'https://img3.doubanio.com/view/subject/m/public/s6974202.jpg');
INSERT INTO `book_info_class` VALUES ('856b87b2c70b436b9cd3c46acf1f2dba', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '6b9eac1659b1437aa67adb9f6c3af673', NULL, NULL, ' 人民文学出版社 ', '', '8.9', '新文学的第一声呐喊', 'https://img3.doubanio.com/view/subject/m/public/s4696893.jpg');
INSERT INTO `book_info_class` VALUES ('86131ba8358047ba9704301a3a05532d', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '91c0c3ea387b4522a17e23504755c947', NULL, NULL, ' 上海译文出版社 ', ' 2007-7 ', '8.4', NULL, 'https://img3.doubanio.com/view/subject/m/public/s29237651.jpg');
INSERT INTO `book_info_class` VALUES ('89fbac0d5dbf4302afc0404aa12b91fc', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '9c0872e92afa4f43bea816fa0ba2f588', NULL, NULL, ' 人民文学出版社 ', ' 2006-5 ', '8.9', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1772249.jpg');
INSERT INTO `book_info_class` VALUES ('8af5b324152f4962a1115a3945ec67d1', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'ac5335ba09f645f59f4ceb53b6838eb9', NULL, NULL, ' 南海出版公司 ', ' 2009-1 ', '8.2', '村上同志告诉我们，身体是革命的本钱', 'https://img3.doubanio.com/view/subject/m/public/s3507580.jpg');
INSERT INTO `book_info_class` VALUES ('8c2fee506e7f40f99b829a5ce4e918b7', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '64dd22c90992490d895564690d6271cf', NULL, NULL, ' 新星出版社 ', ' 2008-9 ', '8.3', '一桩占星术连续杀人案件', 'https://img1.doubanio.com/view/subject/m/public/s3801839.jpg');
INSERT INTO `book_info_class` VALUES ('8da84f36a58a42068f9a70fd678f78d4', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'a8a365f751984c71b2b0694b1b42c141', NULL, NULL, ' 南海出版公司 ', ' 2008-9 ', '8.9', '数学好是一种极致的浪漫', 'https://img3.doubanio.com/view/subject/m/public/s3254244.jpg');
INSERT INTO `book_info_class` VALUES ('9007edde843149608dbc37bb23427c82', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '3636a3214c6c4dbd86cdac66db656ef8', NULL, NULL, ' 北京联合出版公司 ', ' 2013-9-1 ', '8.1', '关于爱和信念的旅行', 'https://img3.doubanio.com/view/subject/m/public/s26936721.jpg');
INSERT INTO `book_info_class` VALUES ('9076c5cdc66348df864365ecf3a7ac1b', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'cff67b8b72824b0f8c176d2f64aea9e2', NULL, NULL, '', ' 2005-8 ', '8.5', '镇上有两个哑巴，他们总是在一起。', 'https://img1.doubanio.com/view/subject/m/public/s1436379.jpg');
INSERT INTO `book_info_class` VALUES ('909e69a8bbaa47c29dcfd351204f9baf', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '120c31c813c24461a57bbeeb030317d3', NULL, NULL, ' 民族出版社 ', ' 2006-6 ', '8.1', '现世太苦，不如穿越回去从头来过', 'https://img3.doubanio.com/view/subject/m/public/s1681146.jpg');
INSERT INTO `book_info_class` VALUES ('9136c97041fa4d8299740128f271239a', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '63b2bfc155cc49a5ae39c241d71a3d19', NULL, NULL, ' 光明日报出版社 ', ' 2001-4 ', '8.4', '猴子还是那个猴子，世界早已不是原来的世界', 'https://img3.doubanio.com/view/subject/m/public/s9026255.jpg');
INSERT INTO `book_info_class` VALUES ('91c645b9c5014b46904f363af2e64581', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '3f901b1f555c497a9ad205ff366dd0d5', NULL, NULL, '', ' 2002-5 ', '8.5', NULL, 'https://img3.doubanio.com/view/subject/m/public/s3186863.jpg');
INSERT INTO `book_info_class` VALUES ('92cd1bcf415e42b594b51dea5374bbe9', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '929048b0ab634398af897c53ca24c7fc', NULL, NULL, ' 广西师范大学出版社 ', ' 2005-1 ', '8.1', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1311084.jpg');
INSERT INTO `book_info_class` VALUES ('93fe5f4d317549c081fbe13772445d6c', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '54f61d33b061484b888d2c12e2f9dcab', NULL, NULL, ' 长江文艺出版社 ', ' 2009-3 ', '8.7', '一句胜过千年', 'https://img1.doubanio.com/view/subject/m/public/s6916838.jpg');
INSERT INTO `book_info_class` VALUES ('974eabbc3d4547ae8248158340f60190', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '4bb36456a4f041699f2a260bea93de38', NULL, NULL, ' 人民文学出版社 ', ' 2006-7 ', '9.1', '希望让人自由，电影实在太有名', 'https://img3.doubanio.com/view/subject/m/public/s4007145.jpg');
INSERT INTO `book_info_class` VALUES ('975e7b9392ca4ac2b344c54f25d38463', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'ea4da109dbaf49b699ad938d083db3ef', NULL, NULL, ' 广西师范大学出版社 ', ' 2011-11-25 ', '8.2', '欧洲，为什么老是抢第一？', 'https://img3.doubanio.com/view/subject/m/public/s4542951.jpg');
INSERT INTO `book_info_class` VALUES ('99905373db304591b4c71c3263ab14b4', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, 'e0f0c67761244209891b16598b980c1c', NULL, NULL, ' 长江文艺出版社 ', ' 2008-3 ', '8.3', '真正的片段式写作', 'https://img3.doubanio.com/view/subject/m/public/s2998096.jpg');
INSERT INTO `book_info_class` VALUES ('99ce121db08c4e1a9367c014f1e3c4ff', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '3e1f0e0565404d8490c19c9c307d80a8', NULL, NULL, ' 上海译文出版社 ', ' 1999-10 ', '8.4', '正是悲壮赋予生活以意义', 'https://img3.doubanio.com/view/subject/m/public/s1050021.jpg');
INSERT INTO `book_info_class` VALUES ('9a759d7a29fd41f1ab218caa4346fb7d', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, 'bd82e2b5ee0a4315b366c0b38d0b4070', NULL, NULL, ' 北京十月文艺出版社 ', ' 1988-12-1 ', '8.1', '时代烙印鲜明的民族史诗', 'https://img3.doubanio.com/view/subject/m/public/s1790771.jpg');
INSERT INTO `book_info_class` VALUES ('9ace4bd8a9a14e7685834bd3ee32d7be', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'abca1d7911134cbc82413f5021064a01', NULL, NULL, ' 人民文学出版社 ', ' 1997-08 ', '9.2', '远不是童话那么简单', 'https://img3.doubanio.com/view/subject/m/public/s1034062.jpg');
INSERT INTO `book_info_class` VALUES ('9ba12ef344164451b1f0cd802ccd6640', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '3875f61e776d4fc19149eb0fd2e13efb', NULL, NULL, ' 人民文学出版社 ', ' 1994-11 ', '9.0', '许多隐晦', 'https://img3.doubanio.com/view/subject/m/public/s1134341.jpg');
INSERT INTO `book_info_class` VALUES ('9c5683cf96564e2498dfd305d3cb2558', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'af20e2af18c6403dbe39de0714db63ee', NULL, NULL, ' 安徽文艺出版社 ', ' 2006 ', '8.1', '盗墓祖师名不虚传', 'https://img3.doubanio.com/view/subject/m/public/s2001786.jpg');
INSERT INTO `book_info_class` VALUES ('9d23fba9d47d41dc81a57dd61fcf6090', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'b07d30ce1ae842829992bdb39a869507', NULL, NULL, ' 人民文学出版社 ', ' 1999-01-01 ', '8.4', '近乎暴虐的爱与恨，中文译名后无来者', 'https://img3.doubanio.com/view/subject/m/public/s1095383.jpg');
INSERT INTO `book_info_class` VALUES ('9d6249c004ad424bb59338fc18be217b', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '1daedfd5abf44f3eaa2a3f65fd4ab9ef', NULL, NULL, ' 哈尔滨出版社 ', ' 2003-08 ', '8.8', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1099483.jpg');
INSERT INTO `book_info_class` VALUES ('9fe72150857c4ce9b9682976a4908397', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '042840c6cbcf46fb8799ea0fb963818e', NULL, NULL, ' 作家出版社 ', ' 2008-4 ', '8.6', NULL, 'https://img1.doubanio.com/view/subject/m/public/s4045138.jpg');
INSERT INTO `book_info_class` VALUES ('a016d11459b5460782627ca24f7e8c0a', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'e9b9b988b9044b3bb5b29212f3b6e1da', NULL, NULL, ' 人民文学出版社 ', ' 2004-1 ', '8.6', '知识分子的命运浮沉', 'https://img1.doubanio.com/view/subject/m/public/s1108667.jpg');
INSERT INTO `book_info_class` VALUES ('a173307fbbe640f397c0bb914c36af14', 'sun-0', 'sun-0', '2019-05-06 08:27:24', '2019-05-06 08:27:24', '0', NULL, '716a9265e589434f963c4da3dde5a13b', NULL, NULL, '双生法术出版社', '2012-09', '0.0', NULL, NULL);
INSERT INTO `book_info_class` VALUES ('a184f24b41e04664be551fdd40b72111', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '6271c6a88c44446eb720670b29351990', NULL, NULL, ' 中国青年出版社 ', ' 2003-7 ', '9.0', '长亭外，古道边，芳草碧连天', 'https://img1.doubanio.com/view/subject/m/public/s2654869.jpg');
INSERT INTO `book_info_class` VALUES ('a1e37cbbf5fb4ef588db9b9b9e59cac9', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '5b2aad95b35e4311bab466859b13b5a1', NULL, NULL, ' 广西师范大学出版社 ', ' 2011-6 ', '8.6', NULL, 'https://img3.doubanio.com/view/subject/m/public/s6776106.jpg');
INSERT INTO `book_info_class` VALUES ('a225f9143ef94799b36f67cbe69d50e0', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'a2a229c46f5845e48bf131856836f684', NULL, NULL, ' 花山文艺出版社 ', ' 2007-1 ', '8.2', '那些年错过的大雨', 'https://img3.doubanio.com/view/subject/m/public/s1982025.jpg');
INSERT INTO `book_info_class` VALUES ('a2e41928c9854be3b30e3c74df6ec92d', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '68d92f0fca85420e8c60561d60507861', NULL, NULL, ' 上海译文出版社 ', ' 2005-7 ', '8.1', '我已经老了，你呢？', 'https://img1.doubanio.com/view/subject/m/public/s1444578.jpg');
INSERT INTO `book_info_class` VALUES ('a3d53219adc04bd4b40972f4fe3d5ed2', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '553d2fd709084e9d92f02e89eda55cae', NULL, NULL, ' 上海译文出版社 ', ' 2004-5 ', '8.4', '此处的生活唯有残酷', 'https://img3.doubanio.com/view/subject/m/public/s1069535.jpg');
INSERT INTO `book_info_class` VALUES ('a43777553d2b484d9f950857a5bc3d30', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'c9bd2cb6737d4407811c5600bf76e934', NULL, NULL, ' 南海出版公司 ', ' 2014-5 ', '8.5', '一碗精心熬制的东野牌鸡汤，拒绝很难', 'https://img3.doubanio.com/view/subject/m/public/s27264181.jpg');
INSERT INTO `book_info_class` VALUES ('a4460bc6b2fe42eea9d532d1f311fa39', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '2acbb511901a4520856f8f152f8d2744', NULL, NULL, ' 上海人民出版社 ', ' 2004-2 ', '8.2', '一切畅销的因素都有了', 'https://img3.doubanio.com/view/subject/m/public/s1513425.jpg');
INSERT INTO `book_info_class` VALUES ('a84c5f7d79684254b4cb9af6cb0c1e6b', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '92bc03aa53de431ba4ff27a776642a5a', NULL, NULL, ' 译林出版社 ', ' 2005-05-01 ', '8.3', '文艺青年的爱情地标', 'https://img3.doubanio.com/view/subject/m/public/s1326174.jpg');
INSERT INTO `book_info_class` VALUES ('ad521ebe29a5487db42a4c636c6be9c0', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '977db49277e34e558e38038845658b83', NULL, NULL, ' 人民文学出版社 ', ' 2007-4 ', '8.1', '在时间的缝隙中穿行，然后相遇', 'https://img3.doubanio.com/view/subject/m/public/s2375756.jpg');
INSERT INTO `book_info_class` VALUES ('aee632c417e941ee85b2bbb7f66e3b77', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, 'f57b87b5024444a1bbfd0ad5570a81fb', NULL, NULL, ' 人民文学出版社 ', ' 1992-6 ', '8.9', '现实主义与浪漫主义的至高杰作', 'https://img3.doubanio.com/view/subject/m/public/s1148102.jpg');
INSERT INTO `book_info_class` VALUES ('af8cf51064ab4b639f6326d73d7d283b', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '5457c591b57f4b3ea64434345c7b4bf0', NULL, NULL, ' 上海文艺出版社 ', ' 2005-8 ', '8.3', '历史苦难中的个人灾变', 'https://img3.doubanio.com/view/subject/m/public/s1427312.jpg');
INSERT INTO `book_info_class` VALUES ('b0c4acaeb4a94ebf8f891e0db4c06ee8', 'sun-0', 'sun-0', '2019-05-05 23:47:27', '2019-05-05 23:47:27', '0', NULL, '01a2d02d741642ad912296bff9317860', NULL, NULL, '译林出版社', '2010-09', '0.0', NULL, NULL);
INSERT INTO `book_info_class` VALUES ('b451eafa6e224d25af431c41020562bd', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '4505a061f6a043f0aae69e9d67a18e4a', NULL, NULL, ' 人民文学出版社 ', ' 2000-9 ', '9.0', '小天狼星布莱克', 'https://img3.doubanio.com/view/subject/m/public/s1074376.jpg');
INSERT INTO `book_info_class` VALUES ('b511aef3318e4fc0984832c4cf06db53', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'f1ab919593e64c2db9303516aa29a500', NULL, NULL, ' 中央编译出版社 ', ' 2011-5-1 ', '8.2', '群氓心理剖析', 'https://img3.doubanio.com/view/subject/m/public/s1988393.jpg');
INSERT INTO `book_info_class` VALUES ('b65534f6e0ab4e3fb203628afa4abae2', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '84697a4db5364b6c9e89c6c3d829c179', NULL, NULL, ' 中国友谊出版公司 ', ' 2007-1 ', '8.3', '想象奇诡的大型RPG游戏', 'https://img3.doubanio.com/view/subject/m/public/s4442295.jpg');
INSERT INTO `book_info_class` VALUES ('b87f2b825729411b9f4ce9ffe5c8f535', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '3d8864e703254249a71c2bf383ae9594', NULL, NULL, ' 上海译文出版社 ', ' 2003-7 ', '8.5', '朝向媚俗的一次伟大的进军', 'https://img1.doubanio.com/view/subject/m/public/s1091698.jpg');
INSERT INTO `book_info_class` VALUES ('b8aacd4a57a244fe8227fcdce679470f', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, 'a4e59780e0c04bb2b62c832823719d6e', NULL, NULL, ' 南海出版公司 ', ' 2008-9 ', '9.1', '暗夜独行的残破灵魂，爱与恶本就难分难舍', 'https://img3.doubanio.com/view/subject/m/public/s4610502.jpg');
INSERT INTO `book_info_class` VALUES ('b9f49632537249d8ae42c728f5e1928a', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, 'd6f576b7621e400dae00d4f0f157c2dd', NULL, NULL, ' 人民文学出版社 ', ' 2000-9 ', '9.0', '羽加迪姆勒维奥萨！', 'https://img3.doubanio.com/view/subject/m/public/s1990480.jpg');
INSERT INTO `book_info_class` VALUES ('bbb8f3eca3f4434cb4208aa94bb1d7b4', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, 'f12c0693c342495c86f23bdcfdef4a8f', NULL, NULL, ' 人民文学出版社 ', ' 2006-5 ', '9.0', '谋杀诡计惊人，波洛的抉择耐人寻味', 'https://img1.doubanio.com/view/subject/m/public/s1765799.jpg');
INSERT INTO `book_info_class` VALUES ('bd240721e0e24331b671ec7a33707614', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '61a76c15deee4df190c0fada9f58b9a3', NULL, NULL, ' 北京燕山出版社 ', ' 2007-6 ', '8.1', '资产阶级的道貌岸然', 'https://img3.doubanio.com/view/subject/m/public/s1469280.jpg');
INSERT INTO `book_info_class` VALUES ('bdc06a62d4d742898c670ecd9c9ca7c8', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'd23546e88edc4486a98224fd3c5e36bb', NULL, NULL, ' 花城出版社 ', ' 1997-5 ', '8.4', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1072540.jpg');
INSERT INTO `book_info_class` VALUES ('be386baa420c4bd5a110da6b57b8a05e', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'c398754052384c98832d38b3ee90a6dd', NULL, NULL, ' 山东人民出版社 ', ' 2006-11 ', '8.6', '日常生活的无限可能性', 'https://img3.doubanio.com/view/subject/m/public/s2165932.jpg');
INSERT INTO `book_info_class` VALUES ('be418fca47ef41ce9f57678739ba74cb', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '9d8339ddcfce4c49ab2ac77ab012174c', NULL, NULL, ' 上海人民出版社 ', ' 2006-5 ', '8.9', '为你，千千万万遍', 'https://img3.doubanio.com/view/subject/m/public/s1727290.jpg');
INSERT INTO `book_info_class` VALUES ('beaf14dcb8f941aa954d5ac3f568deff', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'e0b2a7411a734e7a8aa5cfa0979c783c', NULL, NULL, ' 长江文艺出版社 ', ' 2007-1 ', '8.2', '两代人的成长与救赎', 'https://img3.doubanio.com/view/subject/m/public/s1994710.jpg');
INSERT INTO `book_info_class` VALUES ('bfd9a7230df44b5fbf8a494e3b95b1d9', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '344ef3b523204e1c9c83bcbdc002506d', NULL, NULL, ' 南海出版公司 ', ' 2012-9-1 ', '9.0', '义无反顾地直达爱情的核心', 'https://img3.doubanio.com/view/subject/m/public/s11284102.jpg');
INSERT INTO `book_info_class` VALUES ('c0137197d9694a6fa43705d43e6fef29', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, 'f0e6b90e052e49ba915d2a4eb94d480e', NULL, NULL, '', ' 2010-1 ', '8.6', '犀利又温柔，穿过胸口隐隐作痛', 'https://img1.doubanio.com/view/subject/m/public/s4243447.jpg');
INSERT INTO `book_info_class` VALUES ('c17dfe5d18ed4abdadb40a0a942ed300', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '90edd5afa1184c9c84a5b29018fbc4d4', NULL, NULL, ' 人民文学出版社 ', ' 1999-05 ', '8.6', '人的心都靠不住，我并不是说人坏，我就是恨人性太弱，太容易变了', 'https://img1.doubanio.com/view/subject/m/public/s23579217.jpg');
INSERT INTO `book_info_class` VALUES ('c2041dd3ae9549a79232800df7bd3790', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '67bb693b53c34d33b633fdf0f6c86e22', NULL, NULL, ' 哈尔滨出版社 ', ' 2004-6 ', '8.9', '淡泊，超脱', 'https://img3.doubanio.com/view/subject/m/public/s1044902.jpg');
INSERT INTO `book_info_class` VALUES ('c21e0c31531c426d9ae0578ba249d4d9', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '06e1174984094e8e968e0d647cb6b6cb', NULL, NULL, ' 中国电影出版社 ', ' 2004-2 ', '8.3', NULL, 'https://img1.doubanio.com/view/subject/m/public/s9853099.jpg');
INSERT INTO `book_info_class` VALUES ('c45c1fd9e06543efaf660a2d2262e491', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, 'd0ec17e8e4ff4e6c8d9ca8d253fea6db', NULL, NULL, ' 上海译文出版社 ', ' 2011-1 ', '9.0', '中国在路上，非虚构写作所能达到的高度', 'https://img1.doubanio.com/view/subject/m/public/s4575849.jpg');
INSERT INTO `book_info_class` VALUES ('c4d924df3c8c484594992c25bfec4431', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'eb0cbef1c5954bd0963b77450e472c78', NULL, NULL, ' 上海文艺出版社 ', ' 2004-8 ', '8.2', NULL, 'https://img3.doubanio.com/view/subject/m/public/s6478105.jpg');
INSERT INTO `book_info_class` VALUES ('c70f00ef710e4781847fb1d4219f6db4', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '3340f719aa134cebaacfc58d8512cb9e', NULL, NULL, ' 广西师范大学出版社 ', ' 2013-1-10 ', '9.2', '木心留给世界的礼物', 'https://img1.doubanio.com/view/subject/m/public/s24611679.jpg');
INSERT INTO `book_info_class` VALUES ('c7b33daf1e1740009f9cfbb569d722f1', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '367b55a58752472e98004f503e03e14f', NULL, NULL, ' 文化艺术出版社 ', ' 2010-6 ', '8.2', '嬉笑怒骂的常识分子', 'https://img1.doubanio.com/view/subject/m/public/s4397779.jpg');
INSERT INTO `book_info_class` VALUES ('cabab9c4a7bd475393b47a5b84955769', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '49ce9e21534d4bc18efd1ae2a60c4f0e', NULL, NULL, ' 重庆出版社 ', ' 2008-1 ', '8.8', '你我不过都是虫子', 'https://img1.doubanio.com/view/subject/m/public/s2768378.jpg');
INSERT INTO `book_info_class` VALUES ('cb9195b4378c4534a0f7535298c0fd73', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '10e2291013aa435f93c80debde5f08c3', NULL, NULL, ' 哈尔滨出版社 ', ' 2003-6 ', '8.9', '沙漠中寻常的生与死', 'https://img3.doubanio.com/view/subject/m/public/s1020454.jpg');
INSERT INTO `book_info_class` VALUES ('cbc98c22d72443b59573e7d5c87fd942', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '4f55d4c7e9a5429ba8481c3f553d0af5', NULL, NULL, ' 武汉大学出版社 ', ' 2010-2 ', '8.1', '简称“疯癫与文明”', 'https://img1.doubanio.com/view/subject/m/public/s6340977.jpg');
INSERT INTO `book_info_class` VALUES ('ccb29c056c5040e6af48799ff1adf454', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'cacc66e676fa46b1ac3548bf88a3cd9e', NULL, NULL, ' 北京十月文艺出版社 ', ' 2007-7 ', '8.7', NULL, 'https://img1.doubanio.com/view/subject/m/public/s2563279.jpg');
INSERT INTO `book_info_class` VALUES ('cd8876a1d71d4151a5db51cbe2e24b8f', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '7fc8bb182ccc4e96856c2b8a5f7a7794', NULL, NULL, ' 上海译文出版社 ', ' 2007-3 ', '9.2', '太阳底下并无新事', 'https://img3.doubanio.com/view/subject/m/public/s2347590.jpg');
INSERT INTO `book_info_class` VALUES ('cdc66e5f7145437a831d0781cf0f57db', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'aa32a52028d14214bd4cef4284493fb1', NULL, NULL, '', ' 2009-8 ', '8.6', NULL, 'https://img3.doubanio.com/view/subject/m/public/s3931802.jpg');
INSERT INTO `book_info_class` VALUES ('cdebe9fabca94a3ca1d451aec6b3d9bb', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'd003554b767a4b02b57c694eed1fc4d3', NULL, NULL, ' 花城出版社 ', ' 2008-09 ', '9.2', NULL, 'https://img3.doubanio.com/view/subject/m/public/s3455551.jpg');
INSERT INTO `book_info_class` VALUES ('d07ca53abdbe4335b55cb6547378d0a5', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '5acc59446bf344bb9785655188fc5305', NULL, NULL, ' 外国文学出版社 ', ' 1997-3 ', '8.2', '妓女应当拥有爱情吗？', 'https://img1.doubanio.com/view/subject/m/public/s1008927.jpg');
INSERT INTO `book_info_class` VALUES ('d138f7a02cca4ad5b46d07fc8a0ac456', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '61317f6086ab4cb29e5ec6e9c0d9c4e0', NULL, NULL, ' 江苏凤凰文艺出版社 ', ' 2016-5-1 ', '8.9', '五个家族，一场战争', 'https://img3.doubanio.com/view/subject/m/public/s28668834.jpg');
INSERT INTO `book_info_class` VALUES ('d175e8411e8d4693848694c78da585bc', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '67897baf83074dcd96780750d4eee4a6', NULL, NULL, ' 译林出版社 ', ' 2012-9 ', '9.2', '有一种东西不能遵循从众原则，那就是——人的良心', 'https://img3.doubanio.com/view/subject/m/public/s23128183.jpg');
INSERT INTO `book_info_class` VALUES ('d254980e5aba488cbdc735d769407470', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, 'fc10c21f65e044e5a065d1d94f2396b7', NULL, NULL, ' 南京大学出版社 ', ' 2010-2 ', '8.0', '别被封面骗了', 'https://img3.doubanio.com/view/subject/m/public/s3979661.jpg');
INSERT INTO `book_info_class` VALUES ('d47bd38d6ca8469fbaa87d613ecf2b8c', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, 'c9ceea25ec084861a6afc6c2e7f8dc93', NULL, NULL, '天津人民出版社 ', ' 2015-8 ', '8.7', '呆萌可爱的动物段子手', 'https://img3.doubanio.com/view/subject/m/public/s28369176.jpg');
INSERT INTO `book_info_class` VALUES ('d55235290fe145ee8c48073829bc81cb', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, 'd3999aea5ecd4d10ad693a63057c064a', NULL, NULL, ' 上海书店出版社 ', ' 2003-7 ', '8.7', '哀其不幸，怒其不争', 'https://img3.doubanio.com/view/subject/m/public/s1074811.jpg');
INSERT INTO `book_info_class` VALUES ('d688bb821e954ed1a22bd6877a444481', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'befe3efffd624535aaeb87b9afcc1c1e', NULL, NULL, ' 作家出版社 ', ' 1999-04 ', '8.5', '最平易近人的哲学入门', 'https://img3.doubanio.com/view/subject/m/public/s2153661.jpg');
INSERT INTO `book_info_class` VALUES ('d7981a4c0777470a811eec2843906819', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '7e6b78d178df48c49aa3062ddb3d0ee4', NULL, NULL, ' 上海译文出版社 ', ' 1991-7 ', '8.1', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1300531.jpg');
INSERT INTO `book_info_class` VALUES ('d7e37d06957c444989f2608be8a4fedb', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '5937ca6dffe44f978213b8b1414a3244', NULL, NULL, '', ' 2002-8 ', '8.4', '两条平行线相遇的可能', 'https://img3.doubanio.com/view/subject/m/public/s1557610.jpg');
INSERT INTO `book_info_class` VALUES ('d802c7b7aa9a497697c978f4c65045e9', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '25fdca40fc47463cb452a24754862dc6', NULL, NULL, ' 湖南少年儿童出版社 ', ' 2015-5-1 ', '8.0', '一想到能和你共度余生，我就对余生充满期待', 'https://img1.doubanio.com/view/subject/m/public/s28342099.jpg');
INSERT INTO `book_info_class` VALUES ('dc143978de4540dbb08d19dd3c203245', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, 'd00dedfe11af4c479a2fecbcab970214', NULL, NULL, ' 人民文学出版社 ', ' 2005-1 ', '9.0', '中国当代城乡生活全景', 'https://img3.doubanio.com/view/subject/m/public/s1144911.jpg');
INSERT INTO `book_info_class` VALUES ('dc8ece64ad964b6b90b68081f5b6848e', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'e838d9ce1a084c0baf3189d897e89828', NULL, NULL, ' 人民文学出版社 ', ' 2005-2 ', '8.2', '科学与宗教的大乱斗', 'https://img3.doubanio.com/view/subject/m/public/s1914485.jpg');
INSERT INTO `book_info_class` VALUES ('dd850d5884e04be99bc6ff2cd5d19b32', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '8b9db4aa8a774317989637a6db6834e2', NULL, NULL, ' 电子工业出版社 ', ' 2009-6 ', '8.4', '反成功学的成功学', 'https://img3.doubanio.com/view/subject/m/public/s3778613.jpg');
INSERT INTO `book_info_class` VALUES ('dda5b3cbe1a046bd9a5c0632d28aebd1', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '717544a2f78c42a4bfa9e9f360672669', NULL, NULL, ' 南海出版公司 ', ' 2003-8 ', '8.2', '现代上海史诗', 'https://img3.doubanio.com/view/subject/m/public/s3018752.jpg');
INSERT INTO `book_info_class` VALUES ('ddbc823fd46042f4abec62ab2f90ee52', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, 'd153b6d1904c471d86aaba5d905ea610', NULL, NULL, ' 中国青年出版社 ', ' 2011-6 ', '8.2', NULL, 'https://img3.doubanio.com/view/subject/m/public/s1067863.jpg');
INSERT INTO `book_info_class` VALUES ('dec7c84da406434399fae87789397f13', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'cc419c943561439695927b5f2ea1528f', NULL, NULL, ' 上海译文出版社 ', ' 2012-1 ', '9.0', '外国人的寻路中国', 'https://img3.doubanio.com/view/subject/m/public/s8911702.jpg');
INSERT INTO `book_info_class` VALUES ('e10b9a9aa1604304be87227c40c5e0ce', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '4d137258b62c48dbaa836fb770e197d2', NULL, NULL, ' 当代世界出版社 ', ' 2007-10 ', '8.6', '噩梦中的一丝温度', 'https://img1.doubanio.com/view/subject/m/public/s2756239.jpg');
INSERT INTO `book_info_class` VALUES ('e15642dcd7644c25aa2dd120adfd30ae', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '0e9584a1e4704d3cb57f49eb1dbeaab8', NULL, NULL, ' 人民文学出版社 ', ' 2000-3-1 ', '8.3', '如骆驼喘息般深刻的绝望', 'https://img3.doubanio.com/view/subject/m/public/s1146040.jpg');
INSERT INTO `book_info_class` VALUES ('e17c8507e56b40279f027b53e139a497', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, 'ce803bd861844fcda3721c145f3f5455', NULL, NULL, ' 人民文学出版社 ', ' 2001-5 ', '9.0', '整个系列的分水岭，暗色渐浓', 'https://img3.doubanio.com/view/subject/m/public/s1072746.jpg');
INSERT INTO `book_info_class` VALUES ('e1b981a733674ea984e03fa66c3b252d', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '07f1152d82a24921b4c27e8de0e71e35', NULL, NULL, ' 重庆出版社 ', ' 2010-11 ', '9.2', '终章，何去何从', 'https://img3.doubanio.com/view/subject/m/public/s26012674.jpg');
INSERT INTO `book_info_class` VALUES ('e44b0f1b74034b90939cb5da3002b6db', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '854cafccb0084c88939ba02a46b95fc0', NULL, NULL, ' 上海译文出版社 ', ' 2004-5 ', '8.6', '猪与蜘蛛', 'https://img1.doubanio.com/view/subject/m/public/s1120437.jpg');
INSERT INTO `book_info_class` VALUES ('e46bd78fe8464cfc864aa6138c25ead7', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '07f5395fbe01453686fb5a98496d1947', NULL, NULL, '', ' 1997-5 ', '9.0', '窥见美国社会的一扇窗', 'https://img3.doubanio.com/view/subject/m/public/s1768916.jpg');
INSERT INTO `book_info_class` VALUES ('e6ad8cd3cddc4ee4a206e54cf71b3ed0', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, 'd12dba4fb02a42a69c2bd25181b35632', NULL, NULL, '', ' 1999-04 ', '8.9', '侠之大者，为国为民', 'https://img3.doubanio.com/view/subject/m/public/s2157336.jpg');
INSERT INTO `book_info_class` VALUES ('e89e058cc8bb4259b7697970ae76e9fb', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '9f0edc81956e4822ba1a844598168bb2', NULL, NULL, ' 中信出版社 ', ' 2010-1 ', '8.1', '失恋是一种病，痊愈之后百毒不侵', 'https://img3.doubanio.com/view/subject/m/public/s6980516.jpg');
INSERT INTO `book_info_class` VALUES ('e98a17977a42465d8fa59e741e43f29a', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, 'df0a8fd97e6049ebbd43d850e482caf0', NULL, NULL, '', ' 1997-5 ', '8.9', '见微知著，历史观的颠覆', 'https://img3.doubanio.com/view/subject/m/public/s1800355.jpg');
INSERT INTO `book_info_class` VALUES ('eadcba4bdde44a91bd00b1961f88b6db', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '76f308b96008421e881bdf5d1a450b38', NULL, NULL, '', ' 1994-5 ', '8.9', '至情至性，情大于武', 'https://img3.doubanio.com/view/subject/m/public/s26018916.jpg');
INSERT INTO `book_info_class` VALUES ('f06f98ced65848f0a8c58110c4902760', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'b6a0d54f5b4845d9b6ff4dfdd0dc5ed2', NULL, NULL, ' 人民文学出版社 ', ' 1997-1 ', '8.5', '风风火火闯九州', 'https://img3.doubanio.com/view/subject/m/public/s1147854.jpg');
INSERT INTO `book_info_class` VALUES ('f29d287ea6334eb3850ad2a43e799637', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, 'c0dae34671b647858a635e5d0bff227b', NULL, NULL, ' 浙江大学出版社 ', ' 2013-1 ', '8.3', NULL, 'https://img3.doubanio.com/view/subject/m/public/s26846213.jpg');
INSERT INTO `book_info_class` VALUES ('f2b8d1c0f1364b6c92f33768ebbbfcf2', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '4587d3d57d0d4fc9ad6b0b35577ca715', NULL, NULL, ' 浙江文艺出版社 ', ' 2003-4 ', '8.4', '格里高里清早醒来发现自己变成了甲虫', 'https://img3.doubanio.com/view/subject/m/public/s26042134.jpg');
INSERT INTO `book_info_class` VALUES ('f4384cd57bd64bfe8907ee3a060adcce', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, 'e5f2026a5f6d43f1a5564758c252af6f', NULL, NULL, ' 译林出版社 ', ' 2011-9 ', '8.8', '平淡叙述下的惊心动魄', 'https://img3.doubanio.com/view/subject/m/public/s6828981.jpg');
INSERT INTO `book_info_class` VALUES ('f537519f422c4706a63af0b87aef62b6', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '1f57503ca69a4ff089a0614d0e47b6cf', NULL, NULL, ' 朝华出版社 ', ' 2007-12 ', '8.5', NULL, 'https://img3.doubanio.com/view/subject/m/public/s8994402.jpg');
INSERT INTO `book_info_class` VALUES ('f542b7bfed7a4b9aa8f7502bd8e1685f', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '1d25020e1a99402799fd8bd680273013', NULL, NULL, ' 华夏出版社 ', ' 2008-1 ', '8.0', '都市灵修速成', 'https://img3.doubanio.com/view/subject/m/public/s3403254.jpg');
INSERT INTO `book_info_class` VALUES ('f68d769157c04ae28cf3b13c1b294459', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'f15328a6040b42b3b9fd3ff193cfc372', NULL, NULL, ' 人民文学出版社 ', ' 2003-9 ', '8.7', '暴脾气的哈利', 'https://img3.doubanio.com/view/subject/m/public/s1822013.jpg');
INSERT INTO `book_info_class` VALUES ('f694899e6212483c9cebb4cb20c8eaa5', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, 'd21c04436cee46b08c8dd077f137ec4b', NULL, NULL, ' 人民文学出版社 ', ' 1993-7 ', '8.8', '所有现代言情小说的母体', 'https://img3.doubanio.com/view/subject/m/public/s4250062.jpg');
INSERT INTO `book_info_class` VALUES ('f8614a3763564031abff35a7ff240236', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, 'd65d9ad9805946cfa878bffc33d8881b', NULL, NULL, ' 文汇出版社 ', ' 2005-8 ', '8.8', '中国人你为什么不生气？', 'https://img1.doubanio.com/view/subject/m/public/s1469589.jpg');
INSERT INTO `book_info_class` VALUES ('fad499f60f5b4d688a1cfa2b2767d5a4', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '050f18ad622640488242e4a821ced8f8', NULL, NULL, ' 人民文学出版社 ', ' 1998-3-1 ', '8.4', '一个傻子的土司家族传奇', 'https://img3.doubanio.com/view/subject/m/public/s9140762.jpg');
INSERT INTO `book_info_class` VALUES ('fb46fb5f2be042439ec2274e70d218ab', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '9c564257474f40d093a3336a8e60a312', NULL, NULL, '', ' 2004-1 ', '8.4', '读书的方法论', 'https://img1.doubanio.com/view/subject/m/public/s1670978.jpg');
INSERT INTO `book_info_class` VALUES ('fb928d09a13849b5b5e3d84f343fad53', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '83c39b7e489c4b6c8c721d5fbce10e0c', NULL, NULL, ' 湖南科学技术出版社 ', ' 2010-4 ', '8.8', '霍金与上帝的战争', 'https://img3.doubanio.com/view/subject/m/public/s1914861.jpg');
INSERT INTO `book_info_class` VALUES ('fbbfae55fe884d7a83263e5faa03f6f2', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '7ebabf7006c74ffd9fdfab33b679f5a6', NULL, NULL, ' 广西师范大学出版社 ', ' 2009-1 ', '8.1', '献给这个常识稀缺的时代', 'https://img3.doubanio.com/view/subject/m/public/s3588323.jpg');
INSERT INTO `book_info_class` VALUES ('fc732ce5e089406bb26eedb971519775', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, 'bf6ecf174aad46e48923560e7d7ca73a', NULL, NULL, ' 湖南文艺出版社 ', ' 55', '8.8', '耿耿余淮', 'https://img3.doubanio.com/view/subject/m/public/s26720726.jpg');
INSERT INTO `book_info_class` VALUES ('fdf1f76188464b02b8610147fc376f95', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '08036a040c814894a1d4fb8032a9d7d4', NULL, NULL, ' 南海出版公司 ', ' 2010-5 ', '8.3', '村上的野望，欢迎来到1Q84年', 'https://img3.doubanio.com/view/subject/m/public/s4363464.jpg');
INSERT INTO `book_info_class` VALUES ('fe397e391dbf4b09b1b695b3073adabd', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, 'c9a3e406bf0446239da2b8ee38d4e52b', NULL, NULL, ' 人民文学出版社 ', ' 2008-12 ', '8.7', '龙应台母子对话，两代人的思想碰撞', 'https://img1.doubanio.com/view/subject/m/public/s3993878.jpg');
INSERT INTO `book_info_class` VALUES ('fec220e71b6840739085a01a7684e2a9', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '3d985ade6f014edd8304c123c5fb072a', NULL, NULL, ' 中国工人出版社 ', ' 2003-4 ', '9.2', NULL, 'https://img1.doubanio.com/view/subject/m/public/s1094608.jpg');
INSERT INTO `book_info_class` VALUES ('ff4a664ff5cd40e98c1c9b5963cd3675', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, 'd1c3c8a3719d4a47a4f47a899738018d', NULL, NULL, ' 上海译文出版社 ', ' 2005-5 ', '8.5', '恋味癖谋杀案', 'https://img1.doubanio.com/view/subject/m/public/s1556748.jpg');

-- ----------------------------
-- Table structure for book_info_instance
-- ----------------------------
DROP TABLE IF EXISTS `book_info_instance`;
CREATE TABLE `book_info_instance`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向class的指针',
  `user_add_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向book_user_add的指针',
  `owner_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍所有者id',
  `holder_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍当前持有者的id',
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学校id/额外冗余',
  `campus_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '校区id',
  `status` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍当前状态',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书籍上架类型 冗余',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`book_class_id`) USING BTREE,
  INDEX `index2`(`owner_id`) USING BTREE,
  INDEX `index3`(`holder_id`) USING BTREE,
  INDEX `index4`(`school_id`) USING BTREE,
  INDEX `index5`(`user_add_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_info_instance
-- ----------------------------
INSERT INTO `book_info_instance` VALUES ('10c8565b9e8545ceb1cb7daa8ba72a9e', 'sun-0', 'sun-0', '2019-05-05 23:47:28', '2019-05-05 23:47:28', '0', NULL, NULL, '847dbeb852964efaae46ac0a4fa9cfdf', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `book_info_instance` VALUES ('1b171dea9bf5492da92772c9f47905ac', 'sun-0', 'sun-0', '2019-05-06 08:27:24', '2019-05-06 08:27:24', '0', NULL, NULL, 'b9ac3a5019524b339264b88448bf2f25', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `book_info_instance` VALUES ('56c00f6185d443ee8e95c16278cf3019', 'sun-0', 'sun-0', '2019-05-05 23:42:30', '2019-05-05 23:42:30', '0', NULL, NULL, 'f37e171b420e43b897d8bce28324ae17', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `book_info_instance` VALUES ('f0fd29cdfd1e4f57a82f8d07efcbebd2', 'sun-0', 'sun-0', '2019-05-05 23:38:18', '2019-05-05 23:38:18', '0', NULL, NULL, '3351036305e54dbdb775bfc29facb203', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for book_info_root
-- ----------------------------
DROP TABLE IF EXISTS `book_info_root`;
CREATE TABLE `book_info_root`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '书名',
  `author` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `represent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'book_class代表root的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_info_root
-- ----------------------------
INSERT INTO `book_info_root` VALUES ('01a2d02d741642ad912296bff9317860', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '富爸爸，穷爸爸', '（美）罗伯特・T・清崎 ', NULL);
INSERT INTO `book_info_root` VALUES ('0236414215b44c0caf85cf3e2fdd220c', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '一千零一夜', '纳训 ', NULL);
INSERT INTO `book_info_root` VALUES ('042840c6cbcf46fb8799ea0fb963818e', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '小姨多鹤', '严歌苓 ', NULL);
INSERT INTO `book_info_root` VALUES ('044fcee5853c4054ba342b9fa6aafd08', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '哈利·波特与混血王子', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('050f18ad622640488242e4a821ced8f8', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '尘埃落定', '阿来 ', NULL);
INSERT INTO `book_info_root` VALUES ('06391670b8894ace851dba5b520b2d4f', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '倚天屠龙记(共四册)', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('0698a5a8b60d4ca0823d1ec379b98461', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '一个陌生女人的来信', '[奥] 斯台芬·茨威格 ', NULL);
INSERT INTO `book_info_root` VALUES ('06e1174984094e8e968e0d647cb6b6cb', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '动物凶猛', '王朔 ', NULL);
INSERT INTO `book_info_root` VALUES ('07f1152d82a24921b4c27e8de0e71e35', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '三体Ⅲ', '刘慈欣 ', NULL);
INSERT INTO `book_info_root` VALUES ('07f5395fbe01453686fb5a98496d1947', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '历史深处的忧虑', '林达 ', NULL);
INSERT INTO `book_info_root` VALUES ('08036a040c814894a1d4fb8032a9d7d4', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '1Q84 BOOK 1', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('09f80d77f4314b9aaf6ec30cc9a15f47', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '哈利·波特与死亡圣器', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('0a03db122b094f63934dc11c5d86e6d9', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '1984', '[英] 乔治·奥威尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('0e9584a1e4704d3cb57f49eb1dbeaab8', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '骆驼祥子', '老舍 ', NULL);
INSERT INTO `book_info_root` VALUES ('10c8973ff37f488b9d2249e8d52c945b', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '鲁滨逊漂流记', '[英] 笛福 ', NULL);
INSERT INTO `book_info_root` VALUES ('10c9945f387e4fe29f80cb1ff2916076', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '简爱（英文全本）', '[英] 夏洛蒂·勃朗特 ', NULL);
INSERT INTO `book_info_root` VALUES ('10e2291013aa435f93c80debde5f08c3', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '哭泣的骆驼', '三毛 ', NULL);
INSERT INTO `book_info_root` VALUES ('120c31c813c24461a57bbeeb030317d3', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '步步惊心', '桐华 ', NULL);
INSERT INTO `book_info_root` VALUES ('124717ced8f0438b8af169f1f07d40d0', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '阿狸·梦之城堡', 'hans ', NULL);
INSERT INTO `book_info_root` VALUES ('18d762b11dad45948b82c5e8190994e6', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '海边的卡夫卡', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('1a36e49b66d244949c8da0c278ffb0cf', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '金锁记', '张爱玲 ', NULL);
INSERT INTO `book_info_root` VALUES ('1aa04ca64b384a66af7a1fd8db552118', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '京华烟云', '林语堂 ', NULL);
INSERT INTO `book_info_root` VALUES ('1b34c1a6c99d459787a62c87faf9c008', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '一個人住第5年', '高木直子 ', NULL);
INSERT INTO `book_info_root` VALUES ('1b62de5fe3dd4337bf3a697dde51deff', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '朝花夕拾', '鲁迅 ', NULL);
INSERT INTO `book_info_root` VALUES ('1b89a452a2ab4455a41145ce7435ef7c', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '撒哈拉的故事', '三毛 ', NULL);
INSERT INTO `book_info_root` VALUES ('1d25020e1a99402799fd8bd680273013', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '遇见未知的自己', '张德芬 ', NULL);
INSERT INTO `book_info_root` VALUES ('1daedfd5abf44f3eaa2a3f65fd4ab9ef', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '万水千山走遍', '三毛 ', NULL);
INSERT INTO `book_info_root` VALUES ('1e0a44840a6e474cb1f2c186ffaaff7e', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '红与黑', '斯丹达尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('1f57503ca69a4ff089a0614d0e47b6cf', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '琅琊榜', '海宴 ', NULL);
INSERT INTO `book_info_root` VALUES ('2060d004c1fe411f9f0e6dbd0851f244', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '飘', '[美国] 玛格丽特·米切尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('23e33899a85749b8a817246f7c06ae9e', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '我与地坛', '史铁生 ', NULL);
INSERT INTO `book_info_root` VALUES ('250cfa0c4952441992449feb7d5795c7', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '舞！舞！舞！', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('25fdca40fc47463cb452a24754862dc6', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '我不喜欢这世界，我只喜欢你', '乔一 ', NULL);
INSERT INTO `book_info_root` VALUES ('262d32f741d34906b200b3286589e127', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '伊豆的舞女', '[日] 川端康成 ', NULL);
INSERT INTO `book_info_root` VALUES ('263078edccb14d7b9c7288afc177f8f3', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '匆匆那年（上下）', '九夜茴 ', NULL);
INSERT INTO `book_info_root` VALUES ('28a5806f7c46491c9e91813e7ec8e1b1', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '活着', '余华 ', NULL);
INSERT INTO `book_info_root` VALUES ('2a2a202491554e2e99c77fadb0f3acd2', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '情书', '[日] 岩井俊二 ', NULL);
INSERT INTO `book_info_root` VALUES ('2a6a886040584f52919de4706ab185ff', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '我们仨', '杨绛 ', NULL);
INSERT INTO `book_info_root` VALUES ('2acbb511901a4520856f8f152f8d2744', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '达·芬奇密码', '[美] 丹·布朗 ', NULL);
INSERT INTO `book_info_root` VALUES ('30a102a390f746d99520258efc6be4c7', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '哈利·波特与密室', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('313daf0065f544eb91d0a8c2bc291267', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '地下铁', '幾米 ', NULL);
INSERT INTO `book_info_root` VALUES ('3144b10623784443888182401a3e1634', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '子不语1', '夏达 ', NULL);
INSERT INTO `book_info_root` VALUES ('331cb592948647d9813a3446b91a69e3', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '中国大历史', '黄仁宇 ', NULL);
INSERT INTO `book_info_root` VALUES ('3340f719aa134cebaacfc58d8512cb9e', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '文学回忆录（全2册）', '木心 讲述 ', NULL);
INSERT INTO `book_info_root` VALUES ('344ef3b523204e1c9c83bcbdc002506d', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '霍乱时期的爱情', '[哥伦比亚] 加西亚·马尔克斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('348856008ebc4dbcb86c40bfab2c45f2', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '第一炉香', '张爱玲 ', NULL);
INSERT INTO `book_info_root` VALUES ('3636a3214c6c4dbd86cdac66db656ef8', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '一个人的朝圣', '【英】蕾秋·乔伊斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('3646bc37c2004533b02a1cb91a5b3f74', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '梦里花落知多少', '三毛 ', NULL);
INSERT INTO `book_info_root` VALUES ('367b55a58752472e98004f503e03e14f', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '佛祖在一号线', '李海鹏 ', NULL);
INSERT INTO `book_info_root` VALUES ('378028c83e524513a58dd8e81b6fb4f7', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '孤独六讲', '蒋勋 ', NULL);
INSERT INTO `book_info_root` VALUES ('3803bd26788046d5bfd907d74eb4f26b', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '福尔摩斯探案全集（上中下）', '[英] 阿·柯南道尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('3875f61e776d4fc19149eb0fd2e13efb', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '格林童话全集', '[德国]格林兄弟 ', NULL);
INSERT INTO `book_info_root` VALUES ('39a1947efc2e45b49b0b672e09bc6e5d', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '红玫瑰与白玫瑰', '张爱玲 ', NULL);
INSERT INTO `book_info_root` VALUES ('3cd1052b45cb4968b0178f2a71b7731d', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '新名字的故事', '[意] 埃莱娜·费兰特 ', NULL);
INSERT INTO `book_info_root` VALUES ('3ce26258c61542c29dbfde3e04feb6fb', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '那些回不去的年少时光', '桐华 ', NULL);
INSERT INTO `book_info_root` VALUES ('3d8864e703254249a71c2bf383ae9594', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '不能承受的生命之轻', '[捷克] 米兰·昆德拉 ', NULL);
INSERT INTO `book_info_root` VALUES ('3d985ade6f014edd8304c123c5fb072a', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '父与子全集', '[德] 埃·奥·卜劳恩 绘 ', NULL);
INSERT INTO `book_info_root` VALUES ('3dc63bafe814425898d4be56f25e540b', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '呼兰河传', '萧红 ', NULL);
INSERT INTO `book_info_root` VALUES ('3e1f0e0565404d8490c19c9c307d80a8', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '老人与海', '海明威 ', NULL);
INSERT INTO `book_info_root` VALUES ('3f901b1f555c497a9ad205ff366dd0d5', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '带一本书去巴黎', '林达 ', NULL);
INSERT INTO `book_info_root` VALUES ('4161ccee67554ce8bd46c5c2f89393d8', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '人性的弱点全集', '[美] 戴尔·卡耐基 ', NULL);
INSERT INTO `book_info_root` VALUES ('42e58292f4f34cf38311810bb4ba9b09', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '孩子你慢慢来', '龙应台 ', NULL);
INSERT INTO `book_info_root` VALUES ('44b69d19fbe64fad9adf81d84f6bebf5', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '基督山伯爵', '大仲马 ', NULL);
INSERT INTO `book_info_root` VALUES ('4505a061f6a043f0aae69e9d67a18e4a', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '哈利·波特与阿兹卡班的囚徒', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('4587d3d57d0d4fc9ad6b0b35577ca715', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '变形记', '[奥] 卡夫卡 ', NULL);
INSERT INTO `book_info_root` VALUES ('48fa57930d4c4344ae1fbe0c5ba265dc', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '海子的诗', '海子 ', NULL);
INSERT INTO `book_info_root` VALUES ('493f1cbb03204f478d4e3143636b2282', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '巴黎圣母院', '[法]雨果 ', NULL);
INSERT INTO `book_info_root` VALUES ('49ce9e21534d4bc18efd1ae2a60c4f0e', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '三体', '刘慈欣 ', NULL);
INSERT INTO `book_info_root` VALUES ('4aae0b1e4a3f4035af55caffd0fc05fb', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '目送', '龙应台 ', NULL);
INSERT INTO `book_info_root` VALUES ('4acb6a3be517483abc06cb794cff5896', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '蔷薇岛屿', '安妮宝贝 ', NULL);
INSERT INTO `book_info_root` VALUES ('4bb36456a4f041699f2a260bea93de38', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '肖申克的救赎', '[美] 斯蒂芬·金 ', NULL);
INSERT INTO `book_info_root` VALUES ('4c9b663dcb5645ad99e85622c611aa78', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '球状闪电', '刘慈欣 ', NULL);
INSERT INTO `book_info_root` VALUES ('4ca685deed054a67a349fb0a3419af91', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '少有人走的路', '[美] M·斯科特·派克 ', NULL);
INSERT INTO `book_info_root` VALUES ('4cba1a99347c48cda959ba317d8e2a91', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '七夜雪', '沧月 ', NULL);
INSERT INTO `book_info_root` VALUES ('4d137258b62c48dbaa836fb770e197d2', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, 'ZOO', '[日] 乙一 ', NULL);
INSERT INTO `book_info_root` VALUES ('4d89d054f1454310a0ac8e3deb4ad975', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '许三观卖血记', '余华 ', NULL);
INSERT INTO `book_info_root` VALUES ('4e71e06fbc14401f850960225e80d1a8', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '海贼王', '尾田荣一郎 ', NULL);
INSERT INTO `book_info_root` VALUES ('4f55d4c7e9a5429ba8481c3f553d0af5', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '天才在左 疯子在右', '高铭 ', NULL);
INSERT INTO `book_info_root` VALUES ('4fa459716ace47f68b9ced4bd0a352a0', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '恶意', '[日] 东野圭吾 ', NULL);
INSERT INTO `book_info_root` VALUES ('50dc07043c174b73add3a65d6f7d61e4', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '人类简史', '[以色列] 尤瓦尔·赫拉利 ', NULL);
INSERT INTO `book_info_root` VALUES ('5372f76c66574531949a016e16973cd4', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '刀锋', '[英]毛姆 ', NULL);
INSERT INTO `book_info_root` VALUES ('537815c43dbd4eff8b2c30b843fb4aec', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '荆棘鸟', '[澳] 考琳·麦卡洛 ', NULL);
INSERT INTO `book_info_root` VALUES ('5457c591b57f4b3ea64434345c7b4bf0', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '兄弟（上）', '余华 ', NULL);
INSERT INTO `book_info_root` VALUES ('54f00f5906e14e2d927897d642aad7e1', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '人间失格', '太宰治 ', NULL);
INSERT INTO `book_info_root` VALUES ('54f61d33b061484b888d2c12e2f9dcab', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '一句顶一万句', '刘震云 ', NULL);
INSERT INTO `book_info_root` VALUES ('553d2fd709084e9d92f02e89eda55cae', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '生活在别处', '[捷克] 米兰·昆德拉 ', NULL);
INSERT INTO `book_info_root` VALUES ('5541fdd94d6d4bfc83c2d40bd62ba943', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '陆犯焉识', '严歌苓 ', NULL);
INSERT INTO `book_info_root` VALUES ('57c81fec77c648a9afbd34a22e6c9d7a', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '天龙八部', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('58e3516e0bd843d8bad29395dfbcb796', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '影响力', '[美] 罗伯特·西奥迪尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('5937ca6dffe44f978213b8b1414a3244', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '向左走·向右走', '幾米 ', NULL);
INSERT INTO `book_info_root` VALUES ('5acc59446bf344bb9785655188fc5305', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '茶花女', '小仲马 ', NULL);
INSERT INTO `book_info_root` VALUES ('5b2aad95b35e4311bab466859b13b5a1', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '娱乐至死', '[美] 尼尔·波兹曼 ', NULL);
INSERT INTO `book_info_root` VALUES ('5d55ff0299d8481a814a361587da61d6', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '狼图腾', '姜戎 ', NULL);
INSERT INTO `book_info_root` VALUES ('5d9eb34a9add4ae491535ad1f450b8ec', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '边城', '沈从文 ', NULL);
INSERT INTO `book_info_root` VALUES ('612caf11cda7405bb8012854b7d4a858', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '偷书贼', '[澳] 马克斯·苏萨克 ', NULL);
INSERT INTO `book_info_root` VALUES ('61317f6086ab4cb29e5ec6e9c0d9c4e0', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '巨人的陨落', '[英] 肯·福莱特 ', NULL);
INSERT INTO `book_info_root` VALUES ('618290cacd664f3788dbe8894ec91033', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '来不及说我爱你', '匪我思存 ', NULL);
INSERT INTO `book_info_root` VALUES ('619ba1ed6d7b4f589d1df051ef3aea78', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '一个叫欧维的男人决定去死', '[瑞典] 弗雷德里克·巴克曼 ', NULL);
INSERT INTO `book_info_root` VALUES ('61a76c15deee4df190c0fada9f58b9a3', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '羊脂球', '（法）莫泊桑 ', NULL);
INSERT INTO `book_info_root` VALUES ('61e085f8a4774b66a26dc7b5d2c0f427', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '菊与刀', '（美）鲁思・本尼迪克特 ', NULL);
INSERT INTO `book_info_root` VALUES ('6271c6a88c44446eb720670b29351990', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '城南旧事', '林海音 文 ', NULL);
INSERT INTO `book_info_root` VALUES ('63b2bfc155cc49a5ae39c241d71a3d19', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '悟空传', '今何在 ', NULL);
INSERT INTO `book_info_root` VALUES ('642357e8bc514df195d4deebb0ae9c00', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '哈姆莱特', '[英] 莎士比亚 ', NULL);
INSERT INTO `book_info_root` VALUES ('64ca7be46f6b4ad9bd6be13b87a2523f', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '海底两万里', '[法国] 儒尔·凡尔纳 ', NULL);
INSERT INTO `book_info_root` VALUES ('64dd22c90992490d895564690d6271cf', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '占星术杀人魔法', '[日] 岛田庄司 ', NULL);
INSERT INTO `book_info_root` VALUES ('651cbcab30034c82b4ebf7f20325fb57', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '三体Ⅱ', '刘慈欣 ', NULL);
INSERT INTO `book_info_root` VALUES ('670adc0f7cff4f5ba4742f9cd98569b7', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '爱你就像爱生命', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('67897baf83074dcd96780750d4eee4a6', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '杀死一只知更鸟', '[美] 哈珀·李 ', NULL);
INSERT INTO `book_info_root` VALUES ('67bb693b53c34d33b633fdf0f6c86e22', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '飞鸟集', '[印] 罗宾德拉纳德·泰戈尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('68d92f0fca85420e8c60561d60507861', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '情人', '[法] 玛格丽特·杜拉斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('6af59a0657e84d3cb7b8e7608afa5637', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '我的天才女友', '[意] 埃莱娜·费兰特 ', NULL);
INSERT INTO `book_info_root` VALUES ('6b773faf7d064952ae40b4991e1db3cd', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '窗边的小豆豆', '[日] 黑柳彻子 著 ', NULL);
INSERT INTO `book_info_root` VALUES ('6b9eac1659b1437aa67adb9f6c3af673', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '呐喊', '鲁迅 ', NULL);
INSERT INTO `book_info_root` VALUES ('6b9ef0fcc6ea4680b298886622fd09d9', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '房思琪的初恋乐园', '林奕含 ', NULL);
INSERT INTO `book_info_root` VALUES ('6f4c4a6fc1384c17a85ecf77e1504f81', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '云中歌1', '桐华 ', NULL);
INSERT INTO `book_info_root` VALUES ('716a9265e589434f963c4da3dde5a13b', 'sun-0', 'sun-0', '2019-05-06 08:27:24', '2019-05-06 08:27:24', '0', NULL, '我的天才女友', '[意]埃莱娜·费兰特 ', NULL);
INSERT INTO `book_info_root` VALUES ('717544a2f78c42a4bfa9e9f360672669', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '长恨歌', '王安忆 ', NULL);
INSERT INTO `book_info_root` VALUES ('728aee42ac394be5bc729b37e2042876', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '橙', '安东尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('73ac2ccf4b0e4d31871ce05c088989e6', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '牧羊少年奇幻之旅', '[巴西]保罗·柯艾略 ', NULL);
INSERT INTO `book_info_root` VALUES ('7419a8f441e749939469a906d03447be', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '东霓', '笛安 ', NULL);
INSERT INTO `book_info_root` VALUES ('76f308b96008421e881bdf5d1a450b38', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '神雕侠侣', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('76fbb3bc29124556be877d73b35ead86', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '明朝那些事儿（壹）', '当年明月 ', NULL);
INSERT INTO `book_info_root` VALUES ('7b9d8e98f48444f8b2d6b84e05cacb33', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '罗生门', '[日]芥川龙之介 ', NULL);
INSERT INTO `book_info_root` VALUES ('7dba849028844869881cf10c3891dc06', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '月亮与六便士', '[英] 威廉·萨默塞特·毛姆 ', NULL);
INSERT INTO `book_info_root` VALUES ('7e6b78d178df48c49aa3062ddb3d0ee4', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '雾都孤儿', '[英]狄更斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('7ebabf7006c74ffd9fdfab33b679f5a6', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '常识', '梁文道 ', NULL);
INSERT INTO `book_info_root` VALUES ('7fc8bb182ccc4e96856c2b8a5f7a7794', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '动物农场', '[英] 乔治·奥威尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('833821c91e4947e5930fa9e2ece55f5e', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '局外人', '[法] 阿尔贝·加缪 ', NULL);
INSERT INTO `book_info_root` VALUES ('833bb202e1d74d05aa3907bd32ca8b81', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '莲花', '安妮宝贝 ', NULL);
INSERT INTO `book_info_root` VALUES ('83c39b7e489c4b6c8c721d5fbce10e0c', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '时间简史', '[英] 史蒂芬·霍金 ', NULL);
INSERT INTO `book_info_root` VALUES ('84697a4db5364b6c9e89c6c3d829c179', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '盗墓笔记', '南派三叔 ', NULL);
INSERT INTO `book_info_root` VALUES ('854cafccb0084c88939ba02a46b95fc0', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '夏洛的网', '[美] E.B.怀特 ', NULL);
INSERT INTO `book_info_root` VALUES ('861e6f46c9d4496ab91a4a6d10a97158', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '一只特立独行的猪', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('86625ecd605249d9a86144d9664751f6', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '百年孤独', '[哥伦比亚] 加西亚·马尔克斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('87697eb5362c4278b2fc2ac06d65ab07', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '斯通纳', '[美] 约翰·威廉斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('8973871d6f12483099b08f36babfbb17', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '无人生还', '[英] 阿加莎・克里斯蒂 ', NULL);
INSERT INTO `book_info_root` VALUES ('8b8a9c73b9ba409cb629eb6f67622859', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '麦琪的礼物', '[美] 欧·亨利 ', NULL);
INSERT INTO `book_info_root` VALUES ('8b9db4aa8a774317989637a6db6834e2', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '把时间当作朋友', '李笑来 ', NULL);
INSERT INTO `book_info_root` VALUES ('8cdedc3a7471474184d070d0a978f436', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '西游记（全二册）', '吴承恩 ', NULL);
INSERT INTO `book_info_root` VALUES ('8e510675dd1c40488e802e3e2de9bed5', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '世界尽头与冷酷仙境', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('901a4e1defbc45c0992f98b152f6bb7d', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '台北人', '白先勇 ', NULL);
INSERT INTO `book_info_root` VALUES ('90edd5afa1184c9c84a5b29018fbc4d4', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '雷雨', '曹禺 ', NULL);
INSERT INTO `book_info_root` VALUES ('91c0c3ea387b4522a17e23504755c947', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '相约星期二', '[美] 米奇·阿尔博姆 ', NULL);
INSERT INTO `book_info_root` VALUES ('9229dabf856d46c5b80c1e9ec42e43bf', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '面纱', '(英)W.萨默塞特·毛姆 ', NULL);
INSERT INTO `book_info_root` VALUES ('929048b0ab634398af897c53ca24c7fc', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '退步集', '陈丹青 ', NULL);
INSERT INTO `book_info_root` VALUES ('92bc03aa53de431ba4ff27a776642a5a', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '查令十字街84号', '[美] 海莲·汉芙 ', NULL);
INSERT INTO `book_info_root` VALUES ('930c6412a4944963868401a08cd8d694', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '此间的少年', '江南 ', NULL);
INSERT INTO `book_info_root` VALUES ('9775c2b122f946da9a5f98fcd1cac294', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '浪潮之巅', '吴军 ', NULL);
INSERT INTO `book_info_root` VALUES ('977db49277e34e558e38038845658b83', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '时间旅行者的妻子', '[美] 奥德丽·尼芬格 ', NULL);
INSERT INTO `book_info_root` VALUES ('986994b8a4d44456995bc1310b6b1964', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '我的精神家园', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('9939d54eb6444ea382ec19719787d98d', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '我执', '梁文道 ', NULL);
INSERT INTO `book_info_root` VALUES ('9acac1e69b1b4cc8915765d2cdc37fe1', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '了不起的盖茨比', '菲茨杰拉德 ', NULL);
INSERT INTO `book_info_root` VALUES ('9c0872e92afa4f43bea816fa0ba2f588', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '罗杰疑案', '[英] 阿加莎·克里斯蒂 ', NULL);
INSERT INTO `book_info_root` VALUES ('9c564257474f40d093a3336a8e60a312', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '如何阅读一本书', '[美] 莫提默·J. 艾德勒 ', NULL);
INSERT INTO `book_info_root` VALUES ('9d8339ddcfce4c49ab2ac77ab012174c', 'sun-0', 'sun-0', '2019-04-29 16:15:17', '2019-04-29 16:15:17', '0', NULL, '追风筝的人', '[美] 卡勒德·胡赛尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('9f0edc81956e4822ba1a844598168bb2', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '失恋33天', '鲍鲸鲸 ', NULL);
INSERT INTO `book_info_root` VALUES ('9f4c92a71ff94ceca6e200002c82e528', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '爱的艺术', '[美] 艾·弗洛姆 ', NULL);
INSERT INTO `book_info_root` VALUES ('a2a229c46f5845e48bf131856836f684', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '那些年，我们一起追的女孩', '九把刀 ', NULL);
INSERT INTO `book_info_root` VALUES ('a4a196e7070d496b80c59098e22355e9', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '黄金时代', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('a4e59780e0c04bb2b62c832823719d6e', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '白夜行', '[日] 东野圭吾 ', NULL);
INSERT INTO `book_info_root` VALUES ('a7d7c54afa2641bf93aada8e24f32268', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '月亮忘記了', '幾米 ', NULL);
INSERT INTO `book_info_root` VALUES ('a8a365f751984c71b2b0694b1b42c141', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '嫌疑人X的献身', '[日] 东野圭吾 ', NULL);
INSERT INTO `book_info_root` VALUES ('a90c2a8de78a487d8ecb2ac1465782e4', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '项链', '[法] 莫泊桑 ', NULL);
INSERT INTO `book_info_root` VALUES ('aa32a52028d14214bd4cef4284493fb1', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '无声告白', '[美] 伍绮诗 ', NULL);
INSERT INTO `book_info_root` VALUES ('ab6df9cc72124c0582d8a945838ade82', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '流浪地球', '刘慈欣 ', NULL);
INSERT INTO `book_info_root` VALUES ('abca1d7911134cbc82413f5021064a01', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '安徒生童话故事集', '（丹麦）安徒生 ', NULL);
INSERT INTO `book_info_root` VALUES ('ac5335ba09f645f59f4ceb53b6838eb9', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '当我谈跑步时我谈些什么', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('af20e2af18c6403dbe39de0714db63ee', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '鬼吹灯之精绝古城', '天下霸唱 ', NULL);
INSERT INTO `book_info_root` VALUES ('b03c564191b44ebba5b81b02aef8d68a', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '新参者', '[日] 东野圭吾 ', NULL);
INSERT INTO `book_info_root` VALUES ('b07d30ce1ae842829992bdb39a869507', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '呼啸山庄', '（英）勃朗特 ', NULL);
INSERT INTO `book_info_root` VALUES ('b0a2672f3e5c4e7d8b5752f155bb86df', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '民主的细节', '刘瑜 ', NULL);
INSERT INTO `book_info_root` VALUES ('b0cdf4afcefa421caf9111679cb74f4e', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '白鹿原', '陈忠实 ', NULL);
INSERT INTO `book_info_root` VALUES ('b278ad1515a94cbcb6dab5c80047e01b', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '红拂夜奔', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('b2b454f4a9064ebca22304e3f504b680', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '没有色彩的多崎作和他的巡礼之年', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('b2b805fa8fd942628c23903da0569d4f', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '巨流河', '齐邦媛 ', NULL);
INSERT INTO `book_info_root` VALUES ('b6a0d54f5b4845d9b6ff4dfdd0dc5ed2', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '水浒传（全二册）', '[明] 施耐庵 ', NULL);
INSERT INTO `book_info_root` VALUES ('b7165928e6834fc984d2e9dd2816f413', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '人间词话', '王国维 ', NULL);
INSERT INTO `book_info_root` VALUES ('b7563506bbf8448194c49760d94e2fbe', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '瓦尔登湖', '[美] 梭罗 ', NULL);
INSERT INTO `book_info_root` VALUES ('b7ffc5c78c7841ff9834a8a1084eaa3c', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '小王子', '[法] 圣埃克苏佩里 ', NULL);
INSERT INTO `book_info_root` VALUES ('b90206a5a13b46a8985f9406ca1408ba', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '挪威的森林', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('ba79986535bd4943a75416de5836e0d3', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '笑傲江湖（全四册）', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('bbf86492552d49f8b5891fd0c78b533e', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '教父', '[美]马里奥·普佐 ', NULL);
INSERT INTO `book_info_root` VALUES ('bd82e2b5ee0a4315b366c0b38d0b4070', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '穆斯林的葬礼', '霍达 ', NULL);
INSERT INTO `book_info_root` VALUES ('be0f49528a0a4af784cc65a3f0395b6b', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '寻羊冒险记', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('bec231b8d98c406b8d1cd9f64852f1e7', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '倾城之恋', '花城出版社 ', NULL);
INSERT INTO `book_info_root` VALUES ('befe3efffd624535aaeb87b9afcc1c1e', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '苏菲的世界', '（挪威）乔斯坦·贾德 ', NULL);
INSERT INTO `book_info_root` VALUES ('bf3b72372df14f16b76abf0e071b1818', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '鹿鼎记（全五册）', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('bf6ecf174aad46e48923560e7d7ca73a', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '最好的我们', '八月长安 ', NULL);
INSERT INTO `book_info_root` VALUES ('bf8766ffb7b64d8c986e2cbcedea65f8', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '半生缘', '张爱玲 ', NULL);
INSERT INTO `book_info_root` VALUES ('c0dae34671b647858a635e5d0bff227b', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '观念的水位', '刘瑜 ', NULL);
INSERT INTO `book_info_root` VALUES ('c0fd4caa7638427cb16bdcf7e17aac58', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '芳华', '严歌苓 ', NULL);
INSERT INTO `book_info_root` VALUES ('c23b01e3d6044418abac0364d47005eb', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '尼罗河上的惨案', '[英] 阿加莎·克里斯蒂 ', NULL);
INSERT INTO `book_info_root` VALUES ('c2f30e5a02f740ba96e679cade25eee6', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '可爱的洪水猛兽', '韩寒 ', NULL);
INSERT INTO `book_info_root` VALUES ('c398754052384c98832d38b3ee90a6dd', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '设计中的设计', '[日] 原研哉 ', NULL);
INSERT INTO `book_info_root` VALUES ('c488754d968a433abd7ddda50b522dc6', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '沉默的大多数', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('c5c9c404e38040efa9ee4d76b7e2576a', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '中国历代政治得失', '钱穆 ', NULL);
INSERT INTO `book_info_root` VALUES ('c9a3e406bf0446239da2b8ee38d4e52b', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '亲爱的安德烈', '龙应台 ', NULL);
INSERT INTO `book_info_root` VALUES ('c9bd2cb6737d4407811c5600bf76e934', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '解忧杂货店', '[日] 东野圭吾 ', NULL);
INSERT INTO `book_info_root` VALUES ('c9ceea25ec084861a6afc6c2e7f8dc93', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '你今天真好看', '[美]莉兹•克里莫 ', NULL);
INSERT INTO `book_info_root` VALUES ('cacc66e676fa46b1ac3548bf88a3cd9e', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '雨季不再来', '三毛 ', NULL);
INSERT INTO `book_info_root` VALUES ('cc05278f083f45f1be8cc81ad9765ebb', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '一九八四·动物农场', '[英] 乔治·奥威尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('cc419c943561439695927b5f2ea1528f', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '江城', '[美] 彼得·海斯勒 ', NULL);
INSERT INTO `book_info_root` VALUES ('ce803bd861844fcda3721c145f3f5455', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '哈利·波特与火焰杯', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('ceca5248914948d58b9deed7c245bed4', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '激荡三十年（上）', '吴晓波 ', NULL);
INSERT INTO `book_info_root` VALUES ('cff67b8b72824b0f8c176d2f64aea9e2', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '心是孤独的猎手', '[美] 卡森·麦卡勒斯 ', NULL);
INSERT INTO `book_info_root` VALUES ('d003554b767a4b02b57c694eed1fc4d3', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '夹边沟记事', '杨显惠 ', NULL);
INSERT INTO `book_info_root` VALUES ('d00dedfe11af4c479a2fecbcab970214', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '平凡的世界（全三部）', '路遥 ', NULL);
INSERT INTO `book_info_root` VALUES ('d0ec17e8e4ff4e6c8d9ca8d253fea6db', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '寻路中国', '[美] 彼得·海斯勒 ', NULL);
INSERT INTO `book_info_root` VALUES ('d12dba4fb02a42a69c2bd25181b35632', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '射雕英雄传（全四册）', '金庸 ', NULL);
INSERT INTO `book_info_root` VALUES ('d153b6d1904c471d86aaba5d905ea610', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '高效能人士的七个习惯（精华版）', '[美] 史蒂芬·柯维 ', NULL);
INSERT INTO `book_info_root` VALUES ('d1658e7f9a564846b8bf99c7572d5e15', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '冰与火之歌（卷一）', '[美] 乔治·R. R. 马丁 ', NULL);
INSERT INTO `book_info_root` VALUES ('d1c3c8a3719d4a47a4f47a899738018d', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '香水', '[德] 帕·聚斯金德 ', NULL);
INSERT INTO `book_info_root` VALUES ('d21c04436cee46b08c8dd077f137ec4b', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '傲慢与偏见', '[英] 奥斯丁 ', NULL);
INSERT INTO `book_info_root` VALUES ('d23546e88edc4486a98224fd3c5e36bb', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '白银时代', '王小波 ', NULL);
INSERT INTO `book_info_root` VALUES ('d3999aea5ecd4d10ad693a63057c064a', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '阿Q正传', '鲁迅 著 ', NULL);
INSERT INTO `book_info_root` VALUES ('d65d9ad9805946cfa878bffc33d8881b', 'sun-0', 'sun-0', '2019-04-29 16:17:03', '2019-04-29 16:17:03', '0', NULL, '野火集', '龙应台 ', NULL);
INSERT INTO `book_info_root` VALUES ('d698911d33aa4385911627a563e57470', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '枪炮、病菌与钢铁', '[美] 贾雷德·戴蒙德 ', NULL);
INSERT INTO `book_info_root` VALUES ('d6f576b7621e400dae00d4f0f157c2dd', 'sun-0', 'sun-0', '2019-04-29 16:16:52', '2019-04-29 16:16:52', '0', NULL, '哈利·波特与魔法石', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('d9678b3db44a412e9dbcd06534185abb', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '围城', '钱锺书 ', NULL);
INSERT INTO `book_info_root` VALUES ('d97371fc07844b5e9087b7be8d1e0d5d', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '灿烂千阳', '[美] 卡勒德·胡赛尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('d9ceec3f08ee4034984094127ac979b2', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '史蒂夫·乔布斯传', '[美] 沃尔特·艾萨克森 ', NULL);
INSERT INTO `book_info_root` VALUES ('dae8228e48a0455ab066dfccca8fe086', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '喜宝', '亦舒 ', NULL);
INSERT INTO `book_info_root` VALUES ('db871b69a7ac4c0d95106158a58f2985', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '未来简史', '[以色列] 尤瓦尔·赫拉利 ', NULL);
INSERT INTO `book_info_root` VALUES ('dd14266c3ef74b409431a4e0626daef8', 'sun-0', 'sun-0', '2019-04-29 16:17:04', '2019-04-29 16:17:04', '0', NULL, '动物庄园', '（英）乔治·奥威尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('df0a8fd97e6049ebbd43d850e482caf0', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '万历十五年', '[美] 黄仁宇 ', NULL);
INSERT INTO `book_info_root` VALUES ('e0b2a7411a734e7a8aa5cfa0979c783c', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '大地之灯', '七堇年 ', NULL);
INSERT INTO `book_info_root` VALUES ('e0f0c67761244209891b16598b980c1c', 'sun-0', 'sun-0', '2019-04-29 16:16:57', '2019-04-29 16:16:57', '0', NULL, '陪安东尼度过漫长岁月', '安东尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('e156d3262aca4fd5b088a57e4f960432', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '看不见的城市', '[意大利]伊塔洛·卡尔维诺 ', NULL);
INSERT INTO `book_info_root` VALUES ('e5f2026a5f6d43f1a5564758c252af6f', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '这些人，那些事', '吴念真 ', NULL);
INSERT INTO `book_info_root` VALUES ('e838d9ce1a084c0baf3189d897e89828', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '天使与魔鬼', '[美] 丹.布朗 ', NULL);
INSERT INTO `book_info_root` VALUES ('e8931f30fe764115a5cd07bbeaa74849', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '红楼梦', '[清] 曹雪芹 著 ', NULL);
INSERT INTO `book_info_root` VALUES ('e8c9a20a24f54270a6c8594e33cbef84', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '这些都是你给我的爱', '文：安东尼 ', NULL);
INSERT INTO `book_info_root` VALUES ('e9b9b988b9044b3bb5b29212f3b6e1da', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '往事并不如烟', '章诒和 ', NULL);
INSERT INTO `book_info_root` VALUES ('ea4da109dbaf49b699ad938d083db3ef', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '你一定爱读的极简欧洲史', '约翰·赫斯特（John Hirst） ', NULL);
INSERT INTO `book_info_root` VALUES ('eb0cbef1c5954bd0963b77450e472c78', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '妻妾成群', '苏童 ', NULL);
INSERT INTO `book_info_root` VALUES ('ec1a3b71d5c8429d9cb373f2495895c4', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '华胥引（全二册）', '唐七公子 ', NULL);
INSERT INTO `book_info_root` VALUES ('eeef20250adf46a38d1a6176dba07f79', 'sun-0', 'sun-0', '2019-04-29 16:17:02', '2019-04-29 16:17:02', '0', NULL, '九州·缥缈录', '江南 ', NULL);
INSERT INTO `book_info_root` VALUES ('f0a9026dda8346de98d4e1acd142f929', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '你好，旧时光（上 下）', '八月长安 ', NULL);
INSERT INTO `book_info_root` VALUES ('f0e6b90e052e49ba915d2a4eb94d480e', 'sun-0', 'sun-0', '2019-04-29 16:16:53', '2019-04-29 16:16:53', '0', NULL, '送你一颗子弹', '刘瑜 ', NULL);
INSERT INTO `book_info_root` VALUES ('f12c0693c342495c86f23bdcfdef4a8f', 'sun-0', 'sun-0', '2019-04-29 16:16:55', '2019-04-29 16:16:55', '0', NULL, '东方快车谋杀案', '[英] 阿加莎·克里斯蒂 ', NULL);
INSERT INTO `book_info_root` VALUES ('f15328a6040b42b3b9fd3ff193cfc372', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '哈利·波特与凤凰社', '[英] J. K. 罗琳 ', NULL);
INSERT INTO `book_info_root` VALUES ('f1ab919593e64c2db9303516aa29a500', 'sun-0', 'sun-0', '2019-04-29 16:16:56', '2019-04-29 16:16:56', '0', NULL, '乌合之众', '（法）勒庞 ', NULL);
INSERT INTO `book_info_root` VALUES ('f4c7b18f642a41dcb5801c1e110405b8', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '国境以南 太阳以西', '[日] 村上春树 ', NULL);
INSERT INTO `book_info_root` VALUES ('f57b87b5024444a1bbfd0ad5570a81fb', 'sun-0', 'sun-0', '2019-04-29 16:16:58', '2019-04-29 16:16:58', '0', NULL, '悲惨世界（上中下）', '[法] 雨果 ', NULL);
INSERT INTO `book_info_root` VALUES ('f652cc4976644f46960c507c813273cc', 'sun-0', 'sun-0', '2019-04-29 16:17:00', '2019-04-29 16:17:00', '0', NULL, '自控力', '[美]  凯利·麦格尼格尔 ', NULL);
INSERT INTO `book_info_root` VALUES ('f78b516240674997a6c13accaeb0ee63', 'sun-0', 'sun-0', '2019-04-29 16:16:54', '2019-04-29 16:16:54', '0', NULL, '三国演义（全二册）', '[明] 罗贯中 ', NULL);
INSERT INTO `book_info_root` VALUES ('f85f01d00e8c4b0eb80d6d3c655e56bd', 'sun-0', 'sun-0', '2019-04-29 16:16:59', '2019-04-29 16:16:59', '0', NULL, '狂人日记', '鲁迅 ', NULL);
INSERT INTO `book_info_root` VALUES ('fc10c21f65e044e5a065d1d94f2396b7', 'sun-0', 'sun-0', '2019-04-29 16:17:01', '2019-04-29 16:17:01', '0', NULL, '最初的爱情 最后的仪式', '[英] 伊恩·麦克尤恩 ', NULL);
INSERT INTO `book_info_root` VALUES ('ffe8af2d40b2423f887c9c19dfcf831c', 'sun-0', 'sun-0', '2019-04-29 16:16:51', '2019-04-29 16:16:51', '0', NULL, '看见', '柴静 ', NULL);

-- ----------------------------
-- Table structure for book_instance_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_instance_tag`;
CREATE TABLE `book_instance_tag`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_instance_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `book_tag_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_like_record
-- ----------------------------
DROP TABLE IF EXISTS `book_like_record`;
CREATE TABLE `book_like_record`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '点赞的对象',
  `refer_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有的类型都在refer里面 | 好像不符合数据库的设计范式...',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_root_sort
-- ----------------------------
DROP TABLE IF EXISTS `book_root_sort`;
CREATE TABLE `book_root_sort`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_root_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `book_sort_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_sort
-- ----------------------------
DROP TABLE IF EXISTS `book_sort`;
CREATE TABLE `book_sort`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有的父级id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_tag
-- ----------------------------
DROP TABLE IF EXISTS `book_tag`;
CREATE TABLE `book_tag`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `parent_ids` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '所有父级id',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for book_user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `book_user_favorite`;
CREATE TABLE `book_user_favorite`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `book_class_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '收藏类型',
  `book_comment_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '长书评id',
  `student_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '业务逻辑身份/冗余',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of book_user_favorite
-- ----------------------------
INSERT INTO `book_user_favorite` VALUES ('8ff83b1405c8467e8c868c72d7842fb7', 'sun-0', 'sun-0', '2019-05-06 11:38:41', '2019-05-06 11:38:41', '0', NULL, '04f34385f15b4733aa8457d8387c9659', '1', NULL, NULL);

-- ----------------------------
-- Table structure for book_user_info
-- ----------------------------
DROP TABLE IF EXISTS `book_user_info`;
CREATE TABLE `book_user_info`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '指向sys_user的指针',
  `credit_score` decimal(10, 0) NOT NULL DEFAULT 100 COMMENT '信誉分数',
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_notice
-- ----------------------------
DROP TABLE IF EXISTS `msg_notice`;
CREATE TABLE `msg_notice`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型',
  `title` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `status` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for msg_notice_record
-- ----------------------------
DROP TABLE IF EXISTS `msg_notice_record`;
CREATE TABLE `msg_notice_record`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `msg_notice_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '通知通告ID',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接受人',
  `read_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '阅读标记',
  `read_time` datetime(0) NULL DEFAULT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index1`(`msg_notice_id`) USING BTREE,
  INDEX `index2`(`user_id`) USING BTREE,
  INDEX `index3`(`read_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '编号',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新者',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `parent_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `code` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域编码',
  `type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区域类型',
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_area_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_area_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '区域表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('05d60c3f8d1f479596d4d55a4f01685b', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:44:59', '2019-05-13 16:30:49', '1', '0,1,', '黑龙江省', 30, '9', '2', '', '0');
INSERT INTO `sys_area` VALUES ('1', 'admin@root@nature-parent', 'admin@root@nature-parent', '2013-05-27 08:00:00', '2019-05-13 16:30:49', '0', '0,', '中国', 10, '100000', '1', NULL, '0');
INSERT INTO `sys_area` VALUES ('10fc23d7882d4e8e8cf4daf326b12f07', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:53:36', '2019-05-13 16:30:49', '1', '0,1,', '香港', 30, '33', '2', '', '0');
INSERT INTO `sys_area` VALUES ('11d4713ce2994afe946da7ec06d6ce36', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:46:56', '2019-05-13 16:30:49', '1', '0,1,', '福建省', 30, '14', '2', '', '0');
INSERT INTO `sys_area` VALUES ('12d9a2e6943f448ea39570d3f51eb53a', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:44:42', '2019-05-13 16:30:49', '1', '0,1,', '辽宁省', 30, '8', '2', '', '0');
INSERT INTO `sys_area` VALUES ('15f19b5e1c2e4cef8c3a80d11834e230', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:45:18', '2019-05-13 16:30:49', '1', '0,1,', '陕西省', 30, '10', '2', '', '0');
INSERT INTO `sys_area` VALUES ('216744caa45d4ad7a7c055282f63d93c', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:47:40', '2019-05-13 16:30:49', '1', '0,1,', '河南省', 30, '16', '2', '', '0');
INSERT INTO `sys_area` VALUES ('32be6fe0c0654834a16b1c179fb0a7f9', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:50:38', '2019-05-13 16:30:49', '1', '0,1,', '四川省', 30, '24', '2', '', '0');
INSERT INTO `sys_area` VALUES ('358dbcd84b2b48caafb4a3341e13d3ee', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:52:03', '2019-05-13 16:30:49', '1', '0,1,', '西藏', 30, '28', '2', '', '0');
INSERT INTO `sys_area` VALUES ('36bcecb0f7ad46498f33860ea24bccb1', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:48:10', '2019-05-13 16:30:49', '1', '0,1,', '湖北省', 30, '17', '2', '', '0');
INSERT INTO `sys_area` VALUES ('37277b83cade4b6ba39917e87967c77c', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:48:25', '2019-05-13 16:30:49', '1', '0,1,', '湖南省', 30, '18', '2', '', '0');
INSERT INTO `sys_area` VALUES ('40479c48e2484f79bc7298cff81617a1', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:52:45', '2019-05-13 16:30:49', '1', '0,1,', '内蒙古', 30, '30', '2', '', '0');
INSERT INTO `sys_area` VALUES ('486ccd5e356142f1bc658ecf2afa1d8e', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:44:03', '2019-05-13 16:30:49', '1', '0,1,', '山西省', 30, '6', '2', '', '0');
INSERT INTO `sys_area` VALUES ('4c84f22c941a43abbba7132abc04bcfc', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 15:43:42', '2019-05-13 16:30:49', '1', '0,1,', '上海市', 30, '4', '2', '', '0');
INSERT INTO `sys_area` VALUES ('62cfb9fc752c49e09ad7f33db4e2d7ed', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 15:43:31', '2019-05-13 16:30:49', '1', '0,1,', '重庆市', 30, '3', '2', '', '0');
INSERT INTO `sys_area` VALUES ('67fd29da29414cd1b98d090c8b4b4b95', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:49:35', '2019-05-13 16:30:49', '1', '0,1,', '广东省', 30, '21', '2', '', '0');
INSERT INTO `sys_area` VALUES ('6cb49f4997964a3693d568d8c730568f', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:53:19', '2019-05-13 16:30:49', '1', '0,1,', '宁夏', 30, '32', '2', '', '0');
INSERT INTO `sys_area` VALUES ('702f39b95b56490aaf5a06ccecad5f7a', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 15:42:54', '2019-05-13 16:30:49', '1', '0,1,', '北京市', 30, '1', '2', '', '0');
INSERT INTO `sys_area` VALUES ('71fbf4832bad4f62bd6fdfa06b20b28f', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:48:44', '2019-05-13 16:30:49', '1', '0,1,', '江西省', 30, '19', '2', '', '0');
INSERT INTO `sys_area` VALUES ('86c832d821524e92950eb1403f600e4a', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:49:18', '2019-05-13 16:30:49', '1', '0,1,', '安徽省', 30, '22', '2', '', '0');
INSERT INTO `sys_area` VALUES ('92dd92816563456cbaaf2c392202d5d0', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:52:28', '2019-05-13 16:30:49', '1', '0,1,', '广西', 30, '29', '2', '', '0');
INSERT INTO `sys_area` VALUES ('9bb354b6267e41029c409cefe2144bab', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:51:30', '2019-05-13 16:30:49', '1', '0,1,', '云南省', 30, '27', '2', '', '0');
INSERT INTO `sys_area` VALUES ('9f090b67a5114a51a78882c0481dcafb', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:50:19', '2019-05-13 16:30:49', '1', '0,1,', '海南省', 30, '23', '2', '', '0');
INSERT INTO `sys_area` VALUES ('af170af1b90144da9eb7923a0a91a1b5', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:51:02', '2019-05-13 16:30:49', '1', '0,1,', '贵州省', 30, '25', '2', '', '0');
INSERT INTO `sys_area` VALUES ('b3057f8b63524d59bba6d8ef7d47163f', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:43:41', '2019-05-13 16:30:49', '1', '0,1,', '河北省', 30, '5', '2', '', '0');
INSERT INTO `sys_area` VALUES ('b637a006c7ae4867a42641e119cde7dc', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 15:43:20', '2019-05-13 16:30:49', '1', '0,1,', '天津市', 30, '2', '2', '', '0');
INSERT INTO `sys_area` VALUES ('bb45182bab5c4423977559f5faee659b', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:49:01', '2019-05-13 16:30:49', '1', '0,1,', '江苏省', 30, '20', '2', '', '0');
INSERT INTO `sys_area` VALUES ('c1830cbfb2124ac88e3169c88ee8be23', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:45:37', '2019-05-13 16:30:49', '1', '0,1,', '甘肃省', 30, '11', '2', '', '0');
INSERT INTO `sys_area` VALUES ('c20676e922f048aab17b397d735f2aeb', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:53:53', '2019-05-13 16:30:49', '1', '0,1,', '澳门', 30, '34', '2', '', '0');
INSERT INTO `sys_area` VALUES ('c703df78ed6b491296181433e9cb5824', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:54:12', '2019-05-13 16:30:49', '1', '0,1,', '台湾省', 30, '35', '2', '', '0');
INSERT INTO `sys_area` VALUES ('cc11fc28ebba4dfd90b6210cfe16dab1', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:44:23', '2019-05-13 16:30:49', '1', '0,1,', '吉林省', 30, '7', '2', '', '0');
INSERT INTO `sys_area` VALUES ('d665c0ef42ae424d89007b6cc8de730a', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:45:53', '2019-05-13 16:30:49', '1', '0,1,', '青海省', 30, '12', '2', '', '0');
INSERT INTO `sys_area` VALUES ('f214bdd2352e4334b7f19e06fbc08044', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:47:12', '2019-05-13 16:30:49', '1', '0,1,', '浙江省', 30, '15', '2', '', '0');
INSERT INTO `sys_area` VALUES ('fbb0f3e333884ee2a38ca8f1cf74efce', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:53:03', '2019-05-13 16:30:49', '1', '0,1,', '新疆', 30, '31', '2', '', '0');
INSERT INTO `sys_area` VALUES ('fc0b78acd6c244c78ed2324a27f459a0', 'admin@root@nature-parent', 'admin@root@nature-parent', '2017-12-18 22:46:13', '2019-05-13 16:30:49', '1', '0,1,', '山东省', 30, '13', '2', '', '0');

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '父级编号',
  `value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '数据值',
  `label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标签名',
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类型',
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '描述',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序（升序）',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dict_value`(`value`) USING BTREE,
  INDEX `sys_dict_label`(`label`) USING BTREE,
  INDEX `sys_dict_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_identity
-- ----------------------------
DROP TABLE IF EXISTS `sys_identity`;
CREATE TABLE `sys_identity`  (
  `id` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '删除标记',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `id_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号 | 加密',
  `school_no` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学号 | 加密',
  `school_name` varchar(48) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '日志标题',
  `remote_addr` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作方式',
  `params` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '操作提交的数据',
  `exception` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '异常信息',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_create_by`(`create_by`) USING BTREE,
  INDEX `sys_log_request_uri`(`request_uri`(191)) USING BTREE,
  INDEX `sys_log_type`(`type`) USING BTREE,
  INDEX `sys_log_create_date`(`create_time`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日志表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `href` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '链接',
  `permission` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_menu_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_menu_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1504c9ed5d804cf282f560f7b1e3f5e5', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:20:09', '2019-05-13 22:20:09', NULL, '0', '0', '0,', '书籍长评模块修改权限', 30, NULL, 'book:comment:long:edit');
INSERT INTO `sys_menu` VALUES ('2beedd1daceb48dbb1af2c69365bfdb8', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 21:40:48', '2019-05-13 21:40:48', NULL, '0', '0', '0,', '书籍信息添加模块修改权限', 30, NULL, 'book:add:edit');
INSERT INTO `sys_menu` VALUES ('2c9a27e456514299932675873fe2855b', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:26:09', '2019-05-13 22:26:09', NULL, '0', '0', '0,', '书籍短评模块查看权限', 30, NULL, 'book:comment:short:view');
INSERT INTO `sys_menu` VALUES ('3130ef12be834ed1869c6725fc5b420f', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:16:51', '2019-05-13 22:16:51', NULL, '0', '0', '0,', '书籍信息模块修改权限', 30, NULL, 'book:info:edit');
INSERT INTO `sys_menu` VALUES ('31c72f1b30894e53aaa305196428ad4f', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:16:54', '2019-05-13 22:16:54', NULL, '0', '0', '0,', '书籍信息模块查看权限', 30, NULL, 'book:info:view');
INSERT INTO `sys_menu` VALUES ('39824e1f35ba4f738c552307ed9c0018', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:14:21', '2019-05-13 22:14:21', NULL, '0', '0', '0,', '书籍点赞模块查看权限', 30, NULL, 'book:like:view');
INSERT INTO `sys_menu` VALUES ('4577e78ccaf14e82a9514b1f810fcbda', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:16:51', '2019-05-13 22:16:51', NULL, '0', '0', '0,', '书籍信息模块查看权限', 30, NULL, 'book:info:view');
INSERT INTO `sys_menu` VALUES ('46b8b1bcb5f6403595ef633559d14efc', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:27:31', '2019-05-13 22:27:31', NULL, '0', '0', '0,', '书籍购买模块修改权限', 30, NULL, 'book:buy:edit');
INSERT INTO `sys_menu` VALUES ('64f917648d8e44d4b52242289e640e0b', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 21:46:33', '2019-05-13 21:46:33', NULL, '0', '0', '0,', '书籍借阅模块修改权限', 30, NULL, 'book:borrow:edit');
INSERT INTO `sys_menu` VALUES ('7091725670844c31aa095f75a946d402', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 21:46:47', '2019-05-13 21:46:47', NULL, '0', '0', '0,', '书籍借阅模块查看权限', 30, NULL, 'book:borrow:view');
INSERT INTO `sys_menu` VALUES ('77b792dd64464116a831bdd456db471d', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:20:03', '2019-05-13 22:20:03', NULL, '0', '0', '0,', '书籍长评模块查看权限', 30, NULL, 'book:comment:long:view');
INSERT INTO `sys_menu` VALUES ('865efd5694ee4d30a9092f226325c6e5', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:14:21', '2019-05-13 22:14:21', NULL, '0', '0', '0,', '书籍点赞模块修改权限', 30, NULL, 'book:like:edit');
INSERT INTO `sys_menu` VALUES ('8acd83f4e9474b13b026a64636ad5f20', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:18:01', '2019-05-13 22:18:01', NULL, '0', '0', '0,', '书籍收藏模块修改权限', 30, NULL, 'book:favorite:edit');
INSERT INTO `sys_menu` VALUES ('97a66a44be4d4ce98f178058adb4e700', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:25:22', '2019-05-13 22:25:22', NULL, '0', '0', '0,', '书籍长评回复模块查看权限', 30, NULL, 'book:comment:reply:view');
INSERT INTO `sys_menu` VALUES ('b30ba30675a8492cb18972a253169ddd', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:27:31', '2019-05-13 22:27:31', NULL, '0', '0', '0,', '书籍购买模块查看权限', 30, NULL, 'book:buy:view');
INSERT INTO `sys_menu` VALUES ('bffa0c600d914843b3315c6ddea21503', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 21:40:06', '2019-05-13 21:40:06', NULL, '0', '0', '0,', '书籍信息添加模块查看权限', 30, NULL, 'book:add:view');
INSERT INTO `sys_menu` VALUES ('e9c2929325da4c659dbec3995437201c', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:18:01', '2019-05-13 22:18:01', NULL, '0', '0', '0,', '书籍收藏模块查看权限', 30, NULL, 'book:favorite:view');
INSERT INTO `sys_menu` VALUES ('ea7c8cc177b04d42a997445904e848f6', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:20:09', '2019-05-13 22:20:09', NULL, '0', '0', '0,', '书籍长评模块查看权限', 30, NULL, 'book:comment:long:view');
INSERT INTO `sys_menu` VALUES ('f467baaacae64cf29ec4a6adad26bc92', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 22:25:22', '2019-05-13 22:25:22', NULL, '0', '0', '0,', '书籍长评回复模块修改权限', 30, NULL, 'book:comment:reply:edit');

-- ----------------------------
-- Table structure for sys_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `parent_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所有父级编号',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学校 名称',
  `sort` decimal(10, 0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '归属区域',
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编码',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_office_parent_id`(`parent_id`) USING BTREE,
  INDEX `sys_office_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '机构表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('0', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 16:43:15', '2019-05-13 16:43:15', NULL, '0', '0,', '0', '学校概念', 1, '1', NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `office_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `enname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否系统数据',
  `useable` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_role_del_flag`(`del_flag`) USING BTREE,
  INDEX `sys_role_enname`(`enname`(191)) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('0343f554713c452e8e5e54567940f709', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 17:07:41', '2019-05-13 17:07:41', NULL, '0', '0', '管理员', 'admin', '0', '0', '1', '1');
INSERT INTO `sys_role` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'admin@root@nature-parent', 'admin@root@nature-parent', '2019-05-13 17:07:41', '2019-05-13 17:07:41', NULL, '0', '0', '学生', 'student', '1', '', '0', '1');
INSERT INTO `sys_role` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '38bdb7663e1e45a4a7632cd12ff7ab07', 'admin@root@nature-parent', '2019-05-13 17:07:41', '2019-05-13 17:07:41', NULL, '0', '0', '用户', 'user', '0', NULL, '1', '1');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-菜单' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '1504c9ed5d804cf282f560f7b1e3f5e5');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '2beedd1daceb48dbb1af2c69365bfdb8');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '3130ef12be834ed1869c6725fc5b420f');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '39824e1f35ba4f738c552307ed9c0018');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '4577e78ccaf14e82a9514b1f810fcbda');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '46b8b1bcb5f6403595ef633559d14efc');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '64f917648d8e44d4b52242289e640e0b');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '7091725670844c31aa095f75a946d402');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '865efd5694ee4d30a9092f226325c6e5');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '8acd83f4e9474b13b026a64636ad5f20');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', '97a66a44be4d4ce98f178058adb4e700');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', 'b30ba30675a8492cb18972a253169ddd');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', 'bffa0c600d914843b3315c6ddea21503');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', 'e9c2929325da4c659dbec3995437201c');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', 'ea7c8cc177b04d42a997445904e848f6');
INSERT INTO `sys_role_menu` VALUES ('0343f554713c452e8e5e54567940f709', 'f467baaacae64cf29ec4a6adad26bc92');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '1504c9ed5d804cf282f560f7b1e3f5e5');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '2beedd1daceb48dbb1af2c69365bfdb8');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '3130ef12be834ed1869c6725fc5b420f');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '39824e1f35ba4f738c552307ed9c0018');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '4577e78ccaf14e82a9514b1f810fcbda');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '46b8b1bcb5f6403595ef633559d14efc');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '64f917648d8e44d4b52242289e640e0b');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '7091725670844c31aa095f75a946d402');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '865efd5694ee4d30a9092f226325c6e5');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '8acd83f4e9474b13b026a64636ad5f20');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', '97a66a44be4d4ce98f178058adb4e700');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'b30ba30675a8492cb18972a253169ddd');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'bffa0c600d914843b3315c6ddea21503');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'e9c2929325da4c659dbec3995437201c');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'ea7c8cc177b04d42a997445904e848f6');
INSERT INTO `sys_role_menu` VALUES ('2fafca4d032f4fbe83810d5ab3e25b05', 'f467baaacae64cf29ec4a6adad26bc92');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '1504c9ed5d804cf282f560f7b1e3f5e5');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '2c9a27e456514299932675873fe2855b');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '3130ef12be834ed1869c6725fc5b420f');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '31c72f1b30894e53aaa305196428ad4f');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '39824e1f35ba4f738c552307ed9c0018');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '4577e78ccaf14e82a9514b1f810fcbda');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '46b8b1bcb5f6403595ef633559d14efc');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '77b792dd64464116a831bdd456db471d');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '865efd5694ee4d30a9092f226325c6e5');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '8acd83f4e9474b13b026a64636ad5f20');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', '97a66a44be4d4ce98f178058adb4e700');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', 'b30ba30675a8492cb18972a253169ddd');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', 'e9c2929325da4c659dbec3995437201c');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', 'ea7c8cc177b04d42a997445904e848f6');
INSERT INTO `sys_role_menu` VALUES ('38bdb7663e1e45a4a7632cd12ff7ab07', 'f467baaacae64cf29ec4a6adad26bc92');

-- ----------------------------
-- Table structure for sys_role_office
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office`  (
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`, `office_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色-机构' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '编号',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '创建者',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '更新者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_time` datetime(0) NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '0' COMMENT '删除标记',
  `school_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属学校',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '密码',
  `login_ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '最后登陆IP',
  `login_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录名 / open_id',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否可登录',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '姓名/微信昵称',
  `avatar_url` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户头像',
  `intro` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '个性签名',
  `qq` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `wx_id` varchar(225) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'wx号',
  `user_type` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_user_login_name`(`login_name`) USING BTREE,
  INDEX `sys_user_company_id`(`school_id`) USING BTREE,
  INDEX `sys_user_update_date`(`update_time`) USING BTREE,
  INDEX `sys_user_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户-角色' ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
