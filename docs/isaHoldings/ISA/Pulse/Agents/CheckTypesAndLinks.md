# Agent Checks / Check Types and Linking

## Synopsis

The purpose of and agent is to:

- Collect data
- Parse Data
- Send Data to Pulse for display

The Agents can do these tasks in a few  different ways, one of those is via a Server Side SSH Agent
> These agents live on the client server and collect the data directly from the client's devices via a CLI or other tools

## Data

### Adding new Agents / Checks

> There are not GUI for this and as of 2021-11-11 this os still a manual process, but I created a few queries to make this a little bit less mind numbing
*SQL for selecting a check for a specific Agent / OS / Platform for the Purpose of Lookups and Replication*

```SQL
SELECT
    `checktype`.`name`, 
    `checktype`.`type`, 
    `checktype`.`abreviation`, 
    `checktype`.`nice_name`, 
    `checktype`.`description`, 
    `checktype`.`long_description`, 
    `checktype`.`category`, 
    `checktype`.`agent_name`, 
    `checktype`.`enabled`, 
    `checktype`.`port`, 
    `checktype`.`interface_category`, 
    `checktype`.`variable_status`, 
    `checktype`.`graph_max`, 
    `checktype`.`graph_min`, 
    `checktype`.`graph_decimals`, 
    `checktype`.`graph_limit_axis`, 
    `checktype`.`alt_source`, 
    `checktype`.`value_tags`, 
    `monitor_platform`.`name` AS `monitor_platform__name`, 
    `monitor_category`.`name` AS `monitor_category__name`, 
    `monitor_operatingSystem`.`name` AS `monitor_operatingSystem__name`, 
    `monitor_agent`.`name` AS `monitor_agent__name`, 
    `monitor_application`.`name` AS `monitor_application__name`, 
    `monitor_backup`.`name` AS `monitor_backup__name`, 
    `monitor_checktype_linking`.`monitor_checktype_linking_id`, 
    `monitor_checktype_linking`.`monitor_platform_id`, 
    `monitor_checktype_linking`.`monitor_operatingSystem_id`, 
    `monitor_checktype_linking`.`monitor_application_id`, 
    `monitor_checktype_linking`.`monitor_agent_id`, 
    `monitor_checktype_linking`.`monitor_structure_id`, 
    `monitor_checktype_linking`.`monitor_category_id`, 
    `monitor_checktype_linking`.`monitor_subCategory_id`, 
    `monitor_checktype_linking`.`monitor_mib_linking_id`, 
    `monitor_checktype_linking`.`checktype_id`, 
    `monitor_checktype_linking`.`default`, 
    `monitor_checktype_default`.`default_type_id`, 
    `monitor_checktype_default`.`threshold`, 
    `monitor_checktype_default`.`warning_status_delay`, 
    `monitor_checktype_default`.`critical_status_delay`, 
    `monitor_checktype_default`.`warning_alert_delay`, 
    `monitor_checktype_default`.`critical_alert_delay`, 
    `monitor_checktype_default`.`notify_warning`, 
    `monitor_checktype_default`.`notify_critical`
FROM
 (
  (
   `monitor_checktype_linking`
   LEFT JOIN
   `checktype`
   ON 
    (
     (
      `monitor_checktype_linking`.`checktype_id` = `checktype`.`id`
     )
    )
  )
  LEFT JOIN
  `monitor_checktype_default`
  ON 
   (
    (
     `monitor_checktype_linking`.`monitor_checktype_linking_id` = `monitor_checktype_default`.`monitor_checktype_linking_id`
    )
   )
 )
 LEFT JOIN
 `monitor_platform`
 ON 
  `monitor_checktype_linking`.`monitor_platform_id` = `monitor_platform`.`monitor_platform_id`
 LEFT JOIN
 `monitor_operatingSystem`
 ON 
  `monitor_checktype_linking`.`monitor_operatingSystem_id` = `monitor_operatingSystem`.`monitor_operatingSystem_id`
 LEFT JOIN
 `monitor_agent`
 ON 
  `monitor_checktype_linking`.`monitor_agent_id` = `monitor_agent`.`monitor_agent_id`
 LEFT JOIN
 `monitor_application`
 ON 
  `monitor_checktype_linking`.`monitor_application_id` = `monitor_application`.`monitor_application_id`
 LEFT JOIN
 monitor_category
 ON 
  `monitor_checktype_linking`.`monitor_category_id` = `monitor_category`.`monitor_category_id`
 LEFT JOIN
 `monitor_backup_linking`
 ON 
  `monitor_checktype_linking`.`monitor_structure_id` = `monitor_backup_linking`.`monitor_structure_id` AND
  `monitor_checktype_linking`.`monitor_platform_id` = `monitor_backup_linking`.`monitor_platform_id` AND
  `monitor_checktype_linking`.`monitor_operatingSystem_id` = `monitor_backup_linking`.`monitor_operatingSystem_id` AND
  `monitor_checktype_linking`.`monitor_agent_id` = `monitor_backup_linking`.`monitor_agent_id`
 LEFT JOIN
 `monitor_backup`
  ON 
  `monitor_backup_linking`.`monitor_backup_id` = `monitor_backup`.`monitor_backup_id`
  WHERE
  (
   `checktype`.`name` = 'Load average'
   OR
   (
   `checktype`.`name` = 'Percentage memory free'
    OR
  (
   `checktype`.`name` = 'Percentage CPU utilisation'
  ) OR
  (
   `checktype`.`name` = 'Network throughput outbound (Kbps)'
  ) OR
  (
   `checktype`.`name` = 'Network throughput outbound (Kbps'
  ) OR
  (
   `checktype`.`name` = 'Uptime'
  ) OR
  (
   `checktype`.`name` = 'Interface throughput inbound (Kbps)'
  ) OR
  (
   `checktype`.`name` = 'Interface throughput outbound (Kbps)'
  ) OR
  (
   `checktype`.`name` = 'Interface status'
  ) OR
  (
   `checktype`.`name` = 'Network errors per interface'
  ) OR
  (
   `checktype`.`name` = 'Percentage CPU utilisation per core'
  ) OR
  (
   `checktype`.`name` = 'policy'
  ) OR
  (
   (
    `monitor_checktype_linking`.`monitor_platform_id` = 8
   ) AND
   (
    `monitor_checktype_linking`.`monitor_operatingSystem_id` = 8
   )
  )
 )
```

At the bottom of the query in the `WHERE` clause of the statement there are some filters that should be adjusted as nessesery.
