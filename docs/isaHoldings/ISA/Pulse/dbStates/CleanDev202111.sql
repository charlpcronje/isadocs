/*
 Navicat Premium Data Transfer

 Source Server         : pulsedev
 Source Server Type    : MySQL
 Source Server Version : 50173
 Source Host           : 192.168.50.49:3306
 Source Schema         : monitor

 Target Server Type    : MySQL
 Target Server Version : 50173
 File Encoding         : 65001

 Date: 12/11/2021 12:01:51
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for HISTORY_monitor
-- ----------------------------
DROP TABLE IF EXISTS `HISTORY_monitor`;
CREATE TABLE `HISTORY_monitor`  (
  `HISTORY_monitor_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('GREEN','RED','YELLOW','NODATA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'GREEN',
  `type_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`HISTORY_monitor_id`) USING BTREE,
  INDEX `HISTORY_monitor_index`(`siteid`, `id`, `type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of HISTORY_monitor
-- ----------------------------

-- ----------------------------
-- Table structure for HISTORY_monitorchange
-- ----------------------------
DROP TABLE IF EXISTS `HISTORY_monitorchange`;
CREATE TABLE `HISTORY_monitorchange`  (
  `change_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `id` smallint(5) UNSIGNED NOT NULL DEFAULT 0,
  `timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` enum('GREEN','YELLOW','RED','NODATA') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'GREEN',
  `type_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`change_id`) USING BTREE,
  INDEX `HISTORY_monitorchange_index`(`siteid`, `id`, `type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of HISTORY_monitorchange
-- ----------------------------

-- ----------------------------
-- Table structure for Time_sync
-- ----------------------------
DROP TABLE IF EXISTS `Time_sync`;
CREATE TABLE `Time_sync`  (
  `hostname` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_date` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `server_date` varchar(55) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `time_difference` int(22) NULL DEFAULT NULL,
  `time_sync_state` smallint(1) NULL DEFAULT 0,
  `out_of_sync_stamp` int(22) NULL DEFAULT 0,
  `alert_status` smallint(1) NULL DEFAULT 0,
  PRIMARY KEY (`hostname`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of Time_sync
-- ----------------------------

-- ----------------------------
-- Table structure for agent_data
-- ----------------------------
DROP TABLE IF EXISTS `agent_data`;
CREATE TABLE `agent_data`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `hostname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `agent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `timediff` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `notified_nodata` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '1',
  `agent_state` int(1) NULL DEFAULT 0,
  `sent_notification` int(1) NULL DEFAULT 0,
  `newest_version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE,
  INDEX `agent`(`agent`) USING BTREE,
  INDEX `hostname`(`hostname`) USING BTREE,
  INDEX `version`(`version`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_data
-- ----------------------------

-- ----------------------------
-- Table structure for agent_data_update
-- ----------------------------
DROP TABLE IF EXISTS `agent_data_update`;
CREATE TABLE `agent_data_update`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `current_version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `newest_version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `agent` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agent_data_update
-- ----------------------------

-- ----------------------------
-- Table structure for application_os_monitored_attributes
-- ----------------------------
DROP TABLE IF EXISTS `application_os_monitored_attributes`;
CREATE TABLE `application_os_monitored_attributes`  (
  `application_os_monitored_attributes_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_id` int(11) NOT NULL DEFAULT 0,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `check_type_id` int(11) NOT NULL DEFAULT 0,
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`application_os_monitored_attributes_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 91 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of application_os_monitored_attributes
-- ----------------------------

-- ----------------------------
-- Table structure for check_additional_data
-- ----------------------------
DROP TABLE IF EXISTS `check_additional_data`;
CREATE TABLE `check_additional_data`  (
  `check_additional_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `siteid` int(11) NULL DEFAULT 0,
  `hostid` int(11) NULL DEFAULT 0,
  `testname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `data_value` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `last_updated` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`check_additional_data_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_additional_data
-- ----------------------------

-- ----------------------------
-- Table structure for check_gather_type
-- ----------------------------
DROP TABLE IF EXISTS `check_gather_type`;
CREATE TABLE `check_gather_type`  (
  `check_gather_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `gather_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`check_gather_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of check_gather_type
-- ----------------------------
INSERT INTO `check_gather_type` VALUES (1, 'Agent');
INSERT INTO `check_gather_type` VALUES (2, 'Genric SNMP');
INSERT INTO `check_gather_type` VALUES (3, 'SSH Pix');
INSERT INTO `check_gather_type` VALUES (4, 'SSH Edge');
INSERT INTO `check_gather_type` VALUES (5, 'Edge SNMP');

-- ----------------------------
-- Table structure for checks_complex
-- ----------------------------
DROP TABLE IF EXISTS `checks_complex`;
CREATE TABLE `checks_complex`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `warning_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `threshhold` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hostname` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `w_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `rrd_max` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  `check_gather_type_id` int(11) NOT NULL DEFAULT 1,
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3568 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Complex Checks' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checks_complex
-- ----------------------------

-- ----------------------------
-- Table structure for checks_remote
-- ----------------------------
DROP TABLE IF EXISTS `checks_remote`;
CREATE TABLE `checks_remote`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `warning_thresh` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_thresh` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `warning_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `port` mediumint(9) NOT NULL DEFAULT 0,
  `environment` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `timeout` int(11) NOT NULL DEFAULT 5,
  `display` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `abv` char(3) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ipaddress` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `w_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `rrd_max` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  `environment_id` int(11) NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 317 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Remote Checks' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checks_remote
-- ----------------------------

-- ----------------------------
-- Table structure for checks_simple
-- ----------------------------
DROP TABLE IF EXISTS `checks_simple`;
CREATE TABLE `checks_simple`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `warning_threshhold` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_threshhold` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `warning_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `hostname` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `w_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `rrd_max` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  `check_gather_type_id` int(11) NOT NULL DEFAULT 1,
  `comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7028 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Simple Checks' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checks_simple
-- ----------------------------

-- ----------------------------
-- Table structure for checks_sysinfo
-- ----------------------------
DROP TABLE IF EXISTS `checks_sysinfo`;
CREATE TABLE `checks_sysinfo`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `warning_threshhold` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_threshhold` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `warning_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `critical_email` varchar(250) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `hostname` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `host_id` mediumint(9) NOT NULL DEFAULT 0,
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `w_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  `checktype_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 882 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checks_sysinfo
-- ----------------------------

-- ----------------------------
-- Table structure for checktype
-- ----------------------------
DROP TABLE IF EXISTS `checktype`;
CREATE TABLE `checktype`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `abreviation` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `nice_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `long_description` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `category` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `agent_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT 0,
  `port` int(11) NULL DEFAULT NULL,
  `interface_category` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `variable_status` tinyint(1) NULL DEFAULT 1,
  `graph_max` int(11) NULL DEFAULT NULL,
  `graph_min` int(11) NULL DEFAULT NULL,
  `graph_decimals` tinyint(2) NULL DEFAULT 2,
  `graph_limit_axis` tinyint(1) NULL DEFAULT 0,
  `alt_source` tinyint(1) NULL DEFAULT 0,
  `value_tags` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 219 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of checktype
-- ----------------------------
INSERT INTO `checktype` VALUES (1, 'FGPEND', 'simple', 'FGP', 'QoS queued packets', 'QoS queued packets', 'The number of packets currently queued by the Check Point QoS sub-system.', 'FloodGate', 'fgpending', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (2, 'DNS', 'remote', 'DNS', 'DNS TCP port probe', 'DNS TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the DNS port on the specified host.', '', 'dns', 0, 53, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (3, 'SMTP', 'remote', 'SMTP', 'SMTP TCP port probe', 'SMTP TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the SMTP port on the specified host.', '', 'smtp', 0, 25, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (4, 'FWMEM', 'simple', 'FWM', 'Firewall hash memory percentage free', 'Firewall hash memory percentage free', 'The amount of free memory available to the Check Point sub-systems for its state tables.', 'FireWall', 'fwmem', 0, NULL, 'Application', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (5, 'MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (6, 'DSK', 'cmp', 'DSK', 'Disk usage', 'Disk usage', 'The percentage disk space utilisation on each partition in the partition table.', 'System', 'disk', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (7, 'UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL);
INSERT INTO `checktype` VALUES (8, 'USERS', 'simple', 'USR', 'Users logged-in', 'Users logged-in', 'Indicates the number of users currently logged-in to the system at the operating system level.', 'System', 'users', 0, NULL, 'Operating system', 1, 0, 0, 0, 1, 0, NULL);
INSERT INTO `checktype` VALUES (9, 'IMAP', 'remote', 'IMAP', 'IMAP TCP port probe', 'IMAP TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the IMAP port on the specified host.', '', 'imap', 0, 143, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (10, 'PROCS', 'cmp', 'PRC', 'Running processes', 'Running processes', 'Indicates the number of instances of each particular named process in the operating system process table.', 'System', 'procs', 0, NULL, 'Operating system', 1, 0, 0, 0, 1, 0, '');
INSERT INTO `checktype` VALUES (11, 'LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (12, 'SWAP', 'simple', 'SWP', 'Percentage swap memory free', 'Percentage swap memory free', 'The percentage of free swap memory.', 'System', 'swap', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (13, 'POP3', 'remote', 'POP', 'POP3 TCP port probe', 'POP3 TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the POP3 port on the specified host.', '', 'pop3', 0, 110, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (14, 'FWMAILQ', 'cmp', 'FMQ', 'FireWall-1 mail queue', 'FireWall-1 mail queue', 'The current number of messages queued for delivery by the Check Point SMTP dequeuer sub-system. Only applicable when performing SMTP application layer inspection. \"ready\" indicates the message is queued for delivery. \"temp\" indicates the message is currently being received. \"error\" indicates the message cannot be delivered.', 'FireWall', 'fwmailq', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (15, 'TCP', 'remote', 'TCP', 'Generic TCP port probe', 'Generic TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the specified TCP port on the specified host.', '', 'tcp', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (16, 'PROMISC', 'simple', 'PRO', 'Promiscious mode', 'Promiscious mode', 'Indicates whether any interfaces are configured in promiscuous mode.', 'Networking', 'promisc', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, NULL);
INSERT INTO `checktype` VALUES (17, 'CONNS', 'simple', 'CON', 'Firewall concurrent connections', 'Firewall concurrent connections', 'The number of connections currently in the firewall connection table.', 'FireWall', 'connections', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (18, 'HTTPS', 'remote', 'HTTPS', 'HTTPS TCP port probe', 'HTTPS TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the HTTPS port on the specified host.', '', 'https', 0, 443, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (19, 'REJDROP', 'cmp', 'ACT', 'Dropped and rejected packets on all interfaces ', 'Dropped and rejected packets on all interfaces ', 'The number of dropped packets and the number of rejected packets expressed as a ratio of packets dropped/rejected for every 10000 packets.', 'FireWall', 'rejdrop', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (20, 'NETSTAT', 'cmp', 'OSC', 'Systems connections', 'Systems connections', 'Indicates the number of TCP connections currently in each different TCP state.', 'Networking', 'netstat', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (22, 'MAILQ', 'simple', 'MLQ', 'System mail queue', 'System mail queue', 'The number of e-mail messages currently queued for delivery by the system.', 'System', 'mailq', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (30, 'FTP', 'remote', 'FTP', 'FTP TCP port probe', 'FTP TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the FTP port on the specified host.', '', 'ftp', 0, 21, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (25, 'HTTP', 'remote', 'HTTP', 'HTTP TCP port probe', 'HTTP TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the HTTP port on the specified host.', '', 'http', 0, 80, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (26, 'FWINST', 'simple', 'FWI', 'Firewall policy installation', 'Firewall policy installation', 'Indicates that a new firewall policy was made active on the system. A value of 2 is returned if the policy was installed within the last 30 minutes and a value of 1 is returned if the policy was installed within the last 60 minutes', 'FireWall', 'fwinstall', 0, NULL, 'Application', 1, 2, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (27, 'FGINST', 'simple', 'FGI', 'QoS policy install', 'QoS policy install', 'Indicates that a new QoS policy was made active on the system. A value of 2 is returned if the policy was installed within the last 30 minutes and a value of 1 is returned if the policy was installed within the last 60 minutes', 'FloodGate', 'fginstall', 0, NULL, 'Application', 1, 2, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (28, 'NETERR', 'cmp', 'ERR', 'Percentage of network errors per interface', 'Percentage of network errors per interface', 'The percentage of network errors per interface calculated as the number of network errors detected on each network interface in proportion to the number of packets sent and received on each network interface in the last 5 minutes.', 'Networking', 'neterr', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (29, 'SRCONN', 'simple', 'SRC', 'Remote VPN users', 'Remote VPN users', 'The current number of remote access VPN client connections.', 'FireWall', 'srconnections', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (32, 'PING', 'remote', 'PNG', 'Ping ICMP echo-request probe', 'Ping ICMP echo-request probe', 'Indicates the amount of time in ms to receive a response to a ICMP echo-request for a specified host.', '', 'ping', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (33, 'RED', 'simple', 'Critical', 'Critical status', 'Critical status', 'The number of MSS attributes currently in a critical status.', 'MASTER', 'red', 1, NULL, 'Summary', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (34, 'YELLOW', 'simple', 'Warning', 'Warning status', 'Warning status', 'The number of MSS attributes currently in a warning status.', 'MASTER', 'yellow', 1, NULL, 'Summary', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (35, 'NODATA', 'simple', 'NoData', 'No Data status', 'No Data status', 'The number of MSS attributes currently in a no data status.', 'MASTER', 'nodata', 1, NULL, 'Summary', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (36, 'TRAFFIC', 'simple', 'TFC', 'Network throughput inbound (KBps)', 'Network throughput inbound (KBps)', 'The average number of kilobits per second received by all network interfaces calculated by averaging the total number of bits received by all network interfaces in the last 5 minutes.', 'Networking', 'traffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (37, 'VIP', 'simple', 'VIP', 'Number of virtual IPs', 'Number of virtual IPs', 'The number of virtual IPs currently bound to a particular network interface.', 'Cluster', 'vip', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (38, 'SAM', 'simple', 'SAM', 'SAM events', 'SAM events', 'Deprecated.', '', 'sam', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (39, 'OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (40, 'CLA', 'simple', 'CLA', 'Cluster node active', 'Cluster node active', 'The cluster state of the current node. 1 indicates the current node is active.', 'Cluster', 'cla', 0, NULL, 'Application', 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (41, 'CLC', 'simple', 'CLC', 'Cluster count', 'Cluster count', 'The current number of nodes present in a cluster.', 'Cluster', 'clc', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (42, 'CLS', 'simple', 'CLS', 'Cluster status change', 'Cluster status change', 'Indicates that the cluster status on this node has recently changed. A value of 2 is returned if the status changed within the last 30 minutes and a value of 1 is returned if the status changed within the last 60 minutes', 'Cluster', 'cls', 0, NULL, 'Application', 1, 2, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (43, 'SSH', 'remote', 'SSH', 'SSH TCP port probe', 'SSH TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the SSH port on the specified host.', '', 'ssh', 0, 22, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (44, 'NETBIOS', 'remote', 'NBT', 'NetBios TCP port probe', 'NetBios TCP port probe', 'Indicates the amount of time in ms to receive a response to a connection attempt to the NetBIOS port on the specified host.', '', 'netbios', 0, 139, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (45, 'CMPSAM', 'cmp', 'CSAM', '# SAM alerts in last 5min', '# SAM alerts in last 5min', 'Deprecated.', '', 'csam', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (46, 'CMPREJDROP', 'cmp', 'CACT', 'Dropped packets per interface', 'Dropped packets per interface', 'The number of packets per interface dropped and rejected by the firewall in the last 5 minutes.', 'FireWall', 'crejdrop', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (47, 'ACEBAD', 'simple', 'ABL', 'ACE bad logins in last 5 min', 'ACE bad logins in last 5 min', 'The number of failed authentication requests recorded by the RSA Authentication Manager server in the last 5 minutes.', 'ACE', 'acebad', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (48, 'ACESYNC', 'simple', 'ALS', 'Minutes since last ACE sync', 'Minutes since last ACE sync', 'The number of minutes since the RSA Authentication Manager database was successfully replicated to a RSA Authentication Manager Replica server.', 'ACE', 'acesync', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (49, 'ACEERR', 'simple', 'ARE', 'ACE replication error', 'ACE replication error', 'Indicates that a replication error was detected.', 'ACE', 'aceerr', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (50, 'WSFILTPING', 'simple', 'WFR', 'Websense filter response in ms', 'Websense filter response in ms', 'The response time in ms for the filtering server to respond.', 'Websense', 'wsfiltping', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (51, 'WSALLOW', 'simple', 'WSA', 'Websense connections allowed', 'Websense connections allowed', 'The total number of connections allowed by the Websense filtering server in the last 5 minutes.', 'Websense', 'wsallow', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (52, 'WSDENY', 'simple', 'WSD', 'Websense connections denied', 'Websense connections denied', 'The total number of connections denied by the Websense filtering server in the last 5 minutes.', 'Websense', 'wsdeny', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (53, 'WSALL', 'simple', 'WST', 'Websense connections total', 'Websense connections total', 'The total number of connections handled by the Websense filtering server in the last 5 minutes.', 'Websense', 'wsall', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (55, 'WSRESPPING', 'simple', 'WLR', 'Websense lookup response in ms', 'Websense lookup response in ms', 'The response time in ms for the filtering server to respond to a specific filtering request.', 'Websense', 'wsrespping', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (56, 'WSDOWNLOAD', 'simple', 'WUS', 'Websense last successfull download', 'Websense last successfull download', 'The time in seconds since the last successful Websense filtering database download.', 'Websense', 'wsdownload', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (57, 'PSRV_CNT', 'simple', 'PSC', 'Active servlet count', 'Active servlet count', 'The number of user portal web interface servlets that are presently running and available for connections.', 'Portal', 'psrv_cnt', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (58, 'PUSRS_LGI', 'simple', 'PUR', 'Users authenticated in last 5 min', 'Users authenticated in last 5 min', 'The number of users who authenticated onto the user portal web interface within the last 5 minutes.', 'Portal', 'pusrs_lgi', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (62, 'PUSRS_A', 'simple', 'PUA', 'Users active in last 5 min', 'Users active in last 5 min', 'The number of users who have been active on the user portal web interface within the last 5 minutes.', 'Portal', 'pusrs_a', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (59, 'PWRKQ_SZE', 'simple', 'PWR', 'Work queue size', 'Work queue size', 'The number of user portal tasks currently waiting in the queue to be executed by a work thread.', 'Portal', 'pwrkq_sze', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (60, 'PMST_THA', 'simple', 'PMT', 'Master thread active', 'Master thread active', 'The number of master threads currently running and managing the various user portal work threads.', 'Portal', 'pmst_tha', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (61, 'PWRK_THA', 'simple', 'PWT', 'Work thread active', 'Work thread active', 'The number of user portal work threads currently processing tasks.', 'Portal', 'pwrk_tha', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (63, 'NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down');
INSERT INTO `checktype` VALUES (65, 'TX_POWERL', 'simple', 'TXPL', 'Tx power (local)', 'Tx power (local)', 'DSL upstream (local) transmit power.', 'ADSL', 'txpl', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (66, 'TX_POWERR', 'simple', 'TXPR', 'Tx power (remote)', 'Tx power (remote)', 'DSL downstream (remote) transmit power.', 'ADSL', 'txpr', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (67, 'LINE_ATTL', 'simple', 'LAL', 'Line attenuation (local)', 'Line attenuation (local)', 'DSL upstream (local) line attenuation.', 'ADSL', 'lal', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (68, 'LINE_ATTR', 'simple', 'LAR', 'Line attenuation (remote)', 'Line attenuation (remote)', 'DSL downstream (remote) line attenuation.', 'ADSL', 'lar', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (69, 'SNR_MARL', 'simple', 'SNRL', 'SNR margin (local)', 'SNR margin (local)', 'DSL upstream (local) noise margin (also called SNR margin which is the relative strength of the DSL Signal to Noise ratio).', 'ADSL', 'snrl', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (70, 'SNR_MARR', 'simple', 'SNRR', 'SNR margin (remote)', 'SNR margin (remote)', 'DSL downstream (remote) noise margin (also called SNR margin which is the relative strength of the DSL Signal to Noise ratio).', 'ADSL', 'snrr', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (71, 'TX_LRATE', 'simple', 'TXLR', 'Tx line rate (Kbps)', 'Tx line rate (Kbps)', 'DSL downstream (remote) line rate (Kbps).', 'ADSL', 'txlr', 0, NULL, 'Platform', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (72, 'RX_LRATE', 'simple', 'RXLR', 'Rx line rate (Kbps)', 'Rx line rate (Kbps)', 'DSL upstream (local) line rate (Kbps).', 'ADSL', 'rxlr', 0, NULL, 'Platform', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (73, 'CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (74, 'CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (75, 'CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (76, 'MAXCONNS', 'simple', 'MCON', 'Firewall maximum concurrent connections', 'Firewall maximum concurrent connections', 'The maximum number of concurrent connections recorded by the firewall since its counters were last cleared (typically since the last reboot).', 'Firewall', 'maxconnections', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (77, 'USER_MEM', 'simple', 'UMF', 'User memory free (KB)', 'User memory free (KB)', 'The amount of free memory in kilobytes available for \"user\" processes in the operating system.', 'System', 'user_mem', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (78, 'KERNEL_MEM', 'simple', 'KMF', 'Kernel memory free (KB)', 'Kernel memory free (KB)', 'The amount of free memory in kilobytes available for the operating system kernel.', 'System', 'kernel_mem', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (79, 'FW_MEM', 'simple', 'FMF', 'Firewall memory free (KB)', 'Firewall memory free (KB)', 'The amount of free memory in kilobytes available for the firewall processes running on the system.', 'Firewall', 'firewall_mem', 0, NULL, 'Application', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (80, 'MGMT_GUIU', 'simple', 'MGU', 'Check Point GUI client logged in', 'Check Point GUI client logged in', 'Indicates the number of Check Point GUI clients connected in write mode to the Check Point SmartCenter (can only be 1).', 'Firewall', 'cp_mgmt_gui_users', 0, NULL, 'Application', 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (81, 'CMPOUTTFP', 'cmp', 'COUP', 'Interface throughput outbound (pps)', 'Interface throughput outbound (pps)', 'The average number of packets per second transmitted by each network interface???', 'Networking', 'couttrafficp', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (82, 'CMPTRAFP', 'cmp', 'CTPI', 'Interface throughput inbound (pps)', 'Interface throughput inbound (pps)', 'The average number of packets per second received by each network interface.', 'Networking', 'ctrafficp', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (83, 'OUTTRAFP', 'simple', 'OUTP', 'Network throughput outbound (pps)', 'Network throughput outbound (pps)', 'The average number of packets per second transmitted by all network interface.', 'Networking', 'outtrafficp', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (84, 'TRAFFICP', 'simple', 'TFCP', 'Network throughput inbound (pps)', 'Network throughput inbound (pps)', 'The average number of packets per second received by all network interface.', 'Networking', 'trafficp', 0, NULL, 'Operating system', 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (85, 'SYSINFO_OS', 'sysinfo', 'SYS_OS', 'Operating system information', 'Operating system information', '', '', '18', 0, NULL, 'Operating system', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (86, 'SYSINFO_PLATFORM', 'sysinfo', 'SYS_PLT', 'Platform information', 'Platform information', '', '', '1', 0, NULL, 'Platform', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (87, 'SYSINFO_APP', 'sysinfo', 'SYS_APP', 'Application information', 'Application information', '', '', '39', 0, NULL, 'Application', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (88, 'DNS_HOST', 'dns', '', 'Host', 'Host', 'Indicates whether the value of an A record for the specified domain has been modified when compared to a defined expected value.', '', 'host', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (89, 'DNS_MX', 'dns', '', 'MX', 'MX', 'Indicates whether the value of the MX record of a domain has been modified when compared to a defined expected value.', '', 'mx', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (90, 'DNS_ZONE', 'dns', '', 'Zone serial', 'Zone serial', 'Indicates whether the serial number of a zone file for a specified domain has been modified when compared to a defined expected value.', '', 'zone', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (91, 'DNS_ZONE_COMP', 'dns', '', 'Zone Comparison', 'Zone Comparison', 'Indicates whether any entries have been added', '', 'zone_comparison', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (92, 'NETUTIL', 'simple', 'NUT', 'Network Utilization (Kbps)', 'Network Utilization (Kbps)', 'The current network utilisation of the system in kilobits per second.', '', 'netutil', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (93, 'PACKETCNT', 'simple', 'PKP', 'Number of Packets Processed', 'Number of Packets Processed', 'The number of packets processed in the last 5 minutes.', '', 'packetcnt', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (94, 'BYTECNT', 'simple', 'BYP', 'Number of Bytes Processed', 'Number of Bytes Processed', 'The number of bytes processed in the last 5 minutes.', '', 'bytecnt', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (95, 'AVCNT', 'simple', 'AVC', 'Number of Viruses Detected', 'Number of Viruses Detected', 'The number of viruses detected in the last 20 hours.', '', 'viruscnt', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (96, 'IPSCNT', 'simple', 'IPS', 'Number of IPS attacks detected', 'Number of IPS attacks detected', 'The number of IPS attacks detected in the last 20 hours.', '', 'ipscnt', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (97, 'FS_OCCUR', 'simple', 'FS_OCCUR', 'Alerts in last 5 minutes', 'Alerts in last 5 minutes', 'The number of virus alerts received by the policy manager(s) in the last 5 minutes, excluding redetected alerts. ', '', 'fs_occurancesInLast5minutes', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (98, 'FS_HOSTS', 'simple', 'FS_HOSTS', 'Total hosts', 'Total hosts', 'The total number of hosts identified by the policy manager(s).', '', 'fs_totalHosts', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (99, 'FS_REPORTED', 'simple', 'FS_REPORTED', 'Hosts reported in (7 days)', 'Hosts reported in (7 days)', 'The number of hosts which have reported into the policy manager(s) within the last 7 days.', '', 'fs_totalHostsReportedInLast7days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (100, 'FS_NOT_REPORTED', 'simple', 'FS_NOT_REPORTED', 'Hosts not reported in (7 days)', 'Hosts not reported in (7 days)', 'The number of hosts out of the total identified hosts that have not reported into the policy manager(s) within the last 7 days.', '', 'fs_totalHostsNotReportedInLast7days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (101, 'FS_PERC_REPORTED', 'simple', 'FS_PERC_REPORTED', '% hosts reported in (7 days)', '% hosts reported in (7 days)', 'The percentage of total hosts identified that have reported into the policy manager(s) within the last 7 days.', '', 'fs_percentageHostsReportedInLast7days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (102, 'FS_PERC_NOT_REPORTED', 'simple', 'FS_PERC_NOT_REPORTED', '% hosts not reported in (7 days)', '% hosts not reported in (7 days)', 'The percentage of total hosts identified that have not reported into the policy manager(s) within the last 7 days.', '', 'fs_percentageHostsNotReportedInLast7days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (103, 'FS_UPDATED', 'simple', 'FS_UPDATED', 'Updated hosts (7 days)', 'Updated hosts (7 days)', 'The number of hosts that have updated their virus definitions from the policy manager(s) within the past 7 days.', '', 'fs_totalUpdatedHosts', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (104, 'FS_OUTDATED', 'simple', 'FS_OUTDATED', 'Outdated hosts (7 days)', 'Outdated hosts (7 days)', 'The number of hosts that have not updated their virus definitions from the policy manager(s) within the last 7 days.', '', 'fs_totalOutdatedHosts', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (105, 'FS_PERC_UPDATED', 'simple', 'FS_PERC_UPDATED', '% updated hosts (7 days)', '% updated hosts (7 days)', 'The percentage of hosts that have updated their virus definitions from the policy manager(s) within the last 7 days based on the number hosts that have reported into the policy manager(s) within the last 7 days.', '', 'fs_percentageUpdatedHosts', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (106, 'FS_PERC_OUTDATED', 'simple', 'FS_PERC_OUTDATED', '% outdated hosts (7 days)', '% outdated hosts (7 days)', 'The percentage of hosts that have not updated their virus definitions from the policy manager(s) within the last 7 days based on the number hosts that have reported into the policy manager(s) within the last 7 days.', '', 'fs_percentageOutdatedHosts', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (107, 'FS_INFECTED', 'simple', 'FS_INFECTED', 'Alerted hosts', 'Alerted hosts', 'The number of hosts that have generated an alert within the last 24 hours, excluding redetected alerts.', '', 'fs_totalInfected', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (108, 'FS_PERC_INFECTED', 'simple', 'FS_PERC_INFECTED', '% alerted hosts (7 days)', '% alerted hosts (7 days)', 'The percentage of hosts that have generated an alert, excluding alerts for renamed items, within the last 24 hours based on the number hosts that have reported into the policy manager(s) within the last 7 days.', '', 'fs_percentageInfected', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (109, 'FS_TOP_VIRUSES', 'variable', 'FS_TOP_VIRUSES', 'Top 10 viruses', 'Top 10 viruses', 'The top 10 viruses alerted on over the past 24 hours, excluding alerts for renamed items, ordered according to the number of occurrences of a particular virus alert and providing the number of different hosts that have generated that particular virus alert.', '', 'FS_TOP_VIRUSES', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (110, 'FS_TOP_HOSTS', 'variable', 'FS_TOP_HOSTS', 'Top 10 alerted hosts', 'Top 10 alerted hosts', 'The top 10 hosts that have generated alerts over the past 24 hours, excluding alerts for renamed items, ordered according to the number of virus alerts generated by the host and providing the number of unique viruses alerted on.', '', 'FS_TOP_HOSTS', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (111, 'FAILO', 'simple', 'FAO', 'Failover', 'Failover', '???', '', 'failo', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (112, 'CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (113, 'FS_REPORTED14', 'simple', 'FS_REPORTED14', 'Hosts reported in (14 days)', 'Hosts reported in (14 days)', 'The number of hosts which have reported into the policy manager(s) within the last 14 days.', '', 'fs_totalHostsReportedInLast14days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (114, 'FS_NOT_REPORTED14', 'simple', 'FS_NOT_REPORTED14', 'Hosts not reported in (14 days)', 'Hosts not reported in (14 days)', 'The number of hosts out of the total identified hosts that have not reported into the policy manager(s) within the last 14 days.', '', 'fs_totalHostsNotReportedInLast14days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (115, 'FS_PERC_REPORTED14', 'simple', 'FS_PERC_REPORTED14', '% hosts reported in (14 days)', '% hosts reported in (14 days)', 'The percentage of total hosts identified that have reported into the policy manager(s) within the last 14 days.', '', 'fs_percentageHostsReportedInLast14days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (116, 'FS_PERC_NOT_REP14', 'simple', 'FS_PERC_NOT_REP14', '% hosts not reported in (14 days)', '% hosts not reported in (14 days)', 'The percentage of total hosts identified that have not reported into the policy manager(s) within the last 14 days.', '', 'fs_percentageHostsNotRepInLast14days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (117, 'FS_PERC_UPDATED14', 'simple', 'FS_PERC_UPDATED14', '% updated hosts (14 days)', '% updated hosts (14 days)', 'The percentage of hosts that have updated their virus definitions from the policy manager(s) within the last 14 days based on the number hosts that have reported into the policy manager(s) within the last 14 days.', '', 'fs_percentageUpdatedHosts14', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (118, 'FS_PERC_OUTDATED14', 'simple', 'FS_OUTDATED14', '% outdated hosts (14 days)', '% outdated hosts (14 days)', 'The percentage of hosts that have not updated their virus definitions from the policy manager(s) within the last 14 days based on the number hosts that have reported into the policy manager(s) within the last 14 days.', '', 'fs_percentageOutdatedHosts14', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (119, 'FS_UPDATED14', 'simple', 'FS_UPDATED14', 'Updated hosts (14 days)', 'Updated hosts (14 days)', 'The number of hosts that have updated their virus definitions from the policy manager(s) within the past 14 days.', '', 'fs_totalUpdatedHosts14', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (120, 'FS_OUTDATED14', 'simple', 'FS_OUTDATED14', 'Outdated hosts (14 days)', 'Outdated hosts (14 days)', 'The number of hosts that have not updated their virus definitions from the policy manager(s) within the last 14 days.', '', 'fs_totalOutdatedHosts14', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (121, 'FS_PERC_INFECTED14', 'simple', 'FS_PERC_INFECTED14', '% alerted hosts (14 days)', '% alerted hosts (14 days)', 'The percentage of hosts that have generated an alert, excluding alerts for renamed items, within the last 24 hours based on the number hosts that have reported into the policy manager(s) within the last 14 days.', '', 'fs_percentageInfected14', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (122, 'CP_MGMT_ACTIVE', 'simple', 'CP_MGMT_ACTIVE', 'Check Point Management Active ', 'Check Point Management Active ', 'Indicates whether the Check Point Management sub-system is running in active mode (2) or standby mode (1). Otherwise a zero is returned.', '', 'cp_mgmt_active', 0, NULL, NULL, 1, 2, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (123, 'CP_MGMT_STATUS', 'simple', 'CP_MGMT_STATUS', 'Check Point Management Status', 'Check Point Management Status', 'Indicates whether the Check Point Management sub-system status is \"OK\".', '', 'cp_mgmt_status', 0, NULL, NULL, 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (124, 'CP_SVN_STATUS', 'simple', 'CP_SVN_STATUS', 'Check Point SVN Status', 'Check Point SVN Status', 'Indicates whether the Check Point SVN sub-system status is \"OK\".', '', 'cp_svn_status', 0, NULL, NULL, 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (125, 'CP_FW_STATUS', 'simple', 'CP_FW_STATUS', 'Firewall status', 'Firewall status', 'Indicates whether a firewall policy is currently being enforced by the system.', '', 'cp_fw_status', 0, NULL, NULL, 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (127, 'FGSTATUS', 'simple', 'FGSTATUS', 'QoS status', 'QoS status', 'Indicates whether the Check Point QoS policy is currently being enforced by the Check Point gateway.', '', 'fgstatus', 0, NULL, 'Application', 1, 1, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (128, 'CP_VPN_CURRENT', 'simple', 'CP_VPN_CURRENT', '# of IKE SAs', '# of IKE SAs', 'Deprecated.', 'FireWall', 'cp_vpn_current', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (129, 'NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (130, 'TRAFFIC_KBIT', 'simple', 'TRAFFIC_KBIT', 'Network throughput inbound (Kbps)', 'Network throughput inbound (Kbps)', 'The average number of kilobits per second received by all network interfaces calculated by averaging the total number of bits received by all network interfaces in the last 5 minutes.', '', 'traffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (131, 'OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (132, 'TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (133, 'OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (134, 'CP_VPN_IPSEC', 'cmp', 'CP_VPN_IPSEC', 'IPSEC Tunnels', 'IPSEC Tunnels', 'The current number of inbound and outbound SPI\'s.\n', '', 'cp_vpn_ipsec', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (135, 'FS_RENAMED', 'simple', 'FS_RENAMED', 'Redetected alerts in last 5 minutes', 'Redetected alerts in last 5 minutes', 'The number of redetected virus alerts received by the policy manager(s) in the last 5 minutes. An alert is considered \"redetected\" when it has been previously detected and renamed.', '', 'fs_renamedInLast5minutes', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (136, 'CP_ACTIVE_NODE', 'simple', 'CP_ACTIVE_NODE', 'Node state', 'Node state', 'The current state of the virtual device (3=Active, 2=Standby, 1=Backup, 0=Down). A negative value indicates \"attention\" state.', '', 'cp_active_node', 0, NULL, NULL, 1, 1, 0, 0, 0, 0, '3=Active|2=Standby|1=Backup|0=Down|-1=Backup!|-2=Standby!|-3=Active!');
INSERT INTO `checktype` VALUES (137, 'CP_VSX_ACTIVE', 'simple', 'CP_VSX_ACTIVE', 'Active state devices', 'Active state devices', 'The number of virtual systems in an \"Active\" state on this physical server.', '', 'CP_VSX_ACTIVE', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (138, 'CP_VSX_CPU', 'cmp', 'CP_VSX_CPU', 'Virtual device CPU usage', 'Virtual device CPU usage', 'The average CPU usage per VS across all CPU cores for the past minute.', '', 'CP_VSX_CPU', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (139, 'CP_VSX_STANDBY', 'simple', 'CP_VSX_STANDBY', 'Standby state devices', 'Standby state devices', 'The number of virtual systems in an \"Standby\" state on this physical server.', '', 'CP_VSX_STANDBY', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (140, 'CP_VSX_BACKUP', 'simple', 'CP_VSX_BACKUP', 'Backup state devices', 'Backup state devices', 'The number of virtual systems in an \"Backup\" state on this physical server.', '', 'CP_VSX_BACKUP', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (141, 'CP_VSX_DOWN', 'simple', 'CP_VSX_DOWN', 'Down state devices', 'Down state devices', 'The number of virtual systems in an \"Down\" state on this physical server.', '', 'CP_VSX_DOWN', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (142, 'CP_VSX_STATE', 'cmp', 'CP_VSX_STATE', 'Virtual device state', 'Virtual device state', 'The number of virtual systems on this physical server counted by virtual system state - 3=Active, 2=Standby, 1=Backup, 0=Down.', '', 'CP_VSX_STATE', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (143, 'CP_VSX_VS_STATE', 'cmp', 'CP_VSX_VS_STATE', 'Individual VS state', 'Individual VS state', 'The status of Virtual Systems on this physical server - 3=Active, 2=Standby, 1=Backup, 0=Down.', '', 'CP_VSX_VS_STATE', 0, NULL, NULL, 1, 3, 0, 0, 0, 0, '3=Active|2=Standby|1=Backup|0=Down|-1=Backup!|-2=Standby!|-3=Active!');
INSERT INTO `checktype` VALUES (144, 'CP_VSX_IF', 'cmp', 'CP_VSX_IF', 'Monitored interface status', 'Monitored interface status', '', '', 'CP_VSX_IF', 0, NULL, NULL, 1, 1, 0, 0, 0, 0, '1=Up|0=Down');
INSERT INTO `checktype` VALUES (145, 'FS_ALERTED_HOSTS', 'simple', 'FS_ALERTED_HOSTS', 'Alerted hosts in the last 5 minutes', 'Alerted hosts in the last 5 minutes', 'The number of hosts that have generated an alert within the last 5 minutes, excluding redetected alerts.', '', 'fs_alertedHostsInLast5minutes', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (147, 'FS_NOT_REPORTED24', 'simple', 'FS_NOT_REPORTED24', 'Hosts not reported in (1 day)', 'Hosts not reported in (1 day)', 'The number of hosts out of the total identified hosts that have not reported into the policy manager(s) within the last 1 day.', '', 'fs_totalHostsNotReportedInLast24hours', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (148, 'FS_REPORTED24', 'simple', 'FS_REPORTED24', 'Hosts reported in (1 day)', 'Hosts reported in (1 day)', 'The number of hosts which have reported into the policy manager(s) within the last 1 day.', '', 'fs_totalHostsReportedInLast24hours', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (149, 'FS_PERC_REPORTED24', 'simple', 'FS_PERC_REPORTED24', '% hosts reported in (1 day)', '% hosts reported in (1 day)', 'The percentage of total hosts identified that have reported into the policy manager(s) within the last 1 day.', '', 'fs_percentageHostsReportedInLast24hours', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (150, 'FS_PERC_NOT_REPORTED24', 'simple', 'FS_PERC_NOT_REPORTED24', '% hosts not reported in (1 day)', '% hosts not reported in (1 day)', 'The percentage of total hosts identified that have not reported into the policy manager(s) within the last 1 day.', '', 'fs_percentageHostsNotRepInLast24hours', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (151, 'FS_UPDATED2', 'simple', 'FS_UPDATED2', 'Updated hosts (2 days)', 'Updated hosts (2 days)', 'The number of hosts that have updated their virus definitions from the policy manager(s) within the past 2 days.', '', 'fs_totalUpdatedHosts2', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (152, 'FS_OUTDATED2', 'simple', 'FS_OUTDATED2', 'Outdated hosts (2 days)', 'Outdated hosts (2 days)', 'The number of hosts that have not updated their virus definitions from the policy manager(s) within the last 2 days.', '', 'fs_totalOutdatedHosts2', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (153, 'FS_PERC_UPDATED2', 'simple', 'FS_PERC_UPDATED2', '% updated hosts (2 days)', '% updated hosts (2 days)', 'The percentage of hosts that have updated their virus definitions from the policy manager(s) within the last 2 days based on the number hosts that have reported into the policy manager(s) within the last 2 days.', '', 'fs_percentageUpdatedHosts2', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (154, 'FS_PERC_OUTDATED2', 'simple', 'FS_PERC_OUTDATED2', '% outdated hosts (2 days)', '% outdated hosts (2 days)', 'The percentage of hosts that have not updated their virus definitions from the policy manager(s) within the last 2 days based on the number hosts that have reported into the policy manager(s) within the last 2 days.', '', 'fs_percentageOutdatedHosts2', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (155, 'FS_NOT_REPORTED2', 'simple', 'FS_NOT_REPORTED2', 'Hosts not reported in (2 days)', 'Hosts not reported in (2 days)', 'The number of hosts out of the total identified hosts that have not reported into the policy manager(s) within the last 2 days.', '', 'fs_totalHostsNotReportedInLast2days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (156, 'FS_OUTDATED24', 'simple', 'FS_OUTDATED24', 'Outdated hosts (1 day)', 'Outdated hosts (1 day)', 'The number of hosts that have not updated their virus definitions from the policy manager(s) within the last 1 day.', '', 'fs_totalOutdatedHosts24', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (157, 'FS_PERC_INFECTED2', 'simple', 'FS_PERC_INFECTED2', '% alerted hosts (2 days)', '% alerted hosts (2 days)', 'The percentage of hosts that have generated an alert, excluding alerts for renamed items, within the last 24 hours based on the number hosts that have reported into the policy manager(s) within the last 2 days.', '', 'fs_percentageInfected2', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (158, 'FS_PERC_INFECTED24', 'simple', 'FS_PERC_INFECTED24', '% alerted hosts (1 day)', '% alerted hosts (1 day)', 'The percentage of hosts that have generated an alert, excluding alerts for renamed items, within the last 24 hours based on the number hosts that have reported into the policy manager(s) within the last 1 day.', '', 'fs_percentageInfected24', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (159, 'FS_PERC_NOT_REPORTED2', 'simple', 'FS_PERC_NOT_REPORTED2', '% hosts not reported in (2 days)', '% hosts not reported in (2 days)', 'The percentage of total hosts identified that have not reported into the policy manager(s) within the last 2 days.', '', 'fs_percentageHostsNotRepInLast2days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (160, 'FS_PERC_OUTDATED24', 'simple', 'FS_PERC_OUTDATED24', '% outdated hosts (1 day)', '% outdated hosts (1 day)', 'The percentage of hosts that have not updated their virus definitions from the policy manager(s) within the last 1 days based on the number hosts that have reported into the policy manager(s) within the last 1 day.', '', 'fs_percentageOutdatedHosts24', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (161, 'FS_PERC_REPORTED2', 'simple', 'FS_PERC_REPORTED2', '% hosts reported in (2 days)', '% hosts reported in (2 days)', 'The percentage of total hosts identified that have reported into the policy manager(s) within the last 2 days.', '', 'fs_percentageHostsReportedInLast2days', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (162, 'FS_PERC_UPDATED24', 'simple', 'FS_PERC_UPDATED24', '% updated hosts (1 day)', '% updated hosts (1 day)', 'The percentage of hosts that have updated their virus definitions from the policy manager(s) within the last 1 days based on the number hosts that have reported into the policy manager(s) within the last 1 day.', '', 'fs_percentageUpdatedHosts24', 0, NULL, NULL, 1, 0, 0, 2, 0, 1, NULL);
INSERT INTO `checktype` VALUES (163, 'FS_REPORTED2', 'simple', 'FS_REPORTED2', 'Hosts reported in (2 days)', 'Hosts reported in (2 days)', 'The number of hosts which have reported into the policy manager(s) within the last 2 days.', '', 'fs_totalHostsReportedInLast2days', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (164, 'FS_UPDATED24', 'simple', 'FS_UPDATED24', 'Updated hosts (1 day)', 'Updated hosts (1 day)', 'The number of hosts that have updated their virus definitions from the policy manager(s) within the past 1 day.', '', 'fs_totalUpdatedHosts24', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (165, 'CP_PERMANENT_VPN', 'cmp', 'CP_PERMANENT_VPN', 'Permanent tunnels', 'Permanent tunnels', 'The current number of Site to Site VPNs', '', 'CP_PERMANENT_VPN', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (166, 'FS_NEW_VIRUS', 'simple', 'FS_NEW_VIRUS', 'New viruses in last 5 minutes', 'New viruses in last 5 minutes', 'The number of new virus alerts received by the policy manager(s) in the last 5 minutes, excluding redetected alerts.', '', 'fs_newVirusInLast5minutes', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (174, 'FSAUDIT_TOT_HOSTS', 'simple', 'fsaudit_total_hosts', 'Total users', 'Total users', 'The total number of users within the network', '', 'fsaudit_total_hosts', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (168, 'FS_AUDIT_TOT_HOSTS_WITH_FS', 'simple', 'fsaudit_total_hosts_with_fs', 'Hosts with FS', 'Hosts with FS', 'Total hosts with fsecure installed', '', 'fsaudit_total_hosts_with_fs', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (169, 'FS_AUDIT_TOT_HOSTS_WITHOUT_FS', 'simple', 'fsaudit_total_hosts_without_fs', 'Hosts without FS', 'Hosts without FS', 'Total hosts without fsecure installed', '', 'fsaudit_total_hosts_without_fs', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (170, 'FS_AUDIT_PERC_HOSTS_WITH_FS', 'simple', 'fsaudit_perc_hosts_with_fs', '% hosts with FS', '% hosts with FS', 'Percentage of hosts with fsecure installed', '', 'fsaudit_perc_hosts_with_fs', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (171, 'FS_AUDIT_PERC_HOSTS_WITHOUT_FS', 'simple', 'fsaudit_perc_hosts_without_fs', '% hosts without FS', '% hosts without FS', 'Percentage of hosts without fsecure installed', '', 'fsaudit_perc_hosts_without_fs', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (172, 'MAJOR_FS_VERS', 'cmp', 'major_fs_version', 'major fsecure version', 'major fsecure version', 'major fsecure versionn', '', 'major_fs_version', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (173, 'FSAUDIT_USER_OS', 'cmp', 'fsaudit_user_os', 'number of users per operating system', 'number of users per operating system', 'number of users per operating system', '', 'fsaudit_user_os', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (175, 'FSAUDIT_GK_INACTIVE', 'simple', 'fsaudit_user_gk_inactive', 'Users with fsecure and inactive gatekeepers', 'Users with fsecure and inactive gatekeepers', NULL, '', 'fsaudit_user_gk_inactive', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (176, 'FSAUDIT_FS_OUTDATED', 'simple', 'fsaudit_fs_outdated', 'Amount of users with outdated FSecure versions', 'Outdated FSecure versions', NULL, '', 'fsaudit_fs_outdated', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (177, 'FLASH_USAGE', 'simple', 'FLASH_USAGE', 'Percentage flash usage', 'Percentage flash usage', '', '', 'FLASH_USAGE', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (178, 'CONFIG_SAVED', 'simple', 'CONFIG_SAVED', 'Configuration saved', 'Configuration saved', '', '', 'CONFIG_SAVED', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (179, 'CACHE_HIT_RATIO', 'simple', 'CACHE_HIT_RATIO', 'Cache hit ratio', 'Cache hit ratio', 'The hit ratio for cached content from the proxy.', '', 'CACHE_HIT_RATIO', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (180, 'REQUESTS_RECEIVED', 'cmp', 'REQUESTS_RECEIVED', 'Requests received', 'Requests received', 'The number of http and https requests received in last 5 minutes.', '', 'REQUESTS_RECEIVED', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (181, 'CONCURRENT_USERS', 'simple', 'CONCURRENT_USERS', 'Concurrent users', 'Concurrent users', 'The number of unique users currently \"using\" the proxy.', '', 'CONCURRENT_USERS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (182, 'CLIENT_CONNECTIONS', 'simple', 'CLIENT_CONNECTIONS', 'Established proxy connections ', 'Established proxy connections ', 'The number of connections currently established to the proxy.', '', 'CLIENT_CONNECTIONS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (183, 'ACCEPTED_CONNECTIONS', 'simple', 'ACCEPTED_CONNECTIONS', 'Accepted connections', 'Accepted connections', 'The number of accepted connections in last 5 minutes.', '', 'ACCEPTED_CONNECTIONS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (184, 'PULSE_DB_COUNTS', 'cmp', 'PULSE_DB_COUNTS', 'Database row counts (cumulative)', 'Database row counts (cumulative)', '', '', 'PULSE_DB_COUNTS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (185, 'PULSE_LICENSE_EXPIRY', 'cmp', 'PULSE_LICENSE_EXPIRY', 'Days to license expiry', 'Days to license expiry', '', '', 'PULSE_LICENSE_EXPIRY', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (186, 'FS_TOP_UNACTIONED_VIRUSES', 'variable', 'FS_TOP_UNACTIONED_VIRUSES', 'Top 10 un-actioned viruses', 'Top 10 viruses (un-actioned)', 'The top 10 un-actioned viruses alerted on over the past 24 hours, including alerts where the action taken is \"Unspecified\", \"None\", \"Allow\", \"Ignore\" and \"Ignore always\". Ordering is done according to the number of different hosts that have generated that particular virus alert and providing the number of virus alerts generated.', '', 'FS_TOP_UNACTIONED_VIRUSES', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (187, 'FS_TOP_UNACTIONED_HOSTS', 'variable', 'FS_TOP_UNACTIONED_HOSTS', 'Top 10 un-actioned alerted hosts', 'Top 10 alerted hosts (un-actioned)', 'The top 10 hosts that have generated un-actioned alerts over the past 24 hours, including alerts where the action taken is \"Unspecified\", \"None\", \"Allow\", \"Ignore\" and \"Ignore always\". Ordering is done according to the number of virus alerts generated by the host and providing the number of unique viruses alerted on.', '', 'FS_TOP_UNACTIONED_HOSTS', 0, NULL, NULL, 1, 0, 0, 0, 0, 1, NULL);
INSERT INTO `checktype` VALUES (188, 'MYSQL_CONNECTIONS', 'simple', 'MYSQL_CONNECTIONS', 'MySQL connections', 'MySQL connections', 'The number of currently open MySQL connections', '', 'mysql_connections', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (189, 'MYSQL_PERC_CONNECTION_USAGE', 'simple', 'MYSQL_PERC_CONNECTION_USAGE', 'Percentage of MySQL connections', 'Percentage of MySQL connections', 'The percentage of MySQL connections currently in use out of a finite pool of connections', '', 'mysql_perc_connection_usage', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (190, 'CP_VSX_HOST_NODE_STATUS', 'cmp', 'CP_VSX_HOST_NODE_STATUS', 'VS host node status', 'VS host node status', 'Display VS status by host node', '', 'CP_VSX_HOST_NODE_STATUS', 0, NULL, NULL, 1, NULL, NULL, 0, 0, 0, '3=Active|2=Standby|1=Backup|0=Down|-1=Backup!|-2=Standby!|-3=Active!');
INSERT INTO `checktype` VALUES (191, 'SYSINFO_NET', 'sysinfo', 'SYS_NET', 'Network information', 'Network information', '', '', '18', 0, NULL, 'Network', 0, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (192, 'PULSE_DB_COUNTS_FIVE_MIN', 'cmp', 'PULSE_DB_COUNTS_FIVE_MIN', 'Database row counts (last 5 minutes)', 'Database row counts (last 5 minutes)', NULL, '', 'PULSE_DB_COUNTS_FIVE_MIN', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (193, 'PULSE_QUEUE_BLOCKS', 'simple', 'PULSE_QUEUE_BLOCKS', 'Queued blocks', 'Queued blocks', 'The number of data blocks waiting to be processed', '', 'PULSE_QUEUE_BLOCKS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (194, 'TDP', 'simple', 'TDP', 'Total dropped packets', 'Dropped packets', 'The number of packets across all interfaces dropped and rejected by the firewall in the last 5 minutes.', 'FireWall', 'tdp', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL);
INSERT INTO `checktype` VALUES (195, 'CP_VSX_CONNECTIONS', 'simple', 'CP_VSX_CONNECTIONS', 'VSX concurrent connections', 'VSX concurrent connections', 'The total number of connections being handled by virtual systems in an active state', '', 'CP_VSX_CONNECTIONS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (196, 'MGMT_UPTIME', 'simple', 'MGMT_UPT', 'Mgmt uptime', 'Mgmt uptime', 'Indicates that the management plane of the system has recently booted. A value of 2 is returned if the management plane of the system was booted within the last 30 minutes and a value of 1 is returned if the management plane of the system was booted within the last 60 minutes', 'System', 'mgmt_uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL);
INSERT INTO `checktype` VALUES (197, 'MGMT_MEM', 'simple', 'MGMT_MEM', 'Mgmt percentage memory free', 'Mgmt percentage memory free', 'The percentage of memory currently available on the management plane of the system.', 'System', 'mgmt_mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (198, 'MGMT_CPU', 'simple', 'MGMT_CPU', 'Mgmt percentage CPU utilisation', 'Mgmt percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores of the management plane of the system.', 'System', 'mgmt_cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (199, 'PDB_STAT', 'simple', 'PDB_STAT', 'SmartEvent PostgresDB status', 'SmartEvent PostgresDB status', 'The status of the Postgres DBMS used by the SmartEvent Manager (SEM) to store events. A value of 1 indicates that the DBMS is available. A value of 0 indicates that the DMNS is unavailale.', '', 'pdb_stat', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (200, 'CPSEMD_STAT', 'simple', 'CPSEMD_STAT', 'SmartEvent cpsemd status', 'SmartEvent cpsemd status', 'The status of the Check Point SmartEvent Management daemon process. A value of 1 indicates that the process is running, whereas a value of 0 indicates that the process appears to be down.', '', 'cpsemd_stat', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (201, 'EVENT_CNT', 'simple', 'EVENT_CNT', 'SmartEvent number of events in last 5 minutes', 'SmartEvent number of events in last 5 minutes', 'The number of events received by the SmartEvent Manager from the correlation unit(s) in the last 5 minutes.', '', 'eventcnt', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (202, 'DCUP', 'simple', 'DCUP', 'SmartEvent database capacity usage percentage', 'SmartEvent database capacity usage percentage', 'The percentage of the Postgres event database currently used.', '', 'dcup', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (203, 'TSLE', 'simple', 'TSLE', 'SmartEvent time since last event (seconds)', 'SmartEvent time since last event (seconds)', 'The time in seconds since the last event was received from any of the correlation units.', '', 'tsle', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (204, 'TSLE_CU', 'cmp', 'TSLE_CU', 'SmartEvent time since last event per correlation unit (seconds)', 'SmartEvent time since last event per correlation unit (seconds)', 'The time in seconds since the last event was received per correlation unit.', '', 'tsle_cu', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (205, 'CPSEAD_STAT', 'simple', 'CPSEAD_STAT', 'SmartEvent cpsead status', 'SmartEvent cpsead status', 'The status of the Check Point SmartEvent Analysis daemon process. A value of 1 indicates that the process is running, whereas a value of 0 indicates that the process appears to be down.', '', 'cpsead_stat', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (206, 'CPSEAD_CSTAT', 'simple', 'CPSEAD_CSTAT', 'SmartEvent cpsead connection status', 'SmartEvent cpsead connection status', 'Indicates whether the Check Point SmartEvent Analysis daemon process (correlation unit) is connected to the SmartEvent Manager (SEM). A value of 0 indicates that it is not connected to the SEM whereas a value of 1 means it is connected.', '', 'cpsead_cstat', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (207, 'LOGS_CNT', 'simple', 'LOGS_CNT', 'SmartEvent number of logs processed in last 5 minutes', 'SmartEvent number of logs processed in last 5 minutes', 'The number of logs processed by the SmartEvent Analysis daemon (correlation unit) in the last 5 minutes.', '', 'logscnt', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (208, 'EVENT_CNT_CU', 'cmp', 'EVENT_CNT_CU', 'SmartEvent number of events received per correlation unit in the last 5 minutes', 'SmartEvent number of events received per correlation unit in the last 5 minutes', 'The number of events received in last 5 minutes per correlation unit.', '', 'event_cnt_cu', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (209, 'PSU', 'simple', 'PSU', 'PSU active count', 'PSU active count', 'The number of power supply units active in the system. A power supply unit is considered active if it is receiving power.', '', 'psu', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (210, 'HEALTH_CHECKS', 'cmp', 'HEALTH_CHECKS', 'Health checks', 'Health checks', 'This attribute returns the status of implicitly and explicitly configured Blue Coat health checks. For each configured health check, the attribute returns 0 if the health check reports a status of DOWN and it returns 1 if the health check reports a status of UP.', '', 'HEALTH_CHECKS', 0, NULL, NULL, 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (213, 'CP_INDEXER', 'simple', 'CP_INDEXER', 'SmartLog indexer number of logs read in last 5 minutes ', 'SmartLog indexer number of logs read in last 5 minutes ', 'The number of logs read by the SmartLog indexer in the last 5 minutes.', '', 'cp_indexer', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (214, 'S_UPDATE', 'cmp', 'S_UPDATE', 'Security updates', 'Security updates', 'Time in minutes since the last security update/download ', '', 's_update', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (215, 'BOND_IF_STAT', 'cmp', 'BOND_IF_STAT', 'Aggregate interface status', 'Aggregate interface status', 'Returns the number of physical interfaces in an up status for each bond interface/aggregated link.', '', 'bond_if_stat', 0, NULL, 'Platform', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (216, 'FORTILOGD_STAT', 'simple', 'FORTILOGD_STAT', 'fortilogd status ', 'Fortilogd status', 'Fortilogd status', '', 'forti_logd_status', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (217, 'FORTILOGD_RECIEVED', 'simple', 'FORTILOGD_RECIEVED', 'fortilogd logs received in last 5 minutes', 'Fortilogd number of logs received in the last 5 minutes ', 'Fortilogd number of logs received in the last 5 minutes', '', 'forti_log_recieved', 0, NULL, 'Application', 1, NULL, NULL, 2, 0, 0, NULL);
INSERT INTO `checktype` VALUES (218, 'CONNSETUP', 'simple', 'CSETUP', 'Connection setup rate', 'Connection setup rate', 'The number of new connections per second.', 'FireWall', 'connsetuprate', 0, NULL, 'Application', 1, NULL, NULL, 0, 0, 0, NULL);

-- ----------------------------
-- Table structure for custom_addSystemWizard
-- ----------------------------
DROP TABLE IF EXISTS `custom_addSystemWizard`;
CREATE TABLE `custom_addSystemWizard`  (
  `custom_addSystemWizard_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `enabled` int(20) NULL DEFAULT NULL,
  PRIMARY KEY (`custom_addSystemWizard_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of custom_addSystemWizard
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard
-- ----------------------------
DROP TABLE IF EXISTS `dashboard`;
CREATE TABLE `dashboard`  (
  `dashboard_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dashboard_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard
-- ----------------------------

-- ----------------------------
-- Table structure for dashboard_slide
-- ----------------------------
DROP TABLE IF EXISTS `dashboard_slide`;
CREATE TABLE `dashboard_slide`  (
  `dashboard_slide_id` int(11) NOT NULL AUTO_INCREMENT,
  `dashboard_id` int(11) NULL DEFAULT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menuTree_id` int(11) NULL DEFAULT NULL,
  `setting_logHeight` int(5) NULL DEFAULT NULL,
  `setting_statusFilter` int(5) NULL DEFAULT NULL,
  `setting_delay` int(5) NULL DEFAULT NULL,
  `setting_order` int(2) NULL DEFAULT NULL,
  `setting_pie` int(2) NULL DEFAULT 1,
  PRIMARY KEY (`dashboard_slide_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 115 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dashboard_slide
-- ----------------------------

-- ----------------------------
-- Table structure for dataSource
-- ----------------------------
DROP TABLE IF EXISTS `dataSource`;
CREATE TABLE `dataSource`  (
  `dataSourceId` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `credentials` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `host_id` int(11) NULL DEFAULT NULL,
  `firstStampLocal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `lastStampRemote` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `lastStampLocal` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `executionStamp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `newVirusImport` tinyint(1) NULL DEFAULT 0,
  `dataSourceTypeTemplateId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dataSourceId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 34 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSource
-- ----------------------------

-- ----------------------------
-- Table structure for dataSourceAttribute
-- ----------------------------
DROP TABLE IF EXISTS `dataSourceAttribute`;
CREATE TABLE `dataSourceAttribute`  (
  `dataSourceAttributeId` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceTypeId` int(11) NULL DEFAULT NULL,
  `dataSourceEntityTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dataSourceAttributeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 54 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSourceAttribute
-- ----------------------------
INSERT INTO `dataSourceAttribute` VALUES (1, 1, 0, 'topViruses', 'Top 10 Viruses');
INSERT INTO `dataSourceAttribute` VALUES (2, 1, 0, 'topHosts', 'Top 10 Infected Hosts');
INSERT INTO `dataSourceAttribute` VALUES (3, 1, 0, 'notReported', 'Hosts not reported in the last 7 days');
INSERT INTO `dataSourceAttribute` VALUES (4, 1, 0, 'reported', 'Hosts reported in the last 7 days');
INSERT INTO `dataSourceAttribute` VALUES (5, 1, 0, 'infected', 'Alerted hosts');
INSERT INTO `dataSourceAttribute` VALUES (6, 1, 0, 'updated', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (7, 1, 0, 'outdated', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (8, 1, 0, 'lastAlerts', 'Alerts in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (9, 2, 0, 'topViruses', 'Top 10 Viruses');
INSERT INTO `dataSourceAttribute` VALUES (10, 2, 0, 'topHosts', 'Top 10 Infected Hosts');
INSERT INTO `dataSourceAttribute` VALUES (11, 2, 0, 'notReported', 'Hosts not reported in the last 7 days');
INSERT INTO `dataSourceAttribute` VALUES (12, 2, 0, 'reported', 'Hosts reported in the last 7 days');
INSERT INTO `dataSourceAttribute` VALUES (13, 2, 0, 'infected', 'Alerted hosts');
INSERT INTO `dataSourceAttribute` VALUES (14, 2, 0, 'updated', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (15, 2, 0, 'outdated', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (16, 2, 0, 'lastAlerts', 'Alerts in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (17, 1, 0, 'notReported14', 'Hosts not reported in the last 14 days');
INSERT INTO `dataSourceAttribute` VALUES (18, 1, 0, 'reported14', 'Hosts reported in the last 14 days');
INSERT INTO `dataSourceAttribute` VALUES (19, 1, 0, 'updated14', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (20, 1, 0, 'outdated14', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (21, 2, 0, 'notReported14', 'Hosts not reported in the last 14 days');
INSERT INTO `dataSourceAttribute` VALUES (22, 2, 0, 'reported14', 'Hosts reported in the last 14 days');
INSERT INTO `dataSourceAttribute` VALUES (23, 2, 0, 'updated14', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (24, 2, 0, 'outdated14', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (25, 1, 0, 'renamedAlerts', 'Renamed alerts in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (26, 2, 0, 'renamedAlerts', 'Renamed alerts in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (27, 1, 0, 'alertedHosts', 'alertedHosts');
INSERT INTO `dataSourceAttribute` VALUES (28, 2, 0, 'alertedHosts', 'alertedHosts');
INSERT INTO `dataSourceAttribute` VALUES (29, 1, 0, 'notReported24', 'Hosts not reported in the last 24 hours');
INSERT INTO `dataSourceAttribute` VALUES (30, 1, 0, 'reported24', 'Hosts reported in the last 24 hours');
INSERT INTO `dataSourceAttribute` VALUES (31, 1, 0, 'updated2', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (32, 1, 0, 'outdated2', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (33, 2, 0, 'notReported24', 'Hosts not reported in the last 24 hours');
INSERT INTO `dataSourceAttribute` VALUES (34, 2, 0, 'reported24', 'Hosts reported in the last 24 hours');
INSERT INTO `dataSourceAttribute` VALUES (35, 2, 0, 'updated2', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (36, 2, 0, 'outdated2', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (37, 1, 0, 'notReported2', 'Hosts not reported in the last 2 days');
INSERT INTO `dataSourceAttribute` VALUES (38, 2, 0, 'notReported2', 'Hosts not reported in the last 2 days');
INSERT INTO `dataSourceAttribute` VALUES (39, 1, 0, 'reported2', 'Hosts reported in the last 2 days');
INSERT INTO `dataSourceAttribute` VALUES (40, 2, 0, 'reported2', 'Hosts reported in the last 2 days');
INSERT INTO `dataSourceAttribute` VALUES (41, 1, 0, 'outdated24', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (42, 2, 0, 'outdated24', 'Outdated hosts');
INSERT INTO `dataSourceAttribute` VALUES (43, 1, 0, 'updated24', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (44, 2, 0, 'updated24', 'Updated hosts');
INSERT INTO `dataSourceAttribute` VALUES (45, 1, 0, 'totalHosts', 'Total hosts');
INSERT INTO `dataSourceAttribute` VALUES (46, 2, 0, 'totalHosts', 'Total hosts');
INSERT INTO `dataSourceAttribute` VALUES (47, 1, 0, 'newVirusInLast5minutes', 'New viruses in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (48, 2, 0, 'newVirusInLast5minutes', 'New viruses in last 5 minutes');
INSERT INTO `dataSourceAttribute` VALUES (49, 4, 0, 'FS Audit', 'FS Audit');
INSERT INTO `dataSourceAttribute` VALUES (50, 2, 0, 'topUnactioned_Viruses', 'Top 10 un-actioned viruses');
INSERT INTO `dataSourceAttribute` VALUES (51, 2, 0, 'topUnactioned_Hosts', 'Top 10 un-actioned Hosts');
INSERT INTO `dataSourceAttribute` VALUES (52, 1, 0, 'topUnactioned_Hosts', 'Top 10 un-actioned Hosts');
INSERT INTO `dataSourceAttribute` VALUES (53, 1, 0, 'topUnactioned_Viruses', 'Top 10 un-actioned viruses');

-- ----------------------------
-- Table structure for dataSourceEntity
-- ----------------------------
DROP TABLE IF EXISTS `dataSourceEntity`;
CREATE TABLE `dataSourceEntity`  (
  `dataSourceEntityId` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceEntityTypeId` int(11) NULL DEFAULT NULL,
  `dataSourceId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dataSourceEntityId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSourceEntity
-- ----------------------------

-- ----------------------------
-- Table structure for dataSourceEntityType
-- ----------------------------
DROP TABLE IF EXISTS `dataSourceEntityType`;
CREATE TABLE `dataSourceEntityType`  (
  `dataSourceEntityTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceTypeId` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dataSourceEntityTypeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSourceEntityType
-- ----------------------------
INSERT INTO `dataSourceEntityType` VALUES (1, 1, 'Host', 'This is an F-Secure host.');

-- ----------------------------
-- Table structure for dataSourceType
-- ----------------------------
DROP TABLE IF EXISTS `dataSourceType`;
CREATE TABLE `dataSourceType`  (
  `dataSourceTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `active` tinyint(1) NULL DEFAULT NULL,
  `required_fields` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitor_agent_id` int(11) NULL DEFAULT NULL,
  `mapToDataSourceTypeId` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`dataSourceTypeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSourceType
-- ----------------------------
INSERT INTO `dataSourceType` VALUES (1, 'F-Secure', 'F-Secure policy manager', 1, 'special|type|Method||text|hostDb|IP Address||text|username|Username||password|password|Password||text|hostname|Remote hostname||text|ip|Pulse server|', 5, NULL);
INSERT INTO `dataSourceType` VALUES (2, 'Anti-virus summary', 'Anti-virus summary', 1, NULL, 6, NULL);
INSERT INTO `dataSourceType` VALUES (3, 'Anti-virus summary (Hierarchical)', 'Anti-virus summary (Hierarchical)', 1, NULL, 6, NULL);
INSERT INTO `dataSourceType` VALUES (4, 'F-Secure Audit', 'F-Secure Audit', 1, NULL, 8, NULL);
INSERT INTO `dataSourceType` VALUES (6, 'Forefront Anti-virus Manager', 'Forefront Anti-virus Manager', 1, 'text|hostDb|IP Address||text|username|Username||password|password|Password||hidden|type|forefront', 5, 1);
INSERT INTO `dataSourceType` VALUES (7, 'Syslog', 'Syslog', 1, 'text|hostname|Hostname', 11, NULL);
INSERT INTO `dataSourceType` VALUES (8, 'F-Secure PM10 ', 'F-Secure policy manager version 10', 1, 'text|pm10Db|IP Address||text|username|Username||password|password|Password', 5, 1);
INSERT INTO `dataSourceType` VALUES (10, 'Symantec Endpoint Protection Manager', 'Symantec Endpoint Protection Manager', 1, 'text|symantec|IP Address||text|username|Username||password|password|Password||text|group|Group', 5, 1);
INSERT INTO `dataSourceType` VALUES (11, 'Trend Endpoint Protection Manager', 'Trend Endpoint Protection Manager', 1, 'text|trend|IP Address||text|username|Username||password|password|Password', 5, 1);

-- ----------------------------
-- Table structure for dataSourceValue
-- ----------------------------
DROP TABLE IF EXISTS `dataSourceValue`;
CREATE TABLE `dataSourceValue`  (
  `dataSourceValueId` int(11) NOT NULL AUTO_INCREMENT,
  `dataSourceAttributeId` int(11) NULL DEFAULT NULL,
  `dataSourceId` int(11) NULL DEFAULT NULL,
  `dataSourceEntityId` int(11) NULL DEFAULT NULL,
  `data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`dataSourceValueId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 335 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dataSourceValue
-- ----------------------------

-- ----------------------------
-- Table structure for enviro_latest_data
-- ----------------------------
DROP TABLE IF EXISTS `enviro_latest_data`;
CREATE TABLE `enviro_latest_data`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `test` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `actual_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alert_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `timestamp` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `y_sc` int(11) NOT NULL DEFAULT 0,
  `r_sc` int(11) NOT NULL DEFAULT 0,
  `interim_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`siteid`, `hostid`, `test`) USING BTREE,
  INDEX `enviro_latest_data_index`(`test`, `siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of enviro_latest_data
-- ----------------------------

-- ----------------------------
-- Table structure for environment
-- ----------------------------
DROP TABLE IF EXISTS `environment`;
CREATE TABLE `environment`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `description` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `hostid` int(11) NULL DEFAULT 0,
  `company_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 730 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Environment Information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of environment
-- ----------------------------

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
  `event_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `eventType_id` int(11) UNSIGNED NOT NULL,
  `timestamp` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`event_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of event
-- ----------------------------

-- ----------------------------
-- Table structure for eventData
-- ----------------------------
DROP TABLE IF EXISTS `eventData`;
CREATE TABLE `eventData`  (
  `eventData_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` int(11) UNSIGNED NOT NULL,
  `dataKey` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dataValue` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`eventData_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eventData
-- ----------------------------

-- ----------------------------
-- Table structure for eventReference
-- ----------------------------
DROP TABLE IF EXISTS `eventReference`;
CREATE TABLE `eventReference`  (
  `eventReference_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `event_id` int(11) UNSIGNED NOT NULL,
  `eventReferenceType_id` int(11) UNSIGNED NOT NULL,
  `eventReference` int(11) UNSIGNED NOT NULL,
  PRIMARY KEY (`eventReference_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of eventReference
-- ----------------------------

-- ----------------------------
-- Table structure for eventReferenceType
-- ----------------------------
DROP TABLE IF EXISTS `eventReferenceType`;
CREATE TABLE `eventReferenceType`  (
  `eventReferenceType_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `niceName` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`eventReferenceType_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eventReferenceType
-- ----------------------------
INSERT INTO `eventReferenceType` VALUES (1, 'system', 'System');
INSERT INTO `eventReferenceType` VALUES (2, 'company', 'Company');

-- ----------------------------
-- Table structure for eventType
-- ----------------------------
DROP TABLE IF EXISTS `eventType`;
CREATE TABLE `eventType`  (
  `eventType_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `niceName` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`eventType_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of eventType
-- ----------------------------
INSERT INTO `eventType` VALUES (1, 'ipchange', 'IP Address change');

-- ----------------------------
-- Table structure for file_download
-- ----------------------------
DROP TABLE IF EXISTS `file_download`;
CREATE TABLE `file_download`  (
  `file_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `status` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`file_download_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of file_download
-- ----------------------------

-- ----------------------------
-- Table structure for global_backup_period
-- ----------------------------
DROP TABLE IF EXISTS `global_backup_period`;
CREATE TABLE `global_backup_period`  (
  `global_backup_period` int(11) NOT NULL AUTO_INCREMENT,
  `backup_period` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`global_backup_period`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of global_backup_period
-- ----------------------------

-- ----------------------------
-- Table structure for hostname
-- ----------------------------
DROP TABLE IF EXISTS `hostname`;
CREATE TABLE `hostname`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `description` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `url` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `category` varchar(8) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `atime` smallint(5) NOT NULL DEFAULT 0,
  `alert` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `host_description` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `unit` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'MSS',
  `backalert_down` int(3) NULL DEFAULT NULL,
  `canback` int(3) NOT NULL DEFAULT 1,
  `backalert` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `inreport` int(3) NOT NULL DEFAULT 1,
  `backalert_failed` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `stime` smallint(5) NOT NULL DEFAULT 4,
  `agent_type` tinyint(1) NULL DEFAULT 0,
  `run_id` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `backup_notification_on` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `period_to_keep_backups` int(11) NOT NULL DEFAULT 0,
  `os_id` int(11) NOT NULL DEFAULT 0,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NULL DEFAULT NULL,
  `MSP_IP` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `monitor_platform_id` int(11) NULL DEFAULT NULL,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT NULL,
  `monitor_agent_id` int(11) NULL DEFAULT NULL,
  `monitor_application_ids` varchar(33) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `added_timestamp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `communication_status` smallint(5) NULL DEFAULT 0,
  `communication_status_timestamp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `infogather` tinyint(4) NULL DEFAULT 1,
  `statsgather` tinyint(4) NULL DEFAULT 1,
  `identifier` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `identifier_fields` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `business_Function` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `owner` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `identifier_integrity`(`identifier`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6758 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Hostname Information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of hostname
-- ----------------------------

-- ----------------------------
-- Table structure for latest_data
-- ----------------------------
DROP TABLE IF EXISTS `latest_data`;
CREATE TABLE `latest_data`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `test` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `actual_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `alert_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `y_sc` int(11) NOT NULL DEFAULT 0,
  `r_sc` int(11) NOT NULL DEFAULT 0,
  `nd_sc` int(11) NOT NULL DEFAULT 0,
  `interim_status` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `additional_data` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `warning_alert_delay_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `critical_alert_delay_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`siteid`, `hostid`, `test`) USING BTREE,
  INDEX `latest_data_index`(`test`, `siteid`, `hostid`) USING BTREE,
  INDEX `test`(`test`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of latest_data
-- ----------------------------

-- ----------------------------
-- Table structure for log
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log`  (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `logCategory_id` int(11) NULL DEFAULT NULL,
  `logAction_id` int(11) NULL DEFAULT NULL,
  `logType_id` int(11) NULL DEFAULT NULL,
  `company_id` int(11) NULL DEFAULT NULL,
  `host_id` int(11) NULL DEFAULT NULL,
  `menuTree_id` bigint(20) NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `timestamp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `data` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `image` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `checktype_id` int(11) NULL DEFAULT NULL,
  `schedule_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE,
  INDEX `Host_id`(`host_id`, `menuTree_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES (1, 1, 5, 52, 0, 0, 0, 1, '1635435319', 'fullname=Administrator', '', 0, 0);
INSERT INTO `log` VALUES (2, 1, 5, 53, 0, 0, 0, 1, '1635435345', 'fullname=Administrator', '', 0, 0);
INSERT INTO `log` VALUES (3, 1, 5, 53, 0, 0, 0, 1, '1635498469', 'fullname=Administrator', '', 0, 0);
INSERT INTO `log` VALUES (4, 1, 5, 52, 0, 0, 0, 1, '1635498474', 'fullname=Administrator', '', 0, 0);
INSERT INTO `log` VALUES (5, 1, 5, 52, 0, 0, 0, 1, '1636702420', 'fullname=Administrator', '', 0, 0);

-- ----------------------------
-- Table structure for logAction
-- ----------------------------
DROP TABLE IF EXISTS `logAction`;
CREATE TABLE `logAction`  (
  `logAction_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logAction_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 6 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logAction
-- ----------------------------
INSERT INTO `logAction` VALUES (1, 'Add');
INSERT INTO `logAction` VALUES (2, 'Delete');
INSERT INTO `logAction` VALUES (3, 'Modify');
INSERT INTO `logAction` VALUES (4, 'Change');
INSERT INTO `logAction` VALUES (5, 'Info?');

-- ----------------------------
-- Table structure for logCategory
-- ----------------------------
DROP TABLE IF EXISTS `logCategory`;
CREATE TABLE `logCategory`  (
  `logCategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `additional_permission_type_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`logCategory_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logCategory
-- ----------------------------
INSERT INTO `logCategory` VALUES (1, 'Accounts', 2);
INSERT INTO `logCategory` VALUES (2, 'Interface', 0);
INSERT INTO `logCategory` VALUES (3, 'Monitor', 0);
INSERT INTO `logCategory` VALUES (4, 'Notifications', 0);
INSERT INTO `logCategory` VALUES (5, 'Backups', 0);
INSERT INTO `logCategory` VALUES (6, 'Agent', 0);
INSERT INTO `logCategory` VALUES (7, 'Admin', 0);
INSERT INTO `logCategory` VALUES (8, 'Reports', 0);

-- ----------------------------
-- Table structure for logImage
-- ----------------------------
DROP TABLE IF EXISTS `logImage`;
CREATE TABLE `logImage`  (
  `logImage_id` int(11) NOT NULL AUTO_INCREMENT,
  `imageName` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logImage_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 57 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logImage
-- ----------------------------
INSERT INTO `logImage` VALUES (1, 'add_system');
INSERT INTO `logImage` VALUES (2, 'delete_system');
INSERT INTO `logImage` VALUES (3, 'add_user');
INSERT INTO `logImage` VALUES (4, 'log_user');
INSERT INTO `logImage` VALUES (5, 'edit');
INSERT INTO `logImage` VALUES (6, 'plus');
INSERT INTO `logImage` VALUES (7, 'delete_user');
INSERT INTO `logImage` VALUES (8, 'right_arrow');
INSERT INTO `logImage` VALUES (9, 'attr_green');
INSERT INTO `logImage` VALUES (10, 'attr_nodata');
INSERT INTO `logImage` VALUES (11, 'attr_yellow');
INSERT INTO `logImage` VALUES (12, 'attr_red');
INSERT INTO `logImage` VALUES (13, 'attr_gray');
INSERT INTO `logImage` VALUES (14, 'notification');
INSERT INTO `logImage` VALUES (15, 'action_edit');
INSERT INTO `logImage` VALUES (16, 'action_delete');
INSERT INTO `logImage` VALUES (17, 'action_add');
INSERT INTO `logImage` VALUES (18, 'directory');
INSERT INTO `logImage` VALUES (19, 'system');
INSERT INTO `logImage` VALUES (20, 'test');
INSERT INTO `logImage` VALUES (21, 'site');
INSERT INTO `logImage` VALUES (22, 'msp');
INSERT INTO `logImage` VALUES (23, 'add_dir');
INSERT INTO `logImage` VALUES (24, 'delete_dir');
INSERT INTO `logImage` VALUES (25, 'add_system');
INSERT INTO `logImage` VALUES (26, 'delete_system');
INSERT INTO `logImage` VALUES (27, 'add_attr');
INSERT INTO `logImage` VALUES (28, 'delete_attr');
INSERT INTO `logImage` VALUES (29, 'unknown');
INSERT INTO `logImage` VALUES (30, 'edit_permission');
INSERT INTO `logImage` VALUES (32, 'backups_green');
INSERT INTO `logImage` VALUES (33, 'backups_red');
INSERT INTO `logImage` VALUES (34, 'agents');
INSERT INTO `logImage` VALUES (35, 'backups_yellow');
INSERT INTO `logImage` VALUES (36, 'agents_green');
INSERT INTO `logImage` VALUES (37, 'agents_gray');
INSERT INTO `logImage` VALUES (38, 'up');
INSERT INTO `logImage` VALUES (39, 'down');
INSERT INTO `logImage` VALUES (41, 'update');
INSERT INTO `logImage` VALUES (42, 'license');
INSERT INTO `logImage` VALUES (43, 'ok');
INSERT INTO `logImage` VALUES (44, 'notok');
INSERT INTO `logImage` VALUES (45, 'report_schedules');
INSERT INTO `logImage` VALUES (46, 'reports');
INSERT INTO `logImage` VALUES (47, 'delete');
INSERT INTO `logImage` VALUES (48, 'interface');
INSERT INTO `logImage` VALUES (49, 'backups');
INSERT INTO `logImage` VALUES (50, 'logout');
INSERT INTO `logImage` VALUES (51, 'arrow_left');
INSERT INTO `logImage` VALUES (52, 'graph_control');
INSERT INTO `logImage` VALUES (53, 'cog_24');
INSERT INTO `logImage` VALUES (54, 'remote_site');
INSERT INTO `logImage` VALUES (55, 'datasource');
INSERT INTO `logImage` VALUES (56, 'timesync');

-- ----------------------------
-- Table structure for logType
-- ----------------------------
DROP TABLE IF EXISTS `logType`;
CREATE TABLE `logType`  (
  `logType_id` int(11) NOT NULL AUTO_INCREMENT,
  `logCategory_id` int(11) NULL DEFAULT NULL,
  `logAction_id` int(11) NULL DEFAULT NULL,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `niceName` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link_popup` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `link_nav` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `defaultImage` varchar(11) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`logType_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 68 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logType
-- ----------------------------
INSERT INTO `logType` VALUES (1, 2, 1, 'new_system', 'New system', '[host_name] added to [company_name]', NULL, NULL, '1');
INSERT INTO `logType` VALUES (2, 2, 2, 'delete_system', 'System deleted', '[host_name] removed from [company_name]', NULL, NULL, '2');
INSERT INTO `logType` VALUES (3, 1, 1, 'new_user', 'User added', '[username] added to [company_name]', NULL, NULL, '3');
INSERT INTO `logType` VALUES (4, 1, 3, 'edit_user', 'User edited', '[username] was edited', NULL, NULL, '4');
INSERT INTO `logType` VALUES (5, 1, 2, 'delete_user', 'User deleted', '[username] was deleted', NULL, NULL, '7');
INSERT INTO `logType` VALUES (6, 3, 4, 'status_change', 'Status change', '[system_name] - [test_name], [a_timestamp]', NULL, NULL, '13|8|13');
INSERT INTO `logType` VALUES (7, 4, 5, 'notification', 'Notification', '[type]<br>To: [dest]', '', NULL, '14');
INSERT INTO `logType` VALUES (27, 5, 5, 'backup_verified', 'Backup&nbsp;success', '[hostname]: [msg]', NULL, NULL, '32');
INSERT INTO `logType` VALUES (28, 5, 5, 'backup_failed', 'Backup&nbsp;failed', '[hostname]: [msg]', NULL, NULL, '33');
INSERT INTO `logType` VALUES (9, 2, 1, 'add_dir', 'Group added', '[group_name] added.', NULL, NULL, '23');
INSERT INTO `logType` VALUES (10, 2, 2, 'delete_dir', 'Group deleted', '[node_name] deleted, [children] nodes.', NULL, NULL, '24');
INSERT INTO `logType` VALUES (11, 2, 3, 'modify_dir', 'Group edited', '[group_name] edited.<br>[details]', NULL, NULL, '18|15');
INSERT INTO `logType` VALUES (12, 2, 1, 'add_system', 'System added', '[system_name] added.', NULL, NULL, '25');
INSERT INTO `logType` VALUES (13, 2, 2, 'delete_system', 'System deleted', '[node_name] deleted, [children] nodes.', NULL, NULL, '26');
INSERT INTO `logType` VALUES (14, 2, 3, 'modify_system', 'System edited', '[system_name] edited.<br>[details]', NULL, NULL, '19|15');
INSERT INTO `logType` VALUES (15, 2, 1, 'add_attribute', 'Attribute added', '[system_name] - [test_name].', NULL, NULL, '27');
INSERT INTO `logType` VALUES (16, 2, 2, 'delete_attribute', 'Attribute deleted', '[node_name] deleted.', NULL, NULL, '28');
INSERT INTO `logType` VALUES (17, 2, 3, 'modify_attribute', 'Attribute edited', '[system_name] - [test_name]<br>[details]', NULL, NULL, '20|15');
INSERT INTO `logType` VALUES (18, 2, 1, 'add_site', 'Site added', '[site_name] added.', NULL, NULL, '21|17');
INSERT INTO `logType` VALUES (19, 2, 2, 'delete_site', 'Site deleted', '[node_name] deleted, [children] nodes.', NULL, NULL, '21|16');
INSERT INTO `logType` VALUES (20, 2, 3, 'modify_site', 'Site edited', '[site_name] edited.<br>[details]', NULL, NULL, '21|15');
INSERT INTO `logType` VALUES (23, 2, 3, 'modify_msp', 'MSP edited', '[msp_name] edited.<br>[details]', NULL, NULL, '22|15');
INSERT INTO `logType` VALUES (26, 1, 3, 'modify_permission', 'Modify permission', '[node_name] permission changed. [details]', NULL, NULL, '30');
INSERT INTO `logType` VALUES (32, 5, 5, 'backup_delivery', 'Backup&nbsp;delivery', '[hostname]: [msg]', NULL, NULL, '32');
INSERT INTO `logType` VALUES (31, 6, 5, 'agent_command', 'Agent&nbsp;command', '[hostname]: [command]: [msg]', NULL, NULL, '34');
INSERT INTO `logType` VALUES (33, 2, 1, 'add_dns', 'DNS attribute added', '[site_name]: [desc] ([test_name])', NULL, NULL, '27');
INSERT INTO `logType` VALUES (34, 2, 2, 'delete_dns', 'DNS attribute deleted', '[node_name] deleted.', NULL, NULL, '28');
INSERT INTO `logType` VALUES (35, 2, 3, 'modify_dns', 'DNS attribute edited', '[site_name]: [desc] ([test_name])<br>[details]', NULL, NULL, '20|15');
INSERT INTO `logType` VALUES (36, 5, 5, 'manual_backup', 'Manual backup', '[hostname]', NULL, NULL, '32');
INSERT INTO `logType` VALUES (37, 3, 5, 'comms_failure', 'Communication failure', '[hostname] - [tree_label]', NULL, NULL, '39');
INSERT INTO `logType` VALUES (38, 3, 5, 'comms_resolved', 'Communication restored', '[hostname] - [tree_label]', NULL, NULL, '38');
INSERT INTO `logType` VALUES (39, 6, 5, 'agent_update', 'Agent update scheduled', '[hostname], [type] agent from [curr] to [avail].', NULL, NULL, '34|41');
INSERT INTO `logType` VALUES (40, 7, 5, 'license_install', 'License', '[msg]', NULL, NULL, '42');
INSERT INTO `logType` VALUES (41, 8, 1, 'add_schedule', 'Report schedule added', '[type]: [report]<br>Subject: [target]<br>[details]', NULL, NULL, '45|17');
INSERT INTO `logType` VALUES (42, 8, 2, 'delete_schedule', 'Report schedule deleted', '[type]: [report]<br>Subject: [target]<br>[details]', NULL, NULL, '45|16');
INSERT INTO `logType` VALUES (43, 8, 3, 'modify_schedule', 'Report schedule edited', '[type]: [report]<br>Subject: [target]<br>[details]', NULL, NULL, '45|15');
INSERT INTO `logType` VALUES (44, 8, 5, 'report_manual', 'Manual report', '[report]<br>Subject: [target]<br>[details]', NULL, NULL, '4|8|46');
INSERT INTO `logType` VALUES (45, 8, 5, 'report_schedule', 'Scheduled report', '[report]<br>Subject: [target]<br>[details]', NULL, NULL, '45|8|46');
INSERT INTO `logType` VALUES (47, 3, 5, 'manual_sysinfo', 'Manual system information gather', '[hostname]', NULL, NULL, '41|13');
INSERT INTO `logType` VALUES (48, 2, 3, 'tree_move', 'Menu tree change', '[msg]', NULL, NULL, '48');
INSERT INTO `logType` VALUES (49, 5, 5, 'backup_export', 'Backup export', '[hostname]: [desc], [msg]', NULL, NULL, '32|8');
INSERT INTO `logType` VALUES (50, 2, 5, 'backup_settings', 'Backup settings', '[msg]', NULL, NULL, '49|15');
INSERT INTO `logType` VALUES (51, 2, 5, 'notification', 'Manage notifications', '[fullname] [operation] [searchcontact][replacecontact][systemcontact][warningcontact][criticalcontact] ( [syscount], [attrcount])', NULL, NULL, '14|5');
INSERT INTO `logType` VALUES (52, 1, 5, 'log_in', 'User logged in', '[fullname]', NULL, NULL, '4|8');
INSERT INTO `logType` VALUES (53, 1, 5, 'log_out', 'User logged out', '[fullname]', NULL, NULL, '51|4');
INSERT INTO `logType` VALUES (54, 3, NULL, 'under_investigation', 'Under investigation enabled', '[host_name] - [attr_name]', NULL, NULL, '53');
INSERT INTO `logType` VALUES (55, 3, NULL, 'investigation_complete', 'Under investigation disabled', '[host_name] -  [treelabel]', NULL, NULL, '53');
INSERT INTO `logType` VALUES (56, 3, NULL, 'investigation_complete_system', 'Under investigation expired', '[host_name] - [treelabel]  - Expiry time reached', NULL, NULL, '53');
INSERT INTO `logType` VALUES (57, 4, 5, 'notification_suppressed', 'Notification suppressed', 'Status alert<br> To: email', NULL, NULL, '14');
INSERT INTO `logType` VALUES (58, 2, 2, 'delete_remote_site', 'Remote site deleted', '[node_name] deleted, [children] nodes.', NULL, NULL, '21|16');
INSERT INTO `logType` VALUES (59, 2, 1, 'add_remote_site', 'Remote site added', '[site_name] added.', NULL, NULL, '21|17');
INSERT INTO `logType` VALUES (60, 2, 1, 'add_data_source', 'Data source added', '[data_source_name] on [system_name]', NULL, NULL, '55|17');
INSERT INTO `logType` VALUES (61, 2, 3, 'modify_data_source', 'Data source edited', '[data_source_name] on [system_name][attributes_reset]', NULL, NULL, '55|15');
INSERT INTO `logType` VALUES (62, 2, 2, 'delete_data_source', 'Data source deleted', '[data_source_name] on [system_name]', NULL, NULL, '55|16');
INSERT INTO `logType` VALUES (63, 2, 5, 'information_settings', 'Information settings', '[msg]', NULL, NULL, '20|15');
INSERT INTO `logType` VALUES (64, 5, 5, 'scheduled_backup', 'Scheduled backup', '[hostname]: [msg]', NULL, NULL, '32');
INSERT INTO `logType` VALUES (66, 5, 5, 'backup_deleted', 'Backup deleted', '[hostname]: [msg]', NULL, NULL, '32');
INSERT INTO `logType` VALUES (67, 3, 5, 'time_sync', 'Time sync error', '[hostname]', NULL, NULL, '56');

-- ----------------------------
-- Table structure for menuTree
-- ----------------------------
DROP TABLE IF EXISTS `menuTree`;
CREATE TABLE `menuTree`  (
  `menuTree_id` int(11) NOT NULL AUTO_INCREMENT,
  `full_menuTree_id` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `tree_label` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `menu_level_type_id` int(11) NOT NULL DEFAULT 0,
  `test_type_id` int(11) NOT NULL DEFAULT 0,
  `additional_id` int(11) NOT NULL DEFAULT 0,
  `company_id` int(11) NOT NULL DEFAULT 0,
  `link` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `test` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitor_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`menuTree_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 18246 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menuTree
-- ----------------------------
INSERT INTO `menuTree` VALUES (1, '1', 0, 'MSP', 19, 0, 0, 0, '', NULL, 0);

-- ----------------------------
-- Table structure for menuTreeState
-- ----------------------------
DROP TABLE IF EXISTS `menuTreeState`;
CREATE TABLE `menuTreeState`  (
  `menuTreeStateId` int(11) NOT NULL AUTO_INCREMENT,
  `menuTree_id` int(11) NOT NULL,
  `menuTreeStateType_id` int(11) NOT NULL,
  `active` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`menuTreeStateId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 306 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menuTreeState
-- ----------------------------

-- ----------------------------
-- Table structure for menuTreeStateType
-- ----------------------------
DROP TABLE IF EXISTS `menuTreeStateType`;
CREATE TABLE `menuTreeStateType`  (
  `menuTreeStateTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`menuTreeStateTypeId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menuTreeStateType
-- ----------------------------
INSERT INTO `menuTreeStateType` VALUES (1, 'Under investigation');

-- ----------------------------
-- Table structure for menu_level_option
-- ----------------------------
DROP TABLE IF EXISTS `menu_level_option`;
CREATE TABLE `menu_level_option`  (
  `menu_level_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_level_type_id` int(11) NULL DEFAULT NULL,
  `tag` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `require_view_permission` smallint(6) NULL DEFAULT 0,
  `require_modify_permission` smallint(6) NULL DEFAULT 0,
  `require_delete_permission` smallint(6) NULL DEFAULT 0,
  `require_additional_permission` int(11) NULL DEFAULT NULL,
  `popup` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`menu_level_option_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9246 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_level_option
-- ----------------------------
INSERT INTO `menu_level_option` VALUES (1, 2, 'Add group', 'admin/menuTree/addTreeDirectory.php?parent_id=[MENUTREE_ID]&menu_tree_id=0&company_id=[COMPANY_ID]', 'add_dir', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (2, 2, 'Add attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&parent_id=[MENUTREE_ID]&company_id=[COMPANY_ID]&newAttribute=yes', 'add_attr', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (3, 2, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]&company_id=[COMPANY_ID]', 'view_system', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (5, 1, 'Add group', 'admin/menuTree/addTreeDirectory.php?parent_id=[MENUTREE_ID]&menu_tree_id=0&company_id=[COMPANY_ID]', 'add_dir', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (6, 1, 'Edit group', 'admin/menuTree/addTreeDirectory.php?menu_tree_id=[MENUTREE_ID]&company_id=[COMPANY_ID]', 'edit_dir', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (7, 1, 'Add system', 'admin/system/wizard_handler.php?parent_id=[MENUTREE_ID]&company_id=[COMPANY_ID]', 'add_system', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (8, 1, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'view_dir', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9, 3, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view_test', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (10, 4, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view_test', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (11, 5, 'View', 'nodes/attribute?menuTree_id=[MENUTREE_ID]', 'view_test', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9113, 2, 'Cancel', '', 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9118, 1, 'Cancel', '', 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9122, 3, 'Cancel', '', 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9123, 4, 'Cancel', '', 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9124, 5, 'Cancel', '', 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9132, 8, 'Permissions', 'admin/permission/modifyPermission.php?menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 0, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9133, 8, 'Cancel', NULL, 'cancel', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (17, 1, 'Add attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&parent_id=[MENUTREE_ID]&company_id=[COMPANY_ID]&newAttribute=yes', 'add_attr', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (19, 4, 'Edit attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&menuTree_id=[MENUTREE_ID]&check_type_id=[CHECKTYPE_ID]&editFromTree&additional_id=[ADDITIONAL_ID]&company_id=[COMPANY_ID]', 'edit_attr', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (20, 3, 'Edit attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&menuTree_id=[MENUTREE_ID]&check_type_id=[CHECKTYPE_ID]&editFromTree&additional_id=[ADDITIONAL_ID]&company_id=[COMPANY_ID]', 'edit_attr', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (21, 5, 'Edit attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&menuTree_id=[MENUTREE_ID]&check_type_id=[CHECKTYPE_ID]&editFromTree&additional_id=[ADDITIONAL_ID]&company_id=[COMPANY_ID]', 'edit_attr', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (23, 3, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_attr', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (22, 2, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_system', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (24, 1, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_dir', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (25, 4, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_attr', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (26, 5, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_attr', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (27, 6, 'Edit group', 'admin/group/modifyGroup.php?group_id=[GROUP_ID]&company_id=[COMPANY_ID]', 'edit_group', 0, 0, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9127, 6, 'Delete', 'admin/group/deleteGroup.php?group_id=[GROUP_ID]&company_id=[COMPANY_ID]', 'delete_group', 0, 0, 0, 2, 1);
INSERT INTO `menu_level_option` VALUES (9128, 7, 'Edit user', 'admin/user/modifyUser.php?user_id=[USER_ID]&company_id=[COMPANY_ID]', 'edit_user', 0, 0, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9129, 7, 'Delete', 'admin/user/deleteUser.php?user_id=[USER_ID]&company_id=[COMPANY_ID]', 'delete_user', 0, 0, 0, 2, 1);
INSERT INTO `menu_level_option` VALUES (9130, 6, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9131, 7, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (50, 2, 'Edit system', 'admin/system/modifySystem.php?parent_id=[PARENT_ID]&host_id=[ADDITIONAL_ID]&menuTree_id=[MENUTREE_ID]&company_id=[COMPANY_ID]', 'edit_system', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9137, 10, 'Edit OS', 'admin/templates/os/modifyOS.php?os_id=[ID]', 'edit_dir', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9136, 10, 'Add template', NULL, 'add_system', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9139, 10, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9140, 11, 'Add template', NULL, 'add_system', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9141, 11, 'Edit application', 'admin/templates/application/modifyApplication.php?application_id=[ID]', 'edit_dir', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9143, 11, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9144, 9, 'Add OS', 'admin/templates/os/modifyOS.php', 'add_dir', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9145, 9, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9146, 12, 'Add group', NULL, 'add_dir', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9147, 12, 'Add attribute', NULL, 'add_attr', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9148, 12, 'Edit template', NULL, 'edit_system', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9149, 12, 'Delete template', NULL, 'delete_system', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9150, 12, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9151, 13, 'Add attribute', NULL, 'add_attr', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9152, 13, 'Edit directory', NULL, 'edit_attr', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9153, 13, 'Delete directory', NULL, 'delete_dir', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9154, 13, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9155, 14, 'Edit attribute', NULL, 'edit_attr', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9157, 14, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9158, 15, 'Add application', 'admin/templates/application/modifyApplication.php', 'add_dir', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9159, 15, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9160, 16, 'View', NULL, 'view', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9161, 16, 'Edit schedule', NULL, 'edit_schedule', 0, 0, 0, 9, 0);
INSERT INTO `menu_level_option` VALUES (9162, 16, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9163, 18, 'Add group', 'admin/group/modifyGroup.php?company_id=[COMPANY_ID]', 'add_group', 0, 0, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9164, 18, 'Add user', 'admin/user/modifyUser.php?company_id=[COMPANY_ID]', 'add_user', 0, 0, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9165, 18, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9167, 1, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9168, 2, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9169, 3, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9170, 4, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9171, 5, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9172, 18, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9173, 19, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9174, 19, 'Edit MSP', 'admin/msp/modifyMSP.php', 'edit', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9175, 19, 'Add site', 'admin/site/wizard/main.php?parent_id=[MENUTREE_ID]', 'plus', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9176, 19, 'Add group', 'admin/menuTree/addTreeDirectory.php?parent_id=0&menu_tree_id=0&company_id=0', 'add_dir', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9177, 19, 'Manage accounts', 'admin/accounts/accounts.php?company_id=0&menu_tree_id=[MENUTREE_ID]', 'user', 0, 1, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9180, 19, 'Permissions', 'admin/permission/modifyPermission.php?company_id=0&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9181, 19, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9182, 20, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9183, 20, 'Edit site', 'admin/site/modifySite.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&parent_id=[PARENT_ID]', 'edit', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9184, 20, 'Add group', 'admin/menuTree/addTreeDirectory.php?parent_id=[MENUTREE_ID]&menu_tree_id=0&company_id=[COMPANY_ID]', 'add_dir', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9185, 20, 'Add system', 'admin/system/wizard_handler.php?parent_id=[MENUTREE_ID]&company_id=[COMPANY_ID]', 'add_system', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9186, 20, 'Manage accounts', 'admin/accounts/accounts.php?company_id=[COMPANY_ID]&menu_tree_id=[MENUTREE_ID]', 'user', 0, 1, 0, 2, 0);
INSERT INTO `menu_level_option` VALUES (9188, 20, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'cancel', 0, 1, 0, 1, 1);
INSERT INTO `menu_level_option` VALUES (9189, 20, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 1, 0, 7, 0);
INSERT INTO `menu_level_option` VALUES (9190, 20, 'Cancel', NULL, 'cancel', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9191, 1, 'Add site', 'admin/site/wizard/main.php?parent_id=[MENUTREE_ID]', 'plus', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9194, 19, 'Agents', 'admin/agents/agents.php', 'agents', 0, 0, 0, 11, 0);
INSERT INTO `menu_level_option` VALUES (9195, 23, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_attr', 0, 0, 1, 1, 1);
INSERT INTO `menu_level_option` VALUES (9196, 24, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view_test', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9197, 24, 'Edit attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&menuTree_id=[MENUTREE_ID]&check_type_id=[CHECKTYPE_ID]&editFromTree&additional_id=[ADDITIONAL_ID]&company_id=[COMPANY_ID]', 'edit_attr', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9198, 24, 'Permissions', 'admin/permission/modifyPermission.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]', 'edit_permission', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9199, 24, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'delete_attr', 0, 0, 0, NULL, 1);
INSERT INTO `menu_level_option` VALUES (9200, 20, 'Add attribute', 'admin/attribute/modifyAttribute.php?hostid=[HOST_ID]&parent_id=[MENUTREE_ID]&company_id=[COMPANY_ID]&newAttribute=yes', 'add_attr', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9201, 17, 'Backup now', 'popups/backupNow.php?menuTree_id=[MENUTREE_ID]', 'backup_now', 0, 0, 0, 1, 1);
INSERT INTO `menu_level_option` VALUES (9202, 17, 'Backup settings', 'admin/backups/backupSettings.php?menuTree_id=[MENUTREE_ID]&host_id=[HOST_ID]', 'backup_settings', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9203, 17, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]&host_id=[HOST_ID]', 'view_test', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9204, 2, 'Report concept', 'reports/reportConcept.php?menuTree_id=[MENUTREE_ID]', 'report', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9205, 1, 'Report concept', 'reports/reportConcept.php?menuTree_id=[MENUTREE_ID]', 'report', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9206, 19, 'Report concept', 'reports/reportConcept.php?menuTree_id=[MENUTREE_ID]', 'report', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9207, 20, 'Report concept', 'reports/reportConcept.php?menuTree_id=[MENUTREE_ID]', 'report', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9208, 3, 'Report concept', 'reports/reportConcept.php?menuTree_id=[MENUTREE_ID]', 'report', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9209, 2, 'Reports', 'reports/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'reports', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9210, 20, 'Reports', 'reports/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'reports', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9211, 20, 'Report schedules', 'admin/reports/schedules.php?menuTree_id=[MENUTREE_ID]', 'report_schedules', 1, 0, 0, 3, 0);
INSERT INTO `menu_level_option` VALUES (9212, 1, 'Reports', 'reports/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'reports', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9213, 1999, 'Reports', 'reports/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'reports', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9216, 20, 'Dashboard', 'dashboard/dashboards.php?menuTree_id=[MENUTREE_ID]', 'full_screen', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9215, 19, 'Dashboard', 'dashboard/dashboards.php?menuTree_id=[MENUTREE_ID]', 'full_screen', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9217, 20, 'Agents', 'admin/agents/agents.php', 'agents', 0, 0, 0, 11, 0);
INSERT INTO `menu_level_option` VALUES (9218, 19, 'License', 'admin/license/license.php?menuTree_id=[MENUTREE_ID]', 'license', 0, 0, 0, 12, 0);
INSERT INTO `menu_level_option` VALUES (9220, 2, 'Data source', 'admin/datasource/datasources.php?menuTree_id=[MENUTREE_ID]', 'datasource', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9221, 23, 'Update now', 'popups/sysinfoNow.php?menuTree_id=[MENUTREE_ID]', 'update', 0, 1, 0, 9, 1);
INSERT INTO `menu_level_option` VALUES (9222, 20, 'Manage notifications', 'admin/notifications/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'notification', 1, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9223, 19, 'Manage menu tree', 'admin/menuTree/editTree.php?menuTree_id=[MENUTREE_ID]', 'interface', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9224, 20, 'Manage menu tree', 'admin/menuTree/editTree.php?menuTree_id=[MENUTREE_ID]', 'interface', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9225, 20, 'Anti-virus query tool', 'tools/F-Secure/F-SecureQuery.php?menuTree_id=[MENUTREE_ID]', 'tools', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9226, 2, 'Anti-virus query tool', 'tools/F-Secure/F-SecureQuery.php?menuTree_id=[MENUTREE_ID]', 'tools', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9227, 19, 'Reports', 'reports/wizard/main.php?menuTree_id=[MENUTREE_ID]', 'reports', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9230, 2, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9231, 3, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9232, 4, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9233, 5, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9234, 14, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9237, 24, 'Under investigation', 'popups/under_investigation.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'cog_24', 0, 0, 0, 12, 3);
INSERT INTO `menu_level_option` VALUES (9238, 1, 'Dashboard', 'dashboard/dashboards.php?menuTree_id=[MENUTREE_ID]', 'full_screen', 1, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9239, 29, 'Delete', 'admin/menuTree/deleteMenuTreeItem.php?menuTree_id=[MENUTREE_ID]', 'cancel', 0, 0, 0, NULL, 1);
INSERT INTO `menu_level_option` VALUES (9240, 29, 'View', 'nodes/handler.php?menuTree_id=[MENUTREE_ID]', 'view', 0, 0, 0, NULL, 0);
INSERT INTO `menu_level_option` VALUES (9241, 19, 'Report schedules', 'admin/reports/schedules.php?menuTree_id=[MENUTREE_ID]', 'report_schedules', 1, 0, 0, 3, 0);
INSERT INTO `menu_level_option` VALUES (9242, 23, 'Information settings', 'admin/information/informationSettings.php?menuTree_id=[MENUTREE_ID]&host_id=[HOST_ID]', 'backup_settings', 0, 0, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9243, 3, 'Export', 'popups/csv_data.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&hostid=[HOST_ID]', 'reports', 0, 0, 0, 12, 4);
INSERT INTO `menu_level_option` VALUES (9244, 29, 'Edit site', 'admin/site/modifyRemote.php?company_id=[COMPANY_ID]&menuTree_id=[MENUTREE_ID]&parent_id=[PARENT_ID]', 'edit', 0, 1, 0, 1, 0);
INSERT INTO `menu_level_option` VALUES (9245, 1, 'Under investigation', 'popups/under_investigation_group.php?menuTree_id=[MENUTREE_ID]', 'cog_24', 0, 1, 0, 12, 3);

-- ----------------------------
-- Table structure for menu_level_type
-- ----------------------------
DROP TABLE IF EXISTS `menu_level_type`;
CREATE TABLE `menu_level_type`  (
  `menu_level_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_level_type` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`menu_level_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of menu_level_type
-- ----------------------------
INSERT INTO `menu_level_type` VALUES (1, 'directory');
INSERT INTO `menu_level_type` VALUES (2, 'system');
INSERT INTO `menu_level_type` VALUES (3, 'System test');
INSERT INTO `menu_level_type` VALUES (4, 'Environment test');
INSERT INTO `menu_level_type` VALUES (5, 'DNS test');
INSERT INTO `menu_level_type` VALUES (23, 'sysinfo');
INSERT INTO `menu_level_type` VALUES (16, 'system_information');
INSERT INTO `menu_level_type` VALUES (17, 'backups');
INSERT INTO `menu_level_type` VALUES (18, 'accounts');
INSERT INTO `menu_level_type` VALUES (19, 'msp');
INSERT INTO `menu_level_type` VALUES (20, 'site');
INSERT INTO `menu_level_type` VALUES (24, 'dns');
INSERT INTO `menu_level_type` VALUES (25, 'data_source');
INSERT INTO `menu_level_type` VALUES (26, 'variable');
INSERT INTO `menu_level_type` VALUES (27, 'user_log');
INSERT INTO `menu_level_type` VALUES (28, 'under_investigation');
INSERT INTO `menu_level_type` VALUES (29, 'remote_site');

-- ----------------------------
-- Table structure for mib
-- ----------------------------
DROP TABLE IF EXISTS `mib`;
CREATE TABLE `mib`  (
  `mib_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `mib` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mib_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 29 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mib
-- ----------------------------
INSERT INTO `mib` VALUES (1, 'hrSystemNumUsers', 'The number of user sessions for which this host is storing state information.  A session is a collection of processes requiring a single act of user authentication and possibly subject to collective job control.', '.1.3.6.1.2.1.25.1.5');
INSERT INTO `mib` VALUES (2, 'interfaces', NULL, '.1.3.6.1.2.1.2');
INSERT INTO `mib` VALUES (4, 'sysUpTime', '', '.1.3.6.1.2.1.1.3');
INSERT INTO `mib` VALUES (5, 'tcpCurrEstab', 'The number of TCP connections for which the current state is either ESTABLISHED or CLOSE- WAIT.', '.1.3.6.1.2.1.6.9');
INSERT INTO `mib` VALUES (6, 'laLoad', 'The 1,5 and 10 minute load averages (one per row).', '.1.3.6.1.4.1.2021.10.1.3.2');
INSERT INTO `mib` VALUES (7, 'hrSystemNumUsers', 'The number of user sessions for which this host is storing state information.  A session is a collection of processes requiring a single act of user authentication and possibly subject to collective job control.', '.1.3.6.1.2.1.25.1.5.0');
INSERT INTO `mib` VALUES (8, 'fwNumConn', '', '.1.3.6.1.4.1.2620.1.1.25.3.0');
INSERT INTO `mib` VALUES (9, 'svnStatCode', 'Status code', '.1.3.6.1.4.1.2620.1.6.101');
INSERT INTO `mib` VALUES (10, 'fwIfTable', NULL, '1.3.6.1.4.1.2620.1.1.25.5');
INSERT INTO `mib` VALUES (11, 'multiDiskTable', NULL, '.1.3.6.1.4.1.2620.1.6.7.6');
INSERT INTO `mib` VALUES (12, 'fwInstallTime', NULL, '.1.3.6.1.4.1.2620.1.1.25.2.0');
INSERT INTO `mib` VALUES (13, 'mgActiveStatus', NULL, '1.3.6.1.4.1.2620.1.7.6');
INSERT INTO `mib` VALUES (14, 'svnStatCode', NULL, '1.3.6.1.4.1.2620.1.7.5');
INSERT INTO `mib` VALUES (15, 'fwHmem', NULL, '1.3.6.1.4.1.2620.1.1.26.1');
INSERT INTO `mib` VALUES (16, 'hrStorage', NULL, '.1.3.6.1.2.1.25.2');
INSERT INTO `mib` VALUES (17, 'svnMem', NULL, '.1.3.6.1.4.1.2620.1.6.7.1');
INSERT INTO `mib` VALUES (18, 'procUsage', NULL, '.1.3.6.1.4.1.2620.1.6.7.2.4');
INSERT INTO `mib` VALUES (19, 'multiProcTable', NULL, '.1.3.6.1.4.1.2620.1.6.7.5');
INSERT INTO `mib` VALUES (20, 'fwFilterName', NULL, '.1.3.6.1.4.1.2620.1.1.2.0');
INSERT INTO `mib` VALUES (21, 'hrSWRunName', NULL, '.1.3.6.1.2.1.25.4.2.1.2');
INSERT INTO `mib` VALUES (22, 'cpvIKEglobals', NULL, '.1.3.6.1.4.1.2620.1.2.9.1');
INSERT INTO `mib` VALUES (23, 'raUsersTable', NULL, '.1.3.6.1.4.1.2620.500.9000');
INSERT INTO `mib` VALUES (24, 'tunnelTable', NULL, '.1.3.6.1.4.1.2620.500.9002');
INSERT INTO `mib` VALUES (26, 'sysUpTime', 'The amount of time since this host was last initialized.  Note that this is different from sysUpTime in MIB-II [3] because sysUpTime is the uptime of the network management portion of the system.', '.1.3.6.1.2.1.25.1.1');
INSERT INTO `mib` VALUES (27, 'tcpNetstat', 'Existing TCP connections', '.1.3.6.1.2.1.6.19');
INSERT INTO `mib` VALUES (28, 'hrProcessorLoad', 'Processor load average', '.1.3.6.1.2.1.25.3.3.1.2');

-- ----------------------------
-- Table structure for mib_lookup
-- ----------------------------
DROP TABLE IF EXISTS `mib_lookup`;
CREATE TABLE `mib_lookup`  (
  `mib_lookup_id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `module` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `nice_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mib_lookup_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 78 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mib_lookup
-- ----------------------------
INSERT INTO `mib_lookup` VALUES (2, '1.3.6.1.4.1.2213.11.2.1', 'F-Secure Management Agent ', 'version', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host.');
INSERT INTO `mib_lookup` VALUES (3, '1.3.6.1.4.1.2213.11.2.100', 'F-Secure Management Agent ', 'statisticsPreviousStartTime', 'Previous Start Time ', 'Indicates the time of the previous startup of FSMA. ');
INSERT INTO `mib_lookup` VALUES (4, '1.3.6.1.4.1.2213.11.2.14.6', 'F-Secure Management Agent ', 'communicationsPreviousUpdateOfStatistics', 'Previous Update of Statistics ', 'Timestamp of previous update of statistics to server. ');
INSERT INTO `mib_lookup` VALUES (5, '1.3.6.1.4.1.2213.11.2.14.7', 'F-Secure Management Agent ', 'communicationsPreviousUpdateOfPolicies', 'Previous Update of Policies \r\n', 'Timestamp of previous update of policies to the host. ');
INSERT INTO `mib_lookup` VALUES (6, '1.3.6.1.4.1.2213.11.2.14.8', 'F-Secure Management Agent ', 'communicationsLastConnectionToServer', 'Last connection to server \r\n', 'Timestamp of last successful connection to the F-Secure Policy Manager Server. ');
INSERT INTO `mib_lookup` VALUES (7, '1.3.6.1.4.1.2213.11.2.9.10.1.2', 'F-Secure Management Agent ', 'hotFixStatisticsId', 'HotfixesEntry \r\n', NULL);
INSERT INTO `mib_lookup` VALUES (8, '1.3.6.1.4.1.2213.11.2.90.1', 'F-Secure Management Agent ', 'statisticsCurrentUser', 'Current User \r\n', 'The login account name of the current local user. ');
INSERT INTO `mib_lookup` VALUES (9, '1.3.6.1.4.1.2213.11.2.90.6', 'F-Secure Management Agent ', 'winsName', 'WINS Name', 'The WINS address of the host, if it has one. ');
INSERT INTO `mib_lookup` VALUES (10, '1.3.6.1.4.1.2213.11.2.90.7', 'F-Secure Management Agent ', 'dnsName', 'DNS Names ', 'The DNS addresses of the host. ');
INSERT INTO `mib_lookup` VALUES (11, '1.3.6.1.4.1.2213.11.2.90.8', 'F-Secure Management Agent ', 'ipAddresses', 'IP Addresses ', 'A list of IP Addresses separated with a space character from each other. ');
INSERT INTO `mib_lookup` VALUES (12, '1.3.6.1.4.1.2213.11.2.90.9', 'F-Secure Management Agent ', 'uniqueIdentify', 'Unique Identity ', 'A globally unique identifier of the host. Used to identify the host to the server.');
INSERT INTO `mib_lookup` VALUES (13, '1.3.6.1.4.1.2213.12.2.1', 'F-Secure Anti-Virus ', 'version', 'Version ', 'Version number of F-Secure Anti-Virus ');
INSERT INTO `mib_lookup` VALUES (14, '1.3.6.1.4.1.2213.12.2.111.10', 'F-Secure Anti-Virus ', 'scanningEnabledStatistics', 'Scanning Enabled ', 'When enabled F-Secure Anti-Virus real-time protection is active and will scan the objects accessed by the user. ');
INSERT INTO `mib_lookup` VALUES (15, '1.3.6.1.4.1.2213.12.2.113.50', 'F-Secure Anti-Virus ', 'statisticsInstalledVersion_ES', 'E-Mail Scanning Version Number ', 'The version number of E-Mail Scanning option. The value is empty if the module is not installed. ');
INSERT INTO `mib_lookup` VALUES (16, '1.3.6.1.4.1.2213.12.2.115.200.200', 'F-Secure Anti-Virus ', 'lastInfectionTimestamp', 'Timestamp ', 'Time of encountering the infection. ');
INSERT INTO `mib_lookup` VALUES (17, '1.3.6.1.4.1.2213.12.2.115.200.210', 'F-Secure Anti-Virus ', 'lastInfectionVirusName', 'Virus Name \r\n', 'Name of the virus, trojan or worm. ');
INSERT INTO `mib_lookup` VALUES (18, '1.3.6.1.4.1.2213.12.2.115.200.220', 'F-Secure Anti-Virus ', 'lastInfectionObjectName', 'Infected Object Name', 'Name of the infected object. ');
INSERT INTO `mib_lookup` VALUES (19, '1.3.6.1.4.1.2213.12.2.115.200.230', 'F-Secure Anti-Virus ', 'lastInfectionActionTaken', 'Action Taken ', 'Action taken on the infected object. ');
INSERT INTO `mib_lookup` VALUES (20, '1.3.6.1.4.1.2213.12.2.120', 'F-Secure Anti-Virus ', 'databaseDate', 'Virus Definitions Updating Time ', 'The time when the virus definitions were previously updated. ');
INSERT INTO `mib_lookup` VALUES (21, '1.3.6.1.4.1.2213.12.2.125', 'F-Secure Anti-Virus ', 'databaseSerialNumber', 'Virus Definitions Serial Number ', 'Serial number of the current virus definitions database. ');
INSERT INTO `mib_lookup` VALUES (22, '1.3.6.1.4.1.2213.12.2.160.10.1.1000', 'F-Secure Anti-Virus ', 'scheduledTasksStatisticsLastExecutionTimeEntry', 'Last Execution Time ', 'Date and time of last execution of the task, in format \"YYYY-MM-DD hh:mm\" (local time). If empty then the task has not been executed yet. ');
INSERT INTO `mib_lookup` VALUES (23, '1.3.6.1.4.1.2213.12.2.160.10.1.1010', 'F-Secure Anti-Virus ', 'scheduledTasksStatisticsLastExitCodeEntry', 'Last Exit Code \r\n', 'Exit code of last execution of the task. Exit codes for \"Scan Local Drives\" tasks: 0 - Scanning completed successfully, system is clean 1 - Command line scan not allowed in policy (currently unsupported) 2 - Scanning aborted by user 3 - Error loading F-Se');
INSERT INTO `mib_lookup` VALUES (24, '1.3.6.1.4.1.2213.12.2.160.10.1.20', 'F-Secure Anti-Virus ', 'scheduledTasksStatisticsEntryName', 'Name ', 'Name of the scheduled task. The name will be visible in user interface for scheduled tasks on user\'s computer. Note: each task must have a unique name. ');
INSERT INTO `mib_lookup` VALUES (25, '1.3.6.1.4.1.2213.12.2.7', 'F-Secure Anti-Virus ', 'build', 'Build', 'The build number of the product. ');
INSERT INTO `mib_lookup` VALUES (26, '1.3.6.1.4.1.2213.12.2.9.10.1.2', 'F-Secure Anti-Virus ', 'hotFixStatisticsId', 'ID ', 'Identifier of the hotfix package as assigned by F-Secure Corporation. ');
INSERT INTO `mib_lookup` VALUES (27, '1.3.6.1.4.1.2213.18.2.1', 'F-Secure Content Scanner Server ', 'statisticsVersion', 'Product Version', 'Shows the version of F-Secure Content Scanner Server currently installed on the host. ');
INSERT INTO `mib_lookup` VALUES (28, '1.3.6.1.4.1.2213.18.2.9.10.1.2', 'F-Secure Content Scanner Server ', 'hotFixStatisticsId \r\n', 'ID ', 'Identifier of the hotfix package as assigned by F-Secure Corporation. ');
INSERT INTO `mib_lookup` VALUES (29, '1.3.6.1.4.1.2213.19.2.1', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (30, '1.3.6.1.4.1.2213.19.2.9.10.1.2', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (31, '1.3.6.1.4.1.2213.20.2.1', 'F-Secure Anti-Virus for Microsoft Exchange', 'statisticsVersion', 'Version ', 'Shows the version of F-Secure Anti-Virus for Microsoft Exchange.');
INSERT INTO `mib_lookup` VALUES (32, '1.3.6.1.4.1.2213.20.2.9.10.1.2', 'F-Secure Anti-Virus for Microsoft Exchange', 'hotFixStatisticsId', 'ID', 'Hotfix package identifier that is assigned by F-Secure Corporation.');
INSERT INTO `mib_lookup` VALUES (33, '1.3.6.1.4.1.2213.21.2.1', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (34, '1.3.6.1.4.1.2213.21.2.9.10.1.2', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (35, '1.3.6.1.4.1.2213.22.2.1', 'F-Secure Anti-Virus for Internet Mail ', 'statisticsVersion', 'Version', 'Shows the version of the software.');
INSERT INTO `mib_lookup` VALUES (36, '1.3.6.1.4.1.2213.22.2.9.10.1.2', 'F-Secure Anti-Virus for Internet Mail ', 'hotFixStatisticsId', 'ID ', 'Identifier of the hotfix package as assigned by F-Secure Corporation.');
INSERT INTO `mib_lookup` VALUES (37, '1.3.6.1.4.1.2213.23.2.1', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (38, '1.3.6.1.4.1.2213.23.2.9.10.1.2', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (39, '1.3.6.1.4.1.2213.24.2.1', 'F-Secure Anti-Virus for Internet Gateways ', 'statisticsVersion', 'Version', 'Shows the version of the software.');
INSERT INTO `mib_lookup` VALUES (40, '1.3.6.1.4.1.2213.24.2.9.10.1.2', 'F-Secure Anti-Virus for Internet Gateways ', 'hotFixStatisticsId', 'ID ', 'Identifier of the hotfix package as assigned by F-Secure Corporation.');
INSERT INTO `mib_lookup` VALUES (41, '1.3.6.1.4.1.2213.25.1.30.30', 'F-Secure Internet Shield ', 'serviceActiveSecurityLevel ', 'Active Security Level ', 'Specifies the currently active security level. Firewall rules and application control are handled according the currently active security level. ');
INSERT INTO `mib_lookup` VALUES (42, '1.3.6.1.4.1.2213.25.2.1', 'F-Secure Internet Shield ', 'version ', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (43, '1.3.6.1.4.1.2213.25.2.30.10.10', 'F-Secure Internet Shield ', 'latestAttachTimestamp ', 'Timestamp', 'Time when alert was issued. ');
INSERT INTO `mib_lookup` VALUES (44, '1.3.6.1.4.1.2213.25.2.30.10.20', 'F-Secure Internet Shield ', 'latestAttachService ', 'Service', 'Name of the service, or services, matching best to the network traffic. ');
INSERT INTO `mib_lookup` VALUES (45, '1.3.6.1.4.1.2213.25.2.30.10.30', 'F-Secure Internet Shield ', 'latestAttackRemoteAddress ', 'Remote Address ', 'Remote host\'s IP address. ');
INSERT INTO `mib_lookup` VALUES (46, '1.3.6.1.4.1.2213.25.2.30.20.10', 'F-Secure Internet Shield ', 'recentAttacksNumber ', 'Number of Attacks ', 'Number of network attacks. ');
INSERT INTO `mib_lookup` VALUES (47, '1.3.6.1.4.1.2213.25.2.9.10.1.2', 'F-Secure Internet Shield ', NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (48, '1.3.6.1.4.1.2213.27.2.1', 'F-Secure Client Security ', 'version', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (49, '1.3.6.1.4.1.2213.27.2.9.10.1.2', 'F-Secure Client Security ', NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (50, '1.3.6.1.4.1.2213.31.2.1', 'FSecureAVNTServer', 'version', 'FSecureAVNTServer statistics version', NULL);
INSERT INTO `mib_lookup` VALUES (51, '1.3.6.1.4.1.2213.31.2.111.10', 'FSecureAVNTServer', NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (52, '1.3.6.1.4.1.2213.31.2.115.200.200', 'FSecureAVNTServer', 'lastInfectionTimestamp', 'FSecureAVNTServer last infection time', NULL);
INSERT INTO `mib_lookup` VALUES (53, '1.3.6.1.4.1.2213.31.2.115.200.210', 'FSecureAVNTServer', 'lastInfectionVirusName', 'FSecureAVNTServer last infection virus name', NULL);
INSERT INTO `mib_lookup` VALUES (54, '1.3.6.1.4.1.2213.31.2.115.200.220', 'FSecureAVNTServer', 'lastInfectionObjectName', 'FSecureAVNTServer last infection object name', NULL);
INSERT INTO `mib_lookup` VALUES (55, '1.3.6.1.4.1.2213.31.2.115.200.230', 'FSecureAVNTServer', 'lastInfectionActionTaken', 'FSecureAVNTServer last infection action taken', NULL);
INSERT INTO `mib_lookup` VALUES (56, '1.3.6.1.4.1.2213.31.2.120', 'FSecureAVNTServer', 'databaseDate', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (57, '1.3.6.1.4.1.2213.31.2.125', 'FSecureAVNTServer', 'databaseSerialNumber', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (58, '1.3.6.1.4.1.2213.31.2.160.10.1.1000', 'FSecureAVNTServer', 'scheduledTasksStatisticsLastExecutionTimeEntry', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (59, '1.3.6.1.4.1.2213.31.2.160.10.1.1010', 'FSecureAVNTServer', 'scheduledTasksStatisticsLastExitCodeEntry', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (60, '1.3.6.1.4.1.2213.31.2.160.10.1.20', 'FSecureAVNTServer', 'scheduledTasksStatisticsEntry', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (61, '1.3.6.1.4.1.2213.31.2.9.10.1.2', 'FSecureAVNTServer', 'hotFixStatisticsId', NULL, NULL);
INSERT INTO `mib_lookup` VALUES (62, '1.3.6.1.4.1.2213.38.2.1', 'F-Secure Anti-Spyware ', 'version', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (63, '1.3.6.1.4.1.2213.38.2.9.10.1.2', 'F-Secure Anti-Spyware ', NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (64, '1.3.6.1.4.1.2213.42.2.1', 'F-Secure Automatic Update Agent ', 'version ', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (65, '1.3.6.1.4.1.2213.42.2.9.10.1.2', 'F-Secure Automatic Update Agent ', NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (66, '1.3.6.1.4.1.2213.44.2.1', 'F-Secure Anti-Virus Linux Client Security ', 'version ', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (67, '1.3.6.1.4.1.2213.44.2.7', 'F-Secure Anti-Virus Linux Client Security ', 'build ', 'Build', 'The build number of the product. ');
INSERT INTO `mib_lookup` VALUES (68, '1.3.6.1.4.1.2213.44.2.9.10.1.20', 'F-Secure Anti-Virus Linux Client Security ', 'hotFixStatisticsId ', 'ID', 'Identifier of the hotfix package as assigned by F-Secure Corporation. ');
INSERT INTO `mib_lookup` VALUES (69, '1.3.6.1.4.1.2213.45.2.1', 'F-Secure Linux Security ', 'version ', 'Version', 'A cleartext string that identifies which version of the product is currently installed in the host. ');
INSERT INTO `mib_lookup` VALUES (70, '1.3.6.1.4.1.2213.45.2.7', 'F-Secure Linux Security ', 'build ', 'Build', 'The build number of the product. ');
INSERT INTO `mib_lookup` VALUES (71, '1.3.6.1.4.1.2213.45.2.9.10.1.20', 'F-Secure Linux Security ', 'hotFixStatisticsId ', 'ID', 'Identifier of the hotfix package as assigned by F-Secure Corporation. ');
INSERT INTO `mib_lookup` VALUES (72, '1.3.6.1.4.1.2213.53.2.1', 'F-Secure DeepGuard', 'version ', 'Version', 'Version of the product currently installed on the host. ');
INSERT INTO `mib_lookup` VALUES (73, '1.3.6.1.4.1.2213.53.2.9.10.1.2', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (74, '1.3.6.1.4.1.2213.54.2.1', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (75, '1.3.6.1.4.1.2213.54.2.9.10.1.2', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (76, '1.3.6.1.4.1.2213.56.2.1', NULL, NULL, NULL, NULL);
INSERT INTO `mib_lookup` VALUES (77, '1.3.6.1.4.1.2213.56.2.9.10.1.2', NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for monitor_agent
-- ----------------------------
DROP TABLE IF EXISTS `monitor_agent`;
CREATE TABLE `monitor_agent`  (
  `monitor_agent_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modular` int(1) NULL DEFAULT 0,
  PRIMARY KEY (`monitor_agent_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_agent
-- ----------------------------
INSERT INTO `monitor_agent` VALUES (1, 'Client-side SSH agent', 0);
INSERT INTO `monitor_agent` VALUES (2, 'Server-side SNMP agent', 0);
INSERT INTO `monitor_agent` VALUES (3, 'Server-side SSH agent', 0);
INSERT INTO `monitor_agent` VALUES (4, 'Server-side agent', 0);
INSERT INTO `monitor_agent` VALUES (5, 'Server-side F-Secure agent', 0);
INSERT INTO `monitor_agent` VALUES (6, 'Server-side F-Secure summary agent', 0);
INSERT INTO `monitor_agent` VALUES (7, 'Server-side SNMP agent', 0);
INSERT INTO `monitor_agent` VALUES (8, 'Server-side FS Audit agent', 0);
INSERT INTO `monitor_agent` VALUES (10, 'Server-side SSH agent', 1);
INSERT INTO `monitor_agent` VALUES (11, 'No Agent', 0);
INSERT INTO `monitor_agent` VALUES (12, 'Server-side Telnet agent', 1);
INSERT INTO `monitor_agent` VALUES (13, 'Server-side SSH agent', 1);
INSERT INTO `monitor_agent` VALUES (14, 'Server-side SSH agent', 1);
INSERT INTO `monitor_agent` VALUES (15, 'Server-side SSH agent forwarding', 1);

-- ----------------------------
-- Table structure for monitor_agentCode_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_agentCode_linking`;
CREATE TABLE `monitor_agentCode_linking`  (
  `monitor_agentCode_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `agentCode` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`monitor_agentCode_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_agentCode_linking
-- ----------------------------
INSERT INTO `monitor_agentCode_linking` VALUES (1, 'IPSO', 6, 6, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (2, 'Linux', 5, 4, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (3, 'SNMP', 1, 1, 0, 2);
INSERT INTO `monitor_agentCode_linking` VALUES (4, 'SNMP', 2, 2, 0, 2);
INSERT INTO `monitor_agentCode_linking` VALUES (5, 'SNMP', 3, 2, 0, 2);
INSERT INTO `monitor_agentCode_linking` VALUES (6, 'SNMP', 4, 3, 0, 2);
INSERT INTO `monitor_agentCode_linking` VALUES (7, 'SNMP', 5, 1, 0, 2);
INSERT INTO `monitor_agentCode_linking` VALUES (8, 'SPLAT', 5, 1, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (9, 'SSH_EDGE', 2, 2, 0, 3);
INSERT INTO `monitor_agentCode_linking` VALUES (10, 'SSH_EDGE', 3, 2, 0, 3);
INSERT INTO `monitor_agentCode_linking` VALUES (11, 'SSH', 4, 3, 0, 3);
INSERT INTO `monitor_agentCode_linking` VALUES (12, 'SunOS', 7, 7, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (13, 'Windows', 5, 5, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (14, 'SPLAT', 1, 1, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (15, 'MSSOnSite', 5, 4, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (16, 'SPLAT_VS', 9, 9, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (17, 'VSX_Virtual_System', 9, 9, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (18, 'VSX_Virtual_Switch', 10, 9, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (19, 'SPLAT', 1, 10, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (20, 'SPLAT', 5, 10, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (21, 'MSS', 5, 14, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (22, 'GAiA', 5, 16, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (23, 'GAiA', 1, 16, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (24, 'screenOS', 13, 17, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (25, 'SSH', 16, 21, 0, 13);
INSERT INTO `monitor_agentCode_linking` VALUES (26, 'SSH', 8, 8, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (27, 'VSX_Virtual_System', 9, 22, 0, 1);
INSERT INTO `monitor_agentCode_linking` VALUES (28, 'SSH', 17, 8, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (29, 'SSH', 18, 8, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (30, 'Paloalto_Vsys', 19, 21, 0, 10);
INSERT INTO `monitor_agentCode_linking` VALUES (31, 'SSH_FORTIOS_VDOM', 20, 8, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (32, 'SSH', 21, 23, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (33, 'SSH_FORTIOS_EXPECT', 8, 8, 0, 14);
INSERT INTO `monitor_agentCode_linking` VALUES (34, 'SSH', 8, 8, 0, 15);

-- ----------------------------
-- Table structure for monitor_agent_identifier
-- ----------------------------
DROP TABLE IF EXISTS `monitor_agent_identifier`;
CREATE TABLE `monitor_agent_identifier`  (
  `monitor_agent_identifier_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `key` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(16) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `order` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`monitor_agent_identifier_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_agent_identifier
-- ----------------------------
INSERT INTO `monitor_agent_identifier` VALUES (1, 4, 3, 10, 'Serial number', 'serial_number', 'text', 2);
INSERT INTO `monitor_agent_identifier` VALUES (2, 4, 3, 10, 'Hostname', 'hostname', 'text', 1);
INSERT INTO `monitor_agent_identifier` VALUES (3, 16, 21, 13, 'Seria1 number', 'serial_number', 'text', 2);
INSERT INTO `monitor_agent_identifier` VALUES (4, 16, 21, 13, 'Hostname', 'hostname', 'text', 1);

-- ----------------------------
-- Table structure for monitor_agent_requirements
-- ----------------------------
DROP TABLE IF EXISTS `monitor_agent_requirements`;
CREATE TABLE `monitor_agent_requirements`  (
  `monitor_agent_requirements_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `database_name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `table_name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `required_fields` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`monitor_agent_requirements_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_agent_requirements
-- ----------------------------
INSERT INTO `monitor_agent_requirements` VALUES (1, -1, -1, 2, 'monitor', 'snmp_config', 'text|ip_addr|IP Address||text|community_string|Read-Only community string');
INSERT INTO `monitor_agent_requirements` VALUES (6, -1, 2, 3, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (7, 4, 3, 3, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (8, -1, -1, 7, 'monitor', 'snmp_config', 'text|ip_addr|IP Address||special|version|SNMP Version||text|community_string|Read-Only community string||text|username|Username||password|password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (10, -1, 2, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (11, -1, 3, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (12, 12, 13, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (13, 13, 15, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (14, -1, 1, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (15, 13, 17, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (16, 14, 18, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password');
INSERT INTO `monitor_agent_requirements` VALUES (17, 15, 19, 12, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (18, 15, 19, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (19, 1, 20, 10, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (20, 16, 21, 13, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (21, 8, 8, 14, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (22, 17, 8, 14, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (23, 18, 8, 14, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (24, 21, 23, 14, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');
INSERT INTO `monitor_agent_requirements` VALUES (25, 8, 8, 14, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password||password|ssh_enable_password|Enable password');

-- ----------------------------
-- Table structure for monitor_application
-- ----------------------------
DROP TABLE IF EXISTS `monitor_application`;
CREATE TABLE `monitor_application`  (
  `monitor_application_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`monitor_application_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_application
-- ----------------------------
INSERT INTO `monitor_application` VALUES (1, 'Check Point ClusterXL');
INSERT INTO `monitor_application` VALUES (2, 'Check Point QoS');
INSERT INTO `monitor_application` VALUES (3, 'Check Point Firewall');
INSERT INTO `monitor_application` VALUES (4, 'Check Point Security Management');
INSERT INTO `monitor_application` VALUES (5, 'Check Point Sofaware Security Gateway');
INSERT INTO `monitor_application` VALUES (6, 'Cisco Firewall');
INSERT INTO `monitor_application` VALUES (7, 'Nokia VRRP/IP Clustering');
INSERT INTO `monitor_application` VALUES (8, 'Rainfinity RainWall');
INSERT INTO `monitor_application` VALUES (9, 'RSA Authentication Manager');
INSERT INTO `monitor_application` VALUES (10, 'Websense Web Security');
INSERT INTO `monitor_application` VALUES (11, 'Check Point VPN');
INSERT INTO `monitor_application` VALUES (12, 'FortiGate Firewall');
INSERT INTO `monitor_application` VALUES (13, 'MSS User Portal');
INSERT INTO `monitor_application` VALUES (14, 'Check Point SVN');
INSERT INTO `monitor_application` VALUES (15, 'Check Point VSX');
INSERT INTO `monitor_application` VALUES (16, 'FS Audit');
INSERT INTO `monitor_application` VALUES (17, 'Cisco Firewall Failover');
INSERT INTO `monitor_application` VALUES (18, 'Blue Coat Proxy');
INSERT INTO `monitor_application` VALUES (19, 'Pulse');
INSERT INTO `monitor_application` VALUES (20, 'ScreenOS Firewall');
INSERT INTO `monitor_application` VALUES (21, 'ScreenOS Clustering');
INSERT INTO `monitor_application` VALUES (22, 'Cisco Router');
INSERT INTO `monitor_application` VALUES (23, 'Palo Alto Firewall');
INSERT INTO `monitor_application` VALUES (24, 'Palo Alto High Availability');
INSERT INTO `monitor_application` VALUES (25, 'Juniper Firewall');
INSERT INTO `monitor_application` VALUES (26, 'Juniper High Availability ');
INSERT INTO `monitor_application` VALUES (27, 'Check Point SmartEvent');
INSERT INTO `monitor_application` VALUES (30, 'Check Point Log Server');
INSERT INTO `monitor_application` VALUES (31, 'FortiGate High Availability');
INSERT INTO `monitor_application` VALUES (32, 'FortiAnalyser');
INSERT INTO `monitor_application` VALUES (33, 'FortiManager');
INSERT INTO `monitor_application` VALUES (34, 'Cisco Next-Generation Intrusion Prevention System (NGIPS)');

-- ----------------------------
-- Table structure for monitor_backup
-- ----------------------------
DROP TABLE IF EXISTS `monitor_backup`;
CREATE TABLE `monitor_backup`  (
  `monitor_backup_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`monitor_backup_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_backup
-- ----------------------------
INSERT INTO `monitor_backup` VALUES (1, 'File list archive');
INSERT INTO `monitor_backup` VALUES (2, 'Device configuration file');

-- ----------------------------
-- Table structure for monitor_backup_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_backup_linking`;
CREATE TABLE `monitor_backup_linking`  (
  `monitor_backup_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_structure_id` int(11) NULL DEFAULT 0,
  `monitor_category_id` int(11) NULL DEFAULT 0,
  `monitor_subCategory_id` int(11) NULL DEFAULT 0,
  `monitor_backup_id` int(11) NULL DEFAULT 0,
  `default` int(1) NULL DEFAULT 1,
  `client_initiated` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `server_initiated` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  PRIMARY KEY (`monitor_backup_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 26 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of monitor_backup_linking
-- ----------------------------
INSERT INTO `monitor_backup_linking` VALUES (1, 1, -1, 0, 1, 0, 0, 0, 1, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (2, 5, -1, 0, 1, 0, 0, 0, 1, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (3, 6, -1, 0, 1, 0, 0, 0, 1, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (4, 7, -1, 0, 1, 0, 0, 0, 1, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (7, 2, -1, 0, 3, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (8, 3, -1, 0, 3, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (9, 4, -1, 0, 3, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (10, -1, 2, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (11, 4, 3, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (12, 12, 13, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (14, 5, 5, 0, 7, 0, 0, 0, 0, 1, '1', '0');
INSERT INTO `monitor_backup_linking` VALUES (15, 13, 17, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (16, 14, 18, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (17, 15, 19, 0, 12, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (18, 0, 0, 0, 0, 0, 0, 0, 0, 1, '0', '0');
INSERT INTO `monitor_backup_linking` VALUES (19, 1, -1, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (20, 16, 21, 0, 13, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (21, 8, 8, 0, 14, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (22, 13, 15, 0, 10, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (23, 17, 8, 0, 14, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (24, 18, 8, 0, 14, 0, 0, 0, 2, 1, '0', '1');
INSERT INTO `monitor_backup_linking` VALUES (25, 21, 23, 0, 14, 0, 0, 0, 2, 1, '0', '1');

-- ----------------------------
-- Table structure for monitor_category
-- ----------------------------
DROP TABLE IF EXISTS `monitor_category`;
CREATE TABLE `monitor_category`  (
  `monitor_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor_category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_category
-- ----------------------------
INSERT INTO `monitor_category` VALUES (1, 'Platform');
INSERT INTO `monitor_category` VALUES (2, 'Operating system');
INSERT INTO `monitor_category` VALUES (3, 'Application');
INSERT INTO `monitor_category` VALUES (4, 'Anti-Virus');
INSERT INTO `monitor_category` VALUES (5, 'Network');
INSERT INTO `monitor_category` VALUES (6, 'Status');

-- ----------------------------
-- Table structure for monitor_checktype_default
-- ----------------------------
DROP TABLE IF EXISTS `monitor_checktype_default`;
CREATE TABLE `monitor_checktype_default`  (
  `monitor_checktype_default_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_checktype_linking_id` int(11) NULL DEFAULT 0,
  `default_type_id` int(11) NULL DEFAULT 0,
  `threshold` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `warning_status_delay` tinyint(4) NULL DEFAULT 0,
  `critical_status_delay` tinyint(4) NULL DEFAULT 0,
  `warning_alert_delay` tinyint(4) NULL DEFAULT 0,
  `critical_alert_delay` tinyint(4) NULL DEFAULT 0,
  `notify_warning` tinyint(1) NULL DEFAULT 1,
  `notify_critical` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`monitor_checktype_default_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1214 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_checktype_default
-- ----------------------------
INSERT INTO `monitor_checktype_default` VALUES (1, 70, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (2, 68, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (3, 67, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (4, 65, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (5, 66, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (6, 63, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (7, 62, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (8, 74, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (9, 73, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (242, 242, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (243, 243, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (244, 244, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (245, 245, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (246, 246, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (247, 247, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (248, 248, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (10, 72, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (24, 82, 0, 'default|>_[20]|>_[50]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (11, 71, 0, 'default|<_[40]|<_[20]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (12, 69, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (13, 64, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (14, 75, 0, 'default|<_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (15, 76, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (16, 77, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (17, 81, 0, 'default|<_[10]|<_[5]|', 0, 0, 6, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (18, 83, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (19, 85, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (20, 86, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (21, 84, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (22, 110, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (23, 84, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (249, 249, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (250, 250, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (251, 251, 0, 'default|<_[40]|<_[20]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (252, 252, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (253, 253, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (254, 254, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (255, 255, 0, 'default|>_[1]|>_[10]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (256, 256, 0, 'default|>_[1]|>_[10]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (257, 257, 0, 'default|>_[5000]|>_[10000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (258, 258, 0, 'default|>_[5000]|>_[10000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (259, 259, 0, 'default|>_[5000]|>_[10000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (260, 260, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (261, 261, 0, 'default|>_[50]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (262, 262, 0, 'default|<_[20]|<_[10]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (263, 263, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (264, 264, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (265, 265, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (266, 266, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (267, 267, 0, 'default|>_[1]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (268, 268, 0, 'default|>_[1000]|>_[10000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (269, 269, 0, 'default|>_[1000]|>_[10000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (270, 270, 0, 'default|>_[10]|>_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (271, 271, 0, 'default|>_[10]|>_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (272, 272, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (273, 273, 0, 'default|>_[0]|>_[1]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (302, 302, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (522, 112, 0, 'default|>_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (523, 95, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (524, 94, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (525, 93, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (526, 91, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (527, 96, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (528, 100, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (529, 98, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (530, 102, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (531, 103, 0, 'default|>_[20]|>_[40]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (532, 99, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (533, 92, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (534, 101, 0, 'default|<_[95]|<_[20]|', 0, 0, 12, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (535, 97, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (536, 90, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (537, 304, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (538, 303, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (539, 305, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (540, 306, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (541, 308, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (542, 307, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (543, 116, 0, 'default|>_[50]|>_[90]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (544, 106, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (546, 107, 0, 'default|>_[0]|>_[1]|', 6, 2, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (547, 108, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (548, 109, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (549, 309, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (550, 204, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (551, 111, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (552, 113, 0, 'default|<_[1]|<_[1]|', 0, 3, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (553, 114, 0, 'default|<_[30]|<_[10]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (554, 115, 0, 'default|<_[0]|<_[0]|###SYN_RECV|>_[10]|>_[20]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (556, 334, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (557, 335, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (558, 338, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (559, 340, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (560, 336, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (561, 341, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (562, 342, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (563, 345, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (564, 346, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (565, 347, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (566, 350, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (567, 351, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (568, 348, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (569, 349, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (570, 352, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (571, 353, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (572, 354, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (573, 355, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (574, 356, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (575, 357, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (576, 358, 0, 'default|<_[0]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (577, 359, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (578, 360, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (579, 361, 0, 'default|>_[1]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (580, 362, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (581, 363, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (582, 364, 0, 'default|>_[0]|>_[1]|', 6, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (583, 365, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (584, 366, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (585, 367, 0, 'default|<_[2]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (586, 368, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (587, 369, 0, 'default|>_[0]|>_[0]|', 0, 3, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (588, 370, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (590, 89, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (598, 343, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (599, 344, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (600, 373, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (601, 374, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (602, 375, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (603, 376, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (604, 377, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (605, 378, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (606, 379, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (607, 380, 0, 'default|>_[0]|>_[1]|', 6, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (608, 381, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (609, 383, 0, 'default|=_[2]|=_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (610, 382, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (611, 384, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (612, 385, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (613, 386, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (614, 387, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (615, 388, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (616, 389, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (617, 390, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (618, 391, 0, 'default|<_[0]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (619, 412, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (620, 413, 0, 'default|<_[2]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (621, 414, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (622, 415, 0, 'default|<_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (623, 416, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (624, 417, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (625, 418, 0, 'default|<_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (626, 419, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (627, 120, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (628, 421, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (629, 422, 0, 'default|<_[2]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (630, 423, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (631, 392, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (632, 404, 0, 'default|<_[50]|<_[20]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (633, 400, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (634, 401, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (635, 402, 0, 'default|>_[0]|>_[1]|', 6, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (636, 403, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (637, 405, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (638, 406, 0, 'default|>_[50]|>_[90]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (639, 407, 0, 'default|>_[50]|>_[90]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (640, 408, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (641, 409, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (642, 410, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (643, 411, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (644, 393, 0, 'default|<_[1]|<_[1]|', 0, 3, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (645, 394, 0, 'default|>_[x+20]|>_[80]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (646, 395, 0, 'default|<_[0]|<_[0]|###SYN_RECV|>_[10]|>_[20]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (647, 396, 0, 'default|>_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (648, 397, 0, 'default|>_[0.5]|>_[1]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (649, 398, 0, 'default|<_[30]|<_[10]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (650, 399, 0, 'default|>_[0]|>_[0]|', 0, 3, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (651, 424, 0, 'default|<_[20]|<_[10]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (652, 425, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (653, 426, 0, 'default|>_[1]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (654, 427, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (655, 428, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (656, 430, 0, 'default|<_[0]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (657, 431, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (658, 432, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (659, 435, 0, 'default|>_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (660, 436, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (661, 440, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (662, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (663, 437, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (664, 438, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (665, 439, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (666, 478, 0, 'default|>_[0.5]|>_[1]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (667, 441, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (668, 238, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (669, 482, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (670, 480, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (671, 479, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (672, 483, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (673, 485, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (674, 486, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (675, 487, 0, 'default|<_[2]|<_[2]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (676, 488, 0, 'default|<_[10]|<_[5]|', 0, 0, 6, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (677, 491, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (678, 492, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (679, 493, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (680, 494, 0, 'default|?_[]|?_[]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (681, 495, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (682, 496, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (683, 497, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (686, 502, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (687, 503, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (688, 504, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (691, 505, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (694, 508, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (693, 507, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (696, 509, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (697, 510, 0, 'default|<_[0]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (698, 511, 0, 'default|<_[0]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (699, 517, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (700, 516, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (701, 515, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (702, 514, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (703, 200, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (704, 201, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (705, 203, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (706, 198, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (707, 199, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (708, 192, 0, 'default|>_[x*2]|>_[x*3]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (709, 193, 0, 'default|>_[x*2]|>_[x*3]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (710, 194, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (711, 195, 0, 'default|?_[]|?_[]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (712, 196, 0, 'default|?_[]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (713, 197, 0, 'default|>_[0]|>_[1]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (714, 519, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (715, 520, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (716, 536, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (717, 521, 0, 'default|<_[500]|<_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (718, 522, 0, 'default|<_[500]|<_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (719, 523, 0, 'default|<_[500]|<_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (720, 524, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (721, 525, 0, 'default|>_[0]|>_[1]|', 6, 2, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (722, 526, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (723, 527, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (724, 528, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (725, 529, 0, 'default|>_[50]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (726, 530, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (727, 532, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (728, 533, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (729, 534, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (730, 535, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (731, 537, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (732, 538, 0, 'default|<_[20]|<_[10]|', 0, 0, 6, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (733, 539, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (734, 548, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (735, 550, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (736, 552, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (737, 518, 0, 'default|<_[1]|<_[1]|false###winlogon.exe|<_[1]|<_[1]|!###lsass.exe|<_[1]|<_[1]|!###lsm.exe|<_[1]|<_[1]|!###services.exe|<_[1]|<_[1]|!###smss.exe|<_[1]|<_[1]|!', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (738, 553, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (739, 554, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (740, 298, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (741, 284, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (742, 288, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (743, 434, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (744, 499, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (745, 372, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (746, 371, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (747, 498, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (748, 547, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (749, 546, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (750, 545, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (751, 544, 0, 'default|<_[11]|<_[7]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (752, 543, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (753, 542, 0, 'default|>_[50]|>_[60]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (754, 541, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (755, 540, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (756, 555, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (757, 557, 0, 'default|<_[1]|<_[1]|', 0, 2, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (758, 556, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (759, 551, 0, 'default|<_[20]|<_[10]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (760, 558, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (761, 140, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (769, 142, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (762, 559, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (763, 141, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (764, 560, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (765, 561, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (766, 562, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (767, 563, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (768, 222, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (770, 139, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (771, 143, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (772, 144, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (773, 145, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (774, 146, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (775, 147, 0, 'default|<_[40]|<_[20]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (776, 148, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (777, 149, 0, 'default|>_[20]|>_[40]|', 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (778, 420, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (779, 219, 0, 'default|<_[20]|<_[10]|', 0, 0, 6, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (780, 220, 0, 'default|>_[20]|>_[50]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (781, 221, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (782, 223, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (783, 224, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (784, 241, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (785, 677, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (786, 678, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (787, 680, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (788, 681, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (789, 689, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (790, 690, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (791, 691, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (792, 692, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (793, 694, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (794, 695, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (795, 696, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (796, 697, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (797, 679, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (798, 684, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (799, 685, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (800, 686, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (801, 687, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (802, 698, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (803, 699, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (804, 693, 0, 'efault|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (805, 688, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (806, 701, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (807, 700, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (808, 676, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (809, 682, 0, 'default|<_[20]|<_[10]|', 0, 0, 6, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (810, 683, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (811, 673, 0, 'default|<_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (812, 674, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (813, 675, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (814, 702, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (815, 703, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (816, 704, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (817, 705, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (818, 706, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (819, 707, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (820, 708, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (821, 709, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (822, 710, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (823, 711, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (824, 712, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (825, 713, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (826, 714, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (827, 715, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (828, 716, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (829, 717, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (830, 718, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (831, 719, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (832, 720, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (833, 725, 0, 'default|>_[x*1.5]|>_[x*3]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (834, 724, 0, 'default|>_[x*1.5]|>_[x*3]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (835, 723, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (836, 722, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (837, 726, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (838, 743, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (839, 736, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (840, 737, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (841, 727, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (842, 728, 0, 'default|<_[95]|<_[20]|', 0, 0, 12, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (843, 729, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (844, 739, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (845, 730, 0, 'default|>_[20]|?_[]|', 0, 0, 3, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (846, 740, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (847, 731, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (848, 732, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (849, 733, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (850, 741, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (851, 734, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (852, 752, 0, 'default|<_[30]|<_[7]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (853, 742, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (854, 744, 0, '', 6, 2, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1078, 891, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (858, 747, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (859, 750, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (860, 513, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (861, 738, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (862, 770, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (863, 771, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (864, 772, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (865, 773, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (866, 774, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (867, 775, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (868, 761, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (870, 777, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (871, 779, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (872, 760, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (873, 778, 0, 'default|>_[70]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (874, 758, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (875, 759, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (876, 762, 0, 'default|>_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (877, 764, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (878, 765, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (879, 766, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (880, 767, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (881, 768, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (882, 769, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (883, 776, 0, 'default|>_[0.5]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (884, 763, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (886, 781, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (938, 816, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (937, 809, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (936, 808, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (935, 807, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (934, 806, 0, 'default|<_[95]|<_[20]|', 0, 0, 12, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (933, 805, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (932, 804, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (931, 803, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (929, 788, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (930, 790, 0, 'default|!_[x]|?_[]|', 0, 0, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (928, 789, 0, 'default|!_[x]|?_[]|', 0, 0, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (927, 791, 0, 'default|?_[]|>_[0]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (926, 792, 0, 'default|!_[x]|?_[]|', 0, 0, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (925, 793, 0, 'default|!_[x]|?_[]|', 0, 0, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (924, 795, 0, 'default|!_[x]|?_[]|', 0, 0, 1, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (923, 794, 0, 'default|>_[70]|>_[80]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (922, 786, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (921, 787, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (920, 800, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (919, 799, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (918, 798, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (917, 797, 0, 'default|>_[20]|>_[50]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (915, 802, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (914, 801, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (913, 785, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (912, 784, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (911, 783, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (939, 817, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (940, 818, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (941, 819, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (942, 820, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (943, 821, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (944, 822, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (945, 812, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (947, 814, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (948, 815, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (949, 823, 0, 'default|!_[x]|!_[x]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (950, 824, 0, 'default|>_[0]|>_[0]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (951, 825, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (952, 826, 0, 'default|>_[x+10]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (953, 827, 0, 'default|<_[40]|<_[20]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (954, 828, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (955, 829, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (956, 830, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (957, 831, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (958, 834, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (959, 840, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (960, 841, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (961, 842, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (962, 843, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (963, 832, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (964, 833, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (965, 835, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (966, 836, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (967, 837, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (968, 838, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (969, 839, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (971, 846, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (973, 848, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (974, 849, 0, 'default|>_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (975, 850, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (976, 851, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (977, 852, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (978, 853, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (979, 854, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (980, 855, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (981, 856, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (982, 857, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (983, 858, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (984, 859, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (985, 860, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (986, 861, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (987, 862, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (990, 865, 0, 'default|>_[70]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (992, 869, 0, 'default|>_[1]|?_[]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (993, 867, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (994, 869, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (995, 870, 0, 'default|<_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (996, 871, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (997, 872, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (998, 873, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (999, 875, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1000, 874, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1001, 876, 0, 'default|?_[]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1002, 878, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1003, 877, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1004, 879, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1005, 880, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1006, 881, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1007, 882, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1008, 883, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1009, 884, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1010, 885, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1011, 886, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1012, 887, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1013, 888, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1014, 889, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1015, 890, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1016, 893, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1017, 894, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1018, 895, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1019, 898, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1020, 899, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1021, 905, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1022, 906, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1023, 908, 0, 'default|>_[0]|>_[1]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1024, 897, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1025, 896, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1026, 900, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1027, 901, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1028, 902, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1029, 903, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1030, 904, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1031, 907, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1032, 921, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1033, 919, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1034, 920, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1035, 922, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1036, 925, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1037, 915, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1038, 926, 0, 'default|>_[1500]|>_[2000]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1057, 927, 0, 'default|>_[x*1.5]|>_[x*3]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1039, 941, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1040, 943, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1041, 942, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1042, 928, 0, 'default|>_[90]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1043, 939, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1044, 929, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1045, 930, 0, 'default|>_[80]|>_[95]|', 1, 1, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1046, 931, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1047, 933, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1048, 934, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1049, 935, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1050, 937, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1051, 938, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1052, 940, 0, 'default|>_[1500]|>_[2000]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1053, 936, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1054, 945, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1055, 946, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1056, 946, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1058, 947, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1059, 949, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1060, 951, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1061, 955, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1062, 956, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1063, 965, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1064, 966, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1065, 967, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1066, 968, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1067, 969, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1068, 970, 0, 'default|>_[95]|>_[98]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1069, 971, 0, 'default|<_[95]|<_[20]|', 0, 0, 12, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1070, 972, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1071, 973, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1072, 974, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1073, 975, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1074, 977, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1075, 978, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1077, 892, 0, 'default|>_[10]|>_[30]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1079, 1011, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1080, 1010, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1081, 1005, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1082, 1012, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1083, 1025, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1084, 1027, 0, 'default|<_[1]|<_[0]|', 0, 0, 1, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1085, 1026, 0, 'default|<_[2]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1086, 1021, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1087, 1020, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1088, 1015, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1089, 1022, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1090, 959, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1091, 962, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1092, 958, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1093, 963, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1094, 976, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1095, 1032, 0, 'default|!_[x]|=_[0]|', 0, 0, 1, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1096, 1039, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1097, 1043, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1162, 1035, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1161, 1037, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1101, 1047, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1102, 1048, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1103, 1049, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1104, 1050, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1105, 1051, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1106, 1033, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1107, 1034, 0, 'default|!_[x]|=_[0]|', 0, 0, 1, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1108, 1052, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1109, 1053, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1110, 987, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1111, 992, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1112, 997, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1113, 983, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1114, 1054, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1115, 1055, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1116, 1056, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1117, 1057, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1118, 981, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1119, 1058, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1120, 1059, 0, 'default|>_[1440]|>_[4320]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1121, 1060, 0, 'default|!_[x]|=_[0]|', 0, 0, 1, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1122, 1061, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1123, 1062, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1124, 1063, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1125, 1064, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1126, 1065, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1127, 1066, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1128, 1067, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1129, 1068, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1130, 1069, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1131, 1070, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1132, 1071, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1133, 1072, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1134, 1073, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1135, 1074, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1136, 1075, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1137, 1076, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1138, 1077, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1139, 1078, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1140, 1079, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1141, 1080, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1142, 1081, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1143, 1082, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1144, 1083, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1145, 1084, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1146, 1085, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1147, 1086, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1148, 1087, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1149, 1088, 0, 'default|?_[]|=_[0]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1150, 1089, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1151, 1090, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1152, 1091, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1153, 1096, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1154, 1098, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1155, 206, 0, 'default|>_[20]|>_[50]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1156, 207, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1157, 209, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1158, 210, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1159, 239, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1160, 208, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1163, 1036, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1164, 1038, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1165, 1099, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1166, 1100, 0, 'default|>_[0]|?_[]|', 6, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1167, 1101, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1168, 1102, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1169, 1103, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1170, 1104, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1171, 1105, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1172, 1106, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1173, 1107, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1174, 1108, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1175, 1109, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1176, 1110, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1177, 1111, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1178, 1112, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1179, 1113, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1180, 1114, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1181, 1115, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1182, 1116, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1183, 1117, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1184, 1118, 0, 'default|<_[2]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1185, 1119, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1186, 1120, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1187, 1121, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1188, 1122, 0, 'default|>_[5000]|>_[7500]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1189, 1123, 0, 'default|>_[100]|>_[150]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1190, 1124, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1191, 1125, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1192, 1126, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1193, 1131, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1194, 1136, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1195, 1137, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1196, 1138, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1197, 1139, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1198, 1140, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1199, 1141, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1200, 1142, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1201, 1143, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1202, 1144, 0, 'default|?_[]|<_[2]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1203, 1145, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1204, 1146, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1205, 1147, 0, 'default|>_[2000]|>_[3000]|', 12, 6, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_default` VALUES (1206, 1148, 0, 'default|>_[0]|?_[]|', 6, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1207, 1149, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `monitor_checktype_default` VALUES (1208, 1150, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `monitor_checktype_default` VALUES (1209, 1151, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1210, 1152, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1211, 1153, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1212, 1154, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_default` VALUES (1213, 1155, 0, 'default|>_[100]|>_[150]|', 6, 3, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for monitor_checktype_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_checktype_linking`;
CREATE TABLE `monitor_checktype_linking`  (
  `monitor_checktype_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_structure_id` int(11) NULL DEFAULT 0,
  `monitor_category_id` int(11) NULL DEFAULT 0,
  `monitor_subCategory_id` int(11) NULL DEFAULT 0,
  `monitor_mib_linking_id` int(11) NULL DEFAULT 0,
  `checktype_id` int(11) NULL DEFAULT 0,
  `default` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`monitor_checktype_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1156 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of monitor_checktype_linking
-- ----------------------------
INSERT INTO `monitor_checktype_linking` VALUES (45, 0, 0, 0, 4, 0, 0, 0, 0, 2, 1);
INSERT INTO `monitor_checktype_linking` VALUES (46, 0, 0, 0, 4, 0, 0, 0, 0, 3, 1);
INSERT INTO `monitor_checktype_linking` VALUES (47, 0, 0, 0, 4, 0, 0, 0, 0, 9, 1);
INSERT INTO `monitor_checktype_linking` VALUES (48, 0, 0, 0, 4, 0, 0, 0, 0, 13, 1);
INSERT INTO `monitor_checktype_linking` VALUES (49, 0, 0, 0, 4, 0, 0, 0, 0, 15, 1);
INSERT INTO `monitor_checktype_linking` VALUES (50, 0, 0, 0, 4, 0, 0, 0, 0, 18, 1);
INSERT INTO `monitor_checktype_linking` VALUES (51, 0, 0, 0, 4, 0, 0, 0, 0, 30, 1);
INSERT INTO `monitor_checktype_linking` VALUES (52, 0, 0, 0, 4, 0, 0, 0, 0, 25, 1);
INSERT INTO `monitor_checktype_linking` VALUES (53, 0, 0, 0, 4, 0, 0, 0, 0, 32, 1);
INSERT INTO `monitor_checktype_linking` VALUES (54, 0, 0, 0, 4, 0, 0, 0, 0, 43, 1);
INSERT INTO `monitor_checktype_linking` VALUES (55, 0, 0, 0, 4, 0, 0, 0, 0, 44, 1);
INSERT INTO `monitor_checktype_linking` VALUES (65, 1, 1, 0, 1, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (64, 1, 1, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (63, 1, 1, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (62, 1, 1, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (66, 1, 1, 0, 1, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (67, 1, 1, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (68, 1, 1, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (69, 1, 1, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (70, 1, 1, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (71, 1, 1, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (72, 1, 1, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (73, 1, 1, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (74, 1, 1, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (75, 1, 1, 1, 1, 0, 3, 0, 0, 40, 0);
INSERT INTO `monitor_checktype_linking` VALUES (76, 1, 1, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (77, 1, 1, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (78, -1, -1, 7, 1, 0, 3, 0, 0, 40, 0);
INSERT INTO `monitor_checktype_linking` VALUES (79, -1, -1, 7, 1, 0, 3, 0, 0, 41, 0);
INSERT INTO `monitor_checktype_linking` VALUES (80, -1, -1, 7, 1, 0, 3, 0, 0, 42, 0);
INSERT INTO `monitor_checktype_linking` VALUES (81, -1, 1, 3, 1, 0, 3, 0, 0, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (82, -1, 1, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (83, -1, 1, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (84, -1, 1, 11, 1, 0, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (85, -1, 1, 3, 1, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (86, -1, 1, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (87, -1, -1, 4, 1, 0, 3, 0, 0, 80, 1);
INSERT INTO `monitor_checktype_linking` VALUES (88, -1, -1, 2, 1, 0, 3, 0, 0, 1, 1);
INSERT INTO `monitor_checktype_linking` VALUES (89, -1, -1, 2, 1, 0, 3, 0, 0, 27, 1);
INSERT INTO `monitor_checktype_linking` VALUES (90, 5, 4, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (91, 5, 4, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (92, 5, 4, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (93, 5, 4, 0, 1, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (94, 5, 4, 0, 1, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (95, 5, 4, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (96, 5, 4, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (97, 5, 4, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (98, 5, 4, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (99, 5, 4, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (100, 5, 4, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (101, 5, 4, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (102, 5, 4, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (103, 5, 4, 0, 1, 0, 2, 0, 0, 22, 1);
INSERT INTO `monitor_checktype_linking` VALUES (104, -1, -1, 8, 1, 0, 3, 0, 0, 37, 0);
INSERT INTO `monitor_checktype_linking` VALUES (105, -1, -1, 8, 1, 0, 3, 0, 0, 42, 0);
INSERT INTO `monitor_checktype_linking` VALUES (106, 5, 5, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (107, 5, 5, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (108, 5, 5, 0, 1, 0, 1, 0, 0, 36, 1);
INSERT INTO `monitor_checktype_linking` VALUES (109, 5, 5, 0, 1, 0, 1, 0, 0, 39, 1);
INSERT INTO `monitor_checktype_linking` VALUES (110, 5, 5, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (111, 5, 5, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (112, 5, 5, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (113, 5, 5, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (114, 5, 5, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (115, 5, 5, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (116, 5, 5, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (117, 5, 5, 9, 1, 0, 3, 0, 0, 47, 0);
INSERT INTO `monitor_checktype_linking` VALUES (118, 5, 5, 9, 1, 0, 3, 0, 0, 48, 0);
INSERT INTO `monitor_checktype_linking` VALUES (119, 5, 5, 9, 1, 0, 3, 0, 0, 49, 0);
INSERT INTO `monitor_checktype_linking` VALUES (120, -1, -1, 10, 1, 0, 3, 0, 0, 50, 0);
INSERT INTO `monitor_checktype_linking` VALUES (121, -1, -1, 10, 1, 0, 3, 0, 0, 51, 0);
INSERT INTO `monitor_checktype_linking` VALUES (122, -1, -1, 10, 1, 0, 3, 0, 0, 52, 0);
INSERT INTO `monitor_checktype_linking` VALUES (123, -1, -1, 10, 1, 0, 3, 0, 0, 53, 0);
INSERT INTO `monitor_checktype_linking` VALUES (124, -1, -1, 10, 1, 0, 3, 0, 0, 55, 0);
INSERT INTO `monitor_checktype_linking` VALUES (125, -1, -1, 10, 1, 0, 3, 0, 0, 56, 0);
INSERT INTO `monitor_checktype_linking` VALUES (126, 6, 6, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (127, 6, 6, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (128, 6, 6, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (129, 6, 6, 0, 1, 0, 1, 0, 0, 36, 1);
INSERT INTO `monitor_checktype_linking` VALUES (130, 6, 6, 0, 1, 0, 1, 0, 0, 39, 1);
INSERT INTO `monitor_checktype_linking` VALUES (131, 6, 6, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (132, 6, 6, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (133, 6, 6, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (134, 6, 6, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (135, 6, 6, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (136, 6, 6, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (137, 6, 6, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (138, 6, 6, 0, 1, 0, 2, 0, 0, 22, 0);
INSERT INTO `monitor_checktype_linking` VALUES (139, 7, 7, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (140, 7, 7, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (141, 7, 7, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (142, 7, 7, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (143, 7, 7, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (144, 7, 7, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (145, 7, 7, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (146, 7, 7, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (147, 7, 7, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (148, 7, 7, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (149, 7, 7, 0, 1, 0, 2, 0, 0, 22, 1);
INSERT INTO `monitor_checktype_linking` VALUES (150, -1, 1, 0, 2, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (151, -1, 1, 0, 2, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (152, -1, 1, 0, 2, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (153, -1, 1, 0, 2, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (154, -1, 1, 3, 2, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (155, -1, 1, 3, 2, 0, 3, 0, 0, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (478, -1, 2, 0, 7, 0, 2, 0, 8, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (161, 4, 3, 0, 2, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (162, 4, 3, 0, 2, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (163, 4, 3, 0, 2, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (164, 4, 3, 0, 2, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (165, 4, 3, 0, 2, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (166, -1, 2, 5, 3, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (167, -1, 2, 5, 3, 0, 3, 0, 0, 79, 1);
INSERT INTO `monitor_checktype_linking` VALUES (168, 2, 2, 0, 3, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (169, 2, 2, 0, 3, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (170, 2, 2, 0, 3, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (171, 2, 2, 0, 3, 0, 1, 0, 0, 73, 1);
INSERT INTO `monitor_checktype_linking` VALUES (172, 2, 2, 0, 3, 0, 1, 0, 0, 74, 1);
INSERT INTO `monitor_checktype_linking` VALUES (173, 2, 2, 0, 3, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (174, 2, 2, 0, 3, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (175, 3, 2, 0, 3, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (176, 3, 2, 0, 3, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (177, 3, 2, 0, 3, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (178, 3, 2, 0, 3, 0, 1, 0, 0, 73, 1);
INSERT INTO `monitor_checktype_linking` VALUES (179, 3, 2, 0, 3, 0, 1, 0, 0, 74, 1);
INSERT INTO `monitor_checktype_linking` VALUES (180, 3, 2, 0, 3, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (181, 3, 2, 0, 3, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (182, 3, 2, 0, 3, 0, 2, 0, 0, 77, 1);
INSERT INTO `monitor_checktype_linking` VALUES (183, 3, 2, 0, 3, 0, 2, 0, 0, 78, 1);
INSERT INTO `monitor_checktype_linking` VALUES (184, 3, 2, 0, 3, 0, 1, 0, 0, 65, 1);
INSERT INTO `monitor_checktype_linking` VALUES (185, 3, 2, 0, 3, 0, 1, 0, 0, 66, 1);
INSERT INTO `monitor_checktype_linking` VALUES (186, 3, 2, 0, 3, 0, 1, 0, 0, 67, 1);
INSERT INTO `monitor_checktype_linking` VALUES (187, 3, 2, 0, 3, 0, 1, 0, 0, 68, 1);
INSERT INTO `monitor_checktype_linking` VALUES (188, 3, 2, 0, 3, 0, 1, 0, 0, 69, 1);
INSERT INTO `monitor_checktype_linking` VALUES (189, 3, 2, 0, 3, 0, 1, 0, 0, 70, 1);
INSERT INTO `monitor_checktype_linking` VALUES (190, 3, 2, 0, 3, 0, 1, 0, 0, 71, 1);
INSERT INTO `monitor_checktype_linking` VALUES (191, 3, 2, 0, 3, 0, 1, 0, 0, 72, 1);
INSERT INTO `monitor_checktype_linking` VALUES (192, 4, 3, 0, 3, 0, 1, 0, 0, 73, 1);
INSERT INTO `monitor_checktype_linking` VALUES (193, 4, 3, 0, 3, 0, 1, 0, 0, 74, 1);
INSERT INTO `monitor_checktype_linking` VALUES (194, 4, 3, 0, 3, 0, 1, 0, 0, 36, 1);
INSERT INTO `monitor_checktype_linking` VALUES (195, 4, 3, 0, 3, 0, 1, 0, 0, 39, 1);
INSERT INTO `monitor_checktype_linking` VALUES (196, 4, 3, 0, 3, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (197, 4, 3, 0, 3, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (198, 4, 3, 0, 3, 0, 2, 0, 0, 10, 0);
INSERT INTO `monitor_checktype_linking` VALUES (199, 4, 3, 0, 3, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (200, 4, 3, 6, 3, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (201, 4, 3, 6, 3, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (238, -1, 1, 3, 1, 0, 3, 0, 0, 19, 0);
INSERT INTO `monitor_checktype_linking` VALUES (203, 4, 3, 6, 3, 0, 3, 0, 0, 76, 1);
INSERT INTO `monitor_checktype_linking` VALUES (204, 5, 5, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (205, 5, 4, 3, 1, 0, 3, 0, 0, 4, 0);
INSERT INTO `monitor_checktype_linking` VALUES (206, 5, 4, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (207, 5, 4, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (208, 5, 4, 11, 1, 0, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (209, 5, 4, 3, 1, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (210, 5, 4, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (212, 5, 5, 3, 1, 0, 3, 0, 0, 4, 0);
INSERT INTO `monitor_checktype_linking` VALUES (213, 5, 5, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (214, 5, 5, 3, 1, 0, 3, 0, 0, 26, 0);
INSERT INTO `monitor_checktype_linking` VALUES (215, 5, 5, 11, 1, 0, 3, 0, 0, 29, 0);
INSERT INTO `monitor_checktype_linking` VALUES (216, 5, 5, 3, 1, 0, 3, 0, 0, 46, 0);
INSERT INTO `monitor_checktype_linking` VALUES (217, 5, 5, 3, 1, 0, 3, 0, 0, 17, 0);
INSERT INTO `monitor_checktype_linking` VALUES (219, 7, 7, 3, 1, 0, 3, 0, 0, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (220, 7, 7, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (221, 7, 7, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (222, 7, 7, 11, 1, 0, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (223, 7, 7, 3, 1, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (224, 7, 7, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (226, 6, 6, 3, 1, 0, 3, 0, 0, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (227, 6, 6, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (228, 6, 6, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (229, 6, 6, 11, 1, 0, 3, 0, 0, 29, 0);
INSERT INTO `monitor_checktype_linking` VALUES (230, 6, 6, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (239, 5, 4, 3, 1, 0, 3, 0, 0, 19, 0);
INSERT INTO `monitor_checktype_linking` VALUES (240, 5, 5, 3, 1, 0, 3, 0, 0, 19, 0);
INSERT INTO `monitor_checktype_linking` VALUES (241, 7, 7, 3, 1, 0, 3, 0, 0, 19, 0);
INSERT INTO `monitor_checktype_linking` VALUES (242, 5, 1, 0, 1, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (243, 5, 1, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (244, 5, 1, 0, 1, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (245, 5, 1, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (246, 5, 1, 0, 1, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (247, 5, 1, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (248, 5, 1, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (249, 5, 1, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (250, 5, 1, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (251, 5, 1, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (252, 5, 1, 0, 1, 0, 2, 0, 23, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (253, 5, 1, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (254, 5, 1, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (255, 8, 8, 12, 2, 0, 3, 0, 0, 95, 1);
INSERT INTO `monitor_checktype_linking` VALUES (256, 8, 8, 12, 2, 0, 3, 0, 0, 96, 1);
INSERT INTO `monitor_checktype_linking` VALUES (257, 8, 8, 0, 2, 0, 1, 0, 0, 92, 1);
INSERT INTO `monitor_checktype_linking` VALUES (258, 8, 8, 0, 2, 0, 1, 0, 0, 93, 1);
INSERT INTO `monitor_checktype_linking` VALUES (259, 8, 8, 0, 2, 0, 1, 0, 0, 94, 1);
INSERT INTO `monitor_checktype_linking` VALUES (260, 8, 8, 12, 2, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (261, 8, 8, 0, 2, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (262, 8, 8, 0, 2, 0, 2, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (263, 8, 8, 0, 2, 0, 1, 0, 0, 39, 1);
INSERT INTO `monitor_checktype_linking` VALUES (264, 8, 8, 0, 2, 0, 1, 0, 0, 83, 1);
INSERT INTO `monitor_checktype_linking` VALUES (265, 8, 8, 0, 2, 0, 1, 0, 0, 36, 1);
INSERT INTO `monitor_checktype_linking` VALUES (266, 8, 8, 0, 2, 0, 1, 0, 0, 84, 1);
INSERT INTO `monitor_checktype_linking` VALUES (267, 8, 8, 0, 2, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (268, 8, 8, 0, 2, 0, 1, 0, 0, 81, 1);
INSERT INTO `monitor_checktype_linking` VALUES (269, 8, 8, 0, 2, 0, 1, 0, 0, 82, 1);
INSERT INTO `monitor_checktype_linking` VALUES (270, 8, 8, 0, 2, 0, 1, 0, 0, 73, 1);
INSERT INTO `monitor_checktype_linking` VALUES (271, 8, 8, 0, 2, 0, 1, 0, 0, 74, 1);
INSERT INTO `monitor_checktype_linking` VALUES (272, 8, 8, 0, 2, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (273, 8, 8, 12, 2, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (274, 0, 0, 0, 0, 103, 4, 0, 0, 97, 1);
INSERT INTO `monitor_checktype_linking` VALUES (275, 0, 0, 0, 0, 103, 4, 0, 0, 98, 1);
INSERT INTO `monitor_checktype_linking` VALUES (276, 0, 0, 0, 0, 103, 4, 14, 0, 99, 1);
INSERT INTO `monitor_checktype_linking` VALUES (277, 0, 0, 0, 0, 103, 4, 14, 0, 100, 1);
INSERT INTO `monitor_checktype_linking` VALUES (278, 0, 0, 0, 0, 103, 4, 14, 0, 101, 1);
INSERT INTO `monitor_checktype_linking` VALUES (279, 0, 0, 0, 0, 103, 4, 14, 0, 102, 1);
INSERT INTO `monitor_checktype_linking` VALUES (280, 0, 0, 0, 0, 103, 4, 14, 0, 103, 1);
INSERT INTO `monitor_checktype_linking` VALUES (281, 0, 0, 0, 0, 103, 4, 14, 0, 104, 1);
INSERT INTO `monitor_checktype_linking` VALUES (282, 0, 0, 0, 0, 103, 4, 14, 0, 105, 1);
INSERT INTO `monitor_checktype_linking` VALUES (283, 0, 0, 0, 0, 103, 4, 14, 0, 106, 1);
INSERT INTO `monitor_checktype_linking` VALUES (284, 0, 0, 0, 0, 103, 4, 0, 0, 107, 1);
INSERT INTO `monitor_checktype_linking` VALUES (285, 0, 0, 0, 0, 103, 4, 14, 0, 108, 1);
INSERT INTO `monitor_checktype_linking` VALUES (286, 0, 0, 0, 0, 103, 4, 0, 0, 109, 1);
INSERT INTO `monitor_checktype_linking` VALUES (287, 0, 0, 0, 0, 103, 4, 0, 0, 110, 1);
INSERT INTO `monitor_checktype_linking` VALUES (288, 0, 0, 0, 0, 104, 4, 0, 0, 97, 1);
INSERT INTO `monitor_checktype_linking` VALUES (289, 0, 0, 0, 0, 104, 4, 0, 0, 98, 1);
INSERT INTO `monitor_checktype_linking` VALUES (290, 0, 0, 0, 0, 104, 4, 14, 0, 99, 1);
INSERT INTO `monitor_checktype_linking` VALUES (291, 0, 0, 0, 0, 104, 4, 14, 0, 100, 1);
INSERT INTO `monitor_checktype_linking` VALUES (292, 0, 0, 0, 0, 104, 4, 14, 0, 101, 1);
INSERT INTO `monitor_checktype_linking` VALUES (293, 0, 0, 0, 0, 104, 4, 14, 0, 102, 1);
INSERT INTO `monitor_checktype_linking` VALUES (294, 0, 0, 0, 0, 104, 4, 14, 0, 103, 1);
INSERT INTO `monitor_checktype_linking` VALUES (295, 0, 0, 0, 0, 104, 4, 14, 0, 104, 1);
INSERT INTO `monitor_checktype_linking` VALUES (296, 0, 0, 0, 0, 104, 4, 14, 0, 105, 1);
INSERT INTO `monitor_checktype_linking` VALUES (297, 0, 0, 0, 0, 104, 4, 14, 0, 106, 1);
INSERT INTO `monitor_checktype_linking` VALUES (298, 0, 0, 0, 0, 104, 4, 0, 0, 107, 1);
INSERT INTO `monitor_checktype_linking` VALUES (299, 0, 0, 0, 0, 104, 4, 14, 0, 108, 1);
INSERT INTO `monitor_checktype_linking` VALUES (300, 0, 0, 0, 0, 104, 4, 0, 0, 109, 1);
INSERT INTO `monitor_checktype_linking` VALUES (301, 0, 0, 0, 0, 104, 4, 0, 0, 110, 1);
INSERT INTO `monitor_checktype_linking` VALUES (302, 4, 3, 0, 3, 0, 1, 0, 0, 111, 0);
INSERT INTO `monitor_checktype_linking` VALUES (303, 5, 4, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (304, 5, 4, 0, 1, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (305, 1, 1, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (306, 1, 1, 0, 1, 0, 1, 0, 0, 112, 0);
INSERT INTO `monitor_checktype_linking` VALUES (307, 5, 1, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (308, 5, 1, 0, 1, 0, 1, 0, 0, 112, 0);
INSERT INTO `monitor_checktype_linking` VALUES (309, 5, 5, 0, 1, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (310, 5, 4, 13, 1, 0, 3, 0, 0, 57, 1);
INSERT INTO `monitor_checktype_linking` VALUES (311, 5, 4, 13, 1, 0, 3, 0, 0, 58, 1);
INSERT INTO `monitor_checktype_linking` VALUES (312, 5, 4, 13, 1, 0, 3, 0, 0, 59, 1);
INSERT INTO `monitor_checktype_linking` VALUES (313, 5, 4, 13, 1, 0, 3, 0, 0, 60, 1);
INSERT INTO `monitor_checktype_linking` VALUES (314, 5, 4, 13, 1, 0, 3, 0, 0, 61, 1);
INSERT INTO `monitor_checktype_linking` VALUES (315, 5, 4, 13, 1, 0, 3, 0, 0, 62, 1);
INSERT INTO `monitor_checktype_linking` VALUES (316, 0, 0, 0, 0, 103, 4, 15, 0, 113, 1);
INSERT INTO `monitor_checktype_linking` VALUES (317, 0, 0, 0, 0, 104, 4, 15, 0, 113, 1);
INSERT INTO `monitor_checktype_linking` VALUES (318, 0, 0, 0, 0, 103, 4, 15, 0, 114, 1);
INSERT INTO `monitor_checktype_linking` VALUES (319, 0, 0, 0, 0, 104, 4, 15, 0, 114, 1);
INSERT INTO `monitor_checktype_linking` VALUES (320, 0, 0, 0, 0, 103, 4, 15, 0, 115, 1);
INSERT INTO `monitor_checktype_linking` VALUES (321, 0, 0, 0, 0, 104, 4, 15, 0, 115, 1);
INSERT INTO `monitor_checktype_linking` VALUES (322, 0, 0, 0, 0, 103, 4, 15, 0, 116, 1);
INSERT INTO `monitor_checktype_linking` VALUES (323, 0, 0, 0, 0, 104, 4, 15, 0, 116, 1);
INSERT INTO `monitor_checktype_linking` VALUES (324, 0, 0, 0, 0, 103, 4, 15, 0, 119, 1);
INSERT INTO `monitor_checktype_linking` VALUES (325, 0, 0, 0, 0, 104, 4, 15, 0, 119, 1);
INSERT INTO `monitor_checktype_linking` VALUES (326, 0, 0, 0, 0, 103, 4, 15, 0, 120, 1);
INSERT INTO `monitor_checktype_linking` VALUES (327, 0, 0, 0, 0, 104, 4, 15, 0, 120, 1);
INSERT INTO `monitor_checktype_linking` VALUES (328, 0, 0, 0, 0, 103, 4, 15, 0, 117, 1);
INSERT INTO `monitor_checktype_linking` VALUES (329, 0, 0, 0, 0, 104, 4, 15, 0, 117, 1);
INSERT INTO `monitor_checktype_linking` VALUES (330, 0, 0, 0, 0, 103, 4, 15, 0, 118, 1);
INSERT INTO `monitor_checktype_linking` VALUES (331, 0, 0, 0, 0, 104, 4, 15, 0, 118, 1);
INSERT INTO `monitor_checktype_linking` VALUES (332, 0, 0, 0, 0, 103, 4, 15, 0, 121, 1);
INSERT INTO `monitor_checktype_linking` VALUES (333, 0, 0, 0, 0, 104, 4, 15, 0, 121, 1);
INSERT INTO `monitor_checktype_linking` VALUES (334, -1, -1, 4, 1, 0, 3, 0, 0, 122, 1);
INSERT INTO `monitor_checktype_linking` VALUES (335, -1, -1, 4, 1, 0, 3, 0, 0, 123, 1);
INSERT INTO `monitor_checktype_linking` VALUES (336, -1, -1, 14, 1, 0, 3, 0, 0, 124, 1);
INSERT INTO `monitor_checktype_linking` VALUES (338, -1, 1, 3, 1, 0, 3, 0, 0, 125, 1);
INSERT INTO `monitor_checktype_linking` VALUES (340, -1, -1, 2, 1, 0, 3, 0, 0, 127, 1);
INSERT INTO `monitor_checktype_linking` VALUES (342, 1, 1, 0, 1, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (343, 1, 1, 0, 1, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (344, 1, 1, 0, 1, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (345, 1, 1, 0, 1, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (346, 1, 1, 0, 1, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (347, 5, 1, 0, 1, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (348, 5, 1, 0, 1, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (349, 5, 1, 0, 1, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (350, 5, 1, 0, 1, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (351, 5, 1, 0, 1, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (352, -1, 1, 11, 1, 0, 3, 0, 0, 134, 1);
INSERT INTO `monitor_checktype_linking` VALUES (353, 9, 9, 0, 1, 0, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (354, 9, 9, 0, 1, 0, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (355, 9, 9, 0, 1, 0, 5, 0, 0, 131, 0);
INSERT INTO `monitor_checktype_linking` VALUES (356, 9, 9, 0, 1, 0, 5, 0, 0, 130, 0);
INSERT INTO `monitor_checktype_linking` VALUES (357, 9, 9, 0, 1, 0, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (358, 9, 9, 3, 1, 0, 3, 0, 0, 125, 1);
INSERT INTO `monitor_checktype_linking` VALUES (359, 9, 9, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (360, 9, 9, 3, 1, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (361, 9, 9, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (362, 9, 9, 0, 1, 0, 5, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (363, 9, 9, 0, 1, 0, 5, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (364, 9, 9, 0, 1, 0, 5, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (365, 9, 9, 11, 1, 0, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (366, 0, 9, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (367, 0, 9, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (368, 0, 9, 1, 1, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (369, 0, 9, 0, 1, 0, 5, 0, 0, 16, 1);
INSERT INTO `monitor_checktype_linking` VALUES (370, 9, 9, 0, 1, 0, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (371, 0, 0, 0, 0, 103, 4, 0, 0, 135, 1);
INSERT INTO `monitor_checktype_linking` VALUES (372, 0, 0, 0, 0, 104, 4, 0, 0, 135, 1);
INSERT INTO `monitor_checktype_linking` VALUES (373, 10, 9, 0, 1, 0, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (374, 10, 9, 0, 1, 0, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (375, 10, 9, 0, 1, 0, 5, 0, 0, 131, 0);
INSERT INTO `monitor_checktype_linking` VALUES (376, 10, 9, 0, 1, 0, 5, 0, 0, 130, 0);
INSERT INTO `monitor_checktype_linking` VALUES (377, 10, 9, 0, 1, 0, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (378, 10, 9, 0, 1, 0, 5, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (379, 10, 9, 0, 1, 0, 5, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (380, 10, 9, 0, 1, 0, 5, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (381, 10, 9, 0, 1, 0, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (382, 10, 9, 0, 1, 0, 0, 0, 0, 136, 0);
INSERT INTO `monitor_checktype_linking` VALUES (383, 9, 9, 0, 1, 0, 3, 0, 0, 136, 1);
INSERT INTO `monitor_checktype_linking` VALUES (384, -1, 1, 15, 1, 0, 3, 16, 0, 138, 1);
INSERT INTO `monitor_checktype_linking` VALUES (385, -1, 1, 15, 1, 0, 3, 16, 0, 137, 1);
INSERT INTO `monitor_checktype_linking` VALUES (386, -1, 1, 15, 1, 0, 3, 16, 0, 139, 1);
INSERT INTO `monitor_checktype_linking` VALUES (387, -1, 1, 15, 1, 0, 3, 16, 0, 140, 1);
INSERT INTO `monitor_checktype_linking` VALUES (388, -1, 1, 15, 1, 0, 3, 16, 0, 141, 1);
INSERT INTO `monitor_checktype_linking` VALUES (389, -1, 1, 15, 1, 0, 3, 16, 0, 142, 1);
INSERT INTO `monitor_checktype_linking` VALUES (390, -1, 1, 15, 1, 0, 3, 16, 0, 143, 1);
INSERT INTO `monitor_checktype_linking` VALUES (391, -1, 1, 15, 1, 0, 3, 16, 0, 144, 1);
INSERT INTO `monitor_checktype_linking` VALUES (415, 5, 1, 1, 1, 0, 3, 0, 0, 40, 0);
INSERT INTO `monitor_checktype_linking` VALUES (416, 5, 1, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (417, 5, 1, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (418, 7, -1, 1, 1, 0, 3, 0, 0, 40, 0);
INSERT INTO `monitor_checktype_linking` VALUES (419, 7, -1, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (420, 7, -1, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (421, 9, -1, 1, 1, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (422, 9, -1, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (423, 9, -1, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (433, 0, 0, 0, 0, 103, 4, 0, 0, 145, 1);
INSERT INTO `monitor_checktype_linking` VALUES (434, 0, 0, 0, 0, 104, 4, 0, 0, 145, 1);
INSERT INTO `monitor_checktype_linking` VALUES (441, 11, -1, 0, 7, 0, 2, 0, 7, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (436, -1, -1, 0, 7, 0, 1, 0, 2, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (437, -1, -1, 0, 7, 0, 1, 0, 3, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (438, -1, -1, 0, 7, 0, 1, 0, 4, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (439, -1, -1, 0, 7, 0, 1, 0, 5, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (440, 5, -1, 0, 7, 0, 1, 0, 29, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (442, 0, 0, 0, 0, 103, 4, 17, 0, 152, 1);
INSERT INTO `monitor_checktype_linking` VALUES (443, 0, 0, 0, 0, 104, 4, 17, 0, 152, 1);
INSERT INTO `monitor_checktype_linking` VALUES (444, 0, 0, 0, 0, 103, 4, 17, 0, 154, 1);
INSERT INTO `monitor_checktype_linking` VALUES (445, 0, 0, 0, 0, 104, 4, 17, 0, 154, 1);
INSERT INTO `monitor_checktype_linking` VALUES (446, 0, 0, 0, 0, 103, 4, 17, 0, 153, 1);
INSERT INTO `monitor_checktype_linking` VALUES (447, 0, 0, 0, 0, 104, 4, 17, 0, 153, 1);
INSERT INTO `monitor_checktype_linking` VALUES (448, 0, 0, 0, 0, 103, 4, 17, 0, 151, 1);
INSERT INTO `monitor_checktype_linking` VALUES (449, 0, 0, 0, 0, 104, 4, 17, 0, 151, 1);
INSERT INTO `monitor_checktype_linking` VALUES (450, 0, 0, 0, 0, 103, 4, 18, 0, 149, 1);
INSERT INTO `monitor_checktype_linking` VALUES (451, 0, 0, 0, 0, 104, 4, 18, 0, 149, 1);
INSERT INTO `monitor_checktype_linking` VALUES (452, 0, 0, 0, 0, 103, 4, 18, 0, 150, 1);
INSERT INTO `monitor_checktype_linking` VALUES (453, 0, 0, 0, 0, 104, 4, 18, 0, 150, 1);
INSERT INTO `monitor_checktype_linking` VALUES (454, 0, 0, 0, 0, 103, 4, 18, 0, 147, 1);
INSERT INTO `monitor_checktype_linking` VALUES (455, 0, 0, 0, 0, 104, 4, 18, 0, 147, 1);
INSERT INTO `monitor_checktype_linking` VALUES (456, 0, 0, 0, 0, 103, 4, 18, 0, 148, 1);
INSERT INTO `monitor_checktype_linking` VALUES (457, 0, 0, 0, 0, 104, 4, 18, 0, 148, 1);
INSERT INTO `monitor_checktype_linking` VALUES (458, 0, 0, 0, 0, 103, 4, 17, 0, 155, 1);
INSERT INTO `monitor_checktype_linking` VALUES (459, 0, 0, 0, 0, 104, 4, 17, 0, 155, 1);
INSERT INTO `monitor_checktype_linking` VALUES (460, 0, 0, 0, 0, 103, 4, 18, 0, 156, 1);
INSERT INTO `monitor_checktype_linking` VALUES (461, 0, 0, 0, 0, 104, 4, 18, 0, 156, 1);
INSERT INTO `monitor_checktype_linking` VALUES (462, 0, 0, 0, 0, 103, 4, 17, 0, 157, 1);
INSERT INTO `monitor_checktype_linking` VALUES (463, 0, 0, 0, 0, 104, 4, 17, 0, 157, 1);
INSERT INTO `monitor_checktype_linking` VALUES (464, 0, 0, 0, 0, 103, 4, 18, 0, 158, 1);
INSERT INTO `monitor_checktype_linking` VALUES (465, 0, 0, 0, 0, 104, 4, 18, 0, 158, 1);
INSERT INTO `monitor_checktype_linking` VALUES (466, 0, 0, 0, 0, 103, 4, 17, 0, 159, 1);
INSERT INTO `monitor_checktype_linking` VALUES (467, 0, 0, 0, 0, 104, 4, 17, 0, 159, 1);
INSERT INTO `monitor_checktype_linking` VALUES (468, 0, 0, 0, 0, 103, 4, 18, 0, 160, 1);
INSERT INTO `monitor_checktype_linking` VALUES (469, 0, 0, 0, 0, 104, 4, 18, 0, 160, 1);
INSERT INTO `monitor_checktype_linking` VALUES (470, 0, 0, 0, 0, 103, 4, 17, 0, 161, 1);
INSERT INTO `monitor_checktype_linking` VALUES (471, 0, 0, 0, 0, 104, 4, 17, 0, 161, 1);
INSERT INTO `monitor_checktype_linking` VALUES (472, 0, 0, 0, 0, 103, 4, 18, 0, 162, 1);
INSERT INTO `monitor_checktype_linking` VALUES (473, 0, 0, 0, 0, 104, 4, 18, 0, 162, 1);
INSERT INTO `monitor_checktype_linking` VALUES (474, 0, 0, 0, 0, 103, 4, 17, 0, 163, 1);
INSERT INTO `monitor_checktype_linking` VALUES (475, 0, 0, 0, 0, 104, 4, 17, 0, 163, 1);
INSERT INTO `monitor_checktype_linking` VALUES (476, 0, 0, 0, 0, 103, 4, 18, 0, 164, 1);
INSERT INTO `monitor_checktype_linking` VALUES (477, 0, 0, 0, 0, 104, 4, 18, 0, 164, 1);
INSERT INTO `monitor_checktype_linking` VALUES (479, -1, 1, 0, 7, 0, 2, 0, 9, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (480, -1, 1, 3, 7, 0, 3, 0, 10, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (481, -1, 1, 0, 7, 0, 2, 0, 8, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (482, -1, 1, 14, 7, 0, 3, 0, 11, 124, 1);
INSERT INTO `monitor_checktype_linking` VALUES (483, -1, 1, 3, 7, 0, 3, 0, 12, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (484, -1, 1, 0, 7, 0, 2, 0, 13, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (485, -1, 1, 3, 7, 0, 3, 0, 14, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (486, -1, 1, 4, 7, 0, 3, 0, 15, 123, 1);
INSERT INTO `monitor_checktype_linking` VALUES (487, -1, 1, 4, 7, 0, 3, 0, 16, 122, 1);
INSERT INTO `monitor_checktype_linking` VALUES (488, -1, 1, 3, 7, 0, 3, 0, 17, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (489, -1, 1, 0, 7, 0, 1, 0, 18, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (490, -1, 1, 0, 7, 0, 1, 0, 19, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (491, -1, 1, 0, 7, 0, 1, 0, 20, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (492, -1, 1, 0, 7, 0, 1, 0, 21, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (493, -1, 1, 3, 7, 0, 1, 0, 22, 125, 1);
INSERT INTO `monitor_checktype_linking` VALUES (494, -1, 1, 0, 7, 0, 2, 0, 23, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (495, -1, 1, 11, 7, 0, 3, 0, 26, 134, 1);
INSERT INTO `monitor_checktype_linking` VALUES (496, -1, 1, 11, 7, 0, 3, 0, 25, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (497, -1, 1, 11, 7, 0, 3, 0, 27, 165, 1);
INSERT INTO `monitor_checktype_linking` VALUES (498, 0, 0, 0, 0, 103, 4, 0, 0, 166, 1);
INSERT INTO `monitor_checktype_linking` VALUES (499, 0, 0, 0, 0, 104, 4, 0, 0, 166, 1);
INSERT INTO `monitor_checktype_linking` VALUES (509, 0, 0, 0, 0, 151, 3, 0, 0, 174, 0);
INSERT INTO `monitor_checktype_linking` VALUES (502, 0, 0, 0, 0, 151, 3, 0, 0, 168, 1);
INSERT INTO `monitor_checktype_linking` VALUES (503, 0, 0, 0, 0, 151, 3, 0, 0, 169, 1);
INSERT INTO `monitor_checktype_linking` VALUES (504, 0, 0, 0, 0, 151, 3, 0, 0, 170, 1);
INSERT INTO `monitor_checktype_linking` VALUES (505, 0, 0, 0, 0, 151, 3, 0, 0, 171, 1);
INSERT INTO `monitor_checktype_linking` VALUES (507, 0, 0, 0, 0, 151, 3, 0, 0, 172, 0);
INSERT INTO `monitor_checktype_linking` VALUES (508, 0, 0, 0, 0, 151, 3, 0, 0, 173, 0);
INSERT INTO `monitor_checktype_linking` VALUES (510, 9, 9, 0, 1, 0, 3, 16, 0, 144, 1);
INSERT INTO `monitor_checktype_linking` VALUES (511, 10, 9, 0, 1, 0, 3, 16, 0, 144, 1);
INSERT INTO `monitor_checktype_linking` VALUES (518, 5, 5, 0, 7, 0, 2, 0, 35, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (513, 5, 4, 0, 1, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (514, 5, 4, 0, 1, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (515, 5, 4, 0, 1, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (516, 5, 4, 0, 1, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (517, 5, 4, 0, 1, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (519, 4, 3, 0, 3, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (520, -1, 2, 5, 10, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (521, -1, 2, 0, 10, 0, 2, 0, 0, 77, 1);
INSERT INTO `monitor_checktype_linking` VALUES (522, -1, 2, 0, 10, 0, 2, 0, 0, 78, 1);
INSERT INTO `monitor_checktype_linking` VALUES (523, -1, 2, 0, 10, 0, 2, 0, 0, 79, 1);
INSERT INTO `monitor_checktype_linking` VALUES (524, -1, 2, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (525, -1, 2, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (526, -1, 2, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (527, -1, 2, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (528, -1, 2, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (529, -1, 2, 0, 10, 0, 1, 0, 0, 177, 0);
INSERT INTO `monitor_checktype_linking` VALUES (530, -1, 2, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (532, -1, 2, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (533, -1, 2, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (534, -1, 2, 0, 10, 0, 1, 0, 0, 84, 1);
INSERT INTO `monitor_checktype_linking` VALUES (535, -1, 2, 0, 10, 0, 1, 0, 0, 83, 1);
INSERT INTO `monitor_checktype_linking` VALUES (536, -1, 2, 5, 10, 0, 3, 0, 0, 46, 0);
INSERT INTO `monitor_checktype_linking` VALUES (537, 4, 3, 0, 3, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (538, 4, 3, 6, 3, 0, 3, 0, 0, 4, 1);
INSERT INTO `monitor_checktype_linking` VALUES (539, 11, -1, 0, 7, 0, 1, 0, 6, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (540, 3, 2, 0, 10, 0, 1, 8, 0, 65, 1);
INSERT INTO `monitor_checktype_linking` VALUES (541, 3, 2, 0, 10, 0, 1, 8, 0, 66, 1);
INSERT INTO `monitor_checktype_linking` VALUES (542, 3, 2, 0, 10, 0, 1, 8, 0, 67, 1);
INSERT INTO `monitor_checktype_linking` VALUES (543, 3, 2, 0, 10, 0, 1, 8, 0, 68, 1);
INSERT INTO `monitor_checktype_linking` VALUES (544, 3, 2, 0, 10, 0, 1, 8, 0, 69, 1);
INSERT INTO `monitor_checktype_linking` VALUES (545, 3, 2, 0, 10, 0, 1, 8, 0, 70, 1);
INSERT INTO `monitor_checktype_linking` VALUES (546, 3, 2, 0, 10, 0, 1, 8, 0, 71, 1);
INSERT INTO `monitor_checktype_linking` VALUES (547, 3, 2, 0, 10, 0, 1, 8, 0, 72, 1);
INSERT INTO `monitor_checktype_linking` VALUES (548, 5, 5, 0, 7, 0, 2, 0, 30, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (550, 5, 5, 0, 7, 0, 1, 0, 31, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (551, 5, 5, 0, 7, 0, 2, 0, 32, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (558, 7, 7, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (554, 5, 5, 0, 7, 0, 2, 0, 36, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (555, 5, 5, 0, 7, 0, 1, 0, 37, 112, 0);
INSERT INTO `monitor_checktype_linking` VALUES (556, 5, 5, 0, 7, 0, 1, 0, 38, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (557, -1, 2, 5, 10, 0, 3, 0, 0, 134, 1);
INSERT INTO `monitor_checktype_linking` VALUES (559, 7, 7, 0, 1, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (560, 7, 7, 0, 1, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (561, 7, 7, 0, 1, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (562, 7, 7, 0, 1, 0, 1, 0, 0, 83, 1);
INSERT INTO `monitor_checktype_linking` VALUES (563, 7, 7, 0, 1, 0, 1, 0, 0, 84, 1);
INSERT INTO `monitor_checktype_linking` VALUES (673, 4, 3, 17, 10, 0, 3, 0, 0, 40, 0);
INSERT INTO `monitor_checktype_linking` VALUES (674, 4, 3, 17, 10, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (675, 4, 3, 17, 10, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (676, 4, 3, 6, 10, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (677, 4, 3, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (678, 4, 3, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (679, 4, 3, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (680, 4, 3, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (681, 4, 3, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (682, 4, 3, 6, 10, 0, 3, 0, 0, 4, 0);
INSERT INTO `monitor_checktype_linking` VALUES (683, 4, 3, 6, 10, 0, 3, 0, 0, 76, 0);
INSERT INTO `monitor_checktype_linking` VALUES (684, 4, 3, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (685, 4, 3, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (686, 4, 3, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (687, 4, 3, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (688, 4, 3, 0, 10, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (689, 4, 3, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (690, 4, 3, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (691, 4, 3, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (692, 4, 3, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (693, 4, 3, 0, 10, 0, 2, 0, 0, 10, 0);
INSERT INTO `monitor_checktype_linking` VALUES (694, 4, 3, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (695, 4, 3, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (696, 4, 3, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (697, 4, 3, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (698, 4, 3, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (699, 4, 3, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (700, 4, 3, 6, 10, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (701, 4, 3, 6, 10, 0, 3, 0, 0, 178, 1);
INSERT INTO `monitor_checktype_linking` VALUES (702, 12, 13, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (703, 12, 13, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (704, 12, 13, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (705, 12, 13, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (706, 12, 13, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (707, 12, 13, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (708, 12, 13, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (709, 12, 13, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (710, 12, 13, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (711, 12, 13, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (712, 12, 13, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (713, 12, 13, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (714, 12, 13, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (715, 12, 13, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (716, 12, 13, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (717, 12, 13, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (718, 12, 13, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (719, 12, 13, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (720, 12, 13, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (722, 12, 13, 18, 10, 0, 3, 0, 0, 179, 1);
INSERT INTO `monitor_checktype_linking` VALUES (723, 12, 13, 18, 10, 0, 3, 0, 0, 180, 1);
INSERT INTO `monitor_checktype_linking` VALUES (724, 12, 13, 18, 10, 0, 3, 0, 0, 181, 1);
INSERT INTO `monitor_checktype_linking` VALUES (725, 12, 13, 18, 10, 0, 3, 0, 0, 182, 1);
INSERT INTO `monitor_checktype_linking` VALUES (726, 12, 13, 18, 10, 0, 3, 0, 0, 183, 0);
INSERT INTO `monitor_checktype_linking` VALUES (727, 5, 14, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (728, 5, 14, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (729, 5, 14, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (730, 5, 14, 0, 1, 0, 2, 0, 0, 22, 1);
INSERT INTO `monitor_checktype_linking` VALUES (731, 5, 14, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (732, 5, 14, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (733, 5, 14, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (734, 5, 14, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (736, 5, 14, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (737, 5, 14, 0, 1, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (738, 5, 14, 0, 1, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (739, 5, 14, 0, 1, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (740, 5, 14, 0, 1, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (741, 5, 14, 0, 1, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (742, 5, 14, 0, 1, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (743, 5, 14, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (744, 5, 14, 0, 1, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (745, 5, 14, 0, 1, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (746, 5, 14, 0, 1, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (747, 5, 14, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (751, 5, 14, 19, 1, 171, 3, 0, 0, 184, 1);
INSERT INTO `monitor_checktype_linking` VALUES (750, 5, 14, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (752, 5, 14, 19, 1, 171, 3, 0, 0, 185, 1);
INSERT INTO `monitor_checktype_linking` VALUES (754, 0, 0, 0, 0, 104, 4, 0, 0, 186, 1);
INSERT INTO `monitor_checktype_linking` VALUES (755, 0, 0, 0, 0, 104, 4, 0, 0, 187, 1);
INSERT INTO `monitor_checktype_linking` VALUES (756, 0, 0, 0, 0, 103, 4, 0, 0, 186, 1);
INSERT INTO `monitor_checktype_linking` VALUES (757, 0, 0, 0, 0, 103, 4, 0, 0, 187, 1);
INSERT INTO `monitor_checktype_linking` VALUES (753, 13, 15, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (758, 13, 15, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (759, 13, 15, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (760, 13, 15, 0, 10, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (761, 13, 15, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (762, 13, 15, 0, 10, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (763, 13, 15, 0, 10, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (764, 13, 15, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (765, 13, 15, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (766, 13, 15, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (767, 13, 15, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (768, 13, 15, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (769, 13, 15, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (770, 13, 15, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (771, 13, 15, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (772, 13, 15, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (773, 13, 15, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (774, 13, 15, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (775, 13, 15, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (776, 13, 15, 0, 10, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (777, 13, 15, 0, 10, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (778, 13, 15, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (779, 13, 15, 0, 10, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (780, 5, 14, 19, 1, 171, 3, 0, 0, 188, 1);
INSERT INTO `monitor_checktype_linking` VALUES (781, 5, 14, 19, 1, 171, 3, 0, 0, 189, 1);
INSERT INTO `monitor_checktype_linking` VALUES (784, -1, 16, 1, 1, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (785, -1, 16, 1, 1, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (786, -1, 16, 11, 1, 0, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (787, -1, 16, 11, 1, 0, 3, 0, 0, 134, 1);
INSERT INTO `monitor_checktype_linking` VALUES (788, -1, 16, 1, 1, 0, 3, 0, 0, 144, 1);
INSERT INTO `monitor_checktype_linking` VALUES (789, -1, 16, 15, 1, 0, 3, 16, 0, 143, 1);
INSERT INTO `monitor_checktype_linking` VALUES (790, -1, 16, 15, 1, 0, 3, 16, 0, 142, 1);
INSERT INTO `monitor_checktype_linking` VALUES (791, -1, 16, 15, 1, 0, 3, 16, 0, 141, 1);
INSERT INTO `monitor_checktype_linking` VALUES (792, -1, 16, 15, 1, 0, 3, 16, 0, 140, 1);
INSERT INTO `monitor_checktype_linking` VALUES (793, -1, 16, 15, 1, 0, 3, 16, 0, 139, 1);
INSERT INTO `monitor_checktype_linking` VALUES (794, -1, 16, 15, 1, 0, 3, 16, 0, 138, 1);
INSERT INTO `monitor_checktype_linking` VALUES (795, -1, 16, 15, 1, 0, 3, 16, 0, 137, 1);
INSERT INTO `monitor_checktype_linking` VALUES (796, -1, 16, 3, 1, 0, 3, 0, 0, 4, 0);
INSERT INTO `monitor_checktype_linking` VALUES (797, -1, 16, 3, 1, 0, 3, 0, 0, 14, 0);
INSERT INTO `monitor_checktype_linking` VALUES (798, -1, 16, 3, 1, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (799, -1, 16, 3, 1, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (800, -1, 16, 3, 1, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (801, -1, 16, 3, 1, 0, 3, 0, 0, 19, 0);
INSERT INTO `monitor_checktype_linking` VALUES (802, -1, 16, 3, 1, 0, 3, 0, 0, 125, 1);
INSERT INTO `monitor_checktype_linking` VALUES (803, -1, 16, 0, 1, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (804, -1, 16, 0, 1, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (805, -1, 16, 0, 1, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (806, -1, 16, 0, 1, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (807, -1, 16, 0, 1, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (808, -1, 16, 0, 1, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (809, -1, 16, 0, 1, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (810, -1, 16, 0, 1, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (811, -1, 16, 0, 1, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (812, -1, 16, 0, 1, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (813, -1, 16, 0, 1, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (814, -1, 16, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (815, -1, 16, 0, 1, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (816, -1, 16, 0, 1, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (817, -1, 16, 0, 1, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (818, -1, 16, 0, 1, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (819, -1, 16, 0, 1, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (820, -1, 16, 0, 1, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (821, -1, 16, 0, 1, 0, 1, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (822, -1, 16, 0, 1, 0, 1, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (783, -1, 16, 1, 1, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (823, 9, 9, 0, 1, 0, 3, 16, 0, 190, 1);
INSERT INTO `monitor_checktype_linking` VALUES (824, -1, 1, 0, 10, 0, 2, 0, 0, 16, 0);
INSERT INTO `monitor_checktype_linking` VALUES (825, -1, 1, 0, 10, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (826, -1, 1, 0, 10, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (827, -1, 1, 0, 10, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (828, -1, 1, 0, 10, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (829, -1, 1, 0, 10, 0, 2, 0, 0, 20, 1);
INSERT INTO `monitor_checktype_linking` VALUES (830, -1, 1, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (831, -1, 1, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (832, -1, 1, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (833, -1, 1, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (834, -1, 1, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (835, -1, 1, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (836, -1, 1, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (837, -1, 1, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (838, -1, 1, 0, 10, 0, 1, 0, 0, 112, 0);
INSERT INTO `monitor_checktype_linking` VALUES (839, -1, 1, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (840, -1, 1, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (841, -1, 1, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (842, -1, 1, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (843, -1, 1, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (844, 13, 17, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (846, 13, 17, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (848, 13, 17, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (849, 13, 17, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (850, 13, 17, 0, 10, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (851, 13, 17, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (852, 13, 17, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (853, 13, 17, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (854, 13, 17, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (855, 13, 17, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (856, 13, 17, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (857, 13, 17, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (858, 13, 17, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (859, 13, 17, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (860, 13, 17, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (861, 13, 17, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (862, 13, 17, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (865, 13, 17, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (867, 13, 17, 20, 10, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (868, 13, 17, 20, 10, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (869, 13, 17, 20, 10, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (870, 13, 17, 21, 10, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (871, 13, 17, 21, 10, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (872, 13, 17, 21, 10, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (873, 14, 18, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (874, 14, 18, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (875, 14, 18, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (876, 14, 18, 0, 10, 0, 1, 0, 0, 63, 0);
INSERT INTO `monitor_checktype_linking` VALUES (877, 14, 18, 0, 10, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (878, 14, 18, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (879, 14, 18, 0, 10, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (880, 14, 18, 0, 10, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (881, 14, 18, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (882, 14, 18, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (883, 14, 18, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (884, 14, 18, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (885, 14, 18, 0, 10, 0, 1, 0, 0, 130, 0);
INSERT INTO `monitor_checktype_linking` VALUES (886, 14, 18, 0, 10, 0, 1, 0, 0, 131, 0);
INSERT INTO `monitor_checktype_linking` VALUES (887, 14, 18, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (888, 14, 18, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (889, 14, 18, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (890, 14, 18, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (891, 5, 14, 19, 1, 171, 3, 0, 0, 192, 1);
INSERT INTO `monitor_checktype_linking` VALUES (892, 5, 14, 19, 1, 171, 3, 0, 0, 193, 1);
INSERT INTO `monitor_checktype_linking` VALUES (893, 15, 19, 0, 12, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (894, 15, 19, 0, 12, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (895, 15, 19, 0, 12, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (896, 15, 19, 0, 12, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (897, 15, 19, 0, 12, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (898, 15, 19, 0, 12, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (899, 15, 19, 0, 12, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (900, 15, 19, 0, 12, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (901, 15, 19, 0, 12, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (902, 15, 19, 0, 12, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (903, 15, 19, 0, 12, 0, 1, 0, 0, 130, 0);
INSERT INTO `monitor_checktype_linking` VALUES (904, 15, 19, 0, 12, 0, 1, 0, 0, 131, 0);
INSERT INTO `monitor_checktype_linking` VALUES (905, 15, 19, 0, 12, 0, 1, 0, 0, 36, 1);
INSERT INTO `monitor_checktype_linking` VALUES (906, 15, 19, 0, 12, 0, 1, 0, 0, 39, 1);
INSERT INTO `monitor_checktype_linking` VALUES (907, 15, 19, 0, 12, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (908, 15, 19, 0, 12, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (909, 15, 19, 0, 10, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (910, 15, 19, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (911, 15, 19, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (912, 15, 19, 0, 10, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (913, 15, 19, 0, 10, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (914, 15, 19, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (915, 15, 19, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (916, 15, 19, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (917, 15, 19, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (918, 15, 19, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (919, 15, 19, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (920, 15, 19, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (921, 15, 19, 0, 10, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (922, 15, 19, 0, 10, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (923, 15, 19, 0, 10, 0, 1, 0, 0, 129, 0);
INSERT INTO `monitor_checktype_linking` VALUES (924, 15, 19, 0, 10, 0, 1, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (925, -1, 16, 3, 1, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (926, -1, 1, 3, 1, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (927, -1, 1, 15, 1, 0, 3, 16, 0, 195, 1);
INSERT INTO `monitor_checktype_linking` VALUES (928, 1, 20, 0, 10, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (929, 1, 20, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (930, 1, 20, 0, 10, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (931, 1, 20, 0, 10, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (933, 1, 20, 0, 10, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (934, 1, 20, 0, 10, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (935, 1, 20, 0, 10, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (936, 1, 20, 0, 10, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (937, 1, 20, 0, 10, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (938, 1, 20, 0, 10, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (939, 1, 20, 0, 10, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (940, 1, 20, 3, 10, 0, 3, 0, 0, 194, 0);
INSERT INTO `monitor_checktype_linking` VALUES (941, 1, 20, 3, 10, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (942, 1, 20, 3, 10, 0, 3, 0, 0, 76, 0);
INSERT INTO `monitor_checktype_linking` VALUES (943, 1, 20, 3, 10, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (945, 1, 20, 0, 10, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (946, 1, 20, 3, 10, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (947, 16, 21, 0, 13, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (948, 16, 21, 0, 13, 0, 1, 0, 0, 74, 0);
INSERT INTO `monitor_checktype_linking` VALUES (949, 16, 21, 0, 13, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (950, 16, 21, 0, 13, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (951, 16, 21, 0, 13, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (952, 16, 21, 0, 13, 0, 1, 0, 0, 73, 0);
INSERT INTO `monitor_checktype_linking` VALUES (953, 16, 21, 0, 13, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (954, 16, 21, 0, 13, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (955, 16, 21, 0, 13, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (956, 16, 21, 0, 13, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (957, 16, 21, 0, 13, 0, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (958, 16, 21, 0, 13, 0, 1, 0, 0, 133, 0);
INSERT INTO `monitor_checktype_linking` VALUES (959, 16, 21, 0, 13, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (960, 16, 21, 0, 13, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (961, 16, 21, 0, 13, 0, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (962, 16, 21, 0, 13, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (963, 16, 21, 0, 13, 0, 1, 0, 0, 132, 0);
INSERT INTO `monitor_checktype_linking` VALUES (964, 16, 21, 0, 13, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (965, 16, 21, 0, 13, 0, 1, 0, 0, 196, 1);
INSERT INTO `monitor_checktype_linking` VALUES (966, 16, 21, 0, 13, 0, 1, 0, 0, 197, 1);
INSERT INTO `monitor_checktype_linking` VALUES (967, 16, 21, 0, 13, 0, 1, 0, 0, 198, 1);
INSERT INTO `monitor_checktype_linking` VALUES (968, 16, 21, 0, 13, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (969, 16, 21, 0, 13, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (970, 16, 21, 0, 13, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (971, 16, 21, 0, 13, 0, 2, 0, 0, 12, 1);
INSERT INTO `monitor_checktype_linking` VALUES (972, 16, 21, 23, 13, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (973, 16, 21, 23, 13, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (974, 16, 21, 23, 13, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (975, 16, 21, 23, 13, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (976, 16, 21, 24, 13, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (977, 16, 21, 24, 13, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (978, 16, 21, 24, 13, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (979, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_linking` VALUES (980, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_linking` VALUES (981, 8, 8, 12, 14, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1058, 9, 22, 11, 1, 233, 3, 0, 0, 134, 1);
INSERT INTO `monitor_checktype_linking` VALUES (983, 8, 8, 0, 14, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (984, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_linking` VALUES (985, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_linking` VALUES (986, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_checktype_linking` VALUES (987, 8, 8, 0, 14, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (988, 8, 8, 0, 14, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (989, 8, 8, 0, 14, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (990, 8, 8, 0, 14, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (991, 8, 8, 0, 14, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (992, 8, 8, 0, 14, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (993, 8, 8, 0, 14, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (994, 8, 8, 0, 14, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (995, 8, 8, 0, 14, 0, 1, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (996, 8, 8, 0, 14, 0, 1, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (997, 8, 8, 0, 14, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (998, 13, 15, 25, 10, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (999, 13, 15, 25, 10, 0, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1000, 13, 15, 25, 10, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1001, 13, 15, 26, 10, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1002, 13, 15, 26, 10, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1003, 13, 15, 26, 10, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1004, 1, 16, 27, 1, 223, 3, 0, 0, 199, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1005, 1, 16, 27, 1, 223, 3, 0, 0, 200, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1006, 1, 16, 27, 1, 223, 3, 0, 0, 201, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1007, 1, 16, 27, 1, 223, 3, 0, 0, 202, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1008, 1, 16, 27, 1, 223, 3, 0, 0, 203, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1009, 1, 16, 27, 1, 223, 3, 0, 0, 204, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1010, 1, 16, 27, 1, 223, 3, 0, 0, 205, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1011, 1, 16, 27, 1, 223, 3, 0, 0, 206, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1012, 1, 16, 27, 1, 223, 3, 0, 0, 207, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1013, 1, 16, 27, 1, 223, 3, 0, 0, 208, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1014, 5, 16, 27, 1, 224, 3, 0, 0, 199, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1015, 5, 16, 27, 1, 224, 3, 0, 0, 200, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1016, 5, 16, 27, 1, 224, 3, 0, 0, 201, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1017, 5, 16, 27, 1, 224, 3, 0, 0, 202, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1018, 5, 16, 27, 1, 224, 3, 0, 0, 203, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1019, 5, 16, 27, 1, 224, 3, 0, 0, 204, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1020, 5, 16, 27, 1, 224, 3, 0, 0, 205, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1021, 5, 16, 27, 1, 224, 3, 0, 0, 206, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1022, 5, 16, 27, 1, 224, 3, 0, 0, 207, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1023, 5, 16, 27, 1, 224, 3, 0, 0, 208, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1025, -1, 16, 15, 1, 0, 3, 16, 0, 195, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1026, 1, 16, 0, 1, 0, 1, 0, 0, 209, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1027, 12, 13, 18, 10, 0, 3, 0, 0, 210, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1030, 1, 16, 30, 1, 0, 3, 0, 0, 213, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1031, 5, 16, 30, 1, 0, 3, 0, 0, 213, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1032, 9, 22, 0, 1, 0, 3, 0, 0, 136, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1033, 9, 22, 1, 1, 231, 3, 0, 0, 144, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1034, 9, 22, 0, 1, 0, 3, 16, 0, 190, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1035, 9, 22, 0, 1, 0, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1036, 9, 22, 0, 1, 0, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1037, 9, 22, 0, 1, 0, 5, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1038, 9, 22, 0, 1, 0, 5, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1039, 9, 22, 0, 1, 0, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1040, 9, 22, 0, 1, 0, 5, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1041, 9, 22, 0, 1, 0, 5, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1042, 9, 22, 0, 1, 0, 5, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1043, 9, 22, 0, 1, 0, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1101, 20, 8, 0, 14, 251, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1100, 20, 8, 0, 14, 251, 5, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1099, 20, 8, 12, 14, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1047, 9, 22, 3, 1, 232, 3, 0, 0, 125, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1048, 9, 22, 3, 1, 232, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1049, 9, 22, 3, 1, 232, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1050, 9, 22, 3, 1, 232, 3, 0, 0, 26, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1051, 9, 22, 11, 1, 233, 3, 0, 0, 29, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1052, 8, 8, 0, 14, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1053, 8, 8, 0, 14, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1054, 8, 8, 0, 14, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1055, 8, 8, 0, 14, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1056, 8, 8, 0, 14, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1057, 8, 8, 0, 14, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1059, 12, 13, 18, 10, 0, 3, 0, 0, 214, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1060, -1, 16, 0, 1, 0, 1, 0, 0, 215, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1061, 8, 8, 31, 14, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1062, 8, 8, 31, 14, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1063, 8, 8, 31, 14, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1064, 8, 8, 0, 14, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1065, 17, 8, 0, 14, 237, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1066, 17, 8, 0, 14, 237, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1067, 17, 8, 0, 14, 237, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1068, 17, 8, 0, 14, 237, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1069, 17, 8, 0, 14, 237, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1070, 17, 8, 0, 14, 237, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1071, 17, 8, 0, 14, 237, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1072, 17, 8, 0, 14, 237, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1073, 17, 8, 33, 14, 0, 3, 0, 0, 216, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1074, 17, 8, 33, 14, 0, 3, 0, 0, 217, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1075, 17, 8, 32, 14, 0, 3, 0, 0, 216, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1076, 17, 8, 32, 14, 0, 3, 0, 0, 217, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1077, 18, 8, 0, 14, 242, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1078, 18, 8, 0, 14, 242, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1079, 18, 8, 0, 14, 242, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1080, 18, 8, 0, 14, 242, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1081, 18, 8, 0, 14, 242, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1082, 18, 8, 0, 14, 242, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1083, 18, 8, 0, 14, 242, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1084, 18, 8, 0, 14, 242, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1085, 18, 8, 33, 14, 0, 3, 0, 0, 216, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1086, 18, 8, 33, 14, 0, 3, 0, 0, 217, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1087, 18, 8, 32, 14, 0, 3, 0, 0, 216, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1088, 18, 8, 32, 14, 0, 3, 0, 0, 217, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1089, 1, 20, 0, 10, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1090, 19, 21, 23, 10, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1091, 19, 21, 23, 10, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1092, 19, 21, 0, 10, 0, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1093, 19, 21, 0, 10, 0, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1094, 19, 21, 0, 10, 0, 5, 0, 0, 130, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1095, 19, 21, 0, 10, 0, 5, 0, 0, 131, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1096, 19, 21, 0, 10, 0, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1097, 19, 21, 0, 10, 0, 5, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1098, 19, 21, 0, 10, 0, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1102, 20, 8, 0, 14, 251, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1103, 20, 8, 0, 14, 251, 5, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1104, 20, 8, 0, 14, 251, 5, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1105, 20, 8, 0, 14, 251, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1106, 20, 8, 0, 14, 251, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1107, 21, 23, 0, 14, 255, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1108, 21, 23, 0, 14, 255, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1109, 21, 23, 0, 14, 255, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1110, 21, 23, 0, 14, 255, 1, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1111, 21, 23, 0, 14, 255, 1, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1112, 21, 23, 0, 14, 255, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1113, 21, 23, 0, 14, 255, 1, 0, 0, 39, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1114, 21, 23, 0, 14, 255, 1, 0, 0, 36, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1115, 21, 23, 0, 14, 255, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1116, 21, 23, 0, 14, 255, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1117, 21, 23, 0, 14, 255, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1118, 21, 23, 0, 14, 255, 1, 0, 0, 209, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1119, 21, 23, 0, 14, 255, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1120, 21, 23, 0, 14, 255, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1121, 21, 23, 34, 14, 0, 3, 0, 0, 194, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1122, 21, 23, 34, 14, 0, 3, 0, 0, 46, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1123, 8, 8, 12, 14, 0, 3, 0, 0, 218, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1124, 8, 8, 12, 15, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1125, 8, 8, 0, 15, 0, 1, 0, 0, 5, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1126, 8, 8, 0, 15, 0, 1, 0, 0, 75, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1127, 8, 8, 0, 15, 0, 1, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1128, 8, 8, 0, 15, 0, 1, 0, 0, 83, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1129, 8, 8, 0, 15, 0, 1, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1130, 8, 8, 0, 15, 0, 1, 0, 0, 84, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1131, 8, 8, 0, 15, 0, 1, 0, 0, 7, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1132, 8, 8, 0, 15, 0, 1, 0, 0, 81, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1133, 8, 8, 0, 15, 0, 1, 0, 0, 82, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1134, 8, 8, 0, 15, 0, 1, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1135, 8, 8, 0, 15, 0, 1, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1136, 8, 8, 0, 15, 0, 1, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1137, 8, 8, 0, 15, 0, 1, 0, 0, 28, 0);
INSERT INTO `monitor_checktype_linking` VALUES (1138, 8, 8, 0, 15, 0, 1, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1139, 8, 8, 0, 15, 0, 2, 0, 0, 6, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1140, 8, 8, 0, 15, 0, 2, 0, 0, 11, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1141, 8, 8, 0, 15, 0, 2, 0, 0, 10, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1142, 8, 8, 0, 15, 0, 2, 0, 0, 8, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1143, 8, 8, 31, 15, 0, 3, 0, 0, 40, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1144, 8, 8, 31, 15, 0, 3, 0, 0, 41, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1145, 8, 8, 31, 15, 0, 3, 0, 0, 42, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1146, 8, 8, 0, 15, 0, 1, 0, 0, 112, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1147, 20, 8, 12, 15, 0, 3, 0, 0, 17, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1148, 20, 8, 0, 15, 258, 5, 0, 0, 28, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1149, 20, 8, 0, 15, 258, 5, 0, 0, 63, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1150, 20, 8, 0, 15, 258, 5, 0, 0, 129, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1151, 20, 8, 0, 15, 258, 5, 0, 0, 130, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1152, 20, 8, 0, 15, 258, 5, 0, 0, 131, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1153, 20, 8, 0, 15, 258, 5, 0, 0, 132, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1154, 20, 8, 0, 15, 258, 5, 0, 0, 133, 1);
INSERT INTO `monitor_checktype_linking` VALUES (1155, 8, 8, 12, 15, 0, 3, 0, 0, 218, 1);

-- ----------------------------
-- Table structure for monitor_mib_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_mib_linking`;
CREATE TABLE `monitor_mib_linking`  (
  `monitor_mib_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `mib_id` int(11) NULL DEFAULT NULL,
  `parameters` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `function` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `rawOid` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`monitor_mib_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_mib_linking
-- ----------------------------
INSERT INTO `monitor_mib_linking` VALUES (1, 1, NULL, 'Plain', NULL);
INSERT INTO `monitor_mib_linking` VALUES (2, 2, NULL, 'InterfaceStatus', NULL);
INSERT INTO `monitor_mib_linking` VALUES (3, 2, 'ifInOctets###kbit', 'InterfaceDiff', NULL);
INSERT INTO `monitor_mib_linking` VALUES (4, 2, 'ifOutOctets###kbit', 'InterfaceDiff', NULL);
INSERT INTO `monitor_mib_linking` VALUES (5, 2, NULL, 'InterfaceErrors', NULL);
INSERT INTO `monitor_mib_linking` VALUES (6, 4, NULL, 'Uptime', 1);
INSERT INTO `monitor_mib_linking` VALUES (7, 5, 'ESTABLISHED', 'PlainComplex', NULL);
INSERT INTO `monitor_mib_linking` VALUES (8, 6, NULL, 'Plain', NULL);
INSERT INTO `monitor_mib_linking` VALUES (9, 7, NULL, 'Plain', NULL);
INSERT INTO `monitor_mib_linking` VALUES (10, 8, NULL, 'Plain', NULL);
INSERT INTO `monitor_mib_linking` VALUES (11, 9, '0', 'EqualTo', NULL);
INSERT INTO `monitor_mib_linking` VALUES (12, 10, NULL, 'DroppedPackets', 1);
INSERT INTO `monitor_mib_linking` VALUES (13, 11, NULL, 'CheckpointDisk', 1);
INSERT INTO `monitor_mib_linking` VALUES (14, 12, NULL, 'PolicyInstall', 1);
INSERT INTO `monitor_mib_linking` VALUES (15, 13, '1', 'EqualTo', 1);
INSERT INTO `monitor_mib_linking` VALUES (16, 14, 'default=0|active=2|standby=1', 'Switch', 1);
INSERT INTO `monitor_mib_linking` VALUES (17, 15, NULL, 'HashMemory', 1);
INSERT INTO `monitor_mib_linking` VALUES (18, 16, NULL, 'Swap', 1);
INSERT INTO `monitor_mib_linking` VALUES (19, 17, NULL, 'FirewallMemory', 1);
INSERT INTO `monitor_mib_linking` VALUES (20, 18, NULL, 'Plain', 1);
INSERT INTO `monitor_mib_linking` VALUES (21, 19, NULL, 'CheckpointCPU', 1);
INSERT INTO `monitor_mib_linking` VALUES (24, 22, NULL, NULL, 1);
INSERT INTO `monitor_mib_linking` VALUES (22, 20, '', 'NotEqualTo', NULL);
INSERT INTO `monitor_mib_linking` VALUES (23, 21, 'fwm|sshd|cpd|vpnd|fwd', 'RunningProcesses', NULL);
INSERT INTO `monitor_mib_linking` VALUES (25, 23, NULL, 'CheckpointVPNUsers', 1);
INSERT INTO `monitor_mib_linking` VALUES (26, 22, NULL, 'CheckpointIPSEC', 1);
INSERT INTO `monitor_mib_linking` VALUES (27, 24, NULL, 'CheckpointVPNSites', 1);
INSERT INTO `monitor_mib_linking` VALUES (29, 26, NULL, 'Uptime', 1);
INSERT INTO `monitor_mib_linking` VALUES (30, 16, NULL, 'hrStorageDisk', 0);
INSERT INTO `monitor_mib_linking` VALUES (31, 16, NULL, 'hrStorageRam', 0);
INSERT INTO `monitor_mib_linking` VALUES (32, 16, NULL, 'hrStorageSwap', 0);
INSERT INTO `monitor_mib_linking` VALUES (33, 7, NULL, 'Plain', 0);
INSERT INTO `monitor_mib_linking` VALUES (35, 21, NULL, 'hrSwRun', 0);
INSERT INTO `monitor_mib_linking` VALUES (36, 27, 'closed|listen|synSent|synReceived|established|finWait1|finWait2|closeWait|lastAck|closing|timeWait|deleteTCB', 'tcpNetstat', 0);
INSERT INTO `monitor_mib_linking` VALUES (37, 28, NULL, 'hrProcessorLoadPerCore', 0);
INSERT INTO `monitor_mib_linking` VALUES (38, 28, NULL, 'hrProcessorLoad', 0);

-- ----------------------------
-- Table structure for monitor_operatingSystem
-- ----------------------------
DROP TABLE IF EXISTS `monitor_operatingSystem`;
CREATE TABLE `monitor_operatingSystem`  (
  `monitor_operatingSystem_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`monitor_operatingSystem_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 24 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_operatingSystem
-- ----------------------------
INSERT INTO `monitor_operatingSystem` VALUES (1, 'Check Point SecurePlatform (SPLAT)');
INSERT INTO `monitor_operatingSystem` VALUES (2, 'Check Point Sofaware Firmware');
INSERT INTO `monitor_operatingSystem` VALUES (3, 'Cisco Security Appliance Firmware');
INSERT INTO `monitor_operatingSystem` VALUES (4, 'Linux');
INSERT INTO `monitor_operatingSystem` VALUES (5, 'Microsoft Windows');
INSERT INTO `monitor_operatingSystem` VALUES (6, 'Nokia IPSO');
INSERT INTO `monitor_operatingSystem` VALUES (7, 'Sun Solaris');
INSERT INTO `monitor_operatingSystem` VALUES (8, 'Fortinet FortiOS');
INSERT INTO `monitor_operatingSystem` VALUES (9, 'SPLAT VSX');
INSERT INTO `monitor_operatingSystem` VALUES (10, 'Check Point SecurePlatform (SPLAT VSX)');
INSERT INTO `monitor_operatingSystem` VALUES (11, 'Not applicable');
INSERT INTO `monitor_operatingSystem` VALUES (12, 'Check Point Edge');
INSERT INTO `monitor_operatingSystem` VALUES (13, 'Blue Coat SGOS');
INSERT INTO `monitor_operatingSystem` VALUES (14, 'MSS OS');
INSERT INTO `monitor_operatingSystem` VALUES (15, 'Junos');
INSERT INTO `monitor_operatingSystem` VALUES (16, 'Check Point GAiA');
INSERT INTO `monitor_operatingSystem` VALUES (17, 'ScreenOS');
INSERT INTO `monitor_operatingSystem` VALUES (18, 'HP Switch');
INSERT INTO `monitor_operatingSystem` VALUES (19, 'Internetwork Operating System');
INSERT INTO `monitor_operatingSystem` VALUES (20, 'Check Point embedded GAiA');
INSERT INTO `monitor_operatingSystem` VALUES (21, 'PAN-OS');
INSERT INTO `monitor_operatingSystem` VALUES (22, 'GAiA VSX');
INSERT INTO `monitor_operatingSystem` VALUES (23, 'Cisco Fire Linux OS');

-- ----------------------------
-- Table structure for monitor_platform
-- ----------------------------
DROP TABLE IF EXISTS `monitor_platform`;
CREATE TABLE `monitor_platform`  (
  `monitor_platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`monitor_platform_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_platform
-- ----------------------------
INSERT INTO `monitor_platform` VALUES (1, 'Check Point Appliance');
INSERT INTO `monitor_platform` VALUES (2, 'Check Point Sofaware Appliance');
INSERT INTO `monitor_platform` VALUES (3, 'Check Point Sofaware Appliance (ADSL)');
INSERT INTO `monitor_platform` VALUES (4, 'Cisco Security Appliance');
INSERT INTO `monitor_platform` VALUES (5, 'Open Server');
INSERT INTO `monitor_platform` VALUES (6, 'Nokia IP Appliance');
INSERT INTO `monitor_platform` VALUES (7, 'Sun SPARC');
INSERT INTO `monitor_platform` VALUES (8, 'Fortinet FortiGate Firewall Platform');
INSERT INTO `monitor_platform` VALUES (9, 'Check Point Virtual System');
INSERT INTO `monitor_platform` VALUES (10, 'Check Point Virtual Switch');
INSERT INTO `monitor_platform` VALUES (11, 'Generic SNMP Host');
INSERT INTO `monitor_platform` VALUES (12, 'Blue Coat ProxySG');
INSERT INTO `monitor_platform` VALUES (13, 'Juniper');
INSERT INTO `monitor_platform` VALUES (14, 'Hewlett-Packard Switch');
INSERT INTO `monitor_platform` VALUES (15, 'Cisco Router');
INSERT INTO `monitor_platform` VALUES (16, 'Palo Alto Security Appliance');
INSERT INTO `monitor_platform` VALUES (17, 'Virtual Machine');
INSERT INTO `monitor_platform` VALUES (18, 'Fortinet Management and Analytics Platform');
INSERT INTO `monitor_platform` VALUES (19, 'Palo Alto Virtual System');
INSERT INTO `monitor_platform` VALUES (20, 'Fortinet FortiGate Virtual Domain (VDOM)');
INSERT INTO `monitor_platform` VALUES (21, 'Cisco FirePOWER Appliance');

-- ----------------------------
-- Table structure for monitor_setting
-- ----------------------------
DROP TABLE IF EXISTS `monitor_setting`;
CREATE TABLE `monitor_setting`  (
  `monitor_setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_structure_id` int(11) NULL DEFAULT 0,
  `monitor_setting_type_id` int(11) NULL DEFAULT 0,
  `monitor_setting_value` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`monitor_setting_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_setting
-- ----------------------------
INSERT INTO `monitor_setting` VALUES (1, 11, 11, 0, 7, 0, 1, '1');

-- ----------------------------
-- Table structure for monitor_stats_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_stats_linking`;
CREATE TABLE `monitor_stats_linking`  (
  `monitor_stats_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_stats_toggle` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`monitor_stats_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of monitor_stats_linking
-- ----------------------------
INSERT INTO `monitor_stats_linking` VALUES (1, -1, -1, -1, 1);

-- ----------------------------
-- Table structure for monitor_structure
-- ----------------------------
DROP TABLE IF EXISTS `monitor_structure`;
CREATE TABLE `monitor_structure`  (
  `monitor_structure_id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NULL DEFAULT 0,
  `type_id` int(11) NULL DEFAULT 0,
  `ref_id` int(11) NULL DEFAULT 0,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`monitor_structure_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 262 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of monitor_structure
-- ----------------------------
INSERT INTO `monitor_structure` VALUES (1, 0, 0, 1, 1, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (2, 0, 0, 2, 2, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (3, 0, 0, 3, 3, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (4, 0, 0, 4, 4, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (5, 0, 0, 5, 5, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (6, 0, 0, 6, 6, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (7, 0, 0, 7, 7, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (8, 1, 1, 1, 1, 1, 0, 0);
INSERT INTO `monitor_structure` VALUES (9, 2, 1, 2, 2, 2, 0, 0);
INSERT INTO `monitor_structure` VALUES (10, 3, 1, 2, 3, 2, 0, 0);
INSERT INTO `monitor_structure` VALUES (11, 4, 1, 3, 4, 3, 0, 0);
INSERT INTO `monitor_structure` VALUES (12, 5, 1, 1, 5, 1, 0, 0);
INSERT INTO `monitor_structure` VALUES (13, 5, 1, 4, 5, 4, 0, 0);
INSERT INTO `monitor_structure` VALUES (14, 5, 1, 5, 5, 5, 0, 0);
INSERT INTO `monitor_structure` VALUES (15, 6, 1, 6, 6, 6, 0, 0);
INSERT INTO `monitor_structure` VALUES (16, 7, 1, 7, 7, 7, 0, 0);
INSERT INTO `monitor_structure` VALUES (17, 43, 2, 1, 1, 1, 1, 1);
INSERT INTO `monitor_structure` VALUES (18, 43, 2, 2, 1, 1, 2, 1);
INSERT INTO `monitor_structure` VALUES (19, 43, 2, 3, 1, 1, 3, 1);
INSERT INTO `monitor_structure` VALUES (20, 43, 2, 4, 1, 1, 4, 1);
INSERT INTO `monitor_structure` VALUES (21, 65, 2, 1, 5, 4, 1, 1);
INSERT INTO `monitor_structure` VALUES (22, 65, 2, 2, 5, 4, 2, 1);
INSERT INTO `monitor_structure` VALUES (23, 65, 2, 3, 5, 4, 3, 1);
INSERT INTO `monitor_structure` VALUES (24, 65, 2, 8, 5, 4, 8, 1);
INSERT INTO `monitor_structure` VALUES (147, 146, 2, 3, 1, 1, 3, 7);
INSERT INTO `monitor_structure` VALUES (27, 50, 2, 5, 2, 2, 5, 3);
INSERT INTO `monitor_structure` VALUES (28, 83, 2, 1, 5, 1, 1, 1);
INSERT INTO `monitor_structure` VALUES (29, 83, 2, 2, 5, 1, 2, 1);
INSERT INTO `monitor_structure` VALUES (30, 83, 2, 3, 5, 1, 3, 1);
INSERT INTO `monitor_structure` VALUES (31, 83, 2, 4, 5, 1, 4, 1);
INSERT INTO `monitor_structure` VALUES (32, 70, 2, 3, 5, 5, 3, 1);
INSERT INTO `monitor_structure` VALUES (33, 70, 2, 9, 5, 5, 9, 1);
INSERT INTO `monitor_structure` VALUES (34, 70, 2, 10, 5, 5, 10, 1);
INSERT INTO `monitor_structure` VALUES (35, 74, 2, 2, 6, 6, 2, 1);
INSERT INTO `monitor_structure` VALUES (36, 74, 2, 3, 6, 6, 3, 1);
INSERT INTO `monitor_structure` VALUES (37, 74, 2, 7, 6, 6, 7, 1);
INSERT INTO `monitor_structure` VALUES (38, 78, 2, 1, 7, 7, 1, 1);
INSERT INTO `monitor_structure` VALUES (39, 78, 2, 2, 7, 7, 2, 1);
INSERT INTO `monitor_structure` VALUES (40, 78, 2, 3, 7, 7, 3, 1);
INSERT INTO `monitor_structure` VALUES (41, 78, 2, 8, 7, 7, 8, 1);
INSERT INTO `monitor_structure` VALUES (42, 0, 3, 4, 0, 0, 0, 4);
INSERT INTO `monitor_structure` VALUES (43, 8, 3, 1, 1, 1, 0, 1);
INSERT INTO `monitor_structure` VALUES (140, 10, 3, 7, 3, 2, 0, 7);
INSERT INTO `monitor_structure` VALUES (56, 11, 3, 2, 4, 3, 0, 2);
INSERT INTO `monitor_structure` VALUES (164, 0, 0, 12, 12, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (84, 78, 2, 10, 7, 7, 10, 1);
INSERT INTO `monitor_structure` VALUES (65, 13, 3, 1, 5, 4, 0, 1);
INSERT INTO `monitor_structure` VALUES (70, 14, 3, 1, 5, 5, 0, 1);
INSERT INTO `monitor_structure` VALUES (74, 15, 3, 1, 6, 6, 0, 1);
INSERT INTO `monitor_structure` VALUES (92, 91, 2, 3, 5, 1, 3, 2);
INSERT INTO `monitor_structure` VALUES (78, 16, 3, 1, 7, 7, 0, 1);
INSERT INTO `monitor_structure` VALUES (90, 89, 2, 3, 1, 1, 3, 2);
INSERT INTO `monitor_structure` VALUES (146, 8, 3, 7, 1, 1, 0, 7);
INSERT INTO `monitor_structure` VALUES (88, 58, 2, 6, 4, 3, 6, 3);
INSERT INTO `monitor_structure` VALUES (87, 54, 2, 5, 3, 2, 5, 3);
INSERT INTO `monitor_structure` VALUES (83, 12, 3, 1, 5, 1, 0, 1);
INSERT INTO `monitor_structure` VALUES (139, 9, 3, 7, 2, 2, 0, 7);
INSERT INTO `monitor_structure` VALUES (93, 43, 2, 11, 1, 1, 11, 1);
INSERT INTO `monitor_structure` VALUES (94, 65, 2, 11, 5, 4, 11, 1);
INSERT INTO `monitor_structure` VALUES (95, 83, 2, 11, 5, 1, 11, 1);
INSERT INTO `monitor_structure` VALUES (96, 70, 2, 11, 5, 5, 11, 1);
INSERT INTO `monitor_structure` VALUES (97, 74, 2, 11, 6, 6, 11, 1);
INSERT INTO `monitor_structure` VALUES (98, 78, 2, 11, 7, 7, 11, 1);
INSERT INTO `monitor_structure` VALUES (99, 0, 0, 8, 8, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (100, 99, 1, 8, 8, 8, 0, 0);
INSERT INTO `monitor_structure` VALUES (101, 100, 3, 2, 8, 8, 0, 2);
INSERT INTO `monitor_structure` VALUES (102, 101, 2, 12, 8, 8, 12, 2);
INSERT INTO `monitor_structure` VALUES (103, 0, 3, 5, 0, 0, 0, 5);
INSERT INTO `monitor_structure` VALUES (104, 0, 3, 6, 0, 0, 0, 6);
INSERT INTO `monitor_structure` VALUES (105, 65, 2, 13, 5, 4, 13, 1);
INSERT INTO `monitor_structure` VALUES (106, 43, 2, 14, 1, 1, 14, 1);
INSERT INTO `monitor_structure` VALUES (107, 83, 2, 14, 5, 1, 14, 1);
INSERT INTO `monitor_structure` VALUES (108, 0, 0, 9, 9, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (109, 108, 1, 9, 9, 9, 0, 0);
INSERT INTO `monitor_structure` VALUES (110, 109, 3, 1, 9, 9, 0, 1);
INSERT INTO `monitor_structure` VALUES (111, 110, 2, 3, 9, 9, 3, 1);
INSERT INTO `monitor_structure` VALUES (112, 110, 2, 1, 9, 9, 1, 1);
INSERT INTO `monitor_structure` VALUES (113, 110, 2, 11, 9, 9, 11, 1);
INSERT INTO `monitor_structure` VALUES (114, 0, 0, 10, 10, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (115, 114, 1, 9, 10, 9, 0, 0);
INSERT INTO `monitor_structure` VALUES (116, 115, 3, 1, 10, 9, 0, 1);
INSERT INTO `monitor_structure` VALUES (118, 83, 2, 15, 5, 1, 15, 1);
INSERT INTO `monitor_structure` VALUES (129, 43, 2, 15, 1, 1, 15, 1);
INSERT INTO `monitor_structure` VALUES (136, 0, 0, 11, 11, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (137, 136, 1, 11, 11, 11, 0, 0);
INSERT INTO `monitor_structure` VALUES (138, 137, 3, 7, 11, 11, 0, 7);
INSERT INTO `monitor_structure` VALUES (141, 12, 3, 7, 5, 1, 0, 7);
INSERT INTO `monitor_structure` VALUES (142, 141, 2, 3, 5, 1, 3, 7);
INSERT INTO `monitor_structure` VALUES (143, 141, 2, 11, 5, 1, 11, 7);
INSERT INTO `monitor_structure` VALUES (144, 141, 2, 4, 5, 1, 4, 7);
INSERT INTO `monitor_structure` VALUES (145, 141, 2, 14, 5, 1, 14, 7);
INSERT INTO `monitor_structure` VALUES (148, 146, 2, 11, 1, 1, 11, 7);
INSERT INTO `monitor_structure` VALUES (149, 146, 2, 4, 1, 1, 4, 7);
INSERT INTO `monitor_structure` VALUES (150, 146, 2, 14, 1, 1, 14, 7);
INSERT INTO `monitor_structure` VALUES (151, 0, 3, 8, 0, 0, 0, 8);
INSERT INTO `monitor_structure` VALUES (152, 14, 3, 7, 5, 5, 0, 7);
INSERT INTO `monitor_structure` VALUES (154, 9, 3, 10, 2, 2, 0, 10);
INSERT INTO `monitor_structure` VALUES (155, 154, 2, 5, 3, 2, 5, 10);
INSERT INTO `monitor_structure` VALUES (156, 10, 3, 10, 3, 2, 0, 10);
INSERT INTO `monitor_structure` VALUES (157, 156, 2, 5, 2, 2, 5, 10);
INSERT INTO `monitor_structure` VALUES (160, 78, 2, 14, 7, 7, 14, 1);
INSERT INTO `monitor_structure` VALUES (161, 11, 3, 10, 4, 3, 0, 10);
INSERT INTO `monitor_structure` VALUES (162, 161, 2, 6, 4, 3, 6, 10);
INSERT INTO `monitor_structure` VALUES (163, 161, 2, 17, 4, 3, 17, 10);
INSERT INTO `monitor_structure` VALUES (165, 164, 1, 13, 12, 13, 0, 0);
INSERT INTO `monitor_structure` VALUES (166, 165, 3, 10, 12, 13, 0, 10);
INSERT INTO `monitor_structure` VALUES (167, 166, 2, 18, 12, 13, 18, 10);
INSERT INTO `monitor_structure` VALUES (168, 5, 1, 14, 5, 14, 0, 0);
INSERT INTO `monitor_structure` VALUES (169, 168, 3, 1, 5, 14, 0, 1);
INSERT INTO `monitor_structure` VALUES (170, 0, 0, 0, 0, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (171, 169, 2, 19, 5, 14, 19, 1);
INSERT INTO `monitor_structure` VALUES (172, 9, 3, 11, 2, 2, 0, 11);
INSERT INTO `monitor_structure` VALUES (173, 10, 3, 11, 3, 2, 0, 11);
INSERT INTO `monitor_structure` VALUES (174, 0, 0, 13, 13, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (175, 174, 1, 15, 13, 15, 0, 0);
INSERT INTO `monitor_structure` VALUES (176, 175, 3, 10, 13, 15, 0, 10);
INSERT INTO `monitor_structure` VALUES (177, 1, 1, 16, 1, 16, 0, 0);
INSERT INTO `monitor_structure` VALUES (178, 177, 3, 1, 1, 16, 0, 1);
INSERT INTO `monitor_structure` VALUES (179, 178, 2, 1, 1, 16, 1, 1);
INSERT INTO `monitor_structure` VALUES (180, 178, 2, 2, 1, 16, 2, 1);
INSERT INTO `monitor_structure` VALUES (181, 178, 2, 3, 1, 16, 3, 1);
INSERT INTO `monitor_structure` VALUES (182, 178, 2, 4, 1, 16, 4, 1);
INSERT INTO `monitor_structure` VALUES (183, 178, 2, 11, 1, 16, 11, 1);
INSERT INTO `monitor_structure` VALUES (184, 178, 2, 14, 1, 16, 14, 1);
INSERT INTO `monitor_structure` VALUES (185, 178, 2, 15, 1, 16, 15, 1);
INSERT INTO `monitor_structure` VALUES (186, 5, 1, 16, 5, 16, 0, 0);
INSERT INTO `monitor_structure` VALUES (187, 186, 3, 1, 5, 16, 0, 1);
INSERT INTO `monitor_structure` VALUES (188, 187, 2, 1, 5, 16, 1, 1);
INSERT INTO `monitor_structure` VALUES (189, 187, 2, 2, 5, 16, 2, 1);
INSERT INTO `monitor_structure` VALUES (190, 187, 2, 3, 5, 16, 3, 1);
INSERT INTO `monitor_structure` VALUES (191, 187, 2, 4, 5, 16, 4, 1);
INSERT INTO `monitor_structure` VALUES (192, 187, 2, 11, 5, 16, 11, 1);
INSERT INTO `monitor_structure` VALUES (193, 187, 2, 14, 5, 16, 14, 1);
INSERT INTO `monitor_structure` VALUES (194, 187, 2, 15, 5, 16, 15, 1);
INSERT INTO `monitor_structure` VALUES (195, 12, 3, 10, 5, 1, 0, 10);
INSERT INTO `monitor_structure` VALUES (196, 8, 3, 10, 1, 1, 0, 10);
INSERT INTO `monitor_structure` VALUES (197, 174, 1, 17, 13, 17, 0, 0);
INSERT INTO `monitor_structure` VALUES (198, 197, 3, 10, 13, 17, 0, 10);
INSERT INTO `monitor_structure` VALUES (199, 198, 2, 20, 13, 17, 20, 10);
INSERT INTO `monitor_structure` VALUES (200, 198, 2, 21, 13, 17, 21, 10);
INSERT INTO `monitor_structure` VALUES (201, 0, 0, 14, 14, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (202, 201, 1, 18, 14, 18, 0, 0);
INSERT INTO `monitor_structure` VALUES (203, 202, 3, 10, 14, 18, 0, 10);
INSERT INTO `monitor_structure` VALUES (204, 0, 0, 15, 15, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (205, 204, 1, 19, 15, 19, 0, 0);
INSERT INTO `monitor_structure` VALUES (206, 205, 3, 12, 15, 19, 0, 12);
INSERT INTO `monitor_structure` VALUES (207, 205, 3, 10, 15, 19, 0, 10);
INSERT INTO `monitor_structure` VALUES (208, 1, 1, 20, 1, 20, 0, 0);
INSERT INTO `monitor_structure` VALUES (209, 208, 3, 10, 1, 20, 0, 10);
INSERT INTO `monitor_structure` VALUES (210, 0, 0, 16, 16, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (211, 210, 1, 21, 16, 21, 0, 0);
INSERT INTO `monitor_structure` VALUES (212, 211, 3, 13, 16, 21, 0, 13);
INSERT INTO `monitor_structure` VALUES (213, 212, 2, 23, 16, 21, 23, 13);
INSERT INTO `monitor_structure` VALUES (214, 212, 2, 24, 16, 21, 24, 13);
INSERT INTO `monitor_structure` VALUES (215, 209, 2, 3, 1, 20, 3, 10);
INSERT INTO `monitor_structure` VALUES (217, 100, 3, 14, 8, 8, 0, 14);
INSERT INTO `monitor_structure` VALUES (218, 217, 2, 12, 8, 8, 12, 14);
INSERT INTO `monitor_structure` VALUES (220, 176, 2, 25, 13, 15, 25, 10);
INSERT INTO `monitor_structure` VALUES (221, 176, 2, 26, 13, 15, 26, 10);
INSERT INTO `monitor_structure` VALUES (223, 178, 2, 27, 1, 16, 27, 1);
INSERT INTO `monitor_structure` VALUES (224, 187, 2, 27, 5, 16, 27, 1);
INSERT INTO `monitor_structure` VALUES (227, 178, 2, 30, 1, 16, 30, 1);
INSERT INTO `monitor_structure` VALUES (228, 187, 2, 30, 5, 16, 30, 1);
INSERT INTO `monitor_structure` VALUES (229, 108, 1, 22, 9, 22, 0, 0);
INSERT INTO `monitor_structure` VALUES (230, 229, 3, 1, 9, 22, 0, 1);
INSERT INTO `monitor_structure` VALUES (231, 230, 2, 1, 0, 22, 1, 1);
INSERT INTO `monitor_structure` VALUES (232, 230, 2, 3, 9, 22, 3, 1);
INSERT INTO `monitor_structure` VALUES (233, 230, 2, 11, 9, 22, 11, 1);
INSERT INTO `monitor_structure` VALUES (234, 217, 2, 31, 8, 8, 31, 14);
INSERT INTO `monitor_structure` VALUES (235, 0, 0, 17, 17, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (236, 235, 1, 8, 17, 8, 0, 0);
INSERT INTO `monitor_structure` VALUES (237, 236, 3, 14, 17, 8, 0, 14);
INSERT INTO `monitor_structure` VALUES (238, 237, 2, 33, 17, 8, 33, 14);
INSERT INTO `monitor_structure` VALUES (239, 237, 2, 32, 17, 8, 32, 14);
INSERT INTO `monitor_structure` VALUES (240, 0, 0, 18, 18, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (241, 240, 1, 8, 18, 8, 0, 0);
INSERT INTO `monitor_structure` VALUES (242, 241, 3, 14, 18, 8, 0, 14);
INSERT INTO `monitor_structure` VALUES (243, 242, 2, 33, 18, 8, 33, 14);
INSERT INTO `monitor_structure` VALUES (244, 242, 2, 32, 18, 8, 32, 14);
INSERT INTO `monitor_structure` VALUES (245, 0, 0, 19, 19, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (246, 245, 1, 21, 19, 21, 0, 0);
INSERT INTO `monitor_structure` VALUES (247, 246, 3, 10, 19, 21, 0, 10);
INSERT INTO `monitor_structure` VALUES (248, 247, 2, 23, 19, 21, 23, 10);
INSERT INTO `monitor_structure` VALUES (249, 0, 0, 20, 20, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (250, 249, 1, 8, 20, 8, 0, 0);
INSERT INTO `monitor_structure` VALUES (251, 250, 3, 14, 20, 8, 0, 14);
INSERT INTO `monitor_structure` VALUES (252, 251, 2, 12, 20, 8, 12, 14);
INSERT INTO `monitor_structure` VALUES (253, 0, 0, 21, 21, 0, 0, 0);
INSERT INTO `monitor_structure` VALUES (254, 253, 1, 23, 21, 23, 0, 0);
INSERT INTO `monitor_structure` VALUES (255, 254, 3, 14, 21, 23, 0, 14);
INSERT INTO `monitor_structure` VALUES (256, 255, 2, 34, 21, 23, 34, 14);
INSERT INTO `monitor_structure` VALUES (257, 100, 3, 15, 8, 8, 0, 15);
INSERT INTO `monitor_structure` VALUES (258, 250, 3, 15, 20, 8, 0, 15);
INSERT INTO `monitor_structure` VALUES (259, 257, 2, 12, 8, 8, 12, 15);
INSERT INTO `monitor_structure` VALUES (260, 257, 2, 31, 8, 8, 31, 15);
INSERT INTO `monitor_structure` VALUES (261, 258, 2, 12, 20, 8, 12, 15);

-- ----------------------------
-- Table structure for monitor_subCategory
-- ----------------------------
DROP TABLE IF EXISTS `monitor_subCategory`;
CREATE TABLE `monitor_subCategory`  (
  `monitor_subCategory_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`monitor_subCategory_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 19 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of monitor_subCategory
-- ----------------------------
INSERT INTO `monitor_subCategory` VALUES (1, 'Networking');
INSERT INTO `monitor_subCategory` VALUES (2, 'Check Point ClusterXL');
INSERT INTO `monitor_subCategory` VALUES (3, 'Check Point Firewall');
INSERT INTO `monitor_subCategory` VALUES (4, 'RSA Authentication Manager');
INSERT INTO `monitor_subCategory` VALUES (5, 'Check Point Firewall');
INSERT INTO `monitor_subCategory` VALUES (6, 'Check Point Security Management');
INSERT INTO `monitor_subCategory` VALUES (7, 'Check Point QoS');
INSERT INTO `monitor_subCategory` VALUES (8, 'ADSL');
INSERT INTO `monitor_subCategory` VALUES (12, 'Check Point VPN');
INSERT INTO `monitor_subCategory` VALUES (9, 'Websense Web Security');
INSERT INTO `monitor_subCategory` VALUES (10, 'Nokia Clustering');
INSERT INTO `monitor_subCategory` VALUES (11, 'RainWall Clustering');
INSERT INTO `monitor_subCategory` VALUES (14, ' 7 day');
INSERT INTO `monitor_subCategory` VALUES (15, '14 day');
INSERT INTO `monitor_subCategory` VALUES (16, 'VSX');
INSERT INTO `monitor_subCategory` VALUES (17, ' 2 day');
INSERT INTO `monitor_subCategory` VALUES (18, ' 1 day');

-- ----------------------------
-- Table structure for monitor_sysinfo_linking
-- ----------------------------
DROP TABLE IF EXISTS `monitor_sysinfo_linking`;
CREATE TABLE `monitor_sysinfo_linking`  (
  `monitor_sysinfo_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_structure_id` int(11) NULL DEFAULT 0,
  `monitor_category_id` int(11) NULL DEFAULT 0,
  `monitor_subCategory_id` int(11) NULL DEFAULT 0,
  `monitor_sysinfo_toggle` int(11) NULL DEFAULT 0,
  `default` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`monitor_sysinfo_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 39 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of monitor_sysinfo_linking
-- ----------------------------
INSERT INTO `monitor_sysinfo_linking` VALUES (1, 1, 1, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (2, 2, 2, 0, 2, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (3, 2, 2, 0, 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (4, 3, 2, 0, 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (5, 4, 3, 0, 3, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (6, 5, 1, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (7, 5, 4, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (8, 5, 5, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (9, 6, 6, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (10, 7, 7, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (11, 1, 10, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (12, 5, 10, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (13, -1, -1, 0, 7, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (16, -1, 2, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (17, 4, 3, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (18, 12, 13, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (19, 5, 14, 0, 1, 0, 0, 0, 0, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (20, 13, 15, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (21, -1, 16, 0, 1, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (22, 13, 17, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (23, 14, 18, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (24, 15, 19, 0, 12, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (25, 15, 19, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (26, 1, 20, 0, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (27, 16, 21, 0, 13, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (28, 8, 8, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (30, 13, 15, 25, 10, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (31, 17, 8, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (32, 18, 8, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (33, 20, 8, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (34, 21, 23, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (35, 8, 8, 0, 14, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (36, 8, 8, 0, 15, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (37, 8, 8, 0, 15, 0, 0, 0, 1, 1);
INSERT INTO `monitor_sysinfo_linking` VALUES (38, 20, 8, 0, 15, 0, 0, 0, 1, 1);

-- ----------------------------
-- Table structure for monitor_type
-- ----------------------------
DROP TABLE IF EXISTS `monitor_type`;
CREATE TABLE `monitor_type`  (
  `type_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ref_id_table` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ref_id_field` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`type_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of monitor_type
-- ----------------------------
INSERT INTO `monitor_type` VALUES (1, 'Operating Systems', 'monitor_operatingSystem', 'monitor_operatingSystem_id');
INSERT INTO `monitor_type` VALUES (2, 'Applications', 'monitor_application', 'monitor_application_id');
INSERT INTO `monitor_type` VALUES (3, 'Agents', 'monitor_agent', 'monitor_agent_id');
INSERT INTO `monitor_type` VALUES (6, 'Platforms', 'monitor_platform', 'monitor_platform_id');

-- ----------------------------
-- Table structure for msp
-- ----------------------------
DROP TABLE IF EXISTS `msp`;
CREATE TABLE `msp`  (
  `msp_id` int(11) NOT NULL AUTO_INCREMENT,
  `msp_name` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `msp_description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `msp_domainname` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `msp_logo` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `msp_url` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`msp_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of msp
-- ----------------------------
INSERT INTO `msp` VALUES (1, 'msp', 'MSP', 'mss.isa.co.za', '', '');

-- ----------------------------
-- Table structure for mysql_process_list
-- ----------------------------
DROP TABLE IF EXISTS `mysql_process_list`;
CREATE TABLE `mysql_process_list`  (
  `PROCESSLIST_ID` bigint(4) NOT NULL AUTO_INCREMENT,
  `ID` bigint(4) NOT NULL DEFAULT 0,
  `USER` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `HOST` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `DB` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `COMMAND` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `TIME` int(7) NOT NULL DEFAULT 0,
  `STATE` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `INFO` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`PROCESSLIST_ID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mysql_process_list
-- ----------------------------
INSERT INTO `mysql_process_list` VALUES (1, 477047, 'root', 'localhost', NULL, 'Sleep', 301, '', NULL);
INSERT INTO `mysql_process_list` VALUES (2, 476771, 'root', '192.168.9.23:40873', 'monitor', 'Query', 0, 'executing', 'INSERT INTO `PROCESSLIST` SELECT * FROM `information_schema`.`PROCESSLIST`');
INSERT INTO `mysql_process_list` VALUES (3, 475725, 'root', '192.168.9.23:40839', 'monitor', 'Sleep', 3535, '', NULL);
INSERT INTO `mysql_process_list` VALUES (4, 470307, 'root', '192.168.9.23:40736', 'monitor', 'Sleep', 4037, '', NULL);
INSERT INTO `mysql_process_list` VALUES (5, 465420, 'root', '192.168.9.23:40679', 'monitor', 'Sleep', 14981, '', NULL);
INSERT INTO `mysql_process_list` VALUES (6, 457489, 'root', '192.168.9.23:40590', 'monitor', 'Sleep', 15669, '', NULL);
INSERT INTO `mysql_process_list` VALUES (7, 456983, 'root', '192.168.9.23:40583', 'monitor', 'Sleep', 20492, '', NULL);
INSERT INTO `mysql_process_list` VALUES (8, 7, 'root', 'localhost', 'monitor', 'Sleep', 2, '', NULL);
INSERT INTO `mysql_process_list` VALUES (9, 5, 'root', 'localhost', 'mss', 'Sleep', 2, '', NULL);
INSERT INTO `mysql_process_list` VALUES (10, 4, 'root', 'localhost', 'mss', 'Sleep', 29, '', NULL);
INSERT INTO `mysql_process_list` VALUES (11, 3, 'root', 'localhost', 'monitor', 'Sleep', 3, '', NULL);
INSERT INTO `mysql_process_list` VALUES (12, 2, 'root', 'localhost', 'mss', 'Sleep', 4, '', NULL);

-- ----------------------------
-- Table structure for notification_templates
-- ----------------------------
DROP TABLE IF EXISTS `notification_templates`;
CREATE TABLE `notification_templates`  (
  `notification_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `notification_template_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT 'default',
  `notification_template_type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `notification_template_body` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `notification_template_short` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `notification_template_subject` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `notification_template_body_plaintext` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `notification_report_template_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`notification_template_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 15 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification_templates
-- ----------------------------
INSERT INTO `notification_templates` VALUES (1, 'default', 'monitor_alert_advanced', '<style>td{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<table>\r\n<tr><td colspan=2>MSS Monitor Alert #delayed</td></tr>\r\n<tr><td colspan=2><hr></td></tr>\r\n<tr><td><br></td></tr>\r\n<tr><td>Hostname:</td><td>#hostname</td></tr>\r\n<tr><td>Site:</td><td>#company</td></tr>\r\n<tr><td>MSP:</td><td>#mspname</td></tr>\r\n<tr><td>Attribute:</td><td>#testname</td></tr>\r\n<tr><td>Date:</td><td>#time</td></tr>\r\n<tr><td>Status:</td><td>#newstate</td></tr>\r\n<tr><td>Value:</td><td>#newvalue_threshold_html</td></tr>\r\n<tr><td><br></td></tr>\r\n<tr><td colspan=2>#extra</td></tr>\r\n<tr><td colspan=2>https://#url</td></tr>\r\n<tr><td><br></td></tr>\r\n<tr><td>#MSS</td></tr>\r\n</table>', 'MSS Monitor: #company: #hostname: #legacy_abbreviation from #oldstate to #newstate (#newvalue)', 'MSS Monitor: #company: #hostname: #testshortname from #oldstate to #newstate', 'MSS Monitor Alert #delayed\r\n-----------------\r\n\r\nHostname:		#hostname\r\nCompany:		#company\r\nCheck:		           #testname\r\nDate:			#time\r\nStatus:		           #newstate\r\nValue:		           #newvalue_threshold\r\n\r\n#extra\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (3, 'default', 'environment_alert', '<style>td{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<table>\r\n<tr><td colspan=2>MSS Environment Alert</td></tr>\r\n<tr><td colspan=2><hr></td></tr>\r\n<tr><td><br></td></tr>\r\n<tr><td>Environment:</td><td>	#attributelabel</td></tr>\r\n<tr><td>Site:</td><td>		#company</td></tr>\r\n<tr><td>MSP:</td><td>		#mspname</td></tr>\r\n<tr><td>Attribute:</td><td>		#testname</td></tr>\r\n<tr><td>Date:</td><td>			#time</td></tr>\r\n<tr><td>Status:</td><td>	#newstate </td></tr>\r\n<tr><td>Value:</td><td>	#newvalue</td></tr>\r\n<tr><td colspan=2><br></td></tr>\r\n<tr><td colspan=2>https://#url</td></tr>\r\n<tr><td><br></td></tr>\r\n<tr><td>#MSS</td></tr>\r\n</table>\r\n', 'MSS Environment: #company: #attributelabel: #testshortname from #oldstate (#oldvalue) to #newstate (#newvalue)', 'MSS Environment: #company: #attributelabel: #testshortname from #oldstate to #newstate', 'MSS Environment Alert\r\n----------------------------\r\n\r\nEnvironment:	#attributelabel\r\nSite:		#company\r\nMSP:		#mspname\r\nAttribute:	#testname\r\nDate:		#time\r\nStatus:	#newstate\r\nValue:		#newvalue\r\n\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (4, 'default', 'monitor_nodata', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Monitor Communication failure<br>\r\n--------------------------<br>\r\n<br>\r\nHostname:		#hostname<br>\r\nSite:		#company<br>\r\nMSP:		#mspname<br>\r\nLast communication:		#last_updated<br>\r\nDate:			#time<br>\r\n<br>\r\nhttps://#url<br>\r\n<br>\r\n#MSS<br>\r\n</div>', 'MSS Monitor: #company: #hostname: Communication failure', 'MSS Monitor: #company: #hostname: Communication failure', 'MSS Monitor Communication failure\r\n--------------------------\r\n\r\nHostname:		#hostname\r\nSite:		#company\r\nMSP:		#mspname\r\nLast communication:	#last_updated\r\nDate:			#time\r\n\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (5, 'default', 'watchdog_notice', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Watchdog Notice<br>\r\n-------------------------<br>\r\n<br>\r\nMSP:		#mspname<br>\r\nProcess:		#process<br>\r\nDate:			#time<br>\r\n<br>\r\n#lngmsg<br>\r\n<br>\r\n#MSS<br>', 'MSS Watchdog: #mspname: #process: #shrtmsg', 'MSS Watchdog: #mspname: #process: #shrtmsg', 'MSS Watchdog Notice\r\n--------------------------\r\n\r\nMSP:		#mspname\r\nProcess:		#process\r\nDate:			#time\r\n\r\n#lngmsg\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (6, 'default', 'backup_notice', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Backup<br>\r\n---------------<br>\r\n<br>\r\nHostname	#hostname<br>\r\nSite:		#company<br>\r\nMSP:		#mspname<br>\r\nDate:		#time<br>\r\n<br>\r\n#long_events\r\n<br>\r\nhttps://#url<br>#MSS\r\n</div>', 'MSS Backup: #company: #hostname', 'MSS Backup: #company: #hostname', 'MSS Backup\r\n---------------\r\n\r\nHostname	#hostname\r\nSite:		#company\r\nMSP:		#mspname\r\nDate:		#time\r\n\r\n#sch_msg at #sch_time\r\n', NULL);
INSERT INTO `notification_templates` VALUES (7, 'default', 'dns_alert', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS DNS Alert<br>\r\n------------------<br>\r\n<br>\r\nHost/Domain:	#attributelabel (#hostname)<br>\r\nSite:		#company<br>\r\nMSP:		#mspname<br>\r\nPrevious state:	#oldstate<br>\r\nNew state:	        #newstate<br>\r\nDate:		#time<br>\r\nValue:<br>\r\n#newvalue<br>\r\n<br>\r\nhttps://#url<br>\r\n<br>\r\n#MSS<br>', 'MSS Monitor: #mspname: #hostname: DNS #testshortname From #oldstate to #newstate', 'MSS Monitor: #mspname: #hostname: DNS #testshortname From #oldstate to #newstate', 'MSS DNS Alert\r\n------------------\r\n\r\nHost/Domain:	#hostname\r\nSite:		#company\r\nMSP:		#mspname\r\nPrevious state:	#oldstate\r\nNew state:	        #newstate\r\nDate:		#time\r\nValue:\r\n#newvalue\r\n\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (8, 'default', 'monitor_alert_advanced_report', NULL, NULL, NULL, NULL, 10);
INSERT INTO `notification_templates` VALUES (10, 'default', 'monitor_nodata_old', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Monitor Timeout<br>\r\n--------------------------<br>\r\n<br>\r\nHostname:		#hostname<br>\r\nSite:		#company<br>\r\nMSP:		#mspname<br>\r\nLast received:		#last_timestamp<br>\r\nDate:			#time<br>\r\n<br>\r\nNo data has been received for the last #display_minutes minutes<br>\r\n<br>\r\nhttps://#url<br>\r\n<br>\r\n#MSS<br>\r\n</div>', NULL, 'MSS Monitor: #company: #hostname: NODATA received for #display_minutes minutes', 'MSS Monitor Timeout\r\n--------------------------\r\n\r\nHostname:		#hostname\r\nSite:		#company\r\nMSP:		#mspname\r\nDate:			#time\r\n\r\nNo data has been received for the last #display_minutes minutes\r\n\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (11, 'default', 'agent_outdated', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Pulse Agent out of date<br>\r\n--------------------------<br>\r\n<br>\r\nCompany:		#company_name<br>\r\nHostname:		#hostname<br>\r\nSystem:			#tree_label<br>\r\nCurrent Version:	#agent #old_version<br>\r\nNew Version:		#agent_type #highest_version<br>\r\nDate:			#time<br>\r\n\r\n<br>\r\n#MSS Pulse<br>\r\n', 'MSS Pulse Agent out of date\r\n--------------------------\r\nCompany:		#company_name\r\nHostname:		#hostname\r\nSystem:			#tree_label\r\nAgent:			#agent\r\nCurrent Version:	#agent #old_version\r\nNew Version:		#agentname #highest_version\r\nDate:			#time\r\n\r\nMSS Pulse', 'MSS Pulse Agent: #company_name: #hostname: Agent out of date\r\n', 'MSS Pulse Agent out of date\r\n--------------------------\r\nCompany:		#company_name\r\nHostname:		#hostname\r\nSystem:			#tree_label\r\nAgent:			#agent\r\nCurrent Version:	#agent #old_version\r\nNew Version:		#agentname #highest_version\r\nDate:			#time\r\n\r\nMSS Pulse', NULL);
INSERT INTO `notification_templates` VALUES (12, 'default', '', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `notification_templates` VALUES (13, 'default', 'monitor_timesync', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\r\n<div>\r\nMSS Monitor Time out of sync<br>\r\n--------------------------<br>\r\n<br>\r\nHostname:  #hostname<br>\r\nSite:  #company<br>\r\nMSP:  #mspname<br>\r\nTime difference:  #time_diff<br>\r\nAgent time:   #agent_time<br>\r\nServer time:   #server_time<br>\r\nDetected:   #outofsync_timestamp<br>\r\nDate:   #time<br>\r\n<br>\r\nhttps://#url<br>\r\n<br>\r\n#MSS<br>\r\n</div>', 'MSS Monitor: #company: #hostname: Time out of sync', 'MSS Monitor: #company: #hostname: Time out of sync', 'MSS Monitor Time out of sync\r\n--------------------------\r\n\r\nHostname:  #hostname\r\nSite:  #company\r\nMSP:  #mspname\r\nTime diffence: #time_diff\r\nAgent time:   #agent_time\r\nServer time:   #server_time\r\nDetected:   #outofsync_timestamp\r\nDate:   #time\r\n\r\nhttps://#url\r\n\r\nMSS', NULL);
INSERT INTO `notification_templates` VALUES (14, 'default', 'monitor_out_of_investigation', '<style>div{font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 13px;}</style>\n						<div>\n						MSS Monitor Under Investigation  Expired<br>\n						--------------------------<br>\n						<br>\n						Hostname:  		#hostname<br>\n						Attribute:  		#attribute<br>\n						Site:  			#company<br>\n						MSP:  			#mspname<br>\n						Comment:  		#ucomment<br>\n						start:  		#began<br>\n						end: 			#ended<br>\n						Suppress alerts: 	#supalert<br>\n						Suppress roll-up:  	#suproll<br>\n						Date:   		#time<br>\n						<br>\n						https://#url<br>\n						<br>\n						#MSS<br>\n						</div>', 'MSS Monitor: #company: #hostname: Under Investigation  Expired', 'MSS Monitor: #company: #hostname: Under Investigation  Expired', 'MSS Monitor Under Investigation Expired\n						--------------------------\n\n						Hostname:  		#hostname<br>\n						Attribute:  		#attribute<br>\n						Site:  			#company<br>\n						MSP:  			#mspname<br>\n						Comment:  		#ucomment<br>\n						start:  		#began<br>\n						end: 			#ended<br>\n						Suppress alerts: 	#supalert<br>\n						Suppress roll-up:  	#suproll<br>\n						Date:   		#time<br>\n\n						https://#url\n\n						MSS', NULL);

-- ----------------------------
-- Table structure for old_cpu
-- ----------------------------
DROP TABLE IF EXISTS `old_cpu`;
CREATE TABLE `old_cpu`  (
  `hostid` int(11) NOT NULL,
  `idle` bigint(25) NULL DEFAULT NULL,
  `other` bigint(25) NULL DEFAULT NULL,
  PRIMARY KEY (`hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of old_cpu
-- ----------------------------

-- ----------------------------
-- Table structure for old_if
-- ----------------------------
DROP TABLE IF EXISTS `old_if`;
CREATE TABLE `old_if`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `ifname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `inb` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `inp` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `inerrp` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `outb` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `outp` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `outerrp` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `indrop` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `outdrop` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`siteid`, `hostid`, `ifname`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of old_if
-- ----------------------------

-- ----------------------------
-- Table structure for old_if_drop
-- ----------------------------
DROP TABLE IF EXISTS `old_if_drop`;
CREATE TABLE `old_if_drop`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `ifname` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `d_in` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `d_out` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`siteid`, `hostid`, `ifname`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of old_if_drop
-- ----------------------------

-- ----------------------------
-- Table structure for old_individual_cpu
-- ----------------------------
DROP TABLE IF EXISTS `old_individual_cpu`;
CREATE TABLE `old_individual_cpu`  (
  `cpu_name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `hostid` int(11) NOT NULL,
  `idle` bigint(25) NULL DEFAULT NULL,
  `other` bigint(25) NULL DEFAULT NULL,
  PRIMARY KEY (`cpu_name`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of old_individual_cpu
-- ----------------------------

-- ----------------------------
-- Table structure for old_log_counts
-- ----------------------------
DROP TABLE IF EXISTS `old_log_counts`;
CREATE TABLE `old_log_counts`  (
  `old_logs_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostid` int(11) NULL DEFAULT NULL,
  `value` int(25) NULL DEFAULT NULL,
  `attribute_name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`old_logs_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of old_log_counts
-- ----------------------------

-- ----------------------------
-- Table structure for old_snmp_data
-- ----------------------------
DROP TABLE IF EXISTS `old_snmp_data`;
CREATE TABLE `old_snmp_data`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `packet_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `byte_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of old_snmp_data
-- ----------------------------

-- ----------------------------
-- Table structure for old_ssh_data
-- ----------------------------
DROP TABLE IF EXISTS `old_ssh_data`;
CREATE TABLE `old_ssh_data`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `num_of_drops` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of old_ssh_data
-- ----------------------------

-- ----------------------------
-- Table structure for public_holidays
-- ----------------------------
DROP TABLE IF EXISTS `public_holidays`;
CREATE TABLE `public_holidays`  (
  `public_holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `occurs` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `holdiay_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  PRIMARY KEY (`public_holiday_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of public_holidays
-- ----------------------------

-- ----------------------------
-- Table structure for queueing
-- ----------------------------
DROP TABLE IF EXISTS `queueing`;
CREATE TABLE `queueing`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `sitename` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `timestamp` varchar(30) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `time_difference` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '0',
  `xml_data` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`id`, `hostname`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7606532 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of queueing
-- ----------------------------

-- ----------------------------
-- Table structure for remoteMenuTree
-- ----------------------------
DROP TABLE IF EXISTS `remoteMenuTree`;
CREATE TABLE `remoteMenuTree`  (
  `remoteMenuTree_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `remotePulse_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `menuTree_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `parent_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `full_menuTree_id` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `menu_level_type_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `tree_label` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `old` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`remoteMenuTree_id`) USING BTREE,
  UNIQUE INDEX `uniqueRule`(`remotePulse_id`, `menuTree_id`) USING BTREE,
  INDEX `treeIndex`(`remotePulse_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remoteMenuTree
-- ----------------------------

-- ----------------------------
-- Table structure for remotePulse
-- ----------------------------
DROP TABLE IF EXISTS `remotePulse`;
CREATE TABLE `remotePulse`  (
  `remotePulse_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ip` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `remote_md5hash` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `logo` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `url` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `communication_status` tinyint(4) NULL DEFAULT NULL,
  `communication_status_timestamp` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`remotePulse_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remotePulse
-- ----------------------------

-- ----------------------------
-- Table structure for remote_db_config
-- ----------------------------
DROP TABLE IF EXISTS `remote_db_config`;
CREATE TABLE `remote_db_config`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `db_location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `db_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `db_username` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `db_type` int(11) NOT NULL DEFAULT 0,
  `db_password` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of remote_db_config
-- ----------------------------

-- ----------------------------
-- Table structure for report_format
-- ----------------------------
DROP TABLE IF EXISTS `report_format`;
CREATE TABLE `report_format`  (
  `reportFormatId` int(11) NOT NULL AUTO_INCREMENT,
  `reportTypeId` int(11) NOT NULL DEFAULT 0,
  `inline` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `mht` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `pdf` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `csv` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  PRIMARY KEY (`reportFormatId`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 13 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Formats in which report may be generated' ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of report_format
-- ----------------------------
INSERT INTO `report_format` VALUES (1, 17, '1', '1', '1', '1');
INSERT INTO `report_format` VALUES (2, 18, '1', '1', '1', '1');
INSERT INTO `report_format` VALUES (3, 22, '1', '1', '1', '1');
INSERT INTO `report_format` VALUES (4, 13, '1', '1', '1', '1');
INSERT INTO `report_format` VALUES (5, 19, '1', '1', '1', '0');
INSERT INTO `report_format` VALUES (7, 24, '1', '1', '1', '0');
INSERT INTO `report_format` VALUES (8, 25, '1', '1', '1', '0');
INSERT INTO `report_format` VALUES (10, 21, '1', '0', '1', '1');
INSERT INTO `report_format` VALUES (11, 28, '0', '0', '0', '1');
INSERT INTO `report_format` VALUES (12, 29, '0', '0', '0', '1');

-- ----------------------------
-- Table structure for report_node_linking
-- ----------------------------
DROP TABLE IF EXISTS `report_node_linking`;
CREATE TABLE `report_node_linking`  (
  `report_node_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type_id` int(11) NULL DEFAULT NULL,
  `menu_level_type_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`report_node_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 55 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of report_node_linking
-- ----------------------------
INSERT INTO `report_node_linking` VALUES (11, 7, 20);
INSERT INTO `report_node_linking` VALUES (10, 6, 2);
INSERT INTO `report_node_linking` VALUES (13, 9, 2);
INSERT INTO `report_node_linking` VALUES (14, 11, 2020);
INSERT INTO `report_node_linking` VALUES (15, 11, 202);
INSERT INTO `report_node_linking` VALUES (16, 12, 2020);
INSERT INTO `report_node_linking` VALUES (17, 13, 20);
INSERT INTO `report_node_linking` VALUES (18, 14, 19);
INSERT INTO `report_node_linking` VALUES (19, 15, 19);
INSERT INTO `report_node_linking` VALUES (20, 16, 2020);
INSERT INTO `report_node_linking` VALUES (21, 16, 2);
INSERT INTO `report_node_linking` VALUES (22, 7, 1);
INSERT INTO `report_node_linking` VALUES (23, 16, 2000);
INSERT INTO `report_node_linking` VALUES (24, 17, 2);
INSERT INTO `report_node_linking` VALUES (25, 17, 20);
INSERT INTO `report_node_linking` VALUES (26, 18, 2);
INSERT INTO `report_node_linking` VALUES (27, 18, 20);
INSERT INTO `report_node_linking` VALUES (28, 19, 20);
INSERT INTO `report_node_linking` VALUES (31, 21, 20);
INSERT INTO `report_node_linking` VALUES (32, 22, 19);
INSERT INTO `report_node_linking` VALUES (33, 22, 20);
INSERT INTO `report_node_linking` VALUES (34, 22, 2);
INSERT INTO `report_node_linking` VALUES (35, 21, 2);
INSERT INTO `report_node_linking` VALUES (36, 13, 1);
INSERT INTO `report_node_linking` VALUES (37, 19, 1);
INSERT INTO `report_node_linking` VALUES (38, 7, 19);
INSERT INTO `report_node_linking` VALUES (39, 23, 20);
INSERT INTO `report_node_linking` VALUES (40, 25, 2);
INSERT INTO `report_node_linking` VALUES (41, 24, 20);
INSERT INTO `report_node_linking` VALUES (42, 24, 19);
INSERT INTO `report_node_linking` VALUES (43, 24, 1);
INSERT INTO `report_node_linking` VALUES (44, 25, 1);
INSERT INTO `report_node_linking` VALUES (45, 26, 19);
INSERT INTO `report_node_linking` VALUES (46, 26, 20);
INSERT INTO `report_node_linking` VALUES (47, 26, 1);
INSERT INTO `report_node_linking` VALUES (48, 27, 19);
INSERT INTO `report_node_linking` VALUES (49, 27, 20);
INSERT INTO `report_node_linking` VALUES (50, 28, 20);
INSERT INTO `report_node_linking` VALUES (51, 28, 19);
INSERT INTO `report_node_linking` VALUES (52, 28, 2);
INSERT INTO `report_node_linking` VALUES (53, 29, 20);
INSERT INTO `report_node_linking` VALUES (54, 29, 19);

-- ----------------------------
-- Table structure for report_section
-- ----------------------------
DROP TABLE IF EXISTS `report_section`;
CREATE TABLE `report_section`  (
  `report_section_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `long_description` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `setting_requirements` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`report_section_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 242 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_section
-- ----------------------------
INSERT INTO `report_section` VALUES (1, 'reportDescription', 'Report description', NULL, NULL);
INSERT INTO `report_section` VALUES (2, 'nodeDescription', 'Node description', '', NULL);
INSERT INTO `report_section` VALUES (3, 'attributeSummaryGraphs', 'Attributes summary graphs', '', NULL);
INSERT INTO `report_section` VALUES (4, 'attributeSummary', 'Attributes summary', '', NULL);
INSERT INTO `report_section` VALUES (5, 'statusSummary', 'Status summary', NULL, NULL);
INSERT INTO `report_section` VALUES (6, 'systemAvailability', 'System availability', '', NULL);
INSERT INTO `report_section` VALUES (12, 'backups', 'Backups', NULL, NULL);
INSERT INTO `report_section` VALUES (7, 'attribute', 'Specific attribute type summary', NULL, NULL);
INSERT INTO `report_section` VALUES (8, 'systemDescription', 'System description', '', NULL);
INSERT INTO `report_section` VALUES (9, 'datasources', 'Datasouce summary', NULL, NULL);
INSERT INTO `report_section` VALUES (10, 'log', 'Log', '', NULL);
INSERT INTO `report_section` VALUES (11, 'attribute', 'Attribute', '', NULL);
INSERT INTO `report_section` VALUES (13, 'tableOfContents', 'Table of contents', NULL, NULL);
INSERT INTO `report_section` VALUES (14, 'statusBreakdown', 'Status breakdown', NULL, NULL);
INSERT INTO `report_section` VALUES (15, 'notification', 'notification', NULL, NULL);
INSERT INTO `report_section` VALUES (16, 'notificationStatus', 'notificationStatus', NULL, NULL);
INSERT INTO `report_section` VALUES (18, 'top10InfectionsByAlertCount', 'Top 10 infections by alert count', NULL, NULL);
INSERT INTO `report_section` VALUES (19, 'top10HostsByAlertCount', 'Top 10 hosts by alert count', NULL, NULL);
INSERT INTO `report_section` VALUES (20, 'top10HostsByUniqueVirusCount', 'Top 10 hosts by unique virus count', NULL, NULL);
INSERT INTO `report_section` VALUES (21, 'newInfections', 'New Infections', NULL, NULL);
INSERT INTO `report_section` VALUES (22, 'UserLogDetails', 'User log details', NULL, NULL);
INSERT INTO `report_section` VALUES (24, 'top10VirusesByAlert', 'Top 10 Viruses by alert', NULL, NULL);
INSERT INTO `report_section` VALUES (25, 'top10VirusesByAlertedHosts', 'Top 10 viruses by alerted hosts', NULL, NULL);
INSERT INTO `report_section` VALUES (26, 'top10HostsByAlerts', 'Top 10 hosts by alerts', NULL, NULL);
INSERT INTO `report_section` VALUES (27, 'top10HostsByUniqueAlerts', 'Top 10 hosts by unique alerts', NULL, NULL);
INSERT INTO `report_section` VALUES (225, 'top10NewVirusesByAlert', 'Top 10 new viruses', NULL, NULL);
INSERT INTO `report_section` VALUES (226, 'virusActivitySummary', 'F-Secure virus activity summary', NULL, NULL);
INSERT INTO `report_section` VALUES (227, 'virusActivityDetail', 'F-Secure virus activity detail', NULL, NULL);
INSERT INTO `report_section` VALUES (228, 'FSAuditDetail', 'F-Secure Audit detail report', NULL, NULL);
INSERT INTO `report_section` VALUES (229, 'antiVirusSummary', 'Anti-Virus summary', NULL, NULL);
INSERT INTO `report_section` VALUES (230, 'abil_ipChange', 'IP Changes', NULL, NULL);
INSERT INTO `report_section` VALUES (231, 'virusSummary', 'Virus summary', NULL, NULL);
INSERT INTO `report_section` VALUES (232, 'abil_ipChangeSummary', 'IP Change summary', NULL, NULL);
INSERT INTO `report_section` VALUES (233, 'sysinfo_summary', 'System information', NULL, NULL);
INSERT INTO `report_section` VALUES (234, 'systems_template', 'systems_template', NULL, NULL);
INSERT INTO `report_section` VALUES (235, 'backups_summary', 'System backups', NULL, NULL);
INSERT INTO `report_section` VALUES (236, 'sysinfo_system', 'System information', NULL, NULL);
INSERT INTO `report_section` VALUES (237, 'attribute_details', 'Attribute details', NULL, NULL);
INSERT INTO `report_section` VALUES (240, 'interface_routing', 'Interface routing', NULL, NULL);
INSERT INTO `report_section` VALUES (241, 'test', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for report_section_configuration
-- ----------------------------
DROP TABLE IF EXISTS `report_section_configuration`;
CREATE TABLE `report_section_configuration`  (
  `report_section_configuration_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_section_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`report_section_configuration_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 79 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of report_section_configuration
-- ----------------------------
INSERT INTO `report_section_configuration` VALUES (1, 1);
INSERT INTO `report_section_configuration` VALUES (2, 8);
INSERT INTO `report_section_configuration` VALUES (3, 5);
INSERT INTO `report_section_configuration` VALUES (4, 6);
INSERT INTO `report_section_configuration` VALUES (5, 11);
INSERT INTO `report_section_configuration` VALUES (6, 10);
INSERT INTO `report_section_configuration` VALUES (7, 10);
INSERT INTO `report_section_configuration` VALUES (8, 11);
INSERT INTO `report_section_configuration` VALUES (9, 12);
INSERT INTO `report_section_configuration` VALUES (10, 6);
INSERT INTO `report_section_configuration` VALUES (11, 5);
INSERT INTO `report_section_configuration` VALUES (12, 12);
INSERT INTO `report_section_configuration` VALUES (13, 1);
INSERT INTO `report_section_configuration` VALUES (14, 11);
INSERT INTO `report_section_configuration` VALUES (15, 13);
INSERT INTO `report_section_configuration` VALUES (16, 14);
INSERT INTO `report_section_configuration` VALUES (17, 15);
INSERT INTO `report_section_configuration` VALUES (18, 11);
INSERT INTO `report_section_configuration` VALUES (19, 11);
INSERT INTO `report_section_configuration` VALUES (20, 16);
INSERT INTO `report_section_configuration` VALUES (21, 11);
INSERT INTO `report_section_configuration` VALUES (26, 18);
INSERT INTO `report_section_configuration` VALUES (27, 19);
INSERT INTO `report_section_configuration` VALUES (28, 20);
INSERT INTO `report_section_configuration` VALUES (29, 5);
INSERT INTO `report_section_configuration` VALUES (30, 11);
INSERT INTO `report_section_configuration` VALUES (31, 11);
INSERT INTO `report_section_configuration` VALUES (32, 22);
INSERT INTO `report_section_configuration` VALUES (33, 18);
INSERT INTO `report_section_configuration` VALUES (34, 23);
INSERT INTO `report_section_configuration` VALUES (35, 19);
INSERT INTO `report_section_configuration` VALUES (36, 24);
INSERT INTO `report_section_configuration` VALUES (37, 25);
INSERT INTO `report_section_configuration` VALUES (38, 26);
INSERT INTO `report_section_configuration` VALUES (39, 27);
INSERT INTO `report_section_configuration` VALUES (40, 11);
INSERT INTO `report_section_configuration` VALUES (41, 225);
INSERT INTO `report_section_configuration` VALUES (42, 11);
INSERT INTO `report_section_configuration` VALUES (43, 226);
INSERT INTO `report_section_configuration` VALUES (44, 227);
INSERT INTO `report_section_configuration` VALUES (45, 5);
INSERT INTO `report_section_configuration` VALUES (46, 11);
INSERT INTO `report_section_configuration` VALUES (47, 11);
INSERT INTO `report_section_configuration` VALUES (48, 229);
INSERT INTO `report_section_configuration` VALUES (49, 230);
INSERT INTO `report_section_configuration` VALUES (50, 231);
INSERT INTO `report_section_configuration` VALUES (51, 24);
INSERT INTO `report_section_configuration` VALUES (52, 25);
INSERT INTO `report_section_configuration` VALUES (53, 26);
INSERT INTO `report_section_configuration` VALUES (54, 27);
INSERT INTO `report_section_configuration` VALUES (55, 232);
INSERT INTO `report_section_configuration` VALUES (63, 233);
INSERT INTO `report_section_configuration` VALUES (64, 235);
INSERT INTO `report_section_configuration` VALUES (65, 6);
INSERT INTO `report_section_configuration` VALUES (66, 14);
INSERT INTO `report_section_configuration` VALUES (67, 5);
INSERT INTO `report_section_configuration` VALUES (68, 236);
INSERT INTO `report_section_configuration` VALUES (69, 11);
INSERT INTO `report_section_configuration` VALUES (70, 5);
INSERT INTO `report_section_configuration` VALUES (71, 237);
INSERT INTO `report_section_configuration` VALUES (72, 5);
INSERT INTO `report_section_configuration` VALUES (73, 11);
INSERT INTO `report_section_configuration` VALUES (74, 11);
INSERT INTO `report_section_configuration` VALUES (75, 238);
INSERT INTO `report_section_configuration` VALUES (76, 239);
INSERT INTO `report_section_configuration` VALUES (77, 240);
INSERT INTO `report_section_configuration` VALUES (78, 241);

-- ----------------------------
-- Table structure for report_section_configuration_settings
-- ----------------------------
DROP TABLE IF EXISTS `report_section_configuration_settings`;
CREATE TABLE `report_section_configuration_settings`  (
  `report_section_configuration_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_section_configuration_id` int(11) NULL DEFAULT NULL,
  `report_section_settings_id` int(11) NULL DEFAULT NULL,
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `editable` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`report_section_configuration_settings_id`) USING BTREE,
  UNIQUE INDEX `MaintainUnique`(`report_section_configuration_id`, `report_section_settings_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 124 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_section_configuration_settings
-- ----------------------------
INSERT INTO `report_section_configuration_settings` VALUES (2, 6, 16, '2', 0);
INSERT INTO `report_section_configuration_settings` VALUES (3, 7, 16, '3', 0);
INSERT INTO `report_section_configuration_settings` VALUES (4, 8, 4, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (5, 8, 5, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (6, 8, 9996, '11|5|46|132|133', 0);
INSERT INTO `report_section_configuration_settings` VALUES (7, 7, 21, 'Log: Monitor changes', 0);
INSERT INTO `report_section_configuration_settings` VALUES (8, 6, 21, 'Interface changes', 0);
INSERT INTO `report_section_configuration_settings` VALUES (9, 5, 22, 'Attribute status timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (10, 8, 22, 'Attribute trend graphs', 0);
INSERT INTO `report_section_configuration_settings` VALUES (17, 14, 5, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (12, 4, 26, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (13, 4, 27, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (14, 4, 28, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (18, 14, 25, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (19, 14, 22, 'Attribute status change details', 0);
INSERT INTO `report_section_configuration_settings` VALUES (20, 5, 39, 'The timelines below indicate when each attribute of the system was operating under normal, warning, critical and no data status. A \"No data\" status for a particular attribute would indicate that there is a problem with the data collection or threshold configuration for that particular attribute. A \"No data\" status for all attributes would in most cases indicate that the system was \"down\" for that period. In rare cases, this may indicate a problem with the MSS agent itself. \r\n<br>\r\n<br>\r\nThe percentage indicates the amount of time an attribute was in normal status.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (16, 9, 30, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (21, 14, 39, 'The table below lists the times that particular attributes of the system were in warning, critical or no data status. ', 0);
INSERT INTO `report_section_configuration_settings` VALUES (22, 8, 39, 'These trend graphs show the values of the attributes during the reporting period.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (23, 16, 34, 'System status timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (25, 19, 4, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (26, 19, 22, 'Attribute trend (24 hours)', 0);
INSERT INTO `report_section_configuration_settings` VALUES (27, 19, 39, NULL, 0);
INSERT INTO `report_section_configuration_settings` VALUES (28, 18, 22, 'Status timeline', 0);
INSERT INTO `report_section_configuration_settings` VALUES (29, 18, 39, NULL, 0);
INSERT INTO `report_section_configuration_settings` VALUES (30, 19, 5, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (31, 18, 3, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (32, 19, 3, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (33, 19, 42, 'small', 0);
INSERT INTO `report_section_configuration_settings` VALUES (39, 21, 43, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (38, 21, 22, 'Policy installations', 0);
INSERT INTO `report_section_configuration_settings` VALUES (37, 21, 6, '26|8', 0);
INSERT INTO `report_section_configuration_settings` VALUES (40, 26, 44, 'Top 10 infections by alert count', 0);
INSERT INTO `report_section_configuration_settings` VALUES (41, 29, 38, 'This chart indicates the percentage of time that environment attributes were available during the reporting period.\r\n', 0);
INSERT INTO `report_section_configuration_settings` VALUES (57, 29, 49, 'EnvAvail', 0);
INSERT INTO `report_section_configuration_settings` VALUES (58, 30, 50, 'EnvAvail', 0);
INSERT INTO `report_section_configuration_settings` VALUES (59, 31, 50, 'EnvAvail', 0);
INSERT INTO `report_section_configuration_settings` VALUES (43, 30, 39, 'The timelines below indicate when each environment attribute was available. The percentage indicates the amount of time an environment attribute was available.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (44, 31, 5, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (45, 31, 25, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (47, 31, 39, 'The table below lists the times that particular environment attributes were unavailable.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (48, 30, 45, 'YELLOW', 0);
INSERT INTO `report_section_configuration_settings` VALUES (49, 31, 45, 'YELLOW', 0);
INSERT INTO `report_section_configuration_settings` VALUES (50, 29, 46, '2', 0);
INSERT INTO `report_section_configuration_settings` VALUES (51, 29, 47, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (52, 30, 48, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (53, 31, 48, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (54, 30, 22, 'Availability timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (55, 31, 22, 'Availability change details', 0);
INSERT INTO `report_section_configuration_settings` VALUES (56, 29, 20, 'Availability summary', 0);
INSERT INTO `report_section_configuration_settings` VALUES (61, 33, 53, 'Top 10 hosts by infection count', 0);
INSERT INTO `report_section_configuration_settings` VALUES (62, 26, 54, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (63, 40, 4, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (64, 40, 5, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (65, 40, 6, '97|108|103|99|98', 0);
INSERT INTO `report_section_configuration_settings` VALUES (66, 42, 65, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (67, 46, 71, 'Availability timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (68, 47, 71, 'Availability change details', 0);
INSERT INTO `report_section_configuration_settings` VALUES (69, 45, 20, 'Availability change details', 0);
INSERT INTO `report_section_configuration_settings` VALUES (70, 51, 78, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (71, 52, 79, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (72, 5200, 78, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (73, 5200, 79, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (74, 53, 80, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (75, 54, 81, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (76, 30, 3, 'true', 1);
INSERT INTO `report_section_configuration_settings` VALUES (77, 56, 11, '', 0);
INSERT INTO `report_section_configuration_settings` VALUES (78, 56, 23, 'This is my own section title. Pulse backups.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (79, 57, 16, '2', 0);
INSERT INTO `report_section_configuration_settings` VALUES (80, 57, 21, 'Interface logs', 0);
INSERT INTO `report_section_configuration_settings` VALUES (81, 58, 16, '5', 0);
INSERT INTO `report_section_configuration_settings` VALUES (82, 58, 21, 'Backups logs', 0);
INSERT INTO `report_section_configuration_settings` VALUES (85, 31, 3, 'true', 1);
INSERT INTO `report_section_configuration_settings` VALUES (87, 65, 88, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (88, 65, 89, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (89, 69, 22, 'Attribute status timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (90, 69, 39, 'The timelines below indicate when each attribute of the system was operating under normal, warning, critical and no data status. A \"No data\" status for a particular attribute would indicate that there is a problem with the data collection or threshold configuration for that particular attribute. A \"No data\" status for all attributes would in most cases indicate that the system was \"down\" for that period. In rare cases, this may indicate a problem with the MSS agent itself. \r\n<br>\r\n<br>\r\nThe percentage indicates the amount of time an attribute was in normal status.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (91, 69, 91, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (92, 11, 92, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (93, 67, 92, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (94, 67, 95, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (95, 67, 20, 'System status', 0);
INSERT INTO `report_section_configuration_settings` VALUES (96, 65, 96, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (97, 70, 20, 'System status', 0);
INSERT INTO `report_section_configuration_settings` VALUES (98, 70, 92, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (99, 70, 95, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (100, 70, 97, '3', 0);
INSERT INTO `report_section_configuration_settings` VALUES (101, 67, 100, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (102, 65, 12, 'The system availability report indicates the availability of the monitored system(s) during the reporting period. The chart and timelines below indicate the percentage of uptime of the monitored system(s).\r\n', 0);
INSERT INTO `report_section_configuration_settings` VALUES (103, 67, 38, 'The system status report indicates the percentage of time (calculated over all system attributes) spent in a particular status (normal, warning, critical, no data) during the reporting period. \r\n<br><br>\r\nA high percentage in normal status is ideal. The \"No data\" status could either indicate system downtime (see System availability above) or a problem with the configuration of a particular attribute (see the attribute status timelines below). \r\n<br><br>\r\nThe status assigned to a particular attribute being measured is dependent on the alerting thresholds configured for that attribute.\r\n<br><br>\r\nThe status of a system at a point in time is calculated as the \"worst\" attribute status at that point in time. A no data (purple) status is considered the worst status, followed by critical (red), warning (orange) and then normal (green). Grey indicates that no status thresholds were configured for that particular attribute at that time.\r\n', 0);
INSERT INTO `report_section_configuration_settings` VALUES (104, 67, 101, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (105, 67, 102, 'a:1:{i:0;s:88:\"* Indicates report start or end time, the actual time falls outside of reporting period.\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (106, 65, 103, 'a:1:{i:0;s:88:\"* Indicates report start or end time, the actual time falls outside of reporting period.\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (107, 71, 104, 'a:1:{i:0;s:88:\"* Indicates report start or end time, the actual time falls outside of reporting period.\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (109, 72, 38, 'This chart indicates the percentage of time that environment attributes spent in a particular status.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (110, 72, 47, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (111, 72, 50, 'a:1:{i:3;s:8:\"Critical\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (112, 73, 22, 'Status timelines', 0);
INSERT INTO `report_section_configuration_settings` VALUES (113, 73, 39, 'The timelines below indicate when each environment attribute was in a particular status. The percentage indicates the amount of time an environment attribute was normal.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (114, 73, 48, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (115, 73, 49, 'a:2:{i:3;s:8:\"Critical\";s:3:\"RED\";s:8:\"Critical\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (116, 74, 5, 'false', 0);
INSERT INTO `report_section_configuration_settings` VALUES (117, 74, 22, 'Status change details', 0);
INSERT INTO `report_section_configuration_settings` VALUES (118, 74, 25, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (119, 74, 39, 'The table below lists the times that particular environment attributes were in a particular status.', 0);
INSERT INTO `report_section_configuration_settings` VALUES (120, 74, 48, 'true', 0);
INSERT INTO `report_section_configuration_settings` VALUES (121, 74, 49, 'a:2:{i:3;s:8:\"Critical\";s:3:\"RED\";s:8:\"Critical\";}', 0);
INSERT INTO `report_section_configuration_settings` VALUES (122, 75, 108, 'System configuration', 0);
INSERT INTO `report_section_configuration_settings` VALUES (123, 76, 109, 'Attribute configuration', 0);

-- ----------------------------
-- Table structure for report_section_linking
-- ----------------------------
DROP TABLE IF EXISTS `report_section_linking`;
CREATE TABLE `report_section_linking`  (
  `report_section_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type_id` int(11) NULL DEFAULT NULL,
  `report_section_id` int(11) NULL DEFAULT NULL,
  `order` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`report_section_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 22 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of report_section_linking
-- ----------------------------
INSERT INTO `report_section_linking` VALUES (1, 3, 1, 0);
INSERT INTO `report_section_linking` VALUES (3, 3, 3, 9);
INSERT INTO `report_section_linking` VALUES (4, 3, 4, 9);
INSERT INTO `report_section_linking` VALUES (5, 3, 5, 3);
INSERT INTO `report_section_linking` VALUES (6, 3, 6, 2);
INSERT INTO `report_section_linking` VALUES (7, 3, 8, 1);
INSERT INTO `report_section_linking` VALUES (8, 3, 9, 9);
INSERT INTO `report_section_linking` VALUES (9, 3, 10, 7);
INSERT INTO `report_section_linking` VALUES (10, 3, 10, 5);
INSERT INTO `report_section_linking` VALUES (18, 3, 12, 10);
INSERT INTO `report_section_linking` VALUES (13, 3, 11, 4);
INSERT INTO `report_section_linking` VALUES (16, 5, 11, 1);
INSERT INTO `report_section_linking` VALUES (17, 5, 1, 0);
INSERT INTO `report_section_linking` VALUES (20, 3, 11, 6);
INSERT INTO `report_section_linking` VALUES (21, 14, 22, 6);

-- ----------------------------
-- Table structure for report_section_linking_settings
-- ----------------------------
DROP TABLE IF EXISTS `report_section_linking_settings`;
CREATE TABLE `report_section_linking_settings`  (
  `report_section_linking_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_section_linking_id` int(11) NULL DEFAULT NULL,
  `setting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`report_section_linking_settings_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 35 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_section_linking_settings
-- ----------------------------

-- ----------------------------
-- Table structure for report_section_settings
-- ----------------------------
DROP TABLE IF EXISTS `report_section_settings`;
CREATE TABLE `report_section_settings`  (
  `report_section_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_section_id` int(11) NULL DEFAULT NULL,
  `setting` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `options` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `initial` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `editable` tinyint(4) NULL DEFAULT 0,
  PRIMARY KEY (`report_section_settings_id`) USING BTREE,
  UNIQUE INDEX `MaintainUnique`(`report_section_id`, `setting`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 114 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_section_settings
-- ----------------------------
INSERT INTO `report_section_settings` VALUES (16, 10, 'logCategoryFilter', 'Filter by category', 'select', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (3, 11, 'location', 'Show individual breadcrumbs', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (4, 11, 'lineGraph', 'Show line graph', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (5, 11, 'statusOverTimeGraph', 'Show status over time graph', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (6, 11, 'checktypes', 'Filter checktypes', 'select', NULL, '', 0);
INSERT INTO `report_section_settings` VALUES (7, 11, 'customLabels', 'Custom status labels', 'selectKeys', NULL, '', 0);
INSERT INTO `report_section_settings` VALUES (8, 11, 'statusFilter', 'Status filter', 'select', NULL, '', 0);
INSERT INTO `report_section_settings` VALUES (9, 11, 'pieChart', 'Pie chart', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (10, 8, 'section_description', 'Description', 'text', NULL, '', 0);
INSERT INTO `report_section_settings` VALUES (34, 14, 'section_title', 'Title', 'text', NULL, 'Status timelines', 0);
INSERT INTO `report_section_settings` VALUES (36, 14, 'type', 'Type of nodes to display', 'select', NULL, '2', 0);
INSERT INTO `report_section_settings` VALUES (11, 12, 'section_description', 'Description', 'text', NULL, 'Security systems and in particular firewalls have become critical points within the network infrastructure of organisations and therefore being able to recover from a firewall failure timeously is of critical importance to an organisation\'s business continuity planning. \r\n<br><br>\r\nFirewall configurations and rulebases are often complex and have normally been created incrementally over a lengthly period of time. Rebuilding a firewall\'s configuration and rulebase by hand in a short space of time is therefore completely impractical and error prone. It is therefore imperitive that regular firewall backups be made. \r\n<br><br>\r\nThis report lists the backups that were made during the reporting period together with their size and status. It also indicates the backup schedules that exist.', 0);
INSERT INTO `report_section_settings` VALUES (12, 6, 'section_description', 'Description', 'text', NULL, 'The system availability report indicates the availability of the monitored system(s) during the reporting period. This graph indicates the percentage of uptime of the monitored system(s). \r\n<br><br>\r\nNote that uptime does not necessarily imply that the application(s) each of the systems were running or that the system\'s network interfaces were operational.\r\n', 0);
INSERT INTO `report_section_settings` VALUES (32, 13, 'section_title', 'Title ', 'text', NULL, 'Table of contents', 0);
INSERT INTO `report_section_settings` VALUES (37, 14, 'location', 'Show individual breadcrumbs', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (38, 5, 'section_description', 'Description', 'text', NULL, 'These charts indicate the percentage of time (calculated over all monitored attributes) spent in a particular status (normal, warning, critical, no data) during the reporting period. \r\n<br><br>\r\nA high percentage in normal status is ideal. The \"No data\" status could either indicate system downtime (see System availability above) or a problem with the configuration of a particular attribute (see Attribute status timelines below). \r\n<br><br>\r\nThe status assigned to a particular attribute being measured is dependent on the alerting thresholds configured for that attribute. \r\n', 0);
INSERT INTO `report_section_settings` VALUES (13, 5, 'table', 'Display a table', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (18, 8, 'section_title', 'Title ', 'text', NULL, 'System details', 0);
INSERT INTO `report_section_settings` VALUES (17, 1, 'section_title', 'Title ', 'text', NULL, 'Report description', 0);
INSERT INTO `report_section_settings` VALUES (19, 6, 'section_title', 'Title ', 'text', NULL, 'System availability', 0);
INSERT INTO `report_section_settings` VALUES (20, 5, 'section_title', 'Title ', 'text', NULL, 'Status summary', 0);
INSERT INTO `report_section_settings` VALUES (21, 10, 'section_title', 'Title ', 'text', NULL, 'Log', 0);
INSERT INTO `report_section_settings` VALUES (23, 12, 'section_title', 'Title ', 'text', NULL, 'Backups', 0);
INSERT INTO `report_section_settings` VALUES (25, 11, 'statusPeriodTable', 'Show status table', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (26, 6, 'pieChart', 'Show system pie chart', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (27, 6, 'location', 'Show breadcrumbs', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (28, 6, 'summary', 'Show overall pie chart', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (29, 1, 'section_description', 'Description', 'text', NULL, '', 0);
INSERT INTO `report_section_settings` VALUES (30, 12, 'location', 'Show individual breadcrumbs', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (31, 5, 'pieChart', 'Show snapshot pie charts', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (39, 11, 'section_description', 'Description', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (40, 14, 'section_description', 'Description', 'text', NULL, 'The timelines below indicate when each system was operating under normal, warning, critical and no data conditions as defined by the configured thresholds for each individual system attribute.<br><br>The status of a system at a point in time is calculated as the worst attribute status at that point in time. A critical status (red) is considered the worst status, followed by warning (orange), and then no data (purple).', 0);
INSERT INTO `report_section_settings` VALUES (41, 15, 'section_title_alt', 'Alternate title', 'text', NULL, 'MSS Monitor alert', 0);
INSERT INTO `report_section_settings` VALUES (42, 11, 'graphSize', 'Graph size', 'text', NULL, 'normal', 0);
INSERT INTO `report_section_settings` VALUES (43, 11, 'changeAdditionalData', 'Additional data', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (44, 18, 'section_title', 'Title', 'text', NULL, 'Top 10 viruses by alert count', 0);
INSERT INTO `report_section_settings` VALUES (45, 11, 'statusIgnore', 'Ignore certain statuses', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (46, 5, 'statusIgnore', 'Ignore certain statuses', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (47, 5, 'onlyEnvironment', 'Only environment', 'bool', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (48, 11, 'onlyEnvironment', 'Only environment', 'bool', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (49, 11, 'statusLabels', 'Status labels', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (50, 5, 'statusLabels', 'Status labels', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (51, 22, 'section_title', 'User access details', 'text', NULL, 'User access details', 0);
INSERT INTO `report_section_settings` VALUES (52, 23, 'section_title', 'User activity details', 'text', NULL, 'User activity details', 0);
INSERT INTO `report_section_settings` VALUES (53, 19, 'section_title', 'Title', 'text', NULL, 'Top 10 hosts by alerts', 0);
INSERT INTO `report_section_settings` VALUES (54, 18, 'byAlert', NULL, 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (55, 24, 'section_title', 'Section title', NULL, NULL, 'Top 10 viruses by alerts', 0);
INSERT INTO `report_section_settings` VALUES (56, 25, 'section_title', 'Section title', NULL, NULL, 'Top 10 viruses by alerted hosts', 0);
INSERT INTO `report_section_settings` VALUES (57, 26, 'section_title', 'Section title', NULL, NULL, 'Top 10 hosts by alerts', 0);
INSERT INTO `report_section_settings` VALUES (58, 27, 'section_title', 'Section title', NULL, NULL, 'Top 10 hosts by unique virus alerts', 0);
INSERT INTO `report_section_settings` VALUES (59, 225, 'section_title', 'Section title', NULL, NULL, 'New virus alerts', 0);
INSERT INTO `report_section_settings` VALUES (60, 24, 'section_description', 'Description', 'text', NULL, 'This section lists the top 10 viruses ordered according to the number of alerts that were received for that virus during the reporting period. The \"Hosts\" column lists the number of hosts that sent at least one alert for that virus during the reporting period.', 0);
INSERT INTO `report_section_settings` VALUES (61, 25, 'section_description', 'Description', 'text', NULL, 'This section lists the top 10 viruses ordered according to the number of hosts that generated at least one alert for that virus during the reporting period.', 0);
INSERT INTO `report_section_settings` VALUES (62, 26, 'section_description', 'Description', 'text', NULL, 'This section lists the top 10 hosts ordered according to the number of alerts that were received from that host during the reporting period. The unique viruses column lists the number of different virus alerts received from that host during the reporting period.', 0);
INSERT INTO `report_section_settings` VALUES (63, 27, 'section_description', 'Description', 'text', NULL, 'This section lists the top 10 hosts ordered according to the number of different virus alerts received from that host during the reporting period.', 0);
INSERT INTO `report_section_settings` VALUES (64, 225, 'section_description', 'Description', 'text', NULL, 'This section lists the viruses for which alerts were received during the reporting period for which an alert has never been received before.', 0);
INSERT INTO `report_section_settings` VALUES (65, 11, 'withCSV', 'Generate a csv', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (66, 226, 'section_title', 'Section title', 'text', NULL, 'Virus activity summary', 0);
INSERT INTO `report_section_settings` VALUES (67, 226, 'section_description', 'Description', 'text', NULL, 'This section provides a list of the viruses for which alerts were received during the reporting period. For each virus, the virus name, the number of alerts received for that virus and the number of unique hosts from which an alert for that virus was received is given. Also included are some details of the last alert received for that particular virus (date and time of the last alert, the object affected and the action taken)', 0);
INSERT INTO `report_section_settings` VALUES (68, 227, 'section_title', 'Section title', 'text', NULL, 'Virus activity detail', 0);
INSERT INTO `report_section_settings` VALUES (69, 227, 'section_description', 'Description', 'text', NULL, 'This section provides a list of the viruses for which alerts were received during the reporting period including a per host breakdown of the alerts received for each virus. The virus name, the number of alerts received for that virus and the number of unique hosts from which an alert for that virus was received is given. The per host breakdown includes the anti-virus version and definition/update details for that host and details of the last alert for that virus received from that host per affected object.', 0);
INSERT INTO `report_section_settings` VALUES (22, 11, 'section_title', 'Title', 'text', NULL, 'Activity summary', 0);
INSERT INTO `report_section_settings` VALUES (72, 228, 'section_title', 'Title', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (73, 229, 'section_title', 'Title', 'text', NULL, 'Host summary', 0);
INSERT INTO `report_section_settings` VALUES (74, 229, 'section_description', 'Description', 'text', NULL, 'The table below is a snapshot summary of host status per policy manager as at the end of the reporting period. ', 0);
INSERT INTO `report_section_settings` VALUES (75, 230, 'section_title', 'Title', 'text', NULL, 'IP address changes details', 0);
INSERT INTO `report_section_settings` VALUES (76, 231, 'section_title', 'Title', 'text', NULL, 'Alert summary', 0);
INSERT INTO `report_section_settings` VALUES (77, 231, 'section_description', 'Description', 'text', NULL, 'The table below is a summary of alerts received per policy manager during the reporting period.', 0);
INSERT INTO `report_section_settings` VALUES (78, 24, 'showDrilldown', 'Show drilldown', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (79, 25, 'showDrilldown', 'Show drilldown', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (80, 26, 'showDrilldown', 'Show drilldown', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (81, 27, 'showDrilldown', 'Show drilldown', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (82, 232, 'section_title', 'Title', 'text', NULL, 'IP address changes summary', 0);
INSERT INTO `report_section_settings` VALUES (84, 233, 'section_title', 'Title', 'text', NULL, 'System information', 0);
INSERT INTO `report_section_settings` VALUES (85, 234, 'section_title', 'Title', 'text', NULL, 'Template section', 0);
INSERT INTO `report_section_settings` VALUES (86, 235, 'section_title', 'Title', 'text', NULL, 'System backups', 0);
INSERT INTO `report_section_settings` VALUES (87, 236, 'section_title', 'Title', 'text', NULL, 'System information', 0);
INSERT INTO `report_section_settings` VALUES (88, 6, 'table', 'Display a table', 'bool', NULL, 'true', 0);
INSERT INTO `report_section_settings` VALUES (89, 6, 'show_headings', 'Show table headings', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (91, 11, 'show_headings', 'Show table headings', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (90, 14, 'show_headings', 'Show table headings', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (92, 5, 'statusOverTimeGraph', 'Show status over time graph', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (95, 5, 'show_headings', 'Show table headings', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (96, 6, 'top10Events', 'Show top 10 events', 'text', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (97, 5, 'statusOverTimeGraph_type', 'Node type for timelines', 'text', NULL, '2', 0);
INSERT INTO `report_section_settings` VALUES (98, 237, 'section_title', 'Title', 'text', NULL, 'Attribute details', 0);
INSERT INTO `report_section_settings` VALUES (99, 237, 'section_description', 'Description', 'text', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (100, 5, 'onlySystem', 'Only system', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (101, 5, 'top10Events', 'Show top 10 events', 'bool', NULL, 'false', 0);
INSERT INTO `report_section_settings` VALUES (102, 5, 'top10_notes', 'Top 10 event notes', 'array', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (103, 6, 'top10_notes', 'Top 10 event notes', 'array', NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (104, 237, 'top10_notes', 'Top 10 event notes', NULL, NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (107, 233, 'section_description', 'Description', 'text', NULL, 'The system information report lists the platform, operating system and application software version information for each system as at the time that the report was run.', 0);
INSERT INTO `report_section_settings` VALUES (106, 235, 'section_description', 'Description', 'text', NULL, 'The system backup report lists the configured backup schedule for each system as well as the details of the last successful backup obtained for each system.', 0);
INSERT INTO `report_section_settings` VALUES (108, 238, 'system_configuration', 'System configuration', NULL, NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (109, 239, 'attribute_configuration', 'Attribute configuration', NULL, NULL, NULL, 0);
INSERT INTO `report_section_settings` VALUES (110, 238, 'section_title', 'Section Title', 'text', NULL, 'System configuration', 0);
INSERT INTO `report_section_settings` VALUES (111, 239, 'section_title', 'Scetion Title', 'text', NULL, 'Attribute configuration', 0);
INSERT INTO `report_section_settings` VALUES (112, 238, 'section_description', 'Description', 'text', NULL, 'This section shows system specific configuration, in particular settings relating to communication failure as well as whether or not backups for the system are enabled.\r\n', 0);
INSERT INTO `report_section_settings` VALUES (113, 239, 'section_description', 'Description', 'text', NULL, 'This section shows attribute specific configuration. \"Threshold\" describes the condition which determines the status (normal, warning or critical) of a given attribute. \"Status delay\" is how long that value needs to be in breach of the threshold before the attribute is set to the corresponding status. \"Alert delay\" determines after how long an attribute must be in a particular status before the action described in the \"Action\" column is carried out.\r\n', 0);

-- ----------------------------
-- Table structure for report_template
-- ----------------------------
DROP TABLE IF EXISTS `report_template`;
CREATE TABLE `report_template`  (
  `report_template_id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`report_template_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_template
-- ----------------------------
INSERT INTO `report_template` VALUES (1, '<span id=\"top\"></span>			\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n<bookmark content=\"System details\" />\r\n		[[[configuration___2]]]\r\n<pagebreak>\r\n<bookmark content=\"System availability\" />\r\n		[[[configuration___4]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Status summary\" />\r\n		[[[configuration___3]]]\r\n<pagebreak>\r\n<bookmark content=\"Attribute status timelines\" />\r\n		[[[configuration___5]]]			\r\n<pagebreak>		\r\n<bookmark content=\"Attribute status change details\"/>\r\n		[[[configuration___14]]]			\r\n<pagebreak>\r\n<bookmark content=\"Attribute trend graphs\"/>\r\n		[[[configuration___8]]]\r\n<pagebreak>\r\n<bookmark content=\"Backups\" />\r\n		[[[configuration___9]]]\r\n	');
INSERT INTO `report_template` VALUES (5, '<hr>\r\n<img src=\"images/default_companylogo.gif\"> This report powered by ISA\r\n');
INSERT INTO `report_template` VALUES (7, '	<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"System availability\" />\r\n		[[[configuration___10]]]\r\n<pagebreak>\r\n<bookmark content=\"Status summary\" />\r\n\r\n		[[[configuration___11]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Backups\" />\r\n		[[[configuration___12]]]\r\n	\r\n\r\n');
INSERT INTO `report_template` VALUES (10, '\r\n<span id=\"top\"></span>			\r\n		[[[template___9]]]\r\n\r\n<bookmark content=\"Attribute trend graphs\"/>\r\n		[[[configuration___8]]]\r\n<pagebreak>\r\n<bookmark content=\"Attribute status timelines\" />\r\n		[[[configuration___5]]]			\r\n		\r\n');
INSERT INTO `report_template` VALUES (9, '[[[report_description___0]]]\r\n[[[report_toc___0]]]');
INSERT INTO `report_template` VALUES (11, '<table class=\"summary[[[configuration___20]]]\" cellpadding=0 cellspacing=0>	\r\n		<tr><td class=\'heading[[[configuration___20]]]\'>MSS Monitor alert</td></tr>\r\n		\r\n		<tr><td>[[[configuration___17]]]</td></tr>\r\n		<tr><td>[[[configuration___19]]]</td></tr>		\r\n</table>\r\n		');
INSERT INTO `report_template` VALUES (12, '\r\n\r\n		[[[report_description___0]]]\r\n		[[[configuration___21]]]\r\n');
INSERT INTO `report_template` VALUES (14, '	<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n<pagebreak>\r\n<bookmark content=\"Top 10 infected hosts by infection count\" />\r\n		[[[configuration___26]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 infected hosts by infection count\" />\r\n		[[[configuration___35]]]\r\n<pagebreak>\r\n	\r\n');
INSERT INTO `report_template` VALUES (15, '<span id=\"top\"></span>			\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n<bookmark content=\"Status summary\" />\r\n		[[[configuration___29]]]\r\n<pagebreak>\r\n<bookmark content=\"Attribute status timelines\" />\r\n		[[[configuration___30]]]			\r\n<pagebreak>		\r\n<bookmark content=\"Attribute status change details\"/>\r\n		[[[configuration___31]]]		');
INSERT INTO `report_template` VALUES (16, '<span id=\"top\"></span> <bookmark content=\"User log details\" /> [[[template___9]]][[[configuration___32]]]');
INSERT INTO `report_template` VALUES (17, '<span id=\"top\"></span> <bookmark content=\"User activity\" /> [[[template___9]]][[[configuration___34]]]');
INSERT INTO `report_template` VALUES (18, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n\r\n<bookmark content=\"Top 10 viruses by alert\" />\r\n		[[[configuration___40]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 viruses by alert\" />\r\n		[[[configuration___36]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 viruses by alerted hosts\" />\r\n		[[[configuration___37]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 hosts by alert\" />\r\n		[[[configuration___38]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 hosts by unique alert\" />\r\n		[[[configuration___39]]]\r\n\r\n<pagebreak>\r\n\r\n<bookmark content=\"Top 10 new viruses\" />\r\n		[[[configuration___41]]]\r\n	\r\n');
INSERT INTO `report_template` VALUES (19, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<bookmark content=\"Virus activity summary\" />\r\n		[[[configuration___43]]]');
INSERT INTO `report_template` VALUES (20, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<bookmark content=\"Virus activity detail\" />\r\n		[[[configuration___44]]]');
INSERT INTO `report_template` VALUES (21, '<span id=\"top\"></span>			\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n<bookmark content=\"Status summary\" />\r\n		[[[configuration___29]]]\r\n<pagebreak>\r\n<bookmark content=\"Attribute status timelines\" />\r\n		[[[configuration___30]]]			\r\n<pagebreak>		\r\n<bookmark content=\"Attribute status change details\"/>\r\n		[[[configuration___31]]]');
INSERT INTO `report_template` VALUES (22, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Host summary\" />\r\n		[[[configuration___48]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Virus summary\" />\r\n		[[[configuration___50]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 viruses by alert\" />\r\n		[[[configuration___51]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 viruses by alerted hosts\" />\r\n		[[[configuration___52]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 hosts by alert\" />\r\n		[[[configuration___53]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"Top 10 hosts by unique alert\" />\r\n		[[[configuration___54]]]');
INSERT INTO `report_template` VALUES (23, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<bookmark content=\"IP address changes summary\" />\r\n		[[[configuration___55]]]\r\n\r\n<pagebreak>\r\n<bookmark content=\"IP address changes details\" />\r\n		[[[configuration___49]]]');
INSERT INTO `report_template` VALUES (24, '	<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<pagebreak />\r\n<bookmark content=\"System information\" />\r\n		[[[configuration___63]]]\r\n\r\n<pagebreak />\r\n<bookmark content=\"System availability\" />\r\n		[[[configuration___65]]]\r\n<pagebreak />\r\n<bookmark content=\"System status\" />\r\n		[[[configuration___67]]]\r\n<pagebreak />\r\n<bookmark content=\"System backups\" />\r\n		[[[configuration___64]]]\r\n\r\n');
INSERT INTO `report_template` VALUES (25, '	<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<pagebreak />\r\n<bookmark content=\"System information\" />\r\n		[[[configuration___68]]]\r\n<pagebreak />\r\n<bookmark content=\"System status\" />\r\n		[[[configuration___70]]]\r\n\r\n<pagebreak />\r\n<bookmark content=\"System status\" />\r\n		[[[configuration___71]]]\r\n');
INSERT INTO `report_template` VALUES (26, '<span id=\"top\"></span>			\r\n <bookmark content=\"Report description\" />\r\n 		[[[template___9]]]\r\n <bookmark content=\"Status summary\" />\r\n 		[[[configuration___72]]]\r\n <pagebreak>\r\n <bookmark content=\"Status timelines\" />\r\n 		[[[configuration___73]]]			\r\n <pagebreak>		\r\n <bookmark content=\"Status change details\"/>\r\n 		[[[configuration___74]]]');
INSERT INTO `report_template` VALUES (27, '<span id=\"top\"></span>\r\n<bookmark content=\"Report description\" />\r\n		[[[template___9]]]\r\n\r\n<pagebreak />\r\n<bookmark content=\"System configuration\" />\r\n		[[[configuration___75]]]\r\n<pagebreak />\r\n<bookmark content=\"Attribute configuration\" />\r\n		[[[configuration___76]]]');
INSERT INTO `report_template` VALUES (28, '[[[configuration___77]]]');
INSERT INTO `report_template` VALUES (29, '[[[configuration___78]]]');

-- ----------------------------
-- Table structure for report_type
-- ----------------------------
DROP TABLE IF EXISTS `report_type`;
CREATE TABLE `report_type`  (
  `report_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `long_description` varchar(512) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `path` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `ported` tinyint(2) NULL DEFAULT NULL,
  `report_template_id` int(11) NULL DEFAULT NULL,
  `interface` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`report_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 30 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_type
-- ----------------------------
INSERT INTO `report_type` VALUES (1, 'System activity report', 'Current system MSS report', '/reports/tech_report.php', 1, NULL, 0);
INSERT INTO `report_type` VALUES (2, 'General summary report', 'Current general summary activity MSS report', '/reports/exec_report2.php', 1, NULL, NULL);
INSERT INTO `report_type` VALUES (4, 'Attribute trends report', 'Current attribute trends report', '/reports/attr_trends_report.php', 1, NULL, NULL);
INSERT INTO `report_type` VALUES (7, 'Summary system report', 'Summary system report', NULL, 0, 7, 1);
INSERT INTO `report_type` VALUES (6, 'System report', 'System report', NULL, 0, 1, 1);
INSERT INTO `report_type` VALUES (9, 'Attribute report', 'Attribute trends report', NULL, 0, 10, 1);
INSERT INTO `report_type` VALUES (10, 'Attribute alert', 'Attribute alert', NULL, 0, 11, 0);
INSERT INTO `report_type` VALUES (11, 'Policy installation report', 'Policy installation report', NULL, 0, 12, 1);
INSERT INTO `report_type` VALUES (12, 'F-Secure report', 'F-Secure report', NULL, 0, 14, NULL);
INSERT INTO `report_type` VALUES (13, 'Environment availability report (branch business hours)', 'Environment availability report (branch business hours)', NULL, 0, 15, 1);
INSERT INTO `report_type` VALUES (14, 'User access report', 'User access report', NULL, 0, 16, 1);
INSERT INTO `report_type` VALUES (15, 'User activity report', 'User activity report', NULL, 0, 17, 1);
INSERT INTO `report_type` VALUES (16, 'Anti-virus activity report', 'Anti-virus activity report', NULL, NULL, 18, 1);
INSERT INTO `report_type` VALUES (17, 'Virus activity report summary', 'Virus activity report summary', NULL, NULL, 19, 1);
INSERT INTO `report_type` VALUES (18, 'Virus activity report detail', 'Virus activity report detail', NULL, NULL, 20, 1);
INSERT INTO `report_type` VALUES (19, 'Environment availability report', 'Environment availability report', NULL, NULL, 21, 1);
INSERT INTO `report_type` VALUES (21, 'Anti-Virus summary', 'Anti-Virus summary', NULL, NULL, 22, 1);
INSERT INTO `report_type` VALUES (22, 'IP address changes', 'IP address changes', NULL, NULL, 23, 1);
INSERT INTO `report_type` VALUES (24, 'System summary operational report', 'System summary operational report', NULL, NULL, 24, 1);
INSERT INTO `report_type` VALUES (25, 'System operational report', 'System operational report', NULL, NULL, 25, 1);
INSERT INTO `report_type` VALUES (26, 'Environment status report', 'Environment status report', NULL, NULL, 26, NULL);
INSERT INTO `report_type` VALUES (27, 'Monitoring configuration report', 'Monitoring configuration report', NULL, NULL, 27, 1);
INSERT INTO `report_type` VALUES (28, 'Network topology report', 'Network topology report', NULL, NULL, 28, 1);
INSERT INTO `report_type` VALUES (29, 'Environment monitoring configuration report', 'Environment monitoring configuration report', NULL, NULL, 29, 1);

-- ----------------------------
-- Table structure for report_type_settings
-- ----------------------------
DROP TABLE IF EXISTS `report_type_settings`;
CREATE TABLE `report_type_settings`  (
  `report_type_settings_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type_id` int(11) NULL DEFAULT NULL,
  `report_type_settings_type_id` int(11) NULL DEFAULT NULL,
  `setting_value` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`report_type_settings_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 42 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_type_settings
-- ----------------------------
INSERT INTO `report_type_settings` VALUES (1, 7, 1, '1');
INSERT INTO `report_type_settings` VALUES (2, 6, 1, '1');
INSERT INTO `report_type_settings` VALUES (3, 9, 1, '1');
INSERT INTO `report_type_settings` VALUES (4, 11, 1, '0');
INSERT INTO `report_type_settings` VALUES (5, 13, 1, '0');
INSERT INTO `report_type_settings` VALUES (6, 14, 1, '1');
INSERT INTO `report_type_settings` VALUES (7, 15, 1, '0');
INSERT INTO `report_type_settings` VALUES (8, 16, 1, '0');
INSERT INTO `report_type_settings` VALUES (9, 17, 1, '0');
INSERT INTO `report_type_settings` VALUES (10, 18, 1, '0');
INSERT INTO `report_type_settings` VALUES (11, 19, 1, '1');
INSERT INTO `report_type_settings` VALUES (12, 21, 1, '0');
INSERT INTO `report_type_settings` VALUES (13, 22, 1, '0');
INSERT INTO `report_type_settings` VALUES (19, 12, 1, '0');
INSERT INTO `report_type_settings` VALUES (18, 10, 1, '1');
INSERT INTO `report_type_settings` VALUES (20, 1, 1, '0');
INSERT INTO `report_type_settings` VALUES (21, 2, 1, '0');
INSERT INTO `report_type_settings` VALUES (22, 4, 1, '1');
INSERT INTO `report_type_settings` VALUES (25, 24, 1, '1');
INSERT INTO `report_type_settings` VALUES (26, 24, 4, '1');
INSERT INTO `report_type_settings` VALUES (27, 25, 1, '1');
INSERT INTO `report_type_settings` VALUES (28, 25, 4, '1');
INSERT INTO `report_type_settings` VALUES (29, 13, 3, 'This report provides the availability statistics for the monitored environment attributes during operational business hours for the reporting period. For the purposes of this report, operational business hours are defined as:<br><br>Mon - Fri&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8am to 7pm<br>Sat - Sun&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8am to 3pm<br><br>An environment attribute is monitored by sending network probes to a remote system on a periodic basis (every 5 minutes). A monitored environment attribute is regarded as non-available for that 5 minute period when no response is received from the remote system.');
INSERT INTO `report_type_settings` VALUES (30, 19, 3, 'This report provides the availability statistics for the monitored environment attributes during the reporting period.<br><br>An environment attribute is monitored by sending network probes to a remote system on a periodic basis (every 5 minutes). A monitored environment attribute is regarded as non-available for that 5 minute period when no response is received from the remote system.');
INSERT INTO `report_type_settings` VALUES (31, 26, 1, '1');
INSERT INTO `report_type_settings` VALUES (32, 27, 4, 'alt');
INSERT INTO `report_type_settings` VALUES (34, 27, 3, 'This report provides a snapshot of the current Pulse monitoring configuration.');
INSERT INTO `report_type_settings` VALUES (35, 27, 5, '1');
INSERT INTO `report_type_settings` VALUES (36, 28, 1, '1');
INSERT INTO `report_type_settings` VALUES (37, 28, 6, '1');
INSERT INTO `report_type_settings` VALUES (38, 28, 5, '1');
INSERT INTO `report_type_settings` VALUES (39, 29, 1, '1');
INSERT INTO `report_type_settings` VALUES (40, 29, 6, '1');
INSERT INTO `report_type_settings` VALUES (41, 29, 5, '1');

-- ----------------------------
-- Table structure for report_type_settings_custom
-- ----------------------------
DROP TABLE IF EXISTS `report_type_settings_custom`;
CREATE TABLE `report_type_settings_custom`  (
  `report_type_settings_custom_id` int(11) NOT NULL AUTO_INCREMENT,
  `report_type_id` int(11) NULL DEFAULT NULL,
  `report_type_settings_type_id` int(11) NULL DEFAULT NULL,
  `setting_value` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`report_type_settings_custom_id`) USING BTREE,
  UNIQUE INDEX `NewIndex1`(`report_type_id`, `report_type_settings_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 31 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_type_settings_custom
-- ----------------------------

-- ----------------------------
-- Table structure for report_type_settings_type
-- ----------------------------
DROP TABLE IF EXISTS `report_type_settings_type`;
CREATE TABLE `report_type_settings_type`  (
  `report_type_settings_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `tag` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `type` varbinary(20) NULL DEFAULT NULL,
  `description` varbinary(40) NULL DEFAULT NULL,
  `customizable` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`report_type_settings_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report_type_settings_type
-- ----------------------------
INSERT INTO `report_type_settings_type` VALUES (1, 'enabled', 0x626F6F6C, 0x456E61626C6564, 1);
INSERT INTO `report_type_settings_type` VALUES (2, 'name', 0x74657874, 0x4E616D6520286E6F7420757365642079657429, 0);
INSERT INTO `report_type_settings_type` VALUES (3, 'description', 0x6C6F6E675F74657874, 0x4465736372697074696F6E, 1);
INSERT INTO `report_type_settings_type` VALUES (4, 'format', 0x74657874, 0x5374796C6520666F726D6174, 0);
INSERT INTO `report_type_settings_type` VALUES (5, 'no_period', 0x626F6F6C, 0x4E6F207265706F727420706572696F64, 0);
INSERT INTO `report_type_settings_type` VALUES (6, 'hide_csv_footer', 0x626F6F6C, 0x4869646520612043535620666F6F746572, 0);

-- ----------------------------
-- Table structure for rrd_manager
-- ----------------------------
DROP TABLE IF EXISTS `rrd_manager`;
CREATE TABLE `rrd_manager`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checktype_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rebuild` int(1) NULL DEFAULT NULL,
  `testType` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time_period` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `schedule_timestamp` int(25) NULL DEFAULT NULL,
  `run_at` int(25) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `hostname`, `checktype_name`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 89 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of rrd_manager
-- ----------------------------

-- ----------------------------
-- Table structure for servertype
-- ----------------------------
DROP TABLE IF EXISTS `servertype`;
CREATE TABLE `servertype`  (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `servertype` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `siteid` mediumint(9) NOT NULL DEFAULT 0,
  `n_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'MSS OnSite',
  `n_from` varchar(150) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'mss@sitename.mss.isa.co.za',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 41 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = 'Configuration Information' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servertype
-- ----------------------------
INSERT INTO `servertype` VALUES (40, 'ONSITE', 170, 'MSS OnSite', 'mss@sitename.mss.isa.co.za');

-- ----------------------------
-- Table structure for snmp_config
-- ----------------------------
DROP TABLE IF EXISTS `snmp_config`;
CREATE TABLE `snmp_config`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `ip_addr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `community_string` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `last_timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version` varchar(2) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snmp_config
-- ----------------------------

-- ----------------------------
-- Table structure for snmp_temp
-- ----------------------------
DROP TABLE IF EXISTS `snmp_temp`;
CREATE TABLE `snmp_temp`  (
  `snmp_temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `menuTree_id` int(11) NULL DEFAULT NULL,
  `monitor_mib_linking_id` int(11) NULL DEFAULT NULL,
  `value_key` varchar(256) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `actual_value` varchar(1024) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`snmp_temp_id`) USING BTREE,
  UNIQUE INDEX `noDuplicate`(`menuTree_id`, `monitor_mib_linking_id`, `value_key`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 3269 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of snmp_temp
-- ----------------------------

-- ----------------------------
-- Table structure for ssh_config
-- ----------------------------
DROP TABLE IF EXISTS `ssh_config`;
CREATE TABLE `ssh_config`  (
  `siteid` int(11) NOT NULL DEFAULT 0,
  `hostid` int(11) NOT NULL DEFAULT 0,
  `ip_addr` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ssh_username` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ssh_password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `ssh_enable_password` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `last_timestamp` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `reset_command_period` int(11) NULL DEFAULT 0,
  `reset_command_check` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`siteid`, `hostid`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ssh_config
-- ----------------------------

-- ----------------------------
-- Table structure for ssh_temp
-- ----------------------------
DROP TABLE IF EXISTS `ssh_temp`;
CREATE TABLE `ssh_temp`  (
  `ssh_temp_id` int(11) NOT NULL AUTO_INCREMENT,
  `host_id` int(11) NULL DEFAULT NULL,
  `key` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `value` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `timestamp` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ssh_temp_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 16 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ssh_temp
-- ----------------------------

-- ----------------------------
-- Table structure for system_application
-- ----------------------------
DROP TABLE IF EXISTS `system_application`;
CREATE TABLE `system_application`  (
  `application_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`application_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 12 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_application
-- ----------------------------

-- ----------------------------
-- Table structure for system_application_tests
-- ----------------------------
DROP TABLE IF EXISTS `system_application_tests`;
CREATE TABLE `system_application_tests`  (
  `system_application_test_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_id` int(11) NOT NULL DEFAULT 0,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `check_type_id` int(11) NOT NULL DEFAULT 0,
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`system_application_test_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of system_application_tests
-- ----------------------------

-- ----------------------------
-- Table structure for system_data_category
-- ----------------------------
DROP TABLE IF EXISTS `system_data_category`;
CREATE TABLE `system_data_category`  (
  `system_data_category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `system_format_item_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`system_data_category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 5 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_data_category
-- ----------------------------
INSERT INTO `system_data_category` VALUES (1, 'Operating system information', 18);
INSERT INTO `system_data_category` VALUES (2, 'Platform information', 1);
INSERT INTO `system_data_category` VALUES (3, 'Application information', 39);
INSERT INTO `system_data_category` VALUES (4, 'Network information', 148);

-- ----------------------------
-- Table structure for system_os
-- ----------------------------
DROP TABLE IF EXISTS `system_os`;
CREATE TABLE `system_os`  (
  `os_id` int(11) NOT NULL AUTO_INCREMENT,
  `os_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`os_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_os
-- ----------------------------

-- ----------------------------
-- Table structure for system_os_application_link
-- ----------------------------
DROP TABLE IF EXISTS `system_os_application_link`;
CREATE TABLE `system_os_application_link`  (
  `system_os_application_link_id` int(11) NOT NULL AUTO_INCREMENT,
  `application_id` int(11) NOT NULL DEFAULT 0,
  `os_id` int(11) NOT NULL DEFAULT 0,
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`system_os_application_link_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 9 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of system_os_application_link
-- ----------------------------

-- ----------------------------
-- Table structure for system_template
-- ----------------------------
DROP TABLE IF EXISTS `system_template`;
CREATE TABLE `system_template`  (
  `template_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `application_id` int(11) NOT NULL DEFAULT 0,
  `os_id` int(11) NOT NULL DEFAULT 0,
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`template_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 10 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_template
-- ----------------------------

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp`  (
  `monitor_checktype_linking_id` int(11) NOT NULL AUTO_INCREMENT,
  `monitor_platform_id` int(11) NULL DEFAULT 0,
  `monitor_operatingSystem_id` int(11) NULL DEFAULT 0,
  `monitor_application_id` int(11) NULL DEFAULT 0,
  `monitor_agent_id` int(11) NULL DEFAULT 0,
  `monitor_structure_id` int(11) NULL DEFAULT 0,
  `monitor_category_id` int(11) NULL DEFAULT 0,
  `monitor_subCategory_id` int(11) NULL DEFAULT 0,
  `monitor_mib_linking_id` int(11) NULL DEFAULT 0,
  `checktype_id` int(11) NULL DEFAULT 0,
  `default` int(1) NULL DEFAULT 1,
  PRIMARY KEY (`monitor_checktype_linking_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1156 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of temp
-- ----------------------------
INSERT INTO `temp` VALUES (1052, 8, 8, 0, 14, 0, 1, 0, 0, 28, 0);
INSERT INTO `temp` VALUES (1053, 8, 8, 0, 14, 0, 1, 0, 0, 129, 1);
INSERT INTO `temp` VALUES (987, 8, 8, 0, 14, 0, 1, 0, 0, 75, 1);
INSERT INTO `temp` VALUES (992, 8, 8, 0, 14, 0, 1, 0, 0, 7, 1);
INSERT INTO `temp` VALUES (997, 8, 8, 0, 14, 0, 1, 0, 0, 63, 1);
INSERT INTO `temp` VALUES (983, 8, 8, 0, 14, 0, 1, 0, 0, 5, 1);
INSERT INTO `temp` VALUES (1054, 8, 8, 0, 14, 0, 2, 0, 0, 6, 1);
INSERT INTO `temp` VALUES (1055, 8, 8, 0, 14, 0, 2, 0, 0, 11, 1);
INSERT INTO `temp` VALUES (1056, 8, 8, 0, 14, 0, 2, 0, 0, 10, 1);
INSERT INTO `temp` VALUES (1057, 8, 8, 0, 14, 0, 2, 0, 0, 8, 1);
INSERT INTO `temp` VALUES (981, 8, 8, 12, 14, 0, 3, 0, 0, 17, 1);
INSERT INTO `temp` VALUES (1061, 8, 8, 31, 14, 0, 3, 0, 0, 40, 1);
INSERT INTO `temp` VALUES (1062, 8, 8, 31, 14, 0, 3, 0, 0, 41, 1);
INSERT INTO `temp` VALUES (1063, 8, 8, 31, 14, 0, 3, 0, 0, 42, 1);
INSERT INTO `temp` VALUES (1064, 8, 8, 0, 14, 0, 1, 0, 0, 112, 1);
INSERT INTO `temp` VALUES (1123, 8, 8, 12, 14, 0, 3, 0, 0, 218, 1);

-- ----------------------------
-- Table structure for template_attribute_config
-- ----------------------------
DROP TABLE IF EXISTS `template_attribute_config`;
CREATE TABLE `template_attribute_config`  (
  `template_attribute_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_config_id` int(11) NOT NULL DEFAULT 0,
  `warning_threshold` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `critical_threshold` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `w_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `w_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_sd` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_ad` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `c_acb` int(3) UNSIGNED NOT NULL DEFAULT 0,
  `check_gather_type_id` int(11) NOT NULL DEFAULT 1,
  `rrd_max` varchar(10) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '',
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`template_attribute_config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 353 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of template_attribute_config
-- ----------------------------

-- ----------------------------
-- Table structure for template_config
-- ----------------------------
DROP TABLE IF EXISTS `template_config`;
CREATE TABLE `template_config`  (
  `template_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `menu_level_type_id` int(11) NOT NULL DEFAULT 0,
  `item_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `template_config_full_id` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `list_position` int(11) NOT NULL DEFAULT 999,
  `check_type_id` int(11) NOT NULL DEFAULT 0,
  `enabled` char(1) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT '1',
  PRIMARY KEY (`template_config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 76 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of template_config
-- ----------------------------

-- ----------------------------
-- Table structure for test_type
-- ----------------------------
DROP TABLE IF EXISTS `test_type`;
CREATE TABLE `test_type`  (
  `test_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `test_type` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  PRIMARY KEY (`test_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 4 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_type
-- ----------------------------
INSERT INTO `test_type` VALUES (1, 'simple');
INSERT INTO `test_type` VALUES (2, 'complex');
INSERT INTO `test_type` VALUES (3, 'remote');

-- ----------------------------
-- Table structure for time_period_config
-- ----------------------------
DROP TABLE IF EXISTS `time_period_config`;
CREATE TABLE `time_period_config`  (
  `time_period_config_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_period_type_id` int(11) NOT NULL DEFAULT 0,
  `days` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `start_hour` smallint(5) NULL DEFAULT 0,
  `start_min` smallint(5) NULL DEFAULT 0,
  `end_hour` smallint(5) NULL DEFAULT 23,
  `end_min` smallint(5) NULL DEFAULT 59,
  PRIMARY KEY (`time_period_config_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_period_config
-- ----------------------------
INSERT INTO `time_period_config` VALUES (1, 1, '1,2,3,4,5', 8, 0, 17, 0);
INSERT INTO `time_period_config` VALUES (2, 2, '1,2,3,4,5', 17, 0, 7, 59);
INSERT INTO `time_period_config` VALUES (3, 3, '6,0', 0, 0, 23, 59);
INSERT INTO `time_period_config` VALUES (4, 4, '7', 0, 0, 23, 59);
INSERT INTO `time_period_config` VALUES (5, 6, '1,2,3,4,5,6,0', 0, 0, 23, 59);

-- ----------------------------
-- Table structure for time_period_type
-- ----------------------------
DROP TABLE IF EXISTS `time_period_type`;
CREATE TABLE `time_period_type`  (
  `time_period_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `time_period_name` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '',
  `priority` int(11) NULL DEFAULT 99,
  PRIMARY KEY (`time_period_type_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 8 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of time_period_type
-- ----------------------------
INSERT INTO `time_period_type` VALUES (1, 'Office hours', 5);
INSERT INTO `time_period_type` VALUES (2, 'After hours', 4);
INSERT INTO `time_period_type` VALUES (3, 'Weekend hours', 3);
INSERT INTO `time_period_type` VALUES (4, 'Public Holidays', 2);
INSERT INTO `time_period_type` VALUES (5, 'Special hours', 1);
INSERT INTO `time_period_type` VALUES (6, 'Default', 6);

-- ----------------------------
-- Table structure for treeState
-- ----------------------------
DROP TABLE IF EXISTS `treeState`;
CREATE TABLE `treeState`  (
  `treeState_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tree_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `menuTree_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `treeStateType_id` int(10) UNSIGNED NULL DEFAULT NULL,
  `state` int(10) UNSIGNED NULL DEFAULT NULL,
  `stamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Used MySQL timestamp here for the ON UPDATE feature',
  `old` tinyint(4) NULL DEFAULT 0 COMMENT 'Use to distinguish old rows upon remote tree import',
  PRIMARY KEY (`treeState_id`) USING BTREE,
  UNIQUE INDEX `uniqueRule`(`tree_id`, `menuTree_id`, `treeStateType_id`) USING BTREE,
  INDEX `treeIndex`(`tree_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2552 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of treeState
-- ----------------------------

-- ----------------------------
-- Table structure for treeStateLatestBlock
-- ----------------------------
DROP TABLE IF EXISTS `treeStateLatestBlock`;
CREATE TABLE `treeStateLatestBlock`  (
  `treeStateLatestBlock_id` int(11) NOT NULL AUTO_INCREMENT,
  `hostname` varchar(128) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `hash` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `stamp` int(11) NULL DEFAULT NULL,
  `block` mediumtext CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`treeStateLatestBlock_id`) USING BTREE,
  UNIQUE INDEX `uniqueKey`(`hostname`, `hash`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of treeStateLatestBlock
-- ----------------------------

-- ----------------------------
-- Table structure for treeStateType
-- ----------------------------
DROP TABLE IF EXISTS `treeStateType`;
CREATE TABLE `treeStateType`  (
  `treeStateType_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(32) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `niceName` varchar(64) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`treeStateType_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 7 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of treeStateType
-- ----------------------------
INSERT INTO `treeStateType` VALUES (1, 'status', 'Visible status');
INSERT INTO `treeStateType` VALUES (2, 'comms', 'Communication status');
INSERT INTO `treeStateType` VALUES (3, 'underInvestgation', 'Under investigation');
INSERT INTO `treeStateType` VALUES (4, 'underInvestgation_suppressRollup', 'Under investigation - Suppress rollup');
INSERT INTO `treeStateType` VALUES (5, 'underInvestgation_suppressAlerts', 'Under investigation - Suppress alerts');
INSERT INTO `treeStateType` VALUES (6, 'agent_outdated', 'Agent out of date');

-- ----------------------------
-- Table structure for underInvestigation
-- ----------------------------
DROP TABLE IF EXISTS `underInvestigation`;
CREATE TABLE `underInvestigation`  (
  `underInvestigation_id` int(11) NOT NULL AUTO_INCREMENT,
  `auditTypeId` int(11) NOT NULL,
  `menuTree_id` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `opening_comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `closing_comment` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `hostname` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expiryDate` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL,
  `start` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `end` timestamp NULL DEFAULT NULL,
  `suppress_alerts` int(11) NULL DEFAULT 1,
  `suppress_rollup` int(11) NULL DEFAULT 1,
  `category_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`underInvestigation_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 306 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of underInvestigation
-- ----------------------------

-- ----------------------------
-- Table structure for underInvestigation_categories
-- ----------------------------
DROP TABLE IF EXISTS `underInvestigation_categories`;
CREATE TABLE `underInvestigation_categories`  (
  `category_id` int(20) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `default_categ` smallint(1) NULL DEFAULT 0,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 2 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of underInvestigation_categories
-- ----------------------------

-- ----------------------------
-- View structure for checktype_with_links
-- ----------------------------
DROP VIEW IF EXISTS `checktype_with_links`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `checktype_with_links` AS select `checktype`.`name` AS `name`,`checktype`.`type` AS `type`,`checktype`.`abreviation` AS `abreviation`,`checktype`.`nice_name` AS `nice_name`,`checktype`.`description` AS `description`,`checktype`.`long_description` AS `long_description`,`checktype`.`category` AS `category`,`checktype`.`agent_name` AS `agent_name`,`checktype`.`enabled` AS `enabled`,`checktype`.`port` AS `port`,`checktype`.`interface_category` AS `interface_category`,`checktype`.`variable_status` AS `variable_status`,`checktype`.`graph_max` AS `graph_max`,`checktype`.`graph_min` AS `graph_min`,`checktype`.`graph_decimals` AS `graph_decimals`,`checktype`.`graph_limit_axis` AS `graph_limit_axis`,`checktype`.`alt_source` AS `alt_source`,`checktype`.`value_tags` AS `value_tags`,`monitor_platform`.`name` AS `monitor_platform__name`,`monitor_category`.`name` AS `monitor_category__name`,`monitor_operatingSystem`.`name` AS `monitor_operatingSystem__name`,`monitor_agent`.`name` AS `monitor_agent__name`,`monitor_application`.`name` AS `monitor_application__name`,`monitor_backup`.`name` AS `monitor_backup__name`,`monitor_checktype_linking`.`monitor_checktype_linking_id` AS `monitor_checktype_linking_id`,`monitor_checktype_linking`.`monitor_platform_id` AS `monitor_platform_id`,`monitor_checktype_linking`.`monitor_operatingSystem_id` AS `monitor_operatingSystem_id`,`monitor_checktype_linking`.`monitor_application_id` AS `monitor_application_id`,`monitor_checktype_linking`.`monitor_agent_id` AS `monitor_agent_id`,`monitor_checktype_linking`.`monitor_structure_id` AS `monitor_structure_id`,`monitor_checktype_linking`.`monitor_category_id` AS `monitor_category_id`,`monitor_checktype_linking`.`monitor_subCategory_id` AS `monitor_subCategory_id`,`monitor_checktype_linking`.`monitor_mib_linking_id` AS `monitor_mib_linking_id`,`monitor_checktype_linking`.`checktype_id` AS `checktype_id`,`monitor_checktype_linking`.`default` AS `default`,`monitor_checktype_default`.`default_type_id` AS `default_type_id`,`monitor_checktype_default`.`threshold` AS `threshold`,`monitor_checktype_default`.`warning_status_delay` AS `warning_status_delay`,`monitor_checktype_default`.`critical_status_delay` AS `critical_status_delay`,`monitor_checktype_default`.`warning_alert_delay` AS `warning_alert_delay`,`monitor_checktype_default`.`critical_alert_delay` AS `critical_alert_delay`,`monitor_checktype_default`.`notify_warning` AS `notify_warning`,`monitor_checktype_default`.`notify_critical` AS `notify_critical` from (((((((((`monitor_checktype_linking` left join `checktype` on((`monitor_checktype_linking`.`checktype_id` = `checktype`.`id`))) left join `monitor_checktype_default` on((`monitor_checktype_linking`.`monitor_checktype_linking_id` = `monitor_checktype_default`.`monitor_checktype_linking_id`))) left join `monitor_platform` on((`monitor_checktype_linking`.`monitor_platform_id` = `monitor_platform`.`monitor_platform_id`))) left join `monitor_operatingSystem` on((`monitor_checktype_linking`.`monitor_operatingSystem_id` = `monitor_operatingSystem`.`monitor_operatingSystem_id`))) left join `monitor_agent` on((`monitor_checktype_linking`.`monitor_agent_id` = `monitor_agent`.`monitor_agent_id`))) left join `monitor_application` on((`monitor_checktype_linking`.`monitor_application_id` = `monitor_application`.`monitor_application_id`))) left join `monitor_category` on((`monitor_checktype_linking`.`monitor_category_id` = `monitor_category`.`monitor_category_id`))) left join `monitor_backup_linking` on(((`monitor_checktype_linking`.`monitor_structure_id` = `monitor_backup_linking`.`monitor_structure_id`) and (`monitor_checktype_linking`.`monitor_platform_id` = `monitor_backup_linking`.`monitor_platform_id`) and (`monitor_checktype_linking`.`monitor_operatingSystem_id` = `monitor_backup_linking`.`monitor_operatingSystem_id`) and (`monitor_checktype_linking`.`monitor_agent_id` = `monitor_backup_linking`.`monitor_agent_id`)))) left join `monitor_backup` on((`monitor_backup_linking`.`monitor_backup_id` = `monitor_backup`.`monitor_backup_id`))) where ((`checktype`.`nice_name` = 'Load average') or (`checktype`.`nice_name` = 'Percentage memory free') or (`checktype`.`nice_name` = 'Percentage CPU utilisation') or (`checktype`.`nice_name` = 'Network throughput outbound (Kbps)') or (`checktype`.`nice_name` = 'Network throughput outbound (Kbps') or (`checktype`.`nice_name` = 'Uptime') or (`checktype`.`nice_name` = 'Interface throughput inbound (Kbps)') or (`checktype`.`nice_name` = 'Interface throughput outbound (Kbps)') or (`checktype`.`nice_name` = 'Interface status') or (`checktype`.`nice_name` = 'Network errors per interface') or (`checktype`.`nice_name` = 'Percentage CPU utilisation per core'));

-- ----------------------------
-- Records of underInvestigation_categories
-- ----------------------------
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 62, 1, 1, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 66, 1, 1, 0, 1, 0, 1, 0, 0, 39, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 67, 1, 1, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Operating system', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 68, 1, 1, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 70, 1, 1, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 90, 5, 4, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 94, 5, 4, 0, 1, 0, 1, 0, 0, 39, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 95, 5, 4, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 96, 5, 4, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Operating system', 'Linux', 'Client-side SSH agent', NULL, NULL, 100, 5, 4, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 106, 5, 5, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 109, 5, 5, 0, 1, 0, 1, 0, 0, 39, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 110, 5, 5, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 116, 5, 5, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[50]|>_[90]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Nokia IP Appliance', 'Platform', 'Nokia IPSO', 'Client-side SSH agent', NULL, NULL, 126, 6, 6, 0, 1, 0, 1, 0, 0, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Nokia IP Appliance', 'Platform', 'Nokia IPSO', 'Client-side SSH agent', NULL, NULL, 130, 6, 6, 0, 1, 0, 1, 0, 0, 39, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Nokia IP Appliance', 'Platform', 'Nokia IPSO', 'Client-side SSH agent', NULL, NULL, 131, 6, 6, 0, 1, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Nokia IP Appliance', 'Operating system', 'Nokia IPSO', 'Client-side SSH agent', NULL, NULL, 135, 6, 6, 0, 1, 0, 2, 0, 0, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Sun SPARC', 'Platform', 'Sun Solaris', 'Client-side SSH agent', NULL, NULL, 139, 7, 7, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Sun SPARC', 'Platform', 'Sun Solaris', 'Client-side SSH agent', NULL, NULL, 142, 7, 7, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Sun SPARC', 'Operating system', 'Sun Solaris', 'Client-side SSH agent', NULL, NULL, 146, 7, 7, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 150, -1, 1, 0, 2, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Operating system', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 152, -1, 1, 0, 2, 0, 2, 0, 0, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Operating system', 'Check Point Sofaware Firmware', 'Server-side SNMP agent', NULL, NULL, 478, -1, 2, 0, 7, 0, 2, 0, 8, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SNMP agent', NULL, NULL, 161, 4, 3, 0, 2, 0, 1, 0, 0, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Operating system', 'Cisco Security Appliance Firmware', 'Server-side SNMP agent', NULL, NULL, 162, 4, 3, 0, 2, 0, 2, 0, 0, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SNMP agent', NULL, NULL, 163, 4, 3, 0, 2, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 168, 2, 2, 0, 3, 0, 1, 0, 0, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 170, 2, 2, 0, 3, 0, 1, 0, 0, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 171, 2, 2, 0, 3, 0, 1, 0, 0, 73, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 172, 2, 2, 0, 3, 0, 1, 0, 0, 74, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 173, 2, 2, 0, 3, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 174, 2, 2, 0, 3, 0, 1, 0, 0, 75, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 175, 3, 2, 0, 3, 0, 1, 0, 0, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 177, 3, 2, 0, 3, 0, 1, 0, 0, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 178, 3, 2, 0, 3, 0, 1, 0, 0, 73, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 179, 3, 2, 0, 3, 0, 1, 0, 0, 74, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 180, 3, 2, 0, 3, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Check Point Sofaware Appliance (ADSL)', 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, NULL, 181, 3, 2, 0, 3, 0, 1, 0, 0, 75, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 192, 4, 3, 0, 3, 0, 1, 0, 0, 73, 1, 0, 'default|>_[x*2]|>_[x*3]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 193, 4, 3, 0, 3, 0, 1, 0, 0, 74, 1, 0, 'default|>_[x*2]|>_[x*3]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 195, 4, 3, 0, 3, 0, 1, 0, 0, 39, 1, 0, 'default|?_[]|?_[]|', 1, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 196, 4, 3, 0, 3, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 204, 5, 5, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 245, 5, 1, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 246, 5, 1, 0, 1, 0, 1, 0, 0, 39, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 247, 5, 1, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Operating system', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 248, 5, 1, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 250, 5, 1, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 261, 8, 8, 0, 2, 0, 1, 0, 0, 75, 1, 0, 'default|>_[50]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Operating system', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 262, 8, 8, 0, 2, 0, 2, 0, 0, 5, 1, 0, 'default|<_[20]|<_[10]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 263, 8, 8, 0, 2, 0, 1, 0, 0, 39, 1, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 267, 8, 8, 0, 2, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 270, 8, 8, 0, 2, 0, 1, 0, 0, 73, 1, 0, 'default|>_[10]|>_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 271, 8, 8, 0, 2, 0, 1, 0, 0, 74, 1, 0, 'default|>_[10]|>_[100]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SNMP agent', NULL, NULL, 272, 8, 8, 0, 2, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 303, 5, 4, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 304, 5, 4, 0, 1, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 305, 1, 1, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 306, 1, 1, 0, 1, 0, 1, 0, 0, 112, 0, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 307, 5, 1, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 308, 5, 1, 0, 1, 0, 1, 0, 0, 112, 0, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Client-side SSH agent', NULL, NULL, 309, 5, 5, 0, 1, 0, 1, 0, 0, 112, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 342, 1, 1, 0, 1, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 344, 1, 1, 0, 1, 0, 1, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 345, 1, 1, 0, 1, 0, 1, 0, 0, 132, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 346, 1, 1, 0, 1, 0, 1, 0, 0, 133, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 347, 5, 1, 0, 1, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 349, 5, 1, 0, 1, 0, 1, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 350, 5, 1, 0, 1, 0, 1, 0, 0, 132, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Client-side SSH agent', NULL, NULL, 351, 5, 1, 0, 1, 0, 1, 0, 0, 133, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 353, 9, 9, 0, 1, 0, 5, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 354, 9, 9, 0, 1, 0, 5, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 355, 9, 9, 0, 1, 0, 5, 0, 0, 131, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 357, 9, 9, 0, 1, 0, 5, 0, 0, 129, 1, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 362, 9, 9, 0, 1, 0, 5, 0, 0, 39, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Virtual System', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 370, 9, 9, 0, 1, 0, 5, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 373, 10, 9, 0, 1, 0, 5, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 374, 10, 9, 0, 1, 0, 5, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 375, 10, 9, 0, 1, 0, 5, 0, 0, 131, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 377, 10, 9, 0, 1, 0, 5, 0, 0, 129, 1, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 378, 10, 9, 0, 1, 0, 5, 0, 0, 39, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Virtual Switch', 'Network', 'SPLAT VSX', 'Client-side SSH agent', NULL, NULL, 381, 10, 9, 0, 1, 0, 5, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', NULL, 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 436, -1, -1, 0, 7, 0, 1, 0, 2, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 437, -1, -1, 0, 7, 0, 1, 0, 3, 132, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 438, -1, -1, 0, 7, 0, 1, 0, 4, 133, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 439, -1, -1, 0, 7, 0, 1, 0, 5, 129, 1, 0, 'default|>_[0]|>_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Open Server', 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 440, 5, -1, 0, 7, 0, 1, 0, 29, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Operating system', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 481, -1, 1, 0, 7, 0, 2, 0, 8, 11, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 490, -1, 1, 0, 7, 0, 1, 0, 19, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 491, -1, 1, 0, 7, 0, 1, 0, 20, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SNMP agent', NULL, NULL, 492, -1, 1, 0, 7, 0, 1, 0, 21, 112, 1, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 513, 5, 4, 0, 1, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 515, 5, 4, 0, 1, 0, 1, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 516, 5, 4, 0, 1, 0, 1, 0, 0, 132, 0, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Linux', 'Client-side SSH agent', NULL, NULL, 517, 5, 4, 0, 1, 0, 1, 0, 0, 133, 0, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 519, 4, 3, 0, 3, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, NULL, 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 524, -1, 2, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', NULL, 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 526, -1, 2, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 527, -1, 2, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 528, -1, 2, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, 'Platform', 'Check Point Sofaware Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 530, -1, 2, 0, 10, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, NULL, 537, 4, 3, 0, 3, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Generic SNMP Host', 'Platform', NULL, 'Server-side SNMP agent', NULL, NULL, 539, 11, -1, 0, 7, 0, 1, 0, 6, 7, 1, 0, 'default|<_[0]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Server-side SNMP agent', NULL, NULL, 550, 5, 5, 0, 7, 0, 1, 0, 31, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Sun SPARC', 'Platform', 'Sun Solaris', 'Client-side SSH agent', NULL, NULL, 558, 7, 7, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Server-side SNMP agent', NULL, NULL, 555, 5, 5, 0, 7, 0, 1, 0, 37, 112, 0, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'Microsoft Windows', 'Server-side SNMP agent', NULL, NULL, 556, 5, 5, 0, 7, 0, 1, 0, 38, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Sun SPARC', 'Platform', 'Sun Solaris', 'Client-side SSH agent', NULL, NULL, 559, 7, 7, 0, 1, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 677, 4, 3, 0, 10, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 679, 4, 3, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 680, 4, 3, 0, 10, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 684, 4, 3, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 686, 4, 3, 0, 10, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 687, 4, 3, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 689, 4, 3, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 690, 4, 3, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 691, 4, 3, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 695, 4, 3, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Cisco Security Appliance', 'Platform', 'Cisco Security Appliance Firmware', 'Server-side SSH agent', NULL, 'Device configuration file', 698, 4, 3, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 703, 12, 13, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 704, 12, 13, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 705, 12, 13, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 707, 12, 13, 0, 10, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 708, 12, 13, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 709, 12, 13, 0, 10, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 710, 12, 13, 0, 10, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 711, 12, 13, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 713, 12, 13, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 714, 12, 13, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Blue Coat ProxySG', 'Platform', 'Blue Coat SGOS', 'Server-side SSH agent', NULL, 'Device configuration file', 716, 12, 13, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Operating system', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 727, 5, 14, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 736, 5, 14, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 737, 5, 14, 0, 1, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 738, 5, 14, 0, 1, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 740, 5, 14, 0, 1, 0, 1, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 741, 5, 14, 0, 1, 0, 1, 0, 0, 132, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 742, 5, 14, 0, 1, 0, 1, 0, 0, 133, 0, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 743, 5, 14, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 746, 5, 14, 0, 1, 0, 1, 0, 0, 39, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 747, 5, 14, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Open Server', 'Platform', 'MSS OS', 'Client-side SSH agent', NULL, NULL, 750, 5, 14, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 758, 13, 15, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 759, 13, 15, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 761, 13, 15, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 763, 13, 15, 0, 10, 0, 1, 0, 0, 129, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 764, 13, 15, 0, 10, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 766, 13, 15, 0, 10, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 768, 13, 15, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 769, 13, 15, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 770, 13, 15, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 773, 13, 15, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Operating system', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 776, 13, 15, 0, 10, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'Junos', 'Server-side SSH agent', NULL, 'Device configuration file', 778, 13, 15, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Operating system', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 804, -1, 16, 0, 1, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 812, -1, 16, 0, 1, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 813, -1, 16, 0, 1, 0, 1, 0, 0, 39, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 814, -1, 16, 0, 1, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 815, -1, 16, 0, 1, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 816, -1, 16, 0, 1, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 817, -1, 16, 0, 1, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 818, -1, 16, 0, 1, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 820, -1, 16, 0, 1, 0, 1, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 821, -1, 16, 0, 1, 0, 1, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point GAiA', 'Client-side SSH agent', NULL, NULL, 822, -1, 16, 0, 1, 0, 1, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Operating system', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 825, -1, 1, 0, 10, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.5]|>_[1]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 833, -1, 1, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 834, -1, 1, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 835, -1, 1, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 836, -1, 1, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 837, -1, 1, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 838, -1, 1, 0, 10, 0, 1, 0, 0, 112, 0, 0, 'default|>_[80]|>_[95]|', 6, 3, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 839, -1, 1, 0, 10, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 841, -1, 1, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 842, -1, 1, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, NULL, 'Platform', 'Check Point SecurePlatform (SPLAT)', 'Server-side SSH agent', NULL, NULL, 843, -1, 1, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 846, 13, 17, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 848, 13, 17, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 850, 13, 17, 0, 10, 0, 1, 0, 0, 129, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 851, 13, 17, 0, 10, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 853, 13, 17, 0, 10, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 855, 13, 17, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 856, 13, 17, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 857, 13, 17, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 860, 13, 17, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Juniper', 'Platform', 'ScreenOS', 'Server-side SSH agent', NULL, 'Device configuration file', 865, 13, 17, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 873, 14, 18, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 874, 14, 18, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 875, 14, 18, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 876, 14, 18, 0, 10, 0, 1, 0, 0, 63, 0, 0, 'default|?_[]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 878, 14, 18, 0, 10, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 883, 14, 18, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 884, 14, 18, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 886, 14, 18, 0, 10, 0, 1, 0, 0, 131, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 887, 14, 18, 0, 10, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 888, 14, 18, 0, 10, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Hewlett-Packard Switch', 'Platform', 'HP Switch', 'Server-side SSH agent', NULL, 'Device configuration file', 890, 14, 18, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 894, 15, 19, 0, 12, 0, 1, 0, 0, 7, 1, 0, 'default|?_[]|>_[1]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 895, 15, 19, 0, 12, 0, 1, 0, 0, 63, 1, 0, 'default|<_[1]|<_[1]|', 0, 2, 1, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 896, 15, 19, 0, 12, 0, 1, 0, 0, 73, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 897, 15, 19, 0, 12, 0, 1, 0, 0, 74, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 898, 15, 19, 0, 12, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 3, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 899, 15, 19, 0, 12, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 900, 15, 19, 0, 12, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 901, 15, 19, 0, 12, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 904, 15, 19, 0, 12, 0, 1, 0, 0, 131, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 906, 15, 19, 0, 12, 0, 1, 0, 0, 39, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side Telnet agent', NULL, 'Device configuration file', 907, 15, 19, 0, 12, 0, 1, 0, 0, 129, 0, 0, 'default|>_[0]|>_[0]|', 6, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 910, 15, 19, 0, 10, 0, 1, 0, 0, 7, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 911, 15, 19, 0, 10, 0, 1, 0, 0, 63, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 912, 15, 19, 0, 10, 0, 1, 0, 0, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 913, 15, 19, 0, 10, 0, 1, 0, 0, 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 914, 15, 19, 0, 10, 0, 1, 0, 0, 5, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 915, 15, 19, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[70]|>_[90]|', 3, 1, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 916, 15, 19, 0, 10, 0, 1, 0, 0, 132, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 917, 15, 19, 0, 10, 0, 1, 0, 0, 133, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 920, 15, 19, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 922, 15, 19, 0, 10, 0, 1, 0, 0, 39, 0, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Cisco Router', 'Platform', 'Internetwork Operating System', 'Server-side SSH agent', NULL, NULL, 923, 15, 19, 0, 10, 0, 1, 0, 0, 129, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 929, 1, 20, 0, 10, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 930, 1, 20, 0, 10, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 1, 1, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 931, 1, 20, 0, 10, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 933, 1, 20, 0, 10, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 935, 1, 20, 0, 10, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 936, 1, 20, 0, 10, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 937, 1, 20, 0, 10, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 939, 1, 20, 0, 10, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 947, 16, 21, 0, 13, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CMPOUTTRAFFIC', 'cmp', 'COUT', 'Interface throughput outbound (KBps)', 'Interface throughput outbound (KBps)', 'The average number of kilobytes per second transmitted by each network interface calculated by averaging the total number of bytes transmitted by each network interface in the last 5 minutes.', 'Networking', 'couttraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 948, 16, 21, 0, 13, 0, 1, 0, 0, 74, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 949, 16, 21, 0, 13, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 951, 16, 21, 0, 13, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CMPTRAFFIC', 'cmp', 'CTFC', 'Interface throughput inbound (KBps)', 'Interface throughput inbound (KBps)', 'The average number of kilobytes per second received by each network interface calculated by averaging the total number of bytes received by each network interface in the last 5 minutes.', 'Networking', 'ctraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 952, 16, 21, 0, 13, 0, 1, 0, 0, 73, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 955, 16, 21, 0, 13, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 956, 16, 21, 0, 13, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 957, 16, 21, 0, 13, 0, 1, 0, 0, 39, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 958, 16, 21, 0, 13, 0, 1, 0, 0, 133, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 959, 16, 21, 0, 13, 0, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Platform', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 963, 16, 21, 0, 13, 0, 1, 0, 0, 132, 0, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Security Appliance', 'Operating system', 'PAN-OS', 'Server-side SSH agent', NULL, 'Device configuration file', 969, 16, 21, 0, 13, 0, 2, 0, 0, 11, 1, 0, 'default|>_[0.8]|>_[1]|', 0, 0, 6, 3, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 983, 8, 8, 0, 14, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 987, 8, 8, 0, 14, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 988, 8, 8, 0, 14, 0, 1, 0, 0, 131, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 992, 8, 8, 0, 14, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 995, 8, 8, 0, 14, 0, 1, 0, 0, 132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 996, 8, 8, 0, 14, 0, 1, 0, 0, 133, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 997, 8, 8, 0, 14, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1035, 9, 22, 0, 1, 0, 5, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1036, 9, 22, 0, 1, 0, 5, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1037, 9, 22, 0, 1, 0, 5, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1039, 9, 22, 0, 1, 0, 5, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1040, 9, 22, 0, 1, 0, 5, 0, 0, 39, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Check Point Virtual System', 'Network', 'GAiA VSX', 'Client-side SSH agent', NULL, NULL, 1043, 9, 22, 0, 1, 0, 5, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1101, 20, 8, 0, 14, 251, 5, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 1053, 8, 8, 0, 14, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Operating system', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 1055, 8, 8, 0, 14, 0, 2, 0, 0, 11, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, 'Device configuration file', 1064, 8, 8, 0, 14, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Virtual Machine', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1065, 17, 8, 0, 14, 237, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Virtual Machine', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1067, 17, 8, 0, 14, 237, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Virtual Machine', 'Operating system', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1068, 17, 8, 0, 14, 237, 2, 0, 0, 11, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Virtual Machine', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1070, 17, 8, 0, 14, 237, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Virtual Machine', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1071, 17, 8, 0, 14, 237, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Virtual Machine', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1072, 17, 8, 0, 14, 237, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet Management and Analytics Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1077, 18, 8, 0, 14, 242, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Fortinet Management and Analytics Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1079, 18, 8, 0, 14, 242, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet Management and Analytics Platform', 'Operating system', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1080, 18, 8, 0, 14, 242, 2, 0, 0, 11, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet Management and Analytics Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1082, 18, 8, 0, 14, 242, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Fortinet Management and Analytics Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1083, 18, 8, 0, 14, 242, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet Management and Analytics Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1084, 18, 8, 0, 14, 242, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Check Point Appliance', 'Platform', 'Check Point embedded GAiA', 'Server-side SSH agent', NULL, NULL, 1089, 1, 20, 0, 10, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Virtual System', 'Network', 'PAN-OS', 'Server-side SSH agent', NULL, NULL, 1092, 19, 21, 0, 10, 0, 5, 0, 0, 132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Virtual System', 'Network', 'PAN-OS', 'Server-side SSH agent', NULL, NULL, 1093, 19, 21, 0, 10, 0, 5, 0, 0, 133, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Palo Alto Virtual System', 'Network', 'PAN-OS', 'Server-side SSH agent', NULL, NULL, 1095, 19, 21, 0, 10, 0, 5, 0, 0, 131, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Palo Alto Virtual System', 'Network', 'PAN-OS', 'Server-side SSH agent', NULL, NULL, 1096, 19, 21, 0, 10, 0, 5, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Palo Alto Virtual System', 'Network', 'PAN-OS', 'Server-side SSH agent', NULL, NULL, 1098, 19, 21, 0, 10, 0, 5, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1102, 20, 8, 0, 14, 251, 5, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1104, 20, 8, 0, 14, 251, 5, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1105, 20, 8, 0, 14, 251, 5, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent', NULL, NULL, 1106, 20, 8, 0, 14, 251, 5, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1107, 21, 23, 0, 14, 255, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1109, 21, 23, 0, 14, 255, 1, 0, 0, 131, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1110, 21, 23, 0, 14, 255, 1, 0, 0, 132, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1111, 21, 23, 0, 14, 255, 1, 0, 0, 133, 1, 0, 'default|?_[]|?_[]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1112, 21, 23, 0, 14, 255, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC', 'simple', 'OUT', 'Network throughput outbound (KBps)', 'Network throughput outbound (KBps)', 'The average number of kilobits per second transmitted by all network interfaces calculated by averaging the total number of bits transmitted by all network interfaces in the last 5 minutes.', 'Networking', 'outtraffic', 0, NULL, 'Platform', 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1113, 21, 23, 0, 14, 255, 1, 0, 0, 39, 0, 0, 'default|<_[0]|<_[0]|', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1115, 21, 23, 0, 14, 255, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1116, 21, 23, 0, 14, 255, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Cisco FirePOWER Appliance', 'Platform', 'Cisco Fire Linux OS', 'Server-side SSH agent', NULL, NULL, 1117, 21, 23, 0, 14, 255, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('MEM', 'simple', 'MEM', 'Percentage memory free', 'Percentage memory free', 'The percentage of memory currently available.', 'System', 'mem', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1125, 8, 8, 0, 15, 0, 1, 0, 0, 5, 1, 0, 'default|<_[20]|<_[5]|', 0, 0, 0, 0, 1, 1);
INSERT INTO `underInvestigation_categories` VALUES ('CPU', 'simple', 'CPU', 'Percentage CPU utilisation', 'Percentage CPU utilisation', 'The current percentage CPU utilisation averaged over all processor cores.', 'System', 'cpu', 0, NULL, 'Operating system', 1, 100, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1126, 8, 8, 0, 15, 0, 1, 0, 0, 75, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 3, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1127, 8, 8, 0, 15, 0, 1, 0, 0, 131, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('UPTIME', 'simple', 'UPT', 'Uptime', 'Uptime', 'Indicates that the system has recently booted. A value of 2 is returned if the system was booted within the last 30 minutes and a value of 1 is returned if the system was booted within the last 60 minutes', 'System', 'uptime', 0, NULL, 'Platform', 1, 2, 0, 0, 1, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1131, 8, 8, 0, 15, 0, 1, 0, 0, 7, 1, 0, 'default|>_[1]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1134, 8, 8, 0, 15, 0, 1, 0, 0, 132, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1135, 8, 8, 0, 15, 0, 1, 0, 0, 133, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1136, 8, 8, 0, 15, 0, 1, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1138, 8, 8, 0, 15, 0, 1, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 6, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('LOAD', 'simple', 'CPU', 'Load average', 'Load average', 'The Unix-like 5 minute load average.', 'System', 'load', 0, NULL, 'Operating system', 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Operating system', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1140, 8, 8, 0, 15, 0, 2, 0, 0, 11, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('CPU_INDIV', 'cmp', 'CPU_INDIV', 'Percentage CPU utilisation per core', 'Percentage CPU utilisation per core', 'The CPU utilisation of each processor core.', '', 'cpu_indiv', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Firewall Platform', 'Platform', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1146, 8, 8, 0, 15, 0, 1, 0, 0, 112, 1, 0, 'default|>_[80]|>_[95]|', 0, 0, 0, 12, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETIFSTAT', 'cmp', 'IFS', 'Interface status', 'Interface status', 'Indicates whether each network interface is up (configured) and running (connected). A value of 1 indicates that the interface is up and running, otherwise a value of 0 is used to indicate any other state. ', 'Networking', 'netifstat', 0, NULL, 'Platform', 1, 1, 0, 0, 1, 0, '1=Up|0=Down', 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1149, 20, 8, 0, 15, 258, 5, 0, 0, 63, 1, 0, 'default|?_[]|<_[1]|', 0, 0, 0, 1, 0, 1);
INSERT INTO `underInvestigation_categories` VALUES ('NETERR_VAL', 'cmp', 'NETERR_VAL', 'Network errors per interface', 'Network errors per interface', 'The number of network errors detected on each network interface in the last 5 minutes.', '', 'neterr_val', 0, NULL, NULL, 1, 0, 0, 0, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1150, 20, 8, 0, 15, 258, 5, 0, 0, 129, 1, 0, 'default|>_[0]|?_[]|', 0, 0, 0, 0, 1, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_KBIT', 'simple', 'OUTTRAFFIC_KBIT', 'Network throughput outbound (Kbps)', 'Network throughput outbound (Kbps)', 'The average number of kilobytes per second transmitted by all network interfaces calculated by averaging the total number of bytes transmitted by all network interfaces in the last 5 minutes.', '', 'outtraffic_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1152, 20, 8, 0, 15, 258, 5, 0, 0, 131, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('TRAFFIC_COMPLEX_KBIT', 'cmp', 'TRAFFIC_COMPLEX_KBIT', 'Interface throughput inbound (Kbps)', 'Interface throughput inbound (Kbps)', 'The average number of kilobits per second received by each network interface calculated by averaging the total number of bits received by each network interface in the last 5 minutes.', '', 'traffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1153, 20, 8, 0, 15, 258, 5, 0, 0, 132, 1, 0, '', 0, 0, 0, 0, 0, 0);
INSERT INTO `underInvestigation_categories` VALUES ('OUTTRAFFIC_COMPLEX_KBIT', 'cmp', 'OUTTRAFFIC_COMPLEX_KBIT', 'Interface throughput outbound (Kbps)', 'Interface throughput outbound (Kbps)', 'The average number of kilobits per second transmitted by each network interface calculated by averaging the total number of bits transmitted by each network interface in the last 5 minutes.', '', 'outtraffic_complex_kbit', 0, NULL, NULL, 1, 0, 0, 2, 0, 0, NULL, 'Fortinet FortiGate Virtual Domain (VDOM)', 'Network', 'Fortinet FortiOS', 'Server-side SSH agent forwarding', NULL, NULL, 1154, 20, 8, 0, 15, 258, 5, 0, 0, 133, 1, 0, '', 0, 0, 0, 0, 0, 0);

-- ----------------------------
-- View structure for monitor_check_type_linking_firewall
-- ----------------------------
DROP VIEW IF EXISTS `monitor_check_type_linking_firewall`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `monitor_check_type_linking_firewall` AS select `monitor_checktype_linking`.`monitor_checktype_linking_id` AS `monitor_checktype_linking_id`,`monitor_checktype_linking`.`monitor_platform_id` AS `monitor_platform_id`,`monitor_checktype_linking`.`monitor_operatingSystem_id` AS `monitor_operatingSystem_id`,`monitor_checktype_linking`.`monitor_application_id` AS `monitor_application_id`,`monitor_checktype_linking`.`monitor_agent_id` AS `monitor_agent_id`,`monitor_checktype_linking`.`monitor_structure_id` AS `monitor_structure_id`,`monitor_checktype_linking`.`monitor_category_id` AS `monitor_category_id`,`monitor_checktype_linking`.`monitor_subCategory_id` AS `monitor_subCategory_id`,`monitor_checktype_linking`.`monitor_mib_linking_id` AS `monitor_mib_linking_id`,`monitor_checktype_linking`.`checktype_id` AS `checktype_id`,`monitor_checktype_linking`.`default` AS `default` from ((`monitor_checktype_linking` join `checktype` on((`monitor_checktype_linking`.`checktype_id` = `checktype`.`id`))) join `monitor_checktype_default` on((`monitor_checktype_linking`.`monitor_checktype_linking_id` = `monitor_checktype_default`.`monitor_checktype_linking_id`))) where ((`checktype`.`name` = 'Disk usage') or (`checktype`.`name` = 'Load average') or (`checktype`.`name` = 'Network errors per interface') or (`checktype`.`name` = 'Percentage CPU utilisation per core') or (`checktype`.`name` = 'Percentage memory free') or (`checktype`.`name` = 'Percentage CPU utilisation') or (`checktype`.`name` = 'Network throughput outbound (Kbps)') or (`checktype`.`name` = 'Network throughput outbound (Kbps') or (`checktype`.`name` = 'Uptime') or (`checktype`.`name` = 'Interface throughput inbound (Kbps)') or (`checktype`.`name` = 'Interface throughput outbound (Kbps)') or (`checktype`.`name` = 'Interface status') or (`checktype`.`name` = 'Network errors per interface') or (`checktype`.`name` = 'Percentage CPU utilisation per core') or (`checktype`.`name` = 'policy') or ((`monitor_checktype_linking`.`monitor_platform_id` = 8) and (`monitor_checktype_linking`.`monitor_operatingSystem_id` = 8)));

-- ----------------------------
-- Records of underInvestigation_categories
-- ----------------------------
INSERT INTO `underInvestigation_categories` VALUES (67, 1, 1, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (247, 5, 1, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (255, 8, 8, 12, 2, 0, 3, 0, 0, 95, 1);
INSERT INTO `underInvestigation_categories` VALUES (256, 8, 8, 12, 2, 0, 3, 0, 0, 96, 1);
INSERT INTO `underInvestigation_categories` VALUES (257, 8, 8, 0, 2, 0, 1, 0, 0, 92, 1);
INSERT INTO `underInvestigation_categories` VALUES (258, 8, 8, 0, 2, 0, 1, 0, 0, 93, 1);
INSERT INTO `underInvestigation_categories` VALUES (259, 8, 8, 0, 2, 0, 1, 0, 0, 94, 1);
INSERT INTO `underInvestigation_categories` VALUES (260, 8, 8, 12, 2, 0, 3, 0, 0, 17, 1);
INSERT INTO `underInvestigation_categories` VALUES (261, 8, 8, 0, 2, 0, 1, 0, 0, 75, 1);
INSERT INTO `underInvestigation_categories` VALUES (262, 8, 8, 0, 2, 0, 2, 0, 0, 5, 1);
INSERT INTO `underInvestigation_categories` VALUES (263, 8, 8, 0, 2, 0, 1, 0, 0, 39, 1);
INSERT INTO `underInvestigation_categories` VALUES (264, 8, 8, 0, 2, 0, 1, 0, 0, 83, 1);
INSERT INTO `underInvestigation_categories` VALUES (265, 8, 8, 0, 2, 0, 1, 0, 0, 36, 1);
INSERT INTO `underInvestigation_categories` VALUES (266, 8, 8, 0, 2, 0, 1, 0, 0, 84, 1);
INSERT INTO `underInvestigation_categories` VALUES (267, 8, 8, 0, 2, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (268, 8, 8, 0, 2, 0, 1, 0, 0, 81, 1);
INSERT INTO `underInvestigation_categories` VALUES (269, 8, 8, 0, 2, 0, 1, 0, 0, 82, 1);
INSERT INTO `underInvestigation_categories` VALUES (270, 8, 8, 0, 2, 0, 1, 0, 0, 73, 1);
INSERT INTO `underInvestigation_categories` VALUES (271, 8, 8, 0, 2, 0, 1, 0, 0, 74, 1);
INSERT INTO `underInvestigation_categories` VALUES (272, 8, 8, 0, 2, 0, 1, 0, 0, 63, 1);
INSERT INTO `underInvestigation_categories` VALUES (273, 8, 8, 12, 2, 0, 3, 0, 0, 46, 1);
INSERT INTO `underInvestigation_categories` VALUES (95, 5, 4, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (106, 5, 5, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (440, 5, -1, 0, 7, 0, 1, 0, 29, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (196, 4, 3, 0, 3, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (524, -1, 2, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (539, 11, -1, 0, 7, 0, 1, 0, 6, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (139, 7, 7, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (698, 4, 3, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (708, 12, 13, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (747, 5, 14, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (759, 13, 15, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (814, -1, 16, 0, 1, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (835, -1, 1, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (846, 13, 17, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (873, 14, 18, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (894, 15, 19, 0, 12, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (929, 1, 20, 0, 10, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (947, 16, 21, 0, 13, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (1052, 8, 8, 0, 14, 0, 1, 0, 0, 28, 0);
INSERT INTO `underInvestigation_categories` VALUES (1053, 8, 8, 0, 14, 0, 1, 0, 0, 129, 1);
INSERT INTO `underInvestigation_categories` VALUES (987, 8, 8, 0, 14, 0, 1, 0, 0, 75, 1);
INSERT INTO `underInvestigation_categories` VALUES (992, 8, 8, 0, 14, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (997, 8, 8, 0, 14, 0, 1, 0, 0, 63, 1);
INSERT INTO `underInvestigation_categories` VALUES (983, 8, 8, 0, 14, 0, 1, 0, 0, 5, 1);
INSERT INTO `underInvestigation_categories` VALUES (1054, 8, 8, 0, 14, 0, 2, 0, 0, 6, 1);
INSERT INTO `underInvestigation_categories` VALUES (1055, 8, 8, 0, 14, 0, 2, 0, 0, 11, 1);
INSERT INTO `underInvestigation_categories` VALUES (1056, 8, 8, 0, 14, 0, 2, 0, 0, 10, 1);
INSERT INTO `underInvestigation_categories` VALUES (1057, 8, 8, 0, 14, 0, 2, 0, 0, 8, 1);
INSERT INTO `underInvestigation_categories` VALUES (981, 8, 8, 12, 14, 0, 3, 0, 0, 17, 1);
INSERT INTO `underInvestigation_categories` VALUES (1061, 8, 8, 31, 14, 0, 3, 0, 0, 40, 1);
INSERT INTO `underInvestigation_categories` VALUES (1062, 8, 8, 31, 14, 0, 3, 0, 0, 41, 1);
INSERT INTO `underInvestigation_categories` VALUES (1063, 8, 8, 31, 14, 0, 3, 0, 0, 42, 1);
INSERT INTO `underInvestigation_categories` VALUES (1064, 8, 8, 0, 14, 0, 1, 0, 0, 112, 1);
INSERT INTO `underInvestigation_categories` VALUES (1071, 17, 8, 0, 14, 237, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (1083, 18, 8, 0, 14, 242, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (1123, 8, 8, 12, 14, 0, 3, 0, 0, 218, 1);
INSERT INTO `underInvestigation_categories` VALUES (1124, 8, 8, 12, 15, 0, 3, 0, 0, 17, 1);
INSERT INTO `underInvestigation_categories` VALUES (1125, 8, 8, 0, 15, 0, 1, 0, 0, 5, 1);
INSERT INTO `underInvestigation_categories` VALUES (1126, 8, 8, 0, 15, 0, 1, 0, 0, 75, 1);
INSERT INTO `underInvestigation_categories` VALUES (1131, 8, 8, 0, 15, 0, 1, 0, 0, 7, 1);
INSERT INTO `underInvestigation_categories` VALUES (1136, 8, 8, 0, 15, 0, 1, 0, 0, 63, 1);
INSERT INTO `underInvestigation_categories` VALUES (1137, 8, 8, 0, 15, 0, 1, 0, 0, 28, 0);
INSERT INTO `underInvestigation_categories` VALUES (1138, 8, 8, 0, 15, 0, 1, 0, 0, 129, 1);
INSERT INTO `underInvestigation_categories` VALUES (1139, 8, 8, 0, 15, 0, 2, 0, 0, 6, 1);
INSERT INTO `underInvestigation_categories` VALUES (1140, 8, 8, 0, 15, 0, 2, 0, 0, 11, 1);
INSERT INTO `underInvestigation_categories` VALUES (1141, 8, 8, 0, 15, 0, 2, 0, 0, 10, 1);
INSERT INTO `underInvestigation_categories` VALUES (1142, 8, 8, 0, 15, 0, 2, 0, 0, 8, 1);
INSERT INTO `underInvestigation_categories` VALUES (1143, 8, 8, 31, 15, 0, 3, 0, 0, 40, 1);
INSERT INTO `underInvestigation_categories` VALUES (1144, 8, 8, 31, 15, 0, 3, 0, 0, 41, 1);
INSERT INTO `underInvestigation_categories` VALUES (1145, 8, 8, 31, 15, 0, 3, 0, 0, 42, 1);
INSERT INTO `underInvestigation_categories` VALUES (1146, 8, 8, 0, 15, 0, 1, 0, 0, 112, 1);
INSERT INTO `underInvestigation_categories` VALUES (1155, 8, 8, 12, 15, 0, 3, 0, 0, 218, 1);

-- ----------------------------
-- Function structure for fn_get_ai_table
-- ----------------------------
DROP FUNCTION IF EXISTS `fn_get_ai_table`;
delimiter ;;
CREATE FUNCTION `fn_get_ai_table`(`tableName` VARCHAR(50),`dbName` VARCHAR(50))
 RETURNS int(11)
  COMMENT 'Get auto increment id from supplied table'
BEGIN
	DECLARE db VARCHAR(50);
   DECLARE aiValue INT;
	IF `dbName` IS NULL THEN SET db = DATABASE(); ELSE SET db = dbName; END IF;
   SELECT AUTO_INCREMENT INTO aiValue FROM information_schema.tables WHERE table_name = tableName AND table_schema = db;
   RETURN aiValue;
END
;;
delimiter ;

-- ----------------------------
-- Function structure for OK
-- ----------------------------
DROP FUNCTION IF EXISTS `OK`;
delimiter ;;
CREATE FUNCTION `OK`(`expect` INT, `actual` INT)
 RETURNS int(11)
  COMMENT 'Get auto increment id from supplied table'
BEGIN
	DECLARE equal INT;
	IF (`expect` = `actual`) THEN SET `equal` = 1; ELSE SET `equal` = 0;	END IF; RETURN `equal`; 
END
;;
delimiter ;

-- ----------------------------
-- Procedure structure for updateMonitorStructure
-- ----------------------------
DROP PROCEDURE IF EXISTS `updateMonitorStructure`;
delimiter ;;
CREATE PROCEDURE `updateMonitorStructure`()
BEGIN
	SET @patch_id=(SELECT id FROM `appliance`.`database_patching` WHERE filename='855815_fortigate_fortiGuard_service_status_attribute.sql');
	IF @patch_id > 0 THEN 
	START TRANSACTION;
		SET @errrosFound := 0;
		SET @monitorApplicationId := (fn_get_ai_table('monitor_application','monitor'));
		(SELECT 'Inserting "FortiWeb Web Application Firewall" to `monitor_application` table' AS '');
		INSERT INTO `monitor`.`monitor_application` (`name`) VALUES ('FortiWeb Web Application Firewall');
		
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@monitorApplicationId)) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE 
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound := errrosFound + 1;
		END IF;
	
	
		SET @monitorPlatformId := (fn_get_ai_table('monitor_platform','monitor'));
		
		INSERT INTO `monitor`.`monitor_platform` (`name`) VALUES ('FortiWeb Web Application Firewall');
		
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@monitorPlatformId)) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE 
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;
		
		
		(SELECT 'Link new platform in Monitor Structure' AS '');
		SET @monitorPlatformStructureId := (fn_get_ai_table('monitor_structure','monitor'));
		INSERT INTO `monitor`.`monitor_structure` 
		(`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
			VALUES 
		(0,0,@monitorPlatformId, @monitorPlatformId, 0, 0, 0);
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@monitorPlatformStructureId)) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;
			
		(SELECT 'Link new platform to its Operating System in Monitor Structure' AS '');	
		SET @operatingSystemId = (SELECT `monitor_operatingSystem_id` FROM `monitor`.`monitor_operatingSystem` WHERE `name` = 'Fortinet FortiOS');
		SET @monitorOSStructureId = (fn_get_ai_table('monitor_structure','monitor'));
		
		INSERT INTO `monitor`.`monitor_structure` 
		(`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
			VALUES 
		(@monitorPlatformStructureId, 1,@operatingSystemId, @monitorPlatformId, @operatingSystemId, 0,0);
		
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@monitorOSStructureId)) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE 
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;

		(SELECT 'Link new platform to its Agent in Monitor Structure' AS '');
		SET @agentId = (SELECT monitor_agent_id FROM `monitor`.`monitor_agent` WHERE `name` = 'Server-side SSH agent' ORDER BY monitor_agent_id DESC LIMIT 1);
		SET @monitorAgentStructureId = (fn_get_ai_table('monitor_structure','monitor'));
		INSERT INTO `monitor`.`monitor_structure` 
		(`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`,`monitor_operatingSystem_id`,`monitor_application_id`,`monitor_agent_id`) 
			VALUES 
		(@monitorOSStructureId,3,@agentId,@monitorPlatformId, @operatingSystemId,0,@agentId);
		
		IF OK(1,ROW_COUNT()) AND OK(LAST_INSERT_ID(),@monitorAgentStructureId) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE 
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;
			
				
		(SELECT 'Link new platform to its application in Monitor Structure' AS '');
		SET @applicationId = (SELECT monitor_application_id FROM `monitor`.`monitor_application` WHERE `name` = 'Server-side SSH agent' ORDER BY monitor_application_id DESC);
		SET @monitorAApplicationStructureId = (fn_get_ai_table('monitor_structure','monitor'));
		INSERT INTO `monitor`.`monitor_structure` 
		(`parent_id`, `type_id`, `ref_id`, `monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_application_id`, `monitor_agent_id`) 
			VALUES 
		(@monitorPlatformId, 2, @monitorApplicationId, @monitorPlatformId,  @operatingSystemId, @monitorApplicationId,0);
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@monitorAApplicationStructureId)) THEN
			(SELECT 'NO ERRORS FOUND ' AS ''); 
		ELSE 
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;

		(SELECT 'Add new monitor agent requirements' AS '');
		SET @agentRequirementsId = (fn_get_ai_table('monitor_agent_requirements','monitor'));
		INSERT INTO `monitor`.`monitor_agent_requirements` 
		(`monitor_platform_id`, `monitor_operatingSystem_id`, `monitor_agent_id`, `database_name`, `table_name`, `required_fields`)
			VALUES 
		(@monitorPlatformId, @operatingSystemId, @agentId, 'monitor', 'ssh_config', 'text|ip_addr|IP Address||text|ssh_username|Username||password|ssh_password|Password|');	
		
		IF (OK(1,ROW_COUNT()) AND  OK(LAST_INSERT_ID(),@agentRequirementsId)) THEN
			(SELECT 'NO ERRORS FOUND' AS ''); 
		ELSE
			(SELECT 'LOGGING ERROR' AS ''); 
			SET @errrosFound = @errrosFound + 1;
		END IF;
		
	
	IF (@errrosFound = 0) THEN
		(SELECT '0 Errors Found Commiting Updates' AS '');
		COMMIT;
	ELSE
		(SELECT 'Errors Found Rolling Back Updates' AS '');
		ROLLBACK;
	END IF ;
	ELSE 
		select "Patch process incomplete...!" as '';
		select "Aborting procedure updateMonitorStructure()!" AS '';
		select "'Patch 855815_fortigate_fortiGuard_service_status_attribute.sql has to be run first!" as '';
		select "..." as '';	
	END IF;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
