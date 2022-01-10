# Database Migration

> The migration script is in essence a list of sql commands wrapped in a stored procedure and called.

But before I declare the stored procedure I'm adding 2 functions that I use to test the results if the queries as they happen and rollback the changes if any errors do occur.

```sql
/** Queries like this is used to output the results back to the terminal or logs or whatever. */
(SELECT 'SET AUTOCOMMIT = On' AS '');
SET AUTOCOMMIT = On;

/* CREATE VALIDATION FUNCTIONS 
 Create function to check the auto increment value of a table */ 
```

First I check if the function already exists an if it does I drop the function and recreate

```sql
DROP FUNCTION IF EXISTS fn_get_ai_table;
delimiter $$

/* Get auto increment id from supplied table */
CREATE FUNCTION `fn_get_ai_table`(`tableName` VARCHAR(50),`dbName` VARCHAR(50)) RETURNS int(11)
COMMENT 'Get auto increment id from supplied table'
BEGIN
    DECLARE db VARCHAR(50);
    DECLARE aiValue INT;
    IF `dbName` IS NULL THEN 
        SET db = DATABASE(); 
    ELSE SET 
        db = dbName; 
    END IF;
    SELECT AUTO_INCREMENT INTO aiValue 
    FROM information_schema.tables 
        WHERE 
        table_name = tableName 
        AND 
        table_schema = db;
    RETURN aiValue;
END $$
delimiter ;
```

Create function to check if two values checked out after insert it basically just checks if one value is the same as another.
for instance:

```sql
/* Checks if the was 1 row added or updated etc, and checks that the auto increment ID is what the system predicted it would be. by using the `fn_get_ai_table` function, this can be used in the following way  */

SET @successCount = 0;
SET @errorCount = 0;
SET @totalCount = 0;

IF (OK(ROW_COUNT() = 1) AND (LAST_INSERT_ID(),@monitorApplicationId)) {
    @successCount = @successCount + 1;
} ELSE {
    @errorsCount = @errorsCount + 1;
}
@totalCount = @totalCount + 1;
```

```sql
DROP FUNCTION IF EXISTS OK;
(SELECT 'Create function to check if two values checked out after insert' AS '');
delimiter $$
CREATE FUNCTION OK(expect INT, actual INT ) RETURNS int(11)
COMMENT 'Get auto increment id from supplied table'
BEGIN
    DECLARE equal INT;
    IF (expect = actual) THEN 
        SET equal = 1; 
    ELSE 
        SET equal = 0;
    END IF; 
RETURN equal; 
END $$
delimiter ;
```

```sql
/**
DATABASE MIGRATION : Add Platform Agent

 AFFECTED SYSTEM   : Pulse
 MIGRATION TYPE    : CREATE TABLE, INSERT
 TARGET SCHEMA     : `monitor`
 DATE              : 2021-11-12
 AUTHOR            : Charl Cronje 
/* By default, MySQL automatically commits the changes permanently to the database. To force MySQL not to commit changes automatically, you use the following statement: */
(SELECT 'SET AUTOCOMMIT = On' AS '');
SET AUTOCOMMIT = On;

/* START STOR PROC FOR MIGRATION */
DROP PROCEDURE IF EXISTS updateMonitorStructure;
delimiter $$
CREATE PROCEDURE updateMonitorStructure()
BEGIN
/*  Checks if the previous migration ran before this one can start 
    It will run in a transaction that will roll back if anything goes wrong*/
    SET @patch_id=(SELECT id FROM `appliance`.`database_patching` WHERE filename='855815_fortigate_fortiGuard_service_status_attribute.sql');
    IF @patch_id > 0 THEN 
    START TRANSACTION;
        /**
         * PLATFORM ATTRIBUTES
         *
         * 1. Getting next auto increment id from table - Checked */
        (SELECT '1. Getting next auto increment id from table` table' AS '');
        SET @monitorApplicationId = (fn_get_ai_table('monitor_application','monitor'));

        /* 2. Inserting FortiWeb Web Application Firewall to `monitor_application - Checked */
        (SELECT '2. Inserting FortiWeb Web Application Firewall to `monitor_application` table' AS '');
        INSERT INTO `monitor`.`monitor_application` (`name`) VALUES ('FortiWeb Web Application Firewall');

        /* 3. Getting next auto increment id from table - Checked */
        (SELECT '3. Getting next auto increment id from table` table' AS '');
        SET @monitorPlatformId = (fn_get_ai_table('monitor_platform','monitor'));

        /* 4. Inserts new row and get the AUTO_INCREMENT - Checked */
        (SELECT '4. Inserts new row and get the AUTO_INCREMENT` table' AS '');
        INSERT INTO `monitor`.`monitor_platform` (`name`) VALUES ('Fortinet FortiWeb Platform');

        /* 5. Link new platform in Monitor Structure - Checked */
        (SELECT '5. Link new platform in Monitor Structure' AS '');
        SET @monitorPlatformStructureId = (fn_get_ai_table('monitor_structure','monitor'));

        /* 6. Link new platform in Monitor Structure */
        (SELECT '5. Link new platform in Monitor Structure' AS '');
        INSERT INTO `monitor`.`monitor_structure` 
        (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
            VALUES 
        (0,0,@monitorPlatformId, @monitorPlatformId, 0, 0, 0);

        /* 7. Link new platform to its Operating System in Monitor Structure - Checked */
        (SELECT '6. Link new platform to its Operating System in Monitor Structure' AS '');	
        SET @operatingSystemId = (SELECT `monitor_operatingSystem_id` FROM `monitor`.`monitor_operatingSystem` WHERE `name` = 'Fortinet FortiOS');
        SET @monitorOSStructureId = (fn_get_ai_table('monitor_structure','monitor'));
        INSERT INTO `monitor`.`monitor_structure` 
        (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
            VALUES 
        (@monitorPlatformStructureId, 1,@operatingSystemId, @monitorPlatformId, @operatingSystemId, 0,0);

        /* 8. Link new platform to its Agent in Monitor Structure - Checked */
        (SELECT '8. Link new platform to its Agent in Monitor Structure' AS '');
        SET @agentId = (SELECT monitor_agent_id FROM `monitor`.`monitor_agent` WHERE `name` = 'Server-side SSH agent' ORDER BY monitor_agent_id DESC LIMIT 1);
        SET @monitorAgentStructureId = (fn_get_ai_table('monitor_structure','monitor'));
        INSERT INTO `monitor`.`monitor_structure` 
        (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
            VALUES 
        (@monitorOSStructureId,3,@agentId,@monitorPlatformId, @operatingSystemId,0,@agentId);

        /* 9. Link new platform to its application in Monitor Structure - Checked */
        (SELECT '9. Link new platform to its application in Monitor Structure' AS '');
        SET @applicationId = (SELECT monitor_application_id FROM `monitor`.`monitor_application` WHERE `name` = 'Server-side SSH agent' ORDER BY monitor_application_id DESC);

        /* 10. Link new application to its platform in Monitor Structure - Checked */
        (SELECT '10. Link new application to its platform in Monitor Structure' AS '');
        SET @monitorApplicationStructureId = (fn_get_ai_table('monitor_structure','monitor'));
        INSERT INTO `monitor`.`monitor_structure` 
        (`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
            VALUES 
        (@monitorAgentStructureId, 2, @monitorApplicationId, @monitorPlatformId,  @operatingSystemId, @monitorApplicationId,14);
        
        /* 11. Add new monitor agent requirements - Checked */
        (SELECT '11. Add new monitor agent requirements' AS '');
        SET @agentRequirementsId = (fn_get_ai_table('monitor_agent_requirements','monitor'));
        INSERT INTO `monitor`.`monitor_agent_requirements` 
        (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_agent_id`, `database_name`, `table_name`, `required_fields`)
            VALUES 
        (@monitorPlatformId, @operatingSystemId, @agentId, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password|');	

        /* 12. Percentage CPU utilisation - Checked */
        (SELECT '12. Linking Checktype: Percentage CPU utilisation' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 75, 1);

        /* 13. Uptime - Checked */
        (SELECT '13. Linking Checktype: Uptime' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 7, 1);

        /* 14. MEM Usage - Checked */
        (SELECT '14. Linking Checktype: MEM Usage' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking` ( `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`,`default`) VALUES (22, 8, 0, 14 , 0, 1, 0, 0, 5, 1);
            
        /* 15.  Interface status - Checked */
        (SELECT '15. Linking Checktype: Interface status' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking` (`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 63, 1);

        /* 16. Network errors per interface - Checked */
        (SELECT '16. Linking Checktype: Network errors per interface' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) 
        VALUES (22, 8, 0, 14, 0, 1, 0, 0, 129, 1);

        /* 17. Interface throughput inbound (Kbps) - Checked */
        (SELECT '17. ALinkingdd Checktype: Interface throughput inbound (Kbps)' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 132, 1);

        /* 18. Interface throughput outbound (Kbps) - Checked */
        (SELECT '18. Linking Checktype: Interface throughput outbound (Kbps)' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 133, 1);

        /* 19. Network throughput inbound (Kbps) - Checked */
        (SELECT '19. Linking Checktype: Network throughput inbound (Kbps)' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 130, 1);

        /* 20. Network throughput outbound (Kbps) - Checked */
        (SELECT '20. Linking Checktype: Network throughput outbound (Kbps)' AS '');
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (22, 8, 0, 14, 0, 1, 0, 0, 131, 1);

        /**
         * APPLICATION ATTRIBUTES
         * 21. HTTP requests per virtual server 
         * 21.1 Add Checktype */
        (SELECT '21.1 Add Checktype: HTTP requests virtual server' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_PVS', 'cmp', 'HTTP_REQ_PVS', 'HTTP requests per virtual server', 'HTTP requests per virtual server', 'HTTP requests per virtual server for the past 5 minutes', '', 'traffic_http_req_pvs', 0, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
            
        /* 21.2 Linking Checktype */
        (SELECT '21.2 Linking Checktype: HTTP requests per virtual server' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);

        /* 21.3 Defaults for Checktype */
        (SELECT '21.3 Defaults for Checktype: HTTP requests per virtual server' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);


        /* 22. HTTP REQUESTS
         * 22.1 Add Checktype */
        (SELECT '22.1 Add Checktype: HTTP requests' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ', 'cmp', 'HTTP_REQ', 'HTTP requests', 'HTTP requests', 'The number of HTTP Requests for the past 5 minutes By adding together all the HTTP requests per virtual Server', '', 'traffic_http_req', 0, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);

        /* 22.2 Linking Checktype */
        (SELECT '22.2 Linking Checktype: HTTP requests' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);

        /* 22.3 Defaults for Checktype */
        (SELECT '22.3 Defaults for Checktype: HTTP requests' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);

        /* 23. HTTP REQUESTS ACCEPTED PER VIRTUAL SERVER
         * 23.1 Add Checktype */
        (SELECT '23.1 Add Checktype: HTTP requests accepted per virtual server' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_PVS_ACC', 'cmp', 'HTTP_REQ_PVS_ACC', 'HTTP requests accepted per virtual server', 'HTTP requests accepted per virtual server', 'The number of HTTP Requests per virtual server that was accepted for the past 5 minutes', '', 'traffic_http_req_pvs_acc', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);

        /* 23.2 Linking Checktype */
        (SELECT '23.2 Linking Checktype: HTTP requests accepted per virtual server' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);

        /* 23.3 Defaults for Checktype */
        (SELECT '23.3. Defaults for Checktype: HTTP requests accepted per virtual server' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);

        /* 24. HTTP REQUESTS ACCEPTED
         * 24.1 Add Checktype */
        (SELECT '24.1. Add Checktype: HTTP requests accepted' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_ACC', 'simple', 'HTTP_REC_ACC', 'HTTP requests accepted', 'HTTP requests accepted', 'The number of HTTP Requests for the past 5 minutes That was accepted by adding together all the HTTP Requests per virtual server that was accepted together', '', 'traffic_http_req_acc', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);

        /* 24.2 Linking Checktype */
        (SELECT '24.2 Linking Checktype: HTTP requests accepted' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);
        
        /* 24.3. Defaults for checktype */
        (SELECT '24.3 Add defaults for Checktype: HTTP requests accepted' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);

        /* 25. HTTP REQUESTS DENIED PER VIRTUAL SERVER
         * 25.1 Add Checktype */
        (SELECT '25.1 Add Checktype: HTTP requests denied per virtual server' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_PVS_DND', 'cmp', 'HTTP_REQ_PVS_DND', 'HTTP requests denied per virtual server ', 'HTTP requests denied per virtual server', 'The number of HTTP Requests per virtual server that was denied for the past 5 minutes', '', 'traffic_http_req_pvs_dnd', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);

        /* 25.2 Linking Checktype */
        (SELECT '25.2 Linking Checktype: HTTP requests denied per virtual server' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);
        
        /* 25.3 Defaults for Checktype */
        (SELECT '25.3 Add Defaults for Checktype: HTTP requests denied per virtual server' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 0);

        /* 26. HTTP REQUESTS DENIED 
         * 26.1 Add Checktype */
        (SELECT '26.1 Add Checktype: HTTP requests denied' AS '');
        SET @checktypeId = (fn_get_ai_table('checktype','monitor'));
        INSERT INTO `monitor`.`checktype`(`id`, `name`, `type`, `abreviation`, `nice_name`, `description`, `long_description`, `category`, `agent_name`, `enabled`, `port`, `interface_category`, `variable_status`, `graph_max`, `graph_min`, `graph_decimals`, `graph_limit_axis`, `alt_source`, `value_tags`) VALUES (@checktypeId, 'HTTP_REQ_DND', 'simple', 'HTTP_REQ_DND', 'HTTP requests denied', 'HTTP requests denied', 'The number of HTTP Requests for the past 5 minutes That was denied by adding together all the HTTP Requests per virtual server that was denied', '', 'traffic_http_req_dnd', 1, NULL, NULL, 1, NULL, NULL, 0, 0, 0, NULL);
        
        /* 26.2 Linking Checktype */
        (SELECT '26.2 Linking Checktype: HTTP requests denied' AS '');
        SET @checktypeLinkngId = (fn_get_ai_table('monitor_checktype_linking','monitor'));
        INSERT INTO `monitor`.`monitor_checktype_linking`(`monitor_checktype_linking_id`,`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`, `monitor_structure_id`, `monitor_category_id`, `monitor_subCategory_id`, `monitor_mib_linking_id`, `checktype_id`, `default`) VALUES (@checktypeLinkngId,22, 8, @monitorApplicationId, 14, 0, 3, 0, 0, @checktypeId, 1);
        
        /* 26.3 Adding Defaults */
        (SELECT '26.3. Adding Defaults for Checktype: HTTP requests denied' AS '');
        INSERT INTO `monitor`.`monitor_checktype_default`(`monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_delay`, `critical_status_delay`, `warning_alert_delay`, `critical_alert_delay`, `notify_warning`, `notify_critical`) VALUES (@checktypeLinkngId, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 0);
    COMMIT;
    ELSE 
        select "Patch process incomplete...!" as '';
        select "Aborting procedure updateMonitorStructure()!" AS '';
        select "'Patch 855815_fortigate_fortiGuard_service_status_attribute.sql has to be run first!" as '';
        select "..." as '';
    END IF;
END$$
delimiter ;
/* END STOR PROC FOR MIGRATION */

CALL updateMonitorStructure();
DROP PROCEDURE IF EXISTS updateMonitorStructure;
DROP FUNCTION IF EXISTS fn_get_ai_table;
```

## Numbering of queries

The numbering of queries come in handy when you receive an error because the error will say something like:

```sql
1064 - You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near  33. Linking Checktype: HTTP requests denied 'monitor_checktype_linking_id`, `default_type_id`, `threshold`, `warning_status_d' at line 151
```

But line 151 will be the count from line 1 of the stored procedure and not the beginning of your query so finding the correct line can be difficult
