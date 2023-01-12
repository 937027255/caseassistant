/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : localhost:3306
 Source Schema         : caseassistant

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 13/09/2020 19:10:00
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for comment_info
-- ----------------------------
DROP TABLE IF EXISTS `comment_info`;
CREATE TABLE `comment_info` (
  `comment_num` int(11) NOT NULL AUTO_INCREMENT COMMENT '批注编号',
  `bill_num` varchar(128) CHARACTER SET utf8 NOT NULL COMMENT '文书编号',
  `comment_text` text CHARACTER SET utf8 NOT NULL COMMENT '批注内容',
  `bill_num_uuid` int(11) NOT NULL COMMENT '文书uuid',
  `record_status` int(1) NOT NULL COMMENT '记录状态',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '创建人',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '修改人',
  PRIMARY KEY (`comment_num`,`bill_num_uuid`) USING BTREE,
  KEY `BILL_NUM_FK` (`bill_num`) USING BTREE,
  KEY `BILL_NUM_UUID_FK` (`bill_num_uuid`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK_3` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BILL_NUM_UUID_FK` FOREIGN KEY (`bill_num_uuid`) REFERENCES `indictment_bill_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of comment_info
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作 sub主子表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (8, 'indictment_bill_info', '起诉文书信息表', NULL, NULL, 'IndictmentBillInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '起诉文书信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2020-08-22 21:34:27', '', '2020-08-22 21:40:16', '');
INSERT INTO `gen_table` VALUES (9, 'law_case_info', '案件信息表', NULL, NULL, 'LawCaseInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '案件信息', 'ruoyi', '0', '/', '{\"parentMenuId\":\"\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"\",\"treeCode\":\"\"}', 'admin', '2020-08-22 21:34:27', '', '2020-08-23 18:56:08', '');
INSERT INTO `gen_table` VALUES (10, 'low_record_info', '笔录信息表', NULL, NULL, 'LowRecordInfo', 'crud', 'com.ruoyi.system', 'system', 'info', '笔录信息', 'ruoyi', '0', '/', NULL, 'admin', '2020-08-22 21:34:27', '', NULL, NULL);
INSERT INTO `gen_table` VALUES (12, 'return_json_info', '分析结果表', NULL, NULL, 'ReturnJsonInfo', 'crud', 'com.ruoyi.caseassistant', 'caseassistant', 'ReturnJsonInfo', '分析结果', 'ruoyi', '0', '/', '{\"parentMenuId\":\"2000\",\"treeName\":\"\",\"treeParentCode\":\"\",\"parentMenuName\":\"案件管理\",\"treeCode\":\"\"}', 'admin', '2020-08-25 12:40:25', '', '2020-08-25 12:41:20', '');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for indictment_bill_info
-- ----------------------------
DROP TABLE IF EXISTS `indictment_bill_info`;
CREATE TABLE `indictment_bill_info` (
  `low_case_num` varchar(128) NOT NULL COMMENT '案件编号',
  `bill_num` varchar(128) NOT NULL COMMENT '文书编号',
  `bill_plaintiff` text NOT NULL COMMENT '原告',
  `bill_demandant` text NOT NULL COMMENT '被告',
  `bill_third_party` text COMMENT '第三人',
  `bill_prosecutor` varchar(128) NOT NULL COMMENT '起诉人',
  `bill_claim` text NOT NULL COMMENT '诉讼请求',
  `bill_fact_and_reason` text NOT NULL COMMENT '事实与理由',
  `record_status` char(1) NOT NULL COMMENT '记录状态',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建人',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL COMMENT '修改人',
  `bill_person_id` varchar(18) NOT NULL COMMENT '嫌疑人身份证号',
  `bill_force_execute_time` datetime NOT NULL COMMENT '强制执行时间',
  `bill_trans_department` varchar(128) NOT NULL COMMENT '移送机关',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  `bill_crime` varchar(255) NOT NULL COMMENT '移送案由',
  PRIMARY KEY (`uuid`,`bill_num`) USING BTREE,
  UNIQUE KEY `bill_num` (`bill_num`) USING BTREE,
  KEY `low_case_num` (`low_case_num`) USING BTREE,
  KEY `uuid` (`uuid`) USING BTREE,
  CONSTRAINT `BILL_NUM_PK_1` FOREIGN KEY (`low_case_num`) REFERENCES `law_case_info` (`low_case_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='起诉文书信息表';

-- ----------------------------
-- Records of indictment_bill_info
-- ----------------------------
BEGIN;
INSERT INTO `indictment_bill_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号', '大连高新技术产业园区人民检察院', '夏乐燕', NULL, '大连高新技术产业园区人民检察院', '夏乐燕盗窃案', '大连市公安局高新园区分局\r\n起诉意见书\r\n高公（刑）诉字〔2016〕005号\r\n犯罪嫌疑人夏乐燕，男，1979年5月5曰生，辽宁省大连市人，身份证号码：******************,汉族，初中文化，无业。捕前住辽宁省大连市沙河口区数码路75号2-1-1。1996年9月25日因犯盗窃罪被大连市沙河口区人民法院判处有期 徒刑五年；2014年8月20日因吸食毒品被大连市公安局沙河口分局行政拘留五日；2014年10月20日因吸食毒品、非法持 有毒品被大连市公安局高新园区分局行政拘留十曰；2015年10月13曰因涉嫌盗窃罪被我局刑事拘留，同年11月19曰经大连 市人民检察院批准，次曰被我局依法执行逮捕，现羁押于大连 市看守所。\r\n犯罪嫌疑人夏乐燕涉嫌盗窃罪一案，由证人丁树于2015年9月8曰报案至我局，我局临场勘查时提取到现场遗留的烟 蒂等物证数件，经DNA检验比对与曾被行政处罚的夏乐燕同一，据此认定夏乐燕具有重大作案嫌疑。同年10月12日我局在大连 市沙河口区数码路75号2-1-1夏乐燕家中将其抓获归案，当场查获刺绣画、邮票、油画、茶叶等赃物，经审查我局同日立案侦查。经讯问，该犯对犯罪事实供认不讳。现已侦查终结。\r\n经依法侦查查明：\r\n2015年4月某日夜，犯罪嫌疑人夏乐燕窜至大连理工大学东山院士楼20号别墅，攀爬到楼顶用携带的螺丝刀橇开天窗钻入 被害人杨辰家内，盗走三幅刺绣画、五本邮票、三幅木板年画，并在一楼门口鞋架上将该房门钥匙拿走。半个月后某日20时 许，该犯又窜至该房内，用钥匙开门进入室内，盗走四幅油画、一个砚台等物品。同年9月28或29日夜，该犯再次窜至该房内，用钥匙开门进入室内欲实施盗窃，因室内物品被转移他处而盗窃未遂。\r\n经鉴定，被盗物品价值人民币5570元。部分物品因信息不祥无法估价。\r\n认定上述事实的证据如下：\r\n1.被害人杨辰的证言；2.证人丁树、王慧芬的证言；3.犯罪嫌疑人夏乐燕的供述和辩解；4.搜查笔录、证物；5.前科情 况；6.鉴定意见；7.案件来源、抓捕经过；8、户籍证明等材料。\r\n综上所述，犯罪嫌疑人夏乐燕以非法占有为目的，采取秘密方法多次入户盗窃他人财物，数额较大，其行为已触犯《中华 人民共和国刑法》第二百六十四条之规定，涉嫌盗窃罪。依照《中华人民共和国刑事诉讼法》第一百六十条之规定，现将此 案移送审查起诉。\r\n此致\r\n大连高新技术产业园区人民检察院\r\n附：1.本案卷宗贰卷共页\r\n2.犯罪嫌疑人夏乐燕现羁押于大连市看守所', '1', '2020-09-11 15:15:23', 'admin', '2020-09-11 15:15:23', 'admin', '******************', '2020-09-11 15:15:23', '大连市公安局高新园区分局', 15, '盗窃罪');
INSERT INTO `indictment_bill_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号', '大连市甘井子区人民检察院', '刘景全', NULL, '大连市甘井子区人民检察院', '刘景全故意伤害案', '起诉意见书\r\n甘公刑诉字(2016)094号\r\n犯罪嫌疑人刘景全，男，汉族，1985年1月1日生，黑龙江省宁安市，身份证号码：******************,初中文化，系无业，户籍所在地：黑龙江省宁安市镜泊乡镜泊村1组0171号\r\n违法犯罪经历：犯罪嫌疑人刘景全于2016年1月19日因涉嫌故意伤害罪被我局刑事拘留，同年1月29日被依法批准逮捕，现 羁押于大连市看守所。\r\n犯罪嫌疑人刘景全涉嫌故意伤害一案，我局于2016年1月18曰立为故意伤害案进行侦查，现已侦查终结。\r\n经依法侦查查明，犯罪嫌疑人刘景全有下列犯罪事实：\r\n2015年12月8日0时许，在甘井子区兴华路立元洗浴中心男浴区内，犯罪嫌疑人刘景全与被害人谢嘉华因琐事发生争吵，后刘景全回到男更衣室内将事情告知与其一起到洗浴中心的乐颐、张继彪、李少倩三人。随后刘景全四人在男更衣室内与谢嘉华发生冲突，期间犯罪嫌疑人刘景全持铁撮子将谢嘉华面部打伤，经法医鉴定：谢嘉华头面部损伤系锐器致伤，其损伤程度属轻伤一级。\r\n认定上述事实的证据如下：\r\n1,犯罪嫌疑人刘景全供述笔录；2被害人谢嘉华笔录；3证人李少倩、雪光、张继彪、张金魁询问笔录；4张金魁、谢嘉华辨认笔录；5 (大甘）公（司）鉴（法医临床）字[2015]491号法医学人体损伤程度鉴定意见书。\r\n上述事实清楚，证据确实、充分，足以认定。\r\n综上所述，犯罪嫌疑人刘景全的行为已触犯《中华人民共和国刑法》第二百三十四条之规定，涉嫌故意伤害罪。依照《中华人民 共和国刑事诉讼法》第一百六十条之规定，特将此案移送审查起诉。\r\n此致\r\n大连市甘井子区人民检察院', '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', '******************', '2020-09-13 17:53:11', '未知', 16, '故意伤害罪');
COMMIT;

-- ----------------------------
-- Table structure for law_case_info
-- ----------------------------
DROP TABLE IF EXISTS `law_case_info`;
CREATE TABLE `law_case_info` (
  `low_case_num` varchar(128) NOT NULL COMMENT '案件编号',
  `low_case_reason` varchar(128) NOT NULL COMMENT '案件原由',
  `low_case_party` varchar(64) NOT NULL COMMENT '当事人',
  `low_case_content` text NOT NULL COMMENT '案例事实',
  `low_case_court` text NOT NULL COMMENT '审批法院',
  `low_case_decision_time` datetime NOT NULL COMMENT '判决时间',
  `low_case_executive_judge` varchar(64) DEFAULT NULL COMMENT '执行法官编号',
  `low_case_defence_counsel` varchar(64) DEFAULT NULL COMMENT '辩护律师编号',
  `low_case_name` varchar(128) NOT NULL COMMENT '案件名称',
  `record_status` char(1) NOT NULL COMMENT '记录状态',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建人',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL COMMENT '修改人',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  PRIMARY KEY (`uuid`,`low_case_num`) USING BTREE,
  UNIQUE KEY `low_case_num` (`low_case_num`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='案件信息表';

-- ----------------------------
-- Records of law_case_info
-- ----------------------------
BEGIN;
INSERT INTO `law_case_info` VALUES ('高公（刑）诉字〔2016〕005号', '盗窃罪', '夏乐燕', '未知', '未知', '2020-09-11 15:15:23', NULL, NULL, '夏乐燕盗窃案', '1', '2020-09-11 15:15:23', 'admin', '2020-09-11 15:15:23', 'admin', 34);
INSERT INTO `law_case_info` VALUES ('甘公刑诉字(2016)094号', '故意伤害罪', '刘景全', '未知', '未知', '2020-09-13 17:53:11', NULL, NULL, '刘景全故意伤害案', '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 35);
COMMIT;

-- ----------------------------
-- Table structure for low_record_info
-- ----------------------------
DROP TABLE IF EXISTS `low_record_info`;
CREATE TABLE `low_record_info` (
  `bill_num` varchar(128) NOT NULL COMMENT '文书编号',
  `low_record_num` varchar(128) NOT NULL COMMENT '笔录编号',
  `low_record_type` char(1) DEFAULT NULL COMMENT '笔录类型',
  `low_record_template` varchar(32) DEFAULT NULL COMMENT '笔录模板',
  `low_record_case_address` text NOT NULL COMMENT '案件地点',
  `low_record_interviewer_name` varchar(128) NOT NULL COMMENT '询/讯问人',
  `low_record_interviewee_name` varchar(128) NOT NULL COMMENT '被询/讯问人',
  `low_record_Interviewee_id` varchar(18) NOT NULL COMMENT '被询问人身份证号',
  `low_record_date` datetime NOT NULL COMMENT '笔录日期',
  `low_record_start_time` varchar(8) DEFAULT NULL COMMENT '笔录开始时间',
  `low_record_end_time` varchar(8) DEFAULT NULL COMMENT '笔录结束时间',
  `low_record_content` text NOT NULL COMMENT '笔录内容',
  `low_record_note_taker` varchar(128) NOT NULL COMMENT '记录人',
  `low_record_times` int(11) DEFAULT NULL COMMENT '笔录次数',
  `record_status` char(1) NOT NULL COMMENT '记录状态',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建人',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL COMMENT '修改人',
  `uuid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'uuid',
  PRIMARY KEY (`uuid`,`low_record_num`) USING BTREE,
  UNIQUE KEY `LOW_RECORD_UK_1` (`low_record_num`,`low_record_type`) USING BTREE,
  KEY `BILL_NUM_FK_1` (`bill_num`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK_1` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='笔录信息表';

-- ----------------------------
-- Records of low_record_info
-- ----------------------------
BEGIN;
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号0', NULL, NULL, '未知', '未知', '夏乐燕', '未知', '2015-10-11 00:00:00', NULL, NULL, '﻿第一次\r\n專ft/讯问笔录\r\n时间2015年10月11曰20时2Q分至2015年10月11曰时並 分\r\n新园区公安分局刑侦&队\r\n记录人（签名）工作单位大连市公安局高新园区公安分局 刑侦大队\r\n被與輯/讯问人夏乐燕性别男年龄M.生日期1979年5月J曰 身份证件种类及号码	居民身份证：******************\r\n现住址_大连市高新园区数码广场75号3-1-1_______\r\n联系方式***********.成程度初中 政治面貌群众\r\n户籍所在地大连市高新园区数码广场75号6-1-1___\r\n(枓头传唤被扭送咱动投案的被鼻两/讯问人于_月_日_时_分到\r\n达，_月_曰_时_分离开，本人签名：_______)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局刑侦大队的民警（出示证件），根据《中华人民共和国刑事诉讼法》第一百一十八条的规定，在我们对你进行讯问的过程中，对我们的提问你应如实回答，但对与案件无关的问题有拒绝回答的权利，如你中途需要休息或饮食请对我们提出，我们将做出相应安排，以上内容你听明白吗?\r\n答：我听明白了。问：你是否具有阅读能力？\r\n答：我有阅读能力。\r\n问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读\r\n答：阅读约5分钟。\r\n问：你是否完全理解告知书的内容?\r\n答：我能完全理解。\r\n问：你是否要求办案人员回避？\r\n答：我不要求。\r\n问：根据我国《刑事诉讼法》第三十三条的规定，你现在有权委托律师作为你的辩护人，你听清楚了吗?\r\n答：我听清楚了，\r\n问：讲一下你的简历?\r\n答:1988年1994年大连市群英小学读书；1994年1996年大连市第四中学读书；1996年2001年海城市南台少管所2001年2006年打工；2006年3月2011年8月辽阳市石门监狱;2011年8月至今打工。\r\n问：你的家庭成员？.\r\n答：母亲：王慧芬，69岁，在家退休；\r\n问：是否受过刑事处罚、行政处罚或其他行政处理？\r\n答：1996年2001年，我因盗窃在海城市南台少管所接受少管，2006年2011年8月我因为盗窃在辽阳市石门监狱服刑，2015年5、6月份我还有两次行政拘留。\r\n问：你是否是人大代表或政协委员？\r\n答：都不是。\r\n问：你是否患有严重疾病或传染病?\r\n答：我没有任何疾病、传染病。\r\n问：根据《中华人民共和国刑法》第67条第3款的规定，如实供述自己的罪行可以从轻处理，你明白了吗?\r\n答：我明白。\r\n问：你知道公安机关因何事找你吗?\r\n答：知道，我偷人家东西。\r\n问：事情发生在何时何地?\r\n答：2015年4、5月份我分两次在理工大学校内院士楼一别墅内偷的。\r\n问：你说一下事情经过?\r\n答：2015年1、2月份的时候，我到我在理工大学市场收费一个姓付的朋友家玩，我这个朋友住在理工大学家属楼，他家住在二楼201,几号楼我记不清了，我家玩时他跟我说在理工大学校内院士楼有一个别墅三年没人住是2015年4、5月份的时候的一天半夜，我自己走到那个别墅了，我爬上这个别墅旁边的空房子的顶楼，这个房子和我朋友说的没人住的别墅连着，我在顶楼用自带的螺丝刀将别墅的玻璃天窗撬开了，然后我就从这个天窗爬进别墅的三楼，别墅的三楼是仓库里面有被褥、鞋什么的，被褥用袋子装着，三楼不大，我从三楼仓库的门下到二楼，二楼走廊两侧是卧室，挨着右侧卧室还有一间书房，之后我有下到一楼，一楼是客厅和厨房，我一楼门口鞋架上发现了一到，钥匙，我用钥匙试了一下门锁发现这个钥匙就是门钥匙，于是我5?1f起来，之后我又回到二楼，我在二楼不挨着书房的卧室里面的储藏拒里，拿了三幅刺绣画，之后我又到书房书柜下面柜子拿了五本邮票，是什么书法邮票，然后我开门就走了，\r\n问：你为什么要进这个别墅?\r\n答：我好奇三年没人住的房子里面有什么东西，我想看看里面有什么东西拿点。圓\r\n问:你为什么把钥匙拿走？\r\n答:我想以后再来方便。\r\n问:你拿刺绣画的房间是什么样的？\r\n答:这个房间不挨着书房，房间里有一张大床，床上有被褥，边上有一个床头柜，边上是一个储藏柜。\r\n问:你拿五本邮票的书房是什么样的?\r\n答：书房里有一套办公座椅，是红木家具色，和一个空书柜，书柜是颜色发黄的。1接着讲？11:隔了半个月后一天晚上8、9点的时候，我又去这个别墅了，我用我上次带走的钥匙开的门，我还带了一个叫李少明的女的去的，她是我一个网友，她手机号我整丢了，我跟李少明说这是我朋友的房子，我俩在别墅里待了三个小时左右，期间我们在挨着书房的卧室里面发生了性关系，我把避孕套还扔在地上了，还在拿了他家一瓶矿泉水喝，走的时候我在一楼、二楼的楼道上拿走了四幅油画，我又在一楼客厅旁边鞋柜的小屋里拿走一个化石，在一楼客厅茶几柜上拿走一个砚台还有两个茶叶礼盒，我又找了两个红色的布袋子把这i东西装起来。拿的时候李少明也没问我为什么拿东西，我也没跟她说，出来之后李少明打车走了，我就走回家了，因为我家离这里也不远，我来回都是走着。\r\n问：李少明是谁?\r\n答：我就知道她叫李少明，是我在QQ上认识的网友，家是瓦房店的，当天我俩在数码广场见的面，之后我们走着去的别墅。\r\n问：这个客厅是什么样的?\r\n答：客厅里面有红色皮沙发，玻璃茶几、还有一个55的液晶电视、还有实木发黄的餐桌，门边还有一个小储藏室，就是我拿化石的地方，里面有些盒子。接着讲?參年9月28、9号后半夜1点左右，我在数码广场打了一个出租车又来到这个别墅，我用<粤开门后发现屋里空荡荡的什么都没有了。然后我就走了。浴命\r\n问：你这几次去都穿什么样的着装?\r\n答：我上身穿的是黑色运动服，下身牛仔裤，鞋就是我穿的这双鞋。a\r\n问：你偷的这些东西在哪?\r\n答：这些东西我都拿回家了，今天警察去我家的时候，都拿到公安局了。\r\n问：你还偷其他东西了吗?\r\n答：应该没有了，就是这些。\r\n问：你知道你偷的别墅是谁家吗?\r\n答：我第二次去的时候，在书桌上看见一个堆装修发票，发票上写着申常雨和什么丽两个人名。J私卉\r\n问:这个别墅有多大？\r\n答：别墅上下三层，能有二百多平米吧。\r\n问：你是否还有什么要补充的？\r\n答：没有了。\r\n问：你以上所讲是否属实?\r\n答：属实。\r\n问：将笔录内容给你阅读，你听后认为与你所讲准确无误就在笔录上签字、捺印指纹?\r\n答：好的', '未知', NULL, '1', '2020-09-11 15:16:06', 'admin', '2020-09-11 15:16:06', 'admin', 79);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号1', NULL, NULL, '未知', '未知', '未知', '未知', '2015-09-30 00:00:00', NULL, NULL, '﻿J3\r\n(行政刑事通用）\r\n第次\r\n询问笔录\r\n时间2015年10月15_0 10时⑼分至2015年10月H日时分 地点大连市公安局高新园厍分肩凌枣派出所询问室\r\n-作单位高新园区分局凌水派出所 高新园区分局凌水派出所\r\n询问/<^人（签名)加/I、\r\n)//。c、m\r\n记录人（签名）’和工作单位 被询问/课蔣人杨辰性别±年龄岁出生曰期1964年£月曰\r\n身份证件种类及号码 41 01 051 ***********___________\r\n现住址、北京市朝阳区工体南路新华公寓2001____________________\r\n联系方式	1501 0185566_______________\r\n户籍所在地、河南省郑州市金水区文化路48号院33号楼18号_____\r\n工作单位清华大学教师________________________\r\n(口头传唤/被扭送/ 6动投案的被询问/讯问人于 月 曰 时 分到达，\r\n月_日_时_分离开，木人签名：______)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件、证明文件），现依法向你询问关于你住处被盗的相关情况，根据《中华人民共和国刑事诉讼法》的相关规定，你应该如实提供证据、证言，如有意作伪证或隐匿罪证，将承担法律责任，你听清楚了吗?\r\n答：我听清楚了。.\r\n问：这是《被害人诉讼权利义务告知书》，请你阅读一下?\r\n答：我阅读过了。\r\n问：你有什么要求吗?问：你是否要求办案人员回避?\r\n答：我不要求。\r\n问：你来派出所有何事?\r\n答：前段时间我在大连理工大学曾经住过的东山院士楼被盗，学校已经报案，今天我特意从外地赶回来到公安机关来讲明该房子里我物品损失的情况。\r\n问：你及家属什么时间段在此居住?\r\n答：我及家属从2013年5月至2014年12月份在大连理工大学东山院士20号楼居住，后期因工作原因我们到北京工作居住，但是房子里还有一些物品并没有搬走，仍然放在房子里。我们的房子及物品平时都由学校照看管理。\r\n问：案发后，你是否回到家中对被盗物品进行清点?\r\n答：我回家看过了。\r\n问：你是否能讲清楚被盗物品的种类、数量、特征及价格?\r\n答：我清点后，发现家里墙上的四副油画被盗，悬挂的位置有一楼客厅、一楼至二楼的楼梯墙上、二楼墙上，这四副油画是2009年我在白俄罗斯文化交流的时候，我在白俄罗斯买的，当时的价格换算成人民币是200元一副，共计800元；一册“锦州世博园”的纪念邮票和四册“中国书法家宋玉鹏的纪念邮票”2013年给我留作纪77格多少我不清楚，邮票好像放在二楼书房里；一条男式领带，蓝色，是2012年我在郑州给我爱人买的领带，新的没有戴过，发票没有了，价格记不清了，但是领带上标牌价格599元；三幅刺绣画，都是横幅的，有两副山水画，一副“五牛图”，2010年我在河南开封花3000元钱购买的三幅刺绣画，没有发票收据；还有三个玻璃木板年画，是2010年我女儿在开封旅游的时候买的放在家里留作纪念，我记得大概价格总共是100元人民币。领带和刺绣画、木板年画我记得放在二楼次卧；还有三盒茶叶，我记得有一盒是“信阳毛尖”、一盒“铁观音”、一盒铁盒“竹叶青”，这几盒茶叶都放在家里好多年了，可能都过期了，价格不详，茶叶放的位置我记不清了。我记得家里可能就这些物品被盗了，还有其他记不清了。\r\n问：是否有现金及有价证券被盗?\r\n答：没有。\r\n问：家中是否有损坏?\r\n答：家里的家具没有损坏，只是三楼小偷通过天窗进到屋内，他把天窗玻璃砸碎了。\r\n问：除了上述物薛被盗以外，是否还有其他物品被盗，你在仔细想一想？\r\n答：我记得再没有了。\r\n问：你家中是否还有化石、砚台以及使用过的茶壶等被盗?\r\n答：这些东西应该不是我们家的，因为我们家的东西我多少都有印象，经我回忆送些东西都不是我家的。\r\n问：还有什么补充吗?\r\n答：没有。\r\n问：以上所述是否属实?\r\n答：属实。问：请阅读一下笔录，如无误，请你签字捺印。\r\n答：好。挪噙人砟汝詞<|义衾告庐韦7〉收，lb\r\n被询问人签名（捺印）：时间：年【？月6日侦查人员:，H厂时间：年H月J曰', '’和', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 80);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号2', NULL, NULL, '未知', '未知', '未知', '未知', '2015-08-31 00:00:00', NULL, NULL, '﻿询问笔录\r\n时间2015年09月曰10时15分至2015年09月010 时£1分 地点 大连市公安局高新园区分局凌水派出所询问室_______________\r\n记录人（签名）	孑爲名]工作单位________凌水派出所______\r\n被询问:丁树,性别:男,出生曰期1 979年05月04曰\r\n身份证件种类及号码 ******************________\r\n现住址大连市高新园区清恬园24号1-602	联系方式1 37041 12016\r\n户籍所在地_大连市高新园区清恬园24号1-602	______\r\n(口尖传唤/被扭送/自动投案的被询问/讯问人于 月 日 时 分到达，\r\n月 曰 赫 分离开，■•-本人签名：_____)。\r\nFOLLOWING ARE RECORDE\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件、证明文件），现依法向你询问你报案的相关情况，根据《中华人民共和国刑事诉讼法》的相关规定，你应该如实陈述，如有意作伪证或隐匿罪证，将承担法律责任，你听清楚了吗?\r\n答我听清楚了。\r\n问这是《被害人诉讼权利义务告知书》，请你阅读一下？\r\n答我阅读过了。\r\n问你有什么要求吗？\r\n答没有。\r\n问请你将《被害人诉讼权利义务告知书》收好？\r\n答我收好了。第I页共3页问：你是否完全理解告知书的内容？\r\n答：我完全理解。\r\n问：你是否要求办案人员回避?\r\n答：我不要求回避。\r\n问：你的工作单位及身份?\r\n答：我是大连理工大学校办的秘书，硕士研究生学历。\r\n问：你拨打110报警并来派出所何事?\r\n答：我所负责管理的大连理工大学东山20号院士楼被盗了。送个房子是我们大连理工大学原校长张永兰曾经住的公寓，因申校长在外地，所以我代表校方来报案。\r\n问：什么时间？在什么地方被盗的?\r\n答：我是2015年9月7曰上午10点左右发现的。地点在大连理工大学京山家属区20号院士楼。\r\n问：讲一下该房屋的布局?\r\n答：这个房子是一栋三层楼，南北向房屋，每拣楼东西各住一家，被盗的房子位于该楼东侧.该房屋一楼是客厅厨房和一间卧室、一个卫生间、一间小仓库，二楼是两个卧室和一个书房。三楼是三间仓库，\r\n问：详细讲一下经过？\r\n答：201奉年1月的一天（具体曰期记不清了），大连理工大学的校长张永兰从他居住的位于大连理工大学东山20号院士楼搬走了。当时他将屋内的主要物品都搬走了，剩了一些花瓶、摆件等物品没有拿走仍留在屋内。此后该房屋始终无人居住，我们屋防盗门反锁后将钥匙收回。此后我有时到该房屋查看，直到2014年11月的一天（具体曰期记不清了）我陪同张永兰的爱人曾到该房屋查看，未发现异常，走时我仍将防第2页共3页盗门反锁。直到昨天（2015年9月7日）上午10点左右，我再次到该房屋查看时发现防盗门只是关上的（没有反锁），我进屋后发现一楼客厅餐桌上摆了一些纸壳盒子（这些纸盒原本放在一楼北面仓库内的），客厅西侧电视柜上摆的2个工艺品摆件不见了。我感觉不对劲，又上二楼查看，/盒内有烟头E楼南侧仓库通往室外平台的小窗玻璃被打碎一个洞。我意识到该房屋进人了，马上拨打我校保卫处报警，后来警察到场勘查了现场，我现在来派出所协助调查。\r\n问：被盗钱物的数量、样式、特征、价值?\r\n答：我记得申校长留在屋内一楼客厅的两个摆件不见了，这两个摆件的样式我记不清了。这两件摆件的材质、特征、价值我不清楚。该房屋内是否还有其它物品被盗我也不清楚。\r\n问你有怀疑对象吗？\r\n答没有。\r\n问是否还有补充？\r\n答没有了。\r\n问以上所述是否属实？\r\n答属实。\r\n问看一下笔录，如果和你讲的相符，请签名？\r\n答好。、人上雙毒卉嚙1,+我呼k命符,\r\n被询问人签名(捺印）：满祓7十时间：夂年/月曰第3页共3', '	孑爲名]', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 81);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号3', NULL, NULL, '未知', '未知', '未知', '未知', '2015-11-01 00:00:00', NULL, NULL, '﻿(行政刑事通用)\r\n第1次\r\n询问笔录\r\n时间2015年11月1日9时10分至2015年11月1日11时分 地点大连市公安局高新^区分局凌水派出所询问室\r\n询问/揉蔣人（签名）作单位高新园区分局凌水派出所 记录人（签名）	H工作单4	高新园区分局凌水派出所\r\n被询问/讲M人王慧芬性别女年龄岁出生曰期121L年11月£曰 身份证件种类及号码	******************\r\n现住址辽宁省大连市沙河口区数码路75号2-1-1\r\n联系方式	***********	/3?鉍\r\n户籍所在地_辽宁省大连市沙河口区数码路75号2-1-1\r\n工作单位_____无业\r\n(口头传唤/被扭送/ fl动投案的被询问/讯问人于 月 曰 时 分到达，\r\n月_日_时_分离开，本人签名：______)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件、证明文件），现依法向你询问关于你住处被盗的相关情况，根据《中华人民共和国刑事诉讼法》的相关规定，你应该如实提供证据、证言，如有意作伪证或隐匿罪证，将承担法律责任，你听清楚了吗？\r\n答：我听清楚了。\r\n问：这是《证人诉讼权利义务告知书》，请你阅读一下？\r\n答：我阅读过了。\r\n问：你有什么要求吗？问：你是否要求办案人员回避？‘\r\n答：我不要求。\r\n问：你来派出所有何事?\r\n答：凌水派出所的警察我我来了解一些关于我儿子夏乐燕的情况。\r\n问：你与夏乐燕是什么关系?\r\n答：我是夏乐燕的亲生母亲，他是我的儿子，他上面还有三个姐姐。我丈夫郑荣波于1995年去世，现在我找个老伴儿屈睿在一起生活。\r\n问：夏乐燕平时在哪居住？...\r\n答：我儿子平时就跟我一起住（辽宁省大连市沙河口区数码路75号211)。\r\n问：请讲一下你儿子夏乐燕的个人情况?\r\n答：我儿子夏乐燕1979年5月5日生，今年36岁，无业在家。1996年我儿子曾因盗窃在海城少管所接受少管；2006年因盗窃在辽阳监狱服刑；今年听他说还被拘留过，至于为什么我们不知道。我儿子夏乐燕至今未婚，前段时间处过女朋友，后来黄了。平时在家里跟我，还有我后来找的老伴儿一起居住。\r\n问：你儿子夏乐燕无业，平时有什么经济来源?\r\n答：平时我和他几个姐姐都时不时地给他零花钱花，一次二三百左右也不多，再就是有时他帮他在朋友游戏厅帮忙能稍微挣点钱，其他的我就不知道了。\r\n问：你儿子夏乐燕是否天天在家住?\r\n答：没有，他是经常不回来住，经常几天，半个月，一个月，甚至半年都不回来住。有时他出去上哪干什么也不告诉我们。\r\n问：2015年10月12曰，我们在你家里搜出来的油画、刺綉画、邮票、砚台、茶叶等物品，是你们家的吗?\r\n答：这些在我们家搜出来的东西都不是我们家的东西，都是夏乐燕从外面拿回来的。夏乐燕告诉我们是高新园区动迁的房子里老百姓的东西都不要了，他给捡回来的。我们当时也是比较怀疑，再追问下去他就火了。\r\n问：上述物品是夏乐燕什么时候拿回来的?\r\n答：大概是今年春节以后他拿回家的。\r\n问：你是否知道你儿子夏乐燕盗窃的情况?\r\n答：我们家属不知遒这个情况，要是知道哪能让他去违法犯罪。\r\n问：夏乐燕是否有车辆?\r\n答：没有。\r\n问：夏乐燕有一个叫“李少明”网友你们认识吗?\r\n答：没有。\r\n问：还有什么补充吗?\r\n答：没有\r\n问：以上所述是否属实?\r\n答：属实。\r\n问：请阅读一下笔录，如无误，请你签字捺印。\r\n答好。O笼是4看茶>4讲', '未知', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 82);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号4', NULL, NULL, '未知', '未知', '夏乐燕', '未知', '2015-09-30 00:00:00', NULL, NULL, '﻿\r\n(行政刑事通用）\r\n第3次\r\n梅拇/讯问笔录\r\n时间2015年10月1£0 15时30分至2015年10月曰时分 地点 大连市看\'	________\r\n询问人（签名）\r\n区分局凌水派出所\r\n记录人（签名）工作<位	高新园区分局凌水派出所\r\n被询问人夏乐燕性别星年龄21岁出生日期1979年5月J曰\r\n身份证件种类及号码******************文化程度:初中_\r\n现住址大连市高新园区数码广场75号6-1-1联系方***********\r\n户籍所在地大连市高新园区数码广场75号6-1-1___________\r\n工作单位 无	_____________________\r\n(口头传唤/被扭送/ 动殺案的被询问/讯问人于二月„日 时 分到达，\r\n_月_日„时_分离开，本人签名：_______)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员，（出示警官证），根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间将全程录像，如你中途需要休息或饮食请对我们提出，我们将作出相应的安排，以上内容你明白了吗？\r\n答：我明白了。\r\n问：夏乐燕，你是否知道为何被刑事拘留?\r\n答：知道，因为我盗窃。\r\n问：什么时间，在什么地方进行的盗窃？\"\r\n答：2015年4、5、9月份我分三次在大连理工大学校内院士楼一别墅内进行盗窃。\r\n问：你是否认罪？\r\n答：我认罪。\r\n问：你是否还有要补充说明的吗？\r\n答：没有。\r\n问：你以上讲的属实吗？\r\n答：属实。\r\n被讯问人签名（捺印h', '未知', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 83);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号5', NULL, NULL, '未知', '未知', '未知', '未知', '2015-10-11 00:00:00', NULL, NULL, '﻿\r\n询讯问笔录\r\n时间2015年10月11曰16时33分至2015年10月曰时2_分 地点大连市公安局高新园区分局凌水派出所讯问室\r\n询问人（签名）\r\n记录人（签名）\r\n被询问人夏乐燕性釗1 4龄21岁出生日期1979年5月J曰 身份证件种类及号码******************文化程度:初中\r\n作单位高新园区分局凌水派出所 单位	高新园区分局凌水派出所\r\n现住址大连市高新园区数码广场号6-1-1联系方***********\r\n户籍所在地大连市高新园区数码广场75号6H-1___________\r\n工作单位无	______________\r\n(口.尖传唤/被扭送/自动投案的被询问/讯问人于 月 日 时„分到达，\r\n_月_日_时_分离开，本人签名：______)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员，（出示警官证），根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间将全程录像，如你中途需要休息或饮食请对我们提出，我们将作出相应的安排，以上内容你明白了吗?\r\n答：我明白了。\r\n问：你因涉嫌盗窃罪，根据《中华人民共和国刑事诉讼法》第八十条之规定，经大连市公安局高新园区分局批准决定，对你刑事拘留三曰，时间从2015年10月13日至10月16曰，羁押于大连市看守所，你听明白了吗？第1贝共2h\r\n答我听明白了。\r\n问这是大公（高）拘字（2015)U6号，你看一下？\r\n答好，（三分钟）。\r\n问你知不知道为什么对你刑事拘留？\r\n答我知道，是因为我盗窃被公安机关刑事拘留的。\r\n问什么时间，在什么地方进行的盗窃？\r\n答2015年4、5、9月份我分三次在大连理工大学校内院士楼一别墅内进行盗窃。\r\n问：你对拘留有什么意见？\r\n答：我没有意见，我知道我违法了，我认罪，我请求公安机关对我所犯罪给予从轻处罚。\r\n问：你是否还有要补充说明的吗？\r\n答：没有。\r\n被讯问人签名（捺印）：fW时间：如H年沁月\"曰第2页共2', '未知', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 84);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号6', NULL, NULL, '未知', '/^>4、', '夏乐燕', '未知', '2015-12-31 00:00:00', NULL, NULL, '﻿(行政刑事通用)\r\n第7次\r\n掏■问/讯问笔录\r\n时间2016年1月14_0 14时25分至2016年1月1£0	时迎分\r\n地点大连市看守所22^讯受室 ____________________\r\n與蔣/讯问人（签名）/^>4、工作单位高新园区凌水派出所\r\n记录人（签名）	永春	工作单位高新园区凌水派出所\r\n被梅料/讯问人夏乐燕性别男年龄36出生日期1979.5.5_______\r\n身份证件种类及号码****************** 民族丞座___\r\n现住址大连市沙河口区数码路75号2-1-1______________\r\n联系方式______***********_文化程度 初中\r\n户籍所在地大连市沙河口区数码路75号2_1-1____________\r\n工作单位 无业_________________________\r\n(口头传唤/被扭送/自动投案的被询问/讯问人于二再二面：封二分到达■\r\n二-再二艮二■时二分离开，本人签杏_____)FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件）。根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的杈利。我们在对你进行讯问期间将全程录像，如你中途需要休息或饮食请对我们提出，我们将作出相应的安排，以上内容你明白了吗？\r\n答：我明白了。\r\n问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读?績第1页共3页答好的，我仔细看看（阅读告知书约三分钟）。\r\n问你是否完全理解该告知书的内容？\r\n答我能完全理解。\r\n问请将《犯罪嫌疑人诉讼杈利义务告知书》收好？\r\n答好的。\r\n问你是否申请办案人员回避？\r\n答我不申请你们办案人员回避。\r\n问夏乐燕，关于你涉嫌盗窃一案，我们现在依法对你讯问，希望你如\r\n实回答侦查人员的提问，听明白了吗?\r\n答：我听明白了。\r\n问：2015年4月，你从家准备一把螺丝刀窜至大连理工大学东山别墅，将天窗撬开进入室内盗窃，描述一下螺丝刀的样式?\r\n答：老式红色木把的螺丝刀，长大约20公分。\r\n问：这把作案用的螺丝刀哪去了?\r\n答：第一次盗窃后，我从别墅出来就将螺丝刀扔在附近垃圾箱里。\r\n问：夏乐燕，你在之前的供述中，提到你曾因盗窃罪被大连市中山区人民法院判处有期徒刑五年，为何我们去法院系统没有查询到上述判\r\n答：当时是我记串了，搞错了。我没有被中山区法院判过。\r\n问：你现在供述的是实话吗？\r\n答：是实话。\r\n问：夏乐燕，对于你盗窃的犯罪事实，你认罪吗?\r\n答：我认罪。\r\n问：你逆有什么要交代的?笫2页共3页硬\r\n2答：没有。\r\n问：你以上所述都属实吗？\r\n答：属实。\r\n问：请核对下笔录，如记录无误，请签字?\r\n答：好的。\r\n被讯问人签名（捺印）：1使时间：年/月仲', '	永春	', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 85);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号7', NULL, NULL, '未知', '什、乂、', '夏乐燕', '未知', '2015-11-20 00:00:00', NULL, NULL, '﻿\r\n（行政刑事通用）	第《次\r\n诲闻/讯问笔录\r\n时间2015年11月20日09时10分至2015年11月20日10时50分\r\n地点 大连市看守所	十 A_________________\r\n4W讯问人（签名）什、乂、工作单位凌水派出所 记录人（签名） 私屮 \' 工作单位凌水派出所 被與餅/讯问人夏乐燕性别男年龄36出生日期1979.5.5\r\n身份证件种类及号码****************** 民族魏___\r\n现住址大连市沙河口区数码路75号2-1-1_____________\r\n联系方式__________文化程度初中______________\r\n户籍所在地大连市沙河口区数码路75号2-1-1_________\r\n工作单位明信投资公司（大连市沙河口区五一广场一民宅楼702室）\r\n-(-口头传唤/被扭送/自动投案的被询柯/讯问人于_月_日—时_„分到达，\r\n二月_曰_时_分离开，本人签名：________)FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件)。根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的权利。如你中途需要休息请对我们提出，我们将作出相应的安排，以上内容你明白了吗?\r\n答：我明白了。\r\n答:..听明白了B......................\r\n问：这是大公（高）捕字[2015]74号逮捕证证，你看一下？第1页共2页\r\n答好。\r\n问你对上述决议是否有异议？\r\n答没有。\r\n问你还有什么要交代的？\r\n答没有了。\r\n问以上讲的属实吗？\r\n答属实。\r\n问：你以上所述都属实吗?\r\n答：属实。\r\n问：请核对下笔录，如记录无误，请签字?时间：年U月', '私屮 \' ', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 86);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号8', NULL, NULL, '未知', '未知', '夏乐燕', '未知', '2015-10-31 00:00:00', NULL, NULL, '﻿(行政刑事通用)\r\n第次\r\n诲f5}/讯问笔录\r\n时间2015年11月10_0 9时20分至2015年11月10_0 jj_时M分 地点 大连市看守所2&讯室	__________\r\n與稱/讯问人（签名）作单位高新园区凌水派出I\r\n记录人（签名） 加+	I工作单位高新园区凌水派出所\r\n被與料/讯问人夏乐燕性别男年龄36出生日期1979.5.5_____\r\n身份证件种类及号码****************** 民族尴__\r\n现住址大连市沙河口区数码路75号2-1-1____________\r\n联系方式_____1 584091 7788_文化程度	初中\r\n户籍所在地_大连市沙河口区数码路75号2_1-1_________\r\n工作单位____无业_______________________\r\n(口头传唤/被扭送/自动投案的被询问7讯问人手二月_曰_时_分到达， _月_曰_时_分离开，本人签名：_______)FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件)。根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间将全程录像，如你中途需要休息或饮食请对我们提出，我们将作出相应的安排，以上内容你明白了吗?\r\n答：我明白了。\r\n问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读?答：好的，我仔细看看（阅读告知书约三分钟）。\r\n问：你是否完全理解该告知书的内容?\r\n答：我能完全理解。\r\n问：请将《犯罪嫌疑人诉讼权利义务告知书》收好？\r\n答：好的。\r\n问：你是否申请办案人员回避?\r\n答：我不申请你们办案人员回避。\r\n问：夏乐燕，你被抓获之前平时都在哪居住?\r\n答：我平时就在我家（大连市沙河口区数码路75号211)和我妈及她后老伴儿一起居住。有的时候和女朋友孙饺一起在数码广场软景E居公寓租房子住。\r\n问：介绍一下孙饺的自然情况?\r\n答：孙饺今年24岁，庄河人，在软件园曰企工作，具体单位名称我不清楚。我俩是从2014年夏天在网上认识的，后来以男女朋友关系相处，最近我俩分手了。\r\n问：你平时是否有工作？\r\n答：我没有正式工作，平时在我朋友在黑石礁的游戏厅帮忙。\r\n问：你都有哪些经济来源?\r\n答：有时家人也能多少给我点儿钱花，最近他们也不给了。我就是在我朋友在黑石礁的游戏厅帮忙，能挣点钱。\r\n问：你与前女友孙饺相处的时候都是花谁的钱?\r\n答：都有，有时花他的，有时花我的。\r\n问：夏乐燕，你为何去大连理工大学实施盗窃?\r\n答：主要是好奇，那个房子里长时间没人住，我想去看看，顺便偷点第2贞共4页2儿东西。\r\n问：你是怎么知道这出房子没有人住?\r\n答：是一个姓付的朋友告诉我这儿没有人住，姓付的在大连理工大学北门新新市场负责看市场的。\r\n问：该人的全名、住址、联系方式及自然情况?\r\n答：大连本地人，40多岁，全名不知道，他在沙河口区台山和理工大学院里都有房子，电话在我手机通讯录里，好像不是“老付”就是“付”。\r\n问：姓付的是怎么知道该房子没有人的?\r\n答：他经常在理工大学院里住，知道那房子没人住。\r\n问：姓付的是在什么情况下跟你提起此事的？\r\n答：就是2014年12月我们在一起玩的时候，他说理工大学有个别墅，是原来校长住的，校长调走后一直没人住，他就提出我们以后玩的时候是不是可以偷摸将。们橇开去那儿玩，就不用再出去开房了\r\n问当时姓付的跟你说的意思是让你去盗窃吗？\r\n答不是，我们起初就不是去偷东西，寻思就是进去玩。\r\n问你们进去玩是什么意思？\r\n答嗯就是溜冰。\r\n问姓付的也吸毒吗？\r\n答(无语）。\r\n问夏乐燕，我们希望你如实交代，主动配合公安机关工作，争取宽大处理，听明白了吗？\r\n答：听明白了。\r\n问：你以上所述都属实吗?\r\n答：属实笫3贞共4奴\r\n问：请核对下笔录，如记彔无误，请签字?\r\n答：好的。\r\n被讯问人签名（捺印）:\"\"I..3时间：7々卜年//月', '加+	I', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 87);
INSERT INTO `low_record_info` VALUES ('高公（刑）诉字〔2016〕005号', '高公（刑）诉字〔2016〕005号9', NULL, NULL, '未知', '未知', '夏乐燕', '未知', '2015-10-31 00:00:00', NULL, NULL, '﻿\r\n(行政刑事通用)\r\n第1次\r\n海构/讯问笔录\r\n时间2015年11月ii曰13时25分至2015年11月11曰时11分 地点大连市看守所208讯f室	____________\r\n4W讯问人（签名）水7\'、作单位高新园区凌水派出所 记录人（签名）	一卜\'	1■作单位高新园区凌水派出所\r\n被與两/讯问人夏乐燕性别i年龄i出生日期1979.5.5______\r\n身份证件种类及号码21 **************** 民族__\r\n现住址_大连市沙河口区数码路75号2-1-1___________\r\n联系方式_____***********_文化程度 初中\r\n户籍所在地大连市沙河口区数码路乃号2-1-1\r\n工作单位	无业_______________________\r\n(口头传唤/被扭送/自动投案的被询问/讯问人于 月 曰 时 分到达、\r\n_月_日_时_分离开，木人签名：_______）FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局高新园区分局凌水派出所的侦查员（出示证件）。根据《中华人民共和国刑事诉讼法》第一百一十八条之规定，在我们对你进行讯问过程中，对我们的提问你应当如实回答，但对与案件无关的问题有拒绝回答的权利。我们在对你进行讯问期间将全程录像，如你中途需要休息或饮食请对我们提出，我们将作出相应的安排，以上内容你明白了吗?\r\n答：我明白了。\r\n问：这是《犯罪嫌疑人诉讼权利义务告知书》，送你阅读?难1第1似共7页\r\nt答：好的，我仔细看看（阅读告知书约三分钟）。\r\n问：你是否完全理解该告知书的内容?\r\n答：我能完全理解。\r\n问：请将《犯罪嫌疑人诉讼权利义务告知书》收好?\r\n答：好的。\r\n问：你是否申请办案人员回避？\r\n答：我不申请你们办案人员回避。\r\n问：夏乐燕，关于你涉嫌盗窃一案，我们现在依法对你讯问，希望你如\r\n实回答侦查人员的提问，听明白了吗?\r\n答：我听明白了。\r\n问:你什么时间、在哪、几次实施盗窃?\r\n答：我从2015年月4月至9月期间，曾三次进入大连理工大学东山别墅盗窃。\r\n问：再分别具体交代一下?\r\n答：2015年4月份的一天半夜，我从家里准备了一把螺丝刀就走到大连理工大学东山老付说的那个别墅，别墅式三层。我看见别墅大门是锁的也很难撬开，我观察了一下别墅顶楼有一个小的天窗，我寻思能从天窗进去。于是我从旁边别墅的栏杆慢慢爬上这个别墅的顶楼。我用随身自带的螺丝刀将小天窗撬开了，从天窗爬进去，里面是一个夹层，像是小仓库，有被褥、鞋什么的东西，被褥用袋子装着。我从三楼下到二楼，二楼走廊两侧是卧室，挨着右侧卧室还有一间书房。接着我又下到一楼，一楼是客厅和厨房，我在一楼门口鞋架上发现一串钥匙，我用钥匙试了一下门锁发现这个钥匙就是大门的钥匙，于是我就揣起来留着以后再来的时候用。之后我再次回到二楼，我在二楼卧室里储藏柜里拿了三幅刺绣画，又到书房书拒下面拿了五本邮票，一本是“锦州世博园”的纪念邮票，四本是什么书法纪念邮票，还有三个玻璃封的长条年画，然后我就从大门离开了。我在别墅里找个破袋子将这些东西装上然后自己拎着走着回家的。\r\n问：当晚你是怎么来的？\r\n答：我是自己从家走到那儿的。因为我家离这里穿过绘春街很近走走就到了。\r\n问：你随身的螺丝刀是从哪弄的？\r\n答：是我从家里拿的。\r\n问：你是如何进入该别墅的?\r\n答：我从旁边别墅的栏杆慢慢爬上这个别墅的顶楼。我用随身自带的螺丝刀将小天窗撬开了，从天窗爬进去。\r\n问：你在该别墅什么部位盗窃什么物品?\r\n答：我在二楼卧室里储藏柜里拿了三幅刺綉画，又到书房书柜下面拿了五本邮票，一本是“锦州世博园”的纪念邮票，四本是什么书法纪念邮票（宋玉鹏书法纪念邮票），还有还有三个玻璃封的长条年画。\r\n问：你偷刺绣画的房间是什么样的?\r\n答：这个房间不挨着书房，房间里有一张大床，床上有被褥，一个床头柜，还有一个储藏柜。\r\n问：你偷邮票和玻璃年画的房间时什么样的?\r\n答：书房里有一套办公座椅，红木家具色，一个黄色空书柜。\r\n问：详细描述一下被盗物品的特征？\r\n答：我在别墅里进哪个房间就将房间的灯打开，我当场将所盗物品都打开看了，三幅刺绣画，我记得一副是“五牛图”、一副是“山水图”、第3贞共7贞3一副是“南江秋韵”，我记得很清楚；邮票有一本是“锦州世博园”的纪念邮票，四本是书法纪念邮票，具体名字记不清了。还有三个玻璃封的长条年画都不大。\r\n问：上述盗窃的物品哪去了？\r\n答：都放在我家里（大连市沙河口区数码路75号211)我住的屋子里。后来警察到我家里给搜走了。\r\n问：接着讲?\r\n答：第二次去时大概在第一次后半个多月左右的一天晚上八九点钟。当天我是领着我的一个女网友“李少明”去的。我跟“李少明”是2014年夏天通过QQ聊天认识的，我们记过几次面，她25岁，瓦房店人。当晚我本想跟她出去开房，因为都没有房间，所以我灵机一动，就想领“李少明”去别墅里，于是我就跟“李少明”说这是我朋友的房子，暂时没人住，我有钥匙。我俩在二楼的挨着书房的卧室里面的床上发生了性关系，我把用完的避孕套还仍在地上，我还在屋里喝了一瓶矿泉水。我俩在别墅里呆了大概三个小时。临走时我在一楼到二楼的墙上将四副油画拿走，在一楼客厅茶几柜上拿走一个土黄色的砚台、一盒包装的“信阳毛尖”、一盒包装的“铁观音”；二楼卧室衣柜里拿了一条蓝色的男士领带。然后我又找了两个红色袋子将这些东西装起来。我俩从别墅的大门出去的，离开后“李少明”打车回瓦房店了，我自己拿着上述偷的东西走回家了。\r\n问：当晚你是怎么来的？..\r\n答：当晚我和“李少明”在数码广场碰面后走着过去的。\r\n问：你俩是怎么进入别墅的？\r\n答：我俩用钥匙从大门进的。第4贞共7贞J喪\r\n4问：你俩当晚为何要到别墅去？\r\n答：当晚我本想跟她出去开房，因为都没有房间，所以我灵机一动，就想领“李少明”去别墅里。\r\n问：当时你是如何跟李少明说该房子的?\r\n答：我就跟“李少明”说这是我朋友的房子，暂时没人住，我有钥匙，她也没多问。\r\n问：你俩在哪发生的性关系?\r\n答：我俩在二楼的挨着书房的卧室里面的床上发生了性关系，我把用完的避孕套还仍在地上，我还在屋里喝了一瓶矿泉水。我俩在别墅里呆了大概三个小时，\r\n问：你这次在别墅里什么部位盗窃什么物品?\r\n答：我在一楼到二楼的墙上将四副油画拿走，在一楼客厅茶几柜上拿走一个土黄色的砚台、一盒包装的“信阳毛尖”、一盒包装的“铁观音”。二楼卧室衣柜里拿了一条蓝色的男士领带。\r\n问：还有其他物品吗?\r\n答：没有了。胃.\r\n问：在第一次讯问笔录中，你交代在第二次进入别墅还盗窃一块化石，有这事吗?\r\n答：我到底偷没偷化石我确实记不清了。\r\n问：客厅是什么样的？\r\n答：客厅里有红色皮沙发，玻璃茶几，液晶电视、实木发黄的餐桌，门边一个小储藏室。\r\n问：当时你偷上述物品的时候，“李少明”是否知道你是在盗窃？\r\n答：她并不知道，我告诉她是我朋友家，我们走的时候她也没问。问上述盗窃的物品哪去了？\r\n答当晚让我拿回家了。后来警察从我家搜走。\r\n问你的0Q号码及昵称？\r\n答也就是我的手机号***********.昵称：海岸线。\r\n问Q0密码？\r\n答wjl9980613..\r\n问“李少明”的情况？\r\n答25岁，瓦房店人，1.65米高，电话我不记得了。\r\n问接着讲？\r\n答第三次是2015年9月28日或29日的半夜1点左右，我想再过去看看拿点东西，于是我从数码广场打出租车到这个别墅。和上次一样我用钥匙从大门进去的，进去后我从一楼到三楼发现整个房子里被收拾的干干净净，空荡荡的。我什么也没偷成就打车离开了。离开的时候我将钥匙扔在理工大学道追了。\r\n问这次你为什么要打车过去？\r\n答没什么我就是不想走了，就打车过去。\r\n问这次你是如何进入的别墅？\r\n答我和第二次一样是用钥匙开大门进去的。\r\n问你这次进去的目的是什么？\r\n答就是想进去看看还有什么东西拿。\r\n问该别墅的钥匙哪去了？\r\n答离开的时候我将钥匙扔在理工大学道边了。\r\n问你为什么要将钥匙扔掉？\r\n答因为房子里没有东西了，我也不能再来了，所以我就把钥匙扔了。6第6豇共7沉\r\n问：夏乐燕，你这三次进入该别墅盗窃，是否有同伙?\r\n答：没有。就我一个人。\r\n问：所盗窃的物品都放在哪，是否有被变卖的?\r\n答：都放在我家里，我的房间里，都没有变卖。警察抓我的时候被警察搜走。\r\n问你家人是否知道你拿回家的这些东西是你偷的？\r\n答他们不知遒。\r\n问他们是否问过你此事？\r\n答我家人后来也问过我这些东西是从哪弄的？\r\n答我告诉他们是高新园区动迁人家不要的，他们再没多问。\r\n问你迁有什么要交代的？\r\n答没有。\r\n问你以上所述都属实吗？\r\n答属实。\r\n问请核对下笔录，如记录无误，请签字？\r\n答：好的。被讯问人签名（捺印）：时间：?叫年\"月M日', '未知', NULL, '1', '2020-09-11 15:16:16', 'admin', '2020-09-11 15:16:16', 'admin', 88);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号0', NULL, NULL, '未知', '未知', '张云購，', '未知', '2015-11-30 00:00:00', NULL, NULL, '﻿\r\n第_L次询问\r\n第i页共i页\r\n询 问 笔录\r\n询问时间2015年12月10 W时34分至2015年12月8日10时58分 询问地点	甘井子分局兴华街派$所____________________\r\n询问人（签名）\r\n记录人（签名）n么怒____\r\n工作单位兴华街派出所____\r\n工作单位兴华街派出所\r\n被询问人张云購，性别男出生口期 1995.11.8 文化程度初中 户籍所在地河北省承德市丰宁满族自治县石人沟乡高营村三组南沟门1号 住址	辽宁省大连市甘井子区兴华路立元洗格_____________\r\n被询问人身份证件种类及号码	******************\r\n联系电话_____***********_________________\r\n(口头传唤的被询问人__月___日___时___分到达，__月__日\r\n__时 分离开，本人黎名确认：________________)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是兴平街派出所的工作人员(出示证件），现依法对你进行调查，你要如实回答。对与本案无关的问题，你有拒绝回答的枚利。你听清楚了吗？\r\n答：听清楚了。\r\n问：你对办案人员是否耍求回避?\r\n答：我不要求。\r\n问：你因何事到派出所?\r\n答：我被人打了。答：2015年12月8口0时30分许，甘井子区兴肀路立元洗浴男更衣室内。闷：你被谁打了？\r\n答：四个陌生男子，是立元洗浴的客人。\r\n问：描述下四个男子的体貌特征？\r\n答：一个男子30岁左右，穿黑色皮夹克，身高173左右，中等身材，短发;一个男子30岁左右，中长发，发色发黄，脸上有疙瘩，身高170左右，身材较痩；一个男子30岁左右，胸前纹了个龙；最后一个男子身高176左右,中等身材。\r\n问：这四个男子为何打你？\r\n答：我是立元洗浴的服务员，中长发的男子在浴池尿尿，我制止了他，他就心生不满，就和他的三个朋友将我打了。\r\n问：你把事情的经过说一下？\r\n答：我是立元洗浴的服务员。2015年12月8H()时3()分许，我收拾完塔池我看见一个中卷发的男矛在港池犀尿。我就对这个男子说：“哥，旁边是厕所，你去那尿。”中长发男子就说：“我憋不住了，你给我滚。”然后我就走了，走的时候我说了一句：“我醉了”。中长发男子就追我到更衣室，用手推我的脖了，说：“你骂谁。”我经理就出来了，将那个中长发的男子劝走了。过了会和那个中长发男子一起的穿皮夹克的男子就走过来跟我说:“咱俩出去溜达溜达。”我就跟穿皮夹克的男子说：“哥，都是小事，不至于。”中乒、发的男子突然就用y头打、我的衣眼趣，然后和他一起的其<三名/>男子就都用拳头上来打我，打了我能有20拳左右。皮夹、克的男拿了一个我们洗浴的圆玻璃烟灰缸打了我的后脑部一下，.将我的后脑打出血r。这时我们经理就将他的烟灰缸抢了下来，将我们分开：L,我就坐到..更衣室门口的凳子上用手捂着头部。这吋开始那个中长发的男子k搭区拿了一个白戳于朝我的、两部打:C二四了，将我的左脸划伤，我在挡他的戳子的吋候我的左手背部和左小臂也被戳子划伤。打完之后他们四人就跑了。\r\n问：你是否还手打那四人?\r\n答：他们四人打我时，我用拳头打了那个中长发男子的肩部一下。\r\n问：你当时穿件什么衣服?\r\n答：我当时穿的立元洗浴的黑色衬衫工作服。\r\n问：当吋你有什么伤？怎么造成的?\r\n答：我的后脑部被打了个口子，是黑色皮夹克男子拿烟灰缸打的。我的左面部划伤到医院缝了17针左右、左小臂和左手背部有划伤，是中长发男子拿白钢戳子打的。\r\n问：打你的烟灰缸和戳子什么样?\r\n答：烟灰缸会是圆形玻璃材质的，大概直径能有lOcni。白钢戳子是长把的，把能有lm左右。现在这两个东西都在立元洗浴内。\r\n问：当吋还有谁在现埼?\r\n答：当吋有我们主管和二个服务员，还有儿个客人在场。\r\n问：你还有要补充的吗?\r\n答：没有。\r\n问：事发地是否有监控?\r\n答：有监控，过程是否照上我不清楚。\r\n答：属实。核对以上笔录，无异议签字捺印', '未知', NULL, '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 89);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号1', NULL, NULL, '未知', '我', '李少倩', '未知', '2016-01-18 00:00:00', NULL, NULL, '﻿\r\n询 问 笔录\r\n询问时间：2016年1月18日4时06分至2016年1月18日5时05分\r\n询问地点：	y $连市公安局甘井子分局兴华街派出所\r\n询问人（签名）：我工作单位：糾怒*訓\r\n记录人（签名）：j洛金氏	工作单位：衣，免♦咏丁n\r\n被询问人:李少倩性别：男出生日期：1981年5月7日文化程度：初中\r\n户籍所在地:黑龙江省林甸县红旗镇红光村四屯15号\r\n现住址：辽宁省大连市甘井子区南关岭路6-1号1-7-3\r\n工作单位：无\r\n被询问人身份证件种类及号码：居民身份证：******************\r\n□是■否人大代表\r\n联系方式：***********\r\n(口头传唤的被询问人_月_日_时_分到达，_月_曰_时 分离开，传唤的理由和依据已告知本人，本人签名确认： )。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答，属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。\r\n问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被传唤的时间、地点、原因、处所通知你的家属，怎么通知？\r\n答：不用通知，我不想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：2015年12月7日晚上12时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、乐颐、张继彪。刘景全、乐颐是亲哥俩，都是黑龙江人，刘景全今年29岁，乐颐今年31岁，刘景全的电话是***********;张继彪，20多岁，短发，身高1.70米左右。\r\n问：你们为什么打仗?\r\n答：刘景全和我们说他在洗澡的地方小便，服务员不让，他打了服务员一巴掌。后来，我们在二楼的换衣室又将这个服务员打了。\r\n问：被打得服务员长什么样?\r\n答：他大约25岁，身高约1.70米，中等身材，圆脸，他当时穿着洗浴中心的工作服，上身是蓝色的。其他的没注意。\r\n问：你4巴当时经过讲一下?\r\n答：2015年12月7日晚上20时左右，我和刘景全、乐颐、张继彪到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅休息。当时，我、刘景全、张继彪都喝了不少酒了。到晚上12时左右，刘景全去上厕所回到休息大厅，对我们说他去上厕所时被服务员骂了，他打了服务员一巴掌。张继彪就说他先出去看看怎么回事，张继彪就先出去了，我和刘景全，乐颐随后也跟着出去了，换衣室在休息大厅外面，我们出了休息大厅后，看见张继彪正在跟经理还有那个跟刘景全发生冲突的服务员讲话，我们就朝他们走过去，这时候曹成推开了，走到那个服务员身球时，服务员好像嘴里骂了刘景全一句，丁農朝那个服套秦脸上打.了一拳，义后農个服务员奠丁電发雨拳，我一看刘景全被打了，多沐去童雙，，1朋11个風至.j身>打了两拳，高成文和乐颐也冲上来对着那个服务员，賜,当时洗浴的经理还有一些服务员就过来拉架，打了\"\"大薇有1分钟左右，就停手了，洗浴的经理和服务员也都在劝架，我以为这个事情就这样完了，我和乐颐还有高成文就回到换衣箱边上穿衣服，突然间我听到刘景全又在叫骂，好像又跟人打起来了，我们三个就赶紧跑过去，就看见那个服务负捂着脸蹲在地上，脸上已经出11：血了，丁家峰.手異拿着一个卷把的..白钢攝子还在叫骂，乐颐赶紧冲上去把刘景全推了出去，然后就有人报警说警察马上来，我跟刘景全就先离开了立元洗浴。\r\n问：挨打那个服务贾是否受伤?\r\n答：他受伤了，我看见他脸上有血迹。\r\n问：这个服务员的伤是怎么造成的?\r\n答：我们4个一起打他的时候都是赤手空拳，当时他脸上没有伤，后来我们穿衣服的时候，刘景全又和那个服务员产生了冲突，我想伤应该是当时造成的，我们过去的时候看见刘景全手里拿着一个长把的白钢撮子，那个服务员捂着脸蹲在地上，脸上当时已经出血了。\r\n问：撮子是什么样的?\r\n答：就是普通长杆的撮子，是白色的，像是白钢做的。是立元洗浴里用来打扫卫生的。\r\n问：你是否受伤？问：当时拉仗的都有谁？\r\n答：就是立元洗浴的服务M，具体有谁我不清楚。\r\n问：你们四个人当时的衣着?\r\n答：我当时上身光着膀子下身穿着俗袍的黄色裤子；刘景全当时上身光着膀子，下身是红色的浴服；乐颐当时上身穿黑色的背心，下身是蓝色的牛仔裤；高成文穿黑色的皮夹克，下身是黑色裤子。\r\n问你是否被公安机关处理过？\r\n答没有。\r\n问你的家庭成员？\r\n答母亲：叶星宏，55岁，在原籍；父亲，韦春雪，59岁，在原籍。\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', 'j洛金氏	', NULL, '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 90);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号2', NULL, NULL, '未知', '未知', '乐颐', '未知', '2015-11-30 00:00:00', NULL, NULL, '﻿询问笔录\r\n询问时间:2015年12月80 15时06分至2015年12月80珏时让分 询问地点:	大连市公安甘井子分局兴华街派出所\r\n询问人(黎名）：含1⑥备工作单位：\r\n记录人（签名）:士h	工作单位：\r\n被询问人：乐颐性别:男出生日期：1985年1月1日文化程度：小 生\r\n户籍所在地:黑龙江省宁安市镜泊乡镜泊村1组0171号____\r\n现住址:大连市甘井子区南关岭鹏辉三期56号_________\r\n工作单位：无________________________\r\n被询问人身份证件种类及号码:居民身份证：****************** 口是■否人大代表\r\n联系方式:U591 159743______________\r\n(口头传唤的被询问人_月_曰_时_分到达，_月_曰__时 分离开，传唤的理由和依据已告知本人，本人签名确认： )。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避?\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。\r\n问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被倚唤的时间、地点、原因、处所通知你的家属，怎么通知?\r\n答：不用通知，我不想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：是昨天（2015年12月8日）早上1时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、张继彪、双牙子（小名）。刘景全和我是亲哥俩，都是黑龙江人，我今年31岁，我弟弟刘景全实际是30岁，但他身份证是和我同年同月同日生的，他身份证号码是******************。\r\n问：你们为什么打<丈?\r\n答：我不清楚具体为什么打架，我们在休息大厅休息，我弟弟上完厕所回来说他被服务员骂了，他打了服务M两下。之后张继彪去更衣室换衣服，我怕他吃亏，所以也跟着去更衣室，之后我弟出来看见了那个服务贵就打起来了。\r\n问：被打得服务员长什么样?\r\n答：没看清，但见面能认出来。\r\n问：你4匕当时经过讲一下?\r\n答：昨天（2015年12月7日）晚上9时30分左右，我和刘景全、张继彪、双牙子到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅看节目。当时，我跟双牙子没喝酒，我弟和张继彪喝了不少酒。到今天（2015年12月8曰）凌晨1时左右，刘景全去上厕所回到休息大厅，对我们说‘我去撒尿，让服务员骂了我就问他为什么，他说他想床屎，没憋住，就在洗澡的排水沟尿了，服务员把他骂了。然后他就给了月I务员两拳。之后张继彪就先走了，我怕他吃亏，因为他喝多了，所以我就跟他来到了更衣室。我在更衣室看见张继彪要跟服务员出去干仗，我就上去拉住张继彪，之后我在换衣服，这时我弟就出来了，看见那个服务员就给了他一拳，那服务员回手给了我老弟两拳。我看见我老弟受欺负就上去给了那个服务负两拳，服务员又给我两拳，并且拖着戒。这时双牙子和张继彪就上去用拳头打那个服务员，我就开始拉架，把那个服务员拖到角落坐着，之后我就去换衣服。换完衣服回头看见我老弟和那个服务员在一个位置，那个服务员满头是血，然后我就拉着我老弟，给他拉下楼了a之后我老弟还想上去打，我和大堂经理一直拉着我老弟，所以我弟没打着那个服务贞。结完账后警车就来了，我就回家了。\r\n问：挨打那个服务员是否受伤?\r\n答：他受伤了，是头部受伤的，具体伤的怎么样我不清楚。警察来时，我在外面看见那个挨打的服务员在屋里坐着。我看见警察把张继彪带走后我就回家了。\r\n问：这个服务员的伤是怎么造成的？\r\n答：我不清楚，我什么都没看见，我打了他两拳，双牙子和张继彪也打了他几拳。\r\n问：你弟是怎么打服务员的?\r\n答：用拳头打的，至于是否拿东西打这个服务员我就不清楚了。\r\n问：你是否受伤?\r\n答：我的右胳膊受了伤，右脚大母脚趾没有知觉，我的伤是那个挨打的月艮务员造成的。问：当时拉仗的都有谁?\r\n答：我和浴区两个服务员。那两个服务员一个是斜眼的，一个是老头。其他的我就不知道了。\r\n问：你们四个人当时的衣着?\r\n答：我打架是就穿了一个黄色的裤衩，我弟和双牙子穿了一套红色的一次性裕服；张继彪上身穿着黑色皮衣，下身穿的黑色裤子。\r\n问你是否被公安机关处理过？\r\n答没有。\r\n问你的家庭成员？\r\n答我就刘景全一个弟弟，我爸爸妈妈离婚了。\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', ':士h	', NULL, '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 91);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号3', NULL, NULL, '未知', '未知', '	刘景全', '未知', '2015-12-11 00:00:00', NULL, NULL, '﻿讯问笔录 (第2次）\r\n时间2016年L月11曰17时20分至2016年i月19_0 时£1分 地点________大连市看守所_______________\r\n侦查员姓名、单位j戈和-3廣通甘井子分局兴华街派出所 记录员姓名、单位 /卞参-	甘井子分局兴华街派出所\r\n犯罪嫌疑人姓名	刘景全__________________FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所民警（出示证件），现依法对你进行讯问，你应当如实回答我们的提问，对与本案无\r\n关的问题，你有拒绝回答的权利，听明白了吗?\r\n答：听明白了。\r\n问：根据《中华人民共和国刑事诉讼法》第八十条之规定，你现在被刑事拘留了，你听明白了吗?\r\n答听明白了。\r\n问这是拘留证，你看一下。\r\n答好。\r\n问你知不知道你为什么被拘留的？\r\n答知道，因为我涉嫌故意伤害的事情。\r\n问什么时间，在什么地方发生的事情？\r\n答在2015年12月7日24时许，甘井子区立元洗浴中心发生的。\r\n问你跟谁打架？\r\n答我们这一伙有我、乐颐、张继彪、李少倩四个人，对面是立元洗浴中心的服务员。\r\n问：你们是否都动手了？\r\n答：我们都动手打那个服务员了。答：那个被我们打的服务员捂着腔，具体受什么伤我不清楚，但是伤是被我们打的造成的，我也受伤了，我左眼肿了，是被那个服务员用拳头打的。\r\n问：你把事情经过说一下?\r\n答：我在第一次笔录中已经说过了。\r\n问：根据《中华人民共和国刑事诉讼法》之规定，你可以聘请律师为你进行法律咨询，代理申诉、控告，你听明白了吗?\r\n答：听明白了。\r\n问：你逆有什么要补充的吗?\r\n答：没有了。\r\n问：你以上讲的都属实吗?\r\n答：属实。', '未知', NULL, '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 92);
INSERT INTO `low_record_info` VALUES ('甘公刑诉字(2016)094号', '甘公刑诉字(2016)094号4', NULL, NULL, '未知', '耒1 (颂各:', '张继彪', '未知', '0001-11-30 00:00:00', NULL, NULL, '﻿询问笔录\r\n询问时间：迎U年12月80 £时巧分至年12月80丛时②分\r\n询问地点:_____大，$市公安局甘井子分局兴华街派出所\r\n询问人（签名）：耒1 (颂各:工作单位：竽存倒派邮什 记录人（签名）：H35ZZZZZ工作单位:\r\n被询问人：张继彪性别:男出生曰期：1992年4月20日文化程度： 初中\r\n户籍所在地:黑龙江省拜泉县国富镇民强村2组\r\n现住址:大连市甘井子区南关岭桥头大北沟_____________\r\n工作单位：1__________________________\r\n被询问人身份证件种类及号码:居民身份证：****************** □是■否人大代表\r\n联系方式:***********________________\r\n(口头传唤的被询问人_月_.曰___时_分到达，_月_日_时 分离开，传唤的理由和依据已告知本人，本人签名确认:_)。FOLLOWING ARE RECORDE\r\n\r\n问：我们是大连市公安局甘井子分局兴华街派出所的民警，现依法向你进行询问，你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题，你有拒绝回答的权利。你听清楚没有？\r\n答：我听清楚了。\r\n问：你对办案人员是否要求回避？\r\n答：不要求回避。\r\n问：你是否知道为什么将你带到派出所?\r\n答：知道，因为我参与打仗的事。问：因你涉嫌殴打他人，公安机关依法对你进行传唤，应当将你被借唤的时间、地点、原因、处所通知你的家属，怎么通知?\r\n答：不用通知，我想家里人知道。\r\n问：什么时间，在什么地点打仗的?\r\n答：是昨天（2015年12月7日）晚上12时左右，在大连市甘井子区立元洗浴中心二楼的换衣室。\r\n问：都有谁参与打仗的?\r\n答：有我、刘景全、乐颐、双牙子（小名）。刘景全、乐颐是亲哥俩，都是黑龙江人，刘景全今年29岁，乐颐今年31岁，刘景全的电话是***********;双牙子姓朱，具体叫什么名字我不知道。\r\n问：你们为什幺打仗?\r\n答：刘景全和我们说他在洗澡的地方小便，服务员不让，他打了服务员一巴掌。后来，我们在二楼的换衣室又將这个服务员打了。\r\n问：被打得服务负长什么样?\r\n答：他大约25岁，身高约1.70米，中等身材，圆脸，他当时穿着洗浴中心的工作服，上身是蓝色的。其他的没注意。\r\n问：你当时经过讲一下?\r\n答：昨天（2Q15年12月7日）晚上8时左右，我和刘景全、乐颐、双牙子到立元洗浴中心洗澡，洗完澡我们就在二楼的休息大厅休息。当时，我、刘景全、双牙子都喝了不少酒了。到晚上12时左右，刘景全去上厕所回到休息大厅，对我们说‘有个服务员装逼，不让他在洗澡的地方尿尿，他打了这个服务员一巴掌。因为我知道刘景全喝完酒好惹事，而且我明天还有活，我就对他们说‘你们把手牌告诉我，我去结账他们告诉我手牌号，我就到换衣室去换衣服答：他受伤了，是头部受伤的，具体伤的怎么样我不清楚。警察来时，他打车去医院了，我看到他脸上有血。\r\n问：这个服务员的伤是怎么造成的?\r\n答：主要是刘景全打的，拳打脚踢还用铁撮子，我也打了他几下，双牙子也打了，怎么打的我没注意，乐颐是否动手打这个服务员我不清楚。\r\n问：铁撮子是什么样的?\r\n答：就是普通长杆的撮子，是白色的，掉在地上咣当一声，我认为应j亥是寺失的。这个撮子是立元洗浴的，现在也应j盡在立元洗浴。\r\n问：你是否受伤?\r\n答：我左侧脸部受伤了，具体是谁打的我不清楚。刘景全踹我的几脚、打我几下，我没有受伤。\r\n问：参与打仗的服务負长什么样?\r\n答：我就记着他是斜眼，其他的没注意。他当时也拉仗了。\r\n问：当时拉仗的都有谁?\r\n答：就是立元洗浴的服务员，具体有谁我不清楚。\r\n问：你们四个人当时的衣着?\r\n答：我当时上身穿黑色的皮夹克，下身是黑色裤子；刘景全当时上身光着膀子，下身是红色的浴服；乐颐当时上身穿黑色的背心，下身是蓝色的牛仔裨；双牙子当时上身穿白色的衣服，下身是黄色的裤子。\r\n问：你是否被公安机关处理过?\r\n答：没有。\r\n问你的家庭成员？\r\n答母亲：潘燕南，64岁，在大连a\r\n问你还有什么补充的？\r\n答没有。\r\n问你讲的属实吗？\r\n答属实。\r\n问你看一下笔录，如无误签字捺指印。\r\n答好的', 'H35ZZZZZ', NULL, '1', '2020-09-13 17:53:11', 'admin', '2020-09-13 17:53:11', 'admin', 93);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(20) NOT NULL,
  `sched_time` bigint(20) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3130202A202A202A202A203F74001172795461736B2E72794E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3135202A202A202A202A203F74001572795461736B2E7279506172616D7328277279272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F504552544945537372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720027636F6D2E72756F79692E636F6D6D6F6E2E636F72652E646F6D61696E2E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E078707400007070707400013174000E302F3230202A202A202A202A203F74003872795461736B2E72794D756C7469706C65506172616D7328277279272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(20) NOT NULL,
  `checkin_interval` bigint(20) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', 'JAVAJIAO-DevOps1599819003936', 1599819067132, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(20) NOT NULL,
  `repeat_interval` bigint(20) NOT NULL,
  `times_triggered` bigint(20) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(20) DEFAULT NULL,
  `prev_fire_time` bigint(20) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(20) NOT NULL,
  `end_time` bigint(20) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(6) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1599819010000, -1, 5, 'PAUSED', 'CRON', 1599819004000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1599819015000, -1, 5, 'PAUSED', 'CRON', 1599819004000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1599819020000, -1, 5, 'PAUSED', 'CRON', 1599819004000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for return_json_info
-- ----------------------------
DROP TABLE IF EXISTS `return_json_info`;
CREATE TABLE `return_json_info` (
  `json_uid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'json_uid',
  `bill_num` varchar(128) NOT NULL COMMENT '文书编号',
  `json` longtext NOT NULL COMMENT '返回的json',
  `bill_uid` int(11) NOT NULL COMMENT '对应文书uid',
  `create_datetime` datetime NOT NULL COMMENT '创建时间',
  `create_by` varchar(64) NOT NULL COMMENT '创建人',
  `update_datetime` datetime NOT NULL COMMENT '更新时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新人',
  PRIMARY KEY (`json_uid`) USING BTREE,
  UNIQUE KEY `JSON_UID_PK` (`json_uid`) USING BTREE,
  UNIQUE KEY `BILL_NUM_FK` (`bill_num`) USING BTREE,
  KEY `BILL_UID_FK` (`bill_uid`) USING BTREE,
  CONSTRAINT `BILL_NUM_FK` FOREIGN KEY (`bill_num`) REFERENCES `indictment_bill_info` (`bill_num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `BILL_UID_FK` FOREIGN KEY (`bill_uid`) REFERENCES `indictment_bill_info` (`uuid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of return_json_info
-- ----------------------------
BEGIN;
INSERT INTO `return_json_info` VALUES (1, '甘公刑诉字(2016)094号', '{\"case_id\": \"甘公刑诉字(2016)094号\", \"main_doc_list\": [{\"doc_txt\": {\"original_str\": \"起诉意见书甘公刑诉字(2016)094号犯罪嫌疑人刘景全,男,汉族,1985年1月1日生,黑龙江省㝉安市,身份证号码:******************,初中文化,系无业,户籍所在地:黑龙江省㝉安市镜泊乡镜泊村1组0171号违法犯罪经历:犯罪嫌疑人刘景全于2016年1月19日因涉嫌故意伤害罪被我局刑事拘留,同年1月29日被依法批准逮捕,现羁押于大连市看守所。犯罪嫌疑人刘景全涉嫌故意伤害一案,我局于2016年1月18曰立为故意伤害案进行侦查,现已侦查终结。经依法侦查查明,犯罪嫌疑人刘景全有下列犯罪事实:2015年12月8日0时许,在甘井子区兴华路立元洗浴中心男浴区内,犯罪嫌疑人刘景全与被害人谢嘉华因琐事发生争吵,后刘景全回到男更衣室内将事情告知与其一起到洗浴中心的乐颐、张继彪、李少倩三人。随后刘景全四人在男更衣室内与谢嘉华发生冲突,期间犯罪嫌疑人刘景全持铁撮子将谢嘉华面部打伤,经法医鉴定:谢嘉华头面部损伤系锐器致伤,其损伤程度属轻伤一级。认定上述事实的证据如下:1,犯罪嫌疑人刘景全供述笔录;2被害人谢嘉华笔录;3证人李少倩、雪光、张继彪、张金魁询问笔录;4张金魁、谢嘉华辨认笔录;5(大甘)公(司)鉴(法医临床)字[2015]491号法医学人体损伤程度鉴定意见书。上述事实清楚,证据确实、充分,足以认定。综上所述,犯罪嫌疑人刘景全的行为已触犯《中华人民共和国刑法》第二百三十四条之规定,涉嫌故意伤害罪。依照《中华人民共和国刑事诉讼法》第一百六十条之规定,特将此案移送审查起诉。此致大连市甘井子区人民检察院\", \"para_loc\": [0, 5, 20, 113, 181, 230, 254, 425, 437, 539, 559, 645, 647, 659]}, \"doc_fact\": [{\"no\": 0, \"time\": \"2015年12月8日0时许\", \"location\": \"甘井子区兴华路立元洗浴中心男浴区内\", \"people\": [\"张继彪\", \"李少倩\", \"乐颐\", \"刘景全\", \"谢嘉华\"], \"content\": [254, 425]}]}], \"attach_doc_list\": [{\"attach_doc_text\": {\"original_str\": \"第次询问第页共页询问笔录询问时间2015年12月10时34分至2015年12月8日10时58分询问地点甘井子分局兴华街派$所询问人(签名)记录人(签名)幺怒工作单位兴华街派出所工作单位兴华街派出所被询问人张云购,性别男出生口期1995.11.8文化程度初中户籍所在地河北省承德市丰㝉满族自治县石人沟乡高营村三组南沟门1号住址辽㝉省大连市甘井子区兴华路立元洗格被询问人身份证件种类及号码******************联系电话***********(口头传唤的被询问人月日时分到达,月日时分离开,本人黎名确认:)。FAEECDE问:我们是兴平街派出所的工作人员(出示证件),现依法对你进行调查,你要如实回答。对与本案无关的问题,你有拒绝回答的枚利。你听清楚了吗?答:听清楚了。问:你对办案人员是否耍求回避?答:我不要求。问:你因何事到派出所?答:我被人打了。答:2015年12月8口0时30分许,甘井子区兴路立元洗浴男更衣室内。闷:你被谁打了?答:四个陌生男子,是立元洗浴的客人。问:描述下四个男子的体貌特征?答:一个男子30岁左右,穿黑色皮夹克,身高173左右,中等身材,短发;一个男子30岁左右,中长发,发色发黄,脸上有疙瘩,身高170左右,身材较痩;一个男子30岁左右,胸前纹了个龙;最后一个男子身高176左右,中等身材。问:这四个男子为何打你?答:我是立元洗浴的服务员,中长发的男子在浴池尿尿,我制止了他,他就心生不满,就和他的三个朋友将我打了。问:你把事情的经过说一下?答:我是立元洗浴的服务员。2015年12月8()时3()分许,我收拾完塔池我看见一个中卷发的男矛在港池犀尿。我就对这个男子说:\\\"哥,旁边是厕所,你去那尿。\\\"中长发男子就说:\\\"我憋不住了,你给我滚。\\\"然后我就走了,走的时候我说了一句:\\\"我醉了\\\"。中长发男子就追我到更衣室,用手推我的脖了,说:\\\"你骂谁。\\\"我经理就出来了,将那个中长发的男子劝走了。过了会和那个中长发男子一起的穿皮夹克的男子就走过来跟我说:\\\"咱俩出去溜达溜达。\\\"我就跟穿皮夹克的男子说:\\\"哥,都是小事,不至于。\\\"中乒、发的男子突然就用头打、我的衣眼趣,然后和他一起的其<三名/>男子就都用拳头上来打我,打了我能有20拳左右。皮夹、克的男拿了一个我们洗浴的圆玻璃烟灰缸打了我的后脑部一下,.将我的后脑打出血。这时我们经理就将他的烟灰缸抢了下来,将我们分开:,我就坐到..更衣室门口的凳子上用手捂着头部。这吋开始那个中长发的男子搭区拿了一个白戳于朝我的、两部打:C二四了,将我的左脸划伤,我在挡他的戳子的吋候我的左手背部和左小臂也被戳子划伤。打完之后他们四人就跑了。问:你是否还手打那四人?答:他们四人打我时,我用拳头打了那个中长发男子的肩部一下。问:你当时穿件什幺衣服?答:我当时穿的立元洗浴的黑色衬衫工作服。问:当吋你有什幺伤?怎幺造成的?答:我的后脑部被打了个口子,是黑色皮夹克男子拿烟灰缸打的。我的左面部划伤到医院缝了17针左右、左小臂和左手背部有划伤,是中长发男子拿白钢戳子打的。问:打你的烟灰缸和戳子什幺样?答:烟灰缸会是圆形玻璃材质的,大概直径能有c。白钢戳子是长把的,把能有左右。现在这两个东西都在立元洗浴内。问:当吋还有谁在现埼?答:当吋有我们主管和二个服务员,还有儿个客人在场。问:你还有要补充的吗?答:没有。问:事发地是否有监控?答:有监控,过程是否照上我不清楚。答:属实。核对以上笔录,无异议签字捺印\", \"para_loc\": [0, 4, 8, 12, 62, 69, 78, 88, 98, 179, 210, 225, 244, 265, 332, 339, 354, 361, 372, 423, 441, 456, 565, 577, 628, 641, 1103, 1115, 1144, 1156, 1176, 1192, 1265, 1280, 1333, 1344, 1369, 1380, 1385, 1396, 1413, 1432]}, \"attach_doc_fact\": [{\"no\": 0, \"time\": \"2015年12月8口0时30分许\", \"location\": \"甘井子区兴路立元洗浴男更衣室内\", \"people\": [\"张云购\", \"我\"], \"content\": [372, 423]}, {\"no\": 1, \"time\": \"左右\", \"location\": \"\", \"people\": [\"张云购\"], \"content\": [456, 565]}, {\"no\": 2, \"time\": \"2015年12月8()时3()分许\", \"location\": \"更衣室门口的凳子上\", \"people\": [\"张云购\", \"我\"], \"content\": [641, 1103]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:2016年1月18日4时06分至2016年1月18日5时05分询问地点:$连市公安局甘井子分局兴华街派出所询问人(签名):我工作单位:纠怒*训记录人(签名):洛金氏工作单位:衣,免咏丁被询问人:李少倩性别:男出生日期:1981年5月7日文化程度:初中户籍所在地:黑龙江省林甸县红旗镇红光村四屯15号现住址:辽㝉省大连市甘井子区南关岭路61号173工作单位:无被询问人身份证件种类及号码:居民身份证:******************是否人大代表联系方式:***********(口头传唤的被询问人月日时分到达,月曰时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答,属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被传唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我不想家里人知道。问:什幺时间,在什幺地点打仗的?答:2015年12月7日晚上12时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、乐颐、张继彪。刘景全、乐颐是亲哥俩,都是黑龙江人,刘景全今年29岁,乐颐今年31岁,刘景全的电话是***********;张继彪,20多岁,短发,身高1.70米左右。问:你们为什幺打仗?答:刘景全和我们说他在洗澡的地方小便,服务员不让,他打了服务员一巴掌。后来,我们在二楼的换衣室又将这个服务员打了。问:被打得服务员长什幺样?答:他大约25岁,身高约1.70米,中等身材,圆脸,他当时穿着洗浴中心的工作服,上身是蓝色的。其他的没注意。问:你4巴当时经过讲一下?答:2015年12月7日晚上20时左右,我和刘景全、乐颐、张继彪到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅休息。当时,我、刘景全、张继彪都喝了不少酒了。到晚上12时左右,刘景全去上厕所回到休息大厅,对我们说他去上厕所时被服务员骂了,他打了服务员一巴掌。张继彪就说他先出去看看怎幺回事,张继彪就先出去了,我和刘景全,乐颐随后也跟着出去了,换衣室在休息大厅外面,我们出了休息大厅后,看见张继彪正在跟经理还有那个跟刘景全发生冲突的服务员讲话,我们就朝他们走过去,这时候曹成推开了,走到那个服务员身球时,服务员好像嘴里骂了刘景全一句,丁农朝那个服套秦脸上打.了一拳,义后农个服务员奠丁电发雨拳,我一看刘景全被打了,多沐去童双,1朋11个风至.身>打了两拳,高成文和乐颐也冲上来对着那个服务员,赐,当时洗浴的经理还有一些服务员就过来拉架,打了\\\"\\\"大薇有1分钟左右,就停手了,洗浴的经理和服务员也都在劝架,我以为这个事情就这样完了,我和乐颐还有高成文就回到换衣箱边上穿衣服,突然间我听到刘景全又在叫骂,好像又跟人打起来了,我们三个就赶紧跑过去,就看见那个服务负捂着脸蹲在地上,脸上已经出11:血了,丁家峰.手异拿着一个卷把的..白钢摄子还在叫骂,乐颐赶紧冲上去把刘景全推了出去,然后就有人报警说警察马上来,我跟刘景全就先离开了立元洗浴。问:挨打那个服务贾是否受伤?答:他受伤了,我看见他脸上有血迹。问:这个服务员的伤是怎幺造成的?答:我们4个一起打他的时候都是赤手空拳,当时他脸上没有伤,后来我们穿衣服的时候,刘景全又和那个服务员产生了冲突,我想伤应该是当时造成的,我们过去的时候看见刘景全手里拿着一个长把的白钢撮子,那个服务员捂着脸蹲在地上,脸上当时已经出血了。问:撮子是什幺样的?答:就是普通长杆的撮子,是白色的,像是白钢做的。是立元洗浴里用来打扫卫生的。问:你是否受伤?问:当时拉仗的都有谁?答:就是立元洗浴的服务,具体有谁我不清楚。问:你们四个人当时的衣着?答:我当时上身光着膀子下身穿着俗袍的黄色裤子;刘景全当时上身光着膀子,下身是红色的浴服;乐颐当时上身穿黑色的背心,下身是蓝色的牛仔裤;高成文穿黑色的皮夹克,下身是黑色裤子。问你是否被公安机关处理过?答没有。问你的家庭成员?答母亲:叶星宏,55岁,在原籍;父亲,韦春雪,59岁,在原籍。问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 40, 62, 80, 101, 134, 158, 182, 188, 226, 232, 248, 302, 389, 397, 412, 420, 438, 453, 508, 524, 540, 581, 592, 684, 694, 751, 764, 818, 831, 1396, 1410, 1427, 1443, 1560, 1570, 1608, 1627, 1648, 1661, 1747, 1760, 1764, 1772, 1803, 1813, 1817, 1825, 1829, 1846, 1849]}, \"attach_doc_fact\": [{\"no\": 3, \"time\": \"2015年12月7日晚上12时左右\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"我\"], \"content\": [540, 581]}, {\"no\": 4, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"张继彪\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [592, 635]}, {\"no\": 5, \"time\": \"今年\", \"location\": \"\", \"people\": [\"张继彪\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [635, 684]}, {\"no\": 6, \"time\": \"2015年12月7日晚上20时左右\", \"location\": \"立元洗浴中心\", \"people\": [\"张继彪\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [831, 910]}, {\"no\": 7, \"time\": \"晚上12时左右\", \"location\": \"\", \"people\": [\"张继彪\", \"曹成\", \"丁家峰\", \"乐颐\", \"高成文\", \"刘景全\", \"丁农\", \"我\"], \"content\": [910, 1396]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:2015年12月8015时06分至2015年12月80珏时让分询问地点:大连市公安甘井子分局兴华街派出所询问人(黎名):含16备工作单位:记录人(签名):士工作单位:被询问人:乐颐性别:男出生日期:1985年1月1日文化程度:小生户籍所在地:黑龙江省㝉安市镜泊乡镜泊村1组0171号现住址:大连市甘井子区南关岭鹏辉三期56号工作单位:无被询问人身份证件种类及号码:居民身份证:******************口是否人大代表联系方式:591159743(口头传唤的被询问人月曰时分到达,月曰时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被倚唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我不想家里人知道。问:什幺时间,在什幺地点打仗的?答:是昨天(2015年12月8日)早上1时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、张继彪、双牙子(小名)。刘景全和我是亲哥俩,都是黑龙江人,我今年31岁,我弟弟刘景全实际是30岁,但他身份证是和我同年同月同日生的,他身份证号码是******************。问:你们为什幺打<丈?答:我不清楚具体为什幺打架,我们在休息大厅休息,我弟弟上完厕所回来说他被服务员骂了,他打了服务两下。之后张继彪去更衣室换衣服,我怕他吃亏,所以也跟着去更衣室,之后我弟出来看见了那个服务贵就打起来了。问:被打得服务员长什幺样?答:没看清,但见面能认出来。问:你4匕当时经过讲一下?答:昨天(2015年12月7日)晚上9时30分左右,我和刘景全、张继彪、双牙子到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅看节目。当时,我跟双牙子没喝酒,我弟和张继彪喝了不少酒。到今天(2015年12月8曰)凌晨1时左右,刘景全去上厕所回到休息大厅,对我们说\'我去撒尿,让服务员骂了我就问他为什幺,他说他想床屎,没憋住,就在洗澡的排水沟尿了,服务员把他骂了。然后他就给了月务员两拳。之后张继彪就先走了,我怕他吃亏,因为他喝多了,所以我就跟他来到了更衣室。我在更衣室看见张继彪要跟服务员出去干仗,我就上去拉住张继彪,之后我在换衣服,这时我弟就出来了,看见那个服务员就给了他一拳,那服务员回手给了我老弟两拳。我看见我老弟受欺负就上去给了那个服务负两拳,服务员又给我两拳,并且拖着戒。这时双牙子和张继彪就上去用拳头打那个服务员,我就开始拉架,把那个服务员拖到角落坐着,之后我就去换衣服。换完衣服回头看见我老弟和那个服务员在一个位置,那个服务员满头是血,然后我就拉着我老弟,给他拉下楼了a之后我老弟还想上去打,我和大堂经理一直拉着我老弟,所以我弟没打着那个服务贞。结完账后警车就来了,我就回家了。问:挨打那个服务员是否受伤?答:他受伤了,是头部受伤的,具体伤的怎幺样我不清楚。警察来时,我在外面看见那个挨打的服务员在屋里坐着。我看见警察把张继彪带走后我就回家了。问:这个服务员的伤是怎幺造成的?答:我不清楚,我什幺都没看见,我打了他两拳,双牙子和张继彪也打了他几拳。问:你弟是怎幺打服务员的?答:用拳头打的,至于是否拿东西打这个服务员我就不清楚了。问:你是否受伤?答:我的右胳膊受了伤,右脚大母脚趾没有知觉,我的伤是那个挨打的月艮务员造成的。问:当时拉仗的都有谁?答:我和浴区两个服务员。那两个服务员一个是斜眼的,一个是老头。其他的我就不知道了。问:你们四个人当时的衣着?答:我打架是就穿了一个黄色的裤衩,我弟和双牙子穿了一套红色的一次性裕服;张继彪上身穿着黑色皮衣,下身穿的黑色裤子。问你是否被公安机关处理过?答没有。问你的家庭成员?答我就刘景全一个弟弟,我爸爸妈妈离婚了。问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 61, 78, 92, 124, 150, 171, 177, 222, 236, 290, 377, 385, 400, 408, 426, 441, 496, 512, 528, 573, 584, 685, 696, 795, 808, 822, 835, 1331, 1345, 1414, 1430, 1466, 1479, 1507, 1515, 1565, 1606, 1619, 1676, 1689, 1693, 1701, 1721, 1731, 1735, 1743, 1747, 1764, 1767]}, \"attach_doc_fact\": [{\"no\": 8, \"time\": \"昨天\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"乐颐\"], \"content\": [528, 573]}, {\"no\": 9, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [584, 685]}, {\"no\": 10, \"time\": \"昨天(2015年12月7日)晚上9时30分左右\", \"location\": \"立元洗浴中心\", \"people\": [\"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [835, 926]}, {\"no\": 11, \"time\": \"今天(2015年12月8曰)凌晨1时左右\", \"location\": \"\", \"people\": [\"我老弟\", \"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [926, 1331]}]}, {\"attach_doc_text\": {\"original_str\": \"讯问笔录(第2次)时间2016年月11曰17时20分至2016年月190时1分地点大连市看守所侦查员姓名、单位戈和3广通甘井子分局兴华街派出所记录员姓名、单位/卞参甘井子分局兴华街派出所犯罪嫌疑人姓名刘景全FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所民警(出示证件),现依法对你进行讯问,你应当如实回答我们的提问,对与本案无关的问题,你有拒绝回答的权利,听明白了吗?答:听明白了。问:根据《中华人民共和国刑事诉讼法》第八十条之规定,你现在被刑事拘留了,你听明白了吗?答听明白了。问这是拘留证,你看一下。答好。问你知不知道你为什幺被拘留的?答知道,因为我涉嫌故意伤害的事情。问什幺时间,在什幺地方发生的事情?答在2015年12月7日24时许,甘井子区立元洗浴中心发生的。问你跟谁打架?答我们这一伙有我、乐颐、张继彪、李少倩四个人,对面是立元洗浴中心的服务员。问:你们是否都动手了?答:我们都动手打那个服务员了。答:那个被我们打的服务员捂着腔,具体受什幺伤我不清楚,但是伤是被我们打的造成的,我也受伤了,我左眼肿了,是被那个服务员用拳头打的。问:你把事情经过说一下?答:我在第一次笔录中已经说过了。问:根据《中华人民共和国刑事诉讼法》之规定,你可以聘请律师为你进行法律咨询,代理申诉、控告,你听明白了吗?答:听明白了。问:你逆有什幺要补充的吗?答:没有了。问:你以上讲的都属实吗?答:属实。\", \"para_loc\": [0, 9, 47, 93, 110, 190, 197, 240, 246, 258, 261, 276, 293, 310, 341, 348, 385, 396, 476, 488, 504, 557, 564, 577, 583, 595, 600]}, \"attach_doc_fact\": [{\"no\": 12, \"time\": \"2015年12月7日24时许\", \"location\": \"甘井子区立元洗浴中心\", \"people\": [\"刘景全\"], \"content\": [310, 341]}]}, {\"attach_doc_text\": {\"original_str\": \"询问笔录询问时间:迎年12月80时巧分至年12月80丛时2分询问地点:大,$市公安局甘井子分局兴华街派出所询问人(签名):耒1(颂各:工作单位:竽存倒派邮什记录人(签名):35工作单位:被询问人:张继彪性别:男出生曰期:1992年4月20日文化程度:初中户籍所在地:黑龙江省拜泉县国富镇民强村2组现住址:大连市甘井子区南关岭桥头大北沟工作单位:1被询问人身份证件种类及号码:居民身份证:******************是否人大代表联系方式:***********(口头传唤的被询问人月.曰时分到达,月日时分离开,传唤的理由和依据已告知本人,本人签名确认:)。FAEECDE问:我们是大连市公安局甘井子分局兴华街派出所的民警,现依法向你进行询问,你要如实回答。属于本案当事人的有申请回避的权利。对与案件无关的问题,你有拒绝回答的权利。你听清楚没有?答:我听清楚了。问:你对办案人员是否要求回避?答:不要求回避。问:你是否知道为什幺将你带到派出所?答:知道,因为我参与打仗的事。问:因你涉嫌殴打他人,公安机关依法对你进行传唤,应当将你被借唤的时间、地点、原因、处所通知你的家属,怎幺通知?答:不用通知,我想家里人知道。问:什幺时间,在什幺地点打仗的?答:是昨天(2015年12月7日)晚上12时左右,在大连市甘井子区立元洗浴中心二楼的换衣室。问:都有谁参与打仗的?答:有我、刘景全、乐颐、双牙子(小名)。刘景全、乐颐是亲哥俩,都是黑龙江人,刘景全今年29岁,乐颐今年31岁,刘景全的电话是***********;双牙子姓朱,具体叫什幺名字我不知道。问:你们为什幺打仗?答:刘景全和我们说他在洗澡的地方小便,服务员不让,他打了服务员一巴掌。后来,我们在二楼的换衣室又将这个服务员打了。问:被打得服务负长什幺样?答:他大约25岁,身高约1.70米,中等身材,圆脸,他当时穿着洗浴中心的工作服,上身是蓝色的。其他的没注意。问:你当时经过讲一下?答:昨天(215年12月7日)晚上8时左右,我和刘景全、乐颐、双牙子到立元洗浴中心洗澡,洗完澡我们就在二楼的休息大厅休息。当时,我、刘景全、双牙子都喝了不少酒了。到晚上12时左右,刘景全去上厕所回到休息大厅,对我们说\'有个服务员装逼,不让他在洗澡的地方尿尿,他打了这个服务员一巴掌。因为我知道刘景全喝完酒好惹事,而且我明天还有活,我就对他们说\'你们把手牌告诉我,我去结账他们告诉我手牌号,我就到换衣室去换衣服答:他受伤了,是头部受伤的,具体伤的怎幺样我不清楚。警察来时,他打车去医院了,我看到他脸上有血。问:这个服务员的伤是怎幺造成的?答:主要是刘景全打的,拳打脚踢还用铁撮子,我也打了他几下,双牙子也打了,怎幺打的我没注意,乐颐是否动手打这个服务员我不清楚。问:铁撮子是什幺样的?答:就是普通长杆的撮子,是白色的,掉在地上咣当一声,我认为应亥是寺失的。这个撮子是立元洗浴的,现在也应尽在立元洗浴。问:你是否受伤?答:我左侧脸部受伤了,具体是谁打的我不清楚。刘景全踹我的几脚、打我几下,我没有受伤。问:参与打仗的服务负长什幺样?答:我就记着他是斜眼,其他的没注意。他当时也拉仗了。问:当时拉仗的都有谁?答:就是立元洗浴的服务员,具体有谁我不清楚。问:你们四个人当时的衣着?答:我当时上身穿黑色的皮夹克,下身是黑色裤子;刘景全当时上身光着膀子,下身是红色的浴服;乐颐当时上身穿黑色的背心,下身是蓝色的牛仔裨;双牙子当时上身穿白色的衣服,下身是黄色的裤子。问:你是否被公安机关处理过?答:没有。问你的家庭成员?答母亲:潘燕南,64岁,在大连a问你还有什幺补充的?答没有。问你讲的属实吗?答属实。问你看一下笔录,如无误签字捺指印。答好的\", \"para_loc\": [0, 4, 30, 53, 93, 127, 148, 167, 173, 217, 233, 288, 375, 383, 398, 406, 424, 494, 509, 525, 571, 582, 674, 684, 741, 754, 808, 819, 1071, 1087, 1149, 1160, 1218, 1226, 1268, 1283, 1309, 1320, 1342, 1355, 1445, 1459, 1464, 1472, 1488, 1498, 1502, 1510, 1514, 1531, 1534]}, \"attach_doc_fact\": [{\"no\": 13, \"time\": \"昨天\", \"location\": \"大连市甘井子区立元洗浴中心二楼的换衣室\", \"people\": [\"张继彪\"], \"content\": [525, 571]}, {\"no\": 14, \"time\": \"今年\", \"location\": \"黑龙江\", \"people\": [\"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [582, 629]}, {\"no\": 15, \"time\": \"今年\", \"location\": \"\", \"people\": [\"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [629, 674]}, {\"no\": 16, \"time\": \"昨天\", \"location\": \"立元洗浴中心\", \"people\": [\"张继彪\", \"双牙子\", \"乐颐\", \"刘景全\", \"我\"], \"content\": [819, 900]}, {\"no\": 17, \"time\": \"晚上12时左右\", \"location\": \"\", \"people\": [\"张继彪\", \"刘景全\", \"我\"], \"content\": [900, 1071]}]}], \"relationship\": [[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]}', 16, '2020-09-13 17:53:38', 'admin', '2020-09-13 17:53:38', 'admin');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '深黑主题theme-dark，浅色主题theme-light，深蓝主题theme-blue');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '是否开启注册用户功能');
INSERT INTO `sys_config` VALUES (5, '用户管理-密码字符范围', 'sys.account.chrtype', '0', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认任意字符范围，0任意（密码可以输入任意字符），1数字（密码只能为0-9数字），2英文字母（密码只能为a-z和A-Z字母），3字母和数字（密码必须包含字母，数字）,4字母数组和特殊字符（密码必须包含字母，数字，特殊字符-_）');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', '某检察院', 0, '包拯', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 16:51:42');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '第一检察部', 1, '张飞', '15888888888', 'jcb@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 16:51:13');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 100, '0,100', '第二检察部', 2, '李逵', '15888888888', 'jcb@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 16:51:33');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (110, 100, '0,100', '第三检察部', 3, '', '', '', '0', '0', 'admin', '2020-09-10 15:02:42', 'admin', '2020-09-13 16:51:42');
INSERT INTO `sys_dept` VALUES (111, 100, '0,100', '第四检察部', 4, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:04', '', NULL);
INSERT INTO `sys_dept` VALUES (112, 100, '0,100', '第五检察部', 5, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:12', '', NULL);
INSERT INTO `sys_dept` VALUES (113, 100, '0,100', '第六检察部', 6, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:22', '', NULL);
INSERT INTO `sys_dept` VALUES (114, 100, '0,100', '第七检察部', 7, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:35', '', NULL);
INSERT INTO `sys_dept` VALUES (115, 100, '0,100', '第八检察部', 8, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:44', '', NULL);
INSERT INTO `sys_dept` VALUES (116, 100, '0,100', '第九检察部', 9, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:52:56', '', NULL);
INSERT INTO `sys_dept` VALUES (117, 100, '0,100', '案件管理办公室', 10, NULL, NULL, NULL, '0', '0', 'admin', '2020-09-13 16:53:05', '', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
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
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2020-09-10 15:38:03');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2020-09-10 15:38:15');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 18:10:25');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 18:17:07');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 18:29:31');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-11 18:29:51');
INSERT INTO `sys_logininfor` VALUES (138, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 18:29:58');
INSERT INTO `sys_logininfor` VALUES (139, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-11 18:30:14');
INSERT INTO `sys_logininfor` VALUES (140, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:19:20');
INSERT INTO `sys_logininfor` VALUES (141, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:25:11');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-11 19:26:19');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:26:21');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-11 19:34:10');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:34:17');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:38:32');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:40:54');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-11 19:41:33');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:41:53');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:42:26');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:43:43');
INSERT INTO `sys_logininfor` VALUES (152, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-11 19:44:15');
INSERT INTO `sys_logininfor` VALUES (153, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-11 19:46:22');
INSERT INTO `sys_logininfor` VALUES (154, 'admin', '172.29.30.25', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2020-09-11 20:03:27');
INSERT INTO `sys_logininfor` VALUES (155, 'admin', '172.29.30.25', '内网IP', 'Safari', 'Mac OS X', '0', '登录成功', '2020-09-11 20:39:08');
INSERT INTO `sys_logininfor` VALUES (156, 'admin', '172.29.30.25', '内网IP', 'Safari', 'Mac OS X', '0', '退出成功', '2020-09-11 20:39:20');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 16:49:28');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:02:24');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:02:35');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:11:29');
INSERT INTO `sys_logininfor` VALUES (161, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误1次', '2020-09-13 17:11:40');
INSERT INTO `sys_logininfor` VALUES (162, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '密码输入错误2次', '2020-09-13 17:11:44');
INSERT INTO `sys_logininfor` VALUES (163, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:11:53');
INSERT INTO `sys_logininfor` VALUES (164, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:12:06');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:12:10');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:15:48');
INSERT INTO `sys_logininfor` VALUES (167, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:15:57');
INSERT INTO `sys_logininfor` VALUES (168, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:16:28');
INSERT INTO `sys_logininfor` VALUES (169, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:16:31');
INSERT INTO `sys_logininfor` VALUES (170, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:21:58');
INSERT INTO `sys_logininfor` VALUES (171, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-13 17:22:08');
INSERT INTO `sys_logininfor` VALUES (172, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:22:16');
INSERT INTO `sys_logininfor` VALUES (173, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:22:56');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:23:19');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:23:54');
INSERT INTO `sys_logininfor` VALUES (176, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:24:04');
INSERT INTO `sys_logininfor` VALUES (177, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:25:52');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:25:55');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:27:17');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:28:27');
INSERT INTO `sys_logininfor` VALUES (181, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:28:37');
INSERT INTO `sys_logininfor` VALUES (182, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:28:48');
INSERT INTO `sys_logininfor` VALUES (183, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:28:55');
INSERT INTO `sys_logininfor` VALUES (184, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:29:02');
INSERT INTO `sys_logininfor` VALUES (185, 'admin_case', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:29:09');
INSERT INTO `sys_logininfor` VALUES (186, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-13 17:29:20');
INSERT INTO `sys_logininfor` VALUES (187, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:29:22');
INSERT INTO `sys_logininfor` VALUES (188, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:29:37');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:29:41');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:30:47');
INSERT INTO `sys_logininfor` VALUES (191, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:30:58');
INSERT INTO `sys_logininfor` VALUES (192, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:31:07');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-13 17:31:14');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:31:17');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:31:56');
INSERT INTO `sys_logininfor` VALUES (196, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '1', '验证码错误', '2020-09-13 17:32:03');
INSERT INTO `sys_logininfor` VALUES (197, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:32:07');
INSERT INTO `sys_logininfor` VALUES (198, 'admin_inner', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:32:24');
INSERT INTO `sys_logininfor` VALUES (199, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:32:30');
INSERT INTO `sys_logininfor` VALUES (200, 'admin_doc', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:33:05');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:36:31');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:40:18');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '退出成功', '2020-09-13 17:41:22');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 8', 'Windows 10', '0', '登录成功', '2020-09-13 17:41:29');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `target` varchar(20) DEFAULT '' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3023 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
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
INSERT INTO `sys_menu` VALUES (2002, '笔录信息查询', 2001, 1, '#', 'menuItem', 'F', '0', 'edoc:lowrecordinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:30:08', '');
INSERT INTO `sys_menu` VALUES (2003, '笔录信息新增', 2001, 2, '#', 'menuItem', 'F', '0', 'edoc:lowrecordinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:30:16', '');
INSERT INTO `sys_menu` VALUES (2004, '笔录信息修改', 2001, 3, '#', 'menuItem', 'F', '0', 'edoc:lowrecordinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:30:26', '');
INSERT INTO `sys_menu` VALUES (2005, '笔录信息删除', 2001, 4, '#', 'menuItem', 'F', '0', 'edoc:lowrecordinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:30:35', '');
INSERT INTO `sys_menu` VALUES (2006, '笔录信息导出', 2001, 5, '#', 'menuItem', 'F', '0', 'edoc:lowrecordinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:30:44', '');
INSERT INTO `sys_menu` VALUES (2007, '案件信息管理', 2000, 1, '/edoc/lawcaseinfo', 'menuItem', 'C', '1', 'edoc:lawcaseinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 19:08:33', '案件信息管理菜单');
INSERT INTO `sys_menu` VALUES (2008, '案件信息管理查询', 2007, 1, '#', 'menuItem', 'F', '0', 'edoc:lawcaseinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:17:55', '');
INSERT INTO `sys_menu` VALUES (2009, '案件信息管理新增', 2007, 2, '#', 'menuItem', 'F', '0', 'edoc:lawcaseinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:20:16', '');
INSERT INTO `sys_menu` VALUES (2010, '案件信息管理修改', 2007, 3, '#', 'menuItem', 'F', '0', 'edoc:lawcaseinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:19:11', '');
INSERT INTO `sys_menu` VALUES (2011, '案件信息管理删除', 2007, 4, '#', 'menuItem', 'F', '0', 'edoc:lawcaseinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:19:26', '');
INSERT INTO `sys_menu` VALUES (2012, '案件信息管理导出', 2007, 5, '#', 'menuItem', 'F', '0', 'edoc:lawcaseinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-09-13 17:20:39', '');
INSERT INTO `sys_menu` VALUES (2013, '起诉文书信息', 2000, 2, '/edoc/indictmentinfo', 'menuItem', 'C', '0', 'edoc:indictmentinfo:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2020-08-20 23:46:02', '起诉文书信息菜单');
INSERT INTO `sys_menu` VALUES (2014, '起诉文书信息查询', 2013, 1, '#', '', 'F', '0', 'edoc:indictmentinfo:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2015, '起诉文书信息新增', 2013, 2, '#', '', 'F', '0', 'edoc:indictmentinfo:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2016, '起诉文书信息修改', 2013, 3, '#', '', 'F', '0', 'edoc:indictmentinfo:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2017, '起诉文书信息删除', 2013, 4, '#', '', 'F', '0', 'edoc:indictmentinfo:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2018, '起诉文书信息导出', 2013, 5, '#', '', 'F', '0', 'edoc:indictmentinfo:export', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (2019, '上传新案件', 2000, 0, '/edoc/upload', 'menuItem', 'C', '0', 'edoc:upload', '#', 'admin', '2020-08-25 12:11:30', 'admin', '2020-09-13 17:26:41', '');
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
INSERT INTO `sys_menu` VALUES (3022, '案卷上传请求', 2019, 1, '#', 'menuItem', 'F', '0', 'edoc:upload:request', '#', 'admin', '2020-09-13 17:23:51', 'admin', '2020-09-13 17:27:15', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(2000) DEFAULT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (142, '登陆日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"131,130,129,128,127,126,125,124,123,122\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:05:20');
INSERT INTO `sys_oper_log` VALUES (143, '登陆日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"121,120,119,118,117,116,115,114,113,112\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:05:24');
INSERT INTO `sys_oper_log` VALUES (144, '登陆日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"111,110,109,108,107,106,105,104,103,102\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:05:27');
INSERT INTO `sys_oper_log` VALUES (145, '登陆日志', 3, 'com.ruoyi.web.controller.monitor.SysLogininforController.remove()', 'POST', 1, 'admin', '研发部门', '/monitor/logininfor/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"101,100\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:05:30');
INSERT INTO `sys_oper_log` VALUES (146, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateAvatar()', 'POST', 1, 'admin', '办案部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:09:13');
INSERT INTO `sys_oper_log` VALUES (147, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"3\"],\"deptId\":[\"110\"],\"userName\":[\"小张\"],\"dept.deptName\":[\"档案部门\"],\"phonenumber\":[\"13941100005\"],\"email\":[\"doc_user1@163.com\"],\"loginName\":[\"doc_user1\"],\"sex\":[\"1\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:10:20');
INSERT INTO `sys_oper_log` VALUES (148, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '研发部门', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"userName\":[\"小李\"],\"deptName\":[\"办案部门\"],\"phonenumber\":[\"13941100002\"],\"email\":[\"doc_user2@163.com\"],\"loginName\":[\"case_user1\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-10 15:11:06');
INSERT INTO `sys_oper_log` VALUES (149, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"某检察院\"],\"deptName\":[\"办案部门\"],\"orderNum\":[\"1\"],\"leader\":[\"李逵\"],\"phone\":[\"15888888888\"],\"email\":[\"ry@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:50:29');
INSERT INTO `sys_oper_log` VALUES (150, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"parentId\":[\"100\"],\"parentName\":[\"某检察院\"],\"deptName\":[\"档案部门\"],\"orderNum\":[\"2\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:50:37');
INSERT INTO `sys_oper_log` VALUES (151, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"parentId\":[\"100\"],\"parentName\":[\"某检察院\"],\"deptName\":[\"第一检察部\"],\"orderNum\":[\"1\"],\"leader\":[\"张飞\"],\"phone\":[\"15888888888\"],\"email\":[\"jcb@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:51:13');
INSERT INTO `sys_oper_log` VALUES (152, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"103\"],\"parentId\":[\"100\"],\"parentName\":[\"某检察院\"],\"deptName\":[\"第二检察部\"],\"orderNum\":[\"2\"],\"leader\":[\"李逵\"],\"phone\":[\"15888888888\"],\"email\":[\"jcb@qq.com\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:51:33');
INSERT INTO `sys_oper_log` VALUES (153, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/edit', '127.0.0.1', '内网IP', '{\"deptId\":[\"110\"],\"parentId\":[\"100\"],\"parentName\":[\"某检察院\"],\"deptName\":[\"第三检察部\"],\"orderNum\":[\"3\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:51:42');
INSERT INTO `sys_oper_log` VALUES (154, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第四检察部\"],\"orderNum\":[\"4\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:04');
INSERT INTO `sys_oper_log` VALUES (155, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第五检察部\"],\"orderNum\":[\"5\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:12');
INSERT INTO `sys_oper_log` VALUES (156, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第六检察部\"],\"orderNum\":[\"6\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:22');
INSERT INTO `sys_oper_log` VALUES (157, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第七检察部\"],\"orderNum\":[\"7\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:35');
INSERT INTO `sys_oper_log` VALUES (158, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第八检察部\"],\"orderNum\":[\"8\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:44');
INSERT INTO `sys_oper_log` VALUES (159, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"第九检察部\"],\"orderNum\":[\"9\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:52:56');
INSERT INTO `sys_oper_log` VALUES (160, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/dept/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"100\"],\"deptName\":[\"案件管理办公室\"],\"orderNum\":[\"10\"],\"leader\":[\"\"],\"phone\":[\"\"],\"email\":[\"\"],\"status\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:53:05');
INSERT INTO `sys_oper_log` VALUES (161, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"1\"],\"postName\":[\"部门领导\"],\"postCode\":[\"dev_mng\"],\"postSort\":[\"1\"],\"status\":[\"0\"],\"remark\":[\"部门正职、副职领导；负责部门所有承办人办理案件的电子卷宗数据的增、删、改、查。\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:54:21');
INSERT INTO `sys_oper_log` VALUES (162, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"2\"],\"postName\":[\"承办人\"],\"postCode\":[\"dep_person\"],\"postSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"承办案件的办案人员，对承办案件的电子卷宗数据的增、删、改、查。\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:55:07');
INSERT INTO `sys_oper_log` VALUES (163, '岗位管理', 2, 'com.ruoyi.web.controller.system.SysPostController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/post/edit', '127.0.0.1', '内网IP', '{\"postId\":[\"5\"],\"postName\":[\"内勤\"],\"postCode\":[\"dep_inner\"],\"postSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"承办人所在的业务部门的内勤人员，上传电子卷宗文件。\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:55:40');
INSERT INTO `sys_oper_log` VALUES (164, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"案卷管理员\"],\"roleKey\":[\"doc\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2001,2002,2003,2004,2005,2006\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:58:10');
INSERT INTO `sys_oper_log` VALUES (165, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"案卷承办人\"],\"roleKey\":[\"case\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018,2001,2002,2003,2004,2005,2006\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:58:46');
INSERT INTO `sys_oper_log` VALUES (166, '角色管理', 1, 'com.ruoyi.web.controller.system.SysRoleController.addSave()', 'POST', 1, 'admin', '办案部门', '/system/role/add', '127.0.0.1', '内网IP', '{\"roleName\":[\"案卷内勤\"],\"roleKey\":[\"inner\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2019\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 16:59:25');
INSERT INTO `sys_oper_log` VALUES (167, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.editSave()', 'POST', 1, 'admin', '办案部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\"userId\":[\"1\"],\"deptId\":[\"103\"],\"userName\":[\"管理员\"],\"dept.deptName\":[\"第二检察部\"],\"phonenumber\":[\"15888888888\"],\"email\":[\"ry@163.com\"],\"loginName\":[\"admin\"],\"sex\":[\"0\"],\"role\":[\"1\"],\"remark\":[\"管理员\"],\"status\":[\"0\"],\"roleIds\":[\"1\"],\"postIds\":[\"\"]}', 'null', 1, '不允许操作超级管理员用户', '2020-09-13 17:00:23');
INSERT INTO `sys_oper_log` VALUES (168, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"案卷承办人\"],\"roleKey\":[\"case\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2012,2013,2014,2015,2016,2017,2018\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:05:54');
INSERT INTO `sys_oper_log` VALUES (169, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"117\"],\"userName\":[\"案卷内勤人员\"],\"deptName\":[\"案件管理办公室\"],\"phonenumber\":[\"15888888889\"],\"email\":[\"inner@163.com\"],\"loginName\":[\"admin_inner\"],\"sex\":[\"0\"],\"role\":[\"4\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"4\"],\"postIds\":[\"5\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:09:13');
INSERT INTO `sys_oper_log` VALUES (170, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '第二检察部', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"4\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:09:54');
INSERT INTO `sys_oper_log` VALUES (171, '用户管理', 3, 'com.ruoyi.web.controller.system.SysUserController.remove()', 'POST', 1, 'admin', '第二检察部', '/system/user/remove', '127.0.0.1', '内网IP', '{\"ids\":[\"3\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:10:00');
INSERT INTO `sys_oper_log` VALUES (172, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"案卷管理员\"],\"deptName\":[\"第一检察部\"],\"phonenumber\":[\"15888888887\"],\"email\":[\"doc@163.com\"],\"loginName\":[\"admin_doc\"],\"sex\":[\"0\"],\"role\":[\"2\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"2\"],\"postIds\":[\"1\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:10:48');
INSERT INTO `sys_oper_log` VALUES (173, '用户管理', 1, 'com.ruoyi.web.controller.system.SysUserController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/add', '127.0.0.1', '内网IP', '{\"deptId\":[\"101\"],\"userName\":[\"案卷承办人\"],\"deptName\":[\"第一检察部\"],\"phonenumber\":[\"15888888877\"],\"email\":[\"case@163.com\"],\"loginName\":[\"admin_case\"],\"sex\":[\"0\"],\"role\":[\"3\"],\"remark\":[\"\"],\"status\":[\"0\"],\"roleIds\":[\"3\"],\"postIds\":[\"2\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:11:26');
INSERT INTO `sys_oper_log` VALUES (174, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.authDataScopeSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/authDataScope', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"案卷内勤\"],\"roleKey\":[\"inner\"],\"dataScope\":[\"1\"],\"deptIds\":[\"\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:12:52');
INSERT INTO `sys_oper_log` VALUES (175, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2008\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:17:55');
INSERT INTO `sys_oper_log` VALUES (176, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:18:05');
INSERT INTO `sys_oper_log` VALUES (177, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoclawcaseinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:18:17');
INSERT INTO `sys_oper_log` VALUES (178, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:18:56');
INSERT INTO `sys_oper_log` VALUES (179, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2010\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:19:11');
INSERT INTO `sys_oper_log` VALUES (180, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2011\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:19:26');
INSERT INTO `sys_oper_log` VALUES (181, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2009\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:20:16');
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2012\"],\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:20:39');
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2012\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:list\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:21:17');
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '第二检察部', '/system/menu/remove/3020', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:21:44');
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2007\"],\"menuType\":[\"F\"],\"menuName\":[\"案件信息管理列表\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:list\"],\"orderNum\":[\"6\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:21:55');
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.addSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/add', '127.0.0.1', '内网IP', '{\"parentId\":[\"2019\"],\"menuType\":[\"F\"],\"menuName\":[\"案卷上传\"],\"url\":[\"\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:upload\"],\"orderNum\":[\"1\"],\"icon\":[\"\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:23:51');
INSERT INTO `sys_oper_log` VALUES (187, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3022\"],\"parentId\":[\"2019\"],\"menuType\":[\"F\"],\"menuName\":[\"案卷上传页面\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:upload:index\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:26:16');
INSERT INTO `sys_oper_log` VALUES (188, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2019\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"上传新案件\"],\"url\":[\"/edoc/upload\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:upload\"],\"orderNum\":[\"0\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:26:41');
INSERT INTO `sys_oper_log` VALUES (189, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"3022\"],\"parentId\":[\"2019\"],\"menuType\":[\"F\"],\"menuName\":[\"案卷上传请求\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:upload:request\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:27:15');
INSERT INTO `sys_oper_log` VALUES (190, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2002\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"笔录信息查询\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lowrecordinfo:list\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:30:08');
INSERT INTO `sys_oper_log` VALUES (191, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2003\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"笔录信息新增\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lowrecordinfo:add\"],\"orderNum\":[\"2\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:30:16');
INSERT INTO `sys_oper_log` VALUES (192, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2004\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"笔录信息修改\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lowrecordinfo:edit\"],\"orderNum\":[\"3\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:30:26');
INSERT INTO `sys_oper_log` VALUES (193, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2005\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"笔录信息删除\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lowrecordinfo:remove\"],\"orderNum\":[\"4\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:30:35');
INSERT INTO `sys_oper_log` VALUES (194, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2006\"],\"parentId\":[\"2001\"],\"menuType\":[\"F\"],\"menuName\":[\"笔录信息导出\"],\"url\":[\"#\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lowrecordinfo:export\"],\"orderNum\":[\"5\"],\"icon\":[\"#\"],\"visible\":[\"0\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:30:44');
INSERT INTO `sys_oper_log` VALUES (195, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"5\"],\"loginName\":[\"admin_inner\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:31:41');
INSERT INTO `sys_oper_log` VALUES (196, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"6\"],\"loginName\":[\"admin_doc\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:31:48');
INSERT INTO `sys_oper_log` VALUES (197, '重置密码', 2, 'com.ruoyi.web.controller.system.SysUserController.resetPwdSave()', 'POST', 1, 'admin', '第二检察部', '/system/user/resetPwd', '127.0.0.1', '内网IP', '{\"userId\":[\"7\"],\"loginName\":[\"admin_case\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:31:54');
INSERT INTO `sys_oper_log` VALUES (198, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"4\"],\"roleName\":[\"案卷内勤\"],\"roleKey\":[\"inner\"],\"roleSort\":[\"4\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2019,3022\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:37:00');
INSERT INTO `sys_oper_log` VALUES (199, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"3\"],\"roleName\":[\"案卷承办人\"],\"roleKey\":[\"case\"],\"roleSort\":[\"3\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:37:24');
INSERT INTO `sys_oper_log` VALUES (200, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"案卷管理员\"],\"roleKey\":[\"doc\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017,2018,2001,2002,2003,2004,2005,2006\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:37:32');
INSERT INTO `sys_oper_log` VALUES (201, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.editSave()', 'POST', 1, 'admin', '第二检察部', '/system/role/edit', '127.0.0.1', '内网IP', '{\"roleId\":[\"2\"],\"roleName\":[\"案卷管理员\"],\"roleKey\":[\"doc\"],\"roleSort\":[\"2\"],\"status\":[\"0\"],\"remark\":[\"普通角色\"],\"menuIds\":[\"2000,2007,2008,2009,2010,2011,2013,2014,2015,2016,2017,2001,2002,2003,2004,2005\"]}', '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:37:51');
INSERT INTO `sys_oper_log` VALUES (202, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'GET', 1, 'admin', '第二检察部', '/system/menu/remove/3021', '127.0.0.1', '内网IP', NULL, '{\r\n  \"msg\" : \"操作成功\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:38:17');
INSERT INTO `sys_oper_log` VALUES (203, '用户管理', 5, 'com.ruoyi.web.controller.system.SysUserController.export()', 'POST', 1, 'admin', '第二检察部', '/system/user/export', '127.0.0.1', '内网IP', '{\"deptId\":[\"\"],\"parentId\":[\"\"],\"loginName\":[\"\"],\"phonenumber\":[\"\"],\"status\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', '{\r\n  \"msg\" : \"94a782f1-03ed-4137-807e-24823fa79d7b_用户数据.xlsx\",\r\n  \"code\" : 0\r\n}', 0, NULL, '2020-09-13 17:42:03');
INSERT INTO `sys_oper_log` VALUES (204, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.editSave()', 'POST', 1, 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', '内网IP', '{\"menuId\":[\"2007\"],\"parentId\":[\"2000\"],\"menuType\":[\"C\"],\"menuName\":[\"案件信息管理\"],\"url\":[\"/edoc/lawcaseinfo\"],\"target\":[\"menuItem\"],\"perms\":[\"edoc:lawcaseinfo:view\"],\"orderNum\":[\"1\"],\"icon\":[\"#\"],\"visible\":[\"1\"]}', '{\n  \"msg\" : \"操作成功\",\n  \"code\" : 0\n}', 0, NULL, '2020-09-13 19:08:33');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'dev_mng', '部门领导', 1, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 16:54:21', '部门正职、副职领导；负责部门所有承办人办理案件的电子卷宗数据的增、删、改、查。');
INSERT INTO `sys_post` VALUES (2, 'dep_person', '承办人', 2, '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 16:55:07', '承办案件的办案人员，对承办案件的电子卷宗数据的增、删、改、查。');
INSERT INTO `sys_post` VALUES (5, 'dep_inner', '内勤', 3, '0', 'admin', '2020-09-10 15:00:21', 'admin', '2020-09-13 16:55:40', '承办人所在的业务部门的内勤人员，上传电子卷宗文件。');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '超级管理员');
INSERT INTO `sys_role` VALUES (2, '案卷管理员', 'doc', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2020-09-13 17:37:50', '普通角色');
INSERT INTO `sys_role` VALUES (3, '案卷承办人', 'case', 3, '1', '0', '0', 'admin', '2020-09-10 15:01:39', 'admin', '2020-09-13 17:37:24', '普通角色');
INSERT INTO `sys_role` VALUES (4, '案卷内勤', 'inner', 4, '1', '0', '0', 'admin', '2020-09-13 16:59:25', 'admin', '2020-09-13 17:37:00', '普通角色');
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 2000);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2002);
INSERT INTO `sys_role_menu` VALUES (2, 2003);
INSERT INTO `sys_role_menu` VALUES (2, 2004);
INSERT INTO `sys_role_menu` VALUES (2, 2005);
INSERT INTO `sys_role_menu` VALUES (2, 2007);
INSERT INTO `sys_role_menu` VALUES (2, 2008);
INSERT INTO `sys_role_menu` VALUES (2, 2009);
INSERT INTO `sys_role_menu` VALUES (2, 2010);
INSERT INTO `sys_role_menu` VALUES (2, 2011);
INSERT INTO `sys_role_menu` VALUES (2, 2013);
INSERT INTO `sys_role_menu` VALUES (2, 2014);
INSERT INTO `sys_role_menu` VALUES (2, 2015);
INSERT INTO `sys_role_menu` VALUES (2, 2016);
INSERT INTO `sys_role_menu` VALUES (2, 2017);
INSERT INTO `sys_role_menu` VALUES (3, 2000);
INSERT INTO `sys_role_menu` VALUES (3, 2007);
INSERT INTO `sys_role_menu` VALUES (3, 2008);
INSERT INTO `sys_role_menu` VALUES (3, 2009);
INSERT INTO `sys_role_menu` VALUES (3, 2010);
INSERT INTO `sys_role_menu` VALUES (3, 2011);
INSERT INTO `sys_role_menu` VALUES (3, 2013);
INSERT INTO `sys_role_menu` VALUES (3, 2014);
INSERT INTO `sys_role_menu` VALUES (3, 2015);
INSERT INTO `sys_role_menu` VALUES (3, 2016);
INSERT INTO `sys_role_menu` VALUES (3, 2017);
INSERT INTO `sys_role_menu` VALUES (4, 2000);
INSERT INTO `sys_role_menu` VALUES (4, 2019);
INSERT INTO `sys_role_menu` VALUES (4, 3022);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 01注册用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '管理员', '00', 'ry@163.com', '15888888888', '0', '/profile/avatar/2020/09/10/db3061a8-a85f-457a-ab9b-75cd4edd3032.png', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2020-09-13 17:41:30', 'admin', '2018-03-16 11:33:00', 'ry', '2020-09-13 17:41:29', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '用户1', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '2', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');
INSERT INTO `sys_user` VALUES (3, 110, 'doc_user1', '小张', '00', 'doc_user1@163.com', '13941100005', '1', '', 'cc94e4e8e90830c0dc363567dd9d5c81', 'fc2668', '0', '2', '', NULL, 'admin', '2020-09-10 15:04:05', 'admin', '2020-09-10 15:10:20', '');
INSERT INTO `sys_user` VALUES (4, 103, 'case_user1', '小李', '00', 'doc_user2@163.com', '13941100002', '0', '', '0398fd733ddd5a4fe0161d3ad901c515', '3fda37', '0', '2', '', NULL, 'admin', '2020-09-10 15:11:06', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, 117, 'admin_inner', '案卷内勤人员', '00', 'inner@163.com', '15888888889', '0', '', 'af02f467b9c2983f4b1412fdfc501270', '4cf316', '0', '0', '127.0.0.1', '2020-09-13 17:32:07', 'admin', '2020-09-13 17:09:13', '', '2020-09-13 17:32:07', NULL);
INSERT INTO `sys_user` VALUES (6, 101, 'admin_doc', '案卷管理员', '00', 'doc@163.com', '15888888887', '0', '', '6c5c67097b27e728df4f0196fa2611af', '8a39fa', '0', '0', '127.0.0.1', '2020-09-13 17:32:30', 'admin', '2020-09-13 17:10:48', '', '2020-09-13 17:32:30', NULL);
INSERT INTO `sys_user` VALUES (7, 101, 'admin_case', '案卷承办人', '00', 'case@163.com', '15888888877', '0', '', 'd6b698f7c33ec85b0550ffe23e6f43e2', '6ead92', '0', '0', '127.0.0.1', '2020-09-13 17:29:03', 'admin', '2020-09-13 17:11:26', '', '2020-09-13 17:31:54', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(11) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_online` VALUES ('302222ba-f5c4-4994-9071-a4ddd32cb99b', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 8', 'Mac OS X', 'on_line', '2020-09-13 18:34:00', '2020-09-13 19:08:02', 1800000);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
INSERT INTO `sys_user_post` VALUES (3, 2);
INSERT INTO `sys_user_post` VALUES (4, 5);
INSERT INTO `sys_user_post` VALUES (5, 5);
INSERT INTO `sys_user_post` VALUES (6, 1);
INSERT INTO `sys_user_post` VALUES (7, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
INSERT INTO `sys_user_role` VALUES (4, 3);
INSERT INTO `sys_user_role` VALUES (5, 4);
INSERT INTO `sys_user_role` VALUES (6, 2);
INSERT INTO `sys_user_role` VALUES (7, 3);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
