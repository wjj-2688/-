/*
 Navicat Premium Data Transfer

 Source Server         : 111
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3306
 Source Schema         : health

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 02/07/2026 18:34:45
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ai_conversation
-- ----------------------------
DROP TABLE IF EXISTS `ai_conversation`;
CREATE TABLE `ai_conversation`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '会话id',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '新对话' COMMENT '会话标题',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `model` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'qwen-plus' COMMENT '使用模型',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态(1正常 0删除)',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ai对话会话表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_conversation
-- ----------------------------
INSERT INTO `ai_conversation` VALUES (1, 'New Chat', 1, 'deepseek-v4-pro', 1, 'admin', '2026-07-02 10:05:55', '2026-07-02 10:05:55');

-- ----------------------------
-- Table structure for ai_message
-- ----------------------------
DROP TABLE IF EXISTS `ai_message`;
CREATE TABLE `ai_message`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消息id',
  `conversation_id` bigint NOT NULL COMMENT '会话id',
  `role` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '角色(user/assistant)',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '消息内容',
  `tokens` int NULL DEFAULT 0 COMMENT '消耗token数',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_conversation_id`(`conversation_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ai对话消息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ai_message
-- ----------------------------
INSERT INTO `ai_message` VALUES (1, 1, 'user', '你是谁', NULL, '2026-07-02 10:05:58');
INSERT INTO `ai_message` VALUES (2, 1, 'assistant', '你好！我是 DeepSeek，一个由深度求索公司创造的专业、友好的 AI 助手。我可以帮你解答问题、提供建议、写作、编程，或者陪你聊天。无论你有什么需要，都可以告诉我，我会尽力为你提供帮助！😊 有什么我可以帮你的吗？', 162, '2026-07-02 10:06:01');

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `form_col_num` int NULL DEFAULT 1 COMMENT '表单布局（单列 双列 三列）',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (1, 't_checkitem', '检查项表', NULL, NULL, 'TCheckitem', 'crud', 'element-plus', 'com.health.reservation', 'reservation', 'checkitem', '检查项管理', 'wjj', 2, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2000}', 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57', NULL);
INSERT INTO `gen_table` VALUES (2, 't_checkgroup', '检查组表', NULL, NULL, 'TCheckgroup', 'crud', 'element-plus', 'com.health.reservation', 'reservation', 'checkgroup', '检查组管理', 'wjj', 2, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2000}', 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22', NULL);
INSERT INTO `gen_table` VALUES (3, 't_checkgroup_checkitem', '检查组检查项关联表', NULL, NULL, 'TCheckgroupCheckitem', 'crud', 'element-plus', 'com.health.system', 'system', 'checkitem', '检查组检查项关联', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-30 16:40:44', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (4, 't_setmeal', '套餐表', NULL, NULL, 'TSetmeal', 'crud', 'element-plus', 'com.health.reservation', 'reservation', 'setmeal', '套餐管理', 'wjj', 2, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2000}', 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21', NULL);
INSERT INTO `gen_table` VALUES (5, 't_setmeal_checkgroup', '套餐检查组关联表', NULL, NULL, 'TSetmealCheckgroup', 'crud', 'element-plus', 'com.health.system', 'system', 'checkgroup', '套餐检查组关联', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-06-30 16:40:44', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (6, 't_ordersetting', '预约设置表', NULL, NULL, 'TOrdersetting', 'crud', 'element-plus', 'com.health.reservation', 'reservation', 'ordersetting', '预约设置', 'wjj', 2, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":2000}', 'admin', '2026-07-02 10:15:34', '', '2026-07-02 10:18:53', NULL);
INSERT INTO `gen_table` VALUES (7, 't_drug', '药品管理表', NULL, NULL, 'TDrug', 'crud', 'element-plus', 'com.health.drug', 'drug', 'druglist', '药品清单', 'wjj', 2, '0', '/', '{\"genView\":\"0\",\"parentMenuId\":3107}', 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22', NULL);
INSERT INTO `gen_table` VALUES (8, 't_physical_report', '体检报告表', NULL, NULL, 'TPhysicalReport', 'crud', 'element-plus', 'com.health.system', 'system', 'report', '体检报告', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-07-02 17:52:40', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (9, 't_statistics_report', '统计报表表', NULL, NULL, 'TStatisticsReport', 'crud', 'element-plus', 'com.health.system', 'system', 'report', '统计报', 'ruoyi', 1, '0', '/', NULL, 'admin', '2026-07-02 17:52:40', '', NULL, NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (1, 1, 'id', 'ID', 'int', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (2, 1, 'code', '检查项编码', 'varchar(16)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (3, 1, 'name', '检查名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (4, 1, 'sex', '适用性别', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 4, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (5, 1, 'age', '适用年龄', 'varchar(32)', 'String', 'age', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 5, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (6, 1, 'price', '价格', 'float', 'Long', 'price', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (7, 1, 'type', '类型', 'char(1)', 'String', 'type', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 7, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (8, 1, 'attention', '注意事项', 'varchar(128)', 'String', 'attention', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (9, 1, 'remark', '备注', 'varchar(128)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (10, 1, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (11, 1, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (12, 1, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (13, 1, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2026-06-30 16:03:29', '', '2026-06-30 16:11:57');
INSERT INTO `gen_table_column` VALUES (14, 2, 'id', '检查组ID', 'int', 'Long', 'id', '1', '1', '0', '0', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (15, 2, 'code', '检查组编码', 'varchar(32)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (16, 2, 'name', '检查组名称', 'varchar(32)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (17, 2, 'help_code', '助记码', 'varchar(32)', 'String', 'helpCode', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (18, 2, 'sex', '适用性别', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 5, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (19, 2, 'remark', '备注', 'varchar(128)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (20, 2, 'attention', '注意事项', 'varchar(128)', 'String', 'attention', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (21, 2, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (22, 2, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (23, 2, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 10, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (24, 2, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 11, 'admin', '2026-06-30 16:40:44', '', '2026-06-30 16:42:22');
INSERT INTO `gen_table_column` VALUES (25, 3, 'checkgroup_id', '检查组ID', 'int', 'Long', 'checkgroupId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-30 16:40:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (26, 3, 'checkitem_id', '检查项ID', 'int', 'Long', 'checkitemId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2026-06-30 16:40:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (27, 4, 'id', '套餐ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (28, 4, 'name', '套餐名称', 'varchar(128)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (29, 4, 'code', '套餐编码', 'varchar(8)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (30, 4, 'help_code', '助记码', 'varchar(16)', 'String', 'helpCode', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (31, 4, 'sex', '适用性别', 'char(1)', 'String', 'sex', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'select', '', 5, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (32, 4, 'age', '适用年龄', 'varchar(32)', 'String', 'age', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 6, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (33, 4, 'price', '价格', 'float', 'Long', 'price', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (34, 4, 'remark', '备注', 'varchar(128)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (35, 4, 'attention', '注意事项', 'varchar(128)', 'String', 'attention', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (36, 4, 'img', '图片路径', 'varchar(128)', 'String', 'img', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 10, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (37, 4, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (38, 4, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (39, 4, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (40, 4, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2026-06-30 16:40:44', '', '2026-07-01 21:42:21');
INSERT INTO `gen_table_column` VALUES (41, 5, 'setmeal_id', '套餐ID', 'int', 'Long', 'setmealId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-06-30 16:40:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (42, 5, 'checkgroup_id', '检查组ID', 'int', 'Long', 'checkgroupId', '1', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2026-06-30 16:40:44', '', NULL);
INSERT INTO `gen_table_column` VALUES (43, 6, 'id', '预约设置ID', 'int', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-07-02 10:15:34', '', '2026-07-02 10:18:53');
INSERT INTO `gen_table_column` VALUES (44, 6, 'order_date', '预约日期', 'date', 'Date', 'orderDate', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'datetime', '', 2, 'admin', '2026-07-02 10:15:34', '', '2026-07-02 10:18:53');
INSERT INTO `gen_table_column` VALUES (45, 6, 'number', '可预约人数', 'int', 'Long', 'number', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-07-02 10:15:34', '', '2026-07-02 10:18:53');
INSERT INTO `gen_table_column` VALUES (46, 6, 'reservations', '已预约人数', 'int', 'Long', 'reservations', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2026-07-02 10:15:34', '', '2026-07-02 10:18:53');
INSERT INTO `gen_table_column` VALUES (47, 7, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (48, 7, 'code', '药品编码', 'varchar(64)', 'String', 'code', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (49, 7, 'name', '药品名称', 'varchar(100)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (50, 7, 'specification', '规格', 'varchar(200)', 'String', 'specification', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (51, 7, 'manufacturer', '生产厂家', 'varchar(200)', 'String', 'manufacturer', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (52, 7, 'unit', '单位', 'varchar(32)', 'String', 'unit', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (53, 7, 'price', '单价', 'decimal(10,2)', 'BigDecimal', 'price', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (54, 7, 'stock', '库存数量', 'int', 'Long', 'stock', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (55, 7, 'category', '分类', 'varchar(64)', 'String', 'category', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (56, 7, 'status', '状态（0停用 1启用）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (57, 7, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 11, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (58, 7, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (59, 7, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 13, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (60, 7, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (61, 7, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', '2026-07-02 16:12:36', '', '2026-07-02 16:22:22');
INSERT INTO `gen_table_column` VALUES (62, 8, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (63, 8, 'report_no', '报告编号', 'varchar(64)', 'String', 'reportNo', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (64, 8, 'name', '姓名', 'varchar(64)', 'String', 'name', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (65, 8, 'gender', '性别（0女 1男）', 'char(1)', 'String', 'gender', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (66, 8, 'age', '年龄', 'int', 'Long', 'age', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (67, 8, 'id_card', '身份证号', 'varchar(18)', 'String', 'idCard', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (68, 8, 'phone', '手机号', 'varchar(11)', 'String', 'phone', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (69, 8, 'exam_date', '体检日期', 'date', 'Date', 'examDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 8, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (70, 8, 'exam_type', '体检类型', 'varchar(64)', 'String', 'examType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 9, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (71, 8, 'department', '科室', 'varchar(64)', 'String', 'department', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (72, 8, 'conclusion', '体检结论', 'varchar(512)', 'String', 'conclusion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 11, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (73, 8, 'suggestion', '建议', 'varchar(512)', 'String', 'suggestion', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 12, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (74, 8, 'doctor', '医生', 'varchar(64)', 'String', 'doctor', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (75, 8, 'status', '状态（0未审核 1已审核）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 14, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (76, 8, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (77, 8, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (78, 8, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 17, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (79, 8, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (80, 8, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 19, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (81, 9, 'id', '主键', 'bigint', 'Long', 'id', '1', '1', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (82, 9, 'report_name', '报表名称', 'varchar(128)', 'String', 'reportName', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (83, 9, 'report_type', '报表类型', 'varchar(64)', 'String', 'reportType', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (84, 9, 'start_date', '开始日期', 'date', 'Date', 'startDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (85, 9, 'end_date', '结束日期', 'date', 'Date', 'endDate', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (86, 9, 'generate_time', '生成时间', 'datetime', 'Date', 'generateTime', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (87, 9, 'data_json', '数据JSON', 'text', 'String', 'dataJson', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'textarea', '', 7, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (88, 9, 'total_count', '总数', 'bigint', 'Long', 'totalCount', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (89, 9, 'status', '状态（0草稿 1已发布）', 'char(1)', 'String', 'status', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (90, 9, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', NULL, 'EQ', 'textarea', '', 10, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (91, 9, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (92, 9, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (93, 9, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2026-07-02 17:52:40', '', NULL);
INSERT INTO `gen_table_column` VALUES (94, 9, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2026-07-02 17:52:40', '', NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');
INSERT INTO `sys_config` VALUES (7, '用户管理-初始密码修改策略', 'sys.account.initPasswordModify', '1', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '0：初始密码修改策略关闭，没有任何提示，1：提醒用户，如果未修改初始密码，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (8, '用户管理-账号密码更新周期', 'sys.account.passwordValidateDays', '0', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '密码更新周期（填写数字，数据初始化值为0不限制，若修改必须为大于0小于365的正整数），如果超过这个周期登录系统时，则在登录时就会提醒修改密码对话框');
INSERT INTO `sys_config` VALUES (9, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2026-06-30 15:46:10', '', NULL, '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数字和特殊字符（目前支持的特殊字符包括：~!@#$%^&*()-=_+）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2026-06-30 15:46:06', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 106 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2026-06-30 15:46:10', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '检查', '1', 'health_type', NULL, 'primary', 'N', '0', 'admin', '2026-06-30 17:21:41', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 1, '检验', '2', 'health_type', NULL, 'warning', 'N', '0', 'admin', '2026-06-30 17:22:03', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 2, '化验', '3', 'health_type', NULL, 'danger', 'N', '0', 'admin', '2026-06-30 17:22:26', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '不限', '0', 'health_sex', NULL, 'primary', 'N', '0', 'admin', '2026-06-30 17:32:14', 'admin', '2026-06-30 17:36:14', NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '男', '1', 'health_sex', NULL, 'primary', 'N', '0', 'admin', '2026-06-30 17:32:29', 'admin', '2026-06-30 17:36:18', NULL);
INSERT INTO `sys_dict_data` VALUES (105, 2, '女', '2', 'health_sex', NULL, 'primary', 'N', '0', 'admin', '2026-06-30 17:32:46', 'admin', '2026-06-30 17:36:21', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2026-06-30 15:46:09', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '检查类型', 'health_type', '0', 'admin', '2026-06-30 17:20:38', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '性别类型', 'health_sex', '0', 'admin', '2026-06-30 17:28:17', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2026-06-30 15:46:10', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2026-06-30 15:46:10', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2026-06-30 15:46:10', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `start_time` datetime NULL DEFAULT NULL COMMENT '执行开始时间',
  `end_time` datetime NULL DEFAULT NULL COMMENT '执行结束时间',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-30 15:58:15');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-06-30 16:19:35');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-01 21:38:17');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 09:08:22');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:04:26');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:28:31');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:37:27');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:37:27');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:38:04');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:38:04');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:39:25');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:39:25');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'WindowsPowerShell 5.1.26100.8655', 'Windows 10.0', '1', '验证码已失效', '2026-07-02 15:41:58');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:44:49');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:44:49');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:46:41');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:46:41');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:47:36');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:47:36');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:47:56');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:47:56');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:54:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:54:21');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Curl 8.19.0', '', '1', '验证码已失效', '2026-07-02 15:55:54');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:56:42');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:56:42');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:58:54');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:58:54');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 15:59:14');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '退出成功', '2026-07-02 15:59:15');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 16:01:26');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 16:46:44');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Edge 149', 'Windows >=10', '0', '登录成功', '2026-07-02 17:51:40');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `route_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由名称',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2025 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2026-06-30 15:46:07', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2026-06-30 15:46:07', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2026-06-30 15:46:07', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', '', 0, 0, 'M', '0', '0', '', 'guide', 'admin', '2026-06-30 15:46:07', '', NULL, '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2026-06-30 15:46:07', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2026-06-30 15:46:07', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2026-06-30 15:46:07', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2026-06-30 15:46:07', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2026-06-30 15:46:07', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2026-06-30 15:46:07', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2026-06-30 15:46:07', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2026-06-30 15:46:07', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2026-06-30 15:46:07', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2026-06-30 15:46:07', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2026-06-30 15:46:07', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2026-06-30 15:46:07', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2026-06-30 15:46:07', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2026-06-30 15:46:07', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2026-06-30 15:46:07', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2026-06-30 15:46:07', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2026-06-30 15:46:07', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2026-06-30 15:46:07', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2026-06-30 15:46:07', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2026-06-30 15:46:07', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2026-06-30 15:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '预约管理', 0, 0, 'reservation', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'date', 'admin', '2026-06-30 16:02:42', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '体检报告', 2000, 1, 'physicalReport', 'report/physicalReport/index', '', '', 1, 0, 'C', '0', '0', 'report:physical:list', 'list', 'admin', '2026-07-02 17:57:31', '', NULL, '体检报告菜单');
INSERT INTO `sys_menu` VALUES (2002, '体检报告查询', 2001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:query', '#', 'admin', '2026-07-02 17:57:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, '体检报告新增', 2001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:add', '#', 'admin', '2026-07-02 17:57:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, '体检报告修改', 2001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:edit', '#', 'admin', '2026-07-02 17:57:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, '体检报告删除', 2001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:remove', '#', 'admin', '2026-07-02 17:57:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, '体检报告导出', 2001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:export', '#', 'admin', '2026-07-02 17:57:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2007, '检查项管理', 2000, 1, 'checkitem', 'reservation/checkitem/index', NULL, '', 1, 0, 'C', '0', '0', 'reservation:checkitem:list', '#', 'admin', '2026-06-30 16:17:17', '', NULL, '检查项管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '检查项管理查询', 2007, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkitem:query', '#', 'admin', '2026-06-30 16:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2009, '检查项管理新增', 2007, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkitem:add', '#', 'admin', '2026-06-30 16:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2010, '检查项管理修改', 2007, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkitem:edit', '#', 'admin', '2026-06-30 16:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2011, '检查项管理删除', 2007, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkitem:remove', '#', 'admin', '2026-06-30 16:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2012, '检查项管理导出', 2007, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkitem:export', '#', 'admin', '2026-06-30 16:17:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '检查组管理', 2000, 1, 'checkgroup', 'reservation/checkgroup/index', NULL, '', 1, 0, 'C', '0', '0', 'reservation:checkgroup:list', '#', 'admin', '2026-06-30 16:46:07', '', NULL, '检查组管理菜单');
INSERT INTO `sys_menu` VALUES (2014, '检查组管理查询', 2013, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkgroup:query', '#', 'admin', '2026-06-30 16:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, '检查组管理新增', 2013, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkgroup:add', '#', 'admin', '2026-06-30 16:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, '检查组管理修改', 2013, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkgroup:edit', '#', 'admin', '2026-06-30 16:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, '检查组管理删除', 2013, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkgroup:remove', '#', 'admin', '2026-06-30 16:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, '检查组管理导出', 2013, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:checkgroup:export', '#', 'admin', '2026-06-30 16:46:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '套餐管理', 2000, 1, 'setmeal', 'reservation/setmeal/index', NULL, '', 1, 0, 'C', '0', '0', 'reservation:setmeal:list', '#', 'admin', '2026-07-01 21:47:38', '', NULL, '套餐管理菜单');
INSERT INTO `sys_menu` VALUES (2026, '套餐管理查询', 2025, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:setmeal:query', '#', 'admin', '2026-07-01 21:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '套餐管理新增', 2025, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:setmeal:add', '#', 'admin', '2026-07-01 21:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '套餐管理修改', 2025, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:setmeal:edit', '#', 'admin', '2026-07-01 21:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '套餐管理删除', 2025, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:setmeal:remove', '#', 'admin', '2026-07-01 21:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '套餐管理导出', 2025, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:setmeal:export', '#', 'admin', '2026-07-01 21:47:39', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, 'AI对话', 0, 5, 'ai/chat', 'ai/chat', NULL, '', 1, 0, 'C', '0', '0', 'ai:chat:list', '#', 'admin', '2026-07-02 09:44:16', '', NULL, 'AI对话菜单');
INSERT INTO `sys_menu` VALUES (2032, '预约设置', 2000, 1, 'ordersetting', 'reservation/ordersetting/index', NULL, '', 1, 0, 'C', '0', '0', 'reservation:ordersetting:list', '#', 'admin', '2026-07-02 10:20:18', '', NULL, '预约设置菜单');
INSERT INTO `sys_menu` VALUES (2033, '预约设置查询', 2032, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:ordersetting:query', '#', 'admin', '2026-07-02 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2034, '预约设置新增', 2032, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:ordersetting:add', '#', 'admin', '2026-07-02 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '预约设置修改', 2032, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:ordersetting:edit', '#', 'admin', '2026-07-02 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '预约设置删除', 2032, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:ordersetting:remove', '#', 'admin', '2026-07-02 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '预约设置导出', 2032, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'reservation:ordersetting:export', '#', 'admin', '2026-07-02 10:20:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3000, '体检报告管理', 0, 5, 'report', NULL, '', '', 1, 0, 'M', '0', '0', '', 'documentation', 'admin', '2026-07-02 17:57:32', '', NULL, '体检报告管理目录');
INSERT INTO `sys_menu` VALUES (3001, '体检报告', 3000, 1, 'physicalReport', 'report/physicalReport/index', '', '', 1, 0, 'C', '0', '0', 'report:physical:list', 'list', 'admin', '2026-07-02 17:57:32', '', NULL, '体检报告菜单');
INSERT INTO `sys_menu` VALUES (3002, '体检报告查询', 3001, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:query', '#', 'admin', '2026-07-02 17:57:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3003, '体检报告新增', 3001, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:add', '#', 'admin', '2026-07-02 17:57:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3004, '体检报告修改', 3001, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:edit', '#', 'admin', '2026-07-02 17:57:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3005, '体检报告删除', 3001, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:remove', '#', 'admin', '2026-07-02 17:57:32', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3006, '体检报告导出', 3001, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'report:physical:export', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3010, '统计报表管理', 0, 6, 'statistics', NULL, '', '', 1, 0, 'M', '0', '0', '', 'chart', 'admin', '2026-07-02 17:57:33', '', NULL, '统计报表管理目录');
INSERT INTO `sys_menu` VALUES (3011, '统计报表', 3010, 1, 'statisticsReport', 'statistics/statisticsReport/index', '', '', 1, 0, 'C', '0', '0', 'statistics:report:list', 'table', 'admin', '2026-07-02 17:57:33', '', NULL, '统计报表菜单');
INSERT INTO `sys_menu` VALUES (3012, '统计报表查询', 3011, 1, '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:query', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3013, '统计报表新增', 3011, 2, '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:add', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3014, '统计报表修改', 3011, 3, '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:edit', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3015, '统计报表删除', 3011, 4, '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:remove', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3016, '统计报表导出', 3011, 5, '', '', '', '', 1, 0, 'F', '0', '0', 'statistics:report:export', '#', 'admin', '2026-07-02 17:57:33', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3107, '药品管理', 0, 2, 'drug', NULL, NULL, '', 1, 0, 'M', '0', '0', NULL, 'people', 'admin', '2026-07-02 16:19:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3108, '药品清单', 3107, 1, 'druglist', 'drug/druglist/index', NULL, '', 1, 0, 'C', '0', '0', 'drug:druglist:list', '#', 'admin', '2026-07-02 16:26:39', '', NULL, '药品清单菜单');
INSERT INTO `sys_menu` VALUES (3109, '药品清单查询', 3108, 1, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'drug:druglist:query', '#', 'admin', '2026-07-02 16:26:40', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3110, '药品清单新增', 3108, 2, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'drug:druglist:add', '#', 'admin', '2026-07-02 16:26:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3111, '药品清单修改', 3108, 3, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'drug:druglist:edit', '#', 'admin', '2026-07-02 16:26:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3112, '药品清单删除', 3108, 4, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'drug:druglist:remove', '#', 'admin', '2026-07-02 16:26:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3113, '药品清单导出', 3108, 5, '#', '', NULL, '', 1, 0, 'F', '0', '0', 'drug:druglist:export', '#', 'admin', '2026-07-02 16:26:41', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2026-06-30 15:46:10', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2026-06-30 15:46:10', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (3, '若依开源框架介绍', '1', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE9A1B9E79BAEE4BB8BE7BB8D3C2F7370616E3E3C2F703E3C703E3C666F6E7420636F6C6F723D2223333333333333223E52756F5969E5BC80E6BA90E9A1B9E79BAEE698AFE4B8BAE4BC81E4B89AE794A8E688B7E5AE9AE588B6E79A84E5908EE58FB0E8849AE6898BE69EB6E6A186E69EB6EFBC8CE4B8BAE4BC81E4B89AE68993E980A0E79A84E4B880E7AB99E5BC8FE8A7A3E586B3E696B9E6A188EFBC8CE9998DE4BD8EE4BC81E4B89AE5BC80E58F91E68890E69CACEFBC8CE68F90E58D87E5BC80E58F91E69588E78E87E38082E4B8BBE8A681E58C85E68BACE794A8E688B7E7AEA1E79086E38081E8A792E889B2E7AEA1E79086E38081E983A8E997A8E7AEA1E79086E38081E88F9CE58D95E7AEA1E79086E38081E58F82E695B0E7AEA1E79086E38081E5AD97E585B8E7AEA1E79086E380813C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE5B297E4BD8DE7AEA1E790863C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E5AE9AE697B6E4BBBBE58AA13C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE380813C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE69C8DE58AA1E79B91E68EA7E38081E799BBE5BD95E697A5E5BF97E38081E6938DE4BD9CE697A5E5BF97E38081E4BBA3E7A081E7949FE68890E7AD89E58A9FE883BDE38082E585B6E4B8ADEFBC8CE8BF98E694AFE68C81E5A49AE695B0E68DAEE6BA90E38081E695B0E68DAEE69D83E99990E38081E59BBDE99985E58C96E380815265646973E7BC93E5AD98E38081446F636B6572E983A8E7BDB2E38081E6BB91E58AA8E9AA8CE8AF81E7A081E38081E7ACACE4B889E696B9E8AEA4E8AF81E799BBE5BD95E38081E58886E5B883E5BC8FE4BA8BE58AA1E380813C2F7370616E3E3C666F6E7420636F6C6F723D2223333333333333223EE58886E5B883E5BC8FE69687E4BBB6E5AD98E582A83C2F666F6E743E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE38081E58886E5BA93E58886E8A1A8E5A484E79086E7AD89E68A80E69CAFE789B9E782B9E380823C2F7370616E3E3C2F703E3C703E3C696D67207372633D2268747470733A2F2F666F727564612E67697465652E636F6D2F696D616765732F313737333933313834383334323433393033322F61346432323331335F313831353039352E706E6722207374796C653D2277696474683A20363470783B223E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223EE5AE98E7BD91E58F8AE6BC94E7A4BA3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE5AE98E7BD91E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F72756F79692E7669703C2F613E3C6120687265663D22687474703A2F2F72756F79692E76697022207461726765743D225F626C616E6B223E3C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE88BA5E4BE9DE69687E6A1A3E59CB0E59D80EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F646F632E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F646F632E72756F79692E7669703C2F613E3C62723E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E4B88DE58886E7A6BBE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F64656D6F2E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F64656D6F2E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E58886E7A6BBE78988E69CACE38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F7675652E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F7675652E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E5BEAEE69C8DE58AA1E78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F636C6F75642E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F636C6F75642E72756F79692E7669703C2F613E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A207267622835312C2035312C203531293B223EE6BC94E7A4BAE59CB0E59D80E38090E7A7BBE58AA8E7ABAFE78988E38091EFBC9A266E6273703B3C2F7370616E3E3C6120687265663D22687474703A2F2F68352E72756F79692E76697022207461726765743D225F626C616E6B223E687474703A2F2F68352E72756F79692E7669703C2F613E3C2F703E3C703E3C6272207374796C653D22636F6C6F723A207267622834382C2034392C203531293B20666F6E742D66616D696C793A202671756F743B48656C766574696361204E6575652671756F743B2C2048656C7665746963612C20417269616C2C2073616E732D73657269663B20666F6E742D73697A653A20313270783B223E3C2F703E, '0', 'admin', '2026-06-30 15:46:10', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice_read`;
CREATE TABLE `sys_notice_read`  (
  `read_id` bigint NOT NULL AUTO_INCREMENT COMMENT '已读主键',
  `notice_id` int NOT NULL COMMENT '公告id',
  `user_id` bigint NOT NULL COMMENT '用户id',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`read_id`) USING BTREE,
  UNIQUE INDEX `uk_user_notice`(`user_id` ASC, `notice_id` ASC) USING BTREE COMMENT '同一用户同一公告只记录一次'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '公告已读记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice_read
-- ----------------------------

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 124 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 1, 'com.health.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"date\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"预约管理\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"reservation\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:02:42', 33);
INSERT INTO `sys_oper_log` VALUES (101, '代码生成', 6, 'com.health.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_checkitem\",\"tplWebType\":\"element-plus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:03:29', 70);
INSERT INTO `sys_oper_log` VALUES (102, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"checkitem\",\"className\":\"TCheckitem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"检查项编码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(16)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"检查名称\",\"columnId\":3,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"适用性别\",\"columnId\":4,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"sex\",\"javaType\":\"String\",\"list\":tru', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:06:16', 45);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_checkitem\"}', NULL, 0, NULL, '2026-06-30 16:06:22', 160);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"checkitem\",\"className\":\"TCheckitem\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"ID\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:06:16\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"检查项编码\",\"columnId\":2,\"columnName\":\"code\",\"columnType\":\"varchar(16)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:06:16\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"检查名称\",\"columnId\":3,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:06:16\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"适用性别\",\"columnId\":4,\"columnName\":\"sex\",\"columnType\":\"char(1)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:03:29\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:11:57', 79);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_checkitem\"}', NULL, 0, NULL, '2026-06-30 16:12:00', 160);
INSERT INTO `sys_oper_log` VALUES (106, '代码生成', 6, 'com.health.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_checkgroup,t_checkgroup_checkitem,t_setmeal,t_setmeal_checkgroup\",\"tplWebType\":\"element-plus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:40:44', 243);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"checkgroup\",\"className\":\"TCheckgroup\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"检查组ID\",\"columnId\":14,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"检查组编码\",\"columnId\":15,\"columnName\":\"code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"检查组名称\",\"columnId\":16,\"columnName\":\"name\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HelpCode\",\"columnComment\":\"助记码\",\"columnId\":17,\"columnName\":\"help_code\",\"columnType\":\"varchar(32)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"helpCode\",\"j', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:42:22', 72);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_checkgroup\"}', NULL, 0, NULL, '2026-06-30 16:42:27', 346);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"setmeal\",\"className\":\"TSetmeal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"套餐ID\",\"columnId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"套餐名称\",\"columnId\":28,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"套餐编码\",\"columnId\":29,\"columnName\":\"code\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"HelpCode\",\"columnComment\":\"助记码\",\"columnId\":30,\"columnName\":\"help_code\",\"columnType\":\"varchar(16)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"helpCode\",\"javaType\":\"', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 16:43:52', 45);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_setmeal\"}', NULL, 0, NULL, '2026-06-30 16:43:55', 51);
INSERT INTO `sys_oper_log` VALUES (111, '字典类型', 1, 'com.health.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"检查类型\",\"dictType\":\"health_type\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:20:38', 131);
INSERT INTO `sys_oper_log` VALUES (112, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"检查\",\"dictSort\":0,\"dictType\":\"health_type\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:21:41', 16);
INSERT INTO `sys_oper_log` VALUES (113, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"检验\",\"dictSort\":1,\"dictType\":\"health_type\",\"dictValue\":\"2\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:22:03', 11);
INSERT INTO `sys_oper_log` VALUES (114, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"化验\",\"dictSort\":2,\"dictType\":\"health_type\",\"dictValue\":\"3\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:22:26', 13);
INSERT INTO `sys_oper_log` VALUES (115, '字典类型', 1, 'com.health.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"性别类型\",\"dictType\":\"health_sex\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:28:17', 13);
INSERT INTO `sys_oper_log` VALUES (116, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"不限\",\"dictSort\":0,\"dictType\":\"health_sex\",\"dictValue\":\"1\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:32:14', 12);
INSERT INTO `sys_oper_log` VALUES (117, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"health_sex\",\"dictValue\":\"2\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:32:29', 13);
INSERT INTO `sys_oper_log` VALUES (118, '字典数据', 1, 'com.health.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"女\",\"dictSort\":2,\"dictType\":\"health_sex\",\"dictValue\":\"3\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:32:46', 13);
INSERT INTO `sys_oper_log` VALUES (119, '字典数据', 2, 'com.health.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-30 17:32:14\",\"default\":false,\"dictCode\":103,\"dictLabel\":\"不限\",\"dictSort\":0,\"dictType\":\"health_sex\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:36:14', 21);
INSERT INTO `sys_oper_log` VALUES (120, '字典数据', 2, 'com.health.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-30 17:32:29\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"男\",\"dictSort\":1,\"dictType\":\"health_sex\",\"dictValue\":\"1\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:36:18', 15);
INSERT INTO `sys_oper_log` VALUES (121, '字典数据', 2, 'com.health.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2026-06-30 17:32:46\",\"default\":false,\"dictCode\":105,\"dictLabel\":\"女\",\"dictSort\":2,\"dictType\":\"health_sex\",\"dictValue\":\"2\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-06-30 17:36:21', 14);
INSERT INTO `sys_oper_log` VALUES (122, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"setmeal\",\"className\":\"TSetmeal\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"套餐ID\",\"columnId\":27,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:43:52\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"套餐名称\",\"columnId\":28,\"columnName\":\"name\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:43:52\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"套餐编码\",\"columnId\":29,\"columnName\":\"code\",\"columnType\":\"varchar(8)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"updateTime\":\"2026-06-30 16:43:52\",\"usableColumn\":false},{\"capJavaField\":\"HelpCode\",\"columnComment\":\"助记码\",\"columnId\":30,\"columnName\":\"help_code\",\"columnType\":\"varchar(16)\",\"createBy\":\"admin\",\"createTime\":\"2026-06-30 16:40:44\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 21:42:21', 66);
INSERT INTO `sys_oper_log` VALUES (123, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_setmeal\"}', NULL, 0, NULL, '2026-07-01 21:42:26', 189);
INSERT INTO `sys_oper_log` VALUES (124, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"code\":\"10000\",\"createTime\":\"2026-07-01 22:06:45\",\"id\":36,\"name\":\"111\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:06:46', 167);
INSERT INTO `sys_oper_log` VALUES (125, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/36', '127.0.0.1', '内网IP', '[36] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:06:54', 11);
INSERT INTO `sys_oper_log` VALUES (126, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"checkItemIds\":[28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127],\"code\":\"11111\",\"createTime\":\"2026-07-01 22:19:10\",\"id\":37,\"name\":\"111\",\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [groupId, checkItemIds, param1, param2]\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupCheckitemMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupCheckitemMapper.insertCheckitemIds\r\n### The error occurred while executing an update\r\n### Cause: org.apache.ibatis.binding.BindingException: Parameter \'list\' not found. Available parameters are [groupId, checkItemIds, param1, param2]', '2026-07-01 22:19:10', 124);
INSERT INTO `sys_oper_log` VALUES (127, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"checkItemIds\":[28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127],\"code\":\"11111\",\"createTime\":\"2026-07-01 22:20:48\",\"id\":38,\"name\":\"111\",\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupCheckitemMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupCheckitemMapper.insertCheckitemIds\r\n### The error occurred while executing an update\r\n### Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]', '2026-07-01 22:20:48', 131);
INSERT INTO `sys_oper_log` VALUES (128, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"checkItemIds\":[28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127],\"code\":\"1111\",\"createTime\":\"2026-07-01 22:21:00\",\"id\":39,\"name\":\"11\",\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupCheckitemMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupCheckitemMapper.insertCheckitemIds\r\n### The error occurred while executing an update\r\n### Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]', '2026-07-01 22:21:00', 12);
INSERT INTO `sys_oper_log` VALUES (129, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"checkItemIds\":[29,28,30,31],\"code\":\"111111\",\"createTime\":\"2026-07-01 22:21:16\",\"id\":40,\"name\":\"111\",\"params\":{}} ', NULL, 1, '\r\n### Error updating database.  Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupCheckitemMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupCheckitemMapper.insertCheckitemIds\r\n### The error occurred while executing an update\r\n### Cause: org.apache.ibatis.binding.BindingException: Parameter \'checkItemIds\' not found. Available parameters are [groupId, list, param1, param2]', '2026-07-01 22:21:17', 12);
INSERT INTO `sys_oper_log` VALUES (130, '检查组管理', 1, 'com.health.reservation.controller.TCheckgroupController.add()', 'POST', 1, 'admin', '研发部门', '/reservation/checkgroup', '127.0.0.1', '内网IP', '{\"checkItemIds\":[29,28,30,31],\"code\":\"111111\",\"createTime\":\"2026-07-01 22:22:20\",\"id\":41,\"name\":\"111\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:22:20', 129);
INSERT INTO `sys_oper_log` VALUES (131, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/39', '127.0.0.1', '内网IP', '[39] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:22:27', 13);
INSERT INTO `sys_oper_log` VALUES (132, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/38', '127.0.0.1', '内网IP', '[38] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:22:28', 10);
INSERT INTO `sys_oper_log` VALUES (133, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/37', '127.0.0.1', '内网IP', '[37] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:22:30', 9);
INSERT INTO `sys_oper_log` VALUES (134, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/40', '127.0.0.1', '内网IP', '[40] ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-01 22:22:32', 9);
INSERT INTO `sys_oper_log` VALUES (135, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/41', '127.0.0.1', '内网IP', '[41] ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupMapper.deleteTCheckgroupByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_checkgroup where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))', '2026-07-01 22:22:33', 137);
INSERT INTO `sys_oper_log` VALUES (136, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/41', '127.0.0.1', '内网IP', '[41] ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupMapper.deleteTCheckgroupByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_checkgroup where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))', '2026-07-01 22:22:37', 10);
INSERT INTO `sys_oper_log` VALUES (137, '检查组管理', 3, 'com.health.reservation.controller.TCheckgroupController.remove()', 'DELETE', 1, 'admin', '研发部门', '/reservation/checkgroup/41', '127.0.0.1', '内网IP', '[41] ', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\r\n### The error may exist in file [D:\\shixun\\20260627154134\\health\\health-reservation\\target\\classes\\mapper\\reservation\\TCheckgroupMapper.xml]\r\n### The error may involve com.health.reservation.mapper.TCheckgroupMapper.deleteTCheckgroupByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_checkgroup where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))\n; Cannot delete or update a parent row: a foreign key constraint fails (`health`.`t_checkgroup_checkitem`, CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`))', '2026-07-01 22:23:15', 11);
INSERT INTO `sys_oper_log` VALUES (138, '代码生成', 6, 'com.health.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_ordersetting\",\"tplWebType\":\"element-plus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 10:15:34', 168);
INSERT INTO `sys_oper_log` VALUES (139, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_ordersetting\"}', NULL, 0, NULL, '2026-07-02 10:15:59', 158);
INSERT INTO `sys_oper_log` VALUES (140, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ordersetting\",\"className\":\"TOrdersetting\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"预约设置ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"预约日期\",\"columnId\":44,\"columnName\":\"order_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"orderDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"可预约人数\",\"columnId\":45,\"columnName\":\"number\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Reservations\",\"columnComment\":\"已预约人数\",\"columnId\":46,\"columnName\":\"reservations\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"rese', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 10:18:32', 81);
INSERT INTO `sys_oper_log` VALUES (141, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"ordersetting\",\"className\":\"TOrdersetting\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"预约设置ID\",\"columnId\":43,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-07-02 10:18:32\",\"usableColumn\":false},{\"capJavaField\":\"OrderDate\",\"columnComment\":\"预约日期\",\"columnId\":44,\"columnName\":\"order_date\",\"columnType\":\"date\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"orderDate\",\"javaType\":\"Date\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-07-02 10:18:32\",\"usableColumn\":false},{\"capJavaField\":\"Number\",\"columnComment\":\"可预约人数\",\"columnId\":45,\"columnName\":\"number\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"number\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"updateTime\":\"2026-07-02 10:18:32\",\"usableColumn\":false},{\"capJavaField\":\"Reservations\",\"columnComment\":\"已预约人数\",\"columnId\":46,\"columnName\":\"reservations\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 10:15:34\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 10:18:53', 18);
INSERT INTO `sys_oper_log` VALUES (142, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_ordersetting\"}', NULL, 0, NULL, '2026-07-02 10:18:56', 30);
INSERT INTO `sys_oper_log` VALUES (143, '预约设置', 1, 'com.health.reservation.controller.TOrdersettingController.addByPath()', 'POST', 1, 'admin', '研发部门', '/reservation/ordersetting/add', '127.0.0.1', '内网IP', '{\"id\":1,\"number\":10,\"orderDate\":\"2026-07-03\",\"params\":{}} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 10:41:25', 123);
INSERT INTO `sys_oper_log` VALUES (144, '代码生成', 6, 'com.health.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_drug\",\"tplWebType\":\"element-plus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 16:12:36', 98);
INSERT INTO `sys_oper_log` VALUES (145, '菜单管理', 1, 'com.health.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"药品管理\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"drug\",\"status\":\"0\",\"visible\":\"0\"} ', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 16:19:19', 21);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.health.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"druglist\",\"className\":\"TDrug\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"主键\",\"columnId\":47,\"columnName\":\"id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 16:12:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":true,\"isIncrement\":\"1\",\"isInsert\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Code\",\"columnComment\":\"药品编码\",\"columnId\":48,\"columnName\":\"code\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 16:12:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"code\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":2,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"药品名称\",\"columnId\":49,\"columnName\":\"name\",\"columnType\":\"varchar(100)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 16:12:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":7,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Specification\",\"columnComment\":\"规格\",\"columnId\":50,\"columnName\":\"specification\",\"columnType\":\"varchar(200)\",\"createBy\":\"admin\",\"createTime\":\"2026-07-02 16:12:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"specification', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 16:22:22', 53);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.health.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_drug\"}', NULL, 0, NULL, '2026-07-02 16:22:31', 148);
INSERT INTO `sys_oper_log` VALUES (148, '代码生成', 6, 'com.health.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_statistics_report,t_physical_report\",\"tplWebType\":\"element-plus\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2026-07-02 17:52:40', 102);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2026-06-30 15:46:07', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2026-06-30 15:46:07', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2026-06-30 15:46:07', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2026-06-30 15:46:07', '', NULL, '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '账号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `pwd_update_date` datetime NULL DEFAULT NULL COMMENT '密码最后更新时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-07-02 17:51:38', '2026-06-30 15:46:07', 'admin', '2026-06-30 15:46:07', '', NULL, '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2026-06-30 15:46:07', '2026-06-30 15:46:07', 'admin', '2026-06-30 15:46:07', '', NULL, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup`;
CREATE TABLE `t_checkgroup`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '检查组ID',
  `code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `help_code` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '助记码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别（0男 1女 2不限）',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `attention` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注意事项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 36 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '检查组表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkgroup
-- ----------------------------
INSERT INTO `t_checkgroup` VALUES (5, '0001', '一般检查', 'YBJC', '0', '一般检查', '无', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (6, '0002', '视力色觉', 'SLSJ', '0', '视力色觉', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (7, '0003', '血常规', 'XCG', '0', '血常规', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (8, '0004', '尿常规', 'NCG', '0', '尿常规', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (9, '0005', '肝功三项', 'GGSX', '0', '肝功三项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (10, '0006', '肾功三项', 'NGSX', '0', '肾功三项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (11, '0007', '血脂四项', 'XZSX', '0', '血脂四项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (12, '0008', '心肌酶三项', 'XJMSX', '0', '心肌酶三项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (13, '0009', '甲功三项', 'JGSX', '0', '甲功三项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (14, '0010', '子宫附件彩超', 'ZGFJCC', '2', '子宫附件彩超', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (15, '0011', '胆红素三项', 'DHSSX', '0', '胆红素三项', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (16, '0012', '肿瘤标志物', 'ZLBZW', '0', '肿瘤标志物', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (17, '0013', '碳十四呼气试验', 'TSISHQSY', '0', '碳十四呼气试验', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (18, '0014', '心电图', 'XDT', '0', '心电图', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (19, '0015', '胸部正位', 'XZZW', '0', '胸部正位', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (20, '0016', '腹部彩超', 'FBCC', '0', '腹部彩超', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (21, '0017', '前列腺彩超', 'QLXCC', '1', '前列腺彩超', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (22, '0018', '妇科彩超', 'FKCC', '2', '妇科彩超', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (23, '0019', '乳腺彩超', 'RXCC', '2', '乳腺彩超', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (24, '0020', '宫颈TCT', 'GJTCT', '2', '宫颈TCT', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (25, '0021', 'HPV', 'HPV', '2', 'HPV', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (26, '0022', 'C13呼气试验', 'C13HQS', '0', 'C13呼气试验', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (27, '0023', '幽门螺旋杆菌抗体', 'YMLXGJTK', '0', '幽门螺旋杆菌抗体', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (28, '0024', '糖化血红蛋白', 'THXHD', '0', '糖化血红蛋白', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (29, '0025', '同型半胱氨酸', 'TXBGS', '0', '同型半胱氨酸', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (30, '0026', '维生素', 'WSS', '0', '维生素', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (31, '0027', '骨密度', 'GMD', '0', '骨密度', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (32, '0028', '眼底检查', 'YDJC', '0', '眼底检查', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (33, '0029', '听力检查', 'TLJC', '0', '听力检查', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (34, '0030', '口腔检查', 'KKJC', '0', '口腔检查', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (35, '0031', '耳鼻喉检查', 'EBHJC', '0', '耳鼻喉检查', NULL, 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkgroup` VALUES (41, '111111', '111', NULL, NULL, NULL, NULL, '', '2026-07-01 22:22:20', '', NULL);

-- ----------------------------
-- Table structure for t_checkgroup_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkgroup_checkitem`;
CREATE TABLE `t_checkgroup_checkitem`  (
  `checkgroup_id` int NOT NULL COMMENT '检查组ID',
  `checkitem_id` int NOT NULL COMMENT '检查项ID',
  PRIMARY KEY (`checkgroup_id`, `checkitem_id`) USING BTREE,
  INDEX `checkitem_id`(`checkitem_id` ASC) USING BTREE,
  CONSTRAINT `fk_checkgroup_checkitem_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_checkgroup_checkitem_item` FOREIGN KEY (`checkitem_id`) REFERENCES `t_checkitem` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '检查组检查项关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkgroup_checkitem
-- ----------------------------
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 28);
INSERT INTO `t_checkgroup_checkitem` VALUES (41, 28);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 29);
INSERT INTO `t_checkgroup_checkitem` VALUES (41, 29);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 30);
INSERT INTO `t_checkgroup_checkitem` VALUES (41, 30);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 31);
INSERT INTO `t_checkgroup_checkitem` VALUES (41, 31);
INSERT INTO `t_checkgroup_checkitem` VALUES (5, 32);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 33);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 34);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 35);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 36);
INSERT INTO `t_checkgroup_checkitem` VALUES (6, 37);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 38);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 39);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 40);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 41);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 42);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 43);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 44);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 45);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 46);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 47);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 48);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 49);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 50);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 51);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 52);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 53);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 54);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 55);
INSERT INTO `t_checkgroup_checkitem` VALUES (7, 56);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 57);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 58);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 59);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 60);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 61);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 62);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 63);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 64);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 65);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 66);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 67);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 68);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 69);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 70);
INSERT INTO `t_checkgroup_checkitem` VALUES (8, 71);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 72);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 73);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 74);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 74);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 75);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 75);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 76);
INSERT INTO `t_checkgroup_checkitem` VALUES (15, 76);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 77);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 78);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 79);
INSERT INTO `t_checkgroup_checkitem` VALUES (9, 80);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 81);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 82);
INSERT INTO `t_checkgroup_checkitem` VALUES (10, 83);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 84);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 85);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 86);
INSERT INTO `t_checkgroup_checkitem` VALUES (11, 87);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 90);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 91);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 92);
INSERT INTO `t_checkgroup_checkitem` VALUES (12, 93);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 94);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 95);
INSERT INTO `t_checkgroup_checkitem` VALUES (13, 96);
INSERT INTO `t_checkgroup_checkitem` VALUES (18, 98);
INSERT INTO `t_checkgroup_checkitem` VALUES (19, 99);
INSERT INTO `t_checkgroup_checkitem` VALUES (20, 100);
INSERT INTO `t_checkgroup_checkitem` VALUES (21, 101);
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 102);
INSERT INTO `t_checkgroup_checkitem` VALUES (22, 102);
INSERT INTO `t_checkgroup_checkitem` VALUES (14, 103);
INSERT INTO `t_checkgroup_checkitem` VALUES (23, 103);
INSERT INTO `t_checkgroup_checkitem` VALUES (24, 104);
INSERT INTO `t_checkgroup_checkitem` VALUES (25, 105);
INSERT INTO `t_checkgroup_checkitem` VALUES (17, 106);
INSERT INTO `t_checkgroup_checkitem` VALUES (26, 107);
INSERT INTO `t_checkgroup_checkitem` VALUES (27, 108);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 109);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 110);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 111);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 112);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 113);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 114);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 115);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 116);
INSERT INTO `t_checkgroup_checkitem` VALUES (16, 117);
INSERT INTO `t_checkgroup_checkitem` VALUES (28, 118);
INSERT INTO `t_checkgroup_checkitem` VALUES (29, 119);
INSERT INTO `t_checkgroup_checkitem` VALUES (30, 120);
INSERT INTO `t_checkgroup_checkitem` VALUES (30, 121);
INSERT INTO `t_checkgroup_checkitem` VALUES (30, 122);
INSERT INTO `t_checkgroup_checkitem` VALUES (31, 123);
INSERT INTO `t_checkgroup_checkitem` VALUES (32, 124);
INSERT INTO `t_checkgroup_checkitem` VALUES (33, 125);
INSERT INTO `t_checkgroup_checkitem` VALUES (34, 126);
INSERT INTO `t_checkgroup_checkitem` VALUES (35, 127);

-- ----------------------------
-- Table structure for t_checkitem
-- ----------------------------
DROP TABLE IF EXISTS `t_checkitem`;
CREATE TABLE `t_checkitem`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '检查项ID',
  `code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别（0男 1女 2不限）',
  `age` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年龄范围',
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '类型（1检查 2检验）',
  `attention` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注意事项',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '检查项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_checkitem
-- ----------------------------
INSERT INTO `t_checkitem` VALUES (28, '0001', '身高', '0', '0-100', 5, '1', '无', '身高', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (29, '0002', '体重', '0', '0-100', 5, '1', '无', '体重', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (30, '0003', '体重指数', '0', '0-100', 5, '1', '无', '体重指数', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (31, '0004', '收缩压', '0', '0-100', 5, '1', '无', '收缩压', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (32, '0005', '舒张压', '0', '0-100', 5, '1', '无', '舒张压', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (33, '0006', '裸视力（右）', '0', '0-100', 5, '1', '无', '裸视力（右）', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (34, '0007', '裸视力（左）', '0', '0-100', 5, '1', '无', '裸视力（左）', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (35, '0008', '矫正视力（右）', '0', '0-100', 5, '1', '无', '矫正视力（右）', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (36, '0009', '矫正视力（左）', '0', '0-100', 5, '1', '无', '矫正视力（左）', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (37, '0010', '色觉', '0', '0-100', 5, '1', '无', '色觉', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (38, '0011', '白细胞计数', '0', '0-100', 10, '2', '无', '血常规', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (39, '0012', '红细胞计数', '0', '0-100', 10, '2', NULL, '红细胞计数', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (40, '0013', '血红蛋白', '0', '0-100', 10, '2', NULL, '血红蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (41, '0014', '红细胞压积', '0', '0-100', 10, '2', NULL, '红细胞压积', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (42, '0015', '平均红细胞体积', '0', '0-100', 10, '2', NULL, '平均红细胞体积', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (43, '0016', '平均红细胞血红蛋白含量', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白含量', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (44, '0017', '平均红细胞血红蛋白浓度', '0', '0-100', 10, '2', NULL, '平均红细胞血红蛋白浓度', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (45, '0018', '红细胞分布宽度-变异系数', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-变异系数', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (46, '0019', '血小板计数', '0', '0-100', 10, '2', NULL, '血小板计数', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (47, '0020', '平均血小板体积', '0', '0-100', 10, '2', NULL, '平均血小板体积', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (48, '0021', '血小板分布宽度', '0', '0-100', 10, '2', NULL, '血小板分布宽度', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (49, '0022', '淋巴细胞百分比', '0', '0-100', 10, '2', NULL, '淋巴细胞百分比', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (50, '0023', '中间细胞百分比', '0', '0-100', 10, '2', NULL, '中间细胞百分比', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (51, '0024', '中性粒细胞百分比', '0', '0-100', 10, '2', NULL, '中性粒细胞百分比', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (52, '0025', '淋巴细胞绝对值', '0', '0-100', 10, '2', NULL, '淋巴细胞绝对值', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (53, '0026', '中间细胞绝对值', '0', '0-100', 10, '2', NULL, '中间细胞绝对值', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (54, '0027', '中性粒细胞绝对值', '0', '0-100', 10, '2', NULL, '中性粒细胞绝对值', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (55, '0028', '红细胞分布宽度-标准差', '0', '0-100', 10, '2', NULL, '红细胞分布宽度-标准差', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (56, '0029', '血小板压积', '0', '0-100', 10, '2', NULL, '血小板压积', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (57, '0030', '尿比重', '0', '0-100', 10, '2', NULL, '尿比重', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (58, '0031', '尿酸碱度', '0', '0-100', 10, '2', NULL, '尿酸碱度', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (59, '0032', '尿白细胞', '0', '0-100', 10, '2', NULL, '尿白细胞', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (60, '0033', '尿亚硝酸盐', '0', '0-100', 10, '2', NULL, '尿亚硝酸盐', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (61, '0034', '尿蛋白质', '0', '0-100', 10, '2', NULL, '尿蛋白质', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (62, '0035', '尿糖', '0', '0-100', 10, '2', NULL, '尿糖', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (63, '0036', '尿酮体', '0', '0-100', 10, '2', NULL, '尿酮体', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (64, '0037', '尿胆原', '0', '0-100', 10, '2', NULL, '尿胆原', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (65, '0038', '尿胆红素', '0', '0-100', 10, '2', NULL, '尿胆红素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (66, '0039', '尿隐血', '0', '0-100', 10, '2', NULL, '尿隐血', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (67, '0040', '尿镜检红细胞', '0', '0-100', 10, '2', NULL, '尿镜检红细胞', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (68, '0041', '尿镜检白细胞', '0', '0-100', 10, '2', NULL, '尿镜检白细胞', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (69, '0042', '上皮细胞', '0', '0-100', 10, '2', NULL, '上皮细胞', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (70, '0043', '无机盐类', '0', '0-100', 10, '2', NULL, '无机盐类', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (71, '0044', '尿', '0', '0-100', 10, '2', NULL, '尿', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (72, '0045', '丙氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '丙氨酸氨基转移酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (73, '0046', '天门冬氨酸氨基转移酶', '0', '0-100', 10, '2', NULL, '天门冬氨酸氨基转移酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (74, '0047', '总胆红素', '0', '0-100', 10, '2', NULL, '总胆红素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (75, '0048', '直接胆红素', '0', '0-100', 10, '2', NULL, '直接胆红素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (76, '0049', '间接胆红素', '0', '0-100', 10, '2', NULL, '间接胆红素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (77, '0050', '总蛋白', '0', '0-100', 10, '2', NULL, '总蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (78, '0051', '白蛋白', '0', '0-100', 10, '2', NULL, '白蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (79, '0052', '球蛋白', '0', '0-100', 10, '2', NULL, '球蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (80, '0053', '白球比例', '0', '0-100', 10, '2', NULL, '白球比例', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (81, '0054', '尿素', '0', '0-100', 10, '2', NULL, '尿素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (82, '0055', '肌酐', '0', '0-100', 10, '2', NULL, '肌酐', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (83, '0056', '尿酸', '0', '0-100', 10, '2', NULL, '尿酸', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (84, '0057', '总胆固醇', '0', '0-100', 10, '2', NULL, '总胆固醇', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (85, '0058', '甘油三酯', '0', '0-100', 10, '2', NULL, '甘油三酯', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (86, '0059', '高密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '高密度脂蛋白胆固醇', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (87, '0060', '低密度脂蛋白胆固醇', '0', '0-100', 10, '2', NULL, '低密度脂蛋白胆固醇', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (88, '0061', '葡萄糖', '0', '0-100', 10, '2', NULL, '葡萄糖', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (89, '0062', '总胆汁酸', '0', '0-100', 10, '2', NULL, '总胆汁酸', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (90, '0063', '肌酸激酶', '0', '0-100', 10, '2', NULL, '肌酸激酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (91, '0064', '肌酸激酶同工酶', '0', '0-100', 10, '2', NULL, '肌酸激酶同工酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (92, '0065', '乳酸脱氢酶', '0', '0-100', 10, '2', NULL, '乳酸脱氢酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (93, '0066', 'α-羟丁酸脱氢酶', '0', '0-100', 10, '2', NULL, 'α-羟丁酸脱氢酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (94, '0067', '促甲状腺激素', '0', '0-100', 10, '2', NULL, '促甲状腺激素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (95, '0068', '游离三碘甲状腺原氨酸', '0', '0-100', 10, '2', NULL, '游离三碘甲状腺原氨酸', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (96, '0069', '游离甲状腺素', '0', '0-100', 10, '2', NULL, '游离甲状腺素', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (97, '0070', '碳十四呼气试验', '0', '0-100', 10, '1', NULL, '碳十四呼气试验', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (98, '0071', '心电图', '0', '0-100', 10, '1', NULL, '心电图', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (99, '0072', '胸部正位', '0', '0-100', 10, '1', NULL, '胸部正位', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (100, '0073', '腹部彩超', '0', '0-100', 10, '1', NULL, '腹部彩超', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (101, '0074', '前列腺彩超', '1', '0-100', 10, '1', NULL, '前列腺彩超', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (102, '0075', '妇科彩超', '2', '0-100', 10, '1', NULL, '妇科彩超', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (103, '0076', '乳腺彩超', '2', '0-100', 10, '1', NULL, '乳腺彩超', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (104, '0077', '宫颈TCT', '2', '0-100', 10, '2', NULL, '宫颈TCT', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (105, '0078', 'HPV', '2', '0-100', 10, '2', NULL, 'HPV', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (106, '0079', '碳十四呼气试验', '0', '0-100', 10, '1', NULL, '碳十四呼气试验', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (107, '0080', 'C13呼气试验', '0', '0-100', 10, '1', NULL, 'C13呼气试验', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (108, '0081', '幽门螺旋杆菌抗体', '0', '0-100', 10, '2', NULL, '幽门螺旋杆菌抗体', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (109, '0082', '甲胎蛋白', '0', '0-100', 10, '2', NULL, '甲胎蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (110, '0083', '癌胚抗原', '0', '0-100', 10, '2', NULL, '癌胚抗原', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (111, '0084', '糖类抗原19-9', '0', '0-100', 10, '2', NULL, '糖类抗原19-9', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (112, '0085', '糖类抗原125', '2', '0-100', 10, '2', NULL, '糖类抗原125', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (113, '0086', '糖类抗原15-3', '2', '0-100', 10, '2', NULL, '糖类抗原15-3', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (114, '0087', '神经元特异性烯醇化酶', '0', '0-100', 10, '2', NULL, '神经元特异性烯醇化酶', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (115, '0088', '鳞状细胞癌抗原', '0', '0-100', 10, '2', NULL, '鳞状细胞癌抗原', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (116, '0089', '前列腺特异性抗原', '1', '0-100', 10, '2', NULL, '前列腺特异性抗原', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (117, '0090', '游离前列腺特异性抗原', '1', '0-100', 10, '2', NULL, '游离前列腺特异性抗原', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (118, '0091', '糖化血红蛋白', '0', '0-100', 10, '2', NULL, '糖化血红蛋白', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (119, '0092', '同型半胱氨酸', '0', '0-100', 10, '2', NULL, '同型半胱氨酸', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (120, '0093', '维生素D', '0', '0-100', 10, '2', NULL, '维生素D', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (121, '0094', '维生素B12', '0', '0-100', 10, '2', NULL, '维生素B12', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (122, '0095', '叶酸', '0', '0-100', 10, '2', NULL, '叶酸', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (123, '0096', '骨密度', '0', '0-100', 10, '1', NULL, '骨密度', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (124, '0097', '眼底检查', '0', '0-100', 10, '1', NULL, '眼底检查', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (125, '0098', '听力检查', '0', '0-100', 10, '1', NULL, '听力检查', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (126, '0099', '口腔检查', '0', '0-100', 10, '1', NULL, '口腔检查', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_checkitem` VALUES (127, '0100', '耳鼻喉检查', '0', '0-100', 10, '1', NULL, '耳鼻喉检查', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');

-- ----------------------------
-- Table structure for t_drug
-- ----------------------------
DROP TABLE IF EXISTS `t_drug`;
CREATE TABLE `t_drug`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '药品编码',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '药品名称',
  `specification` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '规格',
  `manufacturer` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '生产厂家',
  `unit` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '单位',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '单价',
  `stock` int NULL DEFAULT 0 COMMENT '库存数量',
  `category` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '分类',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '1' COMMENT '状态（0停用 1启用）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '药品管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_drug
-- ----------------------------
INSERT INTO `t_drug` VALUES (1, 'YP001', '阿莫西林胶囊', '0.25g×24粒', '华北制药股份有限公司', '盒', 12.50, 200, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (2, 'YP002', '布洛芬缓释胶囊', '0.3g×20粒', '中美天津史克制药有限公司', '盒', 15.80, 150, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (3, 'YP003', '感冒灵颗粒', '10g×9袋', '华润三九医药股份有限公司', '盒', 9.90, 300, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (4, 'YP004', '头孢克肟分散片', '50mg×6片', '广州白云山制药股份有限公司', '盒', 28.00, 100, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (5, 'YP005', '维生素C片', '100mg×100片', '东北制药集团股份有限公司', '瓶', 5.50, 500, '西药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (6, 'YP006', '连花清瘟胶囊', '0.35g×24粒', '石家庄以岭药业股份有限公司', '盒', 14.80, 250, '中成药', '0', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (7, 'YP007', '氯雷他定片', '10mg×6片', '西安杨森制药有限公司', '盒', 18.50, 80, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (8, 'YP008', '阿奇霉素片', '0.25g×6片', '辉瑞制药有限公司', '盒', 32.00, 60, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (9, 'YP009', '藿香正气水', '10ml×10支', '北京同仁堂科技发展股份有限公司', '盒', 8.50, 400, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (10, 'YP010', '蒙脱石散', '3g×10袋', '扬子江药业集团有限公司', '盒', 12.00, 180, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (11, 'YP011', '硝苯地平控释片', '30mg×7片', '拜耳医药保健有限公司', '盒', 27.60, 90, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (12, 'YP012', '复方甘草片', '100片', '哈药集团制药六厂', '瓶', 6.80, 350, '西药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (13, 'YP013', '双黄连口服液', '10ml×10支', '河南太龙药业股份有限公司', '盒', 16.20, 220, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (14, 'YP014', '对乙酰氨基酚片', '0.5g×10片', '上海强生制药有限公司', '盒', 4.90, 600, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (15, 'YP015', '盐酸氨溴索片', '30mg×20片', '昆明贝克诺顿制药有限公司', '盒', 11.30, 140, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (16, 'YP016', '板蓝根颗粒', '10g×20袋', '广州香雪制药股份有限公司', '包', 13.50, 500, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (17, 'YP017', '奥美拉唑肠溶胶囊', '20mg×14粒', '阿斯利康制药有限公司', '盒', 35.00, 75, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (18, 'YP018', '云南白药气雾剂', '85g+30g', '云南白药集团股份有限公司', '盒', 42.00, 40, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (19, 'YP019', '氯霉素滴眼液', '8ml:20mg', '山东博士伦福瑞达制药有限公司', '支', 7.50, 200, '处方药', '0', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (20, 'YP020', '多潘立酮片', '10mg×30片', '西安杨森制药有限公司', '盒', 19.80, 110, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (21, 'YP021', '盐酸小檗碱片', '0.1g×100片', '广州白云山光华制药股份有限公司', '瓶', 8.90, 280, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (22, 'YP022', '阿司匹林肠溶片', '100mg×30片', '拜耳医药保健有限公司', '盒', 15.20, 160, '西药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (23, 'YP023', '银杏叶片', '19.2mg×24片', '扬子江药业集团北京海燕药业有限公司', '盒', 22.60, 130, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (24, 'YP024', '复方氨酚烷胺胶囊', '10粒', '吉林省吴太感康药业有限公司', '盒', 8.20, 400, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (25, 'YP025', '苯磺酸氨氯地平片', '5mg×7片', '辉瑞制药有限公司', '盒', 24.50, 85, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (26, 'YP026', '牛黄解毒片', '24片', '北京同仁堂科技发展股份有限公司', '袋', 3.50, 800, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (27, 'YP027', '红霉素软膏', '10g:0.1g', '马应龙药业集团股份有限公司', '支', 2.80, 500, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (28, 'YP028', '厄贝沙坦片', '150mg×7片', '赛诺菲制药有限公司', '盒', 30.10, 70, '处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (29, 'YP029', '六味地黄丸', '360丸', '九芝堂股份有限公司', '瓶', 18.90, 200, '中成药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);
INSERT INTO `t_drug` VALUES (30, 'YP030', '开塞露', '20ml', '福元药业股份有限公司', '支', 1.50, 1000, '非处方药', '1', NULL, 'admin', '2026-07-02 16:12:15', '', NULL);

-- ----------------------------
-- Table structure for t_ordersetting
-- ----------------------------
DROP TABLE IF EXISTS `t_ordersetting`;
CREATE TABLE `t_ordersetting`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '预约设置ID',
  `order_date` date NULL DEFAULT NULL COMMENT '预约日期',
  `number` int NULL DEFAULT NULL COMMENT '可预约人数',
  `reservations` int NULL DEFAULT NULL COMMENT '已预约人数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '预约设置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_ordersetting
-- ----------------------------
INSERT INTO `t_ordersetting` VALUES (1, '2026-07-03', 10, NULL);

-- ----------------------------
-- Table structure for t_physical_report
-- ----------------------------
DROP TABLE IF EXISTS `t_physical_report`;
CREATE TABLE `t_physical_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_no` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报告编号',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '性别（0女 1男）',
  `age` int NULL DEFAULT NULL COMMENT '年龄',
  `id_card` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `exam_date` date NULL DEFAULT NULL COMMENT '体检日期',
  `exam_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检类型',
  `department` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '科室',
  `conclusion` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '体检结论',
  `suggestion` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '建议',
  `doctor` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '医生',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0未审核 1已审核）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '体检报告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_physical_report
-- ----------------------------

-- ----------------------------
-- Table structure for t_setmeal
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal`;
CREATE TABLE `t_setmeal`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '套餐ID',
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '名称',
  `code` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '编码',
  `help_code` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '助记码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别（0男 1女 2不限）',
  `age` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '年龄范围',
  `price` float NULL DEFAULT NULL COMMENT '价格',
  `remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  `attention` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '注意事项',
  `img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图片路径',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '套餐表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_setmeal
-- ----------------------------
INSERT INTO `t_setmeal` VALUES (1, '基础套餐', 'BJ', 'JCTP', '2', '20-60', 198, '基础套餐', '无', '/img/bj.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (2, 'VIP尊享套餐', 'VIP', 'VIP', '2', '20-60', 588, 'VIP套餐', '无', '/img/vip.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (3, '中年体检套餐', 'ZN', 'ZNTJ', '2', '40-60', 398, '中年体检套餐', '无', '/img/zn.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (4, '老年体检套餐', 'LN', 'LNTJ', '2', '60-80', 488, '老年体检套餐', '无', '/img/ln.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (5, '女性专项套餐', 'NX', 'NXZXT', '2', '20-60', 458, '女性专项套餐', '无', '/img/nx.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (6, '男性专项套餐', 'NX', 'NXZXT', '1', '20-60', 458, '男性专项套餐', '无', '/img/nx.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (7, '入职体检套餐', 'RZ', 'RZTJ', '2', '20-60', 298, '入职体检套餐', '无', '/img/rz.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (8, '肿瘤筛查套餐', 'ZL', 'ZLPC', '2', '20-80', 888, '肿瘤筛查套餐', '无', '/img/zl.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (9, '心脑血管套餐', 'XNXG', 'XNXG', '2', '40-70', 688, '心脑血管套餐', '无', '/img/xnxg.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');
INSERT INTO `t_setmeal` VALUES (10, '糖尿病专项套餐', 'TNB', 'TNBZXT', '2', '30-70', 558, '糖尿病专项套餐', '无', '/img/tnb.jpg', 'admin', '2025-09-25 11:29:00', 'admin', '2025-09-25 11:29:00');

-- ----------------------------
-- Table structure for t_setmeal_checkgroup
-- ----------------------------
DROP TABLE IF EXISTS `t_setmeal_checkgroup`;
CREATE TABLE `t_setmeal_checkgroup`  (
  `setmeal_id` int NOT NULL COMMENT '套餐ID',
  `checkgroup_id` int NOT NULL COMMENT '检查组ID',
  PRIMARY KEY (`setmeal_id`, `checkgroup_id`) USING BTREE,
  INDEX `idx_checkgroup_id`(`checkgroup_id` ASC) USING BTREE,
  CONSTRAINT `fk_setmeal_checkgroup_group` FOREIGN KEY (`checkgroup_id`) REFERENCES `t_checkgroup` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_setmeal_checkgroup_setmeal` FOREIGN KEY (`setmeal_id`) REFERENCES `t_setmeal` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '套餐检查组关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_setmeal_checkgroup
-- ----------------------------
INSERT INTO `t_setmeal_checkgroup` VALUES (1, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (7, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 5);
INSERT INTO `t_setmeal_checkgroup` VALUES (1, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (7, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 7);
INSERT INTO `t_setmeal_checkgroup` VALUES (1, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (7, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 8);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 9);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 10);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 11);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 12);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 14);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 16);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 16);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 16);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 18);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 18);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 18);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 18);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 18);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 19);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 19);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 19);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 19);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 19);
INSERT INTO `t_setmeal_checkgroup` VALUES (2, 20);
INSERT INTO `t_setmeal_checkgroup` VALUES (3, 20);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 20);
INSERT INTO `t_setmeal_checkgroup` VALUES (8, 20);
INSERT INTO `t_setmeal_checkgroup` VALUES (9, 20);
INSERT INTO `t_setmeal_checkgroup` VALUES (6, 21);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 22);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 23);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 24);
INSERT INTO `t_setmeal_checkgroup` VALUES (5, 25);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 28);
INSERT INTO `t_setmeal_checkgroup` VALUES (10, 29);
INSERT INTO `t_setmeal_checkgroup` VALUES (4, 31);

-- ----------------------------
-- Table structure for t_statistics_report
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_report`;
CREATE TABLE `t_statistics_report`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报表名称',
  `report_type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '报表类型',
  `start_date` date NULL DEFAULT NULL COMMENT '开始日期',
  `end_date` date NULL DEFAULT NULL COMMENT '结束日期',
  `generate_time` datetime NULL DEFAULT NULL COMMENT '生成时间',
  `data_json` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据JSON',
  `total_count` bigint NULL DEFAULT 0 COMMENT '总数',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0草稿 1已发布）',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '统计报表表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_statistics_report
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
