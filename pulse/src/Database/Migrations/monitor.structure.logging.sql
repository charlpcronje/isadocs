
/*
 DATABASE MIGRATION 	: V1.3
 
 AFFECTED SYSTEM		: Pulse
 MIGRATION TYPE			: [alter,insert]
 TARGET SCHEMA			: `monitor`
 TARGET TABLE			: `monitor_platform`
 DATE					: 2021-10-14 11:07:56
 AUTHOR					: Charl Cronje 
*/
-- ----------------------------	
-- OPTIONAL UPDATES FOR DEF ONLY
-- ----------------------------
-- 1.3.1Add record in monitor_agent_requirements 
-- ----------------------------	
ALTER TABLE `monitor`.`monitor_structure` 
ADD CONSTRAINT `types` FOREIGN KEY (`type_id`) REFERENCES `monitor`.`monitor_types` (`type_id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

-- ----------------------------	
-- 1.3.2 Idea for new table alterations
-- ----------------------------	
ALTER TABLE `monitor`.`monitor_structure` 
ADD COLUMN `global_structure_id` VARCHAR(11) NULL AFTER `monitor_agent_id`;
# Create a unique identifier to be used accross the entire system for each different Tuple
UPDATE `monitor`.`monitor_structure` 
SET `global_structure_id` = CONCAT_WS('#',`monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`);

-- ----------------------------	
-- 1.3.3 ADD COLUMN FOR SELF LOGGING
-- ----------------------------	
ALTER TABLE `monitor`.`monitor_structure` 
ADD COLUMN `insert_dtime` timestamp NULL DEFAULT '1980-01-01 00:00:00' AFTER `global_structure_id`,
ADD COLUMN `update_dtime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP AFTER `insert_dtime`


