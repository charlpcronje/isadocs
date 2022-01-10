/*
 DATABASE MIGRATION 	 : V1.0
 
 AFFECTED SYSTEM			 : Pulse
 MIGRATION TYPE				 : Create Table
 TARGET SCHEMA				 : `monitor`
 DATE									 : 2021-10-14 11:07:56
 AUTHOR								 : Charl Cronje 
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- 1.0.1 Table structure for monitor_types
-- ----------------------------
# DROP TABLE IF EXISTS `monitor_types`;
CREATE TABLE `monitor_types`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ref_table` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;

/*
 DATABASE MIGRATION 	 : V1.1
 
 AFFECTED SYSTEM			 : Pulse
 MIGRATION TYPE				 : insert
 TARGET SCHEMA				 : `monitor`
 TARGET TABLE					 : [{`monitor_application`},{`monitor_platform`},{`monitor_structure`},{`ssh_config`},
											 : {`agent_data`},{`hostname`},{`checks_sysinfo`},{`monitor_agent_requirements`},
											 : {`monitor_agent_identifier`},{`monitor_checktype_linking`}]
 DATE									 : 2021-10-14 11:07:56
 AUTHOR								 : Charl Cronje 
*/
-- ----------------------------
-- 1.1.1 Add New Monitor Appilication / Appliance
-- ----------------------------
INSERT INTO `monitor`.`monitor_application` (`monitor_application_id`,`name`) VALUES (35,'FortiWeb Web Application Firewall')

-- ----------------------------
-- 1.1.2 Add Fortinet FortiWeb Platform
-- ----------------------------
INSERT INTO 
		`monitor`.`monitor_platform` (`monitor_platform_id`,`name`) 
	VALUES 
		(22,'Fortinet FortiWeb Platform');

-- ----------------------------		
-- 1.1.3 Link the platform in the Monitor Structure Tree
-- ----------------------------
INSERT INTO 
		`monitor`.`monitor_structure` (`ref_id`, `monitor_platform_id`) 
	VALUES 
		(22, 22);
		
-- ----------------------------		
-- 1.1.4 SSL Config
-- ----------------------------
INSERT INTO `ssh_config` (`siteid`, `hostid`, `ip_addr`, `ssh_username`, `ssh_password`, `ssh_enable_password`, `last_timestamp`, `reset_command_period`, `reset_command_check`) VALUES (170, 6774, '192.168.20.81', 'admin', 'clove2Bi', '', 0, 0, 0);

-- ----------------------------		
-- 1.1.5 Add link betweem Fortinet FortiWeb Plantform and Fortinet OS in the Structure Tree
-- ----------------------------	
INSERT INTO 
		`monitor`.`monitor_structure`(`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`) 
	VALUES 
		(257, 1, 8, 22, 8);

-- ----------------------------	
-- 1.1.6 Add link betweem Fortinet FortiWeb Plantform, Fortinet OS, FortinetForinet SSH Agent in the Structure Tree
-- ----------------------------	
INSERT INTO 
		`monitor`.`monitor_structure` (`monitor_structure_id`, `parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
	VALUES 
		(259, 258, 3, 14, 22, 8, 0, 14);
		
-- ----------------------------	
-- 1.1.7 Add link betweem Fortinet FortiWeb Plantform, Fortinet OS and FortiWeb Web Application Firewall Application in the -- Structure Tree
-- ----------------------------	
INSERT INTO `monitor`.`monitor_structure` (`monitor_structure_id`, `parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`) VALUES (260, 259, 2, 12, 8, 8, 35);
		
-- ----------------------------	
-- 1.1.8 agent_data
-- ----------------------------	
INSERT INTO `agent_data` VALUES (170, 6774, 'FortiWeb', 'SSH_FORTIOS_EXPECT', '1.4.0-0', '2021-10-15 17:40:05', '2021-10-15 17:39:02', 1634312341, '-1', '0', 0, 0, '');

-- ----------------------------	
-- 1.1.9 `hostname`
-- ----------------------------	
INSERT INTO `hostname` VALUES (6774, 'FortiWeb', 'FortiWeb1', '', 771, '', 3, '', 'FortiWeb3', 'MSS', 0, 0, '', 1, '', 0, 0, '0', '0', 0, 0, 0, 124, '', 22, 8, 14, '35', '1634047769', 0, '1634286475', 0, 1, NULL, NULL, '', '', '', '', '');		
		
-- ----------------------------	
-- 1.1.10 NOT SURE IF THESE WERE AUTO INSERTED BY THE SYSTEM
-- ----------------------------	
INSERT INTO `checks_sysinfo` (`id`, `name`, `warning_threshhold`, `critical_threshhold`, `warning_email`, `critical_email`, `hostname`, `host_id`, `siteid`, `w_sd`, `w_ad`, `w_acb`, `c_sd`, `c_ad`, `c_acb`, `time_period_type_id`, `checktype_id`) VALUES (895, 'SYSINFO_OS', '', '', '', '', 'FortiWeb', 6774, 170, 0, 0, 0, 0, 0, 0, 6, 85);
INSERT INTO `checks_sysinfo` (`id`, `name`, `warning_threshhold`, `critical_threshhold`, `warning_email`, `critical_email`, `hostname`, `host_id`, `siteid`, `w_sd`, `w_ad`, `w_acb`, `c_sd`, `c_ad`, `c_acb`, `time_period_type_id`, `checktype_id`) VALUES (894, 'SYSINFO_APP', '', '', '', '', 'FortiWeb', 6774, 170, 0, 0, 0, 0, 0, 0, 6, 87);
INSERT INTO `checks_sysinfo` (`id`, `name`, `warning_threshhold`, `critical_threshhold`, `warning_email`, `critical_email`, `hostname`, `host_id`, `siteid`, `w_sd`, `w_ad`, `w_acb`, `c_sd`, `c_ad`, `c_acb`, `time_period_type_id`, `checktype_id`) VALUES (896, 'SYSINFO_PLATFORM', '', '', '', '', 'FortiWeb', 6774, 170, 0, 0, 0, 0, 0, 0, 6, 86);
		
-- ----------------------------	
-- 1.1.11 Add record in monitor_agent_requirements 
-- ----------------------------	
INSERT INTO `monitor`.`monitor_agent_requirements` ( `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_agent_id`, `database_name`, `table_name`, `required_fields` )
VALUES
	(
		22,
		8,
		14,
		'monitor',
		'ssh_config',
	'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password')

-- ----------------------------	
-- 1.1.12 `monitor_agent_identifier`
-- ----------------------------	
INSERT INTO `monitor_agent_identifier`
VALUES
	( 5, 22, 8, 14, 'Hostname', 'hostname', 'text', 1 );
	

-- ----------------------------	
-- 1.1.13 `monitor_checktype_linking`
-- ----------------------------	
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1123, 22, 8, 0, 14, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1124, 22, 8, 0, 14, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1125, 22, 8, 0, 14, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1126, 22, 8, 0, 14, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1127, 22, 8, 0, 14, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1128, 22, 8, 0, 14, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1129, 22, 8, 0, 14, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` (`monitor_checktype_linking_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (1130, 22, 8, 34, 14, 0, 3, 0, 0, 218, 1);