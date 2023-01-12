/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : ry44_vip

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 09/09/2020 13:31:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info`  (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '批注编号',
  `bill_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文书编号',
  `comment_text` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批注内容',
  `bill_num_uuid` int(11) NOT NULL COMMENT '文书uuid',
  `record_status` int(1) NOT NULL COMMENT '记录状态',
  `create_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_datetime` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  PRIMARY KEY (`comment_num`, `bill_num_uuid`) USING BTREE,
  INDEX `BILL_NUM_FK`(`bill_num`) USING BTREE,
  INDEX `BILL_NUM_UUID_FK`(`bill_num_uuid`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK_3` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BILL_NUM_UUID_FK` FOREIGN KEY (`bill_num_uuid`) REFERENCES `indictment_bill_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment_info
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (8, 'indictment_bill_info', '起诉文书信息表', NULL, NULL, 'IndictmentBillInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '起诉文书信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2020-08-22 21:34:27', '', '2020-08-22 21:40:16', '');
INSERT INTO `gen_table` VALUES (9, 'law_case_info', '案件信息表', NULL, NULL, 'LawCaseInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '案件信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2020-08-22 21:34:27', '', '2020-08-23 18:56:08', '');
INSERT INTO `gen_table` VALUES (10, 'low_record_info', '笔录信息表', NULL, NULL, 'LowRecordInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '笔录信息', 'ruoyi', '0', '/', NULL, 'admin', '2020-08-22 21:34:27', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'return_json_info', '分析结果表', NULL, NULL, 'ReturnJsonInfo', 'crud', 'com.ruoyi.caseassistant', 'caseassistant', 'ReturnJsonInfo', '分析结果', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"案件管理\",\"treeCode\":\"\"}', 'admin', '2020-08-25 12:40:25', '', '2020-08-25 12:41:20', '');

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
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
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 168 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (105, '8', 'low_case_num', '案件编号', 'varchar(128)', 'String', 'lowCaseNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (106, '8', 'bill_num', '文书编号', 'varchar(128)', 'String', 'billNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (107, '8', 'bill_plaintiff', '原告', 'text', 'String', 'billPlaintiff', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (108, '8', 'bill_demandant', '被告', 'text', 'String', 'billDemandant', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (109, '8', 'bill_third_party', '第三人', 'text', 'String', 'billThirdParty', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (110, '8', 'bill_prosecutor', '起诉人', 'varchar(128)', 'String', 'billProsecutor', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (111, '8', 'bill_claim', '诉讼请求', 'text', 'String', 'billClaim', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (112, '8', 'bill_fact_and_reason', '事实与理由', 'text', 'String', 'billFactAndReason', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (113, '8', 'record_status', '记录状态', 'char(1)', 'String', 'recordStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 9, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (114, '8', 'create_datetime', '创建时间', 'timestamp', 'Date', 'createDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 10, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (115, '8', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (116, '8', 'update_datetime', '更新时间', 'timestamp', 'Date', 'updateDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 12, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (117, '8', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (118, '8', 'bill_person_id', '嫌疑人身份证号', 'varchar(18)', 'String', 'billPersonId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (119, '8', 'bill_force_execute_time', '强制执行时间', 'date', 'Date', 'billForceExecuteTime', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 15, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (120, '8', 'bill_trans_department', '移送机关', 'varchar(128)', 'String', 'billTransDepartment', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 16, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (121, '8', 'uuid', 'uuid', 'int(11)', 'Long', 'uuid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-22 21:43:11');
INSERT INTO `gen_table_column` VALUES (122, '9', 'low_case_num', '案件编号', 'varchar(128)', 'String', 'lowCaseNum', '1', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (123, '9', 'low_case_reason', '案件原由', 'varchar(128)', 'String', 'lowCaseReason', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (124, '9', 'low_case_party', '当事人', 'varchar(64)', 'String', 'lowCaseParty', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (125, '9', 'low_case_content', '案例事实', 'text', 'String', 'lowCaseContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'summernote', '', 4, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (126, '9', 'low_case_court', '审批法院', 'text', 'String', 'lowCaseCourt', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (127, '9', 'low_case_decision_time', '判决时间', 'datetime', 'Date', 'lowCaseDecisionTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 6, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (128, '9', 'low_case_executive_judge', '执行法官编号', 'varchar(64)', 'String', 'lowCaseExecutiveJudge', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (129, '9', 'low_case_defence_counsel', '辩护律师编号', 'varchar(64)', 'String', 'lowCaseDefenceCounsel', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (130, '9', 'low_case_name', '案件名称', 'varchar(128)', 'String', 'lowCaseName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 9, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (131, '9', 'record_status', '记录状态', 'char(1)', 'String', 'recordStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 10, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (132, '9', 'create_datetime', '创建时间', 'timestamp', 'Date', 'createDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 11, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (133, '9', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (134, '9', 'update_datetime', '更新时间', 'timestamp', 'Date', 'updateDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 13, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (135, '9', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 14, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (136, '9', 'uuid', 'uuid', 'int(11)', 'Long', 'uuid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2020-08-22 21:34:27', NULL, '2020-08-23 18:56:08');
INSERT INTO `gen_table_column` VALUES (137, '10', 'bill_num', '文书编号', 'varchar(128)', 'String', 'billNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (138, '10', 'low_record_num', '笔录编号', 'varchar(128)', 'String', 'lowRecordNum', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (139, '10', 'low_record_type', '笔录类型', 'char(1)', 'String', 'lowRecordType', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', '', 3, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (140, '10', 'low_record_template', '笔录模板', 'varchar(32)', 'String', 'lowRecordTemplate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 4, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (141, '10', 'low_record_case_address', '案件地点', 'text', 'String', 'lowRecordCaseAddress', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (142, '10', 'low_record_interviewer_name', '询/讯问人', 'varchar(128)', 'String', 'lowRecordInterviewerName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (143, '10', 'low_record_interviewee_name', '被询/讯问人', 'varchar(128)', 'String', 'lowRecordIntervieweeName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 7, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (144, '10', 'low_record_Interviewee_id', '被询问人身份证号', 'varchar(18)', 'String', 'lowRecordIntervieweeId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (145, '10', 'low_record_date', '笔录日期', 'datetime', 'Date', 'lowRecordDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 9, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (146, '10', 'low_record_start_time', '笔录开始时间', 'varchar(8)', 'String', 'lowRecordStartTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (147, '10', 'low_record_end_time', '笔录结束时间', 'varchar(8)', 'String', 'lowRecordEndTime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 11, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (148, '10', 'low_record_content', '笔录内容', 'text', 'String', 'lowRecordContent', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'summernote', '', 12, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (149, '10', 'low_record_note_taker', '笔录人', 'varchar(128)', 'String', 'lowRecordNoteTaker', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (150, '10', 'low_record_times', '笔录次数', 'int(11)', 'Long', 'lowRecordTimes', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 14, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (151, '10', 'record_status', '记录状态', 'char(1)', 'String', 'recordStatus', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', '', 15, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (152, '10', 'create_datetime', '创建时间', 'timestamp', 'Date', 'createDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 16, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (153, '10', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (154, '10', 'update_datetime', '更新时间', 'timestamp', 'Date', 'updateDatetime', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 18, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (155, '10', 'update_by', '修改人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (156, '10', 'uuid', 'uuid', 'int(11)', 'Long', 'uuid', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2020-08-22 21:34:27', '', NULL);
INSERT INTO `gen_table_column` VALUES (160, '12', 'json_uid', 'json_uid', 'int(11)', 'Long', 'jsonUid', '1', '1', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:20');
INSERT INTO `gen_table_column` VALUES (161, '12', 'bill_num', '文书编号', 'varchar(128)', 'String', 'billNum', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:20');
INSERT INTO `gen_table_column` VALUES (162, '12', 'json', '返回的json', 'longtext', 'String', 'json', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:20');
INSERT INTO `gen_table_column` VALUES (163, '12', 'bill_uid', '对应文书uid', 'int(11)', 'Long', 'billUid', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:21');
INSERT INTO `gen_table_column` VALUES (164, '12', 'create_datetime', '创建时间', 'datetime', 'Date', 'createDatetime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 5, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:21');
INSERT INTO `gen_table_column` VALUES (165, '12', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:21');
INSERT INTO `gen_table_column` VALUES (166, '12', 'update_datetime', '更新时间', 'datetime', 'Date', 'updateDatetime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:21');
INSERT INTO `gen_table_column` VALUES (167, '12', 'update_by', '更新人', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 8, 'admin', '2020-08-25 12:40:25', NULL, '2020-08-25 12:41:21');

-- ----------------------------
-- Table structure for indictment_bill_info
-- ----------------------------
DROP TABLE IF EXISTS `indictment_bill_info`;
CREATE TABLE `indictment_bill_info`  (
  `low_case_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案件编号',
  `bill_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文书编号',
  `bill_plaintiff` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '原告',
  `bill_demandant` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被告',
  `bill_third_party` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '第三人',
  `bill_prosecutor` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '起诉人',
  `bill_claim` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '诉讼请求',
  `bill_fact_and_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '事实与理由',
  `record_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录状态',
  `create_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_datetime` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `bill_person_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '嫌疑人身份证号',
  `bill_force_execute_time` datetime(0) NOT NULL COMMENT '强制执行时间',
  `bill_trans_department` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移送机关',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  PRIMARY KEY (`uuid`, `bill_num`) USING BTREE,
  UNIQUE INDEX `bill_num`(`bill_num`) USING BTREE,
  INDEX `low_case_num`(`low_case_num`) USING BTREE,
  INDEX `uuid`(`uuid`) USING BTREE,
  CONSTRAINT `BILL_NUM_PK_1` FOREIGN KEY (`low_case_num`) REFERENCES `law_case_info` (`low_case_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '起诉文书信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of indictment_bill_info
-- ----------------------------
INSERT INTO `indictment_bill_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号', '未知', '刘景全', NULL, '未知', '刘景全故意伤害案', '起诉意见书\r\n甘公刑诉字(2016)094号\r\n犯罪嫌疑人刘景全，男，汉族，1985年1月1日生，黑龙江省宁安市，身份证号码：******************,初中文化，系无业，户籍所在地：黑龙江省宁安市镜泊乡镜泊村1组0171号\r\n违法犯罪经历：犯罪嫌疑人刘景全于2016年1月19日因涉嫌故意伤害罪被我局刑事拘留，同年1月29日被依法批准逮捕，现 羁押于大连市看守所。\r\n犯罪嫌疑人刘景全涉嫌故意伤害一案，我局于2016年1月18曰立为故意伤害案进行侦查，现已侦查终结。\r\n经依法侦查查明，犯罪嫌疑人刘景全有下列犯罪事实：\r\n2015年12月8日0时许，在甘井子区兴华路立元洗浴中心男浴区内，犯罪嫌疑人刘景全与被害人谢嘉华因琐事发生争吵，后刘景全回到男更衣室内将事情告知与其一起到洗浴中心的乐颐、张继彪、李少倩三人。随后刘景全四人在男更衣室内与谢嘉华发生冲突，期间犯罪嫌疑人刘景全持铁撮子将谢嘉华面部打伤，经法医鉴定：谢嘉华头面部损伤系锐器致伤，其损伤程度属轻伤一级。\r\n认定上述事实的证据如下：\r\n1,犯罪嫌疑人刘景全供述笔录；2被害人谢嘉华笔录；3证人李少倩、雪光、张继彪、张金魁询问笔录；4张金魁、谢嘉华辨认笔录；5 (大甘）公（司）鉴（法医临床）字[2015]491号法医学人体损伤程度鉴定意见书。\r\n上述事实清楚，证据确实、充分，足以认定。\r\n综上所述，犯罪嫌疑人刘景全的行为已触犯《中华人民共和国刑法》第二百三十四条之规定，涉嫌故意伤害罪。依照《中华人民 共和国刑事诉讼法》第一百六十条之规定，特将此案移送审查起诉。\r\n此致\r\n大连市甘井子区人民检察院', '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', '未知', '2020-09-05 23:27:45', '大连市甘井子区人民检察院', 9);
INSERT INTO `indictment_bill_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号', '未知', '黄佳男', NULL, '未知', '黄佳男非法持有毒品案', '大连市公安局甘并子公安分局起诉意见书\r\n甘公刑诉字[2016]001号\r\n犯罪嫌疑人黄佳男，男，1976年4月17日生，辽宁省辽阳市人，居民身份证号码为：******************，汉族，中专文化，无职业，户籍所在地：大连市沙河口区华北路337号1-5，现住：大连市甘井子区金柳路291号楼2-4-2号。\r\n犯罪嫌疑人戴宝生，女，1978年5月18日生，山东省莱阳市人，居民身份证号码为：******************，汉族，大专文辽宁省丹东市元宝区蛤蟆塘镇畜牧场金场居民组130184号，现住：大连市甘井子区金柳路291号楼2-4-2号。\r\n违法犯罪经历：犯罪嫌疑人黄佳男、戴宝生因涉嫌贩卖毒品罪于2015年10月15日被我局刑事拘留，同年11月20曰经大连市甘井子区人民检察院批准被执行逮捕，现羁押于大连市公安局看守所。\r\n犯罪嫌疑人黄佳男、戴宝生因涉嫌贩卖毒品罪一案，由大连市公安局禁毒支队在工作中发现后移交我局，经审查：我局于2015年9月19日立为贩卖毒品案侦查。2015年10月15曰，在大连市甘井子区金柳路291号2-4-2,上述二人被我局民警抓获。犯罪嫌疑人黄佳男、戴宝生涉嫌非法持有毒品一案，现已侦查终结。\r\n经依法侦查查明，犯罪嫌疑人黄佳男、戴宝生有下列犯罪事实：\r\n2015年2月至2015年10月间，犯罪嫌疑人戴宝生、黄佳男经事先预谋，通过邮寄方式多次从“韦玉怀”（姓名不清，住址不祥，现在逃）手中购买毒品向他人贩卖，从中谋取暴利，2015年10月15日在大连市甘井宇区金柳路291号楼2-4-2号被抓获，所持有的大量毒品被当场搜缴扣押，经检验：编号2015-LH-1362-JC1检材中（4号、5号检材）检出甲基苯丙胺成分，其含量为92.6%，净重共99.6克；编号2015-LH-1362-JC2检材中（6号、7号检材）检出甲基苯丙胺成分，其含量为89.0%,净重共98.6克；编号2015-LH-1362-JC3检材中（11号、1?号、13号检材）检出甲基苯丙胺成分，其含量为82.7%，净重共145.2克；编号2015-LH-1362-JC4检材中（14号检材）检出甲基苯丙胺成分，其含量为90.5%，净重共35.3克;编号2015-LH-1365-JC1检材中（1号检材）检出甲基苯丙胺庳分，净重共21.8克；编号2015-LH-1365-JC2检材中（2号检材）检出甲基苯丙胺成分，净重80.3克，其含量为90.编号2015-LH-1365-JC3检材中（3号检材）检出甲基苯丙胺、咖啡因成分，净重共101.7克；编号2015-LH-1365-JC4检材中（8号检材）检出甲基苯丙胺、咖啡因成分，净重383.7克；编号2O15-LH-1365-JC5检材中（9、10号检材）检出甲基苯丙胺、咖啡因成分，净重共12Q.8克；编号2015-LH-1365-JC6检材中（15、16、17号检材）检出甲基苯丙胺成分，净重共112.0克，其含量为80.9%;编号2015-LH-1365-JC7检材中（18号检材）检出甲基苯丙胺成分，净重28.7克；编号2015-LH-1365-JC8检材中（19号检材）检出甲基苯丙胺、咖啡因成分，净重207.7克；编号2015-LH-1365-JC9检材中（20-36号检材）检出甲基苯丙胺成分，净重共147.7克，其含量为$1.0%;编号2015-LH-1365-JC10检材中（37号▲材）检出甲基苯丙胺成分，净重4.7克；编号2015-LH-13“-JCll检材中（38-63号检材）检出甲基苯丙胺成分，净重共89.5克，其含量为74.8%。\r\n认定上述事实的证据如下：\r\n1、犯罪嫌疑人黄佳男、戴宝生供述笔录;2、搜缴的毒品实物及用于贩卖毒品的称量工具和包装袋；3、大连市公安司法鉴定中心（大）公（司）鉴（理化）字[2015]1362、1365号整定文书，\r\n上述犯罪事实清楚，证据确实、充分，足以认定。\r\n综上所述，犯罪嫌疑人黄佳男、戴宝生无视国家法律、法规，非法持有毒品，其行为已触犯《中华人民共和国刑法》第三百四十八条之规定，涉嫌非法持有毒品罪。依照《中华人民共和国刑事诉讼法》第一百六十条之规定，现将此案移送审查起诉。\r\n此致\r\n大连市甘井子区人民检察院\r\n大连市\r\n附：1、本案卷贰卷。\r\n2、犯罪嫌疑人黄佳男、戴宝生现羁押于大连市公安局看守所。', '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', '未知', '2020-09-06 20:04:18', '大连市甘井子区人民检察院', 10);
INSERT INTO `indictment_bill_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号', '未知', '杨德健', NULL, '沙河口区人民检察院', '杨德健盗窃案', '大连市公安局沙河口分局\r\n起诉意见书\r\n大公(沙)诉字[2016]24号\r\n犯罪嫌疑人杨德健，男，1989年11月27日出生，广西壮族自治区柳江县人，小学文化，无业，身份证号：\r\n******************,户籍地：广西壮族自治区柳江县里雍镇龙村中堂屯28号。\r\n违法犯罪经历：2010年，因在福建省福清市扒窃，被判处有期徒刑1年；2013年，因在湖南省长沙市扒窃被判处有期徒刑7个月。2015年10月22日，因涉嫌扒窃被我局刑事拘留，同年11月25口经沙河口区人民检察院批准被依法逮捕，现羁押于大连市看守所。\r\n犯罪嫌疑人骆嘉俊，男，1976年8月9日出生，无业，广西壮族自治区柳江县人，小学文化，身份证号：******************,户籍地：广西壮族自治区柳江县里雍镇龙江村新村屯1号。\r\n违法犯罪经历：2015年10月22日，因涉嫌扒窃被我局刑事拘留，，同年11月25日经沙河口区人民检察院批准被依法逮捕，现羁拘于大逢市看守所。\r\n犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，由我局民警于逆15年10月21日在工作中发现，并于同月22日立为盗窃案进行侦\r\n2015年10月21日17时40分许，犯罪嫌疑人杨德健伙同犯罪嫌疑人骆嘉俊在辽宁省大连市沙河口区数码路北段7号东软信息学院二期公寓门前马路上盗窃被害人戈雅星金色苹果6手机一部后，被我局民警当场抓获。犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，现已侦查终结。\r\n经依法侦查查明，犯罪嫌疑人杨德健、骆嘉俊有下列犯罪事实.\r\n犯罪嫌疑人杨德健与骆嘉俊经预谋，于2015年10月15日到大连欲行扒窃，并商定由杨德健负责实施扒窃，骆嘉俊负责望风掩护，获傳赃款后分成\r\n20l5年10月21日17时40分许，在大连市沙河口区数码路北段肯德基对面，杨德健伙同骆嘉俊扒窃戈雅星的金色苹果6手机一部，串码:***************,价值3000元；\r\n2015年10月20日12时20分许，在大连市沙河口区凌水桥车站，杨德健伙同骆嘉俊扒窃江寿林的金色苹果6PLUS手机一部，串码：***************,价值5040元；\r\n2015年10月21日12时许，在大连市沙河口区软件园东路23号櫻滅下，杨德健伙同骆嘉俊扒窃王仙华的金色苹果6手机一部，串码：***************,价值3500元；\r\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃荆树林的手机二部，一部是银白色苹果6手机，串码：***************,价值3000元，另一部是玫瑰金色苹果6S手机，串码：***************,价值5130元；\r\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃薛永新的手机白色小米手机一部，串码:***************,价值，500元;\r\n2015年10月20日12时许，在大连市沙河口区软件园东路23号楼楼下，杨德健伙同骆嘉俊扒窃陈有凤的白色乐视手机一部，串码：***************,价值1260元；\r\n犯罪嫌疑人杨德健伙同骆嘉俊共计扒窃七部手机价值人民币21430元\r\n认定上述事实的证据如下：\r\n1、被害人戈雅星陈述笔录；2、被害人江寿林陈述笔录；3、被害人王仙华陈述笔录；4、被害人荆树林陈述笔录；5、被害人薛永新陈述笔录；6、被害人陈有凤陈述笔录；7、证人喻世勇陈述笔录；8、犯罪嫌疑人杨德健供述笔录；9、犯罪嫌疑人骆嘉俊供述笔录；10、证人刘炼陈述笔录；11、杨德健邮寄盗窃手机单；12、杨德健、骆嘉俊指认手机照片；13、沙河口区价格认证中心大沙价认刑【2015】273号、294号价格鉴定结论书。\r\n上述事实清楚，证据确实、充分，足以认定。\r\n综上所述，犯罪嫌疑人杨德健、骆嘉俊以非法占有为目的，使用秘密手段窃取他人财物的行为已触犯《中华人民共和国刑法》第二百六十四条之规定，涉嫌盗窃罪，根据《中华人民共和国刑事诉讼法》第一百六十条之规定，现将此案移送审查起诉。\r\n此壺\r\n沙河口区人民检察院\r\n注：I本案卷宗T\r\n2、随案移交物品\r\n公安局\r\ni十三日', '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', '未知', '2020-09-06 20:36:28', '沙河口区人民检察院', 11);

-- ----------------------------
-- Table structure for law_case_info
-- ----------------------------
DROP TABLE IF EXISTS `law_case_info`;
CREATE TABLE `law_case_info`  (
  `low_case_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案件编号',
  `low_case_reason` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案件原由',
  `low_case_party` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '当事人',
  `low_case_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案例事实',
  `low_case_court` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审批法院',
  `low_case_decision_time` datetime(0) NOT NULL COMMENT '判决时间',
  `low_case_executive_judge` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '执行法官编号',
  `low_case_defence_counsel` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '辩护律师编号',
  `low_case_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案件名称',
  `record_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录状态',
  `create_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_datetime` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  PRIMARY KEY (`uuid`, `low_case_num`) USING BTREE,
  UNIQUE INDEX `low_case_num`(`low_case_num`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '案件信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of law_case_info
-- ----------------------------
INSERT INTO `law_case_info` VALUES ('甘公刑诉字(2016)094号', '故意伤害罪', '刘景全', '未知', '未知', '2020-09-05 23:27:36', NULL, NULL, '刘景全故意伤害案', '1', '2020-09-05 23:27:36', 'admin', '2020-09-05 23:27:36', 'admin', 24);
INSERT INTO `law_case_info` VALUES ('甘公刑诉字[2016]001号', '非法持有毒品罪', '黄佳男', '未知', '未知', '2020-09-06 20:04:18', NULL, NULL, '黄佳男非法持有毒品案', '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 25);
INSERT INTO `law_case_info` VALUES ('大公(沙)诉字[2016]24号', '盗窃罪', '杨德健', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '杨德健盗窃案', '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 26);

-- ----------------------------
-- Table structure for low_record_info
-- ----------------------------
DROP TABLE IF EXISTS `low_record_info`;
CREATE TABLE `low_record_info`  (
  `bill_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文书编号',
  `low_record_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '笔录编号',
  `low_record_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔录类型',
  `low_record_template` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔录模板',
  `low_record_case_address` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '案件地点',
  `low_record_interviewer_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '询/讯问人',
  `low_record_interviewee_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被询/讯问人',
  `low_record_Interviewee_id` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被询问人身份证号',
  `low_record_date` datetime(0) NOT NULL COMMENT '笔录日期',
  `low_record_start_time` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔录开始时间',
  `low_record_end_time` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '笔录结束时间',
  `low_record_content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '笔录内容',
  `low_record_note_taker` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录人',
  `low_record_times` int(11) NULL DEFAULT NULL COMMENT '笔录次数',
  `record_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录状态',
  `create_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_datetime` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '修改人',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  PRIMARY KEY (`uuid`, `low_record_num`) USING BTREE,
  UNIQUE INDEX `LOW_RECORD_UK_1`(`low_record_num`, `low_record_type`) USING BTREE,
  INDEX `BILL_NUM_FK_1`(`bill_num`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK_1` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 79 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '笔录信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of low_record_info
-- ----------------------------
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号0', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-05 23:27:45', NULL, NULL, '﻿讯问笔录 (第2次）\r\n时间2016年L月11曰17时20分至2016年i月19_0 时£1分 地点________大连市看守所_______________\r\n侦查员姓名、单位j戈和-3廣通甘井子分局兴华街派出所 记录员姓名、单位 /卞参-	甘井子分局兴华街派出所\r\n犯罪嫌疑人姓名	刘景全__________________FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所民警（出示证件），现依法对你进行讯问，你应当如实回答我们的提问，对与本案无\r\n关的问题，你有拒绝回答的权利，听明白了吗?\r\n答：听明白了。\r\n问：根据《中华人民共和国刑事诉讼法》第八十条之规定，你现在被刑事拘留了，你听明白了吗?\r\n答听明白了。\r\n问这是拘留证，你看一下。\r\n答好。\r\n问你知不知道你为什么被拘留的？\r\n答知道，因为我涉嫌故意伤害的事情。\r\n问什么时间，在什么地方发生的事情？\r\n答在2015年12月7日24时许，甘井子区立元洗浴中心发生的。\r\n问你跟谁打架？\r\n答我们这一伙有我、乐颐、张继彪、李少倩四个人，对面是立元洗浴中心的服务员。\r\n问：你们是否都动手了？\r\n答：我们都动手打那个服务员了。答：那个被我们打的服务员捂着腔，具体受什么伤我不清楚，但是伤是被我们打的造成的，我也受伤了，我左眼肿了，是被那个服务员用拳头打的。\r\n问：你把事情经过说一下?\r\n答：我在第一次笔录中已经说过了。\r\n问：根据《中华人民共和国刑事诉讼法》之规定，你可以聘请律师为你进行法律咨询，代理申诉、控告，你听明白了吗?\r\n答：听明白了。\r\n问：你逆有什么要补充的吗?\r\n答：没有了。\r\n问：你以上讲的都属实吗?\r\n答：属实。', '未知', NULL, '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', 52);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号1', NULL, NULL, '未知', '未知', '李少倩', '未知', '2020-09-05 23:27:45', NULL, NULL, '﻿\r\n询 问 笔录\r\n询问时间：2016年1月18日4时06分至2016年1月18日5时05分\r\n询问地点：	y $连市公安局甘井子分局兴华街派出所\r\n询问人（签名）：我工作单位：糾怒*訓\r\n记录人（签名）：j洛金氏	工作单位：衣，免♦咏丁n\r\n被询问人:李少倩性别：男出生日期：1981年5月7日文化程度：初中\r\n户籍所在地:黑龙江省林甸县红旗镇红光村四屯15号\r\n现住址：辽宁省大连市甘井子区南关岭路6-1号1-7-3\r\n工作单位：无\r\n被询问人身份证件种类及号码：居民身份证：******************\r\n□是■否人大代表\r\n联系方式：***********\r\n(口头传唤的被询问人_月_日_时_分到达，_月_曰_时 分离开，传唤的理由和依据已告知本人，本人签名确认： )。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答，属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。\r\n问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被传唤的时间、地点、原因、处所通知你的家属，怎么通知？\r\n答：不用通知，我不想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：2015年12月7日晚上12时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、乐颐、张继彪。刘景全、乐颐是亲哥俩，都是黑龙江人，刘景全今年29岁，乐颐今年31岁，刘景全的电话是***********;张继彪，20多岁，短发，身高1.70米左右。\r\n问：你们为什么打仗?\r\n答：刘景全和我们说他在洗澡的地方小便，服务员不让，他打了服务员一巴掌。后来，我们在二楼的换衣室又将这个服务员打了。\r\n问：被打得服务员长什么样?\r\n答：他大约25岁，身高约1.70米，中等身材，圆脸，他当时穿着洗浴中心的工作服，上身是蓝色的。其他的没注意。\r\n问：你4巴当时经过讲一下?\r\n答：2015年12月7日晚上20时左右，我和刘景全、乐颐、张继彪到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅休息。当时，我、刘景全、张继彪都喝了不少酒了。到晚上12时左右，刘景全去上厕所回到休息大厅，对我们说他去上厕所时被服务员骂了，他打了服务员一巴掌。张继彪就说他先出去看看怎么回事，张继彪就先出去了，我和刘景全，乐颐随后也跟着出去了，换衣室在休息大厅外面，我们出了休息大厅后，看见张继彪正在跟经理还有那个跟刘景全发生冲突的服务员讲话，我们就朝他们走过去，这时候曹成推开了，走到那个服务员身球时，服务员好像嘴里骂了刘景全一句，丁農朝那个服套秦脸上打.了一拳，义后農个服务员奠丁電发雨拳，我一看刘景全被打了，多沐去童雙，，1朋11个風至.j身>打了两拳，高成文和乐颐也冲上来对着那个服务员，賜,当时洗浴的经理还有一些服务员就过来拉架，打了\"\"大薇有1分钟左右，就停手了，洗浴的经理和服务员也都在劝架，我以为这个事情就这样完了，我和乐颐还有高成文就回到换衣箱边上穿衣服，突然间我听到刘景全又在叫骂，好像又跟人打起来了，我们三个就赶紧跑过去，就看见那个服务负捂着脸蹲在地上，脸上已经出11：血了，丁家峰.手異拿着一个卷把的..白钢攝子还在叫骂，乐颐赶紧冲上去把刘景全推了出去，然后就有人报警说警察马上来，我跟刘景全就先离开了立元洗浴。\r\n问：挨打那个服务贾是否受伤?\r\n答：他受伤了，我看见他脸上有血迹。\r\n问：这个服务员的伤是怎么造成的?\r\n答：我们4个一起打他的时候都是赤手空拳，当时他脸上没有伤，后来我们穿衣服的时候，刘景全又和那个服务员产生了冲突，我想伤应该是当时造成的，我们过去的时候看见刘景全手里拿着一个长把的白钢撮子，那个服务员捂着脸蹲在地上，脸上当时已经出血了。\r\n问：撮子是什么样的?\r\n答：就是普通长杆的撮子，是白色的，像是白钢做的。是立元洗浴里用来打扫卫生的。\r\n问：你是否受伤？问：当时拉仗的都有谁？\r\n答：就是立元洗浴的服务M，具体有谁我不清楚。\r\n问：你们四个人当时的衣着?\r\n答：我当时上身光着膀子下身穿着俗袍的黄色裤子；刘景全当时上身光着膀子，下身是红色的浴服；乐颐当时上身穿黑色的背心，下身是蓝色的牛仔裤；高成文穿黑色的皮夹克，下身是黑色裤子。\r\n问你是否被公安机关处理过？\r\n答没有。\r\n问你的家庭成员？\r\n答母亲：叶星宏，55岁，在原籍；父亲，韦春雪，59岁，在原籍。\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', '未知', NULL, '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', 53);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号2', NULL, NULL, '未知', '未知', '乐颐', '未知', '2020-09-05 23:27:45', NULL, NULL, '﻿询问笔录\r\n询问时间:2015年12月80 15时06分至2015年12月80珏时让分 询问地点:	大连市公安甘井子分局兴华街派出所\r\n询问人(黎名）：含1⑥备工作单位：\r\n记录人（签名）:士h	工作单位：\r\n被询问人：乐颐性别:男出生日期：1985年1月1日文化程度：小 生\r\n户籍所在地:黑龙江省宁安市镜泊乡镜泊村1组0171号____\r\n现住址:大连市甘井子区南关岭鹏辉三期56号_________\r\n工作单位：无________________________\r\n被询问人身份证件种类及号码:居民身份证：****************** 口是■否人大代表\r\n联系方式:U591 159743______________\r\n(口头传唤的被询问人_月_曰_时_分到达，_月_曰__时 分离开，传唤的理由和依据已告知本人，本人签名确认： )。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。\r\n问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被倚唤的时间、地点、原因、处所通知你的家属，怎么通知?\r\n答：不用通知，我不想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：是昨天（2015年12月8日）早上1时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、张继彪、双牙子（小名）。刘景全和我是亲哥俩，都是黑龙江人，我今年31岁，我弟弟刘景全实际是30岁，但他身份证是和我同年同月同日生的，他身份证号码是******************。\r\n问：你们为什么打<丈?\r\n答：我不清楚具体为什么打架，我们在休息大厅休息，我弟弟上完厕所回来说他被服务员骂了，他打了服务M两下。之后张继彪去更衣室换衣服，我怕他吃亏，所以也跟着去更衣室，之后我弟出来看见了那个服务贵就打起来了。\r\n问：被打得服务员长什么样?\r\n答：没看清，但见面能认出来。\r\n问：你4匕当时经过讲一下?\r\n答：昨天（2015年12月7日）晚上9时30分左右，我和刘景全、张继彪、双牙子到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅看节目。当时，我跟双牙子没喝酒，我弟和张继彪喝了不少酒。到今天（2015年12月8曰）凌晨1时左右，刘景全去上厕所回到休息大厅，对我们说‘我去撒尿，让服务员骂了我就问他为什么，他说他想床屎，没憋住，就在洗澡的排水沟尿了，服务员把他骂了。然后他就给了月I务员两拳。之后张继彪就先走了，我怕他吃亏，因为他喝多了，所以我就跟他来到了更衣室。我在更衣室看见张继彪要跟服务员出去干仗，我就上去拉住张继彪，之后我在换衣服，这时我弟就出来了，看见那个服务员就给了他一拳，那服务员回手给了我老弟两拳。我看见我老弟受欺负就上去给了那个服务负两拳，服务员又给我两拳，并且拖着戒。这时双牙子和张继彪就上去用拳头打那个服务员，我就开始拉架，把那个服务员拖到角落坐着，之后我就去换衣服。换完衣服回头看见我老弟和那个服务员在一个位置，那个服务员满头是血，然后我就拉着我老弟，给他拉下楼了a之后我老弟还想上去打，我和大堂经理一直拉着我老弟，所以我弟没打着那个服务贞。结完账后警车就来了，我就回家了。\r\n问：挨打那个服务员是否受伤?\r\n答：他受伤了，是头部受伤的，具体伤的怎么样我不清楚。警察来时，我在外面看见那个挨打的服务员在屋里坐着。我看见警察把张继彪带走后我就回家了。\r\n问：这个服务员的伤是怎么造成的？\r\n答：我不清楚，我什么都没看见，我打了他两拳，双牙子和张继彪也打了他几拳。\r\n问：你弟是怎么打服务员的?\r\n答：用拳头打的，至于是否拿东西打这个服务员我就不清楚了。\r\n问：你是否受伤?\r\n答：我的右胳膊受了伤，右脚大母脚趾没有知觉，我的伤是那个挨打的月艮务员造成的。问：当时拉仗的都有谁?\r\n答：我和浴区两个服务员。那两个服务员一个是斜眼的，一个是老头。其他的我就不知道了。\r\n问：你们四个人当时的衣着?\r\n答：我打架是就穿了一个黄色的裤衩，我弟和双牙子穿了一套红色的一次性裕服；张继彪上身穿着黑色皮衣，下身穿的黑色裤子。\r\n问你是否被公安机关处理过？\r\n答没有。\r\n问你的家庭成员？\r\n答我就刘景全一个弟弟，我爸爸妈妈离婚了。\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', '未知', NULL, '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', 54);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号3', NULL, NULL, '未知', '未知', '张继彪', '未知', '2020-09-05 23:27:45', NULL, NULL, '﻿询问笔录\r\n询问时间：迎U年12月80 £时巧分至年12月80丛时②分\r\n询问地点:_____大，$市公安局甘井子分局兴华街派出所\r\n询问人（签名）：耒1 (颂各:工作单位：竽存倒派邮什 记录人（签名）：H35ZZZZZ工作单位:\r\n被询问人：张继彪性别:男出生曰期：1992年4月20日文化程度： 初中\r\n户籍所在地:黑龙江省拜泉县国富镇民强村2组\r\n现住址:大连市甘井子区南关岭桥头大北沟_____________\r\n工作单位：1__________________________\r\n被询问人身份证件种类及号码:居民身份证：****************** □是■否人大代表\r\n联系方式:***********________________\r\n(口头传唤的被询问人_月_.曰___时_分到达，_月_日_时 分离开，传唤的理由和依据已告知本人，本人签名确认:_)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避？\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被借唤的时间、地点、原因、处所通知你的家属，怎么通知?\r\n答：不用通知，我想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：是昨天（2015年12月7日）晚上12时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、乐颐、双牙子（小名）。刘景全、乐颐是亲哥俩，都是黑龙江人，刘景全今年29岁，乐颐今年31岁，刘景全的电话是***********;双牙子姓朱，具体叫什么名字我不知道。\r\n问：你们为什幺打仗?\r\n答：刘景全和我们说他在洗澡的地方小便，服务员不让，他打了服务员一巴掌。后来，我们在二楼的换衣室又將这个服务员打了。\r\n问：被打得服务负长什么样?\r\n答：他大约25岁，身高约1.70米，中等身材，圆脸，他当时穿着洗浴中心的工作服，上身是蓝色的。其他的没注意。\r\n问：你当时经过讲一下?\r\n答：昨天（2Q15年12月7日）晚上8时左右，我和刘景全、乐颐、双牙子到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅休息。当时，我、刘景全、双牙子都喝了不少酒了。到晚上12时左右，刘景全去上厕所回到休息大厅，对我们说‘有个服务员装逼，不让他在洗澡的地方尿尿，他打了这个服务员一巴掌。因为我知道刘景全喝完酒好惹事，而且我明天还有活，我就对他们说‘你们把手牌告诉我，我去结账他们告诉我手牌号，我就到换衣室去换衣服答：他受伤了，是头部受伤的，具体伤的怎么样我不清楚。警察来时，他打车去医院了，我看到他脸上有血。\r\n问：这个服务员的伤是怎么造成的?\r\n答：主要是刘景全打的，拳打脚踢还用铁撮子，我也打了他几下，双牙子也打了，怎么打的我没注意，乐颐是否动手打这个服务员我不清楚。\r\n问：铁撮子是什么样的?\r\n答：就是普通长杆的撮子，是白色的，掉在地上咣当一声，我认为应j亥是寺失的。这个撮子是立元洗浴的，现在也应j盡在立元洗浴。\r\n问：你是否受伤?\r\n答：我左侧脸部受伤了，具体是谁打的我不清楚。刘景全踹我的几脚、打我几下，我没有受伤。\r\n问：参与打仗的服务負长什么样?\r\n答：我就记着他是斜眼，其他的没注意。他当时也拉仗了。\r\n问：当时拉仗的都有谁?\r\n答：就是立元洗浴的服务员，具体有谁我不清楚。\r\n问：你们四个人当时的衣着?\r\n答：我当时上身穿黑色的皮夹克，下身是黑色裤子；刘景全当时上身光着膀子，下身是红色的浴服；乐颐当时上身穿黑色的背心，下身是蓝色的牛仔裨；双牙子当时上身穿白色的衣服，下身是黄色的裤子。\r\n问：你是否被公安机关处理过?\r\n答：没有。\r\n问你的家庭成员？\r\n答母亲：潘燕南，64岁，在大连a\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', '未知', NULL, '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', 55);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号4', NULL, NULL, '未知', '未知', '张云購', '未知', '2020-09-05 23:27:45', NULL, NULL, '﻿\r\n第_L次询问\r\n第i页共i页\r\n询 问 笔录\r\n询问时间2015年12月10 W时34分至2015年12月8日10时58分 询问地点	甘井子分局兴华街派$所____________________\r\n询问人（签名）\r\n记录人（签名）n么怒____\r\n工作单位兴华街派出所____\r\n工作单位兴华街派出所\r\n被询问人张云購，性别男出生口期 1995.11.8 文化程度初中 户籍所在地河北省承德市丰宁满族自治县石人沟乡高营村三组南沟门1号 住址	辽宁省大连市甘井子区兴华路立元洗格_____________\r\n被询问人身份证件种类及号码	******************\r\n联系电话_____***********_________________\r\n(口头传唤的被询问人__月___日___时___分到达，__月__日\r\n__时 分离开，本人黎名确认：________________)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是兴平街派出所的工作人员(出示证件），现依法对你进行调查，你要如实回答。对与本案无关的问题，你有拒绝回答的枚利。你听清楚了吗？\r\n答：听清楚了。\r\n问：你对办案人员是否耍求回避?\r\n答：我不要求。\r\n问：你因何事到派出所?\r\n答：我被人打了。答：2015年12月8口0时30分许，甘井子区兴肀路立元洗浴男更衣室内。闷：你被谁打了？\r\n答：四个陌生男子，是立元洗浴的客人。\r\n问：描述下四个男子的体貌特征？\r\n答：一个男子30岁左右，穿黑色皮夹克，身高173左右，中等身材，短发;一个男子30岁左右，中长发，发色发黄，脸上有疙瘩，身高170左右，身材较痩；一个男子30岁左右，胸前纹了个龙；最后一个男子身高176左右,中等身材。\r\n问：这四个男子为何打你？\r\n答：我是立元洗浴的服务员，中长发的男子在浴池尿尿，我制止了他，他就心生不满，就和他的三个朋友将我打了。\r\n问：你把事情的经过说一下？\r\n答：我是立元洗浴的服务员。2015年12月8H()时3()分许，我收拾完塔池我看见一个中卷发的男矛在港池犀尿。我就对这个男子说：“哥，旁边是厕所，你去那尿。”中长发男子就说：“我憋不住了，你给我滚。”然后我就走了，走的时候我说了一句：“我醉了”。中长发男子就追我到更衣室，用手推我的脖了，说：“你骂谁。”我经理就出来了，将那个中长发的男子劝走了。过了会和那个中长发男子一起的穿皮夹克的男子就走过来跟我说:“咱俩出去溜达溜达。”我就跟穿皮夹克的男子说：“哥，都是小事，不至于。”中乒、发的男子突然就用y头打、我的衣眼趣，然后和他一起的其<三名/>男子就都用拳头上来打我，打了我能有20拳左右。皮夹、克的男拿了一个我们洗浴的圆玻璃烟灰缸打了我的后脑部一下，.将我的后脑打出血r。这时我们经理就将他的烟灰缸抢了下来，将我们分开：L,我就坐到..更衣室门口的凳子上用手捂着头部。这吋开始那个中长发的男子k搭区拿了一个白戳于朝我的、两部打:C二四了，将我的左脸划伤，我在挡他的戳子的吋候我的左手背部和左小臂也被戳子划伤。打完之后他们四人就跑了。\r\n问：你是否还手打那四人?\r\n答：他们四人打我时，我用拳头打了那个中长发男子的肩部一下。\r\n问：你当时穿件什么衣服?\r\n答：我当时穿的立元洗浴的黑色衬衫工作服。\r\n问：当吋你有什么伤？怎么造成的?\r\n答：我的后脑部被打了个口子，是黑色皮夹克男子拿烟灰缸打的。我的左面部划伤到医院缝了17针左右、左小臂和左手背部有划伤，是中长发男子拿白钢戳子打的。\r\n问：打你的烟灰缸和戳子什么样?\r\n答：烟灰缸会是圆形玻璃材质的，大概直径能有lOcni。白钢戳子是长把的，把能有lm左右。现在这两个东西都在立元洗浴内。\r\n问：当吋还有谁在现埼?\r\n答：当吋有我们主管和二个服务员，还有儿个客人在场。\r\n问：你还有要补充的吗?\r\n答：没有。\r\n问：事发地是否有监控?\r\n答：有监控，过程是否照上我不清楚。\r\n答：属实。核对以上笔录，无异议签字捺印', '未知', NULL, '1', '2020-09-05 23:27:45', 'admin', '2020-09-05 23:27:45', 'admin', 56);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号0', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:04:18', NULL, NULL, '时间代词的问题：\n 半个月后某日20时许 ，该犯又窜至该房内，用 钥匙 开门进入室内，盗走 四幅油画 、 一个砚台 等物品。\n同年9月28或29日夜 ，该犯再次窜至该房内，用 钥匙 开门进入室内欲实施盗窃，因室内物品被转移他处而盗窃未遂。 \n', '未知', NULL, '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 57);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号1', NULL, NULL, '未知', '未知', '：黄佳', '未知', '2020-09-06 20:04:18', NULL, NULL, '﻿\r\n讯问笔录（第一次）\r\n时间：2015年10月15日13时45分至2015年10月15 地 点:	大连市公安局甘井子公安分局红旗派出\r\n科犯罪嫌疑人姓名：黄佳男别名:无曾用名：无绰号：无___________\r\n性别：民族： 汉族 出生时间:	1976年4月17日\r\n出生地： 辽宁省辽阳市 身份证号码：******************\r\n籍贯：辽宁省辽阳市	文化程度:	中专__________\r\n政治面貌：群众	________\r\n户籍所在地：辽宁省大连市沙河口区华北路337号___________\r\n现住址：	辽宁省大连市甘井子区金柳路291号2-4-2______\r\n联系电话：***********	〔伽Q\r\n工作单位和职业	无\r\n家庭成员：父亲：袁婵，66岁，退休；母亲：许旭文，60岁，退休 简历：1984年9月至1 990年7月，华北路小学，学生；1990年7\r\n月至1993年7月，大连市第五十一中学，学生。1993年9月至1996\r\n年，大连市建筑工程学校，1997年至2013年，在胜利广场物业上班，\r\n1013年至今，无业。_______________________\r\n是否受过刑事处罚或行政处罚：左___________________\r\n这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读/向你宣读。\r\n根据《中华人民共和国刑事诉讼法》的规定，在公安机关对案件###E5AE744085FD4F8EB3401B84D5F9F163.txt$13.0$###﻿\r\n(阅读约三分钟）\r\nFOLLOWING ARE RECORDE\r\n问：你是否完全理解告知书的内容？\r\n答:完全理解。\r\n问：你是否申请我们回避？\r\n答:不申请。\r\n问：我们是大连市公安局甘井子分局红旗派出所民警，现依法对你进\r\n行讯问，你要如实回答，听明白了吗？\r\n答:听明白了。\r\n问：知不知道为什么事被抓到派出所来？\r\n答:知道，因为我贩卖毒品和吸毒。从你家搜出的毒品是从哪里来的？\r\n答:是我女朋友购买的。\r\n问：你女朋友叫什么名字？\r\n答:叫戴宝生。\r\n问：戴宝生在哪购买的毒品？\r\n答:戴宝生在她朋友手里购买的，具体在谁那购买的我也不清楚a\r\n问：戴宝生都购买什么毒品，买了多少？\r\n答:冰毒和麻古，具体买多少我也不清楚。ip：戴宝生购买毒品做什么用？P答：刚开始的时候是自己吸食，后来就幵始贩卖，通过贩卖毒品来维持生活。\r\n问：为何贩卖毒品?答：大约在2015年5、6月份的时候，戴宝生从她朋友那弄的冰毒，我和戴宝生开始吸食冰毒，后来由于生活压力大，在7、8月份的时候我和戴宝生就商议通过贩卖毒品来赚钱，戴宝生认识卖毒品的，就购>买一些冰毒和麻古，然后我和戴宝生吸食一部分，卖给朋友一部分。\r\n问：如何贩卖毒品？\r\n答：有买家联系戴宝生购买冰毒或麻古，然后我就负责去送毒品和取钱，戴宝生在电话里会事先告诉对方将钱放在哪了，我去取钱不再告诉买家毒品放在哪里，让对方自己去取货，我们和买家不见面。\r\n问：毒品都卖给谁?\r\n答：我不清楚卖给谁，对方都是和戴宝生联系，偶尔和我联系，\r\nt问：你是如何将毒品给买家的？\r\n1答：我开着我的黑色辽BZ2G70大众迈腾轿车去送毒品。\r\n问：最近一次贩卖毒是什么时矣?\r\n答：2015年10月9日19时许，之前在我这买过冰毒的一个男的给我打电话想购买2克冰毒，我们约定在大连北岗桥汽车站交易。我让他把钱放在北岗桥411路公交车站的垃圾桶下面。大约在20时许，我取完钱。我就给那个男的打电话告诉他冰毒放在411路公交车大连西站的垃圾桶下面。在我去取钱之前我就把冰毒放在那了。之后我就拿钱是?家了。\r\n问：你是否还子己得读人的联系方式?\r\n答：记不住了。\r\n问：你共贩卖毒品多少次?各A意乞育bM夫么4一&。\r\n问：你是否能提供买家和卖家的相关信息?\r\n答：我记不住了。\r\n问：还有什么补充的吗？\r\n答：没有了。\r\n命问：以上说的是否属实？\r\n答：属实', '未知', NULL, '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 58);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号2', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:04:18', NULL, NULL, '﻿\r\n讯问笔录（第一■次）\r\n时间：2014年10月11日旦时丛分至2014年10月15_E] 16时17分\r\n地点：大连市公安局甘井子公安分局红旗派出所___________\r\n犯罪嫌疑人姓名戴宝生另1j名无 曾用名_______绰号无\r\n性别女民族汉族 出生时间 1978年5月18曰_________\r\n出生地辽宁省丹东市身份证号码******************\r\n籍贯辽宁省丹东市文化程度大专 政治面貌群众___________\r\n户籍所在地：辽宁省丹东市元宝区金山镇畜牧场金场居民组130184\r\n现住址：	辽宁省大连市甘井子区西山闲庭____________\r\n联系电话： 1 3238080520 ，对1\r\n工作单位和职业 无	!\r\n家庭成员：儿子：瞿红，17岁，学生。母亲：毕远香，64岁，农民。 简历：2005年5月之前，在辽宁省丹东市元宝区学习生活。2005年\r\n5月至今在大连打工。\r\n是否受过刑事处罚或行政处罚：__________________\r\n这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读/向你宣读。\r\n根据《中华人民共和国刑事诉讼法》的规定，在公安机关对案件 进行侦查期间，犯罪嫌疑人有如下诉讼权利和义务：\r\n1、	有权用本民族语言文字进行诉讼。\r\n2、	对于公安机关及其侦查人员侵犯其诉讼权利和人身侮辱的行 为，有权提出控告。###B9B33764C93B4253B97D07512BDAA272.txt$25.0$###﻿答：不申请。\r\nFOLLOWING ARE RECORDE\r\n问：你是否知道公安机关为什么事将你带回派出所的?\r\n答：知道，因为我贩卖毒品。谱\r\n问：贩卖何种毒品？\r\n答：冰毒。\r\n问：从何时开始贩卖？\r\n答：2015年2月，具体时间记不清了。\r\n问：在何地通过何种方式贩卖?\r\n答：我通过一个叫何美菊，小名叫蔺兰的小兄弟往出卖，他是怎么卖我不清楚。\r\n►问：总共卖了多少冰毒?\r\n答：1Q0克。\r\n问：1克卖多少钱?\r\n答：往外卖，1克200元人民币。\r\n问：我们把你和谁一起带到派出所?\r\n答：黄佳男，他是我对象，我俩一起同居六年了。\r\n问：黄佳男在你贩卖毒品的过程中做什幺?\r\n答：黄佳男帮我分装冰毒，有时帮我往外给别人送点冰毒。\r\n麯问：我们从你家搜到的冰毒是谁的?\r\n问：你贩卖的冰毒从哪来的?\r\n答：一个叫韦玉怀的广州朋友放在我家的。\r\n问：韦玉怀为何把冰毒存放在你家？\r\n答：2015年7月某天，我女朋友李楠楠的对象黄甜甜以买冰毒为由把广州一个毒贩子韦玉怀（不知道姓名）骗到大连，想让韦玉怀帮他贩毒，韦玉怀来时还带了个叫宋怡（不知姓名）小弟，韦玉怀和宋怡到大连后先是住在黄甜甜家，我就是到黄甜甜家找李楠楠玩认识了韦玉怀和宋怡，韦玉怀在黄甜甜家住了一周左右，就知道黄甜甜骗他到大连来的目的，韦玉怀和宋怡就托我在外面租个房子，不想再和黄甜甜打交道了，我就帮他们的沙河口区星海广场的海英公寓（谐音）租了个房间，门号是18楼1816房间，他们在这个公寓住时，我经常去照顾他俩的生活，给他俩送饭，当年阴历八月十四日韦玉怀和宋怡回广州了，回到广州后韦玉怀给我打了个电话，我才知道他们离开大连了，韦玉怀说他们回老家过节，过完节还会回大连继续卖冰毒。过了八月十五大和无一个月左右，宋怡给我打电话，说韦玉怀出事了，让我到他们房间把他们放在房间里的冰毒和嘛嗦拿走，帮他们保管好。我和黄佳男到他们租住的房间，按宋怡说的放冰毒的地方，从冰箱、洗衣机、卫生间的天棚里找出冰毒和嘛咕，我把这些东西放在一个红色布包里，黄佳男开着他的福特轿车（辽B299L7)，把东西拉到我们家，黄佳男把这些东西分别放在床的抽屉和床床头柜里。具体分装和存放都是黄佳男负责的。\r\n问：黄甜甜和于莲花的个人情况?\r\n答：因为韦玉怀的事，我和他俩都不联系了，他俩在山东路腾辉小区租的房子住。听我朋友说今年5月黄甜甜和于莲花被警察抓走了。\r\n问：韦玉怀存放在你家的冰毒和嘛咕一共有多少?\r\n答：宋怡没告诉过我有多少，具体多少我不清楚，我问黄佳男，黄佳男称纖过重量，他说冰毒大概有7GQ多个，嘛咕大概有一二千粒。\r\n问：你为何把韦玉怀存放你处的冰毒卖了？\r\n答：2015年2月某天，宋怡给我打电话，让我4巴冰毒和嘛咕卖了换钱，宋怡跟我要10万元钱，就顶这些毒品的钱，我说我没有这么多钱，先给他5万，等毒品卖出去之后，再打一些钱给他行不行，宋怡说行，黄佳男就到工商银行给宋怡汇了5万元，具体在哪家银行汇的钱我不清楚。今年9月某天，宋怡给我打电话，跟我借1万元钱，说是做生意用，我让黄佳男到名艮行汇给宋怡1万元钱,。\r\n问：宋怡收钱的专艮行贝长号?\r\n答：我没记住。\r\n狐问：你是怎幺认识何美菊?\r\n答：2015年1月某天，我朋友于莲花带何美菊到我家玩，就这么认识了，我听于莲花说过何美菊平常往外卖点冰毒，我就把韦玉怀存放在我家冰毒的事告诉了于莲花，于莲花说她可以让何美菊帮我往外卖。2015年1月某天，何美菊到我家找我，我就按200元1克卖给他30个，他给了我6000元钱。\r\n问：你一共卖给何美菊多少冰毒?\r\n答：分二十几次，总共卖给他200多克冰毒。具体每次多少克记不清了，最少5克，最多30克左右。\r\n问：除了何美菊你还把冰毒卖给谁了？\r\n答：甘井子区山东路一个叫豆豆的女掠子，她和i午斌联系，从2014年9月到现在，总共卖给她10多次，一次1克左右，她买冰毒由黄佳男\r\n问：还把冰毒卖给过谁?\r\n答：去个8月韦玉怀在大连时，我帮他联系过一个姓孙的男子，韦玉怀卖给他100多克。我们叫他张麻子，他也是个贩卖冰毒的，我现在联系不上他了，他手机号早换了。他真名叫啥我不清楚。\r\n问：你怎么认识的这个张麻子?\r\n答：2013年6月，我在解放广场一个叫湾仔的卖鸭脖的小食杂店里打麻将时认识的。那个食杂店有一桌麻将，女老板赵玲侠是我朋友，张麻子就住在食杂店旁边的楼里，打麻将时他就拿出冰毒吸，我就猜他是贩毒的，我就把他介绍给了韦玉怀。解放广场鸭脖店那片都拆迁了，赵玲侠.去哪了我也不知道。\r\n问：嘛咕都卖给过谁?\r\n答：我有时送给朋友一两粒，没卖过。\r\n问：你卖的冰毒特征?\r\n答：白色的晶状小块。\r\n问：你知ill我们1如4可知尔的吗?\r\n答：我猜是张清辉把我告了。\r\n问：张清辉?\r\n、答：张清辉也是个贩卖毒品的，是何美菊的朋友，我不认识这个人，他听何美菊说我手里有冰毒，打电话找我合作，我拒绝了，因为他是个大毒贩子，我怕被他骗了。我听何美菊说张清辉被警察抓了，我猜因为我不和张清辉合作，张清辉出卖了我。问：你自已吸食冰毒吗？\r\n答：我吸冰毒，每天饭后吸两三口。\r\n问：还有补充吗？\r\n问：以上讲的是否属实？\r\n答：属实', '未知', NULL, '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 59);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号3', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:04:18', NULL, NULL, '﻿\r\n\r\n讯问笔录（第二次）\r\n时间：2015年10月15_0 20时10分至2015年10月曰 20时21分\r\n地点：_______大连市看守所___________\r\n犯罪嫌疑人姓名：黄佳男\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局甘井子分局红旗派出所民警，现依法对你刑事拘留，[公安民警向犯罪嫌疑人黄佳男出示大公(甘）拘字（2015)794号拘留证]，你听清楚了吗?\r\n答：我听清楚了。\r\n问：知不知道因为什么事拘留你?\r\n答：因为吸毒和涉嫌贩毒。\r\n问：什么时候，在什么地方，向谁贩卖毒品?\r\n答：我是从今年6、7月份开始，在甘井子区山东路、西岗区北港桥汽车站这两个地方贩卖过毒品，向不认识的人贩卖毒品，买毒品的人都是通过朋友知道我和我女朋友的号码。跟我女朋友联系的，我负责去送货。\r\n问：你贩卖的都是什么毒品?\r\n答：都是冰毒和麻古、\r\n问：你以什么价格向他人贩卖毒品?答：我以每克200元的价格向他人贩卖毒品。\r\n问：贩卖了多少次?\r\n答：我记不清楚了、我能记住的就是西尚区北港桥的那一次。\r\n问：对方是谁?\r\n答：我不认识。\r\n问：毒品的来源?\r\n答：毒品是我女朋友联系购买的，我不知道对方真名叫什么，只知道他叫“宋怡”，今年5、6月份戴宝生和“宋怡”通过手机联系谈好以100多元的价格从“宋怡”手中通过邮寄的方式购买1000克冰毒，还买了一些麻古，具体的我不太清楚，货到之后，我开车拉着戴宝生在大连市华南广场附近一个物流也不知道是快递提的货，具体的我记不清楚了。货到的第二天我在春柳的工商银行给对方汇了大约8、9万元。去年大约在11月份，我们也是通过同样的方式购买了500克冰毒，也是在华南广场提的货。\r\n问：你们双方的开户行和账号是多少?\r\n答：我记不住了，\r\n问：今天从你的住处搜出的现金是怎么回事?\r\n答：钱不归我管，归我女朋友管，我不知遒钱是怎么回事。\r\n问：对你拘留所认定的犯罪事实对不对?\r\n答：对。\r\n问：拘留你对不对?答：对。\r\n问：对你拘留后的羁押地点是大连市看守所，拘留期限是3日，你听清楚了吗？\r\n答：我听清楚了。:\r\n问：根据《中华人民共和国刑事诉讼法》第三十三条的规定，你可以聘请律师为你提供法律帮助，代理控告和申诉，你听明白了吗？\r\n答：我听明白了。\r\n问：你还有什么要说的?\r\n答：没有了。\r\n问：你以上所讲属实吗?\r\n答：属实。', '未知', NULL, '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 60);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字[2016]001号', '甘公刑诉字[2016]001号4', NULL, NULL, '未知', '未知', '：戴宝', '未知', '2020-09-06 20:04:18', NULL, NULL, '﻿\r\n讯问笔录（第二次）\r\n时间：2Q15年10月11曰21时G1分至2015年10月15_0 22 时分\r\n地点：大连市公安局甘井子公安分局红旗派出所________\r\n犯罪嫌疑人姓名：戴宝生别名:无曾用名：无绰号：无 性别：女；民族:汉族 出生时间:1978年05月18曰 出生地：辽宁省丹东市身份证号码:****************** 籍贯：辽宁省丹东市文化程度:中专政治面貌：群众 户籍所在地：辽宁省大连市丹东市元宝区蛤蟆塘镇金场村 现住址：辽宁省大连市甘井子区金柳路西郊闲庭291号2-402\r\n联系电话： ***********____________\r\n工作单位和职北	连市城建局士把冰__________\r\nFOLLOWING ARE RECORDE\r\n问：继续核实有关案情，请你如实回答，听清楚了吗？\r\n答：听清楚了。\r\n问：你是因为什么事被带到派出所的?\r\n答：因为贩卖毒品被带到派出所的。\r\n问：从你家搜出的冰毒共有多少克?\r\n答：800多克。问：这些冰毒从哪来的?\r\n答：大概是今年五月，有个广州叫宋怡的毒贩通过物流从广州发给我的，我不知道宋怡的真名叫什么。\r\n问：从你家搜出的嘛咕有多少?\r\n答：大概8G0Q粒左右。\r\n问：这些冰毒从哪来的？？\r\n答：2014年8月广州的的毒贩韦玉怀和宋怡回广州后，宋怡打电话给我，告诉我韦玉怀出事了，让我从星海广场海英公寓他们租住的房子里把他们留在房间里的麻古拿走，替他们保管。\r\n问：第一次做讯问笔录时，你为何说冰毒是宋怡让你保管的？\r\n答：因为我当时那样说是感觉我能减轻罪责。\r\n问：宋怡是如何给你快递毒品的?\r\n答：一共给我快递过两次毒品，第一次是在2014年11月某天，宋怡给我打电话问我麻古是不是在我手里保管着，我说是。他\r\n问我最近干什么，我说什么也没干，然后他问我想不想卖点冰毒，他可以从广州快递给我，以每克120元的价格批发给我，我就同意了。因为第一次我手里没有什么钱，我让黄佳男给宋怡打了3万块钱，打完钱后宋怡通过物流公司给我发了500克冰毒。货到后我和黄佳男开车到华南广场物流公司把货件取回来。第二次是在2015年5月某一天，宋怡打电话问我手里冰毒还有多少了，我说还剩不多了，宋怡说再给我发1000克，按每克1⑽元的价格批给我，我同意了，我让我对象黄佳男给他打了10万元钱。全是黄佳男打的，在哪里打的，打给什么帐号我不清楚。过了几天我和黄佳男又到同一家物流公司把冰毒取回来，到象黄佳男称过后告诉我只有800克左右，我打电话冋宋怡给我发了多少，他说1⑽0克，我说不对吧，差200克呢，他说以后补钱给我。\r\n问：根据《中华人民共和国刑事诉讼法》第八十条之规定，本局现依法对你刑事拘留（公安民警向犯罪嫌疑人出示大公(甘）拘字【2015】79S号拘留证）你听清楚了吗?\r\n答：我听清楚了。\r\n问：你是否知道因为什么事拘留你?\r\n答：因为我给对方提供电话号码、\r\n问：对你拘留所认定的犯罪事实对不对?\r\n答：对。\r\n问：拘留你对不对?\r\n答：对。\r\n问：对你刑事拘留期限是三曰，羁押处所在大连市看守所，你听明白了吗?\r\n答：我听明白了D\r\n问：根据《中华人民共和国刑事诉讼法》第三十三条之规定，你可以聘请律师为你提供法律帮助，代理控告，申诉，你听明白了吗?\r\n答：我听明白了、\r\n问：你还有什么要讲的?\r\n答：没有了', '未知', NULL, '1', '2020-09-06 20:04:18', 'admin', '2020-09-06 20:04:18', 'admin', 61);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号0', NULL, NULL, '未知', '未知', '杨德健', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录\r\n时间2015年12月21日12时21分至2015年12月21日22时20分 \r\n地点:沙河口公安分局高家派出所\r\n讯问人(签名）气乎作单位沙河口公安分局髙家派出所\r\n记录人(签名）今沒	工作单位沙河口公安分局高家派出所\r\n被讯问人：杨德健；性别：男；民族：壮族；文化程度：小学\r\n出生日期：1989年11月27日，政治面貌：群众\r\n人大代表或政协委员：否	患有严重疾病或传染病：否\r\n身份证件种类及号码	身份证：******************\r\n现住址：广西壮族自治区柳江县里雍镇龙江村中堂屯28号\r\n户籍所在地：广西壮族自治区柳江县里雍镇龙江村中堂屯28号\r\n工作单位和职业 无业；电话 ***********\r\n家庭成员：妻子：郭兰妹，30岁、无业\r\n儿子：赵英南、3岁、无业\r\n简历：1996年9月——2002年7月柳江县里雍镇龙江村小学读书\r\n2002年7月-现在无业\r\n是否受过刑事处罚或行政处罚：2010年，因在福建省福清市扒窃， 被判处有期徒刑1年，2013年，因在长沙市扒窃，被判处有期徒刑7个月。\r\n问：我们是大连市公安局沙河口分局高家派出所的侦查员。根据《中>华人民共和国刑事诉讼法》第一白一十八条的规定，在我们对你进行讯问的过程中，对我们的提问你应当如实回答，但对于案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间，如你中途需要休息或饮食请对我们提出，我们将作出相应安排，以上内容你听明白吗？\r\n答：我听明白了。问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读容？\r\n答：好的，我仔细看看（阅读告知书约5分钟）。\r\n问：你是否完全理解告知书的内容?\r\n答：我完全理解。你是否申请办案人员回避?\r\n答：我不申请你们回避。\r\n问：根据《中华人民共和国刑事诉讼法》第二十三条的规定，你现在有权委托律师作为你的辩护人，你是否清楚?\r\n答：我清楚了。\r\n问：你是怎么到公安机关的?\r\n答：今天18时许，我因为在大连市沙河U区肯德基对面(数码路北段7号)扒窃一个女的苹果手机被警察当场抓获，带到公安机关的。和1:你扒窃的手机是什么样子的?\r\n答：是金色苹果6手机。\r\n问：手机在哪?\r\n答：警察抓我的时候，我刚把手机放到我左手里，在将我按倒在地时，我没有握住手机，手机掉在地上，之后警察将手机捡起，手机现在成该在抓捕我的警察手中。\r\n问：你看一下是不是这部手机（指杨德健扒窃戈雅星的金色苹果6手机）？是这部。\r\n问：你偷手机用的镊子是什么样的?\r\n答：白钢的，20多厘米长，镊子前面里面贴的是防滑胶。\r\n问：现在镊子在什么地方?第3页\r\n答：我被抓的时候，被警察拿走了。\r\n问：你看一下是否是这个镊子？（出示抓捕杨德健时，杨德健随身携带的镊子）。\r\n答：就是这个镊子。\r\n问：被偷的女子是什么样的?\r\n答：20岁左右，身高162厘米左右，穿红色尼子大衣。\r\n问：你把扒窃手机的经过讲一下?\r\n答：2015年10月21日18时许/我和骆嘉俊到大连市沙河口区肯德基对面，在路边找可以扒窃的B标，最后我锁定了一个穿红色大衣的女子，她沿着人行道朝与汽车行驶方向不一致的方向走，我跟在她后0，用右手拿的白钢镊子在其右侧大衣口袋内夹出一部金色苹果手机，左手将手机握在手里，之后我停住了脚步，这时过来三个左右的穿便装的警察，将我按倒在地。\r\n问：你偷完手机后，被偷女子发现了吗?\r\n答：她没有发现，继续向前走，警察抓我的时候，女子是否知道我不清楚，现在她是否知道她的手机被我扒窃了，我不清楚。\r\n问：你偷手机的时候，骆嘉俊在哪?\r\n答：在离我2米左右的旁边。\r\n问：他在做什么?\r\n答：和我一样寻找被扒窃的目标。\r\n问：他扒窃到手机了吗?\r\n答：我不知道。\r\n问：他在你旁边的作用是什么?\r\n答：我俩就是搭伴扒窃，各干各的。\r\n问：你俩其中一人扒窃时，另一个人看见有风险被抓时，会怎么做？\r\n答：会提醒机窃的人停止扒窃，或赶紧跑掉。\r\n问：骆嘉俊怎么被抓的?\r\n答：是和我一起被警察抓捕的。\r\n问：警察为什么抓骆嘉俊？\r\n答：我不清楚。\r\n问：你和骆嘉俊是怎么认识的?\r\n答：我俩是老乡，认识十多年了，06年左右一起偷过东西，你们什么肘候到大连的?\r\n答:本月15日到的，想偷点东西卖钱，先玩了6天，今天第一次扒窃就被抓了。\r\n问：你们住在哪?\r\n答：19号前住宾馆，19号开始住华北路的一个房子，具体地址我不清楚、\r\n问：你们怎么租的房子?\r\n答：通过网上租的，月租2000元，租了一个月，本月19日开始入住的。\r\n问：你们偷到东西后，怎么处理？\r\n答：我们计划是偷到的东西到二手市场卖掉。\r\n问：财物你俩怎么分配?第5页\r\n答：谁偷的东西归谁，卖的钱归偷的人。\r\n问：你们在一起扒窃多少次，扒窃到什么物品，怎么处理物品的，怎么分配的财物?笛：我们在大连是第一次机窃。\r\n问：你们最后一次一起扒窃是什么时候?\r\n答：2006年在柳州我俩一起偷过东西，方式和这次一样。\r\n问：你还有什么要补充的?\r\n答：没有。\r\n问：你以上所说都是实话吗\r\n答：是实话。以上笔录交给你看一下，如果和你说的相符，请在下面签字？\r\n答：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 62);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号1', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿\r\n讯问笔录\r\n时间2015年10月21曰13时00分至2015年10月22日14时10分\r\n工作单位\r\n记录人\r\n工作单位处\r\n被讯问人杨德健\r\nFOLLOWING ARE RECORDE\r\n问：杨德健，依据《中华人民共和国刑事诉讼法》的有关规定，下面我们继续就你涉嫌扒窃一案继续对你进行讯问，希望你如实回答我们的问题，说假话怍伪证是要服法律责任的，你是否明白?\r\n答：我明白。\r\n问：你以前向我们交待的都属实吗?\r\n答: 有些地方我说假话了，因为我为了保护我的老乡，就想把偷手机的事一个人担下来，其实我偷的手机并不是我自已一个偷，我是和骆嘉俊起合伙偷。\r\n问：你把详细经过再说一下?\r\n答：我和骆嘉俊、吴金月三个一起于10月15日来到大连准备在大连合伙偷手机。我和骆嘉俊合伙偷，偷手机的时候，骆嘉俊负责给我望风和保管手机。吴金月自己一个人单独干，我们三个来大连这些日子吃住都在一起，偷手机的时候，吴金月就和我俩分开了。我和骆嘉俊一共偷七部手机，其中有六部手机已被我送到顺风快递去了，准备邮到广西卖掉。还有一部手机我还没有来得及邮走，偷完后就被抓了。\r\n问：这七部手机都是在哪偷的?\r\n答：都是在我们被抓现场附近偷的。因为我对大连路不熟，我叫不上名围偷的。\r\n问：你们偷的这七部手机都i么手机?\r\n答：我邮走的那六部手机苹果六，一部苹果六S,还有二部两部杂牌。我被抓现场被警察扣押的那部手机是一部苹果六手机。\r\n问，这七部手机都是如何偷的？I\r\n答：都是我和骆嘉俊一起合伙偷的，骆嘉俊给我望风，我用镊子从被害人衣兜夹出来的。我记得我从一个男的身上偷了两部苹果手机，其中有一部是苹果六S，另一部是苹果六。其余五部手机都是从五个女同志身上偷的。偷这七部手机的时候，每次都是骆嘉俊给我望风，我上去偷的。\r\n问：吴金月总共偷了几部手机？.\r\n答：我不清楚。\r\n问：你和骆嘉俊偷手机如何分工的?\r\n答: 骆嘉俊因为偷的技术不行，负责给我望风和保管手机。我们商量，手机卖完后，赃款按百分之三十分给骆嘉俊，我留百分之七十。\r\n问：你把在被抓现场偷的这部手机的盗窃过程再说一下?\r\n答：昨天下午6点来钟，我和骆嘉俊一起在被抓现场的一个肯德基对面的马路上，寻找扒窃目标。后来我俩发现了一个穿红色大衣的女子在路上走，我俩就跟在她的后面，趁她不注意的时候，我用镊子从她的大衣口袋里夹出一部手机，这是一部金色的苹果六手机，手机刚偷出来不一会我们就被警察抓到了。当时骆嘉俊在干什么？\r\n答: 跟在我后面望风。因为我俩是一起合伙偷手机。\r\n问：你上次是这么讲的？\r\n答：我当时说假话了，不想把骆嘉俊供出来。\r\n问：你还有要补充的吗？答：没有了。\r\n问：以上所讲的属实吗？\r\n答：属实。\r\n问：你看一遍以上笔录，如果和你说的相符签字?\r\n答:好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 63);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号2', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录（第次）\r\n时间2015年11月22时10分至2015年11月日23时10分 \r\n地点：河口公安分局高家派出所\r\n询问(签名）：工作单位沙河口公安分局高家派出所 \r\n记录人(签名）\r\n单位：沙河口公安分局高家派出所\r\n被讯问人杨德健\r\nFOLLOWING ARE RECORDE\r\n问：你以前在公安机关供述的是否属实?\r\n答：属实。\r\n问：你是因为什么事被带到公安机关的?\r\n答：我是因为扒窃被带到公安机关的。\r\n问：你把你被抓获的过程讲一下?\r\n答:2015年10月21日下午17时30分以后，我和骆嘉俊打车到软件园路口，之后我俩走到了一个肯德基快餐店门前的路边，我看到一个穿红色大衣的女的，我就和骆嘉俊跟上去了，跟上去以后我就偷了这个女孩子的手机，骆嘉俊在旁边望风，我刚偷完手机就被警察按倒了。骆嘉俊也被抓i\r\n问：你偷的是一部什么手机?\r\n答：是一部苹果6手机。\r\n问：你是什么时候来到大连的?\r\n答：2015年10月15日来大连的。\r\n问：你一共来大连偷过几部手机?\r\n答：算我昨天被抓的这一部苹果手机我一共偷了7部手机。\r\n问：2015年10月20日你是否这个肯德基饭店路边附近盗窃过手机？\r\n答：我记得我偷过一个男的两部手机。一部苹果6部苹果6S手机。\r\n问：这两部手机什么颜色的？答：苹果6是白色，苹果6S是粉色的，就是常说的玫瑰金。\r\n问：你在盗窃这个人手机的时候骆嘉俊在什么？\r\n答：他在旁边望风。\r\n问：你盗窃的手机哪去了?\r\n答：有6部手机在2015年10月21日下午3、4点钟，邮完手机我和骆嘉俊出来的。\r\n问：你把你邮手机的过程讲一下?\r\n答：我偷完手机准备邮走，我就上网查的顺丰公司电话，我就给顺丰公司打的电话，来了一个快递员上门取件，我在我租住的楼的附近给他的手机，当时我把手机打包了一个纸盒，他给我快递单，我填好给他了，邮费是收款方付钱，我没有给邮费。\r\n问：你快递手机时候留的哪部电话?\r\n答：我留的是我自己的电话，电话号码是：***********.\r\n问：你留的是什么名字?\r\n答：我留的是假名，记不住是什么了，我就把我自己的真实电话留下了，以便有问题能够找到我。\r\n问：你自己留存的快递单哪去了?\r\n答：邮完东西我就扔了。\r\n问：你为什么要来大连偷东西?\r\n答：没有钱了。\r\n问：你还有什么补充的吗?\r\n答：没有了。\r\n问：以上所说属实吗?\r\n答：属实。\r\n问：以上笔录交给你看一下，如果与你讲的相符，请在下面签字。\r\n答：好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 64);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号3', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录\r\n讯问时间2015年月21日12时00分至2015年10月23时\r\n讯问地点： 大连市公安局市看守所\r\n1问人(签名）工作单位沙河口公安分局高家派出所\r\n记录人(签_工作单位沙河口公安分局高家派出所\r\n被讯问人：杨德健\r\nFOLLOWING ARE RECORDE\r\n问：你以前在公安机关供述的是否属实?\r\n答：属实。\r\n问：你是因为什么事被刑事拘留的?\r\n答：我是因为扒窃手机被刑事拘留的。\r\n问:你是怎么被抓获的？\r\n答：我在大连市沙河口区数码路软件园旁边一个肯德基快餐店前路边扒盗窃的手机后被警察当场抓获的。\r\n问：你和谁一起盗窃?\r\n答：我和骆嘉俊一起盗窃，他负责帮我望风，帮我掩护。\r\n问：你们一共盗窃了多少部手机?\r\n答：一共盗窃7部，有6部手机利用顺丰快递邮到外地去卖了。\r\n问：你用什么工具盗窃?我有一个白钢的镊子，镊子前面里面粘了防滑胶，这个镊子当场被警察搜到了。\r\n问：你以上所说是否属实?\r\n问：以上笔录交给你看一下，如果与你讲的相符，请在下面签字。\r\n答：好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 65);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号4', NULL, NULL, '未知', '未知', '骆嘉俊', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿第I页\r\n讯问笔录\r\n时间2015年12月21日14时21分至2015年12月22日16时40分 地点：沙河口局刑侦大队\r\n询问人(签名）匕工作单位：沙河口公安分局刑侦大队\r\n记录义(签名）	工作单位:沙河口公安分局刑侦大队_________\r\n被讯问人骆嘉俊性别男民族壮族文化程度小学_________________\r\n出生日期	1976年8月9日政治面貌	群众________________\r\n人大代表或政协委员：否	患有严重疾病或传染病：否\r\n身份证件种类及号码	身份证：******************_____\r\n现住址：	广西壮族自治区柳江县里雍镇龙江村新村屯1号___________\r\n户籍所在地：广西壮族自治区柳江县里雍镇龙江村新村屯1号__________\r\n工作单位和职业 无业________电话___***********___\r\n家庭$员 哥哥：梁韦赛，农民，42岁\r\n简历：1984年9月——1995年7月柳江县里雍镇龙江村小学读书_____\r\n1995年之今无业 \r\n是否受过刑事处罚或行政处罚：2010年因盗窃被劳动教养2年_____\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局沙河口分局刑侦大队的侦查员。根据《中华人民共和国刑事诉讼法》第一百一十八条的规定，在我们对你进行讯问的过程中，对我们的提问你应当如实回答，但对于案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间，如你中途需要休息或饮食请对我们提出，我们将作出相应安排，以上内容你听明白吗?\r\n答我听明白了。\r\n问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读容？\r\n答好的，我仔细看看（阅读告知书约5分钟）。\r\n问你是否完全理解告知书的内容？\r\n答我完全理解。\r\n问你是否申请办案人员回避？答：我不申请你们回避。\r\n问：根据《中华人民共和国刑事诉讼法》第三十三条的规定，你现在有权委托律师作为你的辩护人，你是否清楚？\r\n答：知道了。\r\n问：卞为什么事情来大连，怎么来的公安机关?\r\n答：为了偷手机和杨德健、韦善书（音）一起来大连的，昨天中午因为偷手机被警察抓住的。\r\n问：你们三个人什么时间来大连的，住在什么地方?\r\n答：这个月15日坐飞机从石家庄来大连的，开始住如家宾馆，后来在华北路汽车城附近找的公寓住的，我们三个人住在一起。\r\n问：谁提议到大连偷手机的?\r\n答：韦善书（音）提议的，他说来大连这里偷手机，我和杨德健同意就一起来了。\r\n问：你们三个人在大连偷了多少手机，讲一下具体盗窃的具体经过？\r\n答：总共偷了6部手机，我认识的有2部苹果，其他的品牌我不记得了，偷手机的地方我不认识，都是打车去的，我对大连不熟悉，记不住地点了。第一部手机是来大连2天后的下午，在南关岭如家宾馆打出到了一个地方在马路上杨德健用镊子偷了一个20多岁的女孩一部手机，她当时把手机放在上衣兜里，我跟着杨德健望风，偷完后杨德健把手机交给我。韦善书（音）没和我俩在一起他自己走到别的地方单干的。。第二部是偷完第一部后的一天下午，我们三个从南关岭如家宾馆打出到了一个I地方后我和杨德健一伙，韦善书（音）自己离开单干的。这次在路边偷了一个20多岁女孩的手机，杨德健用镊子偷的，我在他身后望风，他偷完手机交给我。剩下的4部手机都是我们三个人一起到偷手机的地方，每次出来前都是韦善书(音）用手机在网上查地然后打出去，韦善书（音）到了偷手机的地方后自己离开第3页b/单干。我每次都跟着杨德健干，每次都是他用镊子偷，专偷女的手机，偷完了就给我保管。这4部手机的颜色我记不住了，型号我真的不懂。\r\n问：把偷手机的地点、被害人情况详细讲一下?\r\n答：我真的记不住了。\r\n问：你怎么记住偷了6部手机呢？\r\n答：我拿到住宿的地方数了，杨德健用红色塑料袋包好邮走的。\r\n问：手机里面的卡哪去了、能否找到?\r\n答：我偷完了就拔出来丢了，找不到了。\r\n问：韦善书（音）偷了什么东西？\r\n答：他也是偷手机，他偷完了就自己处理不给我看，具体的偷了什么我不知道。\r\n问：你和杨德健偷的6部手机现在哪里?\r\n答：I6部偷完后我都放在住的公寓里了，昨天I:午10点多，杨德健用红色塑料袋把手机包好了就给快递打电话发走了。\r\n问：杨德健把偷的手机发给谁了。\r\n答：我不懂发快递，都是杨德健发的，他给谁打的电话我不知道。\r\n问：讲一下你们为什么结伙到大连偷手机？\r\n答：我们没有工作，就偷手机卖钱。\r\n问：你们在大连盗窃是怎么分工的?\r\n答：我们三个一起到大连的，我和杨德健一伙，我不会用镊子，所以他负责偷我负责望风、>他偷完手机就交给我，偷完的手机他负责卖，卖手机的钱我得一半，他得半。韦善书（音）自己单干，他不和我俩在一起干，他自己偷的自己得。\r\n问：你们来大连的费用怎么分摊，你在大连偷了6部手机得到多少赃款?\r\n答：费用是自己出自己的，我和杨德健在大连偷的手机还没有卖出去。\r\n问：你们每次偷手机、分赃都是这样吗?\r\n答：是，不用分工了每次都是这样，心里都清楚。\r\n问：你们三个人谁是头？\r\n答：没有头，我们三个一起商量。>\r\n问：讲一下杨德健和韦善书（音）的具体情况，你们三个是什么关系，他俩的手机号码？\r\n答：杨德健和我老乡认识2年多了，他和我是一个镇子的。韦善书（音）是我3年前在柳州喝酒认识的，他俩的手机号在我手机里存着。\r\n问：你还有什么要补充的？\r\n答：没有。\r\n问：你以上所说都是实话吗\r\n答：是实话。\r\n问：以上笔录交给你看一下，如果和你说的相符，请在下面签字?\r\n答：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 66);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号5', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录\r\n讯问时间2015年10L月23_0 时42_分至2015年復月23_0 jj_时5£分\r\n讯问地点	大连市公安局市看守所____________\r\n3问人(签名）工作单位沙河口公安分局高家派出所 记录人(签名)工作单位沙河口公安分局高家派出所\r\n被讯问人：骆嘉俊\r\nFOLLOWING ARE RECORDE\r\n问：你以前在公安机关供述的是否属实？\r\n答：属实。\r\n问：你是因为什么事被刑事拘留的?\r\n答：我是因为和杨德健一起扒窃手机被刑事拘留的。If:你是怎么被抓获的?\r\n答：我和杨德健在大连市沙河U区数码路软件园旁边一个肯德基快餐店前路边扒盗窃的手机后被警察当场抓获的。\r\n问.你和谁一起盗窃?\r\n答：我和杨德健一起盗窃，我负责帮他望风，帮他掩护，他负责偷。\r\n问：你们一共盗窃了多少部手机?\r\n答：一共盗窃7部，有6部手机利用顺丰快递邮到外地去卖了。\r\n问：杨德健用什么工具盗窃?他有一个白钢的镊子，镊子前面里面粘了防滑胶，这个镊子当场被警察搜到了。\r\n问：你以上所说是否属实?\r\n答：属实。问：以上笔录交给你看一下，如果与你讲的相符，请在下面签字。\r\n答：好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 67);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号6', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿时间於,伴n月乂妇(e时/6分至m痒\"月^0 _lX_时w分\r\n地点	大连市公安局看守所\r\n沙河口公安分局高家派出所\r\n1查员姓名、单河口公安分局高家派出所 记录员、单位知受 犯罪嫌疑人骆嘉俊\r\nFOLLOWING ARE RECORDE\r\n问：你在之前笔录中供述的犯罪事实是否属实？\r\n答：属实。\r\n问：你何时因何事被刑事拘留的？\r\n答：我于2015年10月22口，因涉嫌盗窃罪被沙河U区公安分局刑y拘留的。I\r\n问：2015年11月25日，你因涉嫌盗窃罪，经沙河口区人民检察院批准，对你依法执行逮捕，现在向你宣读大公（沙）捕字[2015]478号逮捕证，你听清楚了吗?\r\n答：我听清楚了。\r\n问：你是否聘请律师?\r\n答：我不聘请律师。\r\n问：还有补充吗？\r\n答：没有了。枸：以上笔录交给你看一卜如果和你说的相符，请在下面签字？\r\n答：好的紗兮L没边知私发相好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 68);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号7', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录（第一次）\r\n时间2015年月22_0 20_时42_分至2015年1Q_月21日时12_分 地点_____沙g 口么>安分局高家派出所__________\r\n讯问人（签名f工作单位沙河U公安分局高家派出所 记录人（签名）工作单位沙河口公安分局高家派出所\r\n被讯问人骆嘉俊_______________________\r\nFOLLOWING ARE RECORDE\r\n问：你是怎么到公安机关的?\r\n答：我是于2015年10月21口18时许，在大连市沙河口区数码路的肯德基对面因为和杨德健扒窃手机被警察抓获带到公安机关的。\r\n问：你们这次扒窃什么人的手机?\r\n答：偷一个穿红色尼子大衣的女的，20多岁，身高160厘米左右。\r\n问：你把扒窃经过讲一下?2015年10月21日18时许，我和杨德健打车到沙河口区数码路的肯德基，下车后，我俩开始物色被扒窃的S标，物色了一个穿红色尼子大衣的女子，之后我走在那个女的前面，杨德健跟在那女的后面偷手机，具体怎么偷的我没看见，但我看见一个便衣警察将杨德健按倒在地，一个便衣警察跑到我旁边，抓住我的衣服领子，我看见便衣警察从杨德健手中拿下一个手机，穿红色尼子大衣的女子也过來了，警察把手机递给她，问她手机是不是他的，那个女的说是，之后我和杨德健被带到公安机关。\r\n问：你看见手机是什么样的吗?\r\n答：当时天有点黑，我看不清手机颜色和型号，但知道是手机。相：你的作用是什么?\r\n答：和以前一样，我的作用是放风，如果杨德健偷到手机后会把手机交给我保管，仴这次没等杨德健把手机交给我，我们就被警察抓住了。闷：警察为什么抓你?答：杨德健在偷那个女子手机前，我和杨德健一直在一起，警察成该那时判断出我和杨德健是一伙的，感觉我们像小偷。\r\n问：你怎么放风?\r\n答：我看周围有没有警察，包括穿警服的，和穿便服的，没有人注到杨德健，要是有的话，我就告诉杨德健停止扒窃，或者赶紧跑。\r\n问：杨德健偷完手机后，为什么把手机放在你手中?\r\n答：因为杨德健偷手机时，近距离接触了被扒窃的人，有的人会怀疑他，把手机交给我，即使有人怀疑他，搜他的身，因为搜不到手机，杨德健就会没事了。\r\n问：你在上次笔录中，供认了偷了6部手机，是偷了儿个人？\r\n答：我不是很清楚，有时杨德健连续偷两个人，或者偷一个人的两部手机，都会一次给我两部手机，所以我分不清偷几个人，我当时的作用>1观察周围环境。\r\n问：杨德健有几次一下给你两部手机?\r\n答：我记不清了。\r\n问：如果加上昨天你被抓住时偷的那部手机你们一共偷了几部手机？\r\n答：7部手机。\r\n问.你还有什么需要补充的吗?\r\n答：没有。\r\n问：以上笔录交给你看一卜如果和你说的相符，清在下面签字？卷：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 69);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号8', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿讯问笔录\r\n时间之d年月2^1盛时止分至月笙日，（时/，分\r\n大连市公安局看\r\n地点\r\n侦查员姓名、单位河口公安分局高家派出所 记录员、单位沙河口公安分局高家派出所\r\n犯罪嫌疑人杨德健\r\nFOLLOWING ARE RECORDE\r\n问：你在之前笔录中供述的犯罪事实是否属实?\r\n答：属实。\r\n问：你何时因何事被刑事拘留的？\r\n答：我于2015年10月22日，因涉嫌盗窃罪被沙河口区公安分局刑\r\n问：2015年11月25日，你因涉嫌盗窃罪，经沙河U区人民检察院批准，对你依法执行逮捕，现在向你宣读大公（沙）捕字[2015]479号逮捕证，你听清楚了吗?\r\n答：我听清楚了。\r\n问：你是否聘请律师？\r\n答：我不聘请律师。\r\n问：还有补充吗？&\r\n答：没有了。拘：以上笔录交给你看一不，如果和你说的相符，请在下面签字？\r\n答：好的', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 70);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号9', NULL, NULL, '未知', '未知', '未知', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿第1页\r\n讯问笔录\r\n时间2015年11月22日11时至2015年11月22日18时40分 地点_____沙口#安分局刑侦大队_________________\r\n询问人(签名工作单位:沙河口公安分局刑侦大队___________\r\n记录(签名）工作单位:沙河口公安分局刑侦大队___________\r\n被讯问人骆嘉俊性&男民族壮族文化程度小学_____________\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局沙河口分局刑侦大队的侦查员。根据《中华人民共和国刑事诉讼法》第一百一十八条的规定，在我们对你进行讯问的过程中，对我们的提问你应当如实回答，但对于案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间，如你中途需要休息或饮食请对我们提出，我们将作出相应安排，以上内容你听明白吗?\r\n问，听明白了。你昨天被抓的时候在干什么？\r\n答我和杨德健、韦善书（音）去偷手机？\r\n问讲一下你昨天偷手机的情况？\r\n答我和杨德健、韦善书（音）昨天下午从公寓打车去的，韦善书（音）到了以后就自己走了。我和杨德健一起偷手机，我负责望风，杨德健刚偷了一个20多岁女的手机就被抓了，警察把我也抓住了。\r\n问：这次偷了什么手机?是个苹果6。\r\n问这次偷的手机在哪里？.、\r\n答%派出所警察手里。\r\n问你上次笔录说一共偷了6部手机是怎么回事？\r\n答这个手机我认为没有偷成就不算了。加上这个手机就是7部了。\r\n问你还有什么要补充的？\r\n答：没有。\r\n问：你以上所说都是实话吗\r\n答：是实话。\r\n问：以上笔录交给你看一下，如果和你说的相符，请在下面签字?', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 71);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号10', NULL, NULL, '未知', '未知', '喻世勇', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿第_次询问 第1页共_页\r\n询问笔录\r\n询问时间:2015年10月21曰18时40分至2015年10月21日19时20分\r\n询问地点:大连亨公安局今^可口分局富国街派出所___________\r\n&问人（签名）：工作单位：沙河口分局高家派出所 记录人（签名）：、做工作单位:沙河r吩局高家派出所所 被询问人:喻世勇性别：女出生日期：1996年2月28日文化程度树 户籍所在地:辽宁省抚顺市新抚区永安五街17号2单元302 现住址:	大连市东软信息学院宿舍\r\n被询问人身份证件种类及号码:居民身份证******************_\r\n联系方式:***********______________________\r\n1	(口头传唤的被询问人_月_日_时_分到达，_月\r\n曰_时_分离开，传唤的理由和依据已告知本人，本人 签名确认：___)。\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局沙河口分局高家派出所的民警，现依法向你进行询问，你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：知道为什么事让你到派出所来吗?\r\n答：知道，因为我同学戈雅星的手机被偷，我来作证。\r\n问：戈雅星的手机是什么时间，在哪里被偷的?\r\n答：2015年10月21日17时40分许，在沙河口区数码路北段肯德基餐厅对面发生的事。你是怎幺知道你同学戈雅星的手机被偷的，把经过讲一下。\r\n答：我和戈雅星准备去学校上晚自习，走到数码路北段肯德基对面的时候，听到后面有人大喊，我们就回头看发生了什么事，我看到有几个便衣警察将两个人按在地上，这时一个警察走过来问我和戈雅星是否丢东西了，我们翻衣兜，我身上没有少任何东西，但戈雅星的手机不见了，这时才发现戈雅星的手机被偷了，我们跟着警察来到被抓到的人前，警察从他的衣兜里拿出了一部手几，手机就是戈雅星的手机,后来我们就跟警察一起回到派出所。\r\n问：戈雅星的手机是什么牌子，什么样子的?\r\n答：是金色IPHONE6手机。\r\n问：戈雅星将手机放在哪里你是否清楚?\r\n答：她就放在她外衣兜里。\r\n问：你看到警察是从谁身上找到的戈雅星电话。\r\n答：是一个个子不高，短发，穿着浅色牛仔裤，微胖的男的身上搜出的戈雅星电话。\r\ni问：你还有什么要补充的吗？\r\n答：没有要补充的。\r\n问：以上所述是否属实?\r\n答：属实。么备i.b飪说唞刎', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 72);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号11', NULL, NULL, '未知', '未知', '戈雅星', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿第次询问\r\n询问笔录\r\n时间2015年月2£0 11时分至2015年边_月2J_0	时2L分\r\n軔问地点______木连市公安局沙河U分局高家派出所\r\n询问人(签名;)\r\n作单位沙河口公安分局高家派出所\r\n记录人(签名）作单位沙河口公安分局高家派出所\r\n被询问人戈雅星，性别女,出生日期1996年3月30 口______\r\n户籍所在地：河北省张家口；^化区钢鑫小区32号楼7-6-2\r\n现住址：大连市甘井子区东软信息学院二期B座426宿舍__________\r\n工作单位：东软信息学院学生文化程度:本科_____________\r\n被询问人身份证件种类及号码身份证：******************\r\n>\r\n联系方式***********民族:汉族_______________\r\n(口头传唤的被询问人_月__日_时_分到达，_月_日_时_分离开，本 人签名确认：______)。\r\nFOLLOWING ARE RECORDE\r\n问：我们是沙河口公安分局的工作人员（出示执法证件），现依法向你进行询问，你要如实冋答我们提出的询问，对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?\r\n答：听清楚了。\r\n>问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：你因为什么事情来到公安机关?\r\n答：我来报案，我手机被偷了。\r\n问：什么时间什么地点?\r\n答：2015年10月21日17时40分左右，在大连市沙河区数码路北段肯德基对面人行道。\r\n问：你把事情的详细经过讲一下?\r\n答：2015年10月21日17时40分左右，我和我同学喻世勇去学校上晚自习，走在大连市沙河区数码路北段肯德基对面人行道去往学校的路上，一个在大约30岁左右的男子，把我放在右侧毛妮大衣兜里苹果6手机偷走了，当时我没有发现，我听到后面有动静，一个警察喊我一声，我就过去了，警察问我，时候是不被偷了，我一摸兜里手机不见了，我看到警官把一个小偷当场按倒在地上，从这个小偷手中拿问了我的手机，返还给了F\r\n问：你被偷的手机是什么品牌在哪里买的？\r\n答：金色直板苹果6手机，是2015年1月在河北省张家口市苹果专卖店花5300元人民币购买的。\r\n问：你被偷的手机号码是多少?\r\n答：***********。\r\n问：你手机现在在哪里?\r\n答：是警察把我被偷的手机返还给我了。\r\n>问：喻世勇联系电话是多少？‘\r\n答：***********.\r\n问：你还有什么需要补充的吗?\r\n答：没有。第3页共3页\r\n问：以上笔录交给你看一下，如果与你讲的相符，请在下面签字。\r\n答：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 73);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号12', NULL, NULL, '未知', '未知', '江寿林', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿HO\r\n第l次第1页\r\n\r\n询问笔录（第一次）\r\n时间2015年1月20.0 1^_时分至2015年12_月20_0 时J_Q_分\r\n地点_____沙河口公安分局高家派出所_______________\r\n衲问人(签名作单位沙河口公安分局高家派出所 记录人(签名)单位了	沙河口公安分局高家派出所\r\n被询问人江寿林 性别_±_民族汉 文化程度中专\r\n出生日期1993年3月15曰____政治面貌群众__________\r\n身份证件种类及号码	身份证：******************_\r\n现住址辽宁省大连市高新园区凌涛园802_______________\r\n户籍所在地辽宁省建平县昌隆镇章京营子村5-045号_________\r\n工作单位和职业大连市沙河口区凌水桥综合门诊电话*********** \r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局沙河口分局高家派出所的侦查员，根据《中\r\n单人民共和国刑事诉讼法》第一百一十八条的规定，在我们对你进行\r\n询问的过程中，对我们的提问你应当如实回答，但对于案件无关的问\r\n题奋拒绝回答的权利，如你中途需要休息或饮食请对我们提出，我们\r\n将作出相应安排，以上内容你听明白吗?\r\n答：我听明白了。\r\n问：你来派出所为什么事?\r\n答:我来报案，我的手机被盗窃了。\r\n问：这是《被害人诉讼权利义务告知书》，送你阅读?\r\n答：好的，我仔细看看（阅读告知书约5分钟）。\r\n问：你是否完全理解告知书的内容?\r\n答：我完全理解。\r\n问：什么时间发现的？\r\n答：2015年10月20日12时20分许，我从大连市沙河U区凌水桥附近的中国银行出来，走到凌水桥车站时，发现放在上衣左侧外衣兜的手机不见了，我就拨打110报警了。\r\n问：最后一次看到手机的时间?\r\n答:我最后一次看到手机在12时10分左右。\r\n问：你的手机有什么特征?\r\n答：金色的iphone6PLUS，64G。\r\n问：什么时间购买的？当时价值多少钱?\r\n答：2015年10月7日购买的。当时花了6000元。\r\n问：丢失手机的电话号码是多少？手机的串码是多少?\r\n答：手机号码：***********。手机串码：***************。你的手机有损伤的部位吗?>\r\n答：没有。\r\n问：你还有什么需要补充的吗?\r\n答：没有了。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 74);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号13', NULL, NULL, '未知', '未知', '王仙华', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿询问笔录（第一次）\r\n时间2015年10月21日13时41分至2015年10月21日\r\n地点_____f河分局高家派出所__________________\r\n、问人(签名作单位沙河口公安分局高家派出所\r\n记录人(签名位___________沙河口公安分局高家派出所\r\n被询问人王仙华；性别；民族I______文化程度本科\r\n出生曰期1979年7月4日 政治面貌群众______________\r\n身份证件种类及号码	身份证：******************_\r\n现住址大连市甘井子区西南路芳林园33号1-10-1_________\r\n户籍所在地大连市甘井子区西南路芳林园33号1-10-1_______\r\n工作单位和职业大连阿迪达斯商务服务大连宥限公司电话\r\n***********\r\n问：我们是大连布公安局沙河U分局高家派出所的侦查员，根据《中华人民共和国刑事诉讼法》第一百一十八条的规定，在我们对你进行询问的过程中，对我们的提问你应当如实回答，但对于案件无关的问题有拒绝问答的权利，如你中途需要休息或饮食请对我们提出，我们将作出相安排，以上内容你听明白吗?\r\n答：我听明白了。\r\n问：你来派出所为什么事?\r\n答：我来报案，我的手机被盗窃了。\r\n问：这是《被害人诉讼权利义务告知书》，送你阅读?\r\n答：好的，我仔细看看（阅读告知书约5分钟）。你是否完全理解告知书的内容?\r\n答：我完全理解。\r\n问：什么时间发现的?\r\n答: 2015年10月21日12时许，我在大连市沙河口区软件园东路23号楼吃午饭，吃完饭溜达一会儿，13时许，再走到23号楼楼下时，发现手机丢失了，当时我的手机装在外衣右兜里。\r\n问：为什么现在才來报案?\r\n答：当时我感觉找不到了，就没存来报案。昨天我接到公安局的电话，通知我来公安局的。\r\n问：你的手机是什么品牌的?\r\n答：金色iphone6(内存128G)。\r\n问：手机号码是多少？手机串码是多少？\r\n答..***********，中码***************.\r\n问：你的手机是什么时候购买的？当时价值多少钱?\r\n答：2015年2月份购买的，当时价值WOO元。>\r\n问：你的手机菊损伤的地方吗?\r\n答：有，左下角屏幕碎了。\r\n问：你还有什么需要补充的吗?\r\n答：没有了。\r\n问：以上笔录交给你看一下，如果和你说的相符，请在下面签字？\r\n答：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 75);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号14', NULL, NULL, '未知', '未知', '荆树林', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿询问笔录（第一次）\r\n时间2015年10月20_n 11时49分至2015年10月20_0 1£时20_分\r\n地点_____沙河口戸#局高序严出所________________\r\n嗲问人（签名位沙河口公安分局高家派出所 记录人(签名位 X 沙河口公安分局高家派出所 被询问人荆树林性别男民族汉族文化程度大专在读\r\n出生曰期_____1997年1月13曰__政治面貌团员\r\n身份证件种类及号码	身份证：******************_\r\n户籍所在地	辽宁省葫芦岛市连山区_________________\r\n工作单位和职业东软信息学院学生电话*********** (辛广伟）\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局沙河口分局高家派出所的侦查员，。根据《中华人民共和国刑事诉讼法》第一西一十八条的规定，在我们对你进行\r\n，问的过程中，对我们的提问你应当如实回答，但对于案件无关的问题有拒绝回答的权利，如你中途需要休息或饮食请对我们提出，我们将作出相应安排，以上内容你听明白吗?\r\n答：我听明白了。\r\n问：你来派出所为什么事?\r\n答：我来报案，我的手机被盗了。\r\n问：这是《被害人诉讼权利义务告知书》，送你阅读?\r\n答：好的，我仔细看看（阅读告知书约5分钟)。\r\n问：你是否完全理解告知书的内容?\r\n答：我完全理解。什么时间什么地点发生的？\r\n答：今天（2015年10月20日)17时40分左右，在东软信息学院学生二期公寓大门到数码路上铁道附近还没到公交车站的地方。\r\n问：具体经过讲一下?\r\n答：今天在学校上晚自习，从学生公寓大门出来，我还看了我的手机，我带了两部手机，都放占上衣口袋里，之后我从大门处走到数码路上，f数码路往北走，走到数码路和铁道交叉的附近，还没有到公交车站的地方，前后不到5分钟，我要用手机，发现手机没苻了，而H.是两部手机都没有了，我马上用我同学的电话给我的两部手机打电话，但已经关机了，我确定我的手机被盗了，就报案了。\r\n问：两部手机是花多少钱什么时间什么地点买的？\r\n答：苹果6是在2015年2月在葫芦岛市买的，当时花了5600元；另一个苹果6S是上星期在京东网上买的，花了5700元。\r\n问：两部手机的牌号和特征？>\r\n答：苹果6是银白色的；苹果6S是玫瑰鑫色的。\r\n问：两部手机的串号？\r\n答:苹果6的是H苹果6S是***************。\r\n问：两部手机的号码？\r\n答:苹果6的是***********;苹果6S的是***********。\r\n问：是否有嫌疑人？\r\n答：没有。\r\n问：是否还有其他东西被盗？>\r\n答：没有了。\r\n问：以上所讲属实吗?\r\n答：属实。第丨次第3页\r\n问：你还有什么需要补充的吗?\r\n答：没有。\r\n问：以上笔录交给你看一下，如果和你说的相符，请在下面签字', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 76);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号15', NULL, NULL, '未知', '未知', '薛永新', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿第1次询问\r\n询问笔录\r\n询问时间2015年1L月4_日11时Q_分至2015年UL月4_日1L时41分\r\n、问地点_______大连市公安局沙河U分局高家派出所_________\r\n询问人(签名）m j	乍单位沙河口公安分局高家派出所\r\n记录人(签名）〜、、t 工作单位沙河口公安分局髙家派出所\r\n被询问人薛永新性别i出生日期	1993年4月4 口____\r\n户籍所在地：辽宁省鞍山市立山区灵山路19栋3单元3层37号\r\n现住址：	辽宁省大连市沙河口区黄河路850号4公寓214________\r\n工作单位：辽宁师范大学文化程度:	本科在读__________\r\n被询问人身份证件种类及号码身份证：******************_\r\n联系方式： *********** 民族:汉族_____________\r\n(口头传唤的被询问人_月_日_时_分到达，_月_日_时_分离开，本 人签名确认：_______)o\r\nFOLLOWING ARE RECORDE\r\n问：我们是沙河口公安分局的工作人员（出示执法证件），现依法向你进行询问，你要如实冋荇我们提出的询问，对与案件无关的问题，你有扪绝回答的权利。你听清楚没有?\r\n答：听清楚了。你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：因为什么事情到公安机关来?\r\n答：我手机被偷了，我来报案。\r\n问：什么时间，在哪里发生的事?\r\n答：2015年10月20日11时50分许，在辽宁省大连市沙河口区数码路北段7号东软二期学生宿舍附近。\r\n问: 你把事情的详细经过说一说?\r\n答：2015年10月20日11时50分许，我走到宁省大连市沙河口区数码路北段7号东软二期学生宿舍附近时发现放在左侧外衣兜内的小米4手机不见了，今天我就来所报案了。\r\n问：为什么才到公安机关报案?\r\n答：因为最近比较忙所以今天（2015年11月4日）才到所报案。\r\n问：丢失手机的型号？价值?\r\n答：小米4，白色，16g，2014年10月份左右，在淘宝网上购买的，价值>2166元。\r\n问：丢失手机的手机串码？\r\n答：***************。\r\n问：丢失手机的电话号码？\r\n答:***********。\r\n问：丢失手机是否有其他特征？\r\n答：后盖小米的logo上有磨损。你还有什么需要补充的吗？\r\n答：没有了。\r\n问：以上所说是否属实。\r\n答：属实。问：以上笔录交给你看一下，如果与你讲的相符，请在下面签字？\r\n答：好。', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 77);
INSERT INTO `low_record_info` VALUES ('大公(沙)诉字[2016]24号', '大公(沙)诉字[2016]24号16', NULL, NULL, '未知', '未知', '陈有凤', '未知', '2020-09-06 20:36:28', NULL, NULL, '﻿询问笔录（第一次）\r\n时间2015年IL月6_0 1£时21分至2015年1L月£日1L时4L分\r\n地点_____g河口公g分局f家派出所	________\r\n1问人（签名愈沙河口公安分局高家派出所 记录人(签名单位了 沙河口公安分局高家派出所\r\n被询问人：陈有凤,性别：男;文化程度本科\r\n出生日期1989年6月1 口	政治面貌群众_____________\r\n身份证件种类及号码	身份证：******************_\r\n现住址大连市高新园区三星大厦2113________________\r\n户籍所在地 大连市高新园区二星大厦2113_____________\r\n工作单位和职业大连简柏特 电话 *********** !以仲⑷ 问：我们是大连市公安局沙河U分局高家派出所的侦查员，根据《中\r\n人民共和M刑事诉讼法》第一百一十八条的规定，在我们对你进行\r\n询问的过程中，对我们的提问你应当如实回答，但对于案件无关的问\r\n题有拒绝回答的权利，如你中途需要休息或饮食请对我们提出，我们\r\n将作出相应安排，以上内容你听明白吗?\r\n答：我听明白了。\r\nFOLLOWING ARE RECORDE\r\n问：你来派出所为什么事?\r\n答：我来报案，我的手机被盗窃了。\r\n问：这是《被害人诉讼权利义务告知书》，送你阅读?\r\n答：好的，我仔细看看（阅读告知书约5分钟）。\r\n问：你是否完全理解告知书的内容?我完全理解。\r\n问：什么时间发现的?\r\n答:2015年10月20日12时许，我在大连市沙河口区软件园东路23号楼吃午饭，从21号楼到23号楼，100米左右的距离，我装在外衣兜里。\r\n问：为什么现在才来报案?\r\n答：3时我感觉找不到了，就没有来报案。今天我接到公安局的电话，$知我来公安局的。\r\n问：你的手机是什么品牌的?\r\n答：白色乐视。\r\n问：手机号码是多少？手机串码是多少?\r\n答：***********，串码：***************.\r\n问：你的手机是什么时候购尖的？当时价值多少钱?\r\n答：2015年10月份购买的，当时价值1500元。\r\n问：你的手机又损伤的地方吗?>\r\n答：没有。\r\n问：你还有什么需要补充的吗?\r\n答：没有了。\r\n问：以上笔录交给你看一下，如果和你说的相符，请在下面签字？\r\n答：好', '未知', NULL, '1', '2020-09-06 20:36:28', 'admin', '2020-09-06 20:36:28', 'admin', 78);

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `fired_time` bigint(20) NOT NULL,
  `sched_time` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `last_checkin_time` bigint(20) NOT NULL,
  `checkin_interval` bigint(20) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'BILL-PC1599581855220', 1599629494917, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `repeat_count` bigint(20) NOT NULL,
  `repeat_interval` bigint(20) NOT NULL,
  `times_triggered` bigint(20) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(20) NULL DEFAULT NULL,
  `prev_fire_time` bigint(20) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(6) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1599581860000, -1, 5, 'PAUSED', 'CRON', 1599581855000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1599581865000, -1, 5, 'PAUSED', 'CRON', 1599581855000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1599581860000, -1, 5, 'PAUSED', 'CRON', 1599581855000, 0, NULL, 2, '');

-- ----------------------------
-- Table structure for return_json_info
-- ----------------------------
DROP TABLE IF EXISTS `return_json_info`;
CREATE TABLE `return_json_info`  (
  `json_uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'json_uid',
  `bill_num` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文书编号',
  `json` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '返回的json',
  `bill_uid` int(11) NOT NULL COMMENT '对应文书uid',
  `create_datetime` datetime(0) NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '创建人',
  `update_datetime` datetime(0) NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '更新人',
  PRIMARY KEY (`json_uid`) USING BTREE,
  UNIQUE INDEX `JSON_UID_PK`(`json_uid`) USING BTREE,
  UNIQUE INDEX `BILL_NUM_FK`(`bill_num`) USING BTREE,
  INDEX `BILL_UID_FK`(`bill_uid`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BILL_UID_FK` FOREIGN KEY (`bill_uid`) REFERENCES `indictment_bill_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 47 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of return_json_info
-- ----------------------------
INSERT INTO `return_json_info` VALUES (45, '甘公刑诉字(2016)094号', '{\"case_id\": \"甘公刑诉字(2016)094号\", \"main_doc_list\": [{\"doc_txt\": {\"original_str\": \"起诉意见书甘公刑诉字(2016)094号犯罪嫌疑人刘景全,男,汉族,1985年1月1日生,黑龙江省㝉安市,身份证号码:******************,初中文化,系无业,户籍所在地:黑龙江省㝉安市镜泊乡镜泊村1组0171号违法犯罪经历:犯罪嫌疑人刘景全于2016年1月19日因涉嫌故意伤害罪被我局刑事拘留,同年1月29日被依法批准逮捕,现羁押于大连市看守所。犯罪嫌疑人刘景全涉嫌故意伤害一案,我局于2016年1月18曰立为故意伤害案进行侦查,现已侦查终结。经依法侦查查明,犯罪嫌疑人刘景全有下列犯罪事实:2015年12月8日0时许,在甘井子区兴华路立元洗浴中心男浴区内,犯罪嫌疑人刘景全与被害人谢嘉华因琐事发生争吵,后刘景全回到男更衣室内将事情告知与其一起到洗浴中心的乐颐、张继彪、李少倩三人。随后刘景全四人在男更衣室内与谢嘉华发生冲突,期间犯罪嫌疑人刘景全持铁撮子将谢嘉华面部打伤,经法医鉴定:谢嘉华头面部损伤系锐器致伤,其损伤程度属轻伤一级。认定上述事实的证据如下:1,犯罪嫌疑人刘景全供述笔录;2被害人谢嘉华笔录;3证人李少倩、雪光、张继彪、张金魁询问笔录;4张金魁、谢嘉华辨认笔录;5(大甘)公(司)鉴(法医临床)字[2015]491号法医学人体损伤程度鉴定意见书。上述事实清楚,证据确实、充分,足以认定。综上所述,犯罪嫌疑人刘景全的行为已触犯《中华人民共和国刑法》第二百三十四条之规定,涉嫌故意伤害罪。依照《中华人民共和国刑事诉讼法》第一百六十条之规定,特将此案移送审查起诉。此致大连市甘井子区人民检察院\", \"para_loc\": [0, 5, 20, 113, 181, 230, 254, 425, 437, 539, 559, 645, 647, 659]}, \"doc_fact\": [{\"no\": 0, \"time\": \"2015年12月8日0时许\", \"location\": \"甘井子区兴华路立元洗浴中心男浴区内\", \"people\": [\"谢嘉华\", \"刘景全\"], \"content\": [254, 310]}, {\"no\": 1, \"time\": \"2015年12月8日0时许\", \"location\": \"洗浴中心\", \"people\": [\"刘景全\", \"乐颐\", \"谢嘉华\", \"李少倩\", \"张继彪\"], \"content\": [310, 425]}]}], \"attach_doc_list\": [{\"attach_doc_text\": {\"original_str\": \"讯问笔录(第2次)时间2016年月11曰17时20分至2016年月190时1分地点大连市看守所侦查员姓名、单位戈和3广通甘井子分局兴华街派出所记录员姓名、单位/卞参甘井子分局兴华街派出所犯罪嫌疑人姓名刘景全FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所民警(出示证件),现依法对你进行讯问,你应当如实回答我们的提问,对与本案无关的问题,你有拒绝回答的权利,听明白了吗?答:听明白了。问:根据《中华人民共和国刑事诉讼法》第八十条之规定,你现在被刑事拘留了,你听明白了吗?答听明白了。问这是拘留证,你看一下。答好。问你知不知道你为什幺被拘留的?答知道,因为我涉嫌故意伤害的事情。问什幺时间,在什幺地方发生的事情?答在2015年12月7日24时许,甘井子区立元洗浴中心发生的。问你跟谁打架?答我们这一伙有我、乐颐、张继彪、李少倩四个人,对面是立元洗浴中心的服务员。问:你们是否都动手了?答:我们都动手打那个服务员了。答:那个被我们打的服务员捂着腔,具体受什幺伤我不清楚,但是伤是被我们打的造成的,我也受伤了,我左眼肿了,是被那个服务员用拳头打的。问:你把事情经过说一下?答:我在第一次笔录中已经说过了。问:根据《中华人民共和国刑事诉讼法》之规定,你可以聘请律师为你进行法律咨询,代理申诉、控告,你听明白了吗?答:听明白了。问:你逆有什幺要补充的吗?答:没有了。问:你以上讲的都属实吗?答:属实。\", \"para_loc\": [0, 9, 47, 93, 110, 190, 197, 240, 246, 258, 261, 276, 293, 310, 341, 348, 385, 396, 476, 488, 504, 557, 564, 577, 583, 595, 600]}, \"attach_doc_fact\": [{\"no\": 0, \"time\": \"2015年12月7日24时许\", \"location\": \"甘井子区立元洗浴中心\", \"people\": [\"刘景全\"], \"content\": [310, 341]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:2016年1月18日4时06分至2016年1月18日5时05分询问地点:$连市公安局甘井子分局兴华街派出所询问人(签名):我工作单位:纠怒*训记录人(签名):洛金氏工作单位:衣,免咏丁被询问人:李少倩性别:男出生日期:1981年5月7日文化程度:初中户籍所在地:黑龙江省林甸县红旗镇红光村四屯15号现住址:辽㝉省大连市甘井子区南关岭路61号173工作单位:无被询问人身份证件种类及号码:居民身份证:******************是否人大代表联系方式:***********(口头传唤的被询问人月日时分到达,月曰时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答,属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被传唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我不想家里人知道。问:什幺时间,在什幺地点打仗的?答:2015年12月7日晚上12时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、乐颐、张继彪。刘景全、乐颐是亲哥俩,都是黑龙江人,刘景全今年29岁,乐颐今年31岁,刘景全的电话是***********;张继彪,20多岁,短发,身高1.70米左右。问:你们为什幺打仗?答:刘景全和我们说他在洗澡的地方小便,服务员不让,他打了服务员一巴掌。后来,我们在二楼的换衣室又将这个服务员打了。问:被打得服务员长什幺样?答:他大约25岁,身高约1.70米,中等身材,圆脸,他当时穿着洗浴中心的工作服,上身是蓝色的。其他的没注意。问:你4巴当时经过讲一下?答:2015年12月7日晚上20时左右,我和刘景全、乐颐、张继彪到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅休息。当时,我、刘景全、张继彪都喝了不少酒了。到晚上12时左右,刘景全去上厕所回到休息大厅,对我们说他去上厕所时被服务员骂了,他打了服务员一巴掌。张继彪就说他先出去看看怎幺回事,张继彪就先出去了,我和刘景全,乐颐随后也跟着出去了,换衣室在休息大厅外面,我们出了休息大厅后,看见张继彪正在跟经理还有那个跟刘景全发生冲突的服务员讲话,我们就朝他们走过去,这时候曹成推开了,走到那个服务员身球时,服务员好像嘴里骂了刘景全一句,丁农朝那个服套秦脸上打.了一拳,义后农个服务员奠丁电发雨拳,我一看刘景全被打了,多沐去童双,1朋11个风至.身>打了两拳,高成文和乐颐也冲上来对着那个服务员,赐,当时洗浴的经理还有一些服务员就过来拉架,打了\\\"\\\"大薇有1分钟左右,就停手了,洗浴的经理和服务员也都在劝架,我以为这个事情就这样完了,我和乐颐还有高成文就回到换衣箱边上穿衣服,突然间我听到刘景全又在叫骂,好像又跟人打起来了,我们三个就赶紧跑过去,就看见那个服务负捂着脸蹲在地上,脸上已经出11:血了,丁家峰.手异拿着一个卷把的..白钢摄子还在叫骂,乐颐赶紧冲上去把刘景全推了出去,然后就有人报警说警察马上来,我跟刘景全就先离开了立元洗浴。问:挨打那个服务贾是否受伤?答:他受伤了,我看见他脸上有血迹。问:这个服务员的伤是怎幺造成的?答:我们4个一起打他的时候都是赤手空拳,当时他脸上没有伤,后来我们穿衣服的时候,刘景全又和那个服务员产生了冲突,我想伤应该是当时造成的,我们过去的时候看见刘景全手里拿着一个长把的白钢撮子,那个服务员捂着脸蹲在地上,脸上当时已经出血了。问:撮子是什幺样的?答:就是普通长杆的撮子,是白色的,像是白钢做的。是立元洗浴里用来打扫卫生的。问:你是否受伤?问:当时拉仗的都有谁?答:就是立元洗浴的服务,具体有谁我不清楚。问:你们四个人当时的衣着?答:我当时上身光着膀子下身穿着俗袍的黄色裤子;刘景全当时上身光着膀子,下身是红色的浴服;乐颐当时上身穿黑色的背心,下身是蓝色的牛仔裤;高成文穿黑色的皮夹克,下身是黑色裤子。问你是否被公安机关处理过?答没有。问你的家庭成员?答母亲:叶星宏,55岁,在原籍;父亲,韦春雪,59岁,在原籍。问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 40, 62, 80, 101, 134, 158, 182, 188, 226, 232, 248, 302, 389, 397, 412, 420, 438, 453, 508, 524, 540, 581, 592, 684, 694, 751, 764, 818, 831, 1396, 1410, 1427, 1443, 1560, 1570, 1608, 1627, 1648, 1661, 1747, 1760, 1764, 1772, 1803, 1813, 1817, 1825, 1829, 1846, 1849]}, \"attach_doc_fact\": [{\"no\": 1, \"time\": \"2015年12月7日晚上12时左右\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"李少倩\"], \"content\": [540, 581]}, {\"no\": 2, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"乐颐\", \"刘景全\", \"李少倩\", \"张继彪\"], \"content\": [592, 635]}, {\"no\": 3, \"time\": \"今年\", \"location\": \"\", \"people\": [\"乐颐\", \"刘景全\", \"李少倩\", \"张继彪\"], \"content\": [635, 684]}, {\"no\": 4, \"time\": \"2015年12月7日晚上20时左右\", \"location\": \"立元洗浴中心\", \"people\": [\"乐颐\", \"刘景全\", \"李少倩\", \"张继彪\"], \"content\": [831, 910]}, {\"no\": 5, \"time\": \"晚上12时左右\", \"location\": \"立元洗浴\", \"people\": [\"丁农\", \"刘景全\", \"丁家峰\", \"乐颐\", \"高成文\", \"李少倩\", \"张继彪\", \"曹成\"], \"content\": [910, 1396]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:2015年12月8015时06分至2015年12月80珏时让分询问地点:大连市公安甘井子分局兴华街派出所询问人(黎名):含16备工作单位:记录人(签名):士工作单位:被询问人:乐颐性别:男出生日期:1985年1月1日文化程度:小生户籍所在地:黑龙江省㝉安市镜泊乡镜泊村1组0171号现住址:大连市甘井子区南关岭鹏辉三期56号工作单位:无被询问人身份证件种类及号码:居民身份证:******************口是否人大代表联系方式:591159743(口头传唤的被询问人月曰时分到达,月曰时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被倚唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我不想家里人知道。问:什幺时间,在什幺地点打仗的?答:是昨天(2015年12月8日)早上1时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、张继彪、双牙子(小名)。刘景全和我是亲哥俩,都是黑龙江人,我今年31岁,我弟弟刘景全实际是30岁,但他身份证是和我同年同月同日生的,他身份证号码是******************。问:你们为什幺打<丈?答:我不清楚具体为什幺打架,我们在休息大厅休息,我弟弟上完厕所回来说他被服务员骂了,他打了服务两下。之后张继彪去更衣室换衣服,我怕他吃亏,所以也跟着去更衣室,之后我弟出来看见了那个服务贵就打起来了。问:被打得服务员长什幺样?答:没看清,但见面能认出来。问:你4匕当时经过讲一下?答:昨天(2015年12月7日)晚上9时30分左右,我和刘景全、张继彪、双牙子到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅看节目。当时,我跟双牙子没喝酒,我弟和张继彪喝了不少酒。到今天(2015年12月8曰)凌晨1时左右,刘景全去上厕所回到休息大厅,对我们说\'我去撒尿,让服务员骂了我就问他为什幺,他说他想床屎,没憋住,就在洗澡的排水沟尿了,服务员把他骂了。然后他就给了月务员两拳。之后张继彪就先走了,我怕他吃亏,因为他喝多了,所以我就跟他来到了更衣室。我在更衣室看见张继彪要跟服务员出去干仗,我就上去拉住张继彪,之后我在换衣服,这时我弟就出来了,看见那个服务员就给了他一拳,那服务员回手给了我老弟两拳。我看见我老弟受欺负就上去给了那个服务负两拳,服务员又给我两拳,并且拖着戒。这时双牙子和张继彪就上去用拳头打那个服务员,我就开始拉架,把那个服务员拖到角落坐着,之后我就去换衣服。换完衣服回头看见我老弟和那个服务员在一个位置,那个服务员满头是血,然后我就拉着我老弟,给他拉下楼了a之后我老弟还想上去打,我和大堂经理一直拉着我老弟,所以我弟没打着那个服务贞。结完账后警车就来了,我就回家了。问:挨打那个服务员是否受伤?答:他受伤了,是头部受伤的,具体伤的怎幺样我不清楚。警察来时,我在外面看见那个挨打的服务员在屋里坐着。我看见警察把张继彪带走后我就回家了。问:这个服务员的伤是怎幺造成的?答:我不清楚,我什幺都没看见,我打了他两拳,双牙子和张继彪也打了他几拳。问:你弟是怎幺打服务员的?答:用拳头打的,至于是否拿东西打这个服务员我就不清楚了。问:你是否受伤?答:我的右胳膊受了伤,右脚大母脚趾没有知觉,我的伤是那个挨打的月艮务员造成的。问:当时拉仗的都有谁?答:我和浴区两个服务员。那两个服务员一个是斜眼的,一个是老头。其他的我就不知道了。问:你们四个人当时的衣着?答:我打架是就穿了一个黄色的裤衩,我弟和双牙子穿了一套红色的一次性裕服;张继彪上身穿着黑色皮衣,下身穿的黑色裤子。问你是否被公安机关处理过?答没有。问你的家庭成员?答我就刘景全一个弟弟,我爸爸妈妈离婚了。问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 61, 78, 92, 124, 150, 171, 177, 222, 236, 290, 377, 385, 400, 408, 426, 441, 496, 512, 528, 573, 584, 685, 696, 795, 808, 822, 835, 1331, 1345, 1414, 1430, 1466, 1479, 1507, 1515, 1565, 1606, 1619, 1676, 1689, 1693, 1701, 1721, 1731, 1735, 1743, 1747, 1764, 1767]}, \"attach_doc_fact\": [{\"no\": 6, \"time\": \"昨天\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"乐颐\"], \"content\": [528, 573]}, {\"no\": 7, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"乐颐\", \"双牙子\", \"刘景全\", \"张继彪\"], \"content\": [584, 685]}, {\"no\": 8, \"time\": \"昨天(2015年12月7日)晚上9时30分左右\", \"location\": \"立元洗浴中心\", \"people\": [\"乐颐\", \"双牙子\", \"刘景全\", \"张继彪\"], \"content\": [835, 926]}, {\"no\": 9, \"time\": \"今天\", \"location\": \"\", \"people\": [\"刘景全\", \"乐颐\", \"双牙子\", \"我老弟\", \"张继彪\"], \"content\": [926, 1331]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:迎年12月80时巧分至年12月80丛时2分询问地点:大,$市公安局甘井子分局兴华街派出所询问人(签名):耒1(颂各:工作单位:竽存倒派邮什记录人(签名):35工作单位:被询问人:张继彪性别:男出生曰期:1992年4月20日文化程度:初中户籍所在地:黑龙江省拜泉县国富镇民强村2组现住址:大连市甘井子区南关岭桥头大北沟工作单位:1被询问人身份证件种类及号码:居民身份证:******************是否人大代表联系方式:***********(口头传唤的被询问人月.曰时分到达,月日时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被借唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我想家里人知道。问:什幺时间,在什幺地点打仗的?答:是昨天(2015年12月7日)晚上12时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、乐颐、双牙子(小名)。刘景全、乐颐是亲哥俩,都是黑龙江人,刘景全今年29岁,乐颐今年31岁,刘景全的电话是***********;双牙子姓朱,具体叫什幺名字我不知道。问:你们为什幺打仗?答:刘景全和我们说他在洗澡的地方小便,服务员不让,他打了服务员一巴掌。后来,我们在二楼的换衣室又将这个服务员打了。问:被打得服务负长什幺样?答:他大约25岁,身高约1.70米,中等身材,圆脸,他当时穿着洗浴中心的工作服,上身是蓝色的。其他的没注意。问:你当时经过讲一下?答:昨天(215年12月7日)晚上8时左右,我和刘景全、乐颐、双牙子到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅休息。当时,我、刘景全、双牙子都喝了不少酒了。到晚上12时左右,刘景全去上厕所回到休息大厅,对我们说\'有个服务员装逼,不让他在洗澡的地方尿尿,他打了这个服务员一巴掌。因为我知道刘景全喝完酒好惹事,而且我明天还有活,我就对他们说\'你们把手牌告诉我,我去结账他们告诉我手牌号,我就到换衣室去换衣服答:他受伤了,是头部受伤的,具体伤的怎幺样我不清楚。警察来时,他打车去医院了,我看到他脸上有血。问:这个服务员的伤是怎幺造成的?答:主要是刘景全打的,拳打脚踢还用铁撮子,我也打了他几下,双牙子也打了,怎幺打的我没注意,乐颐是否动手打这个服务员我不清楚。问:铁撮子是什幺样的?答:就是普通长杆的撮子,是白色的,掉在地上咣当一声,我认为应亥是寺失的。这个撮子是立元洗浴的,现在也应尽在立元洗浴。问:你是否受伤?答:我左侧脸部受伤了,具体是谁打的我不清楚。刘景全踹我的几脚、打我几下,我没有受伤。问:参与打仗的服务负长什幺样?答:我就记着他是斜眼,其他的没注意。他当时也拉仗了。问:当时拉仗的都有谁?答:就是立元洗浴的服务员,具体有谁我不清楚。问:你们四个人当时的衣着?答:我当时上身穿黑色的皮夹克,下身是黑色裤子;刘景全当时上身光着膀子,下身是红色的浴服;乐颐当时上身穿黑色的背心,下身是蓝色的牛仔裨;双牙子当时上身穿白色的衣服,下身是黄色的裤子。问:你是否被公安机关处理过?答:没有。问你的家庭成员?答母亲:潘燕南,64岁,在大连a问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 30, 53, 93, 127, 148, 167, 173, 217, 233, 288, 375, 383, 398, 406, 424, 494, 509, 525, 571, 582, 674, 684, 741, 754, 808, 819, 1071, 1087, 1149, 1160, 1218, 1226, 1268, 1283, 1309, 1320, 1342, 1355, 1445, 1459, 1464, 1472, 1488, 1498, 1502, 1510, 1514, 1531, 1534]}, \"attach_doc_fact\": [{\"no\": 10, \"time\": \"昨天\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"张继彪\"], \"content\": [525, 571]}, {\"no\": 11, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"乐颐\", \"双牙子\", \"刘景全\", \"张继彪\"], \"content\": [582, 629]}, {\"no\": 12, \"time\": \"今年\", \"location\": \"\", \"people\": [\"刘景全\", \"乐颐\", \"双牙子\", \"张继彪\", \"朱\"], \"content\": [629, 674]}, {\"no\": 13, \"time\": \"昨天(215年12月7日)晚上8时左右\", \"location\": \"立元洗浴中心\", \"people\": [\"乐颐\", \"双牙子\", \"刘景全\", \"张继彪\"], \"content\": [819, 900]}, {\"no\": 14, \"time\": \"晚上12时左右\", \"location\": \"\", \"people\": [\"刘景全\", \"张继彪\"], \"content\": [900, 1071]}]}, {\"attach_doc_text\": {\"original_str\": \"第次询问第页共页询问笔录询问时间2015年12月10时34分至2015年12月8日10时58分询问地点甘井子分局兴华街派$所询问人(签名)记录人(签名)幺怒工作单位兴华街派出所工作单位兴华街派出所被询问人张云购,性别男出生口期1995.11.8文化程度初中户籍所在地河北省承德市丰㝉满族自治县石人沟乡高营村三组南沟门1号住址辽㝉省大连市甘井子区兴华路立元洗格被询问人身份证件种类及号码******************联系电话***********(口头传唤的被询问人月日时分到达,月日时分离开,本人黎名确认:)。FAEECDE问:我们是兴平街派出所的工作人员(出示证件),现依法对你进行调查,你要如实回答。对与本案无关的问题,你有拒绝回答的枚利。你听清楚了吗?答:听清楚了。问:你对办案人员是否耍求回避?答:我不要求。问:你因何事到派出所?答:我被人打了。答:2015年12月8口0时30分许,甘井子区兴路立元洗浴男更衣室内。闷:你被谁打了?答:四个陌生男子,是立元洗浴的客人。问:描述下四个男子的体貌特征?答:一个男子30岁左右,穿黑色皮夹克,身高173左右,中等身材,短发;一个男子30岁左右,中长发,发色发黄,脸上有疙瘩,身高170左右,身材较痩;一个男子30岁左右,胸前纹了个龙;最后一个男子身高176左右,中等身材。问:这四个男子为何打你?答:我是立元洗浴的服务员,中长发的男子在浴池尿尿,我制止了他,他就心生不满,就和他的三个朋友将我打了。问:你把事情的经过说一下?答:我是立元洗浴的服务员。2015年12月8()时3()分许,我收拾完塔池我看见一个中卷发的男矛在港池犀尿。我就对这个男子说:\\\"哥,旁边是厕所,你去那尿。\\\"中长发男子就说:\\\"我憋不住了,你给我滚。\\\"然后我就走了,走的时候我说了一句:\\\"我醉了\\\"。中长发男子就追我到更衣室,用手推我的脖了,说:\\\"你骂谁。\\\"我经理就出来了,将那个中长发的男子劝走了。过了会和那个中长发男子一起的穿皮夹克的男子就走过来跟我说:\\\"咱俩出去溜达溜达。\\\"我就跟穿皮夹克的男子说:\\\"哥,都是小事,不至于。\\\"中乒、发的男子突然就用头打、我的衣眼趣,然后和他一起的其<三名/>男子就都用拳头上来打我,打了我能有20拳左右。皮夹、克的男拿了一个我们洗浴的圆玻璃烟灰缸打了我的后脑部一下,.将我的后脑打出血。这时我们经理就将他的烟灰缸抢了下来,将我们分开:,我就坐到..更衣室门口的凳子上用手捂着头部。这吋开始那个中长发的男子搭区拿了一个白戳于朝我的、两部打:C二四了,将我的左脸划伤,我在挡他的戳子的吋候我的左手背部和左小臂也被戳子划伤。打完之后他们四人就跑了。问:你是否还手打那四人?答:他们四人打我时,我用拳头打了那个中长发男子的肩部一下。问:你当时穿件什幺衣服?答:我当时穿的立元洗浴的黑色衬衫工作服。问:当吋你有什幺伤?怎幺造成的?答:我的后脑部被打了个口子,是黑色皮夹克男子拿烟灰缸打的。我的左面部划伤到医院缝了17针左右、左小臂和左手背部有划伤,是中长发男子拿白钢戳子打的。问:打你的烟灰缸和戳子什幺样?答:烟灰缸会是圆形玻璃材质的,大概直径能有c。白钢戳子是长把的,把能有左右。现在这两个东西都在立元洗浴内。问:当吋还有谁在现埼?答:当吋有我们主管和二个服务员,还有儿个客人在场。问:你还有要补充的吗?答:没有。问:事发地是否有监控?答:有监控,过程是否照上我不清楚。答:属实。核对以上笔录,无异议签字捺印\", \"para_loc\": [0, 4, 8, 12, 62, 69, 78, 88, 98, 179, 210, 225, 244, 265, 332, 339, 354, 361, 372, 423, 441, 456, 565, 577, 628, 641, 1103, 1115, 1144, 1156, 1176, 1192, 1265, 1280, 1333, 1344, 1369, 1380, 1385, 1396, 1413, 1432]}, \"attach_doc_fact\": [{\"no\": 15, \"time\": \"2015年12月8口0时30分许\", \"location\": \"甘井子区兴路立元洗浴男更衣室内\", \"people\": [\"张云购\"], \"content\": [372, 423]}, {\"no\": 16, \"time\": \"2015年12月8()时3()分许\", \"location\": \"更衣室门口的凳子上\", \"people\": [\"张云购\", \"男子\", \"中长发男子\"], \"content\": [641, 1103]}]}], \"relationship\": [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]}', 9, '2020-09-05 23:31:21', 'admin', '2020-09-05 23:32:28', 'admin');
INSERT INTO `return_json_info` VALUES (46, '甘公刑诉字[2016]001号', '{\"case_id\": \"甘公刑诉字[2016]001号\", \"main_doc_list\": [{\"doc_txt\": {\"original_str\": \"大连市公安局甘并子公安分局起诉意见书甘公刑诉字[2016]001号犯罪嫌疑人黄佳男,男,1976年4月17日生,辽㝉省辽阳市人,居民身份证号码为:******************,汉族,中专文化,无职业,户籍所在地:大连市沙河口区华北路337号15,现住:大连市甘井子区金柳路291号楼242号。犯罪嫌疑人戴宝生,女,1978年5月18日生,山东省莱阳市人,居民身份证号码为:******************,汉族,大专文辽㝉省丹东市元宝区蛤蟆塘镇畜牧场金场居民组130184号,现住:大连市甘井子区金柳路291号楼242号。违法犯罪经历:犯罪嫌疑人黄佳男、戴宝生因涉嫌贩卖毒品罪于2015年10月15日被我局刑事拘留,同年11月20曰经大连市甘井子区人民检察院批准被执行逮捕,现羁押于大连市公安局看守所。犯罪嫌疑人黄佳男、戴宝生因涉嫌贩卖毒品罪一案,由大连市公安局禁毒支队在工作中发现后移交我局,经审查:我局于2015年9月19日立为贩卖毒品案侦查。2015年10月15曰,在大连市甘井子区金柳路291号242,上述二人被我局民警抓获。犯罪嫌疑人黄佳男、戴宝生涉嫌非法持有毒品一案,现已侦查终结。经依法侦查查明,犯罪嫌疑人黄佳男、戴宝生有下列犯罪事实:2015年2月至2015年10月间,犯罪嫌疑人戴宝生、黄佳男经事先预谋,通过邮寄方式多次从\\\"韦玉怀\\\"(姓名不清,住址不祥,现在逃)手中购买毒品向他人贩卖,从中谋取暴利,2015年10月15日在大连市甘井宇区金柳路291号楼242号被抓获,所持有的大量毒品被当场搜缴扣押,经检验:编号20151362C1检材中(4号、5号检材)检出甲基苯丙胺成分,其含量为92.6%,净重共99.6克;编号20151362C2检材中(6号、7号检材)检出甲基苯丙胺成分,其含量为89.0%,净重共98.6克;编号20151362C3检材中(11号、1?号、13号检材)检出甲基苯丙胺成分,其含量为82.7%,净重共145.2克;编号20151362C4检材中(14号检材)检出甲基苯丙胺成分,其含量为90.5%,净重共35.3克;编号20151365C1检材中(1号检材)检出甲基苯丙胺庳分,净重共21.8克;编号20151365C2检材中(2号检材)检出甲基苯丙胺成分,净重80.3克,其含量为90.编号20151365C3检材中(3号检材)检出甲基苯丙胺、咖啡因成分,净重共101.7克;编号20151365C4检材中(8号检材)检出甲基苯丙胺、咖啡因成分,净重383.7克;编号2151365C5检材中(9、10号检材)检出甲基苯丙胺、咖啡因成分,净重共12.8克;编号20151365C6检材中(15、16、17号检材)检出甲基苯丙胺成分,净重共112.0克,其含量为80.9%;编号20151365C7检材中(18号检材)检出甲基苯丙胺成分,净重28.7克;编号20151365C8检材中(19号检材)检出甲基苯丙胺、咖啡因成分,净重207.7克;编号20151365C9检材中(2036号检材)检出甲基苯丙胺成分,净重共147.7克,其含量为$1.0%;编号20151365C10检材中(37号材)检出甲基苯丙胺成分,净重4.7克;编号201513\\\"C检材中(3863号检材)检出甲基苯丙胺成分,净重共89.5克,其含量为74.8%。认定上述事实的证据如下:1、犯罪嫌疑人黄佳男、戴宝生供述笔录;2、搜缴的毒品实物及用于贩卖毒品的称量工具和包装袋;3、大连市公安司法鉴定中心(大)公(司)鉴(理化)字[2015]1362、1365号整定文书,上述犯罪事实清楚,证据确实、充分,足以认定。综上所述,犯罪嫌疑人黄佳男、戴宝生无视国家法律、法规,非法持有毒品,其行为已触犯《中华人民共和国刑法》第三百四十八条之规定,涉嫌非法持有毒品罪。依照《中华人民共和国刑事诉讼法》第一百六十条之规定,现将此案移送审查起诉。此致大连市甘井子区人民检察院大连市附:1、本案卷贰卷。2、犯罪嫌疑人黄佳男、戴宝生现羁押于大连市公安局看守所。\", \"para_loc\": [0, 18, 33, 150, 267, 357, 503, 531, 1395, 1407, 1499, 1521, 1630, 1632, 1644, 1647, 1657, 1685]}, \"doc_fact\": [{\"no\": 0, \"time\": \"2015年2月至2015年10月间\", \"location\": \"\", \"people\": [\"戴宝生\", \"黄佳男\", \"韦玉怀\"], \"content\": [531, 615]}, {\"no\": 1, \"time\": \"2015年10月15日\", \"location\": \"大连市甘井宇区金柳路291号楼242号\", \"people\": [], \"content\": [615, 1395]}]}], \"attach_doc_list\": [{\"attach_doc_text\": {\"original_str\": \"时间代词的问题:半个月后某日20时许,该犯又窜至该房内,用钥匙开门进入室内,盗走四幅油画、一个砚台等物品。同年9月28或29日夜,该犯再次窜至该房内,用钥匙开门进入室内欲实施盗窃,因室内物品被转移他处而盗窃未遂。\", \"para_loc\": [0, 106]}, \"attach_doc_fact\": []}, {\"attach_doc_text\": {\"original_str\": \"讯问笔录(第一次)时间:2015年10月15日13时45分至2015年10月15地点:大连市公安局甘井子公安分局红旗派出科犯罪嫌疑人姓名:黄佳男别名:无曾用名:无绰号:无性别:民族:汉族出生时间:1976年4月17日出生地:辽㝉省辽阳市身份证号码:******************籍贯:辽㝉省辽阳市文化程度:中专政治面貌:群众户籍所在地:辽㝉省大连市沙河口区华北路337号现住址:辽㝉省大连市甘井子区金柳路291号242联系电话:***********〔伽工作单位和职业无家庭成员:父亲:袁婵,66岁,退休;母亲:许旭文,60岁,退休简历:1984年9月至1990年7月,华北路小学,学生;1990年7月至1993年7月,大连市第五十一中学,学生。1993年9月至1996年,大连市建筑工程学校,1997年至2013年,在胜利广场物业上班,1013年至今,无业。是否受过刑事处罚或行政处罚:左这是《犯罪嫌疑人诉讼权利义务告知书》,送你阅读/向你宣读。根据《中华人民共和国刑事诉讼法》的规定,在公安机关对案件###E5AE744085FD4F8EB3401B84D5F9F163.$13.0$###(阅读约三分钟)FAEECDE问:你是否完全理解告知书的内容?答:完全理解。问:你是否申请我们回避?答:不申请。问:我们是大连市公安局甘井子分局红旗派出所民警,现依法对你进行讯问,你要如实回答,听明白了吗?答:听明白了。问:知不知道为什幺事被抓到派出所来?答:知道,因为我贩卖毒品和吸毒。从你家搜出的毒品是从哪里来的?答:是我女朋友购买的。问:你女朋友叫什幺名字?答:叫戴宝生。问:戴宝生在哪购买的毒品?答:戴宝生在她朋友手里购买的,具体在谁那购买的我也不清楚a问:戴宝生都购买什幺毒品,买了多少?答:冰毒和麻古,具体买多少我也不清楚。:戴宝生购买毒品做什幺用?答:刚开始的时候是自己吸食,后来就幵始贩卖,通过贩卖毒品来维持生活。问:为何贩卖毒品?答:大约在2015年5、6月份的时候,戴宝生从她朋友那弄的冰毒,我和戴宝生开始吸食冰毒,后来由于生活压力大,在7、8月份的时候我和戴宝生就商议通过贩卖毒品来赚钱,戴宝生认识卖毒品的,就购>买一些冰毒和麻古,然后我和戴宝生吸食一部分,卖给朋友一部分。问:如何贩卖毒品?答:有买家联系戴宝生购买冰毒或麻古,然后我就负责去送毒品和取钱,戴宝生在电话里会事先告诉对方将钱放在哪了,我去取钱不再告诉买家毒品放在哪里,让对方自己去取货,我们和买家不见面。问:毒品都卖给谁?答:我不清楚卖给谁,对方都是和戴宝生联系,偶尔和我联系,问:你是如何将毒品给买家的?1答:我开着我的黑色辽B270大众迈腾轿车去送毒品。问:最近一次贩卖毒是什幺时矣?答:2015年10月9日19时许,之前在我这买过冰毒的一个男的给我打电话想购买2克冰毒,我们约定在大连北岗桥汽车站交易。我让他把钱放在北岗桥411路公交车站的垃圾桶下面。大约在20时许,我取完钱。我就给那个男的打电话告诉他冰毒放在411路公交车大连西站的垃圾桶下面。在我去取钱之前我就把冰毒放在那了。之后我就拿钱是?家了。问:你是否还子己得读人的联系方式?答:记不住了。问:你共贩卖毒品多少次?各A意乞育b夫幺4一。问:你是否能提供买家和卖家的相关信息?答:我记不住了。问:还有什幺补充的吗?答:没有了。命问:以上说的是否属实?答:属实\", \"para_loc\": [0, 9, 60, 85, 108, 142, 158, 165, 188, 212, 230, 238, 303, 338, 372, 383, 398, 427, 500, 508, 515, 531, 538, 550, 556, 603, 610, 628, 659, 670, 682, 689, 702, 731, 749, 815, 824, 948, 957, 1045, 1054, 1082, 1096, 1122, 1137, 1298, 1315, 1322, 1345, 1364, 1372, 1383, 1389, 1401, 1405]}, \"attach_doc_fact\": [{\"no\": 0, \"time\": \"2015年5、6月份的时候\", \"location\": \"\", \"people\": [\"戴宝生\", \"黄佳男\"], \"content\": [824, 948]}, {\"no\": 1, \"time\": \"2015年10月9日19时许\", \"location\": \"大连北岗桥汽车站\", \"people\": [\"黄佳男\"], \"content\": [1137, 1222]}, {\"no\": 2, \"time\": \"20时许\", \"location\": \"411路公交车大连西站的垃圾桶下面\", \"people\": [\"黄佳男\"], \"content\": [1222, 1298]}]}, {\"attach_doc_text\": {\"original_str\": \"讯问笔录(第一次)时间:2014年10月11日旦时丛分至2014年10月15E]16时17分地点:大连市公安局甘井子公安分局红旗派出所犯罪嫌疑人姓名戴宝生另1名无曾用名绰号无性别女民族汉族出生时间1978年5月18曰出生地辽㝉省丹东市身份证号码******************籍贯辽㝉省丹东市文化程度大专政治面貌群众户籍所在地:辽㝉省丹东市元宝区金山镇畜牧场金场居民组130184现住址:辽㝉省大连市甘井子区西山闲庭联系电话:13238080520,对1工作单位和职业无!家庭成员:儿子:瞿红,17岁,学生。母亲:毕远香,64岁,农民。简历:2005年5月之前,在辽㝉省丹东市元宝区学习生活。2005年5月至今在大连打工。是否受过刑事处罚或行政处罚:这是《犯罪嫌疑人诉讼权利义务告知书》,送你阅读/向你宣读。根据《中华人民共和国刑事诉讼法》的规定,在公安机关对案件进行侦查期间,犯罪嫌疑人有如下诉讼权利和义务:1、有权用本民族语讠文字进行诉讼。2、对于公安机关及其侦查人员侵犯其诉讼权利和人身侮辱的行为,有权提出控告。###B9B33764C93B4253B97D07512BDAA272.$25.0$###答:不申请。FAEECDE问:你是否知道公安机关为什幺事将你带回派出所的?答:知道,因为我贩卖毒品。谱问:贩卖何种毒品?答:冰毒。问:从何时开始贩卖?答:2015年2月,具体时间记不清了。问:在何地通过何种方式贩卖?答:我通过一个叫何美菊,小名叫蔺兰的小兄弟往出卖,他是怎幺卖我不清楚。问:总共卖了多少冰毒?答:10克。问:1克卖多少钱?答:往外卖,1克200元人民币。问:我们把你和谁一起带到派出所?答:黄佳男,他是我对象,我俩一起同居六年了。问:黄佳男在你贩卖毒品的过程中做什幺?答:黄佳男帮我分装冰毒,有时帮我往外给别人送点冰毒。麯问:我们从你家搜到的冰毒是谁的?问:你贩卖的冰毒从哪来的?答:一个叫韦玉怀的广州朋友放在我家的。问:韦玉怀为何把冰毒存放在你家?答:2015年7月某天,我女朋友李楠楠的对象黄甜甜以买冰毒为由把广州一个毒贩子韦玉怀(不知道姓名)骗到大连,想让韦玉怀帮他贩毒,韦玉怀来时还带了个叫宋怡(不知姓名)小弟,韦玉怀和宋怡到大连后先是住在黄甜甜家,我就是到黄甜甜家找李楠楠玩认识了韦玉怀和宋怡,韦玉怀在黄甜甜家住了一周左右,就知道黄甜甜骗他到大连来的目的,韦玉怀和宋怡就托我在外面租个房子,不想再和黄甜甜打交道了,我就帮他们的沙河口区星海广场的海英公寓(谐音)租了个房间,门号是18楼1816房间,他们在这个公寓住时,我经常去照顾他俩的生活,给他俩送饭,当年阴历八月十四日韦玉怀和宋怡回广州了,回到广州后韦玉怀给我打了个电话,我才知道他们离开大连了,韦玉怀说他们回老家过节,过完节还会回大连继续卖冰毒。过了八月十五大和无一个月左右,宋怡给我打电话,说韦玉怀出事了,让我到他们房间把他们放在房间里的冰毒和嘛嗦拿走,帮他们保管好。我和黄佳男到他们租住的房间,按宋怡说的放冰毒的地方,从冰箱、洗衣机、卫生间的天棚里找出冰毒和嘛咕,我把这些东西放在一个红色布包里,黄佳男开着他的福特轿车(辽B2997),把东西拉到我们家,黄佳男把这些东西分别放在床的抽屉和床床头柜里。具体分装和存放都是黄佳男负责的。问:黄甜甜和于莲花的个人情况?答:因为韦玉怀的事,我和他俩都不联系了,他俩在山东路腾辉小区租的房子住。听我朋友说今年5月黄甜甜和于莲花被警察抓走了。问:韦玉怀存放在你家的冰毒和嘛咕一共有多少?答:宋怡没告诉过我有多少,具体多少我不清楚,我问黄佳男,黄佳男称纤过重量,他说冰毒大概有7多个,嘛咕大概有一二千粒。问:你为何把韦玉怀存放你处的冰毒卖了?答:2015年2月某天,宋怡给我打电话,让我4巴冰毒和嘛咕卖了换钱,宋怡跟我要10万元钱,就顶这些毒品的钱,我说我没有这幺多钱,先给他5万,等毒品卖出去之后,再打一些钱给他行不行,宋怡说行,黄佳男就到工商银行给宋怡汇了5万元,具体在哪家银行汇的钱我不清楚。今年9月某天,宋怡给我打电话,跟我借1万元钱,说是做生意用,我让黄佳男到名艮行汇给宋怡1万元钱。问:宋怡收钱的专艮行贝长号?答:我没记住。狐问:你是怎幺认识何美菊?答:2015年1月某天,我朋友于莲花带何美菊到我家玩,就这幺认识了,我听于莲花说过何美菊平常往外卖点冰毒,我就把韦玉怀存放在我家冰毒的事告诉了于莲花,于莲花说她可以让何美菊帮我往外卖。2015年1月某天,何美菊到我家找我,我就按200元1克卖给他30个,他给了我6000元钱。问:你一共卖给何美菊多少冰毒?答:分二十几次,总共卖给他200多克冰毒。具体每次多少克记不清了,最少5克,最多30克左右。问:除了何美菊你还把冰毒卖给谁了?答:甘井子区山东路一个叫豆豆的女掠子,她和午斌联系,从2014年9月到现在,总共卖给她10多次,一次1克左右,她买冰毒由黄佳男问:还把冰毒卖给过谁?答:去个8月韦玉怀在大连时,我帮他联系过一个姓孙的男子,韦玉怀卖给他100多克。我们叫他张麻子,他也是个贩卖冰毒的,我现在联系不上他了,他手机号早换了。他真名叫啥我不清楚。问:你怎幺认识的这个张麻子?答:2013年6月,我在解放广场一个叫湾仔的卖鸭脖的小食杂店里打麻将时认识的。那个食杂店有一桌麻将,女老板赵玲侠是我朋友,张麻子就住在食杂店旁边的楼里,打麻将时他就拿出冰毒吸,我就猜他是贩毒的,我就把他介绍给了韦玉怀。解放广场鸭脖店那片都拆迁了,赵玲侠.去哪了我也不知道。问:嘛咕都卖给过谁?答:我有时送给朋友一两粒,没卖过。问:你卖的冰毒特征?答:白色的晶状小块。问:你知我们1如4可知尔的吗?答:我猜是张清辉把我告了。问:张清辉?、答:张清辉也是个贩卖毒品的,是何美菊的朋友,我不认识这个人,他听何美菊说我手里有冰毒,打电话找我合作,我拒绝了,因为他是个大毒贩子,我怕被他骗了。我听何美菊说张清辉被警察抓了,我猜因为我不和张清辉合作,张清辉出卖了我。问:你自已吸食冰毒吗?答:我吸冰毒,每天饭后吸两三口。问:还有补充吗?问:以上讲的是否属实?答:属实\", \"para_loc\": [0, 9, 46, 67, 87, 108, 140, 160, 192, 210, 229, 238, 303, 313, 327, 356, 407, 424, 512, 519, 543, 557, 566, 571, 581, 600, 614, 649, 660, 666, 675, 691, 707, 729, 748, 774, 791, 804, 823, 839, 1365, 1380, 1439, 1461, 1519, 1538, 1714, 1728, 1735, 1748, 1886, 1901, 1947, 1964, 2027, 2038, 2124, 2138, 2274, 2284, 2301, 2311, 2321, 2336, 2349, 2355, 2476, 2492, 2500, 2511, 2515]}, \"attach_doc_fact\": [{\"no\": 3, \"time\": \"2015年2月\", \"location\": \"\", \"people\": [\"戴宝生\"], \"content\": [581, 600]}, {\"no\": 4, \"time\": \"2015年7月某天\", \"location\": \"广州一个毒贩子\", \"people\": [\"戴宝生\", \"李楠楠\", \"黄甜甜\", \"宋怡\", \"韦玉怀\"], \"content\": [839, 1096]}, {\"no\": 5, \"time\": \"当年阴历八月十四日\", \"location\": \"广州\", \"people\": [\"戴宝生\", \"宋怡\", \"韦玉怀\"], \"content\": [1096, 1170]}, {\"no\": 6, \"time\": \"过了八月十五大和无一个月左右\", \"location\": \"他们租住的房间\", \"people\": [\"戴宝生\", \"黄佳男\", \"宋怡\", \"韦玉怀\"], \"content\": [1170, 1365]}, {\"no\": 7, \"time\": \"今年\", \"location\": \"山东路腾辉小区租的房子\", \"people\": [\"戴宝生\", \"黄甜甜\", \"于莲花\", \"韦玉怀\"], \"content\": [1380, 1439]}, {\"no\": 8, \"time\": \"2015年2月某天\", \"location\": \"\", \"people\": [\"戴宝生\", \"黄佳男\", \"宋怡\"], \"content\": [1538, 1666]}, {\"no\": 9, \"time\": \"今年9月某天\", \"location\": \"\", \"people\": [\"戴宝生\", \"黄佳男\", \"宋怡\"], \"content\": [1666, 1714]}, {\"no\": 10, \"time\": \"2015年1月某天\", \"location\": \"\", \"people\": [\"戴宝生\", \"何美菊\", \"于莲花\", \"韦玉怀\"], \"content\": [1748, 1840]}, {\"no\": 11, \"time\": \"2015年1月某天\", \"location\": \"\", \"people\": [\"戴宝生\", \"何美菊\"], \"content\": [1840, 1886]}, {\"no\": 12, \"time\": \"2014年9月\", \"location\": \"甘井子区山东路\", \"people\": [\"戴宝生\", \"午斌\", \"黄佳男\"], \"content\": [1964, 2027]}, {\"no\": 13, \"time\": \"去个8月\", \"location\": \"大连时\", \"people\": [\"戴宝生\", \"张麻子\", \"韦玉怀\"], \"content\": [2038, 2124]}, {\"no\": 14, \"time\": \"2013年6月\", \"location\": \"解放广场一个叫湾仔的卖鸭脖的小食杂店\", \"people\": [\"韦玉怀\", \"张麻子\", \"赵玲侠\", \"戴宝生\"], \"content\": [2138, 2274]}]}, {\"attach_doc_text\": {\"original_str\": \"讯问笔录(第二次)时间:2015年10月15020时10分至2015年10月曰20时21分地点:大连市看守所犯罪嫌疑人姓名:黄佳男FAEECDE问:我们是大连市公安局甘井子分局红旗派出所民警,现依法对你刑事拘留,[公安民警向犯罪嫌疑人黄佳男出示大公(甘)拘字(2015)794号拘留证],你听清楚了吗?答:我听清楚了。问:知不知道因为什幺事拘留你?答:因为吸毒和涉嫌贩毒。问:什幺时候,在什幺地方,向谁贩卖毒品?答:我是从今年6、7月份开始,在甘井子区山东路、西岗区北港桥汽车站这两个地方贩卖过毒品,向不认识的人贩卖毒品,买毒品的人都是通过朋友知道我和我女朋友的号码。跟我女朋友联系的,我负责去送货。问:你贩卖的都是什幺毒品?答:都是冰毒和麻古、问:你以什幺价格向他人贩卖毒品?答:我以每克200元的价格向他人贩卖毒品。问:贩卖了多少次?答:我记不清楚了、我能记住的就是西尚区北港桥的那一次。问:对方是谁?答:我不认识。问:毒品的来源?答:毒品是我女朋友联系购买的,我不知道对方真名叫什幺,只知道他叫\\\"宋怡\\\",今年5、6月份戴宝生和\\\"宋怡\\\"通过手机联系谈好以100多元的价格从\\\"宋怡\\\"手中通过邮寄的方式购买1000克冰毒,还买了一些麻古,具体的我不太清楚,货到之后,我开车拉着戴宝生在大连市华南广场附近一个物流也不知道是快递提的货,具体的我记不清楚了。货到的第二天我在春柳的工商银行给对方汇了大约8、9万元。去年大约在11月份,我们也是通过同样的方式购买了500克冰毒,也是在华南广场提的货。问:你们双方的开户行和账号是多少?答:我记不住了,问:今天从你的住处搜出的现金是怎幺回事?答:钱不归我管,归我女朋友管,我不知遒钱是怎幺回事。问:对你拘留所认定的犯罪事实对不对?答:对。问:拘留你对不对?答:对。问:对你拘留后的羁押地点是大连市看守所,拘留期限是3日,你听清楚了吗?答:我听清楚了。:问:根据《中华人民共和国刑事诉讼法》第三十三条的规定,你可以聘请律师为你提供法律帮助,代理控告和申诉,你听明白了吗?答:我听明白了。问:你还有什幺要说的?答:没有了。问:你以上所讲属实吗?答:属实。\", \"para_loc\": [0, 9, 45, 54, 65, 72, 151, 159, 174, 186, 206, 300, 313, 323, 339, 360, 369, 396, 403, 410, 418, 646, 663, 671, 691, 717, 735, 739, 748, 752, 787, 796, 854, 862, 873, 879, 890, 895]}, \"attach_doc_fact\": [{\"no\": 15, \"time\": \"今年6、7月份开始\", \"location\": \"甘井子区山东路\", \"people\": [\"黄佳男\"], \"content\": [206, 300]}, {\"no\": 16, \"time\": \"今年5、6月份\", \"location\": \"大连市华南广场附近一个物流\", \"people\": [\"戴宝生\", \"黄佳男\", \"宋怡\"], \"content\": [418, 576]}, {\"no\": 17, \"time\": \"二天\", \"location\": \"春柳的工商银行\", \"people\": [\"黄佳男\"], \"content\": [576, 604]}, {\"no\": 18, \"time\": \"11月份\", \"location\": \"\", \"people\": [\"黄佳男\"], \"content\": [604, 646]}]}, {\"attach_doc_text\": {\"original_str\": \"讯问笔录(第二次)时间:215年10月11曰21时1分至2015年10月15022时分地点:大连市公安局甘井子公安分局红旗派出所犯罪嫌疑人姓名:戴宝生别名:无曾用名:无绰号:无性别:女;民族:汉族出生时间:1978年05月18曰出生地:辽㝉省丹东市身份证号码:******************籍贯:辽㝉省丹东市文化程度:中专政治面貌:群众户籍所在地:辽㝉省大连市丹东市元宝区蛤蟆塘镇金场村现住址:辽㝉省大连市甘井子区金柳路西郊闲庭291号2402联系电话:***********工作单位和职北连市城建局士把冰FAEECDE问:继续核实有关案情,请你如实回答,听清楚了吗?答:听清楚了。问:你是因为什幺事被带到派出所的?答:因为贩卖毒品被带到派出所的。问:从你家搜出的冰毒共有多少克?答:800多克。问:这些冰毒从哪来的?答:大概是今年五月,有个广州叫宋怡的毒贩通过物流从广州发给我的,我不知道宋怡的真名叫什幺。问:从你家搜出的嘛咕有多少?答:大概80粒左右。问:这些冰毒从哪来的??答:2014年8月广州的的毒贩韦玉怀和宋怡回广州后,宋怡打电话给我,告诉我韦玉怀出事了,让我从星海广场海英公寓他们租住的房子里把他们留在房间里的麻古拿走,替他们保管。问:第一次做讯问笔录时,你为何说冰毒是宋怡让你保管的?答:因为我当时那样说是感觉我能减轻罪责。问:宋怡是如何给你快递毒品的?答:一共给我快递过两次毒品,第一次是在2014年11月某天,宋怡给我打电话问我麻古是不是在我手里保管着,我说是。他问我最近干什幺,我说什幺也没干,然后他问我想不想卖点冰毒,他可以从广州快递给我,以每克120元的价格批发给我,我就同意了。因为第一次我手里没有什幺钱,我让黄佳男给宋怡打了3万块钱,打完钱后宋怡通过物流公司给我发了500克冰毒。货到后我和黄佳男开车到华南广场物流公司把货件取回来。第二次是在2015年5月某一天,宋怡打电话问我手里冰毒还有多少了,我说还剩不多了,宋怡说再给我发1000克,按每克1(10)元的价格批给我,我同意了,我让我对象黄佳男给他打了10万元钱。全是黄佳男打的,在哪里打的,打给什幺帐号我不清楚。过了几天我和黄佳男又到同一家物流公司把冰毒取回来,到象黄佳男称过后告诉我只有800克左右,我打电话宋怡给我发了多少,他说1(10)0克,我说不对吧,差200克呢,他说以后补钱给我。问:根据《中华人民共和国刑事诉讼法》第八十条之规定,本局现依法对你刑事拘留(公安民警向犯罪嫌疑人出示大公(甘)拘字【2015】79号拘留证)你听清楚了吗?答:我听清楚了。问:你是否知道因为什幺事拘留你?答:因为我给对方提供电话号码、问:对你拘留所认定的犯罪事实对不对?答:对。问:拘留你对不对?答:对。问:对你刑事拘留期限是三曰,羁押处所在大连市看守所,你听明白了吗?答:我听明白了D问:根据《中华人民共和国刑事诉讼法》第三十三条之规定,你可以聘请律师为你提供法律帮助,代理控告,申诉,你听明白了吗?答:我听明白了、问:你还有什幺要讲的?答:没有了\", \"para_loc\": [0, 9, 43, 64, 225, 241, 256, 263, 287, 294, 311, 327, 343, 362, 407, 421, 431, 443, 526, 553, 573, 588, 645, 992, 1069, 1077, 1093, 1108, 1126, 1130, 1139, 1143, 1176, 1184, 1242, 1250, 1261, 1266]}, \"attach_doc_fact\": [{\"no\": 19, \"time\": \"今年五月\", \"location\": \"广州\", \"people\": [\"戴宝生\", \"宋怡\"], \"content\": [362, 407]}, {\"no\": 20, \"time\": \"2014年8月\", \"location\": \"广州\", \"people\": [\"戴宝生\", \"宋怡\", \"韦玉怀\"], \"content\": [443, 526]}, {\"no\": 21, \"time\": \"2014年11月某天\", \"location\": \"\", \"people\": [\"戴宝生\", \"宋怡\"], \"content\": [588, 645]}]}], \"relationship\": [[0, 0, 0, 3, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]}', 10, '2020-09-06 20:04:50', 'admin', '2020-09-06 20:04:50', 'admin');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '是否开启注册用户功能');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数组和特殊字符（密码必须包含字母，数字，特殊字符-_）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '有效', '1', 'record_status', '', 'default', 'Y', '0', 'admin', '2020-08-21 22:06:43', 'admin', '2020-08-23 19:20:14', '');
INSERT INTO `sys_dict_data` VALUES (101, 0, '无效', '0', 'record_status', '', 'default', 'N', '0', 'admin', '2020-08-21 22:06:55', 'admin', '2020-08-23 19:20:07', '');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '记录状态', 'record_status', '0', 'admin', '2020-08-21 22:05:22', 'admin', '2020-08-21 22:05:55', '记录状态');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 129 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 21:43:21');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 21:45:54');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:10:04');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:21:36');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:25:11');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:30:30');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:41:45');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-08-27 22:57:33');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 22:57:36');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-27 23:02:29');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-27 23:02:36');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 10:56:56');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-30 11:00:51');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 11:00:54');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-08-30 11:16:51');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 11:16:54');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 11:27:43');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 18:19:35');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-30 19:08:46');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 19:08:53');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-30 19:11:35');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 19:15:19');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 19:32:03');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 19:36:32');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-08-30 19:49:55');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-08-30 19:49:59');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '192.168.1.1', '内网IP', 'Chrome Mobile', 'Android 1.x', '0', '登录成功', '2020-09-02 11:20:58');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '117.181.147.190', 'XX XX', 'Firefox 8', 'Windows 10', '0', '登录成功', '2020-09-07 16:23:09');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '117.181.147.190', 'XX XX', 'Firefox 8', 'Windows 10', '0', '退出成功', '2020-09-07 16:23:21');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(11) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3020 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', '', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', '', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', '', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', '', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', '', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', '', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', '', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', '', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', '', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', '', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', '', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', '', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', '', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', '', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', '', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', '', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', '', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', '', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', '', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', '', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', '', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', '', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', '', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', '', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', '', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', '', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '#', '', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '#', '', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '#', '', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '#', '', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '#', '', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '#', '', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '#', '', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '#', '', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '#', '', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '#', '', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '#', '', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '#', '', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '#', '', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '#', '', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '#', '', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '#', '', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '#', '', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '#', '', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '#', '', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '#', '', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '详细信息', 500, 3, '#', '', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '账户解锁', 501, 4, '#', '', 'F', '0', 'monitor:logininfor:unlock', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '在线查询', 109, 1, '#', '', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '批量强退', 109, 2, '#', '', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '单条强退', 109, 3, '#', '', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务查询', 110, 1, '#', '', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务新增', 110, 2, '#', '', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务修改', 110, 3, '#', '', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务删除', 110, 4, '#', '', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '状态修改', 110, 5, '#', '', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '任务详细', 110, 6, '#', '', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '任务导出', 110, 7, '#', '', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成查询', 114, 1, '#', '', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1058, '生成修改', 114, 2, '#', '', 'F', '0', 'tool:gen:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1059, '生成删除', 114, 3, '#', '', 'F', '0', 'tool:gen:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1060, '预览代码', 114, 4, '#', '', 'F', '0', 'tool:gen:preview', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1061, '生成代码', 114, 5, '#', '', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (2000, '案件管理', 0, 0, '#', 'menuItem', 'M', '0', '', 'fa fa-tv', 'admin', '2020-08-20 14:51:27', 'admin', '2020-08-20 14:51:57', '');
INSERT INTO `sys_menu` VALUES (2001, '笔录信息管理', 2000, 3, '/edoc/lowrecordinfo', 'menuItem', 'C', '0', 'edoc:lowrecordinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-08-22 00:09:09', '笔录信息菜单');
INSERT INTO `sys_menu` VALUES (2002, '笔录信息查询', 2001, 1, '#', '', 'F', '0', 'edoc:biluinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2003, '笔录信息新增', 2001, 2, '#', '', 'F', '0', 'edoc:biluinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2004, '笔录信息修改', 2001, 3, '#', '', 'F', '0', 'edoc:biluinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2005, '笔录信息删除', 2001, 4, '#', '', 'F', '0', 'edoc:biluinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2006, '笔录信息导出', 2001, 5, '#', '', 'F', '0', 'edoc:biluinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2007, '案件信息管理', 2000, 1, '/edoc/lawcaseinfo', 'menuItem', 'C', '0', 'edoc:lawcaseinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-08-21 23:56:29', '案件信息管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '案件信息管理查询', 2007, 1, '#', '', 'F', '0', 'edoc:caseinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2009, '案件信息管理新增', 2007, 2, '#', '', 'F', '0', 'edoc:caseinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2010, '案件信息管理修改', 2007, 3, '#', '', 'F', '0', 'edoc:caseinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2011, '案件信息管理删除', 2007, 4, '#', '', 'F', '0', 'edoc:caseinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2012, '案件信息管理导出', 2007, 5, '#', '', 'F', '0', 'edoc:caseinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2013, '起诉文书信息', 2000, 2, '/edoc/indictmentinfo', 'menuItem', 'C', '0', 'edoc:indictmentinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-08-20 23:46:02', '起诉文书信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '起诉文书信息查询', 2013, 1, '#', '', 'F', '0', 'edoc:indictmentinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2015, '起诉文书信息新增', 2013, 2, '#', '', 'F', '0', 'edoc:indictmentinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2016, '起诉文书信息修改', 2013, 3, '#', '', 'F', '0', 'edoc:indictmentinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '起诉文书信息删除', 2013, 4, '#', '', 'F', '0', 'edoc:indictmentinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '起诉文书信息导出', 2013, 5, '#', '', 'F', '0', 'edoc:indictmentinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '上传新案件', 2000, 0, '/edoc/upload', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-09-04 18:18:35', '');
INSERT INTO `sys_menu` VALUES (3000, '演示中心', 0, 4, '#', 'menuItem', 'M', '0', NULL, 'fa fa-cubes', 'admin', '2020-08-27 22:31:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3001, '表单', 3000, 1, '#', 'menuItem', 'M', '0', NULL, 'fa fa-calendar', 'admin', '2020-08-27 22:34:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3002, '按钮', 3001, 1, '/demo/form/button', 'menuItem', 'C', '0', NULL, '#', 'admin', '2020-08-27 22:35:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (3003, '栅格', 3001, 2, '/demo/form/grid', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3004, '下拉框', 3001, 3, '/demo/form/select', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3005, '时间轴', 3001, 4, '/demo/form/timeline', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3006, '基本表单', 3001, 5, '/demo/form/basic', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3007, '卡片列表', 3001, 6, '/demo/form/cards', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3008, '功能扩展', 3001, 7, '/demo/form/jasny', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3009, '拖动排序', 3001, 8, '/demo/form/sortable', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3010, '选项卡&面板', 3001, 9, '/demo/form/tabs_panels', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3011, '表单校验', 3001, 10, '/demo/form/validate', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3012, '表单导向', 3001, 11, '/demo/form/wizard', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3013, '文件上传', 3001, 12, '/demo/form/upload', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3014, '日期和时间', 3001, 13, '/demo/form/datetime', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3015, '富文本编辑器', 3001, 14, '/demo/form/summernote', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3016, '左右互选组件', 3001, 15, '/demo/form/duallistbox', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3017, '搜索自动补全', 3001, 16, '/demo/form/autocomplete', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3018, '多级联动下拉', 3001, 17, '/demo/form/cxselect', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');
INSERT INTO `sys_menu` VALUES (3019, 'Ajax局部刷新', 3001, 18, '/demo/form/localrefresh', 'menuItem', 'C', '0', '', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-08-25 12:12:02', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(11) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"菜单已分配,不允许删除\",\r\n  \"code\" : 301\r\n}', 0, NULL, '2020-08-27 21:50:56');
INSERT INTO `sys_oper_log` VALUES (101, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"普通角色\"],\"roleKey\":[\"common\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,1042,501,1043,1044,1045,1046,2,109,1047,1048,1049,110,1050,1051,1052,1053,1054,1055,1056,111,112,3,113,114,1057,1058,1059,1060,1061,115\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 21:52:06');
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '研发部门', '/system/menu/remove/4', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 21:52:16');
INSERT INTO `sys_oper_log` VALUES (103, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"0\"],\"menuType\":[\"M\"],\"menuName\":[\"演示中心\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"4\"],\"icon\":[\"fa fa-cubes\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 22:31:50');
INSERT INTO `sys_oper_log` VALUES (104, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2000\"],\"menuType\":[\"M\"],\"menuName\":[\"表单\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"fa fa-calendar\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 22:34:04');
INSERT INTO `sys_oper_log` VALUES (105, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2001\"],\"menuType\":[\"C\"],\"menuName\":[\"按钮\"],\"url\":[\"/demo/form/button\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 22:35:35');
INSERT INTO `sys_oper_log` VALUES (106, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"管理员\"],\"dept.deptName\":[\"研发部门\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"1\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"1\"]}', 'null', 1, '不允许操作超级管理员用户', '2020-08-27 22:43:03');
INSERT INTO `sys_oper_log` VALUES (107, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"管理员1\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 23:02:48');
INSERT INTO `sys_oper_log` VALUES (108, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-27 23:02:52');
INSERT INTO `sys_oper_log` VALUES (109, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-30 19:11:30');
INSERT INTO `sys_oper_log` VALUES (110, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.update()', 'POST', 1, 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', '内网IP', '{\"id\":[\"\"],\"userName\":[\"管理员\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"sex\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-08-30 19:15:59');
INSERT INTO `sys_oper_log` VALUES (111, '起诉文书信息', 2, 'com.ruoyi.edoc.controller.IndictmentBillInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/edoc/indictmentinfo/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"lowCaseNum\":[\"测试用例\"],\"billNum\":[\"大公(沙)诉字[2016]24号\"],\"billPersonId\":[\"************************\"],\"billPlaintiff\":[\"无\"],\"billDemandant\":[\"杨德健,骆嘉俊\"],\"billThirdParty\":[\"无\"],\"billProsecutor\":[\"无\"],\"billClaim\":[\"杨德健、骆嘉俊涉嫌结伙盗窃一案\"],\"billFactAndReason\":[\"大连市公安局沙河口分局\\r\\n起诉意见书\\r\\n大公(沙)诉字[2016]24号\\r\\n犯罪嫌疑人杨德健，男，1989年11月27日出生，广西壮族自治区柳江县人，小学文化，无业，身份证号：\\r\\n******************,户籍地：广西壮族自治区柳江县里雍镇龙村中堂屯28号。\\r\\n违法犯罪经历：2010年，因在福建省福清市扒窃，被判处有期徒刑1年；2013年，因在湖南省长沙市扒窃被判处有期徒刑7个月。2015年10月22日，因涉嫌扒窃被我局刑事拘留，同年11月25口经沙河口区人民检察院批准被依法逮捕，现羁押于大连市看守所。\\r\\n犯罪嫌疑人骆嘉俊，男，1976年8月9日出生，无业，广西壮族自治区柳江县人，小学文化，身份证号：******************,户籍地：广西壮族自治区柳江县里雍镇龙江村新村屯1号。\\r\\n违法犯罪经历：2015年10月22日，因涉嫌扒窃被我局刑事拘留，，同年11月25日经沙河口区人民检察院批准被依法逮捕，现羁拘于大逢市看守所。\\r\\n犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，由我局民警于逆15年10月21日在工作中发现，并于同月22日立为盗窃案进行侦\\r\\n2015年10月21日17时40分许，犯罪嫌疑人杨德健伙同犯罪嫌疑人骆嘉俊在辽宁省大连市沙河口区数码路北段7号东软信息学院二期公寓门前马路上盗窃被害人戈雅星金色苹果6手机一部后，被我局民警当场抓获。犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，现已侦查终结。\\r\\n经依法侦查查明，犯罪嫌疑人杨德健、骆嘉俊有下列犯罪事实.\\r\\n犯罪嫌疑人杨德健与骆嘉俊经预谋，于2015年10月15日到大连欲行扒窃，并商定由杨德健负责实施扒窃，骆嘉俊负责望风掩护，获傳赃款后分成\\r\\n20l5年10月21日17时40分许，在大连市沙河口区数码路北段肯德基对面，杨德健伙同骆嘉俊扒窃戈雅星的金色苹果6手机一部，串码:***************,价值3000元；\\r\\n2015年10月20日12时20分许，在大连市沙河口区凌水桥车站，杨德健伙同骆嘉俊扒窃江寿林的金色苹果6PLUS手机一部，串码：***************,价值5040元；\\r\\n2015年10月21日12时许，在大连市沙河口区软件园东路23号櫻滅下，杨德健伙同骆嘉俊扒窃王仙华的金色苹果6手机一部，串码：***************,价值3500元；\\r\\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃荆树林的手机二部，一部是银白色苹果6手机，串码：***************,价值3000元，另一部是玫瑰金色苹果6S手机，串码：***************,价值5130元；\\r\\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃薛永新的手机白色小米手机一部，串码:***************,价值，500元;\\r\\n2015年10月20日12时许，在大连市沙河口区软件园东路23号楼楼下，杨德健伙同骆嘉俊扒窃陈有凤的白色乐视手机一部，串码：***************,价值1260元；\\r\\n犯罪嫌疑人杨德健伙同骆嘉俊共计扒窃七部手机价值人民币21430元\\r\\n认定上述事实的证据如下：\\r\\n1、被害人戈雅星陈述笔录；2、被害人江寿林陈述笔录；3、被害人王仙华陈述笔录；4、被害人荆树林陈述笔录；5、被害人薛永新陈述笔录；6、被害人陈有凤陈述笔录；7、证人喻世勇陈述笔录；8、犯罪嫌疑人杨德健供述笔录；9、犯罪嫌疑人骆嘉俊供述笔录；10、证人刘炼陈述笔录；11、杨德健邮寄盗窃手机单；12、杨德健、骆嘉俊指认手机照片；13、沙河口区价格认证中心大沙价认刑【2015】273号、294号价格鉴定结论书。\\r\\n上述事实清楚，证据确实、充分，足以认定。\\r\\n综上所述，犯罪嫌疑人杨德健、骆嘉俊以非法占有为目的，使用秘密手段窃取他人财物的行为已触犯《中华人民共和国刑法》第二百六十四条之规定，涉嫌盗窃罪，根据《中华人民共和国刑事诉讼法》第一百', 'null', 1, '\r\n### Error updating database.  Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bill_person_id\' at row 1\r\n### The error may involve com.ruoyi.edoc.mapper.IndictmentBillInfoMapper.updateIndictmentBillInfo-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update indictment_bill_info          SET low_case_num = ?,             bill_num = ?,             bill_plaintiff = ?,             bill_demandant = ?,             bill_third_party = ?,             bill_prosecutor = ?,             bill_claim = ?,             bill_fact_and_reason = ?,                                                    update_datetime = ?,             update_by = ?,             bill_person_id = ?,             bill_force_execute_time = ?,             bill_trans_department = ?          where uuid = ?\r\n### Cause: com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bill_person_id\' at row 1\n; Data truncation: Data too long for column \'bill_person_id\' at row 1; nested exception is com.mysql.cj.jdbc.exceptions.MysqlDataTruncation: Data truncation: Data too long for column \'bill_person_id\' at row 1', '2020-09-02 22:52:19');
INSERT INTO `sys_oper_log` VALUES (112, '起诉文书信息', 2, 'com.ruoyi.edoc.controller.IndictmentBillInfoController.editSave()', 'POST', 1, 'admin', '研发部门', '/edoc/indictmentinfo/edit', '127.0.0.1', '内网IP', '{\"uuid\":[\"1\"],\"lowCaseNum\":[\"测试用例\"],\"billNum\":[\"大公(沙)诉字[2016]24号\"],\"billPersonId\":[\"**********\"],\"billPlaintiff\":[\"无\"],\"billDemandant\":[\"杨德健,骆嘉俊\"],\"billThirdParty\":[\"无\"],\"billProsecutor\":[\"无\"],\"billClaim\":[\"杨德健、骆嘉俊涉嫌结伙盗窃一案\"],\"billFactAndReason\":[\"大连市公安局沙河口分局\\r\\n起诉意见书\\r\\n大公(沙)诉字[2016]24号\\r\\n犯罪嫌疑人杨德健，男，1989年11月27日出生，广西壮族自治区柳江县人，小学文化，无业，身份证号：\\r\\n******************,户籍地：广西壮族自治区柳江县里雍镇龙村中堂屯28号。\\r\\n违法犯罪经历：2010年，因在福建省福清市扒窃，被判处有期徒刑1年；2013年，因在湖南省长沙市扒窃被判处有期徒刑7个月。2015年10月22日，因涉嫌扒窃被我局刑事拘留，同年11月25口经沙河口区人民检察院批准被依法逮捕，现羁押于大连市看守所。\\r\\n犯罪嫌疑人骆嘉俊，男，1976年8月9日出生，无业，广西壮族自治区柳江县人，小学文化，身份证号：******************,户籍地：广西壮族自治区柳江县里雍镇龙江村新村屯1号。\\r\\n违法犯罪经历：2015年10月22日，因涉嫌扒窃被我局刑事拘留，，同年11月25日经沙河口区人民检察院批准被依法逮捕，现羁拘于大逢市看守所。\\r\\n犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，由我局民警于逆15年10月21日在工作中发现，并于同月22日立为盗窃案进行侦\\r\\n2015年10月21日17时40分许，犯罪嫌疑人杨德健伙同犯罪嫌疑人骆嘉俊在辽宁省大连市沙河口区数码路北段7号东软信息学院二期公寓门前马路上盗窃被害人戈雅星金色苹果6手机一部后，被我局民警当场抓获。犯罪嫌疑人杨德健、骆嘉俊涉嫌结伙盗窃一案，现已侦查终结。\\r\\n经依法侦查查明，犯罪嫌疑人杨德健、骆嘉俊有下列犯罪事实.\\r\\n犯罪嫌疑人杨德健与骆嘉俊经预谋，于2015年10月15日到大连欲行扒窃，并商定由杨德健负责实施扒窃，骆嘉俊负责望风掩护，获傳赃款后分成\\r\\n20l5年10月21日17时40分许，在大连市沙河口区数码路北段肯德基对面，杨德健伙同骆嘉俊扒窃戈雅星的金色苹果6手机一部，串码:***************,价值3000元；\\r\\n2015年10月20日12时20分许，在大连市沙河口区凌水桥车站，杨德健伙同骆嘉俊扒窃江寿林的金色苹果6PLUS手机一部，串码：***************,价值5040元；\\r\\n2015年10月21日12时许，在大连市沙河口区软件园东路23号櫻滅下，杨德健伙同骆嘉俊扒窃王仙华的金色苹果6手机一部，串码：***************,价值3500元；\\r\\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃荆树林的手机二部，一部是银白色苹果6手机，串码：***************,价值3000元，另一部是玫瑰金色苹果6S手机，串码：***************,价值5130元；\\r\\n2015年10月20日17时40分许，在大连市沙河口区东软信息学院学生二期公寓大门附近数码路上，杨德健伙同骆嘉俊扒窃薛永新的手机白色小米手机一部，串码:***************,价值，500元;\\r\\n2015年10月20日12时许，在大连市沙河口区软件园东路23号楼楼下，杨德健伙同骆嘉俊扒窃陈有凤的白色乐视手机一部，串码：***************,价值1260元；\\r\\n犯罪嫌疑人杨德健伙同骆嘉俊共计扒窃七部手机价值人民币21430元\\r\\n认定上述事实的证据如下：\\r\\n1、被害人戈雅星陈述笔录；2、被害人江寿林陈述笔录；3、被害人王仙华陈述笔录；4、被害人荆树林陈述笔录；5、被害人薛永新陈述笔录；6、被害人陈有凤陈述笔录；7、证人喻世勇陈述笔录；8、犯罪嫌疑人杨德健供述笔录；9、犯罪嫌疑人骆嘉俊供述笔录；10、证人刘炼陈述笔录；11、杨德健邮寄盗窃手机单；12、杨德健、骆嘉俊指认手机照片；13、沙河口区价格认证中心大沙价认刑【2015】273号、294号价格鉴定结论书。\\r\\n上述事实清楚，证据确实、充分，足以认定。\\r\\n综上所述，犯罪嫌疑人杨德健、骆嘉俊以非法占有为目的，使用秘密手段窃取他人财物的行为已触犯《中华人民共和国刑法》第二百六十四条之规定，涉嫌盗窃罪，根据《中华人民共和国刑事诉讼法》第一百六十条之规定，现将此案移送审', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-02 22:52:44');
INSERT INTO `sys_oper_log` VALUES (113, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"分析\"],\"url\":[\"/edoc/upload\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-04 18:18:09');
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"上传新案件\"],\"url\":[\"/edoc/upload\"],\"target\":[\"menuItem\"],\"perms\":[\"\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-04 18:18:35');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-08-27 21:52:05', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
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
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
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
INSERT INTO `sys_role_menu` VALUES (2, 1061);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2020/08/30/9417cf2c-d4c3-405c-85b5-5693741d9f83.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '117.181.147.190', '2020-09-07 16:23:10', 'admin', '2018-03-16 11:33:00', 'ry', '2020-09-07 16:23:09', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '用户1', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(11) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
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
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
