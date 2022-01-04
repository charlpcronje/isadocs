/**
 DATABASE MIGRATION 	 : Create Table
 
 AFFECTED SYSTEM			 : Pulse
 MIGRATION TYPE				 : CREATE TABLE, INSERT
 TARGET SCHEMA				 : `monitor`
 DATE									 : 2021-10-27
 AUTHOR								 : Charl Cronje 
/* By default, MySQL automatically commits the changes permanently to the database. To force MySQL not to commit changes automatically, you use the following statement: */

/**
 * CONFIG START
 * ===========================
 */
SET @previousMigration = '855815_fortigate_fortiGuard_service_status_attribute.sql';
SET @thisMigration = '880892_fortigate_fortiWeb_structure_for_new_monitor_agent.sql';
SET @runPreviousErrorMsg = 'Patch 855815_fortigate_fortiGuard_service_status_attribute.sql has to be run first!';
/**
 * END CONFIG
 * =========================== */


(SELECT 'SET AUTOCOMMIT = 1' AS '');
SET AUTOCOMMIT = 1;

/* CREATE VALIDATION FUNCTIONS */
(SELECT 'Create function to check the auto increment value of a table' AS '');
DROP FUNCTION IF EXISTS fn_get_ai_table;
delimiter $$

CREATE FUNCTION `fn_get_ai_table`(`tableName` VARCHAR(50),`dbName` VARCHAR(50)) RETURNS int(11)
COMMENT 'Get auto increment id from supplied table'
BEGIN
	DECLARE db VARCHAR(50);
    DECLARE aiValue INT;
	IF `dbName` IS NULL THEN SET
        db = DATABASE(); 
    ELSE 
        SET db = dbName; 
    END IF;
    SELECT 
        AUTO_INCREMENT INTO aiValue 
    FROM `information_schema`.`tables` 
    WHERE 
        `table_name` = tableName AND 
        `table_schema` = db;
	RETURN aiValue;
END $$
delimiter ;

(SELECT 'Create function to verify the auto increment after incert' AS '');
DROP FUNCTION IF EXISTS fn_verify_ai;
delimiter $$

CREATE FUNCTION `fn_verify_ai`(`tableName` VARCHAR(50),`inc` VARCHAR(50)) RETURNS VARCHAR(50)
COMMENT 'Check that incomming int is equal to LAST_INSERT_ID()'
BEGIN
	DECLARE db VARCHAR(50);
    SET @aiValue = 0;
    SET @db = DATABASE();
    SET @tabName = tableName;
	SET @incr = inc;

    SELECT 
        AUTO_INCREMENT INTO @aiValue 
    FROM `information_schema`.`tables` 
    WHERE 
        `table_name` = @tabName AND 
        `table_schema` = @db;
    
    SET @incr = @incr + 1;
    if (@incr = @aiValue) THEN
	    RETURN 0;
    ELSE 
        RETURN 1;
    END IF;
END $$
delimiter ;


/* START STOR PROC FOR MIGRATION */
DROP PROCEDURE IF EXISTS updateMonitorStructure;
delimiter $$

(SELECT 'SET AUTOCOMMIT = 0' AS '');
SET AUTOCOMMIT = 0;

SET @successCount = 0;
SET @errorCount = 0;

CREATE PROCEDURE updateMonitorStructure()
updateMonitorStructure_label:BEGIN
    START TRANSACTION;
    SET @prevPatchId = (SELECT id FROM `appliance`.`database_patching` WHERE filename = @previousMigration);
    IF @prevPatchId > 0 THEN 
        SET @thisPatchId = (SELECT id FROM `appliance`.`database_patching` WHERE filename = @thisMigration);
        IF @thisPatchId IS NULL THEN
            /**
            * PLATFORM ATTRIBUTES
            *
            * 1. Getting next auto increment id from table - Checked */
            (SELECT '1. Getting next auto increment id from table` table' AS '');
            SET @monitorApplicationId = (fn_get_ai_table('monitor_application','monitor'));
            
            /* 2. Inserting FortiWeb Web Application Firewall to `monitor_application - Checked */
            (SELECT '2. Inserting FortiWeb Web Application Firewall to monitor_application table' AS '');
            INSERT IGNORE INTO `monitor`.`monitor_application` (`name`) VALUES ('FortiWeb Web Application Firewall');
            SET @errorCount = @errorCount + fn_verify_ai('monitor_application',@monitorApplicationId);

            /* 3. Getting next auto increment id from table - Checked */
            (SELECT '3. Getting next auto increment id from table` table' AS '');
            SET @monitorPlatformId = (fn_get_ai_table('monitor_platform','monitor'));

            /* 4. Inserts new row and get the AUTO_INCREMENT - Checked */
            (SELECT '4. Inserts new row and get the AUTO_INCREMENT` table' AS '');
            INSERT IGNORE INTO `monitor`.`monitor_platform` (`name`) VALUES ('Fortinet FortiWeb Platform');

            /* 5. Link new platform in Monitor Structure - Checked */
            (SELECT '5. Link new platform in Monitor Structure' AS '');
            SET @monitorPlatformStructureId = (fn_get_ai_table('monitor_structure','monitor'));

            /* 6. Link new platform in Monitor Structure */
            (SELECT '6. Link new platform in Monitor Structure' AS '');
            INSERT IGNORE INTO `monitor`.`monitor_structure` 
            (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
                            VALUES 
            (0,0,@monitorPlatformId, @monitorPlatformId, 0, 0, 0);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_structure',@monitorPlatformStructureId));

            /* 7. Link new platform to its Operating System in Monitor Structure - Checked */
            (SELECT '7. Link new platform to its Operating System in Monitor Structure' AS '');	
            SET @operatingSystemId = (SELECT `monitor_operatingSystem_id` FROM `monitor`.`monitor_operatingSystem` WHERE `name` = 'Fortinet FortiOS');
            SET @monitorOSStructureId = (fn_get_ai_table('monitor_structure','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_structure` 
            (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
                            VALUES 
            (@monitorPlatformStructureId, 1,@operatingSystemId, @monitorPlatformId, @operatingSystemId, 0,0);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_structure',@monitorOSStructureId));


            /* 8. Link new platform to its Agent in Monitor Structure - Checked */
            (SELECT '8. Link new platform to its Agent in Monitor Structure' AS '');
            SET @agentId = (SELECT `monitor_agent`.`monitor_agent_id` FROM `monitor`.`monitor_agent` 
                                                                                                            WHERE `monitor_agent`.`name` = 'Server-side SSH agent' AND `monitor_agent`.`monitor_agent_id` = 14);
            IF @agentId != 14 THEN SET @errorCount = @errorCount + 1; END IF;

            SET @monitorAgentStructureId = (fn_get_ai_table('monitor_structure','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_structure` 
            (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
                            VALUES 
            (@monitorOSStructureId,3,@agentId,@monitorPlatformId, @operatingSystemId,0,@agentId);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_structure',@monitorAgentStructureId));

            /* 9. Link new platform to its application in Monitor Structure - Checked */
            (SELECT '9. Link new platform to its application in Monitor Structure' AS '');
            SET @applicationId = (SELECT monitor_application_id FROM `monitor`.`monitor_application` WHERE `name` = 'Server-side SSH agent' ORDER BY monitor_application_id DESC);

            /* 10. Link new cpplication to its platform in Monitor Structure - Checked */
            (SELECT '10. Link new cpplication to its platform in Monitor Structure' AS '');
            SET @monitorApplicationStructureId = (fn_get_ai_table('monitor_structure','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_structure` 
            (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
                            VALUES 
            (@monitorAgentStructureId, 2, @monitorApplicationId, @monitorPlatformId,  @operatingSystemId, @monitorApplicationId,@agentId);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_structure',@monitorApplicationStructureId));

            /* 11. Add new monitor agent requirements - Checked */
            (SELECT '11. Add new monitor agent requirements' AS '');
            SET @agentRequirementsId = (fn_get_ai_table('monitor_agent_requirements','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_agent_requirements` 
            (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_agent_id`, `database_name`, `table_name`, `required_fields`)
                            VALUES 
            (@monitorPlatformId, @operatingSystemId, @agentId, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password|');	
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_agent_requirements',@agentRequirementsId));

            /* 12. Percentage CPU utilisation - Checked */
            (SELECT '12. Linking Checktype: Percentage CPU utilisation' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 75, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 13. Uptime - Checked */
            (SELECT '13. Linking Checktype: Uptime' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 7, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 14. MEM Usage - Checked */
            (SELECT '14. Linking Checktype: MEM Usage' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking` ( `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`,`default`) VALUES (@monitorPlatformId, 8, 0, @agentId , 0, 1, 0, 0, 5, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 15.  Interface status - Checked */
            (SELECT '15. Linking Checktype: Interface status' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 63, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 16. Network errors per interface - Checked */
            (SELECT '16. Linking Checktype: Network errors per interface' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) 
            VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 129, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 17. Interface throughput inbound (Kbps) - Checked */
            (SELECT '17. ALinkingdd Checktype: Interface throughput inbound (Kbps)' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 132, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 18. Interface throughput outbound (Kbps) - Checked */
            (SELECT '18. Linking Checktype: Interface throughput outbound (Kbps)' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 133, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 19. Network throughput inbound (Kbps) - Checked */
            (SELECT '19. Linking Checktype: Network throughput inbound (Kbps)' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 130, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /* 20. Network throughput outbound (Kbps) - Checked */
            (SELECT '20. Linking Checktype: Network throughput outbound (Kbps)' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@monitorPlatformId, 8, 0, @agentId, 0, 1, 0, 0, 131, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@AI));

            /**
            * APPLICATION ATTRIBUTES
            * 21. HTTP requests per virtual server 
            * 21.1 Add Checktype */
            (SELECT '21.1 Add Checktype: HTTP requests virtual server' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_VS', 'cmp', 'HTTP_REQ_VS', 'HTTP requests per virtual server', 'HTTP requests per virtual server', 'The number of HTTP requests received per virtual server policy', '', 'traffic_http_req_vs', 0, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 21.2 Linking Checktype */
            (SELECT '21.2 Linking Checktype: HTTP requests per virtual server' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 21.3 Defaults for Checktype */
            (SELECT '21.3 Defaults for Checktype: HTTP requests per virtual server' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));

            /* 22. HTTP REQUESTS
            * 22.1 Add Checktype */
            (SELECT '22.1 Add Checktype: HTTP requests' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ', 'simple', 'HTTP_REQ', 'HTTP requests', 'HTTP requests', 'The total number of HTTP requests received across all virtual server policies', '', 'traffic_http_req', 0, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 22.2 Linking Checktype */
            (SELECT '22.2 Linking Checktype: HTTP requests' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,@monitorPlatformId, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 22.3 Defaults for Checktype */
            (SELECT '22.3 Defaults for Checktype: HTTP requests' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));

            /* 23. HTTP REQUESTS ACCEPTED PER VIRTUAL SERVER
            * 23.1 Add Checktype */
            (SELECT '23.1 Add Checktype: HTTP requests accepted per virtual server' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_ACCEPT_VS', 'cmp', 'HTTP_REQ_ACCEPT_VS', 'HTTP requests accepted per virtual server', 'HTTP requests accepted per virtual server', 'The number of HTTP requests accepted by the WAF per virtual server policy', '', 'traffic_http_req_accept_vs', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 23.2 Linking Checktype */
            (SELECT '23.2 Linking Checktype: HTTP requests accepted per virtual server' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,@monitorPlatformId, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 23.3 Defaults for Checktype */
            (SELECT '23.3. Defaults for Checktype: HTTP requests accepted per virtual server' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));

            /* 24. HTTP REQUESTS ACCEPTED
            * 24.1 Add Checktype */
            (SELECT '24.1. Add Checktype: HTTP requests accepted' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_ACCEPT', 'simple', 'HTTP_REQ_ACCEPT', 'HTTP requests accepted', 'HTTP requests accepted', 'The total number of HTTP requests accept by the WAF across all virtual server policies', '', 'traffic_http_req_accept', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 24.2 Linking Checktype */
            (SELECT '24.2 Linking Checktype: HTTP requests accepted' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,@monitorPlatformId, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 24.3. Defaults for checktype */
            (SELECT '24.3 Add defaults for Checktype: HTTP requests accepted' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));

            /* 25. HTTP REQUESTS DENIED PER VIRTUAL SERVER
            * 25.1 Add Checktype */
            (SELECT '25.1 Add Checktype: HTTP requests denied per virtual server' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_DENY_VS', 'cmp', 'HTTP_REQ_DENY_VS', 'HTTP requests denied per virtual server ', 'HTTP requests denied per virtual server', 'The total number of HTTP requests denied by the WAF across all virtual server policies', '', 'traffic_http_req_deny_vs', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 25.2 Linking Checktype */
            (SELECT '25.2 Linking Checktype: HTTP requests denied per virtual server' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,@monitorPlatformId, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 25.3 Defaults for Checktype */
            (SELECT '25.3 Add Defaults for Checktype: HTTP requests denied per virtual server' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 0);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));

            /* 26. HTTP REQUESTS DENIED 
            * 26.1 Add Checktype */
            (SELECT '26.1 Add Checktype: HTTP requests denied' AS '');
            SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
            INSERT IGNORE INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_DENY', 'simple', 'HTTP_REQ_DENY', 'HTTP requests denied', 'HTTP requests denied', 'The number of HTTP Requests for the past 5 minutes That was denied by adding together all the HTTP Requests per virtual server that was denied', '', 'traffic_http_req_deny', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            SET @errorCount = @errorCount + (fn_verify_ai('checktype',@checktypeId));

            /* 26.2 Linking Checktype */
            (SELECT '26.2 Linking Checktype: HTTP requests denied' AS '');
            SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,@monitorPlatformId, 8, @monitorApplicationId, @agentId, 0, 3, 0, 0, @checktypeId, 1);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_linking',@checktypeLinkngId));

            /* 26.3 Adding Defaults */
            (SELECT '26.3. Adding Defaults for Checktype: HTTP requests denied' AS '');
            SET @AI = (fn_get_ai_table('monitor_checktype_default','monitor'));
            INSERT IGNORE INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 0);
            SET @errorCount = @errorCount + (fn_verify_ai('monitor_checktype_default',@AI));
        ELSE
            SELECT "This Migration has already been executed, aborting..." as '';
        END IF;
    ELSE 
        SELECT "Patch process incomplete...!" as '';
        SELECT "Aborting procedure updateMonitorStructure()!" AS '';
        SELECT @runPreviousErrorMsg as '';
        SELECT "..." as '';	
    END IF;

    /* END TRANSACTION BY EITHER COMMIT OR ROLLBACK */
    IF (@errorCount = 0) THEN
        SELECT 'No errors encountered Commiting Updates, migration sucessful' AS '';
        COMMIT;
    ELSE
        SELECT CONCAT_WS(' ',@errorCount,' Errors encountered, Rolling Back') AS '';
        ROLLBACK;
    END IF;
    SELECT 'SET AUTOCOMMIT = 1' AS '';
    SET AUTOCOMMIT = 1;
END$$
delimiter ;
/* END STOR PROC FOR MIGRATION */

CALL updateMonitorStructure();
/* START STOR PROC FOR MIGRATION */
DROP PROCEDURE IF EXISTS updateMonitorStructure;
DROP FUNCTION IF EXISTS fn_get_ai_table;
DROP FUNCTION IF EXISTS fn_verify_ai;

