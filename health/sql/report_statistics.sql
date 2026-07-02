-- ----------------------------
-- 体检报告表
-- ----------------------------
DROP TABLE IF EXISTS `t_physical_report`;
CREATE TABLE `t_physical_report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_no` varchar(64) DEFAULT NULL COMMENT '报告编号',
  `name` varchar(64) DEFAULT NULL COMMENT '姓名',
  `gender` char(1) DEFAULT '0' COMMENT '性别（0女 1男）',
  `age` int DEFAULT NULL COMMENT '年龄',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `phone` varchar(11) DEFAULT NULL COMMENT '手机号',
  `exam_date` date DEFAULT NULL COMMENT '体检日期',
  `exam_type` varchar(64) DEFAULT NULL COMMENT '体检类型',
  `department` varchar(64) DEFAULT NULL COMMENT '科室',
  `conclusion` varchar(512) DEFAULT NULL COMMENT '体检结论',
  `suggestion` varchar(512) DEFAULT NULL COMMENT '建议',
  `doctor` varchar(64) DEFAULT NULL COMMENT '医生',
  `status` char(1) DEFAULT '0' COMMENT '状态（0未审核 1已审核）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='体检报告表';

-- ----------------------------
-- 统计报表表
-- ----------------------------
DROP TABLE IF EXISTS `t_statistics_report`;
CREATE TABLE `t_statistics_report` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `report_name` varchar(128) DEFAULT NULL COMMENT '报表名称',
  `report_type` varchar(64) DEFAULT NULL COMMENT '报表类型',
  `start_date` date DEFAULT NULL COMMENT '开始日期',
  `end_date` date DEFAULT NULL COMMENT '结束日期',
  `generate_time` datetime DEFAULT NULL COMMENT '生成时间',
  `data_json` text COMMENT '数据JSON',
  `total_count` bigint DEFAULT 0 COMMENT '总数',
  `status` char(1) DEFAULT '0' COMMENT '状态（0草稿 1已发布）',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='统计报表表';
