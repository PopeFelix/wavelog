SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for api
-- ----------------------------
DROP TABLE IF EXISTS `api`;
CREATE TABLE `api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `rights` varchar(10) NOT NULL,
  `status` varchar(10) NOT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of api
-- ----------------------------

-- ----------------------------
-- Table structure for cat
-- ----------------------------
DROP TABLE IF EXISTS `cat`;
CREATE TABLE `cat` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `radio` varchar(250) NOT NULL,
  `frequency` bigint(13) NOT NULL,
  `mode` varchar(10) NOT NULL,
  `downlink_freq` bigint(13) DEFAULT NULL,
  `uplink_freq` bigint(13) DEFAULT NULL,
  `downlink_mode` varchar(255) DEFAULT NULL,
  `uplink_mode` varchar(255) DEFAULT NULL,
  `sat_name` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of cat
-- ----------------------------

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(9) NOT NULL AUTO_INCREMENT,
  `lotw_download_url` varchar(255) DEFAULT NULL,
  `lotw_upload_url` varchar(255) DEFAULT NULL,
  `lotw_rcvd_mark` varchar(1) DEFAULT NULL,
  `lotw_login_url` varchar(244) DEFAULT NULL,
  `eqsl_download_url` varchar(244) DEFAULT NULL,
  `eqsl_rcvd_mark` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'https://lotw.arrl.org/lotwuser/lotwreport.adi', 'https://lotw.arrl.org/lotwuser/upload', 'Y', 'https://lotw.arrl.org/lotwuser/default', 'http://www.eqsl.cc/qslcard/DownloadInBox.cfm', 'Y');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `version` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('15');

-- ----------------------------
-- Table structure for notes
-- ----------------------------
DROP TABLE IF EXISTS `notes`;
CREATE TABLE `notes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cat` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of notes
-- ----------------------------

-- ----------------------------
-- Table structure for station_profile
-- ----------------------------
CREATE TABLE `station_profile` (
  `station_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `station_profile_name` varchar(200) NOT NULL,
  `station_gridsquare` varchar(100) NOT NULL,
  `station_city` varchar(100) NOT NULL,
  `station_iota` varchar(100) NOT NULL,
  `station_sota` varchar(10) NOT NULL,
  `station_callsign` varchar(50) DEFAULT NULL,
  `station_power` smallint(6) DEFAULT NULL,
  `station_dxcc` int(10) DEFAULT NULL,
  `station_cnty` varchar(200) DEFAULT NULL,
  `station_cq` int(5) DEFAULT NULL,
  `station_itu` int(5) DEFAULT NULL,
  `station_active` tinyint(1) DEFAULT NULL,
  `eqslqthnickname` varchar(255) DEFAULT NULL,
  `state` varchar(4) DEFAULT NULL,
  `qrzapikey` varchar(20) DEFAULT NULL,
  `county` varchar(255) DEFAULT NULL,
  `station_sig` varchar(50) DEFAULT NULL,
  `station_sig_info` varchar(50) DEFAULT NULL,
  `qrzrealtime` tinyint(1) DEFAULT 0,
  `user_id` int(10) unsigned NOT NULL,
  `station_wwff` varchar(50) DEFAULT NULL,
  `station_pota` varchar(50) DEFAULT NULL,
  `oqrs` int(11) DEFAULT 0,
  `oqrs_text` text DEFAULT NULL,
  `oqrs_email` int(11) DEFAULT 0,
  `webadifapikey` varchar(50) DEFAULT NULL,
  `webadifapiurl` varchar(256) DEFAULT NULL,
  `webadifrealtime` tinyint(1) DEFAULT 0,
  `clublogrealtime` tinyint(4) NOT NULL DEFAULT 0,
  `hrdlogrealtime` tinyint(1) DEFAULT NULL,
  `hrdlog_code` varchar(20) DEFAULT NULL,
  `hrdlog_username` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Table structure for station_logbooks
-- ----------------------------
DROP TABLE IF EXISTS `station_logbooks`;
CREATE TABLE `station_logbooks` (
  `logbook_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `logbook_name` varchar(191) DEFAULT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  `public_slug` varchar(191) DEFAULT NULL,
  `public_search` int(11) DEFAULT 0,
  PRIMARY KEY (`logbook_id`,`user_id`),
  UNIQUE KEY `logbook_id` (`logbook_id`),
  UNIQUE KEY `public_slug` (`public_slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for station_logbooks_relationship
-- ----------------------------
DROP TABLE IF EXISTS `station_logbooks_relationship`;
CREATE TABLE `station_logbooks_relationship` (
  `logbook_relation_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `station_logbook_id` int(10) unsigned NOT NULL,
  `station_location_id` int(10) unsigned NOT NULL,
  `modified` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`logbook_relation_id`,`station_logbook_id`,`station_location_id`),
  UNIQUE KEY `logbook_relation_id` (`logbook_relation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- table structure for table_hrd_contacts_v01
-- ----------------------------
DROP TABLE IF EXISTS `table_hrd_contacts_v01`;
CREATE TABLE `table_hrd_contacts_v01` (
  `col_primary_key` int(11) NOT NULL AUTO_INCREMENT,
  `col_address` varchar(255) DEFAULT NULL,
  `col_age` int(11) DEFAULT NULL,
  `col_a_index` double DEFAULT NULL,
  `col_ant_az` double DEFAULT NULL,
  `col_ant_el` double DEFAULT NULL,
  `col_ant_path` varchar(2) DEFAULT NULL,
  `col_arrl_sect` varchar(10) DEFAULT NULL,
  `col_band` varchar(10) DEFAULT NULL,
  `col_band_rx` varchar(10) DEFAULT NULL,
  `col_biography` longtext DEFAULT NULL,
  `col_call` varchar(32) DEFAULT NULL,
  `col_check` varchar(8) DEFAULT NULL,
  `col_class` varchar(8) DEFAULT NULL,
  `col_cnty` varchar(32) DEFAULT NULL,
  `col_comment` longtext DEFAULT NULL,
  `col_cont` varchar(6) DEFAULT NULL,
  `col_contacted_op` varchar(32) DEFAULT NULL,
  `col_contest_id` varchar(32) DEFAULT NULL,
  `col_country` varchar(64) DEFAULT NULL,
  `col_cqz` int(11) DEFAULT NULL,
  `col_distance` double DEFAULT NULL,
  `col_dxcc` varchar(6) DEFAULT NULL,
  `col_email` varchar(32) DEFAULT NULL,
  `col_eq_call` varchar(32) DEFAULT NULL,
  `col_eqsl_qslrdate` datetime DEFAULT NULL,
  `col_eqsl_qslsdate` datetime DEFAULT NULL,
  `col_eqsl_qsl_rcvd` varchar(2) DEFAULT NULL,
  `col_eqsl_qsl_sent` varchar(2) DEFAULT NULL,
  `col_eqsl_status` varchar(255) DEFAULT NULL,
  `col_force_init` int(11) DEFAULT NULL,
  `col_freq` bigint(13) DEFAULT NULL,
  `col_freq_rx` bigint(13) DEFAULT NULL,
  `col_gridsquare` varchar(12) DEFAULT NULL,
  `col_heading` double DEFAULT NULL,
  `col_iota` varchar(10) DEFAULT NULL,
  `col_ituz` int(11) DEFAULT NULL,
  `col_k_index` double DEFAULT NULL,
  `col_lat` double DEFAULT NULL,
  `col_lon` double DEFAULT NULL,
  `col_lotw_qslrdate` datetime DEFAULT NULL,
  `col_lotw_qslsdate` datetime DEFAULT NULL,
  `col_lotw_qsl_rcvd` varchar(2) DEFAULT NULL,
  `col_lotw_qsl_sent` varchar(2) DEFAULT NULL,
  `col_lotw_status` varchar(255) DEFAULT NULL,
  `col_max_bursts` int(11) DEFAULT NULL,
  `col_mode` varchar(10) DEFAULT NULL,
  `col_ms_shower` varchar(32) DEFAULT NULL,
  `col_my_city` varchar(32) DEFAULT NULL,
  `col_my_cnty` varchar(32) DEFAULT NULL,
  `col_my_country` varchar(64) DEFAULT NULL,
  `col_my_cq_zone` int(11) DEFAULT NULL,
  `col_my_gridsquare` varchar(12) DEFAULT NULL,
  `col_my_iota` varchar(10) DEFAULT NULL,
  `col_my_itu_zone` int(11) DEFAULT NULL,
  `col_my_lat` double DEFAULT NULL,
  `col_my_lon` double DEFAULT NULL,
  `col_my_name` varchar(64) DEFAULT NULL,
  `col_my_postal_code` varchar(24) DEFAULT NULL,
  `col_my_rig` varchar(255) DEFAULT NULL,
  `col_my_sig` varchar(32) DEFAULT NULL,
  `col_my_sig_info` varchar(64) DEFAULT NULL,
  `col_my_state` varchar(32) DEFAULT NULL,
  `col_my_street` varchar(64) DEFAULT NULL,
  `col_name` varchar(128) DEFAULT NULL,
  `col_notes` longtext DEFAULT NULL,
  `col_nr_bursts` int(11) DEFAULT NULL,
  `col_nr_pings` int(11) DEFAULT NULL,
  `col_operator` varchar(32) DEFAULT NULL,
  `col_owner_callsign` varchar(32) DEFAULT NULL,
  `col_pfx` varchar(32) DEFAULT NULL,
  `col_precedence` varchar(32) DEFAULT NULL,
  `col_prop_mode` varchar(8) DEFAULT NULL,
  `col_public_key` varchar(255) DEFAULT NULL,
  `col_qslmsg` varchar(255) DEFAULT NULL,
  `col_qslrdate` datetime DEFAULT NULL,
  `col_qslsdate` datetime DEFAULT NULL,
  `col_qsl_rcvd` varchar(2) DEFAULT NULL,
  `col_qsl_rcvd_via` varchar(2) DEFAULT NULL,
  `col_qsl_sent` varchar(2) DEFAULT NULL,
  `col_qsl_sent_via` varchar(2) DEFAULT NULL,
  `col_qsl_via` varchar(255) DEFAULT NULL,
  `col_qso_complete` varchar(6) DEFAULT NULL,
  `col_qso_random` int(11) DEFAULT NULL,
  `col_qth` varchar(64) DEFAULT NULL,
  `col_rig` varchar(255) DEFAULT NULL,
  `col_rst_rcvd` varchar(32) DEFAULT NULL,
  `col_rst_sent` varchar(32) DEFAULT NULL,
  `col_rx_pwr` double DEFAULT NULL,
  `col_sat_mode` varchar(32) DEFAULT NULL,
  `col_sat_name` varchar(32) DEFAULT NULL,
  `col_sfi` double DEFAULT NULL,
  `col_sig` varchar(32) DEFAULT NULL,
  `col_sig_info` varchar(64) DEFAULT NULL,
  `col_srx` int(11) DEFAULT NULL,
  `col_srx_string` varchar(32) DEFAULT NULL,
  `col_state` varchar(32) DEFAULT NULL,
  `col_station_callsign` varchar(32) DEFAULT NULL,
  `col_stx` int(11) DEFAULT NULL,
  `col_stx_string` varchar(32) DEFAULT NULL,
  `col_swl` int(11) DEFAULT NULL,
  `col_ten_ten` int(11) DEFAULT NULL,
  `col_time_off` datetime DEFAULT NULL,
  `col_time_on` datetime DEFAULT NULL,
  `col_tx_pwr` double DEFAULT NULL,
  `col_web` varchar(128) DEFAULT NULL,
  `col_user_defined_0` varchar(64) DEFAULT NULL,
  `col_user_defined_1` varchar(64) DEFAULT NULL,
  `col_user_defined_2` varchar(64) DEFAULT NULL,
  `col_user_defined_3` varchar(64) DEFAULT NULL,
  `col_user_defined_4` varchar(64) DEFAULT NULL,
  `col_user_defined_5` varchar(64) DEFAULT NULL,
  `col_user_defined_6` varchar(64) DEFAULT NULL,
  `col_user_defined_7` varchar(64) DEFAULT NULL,
  `col_user_defined_8` varchar(64) DEFAULT NULL,
  `col_user_defined_9` varchar(64) DEFAULT NULL,
  `col_credit_granted` varchar(64) DEFAULT NULL,
  `col_credit_submitted` varchar(64) DEFAULT NULL,
  `col_address_intl` varchar(255) DEFAULT NULL,
  `col_award_granted` varchar(255) DEFAULT NULL,
  `col_award_summited` varchar(255) DEFAULT NULL,
  `col_clublog_qso_upload_date` datetime DEFAULT NULL,
  `col_clublog_qso_upload_status` varchar(20) DEFAULT NULL,
  `col_comment_intl` varchar(255) DEFAULT NULL,
  `col_country_intl` varchar(255) DEFAULT NULL,
  `col_silent_key` varchar(2) DEFAULT NULL,
  `col_skcc` varchar(255) DEFAULT NULL,
  `col_darc_dok` varchar(10) DEFAULT NULL,
  `col_fists` int(10) DEFAULT NULL,
  `col_fists_cc` int(10) DEFAULT NULL,
  `col_hrdlog_qso_upload_date` datetime DEFAULT NULL,
  `col_hrdlog_qso_upload_status` varchar(10) DEFAULT NULL,
  `col_my_antenna` varchar(255) DEFAULT NULL,
  `col_my_antenna_intl` varchar(255) DEFAULT NULL,
  `col_my_city_intl` varchar(255) DEFAULT NULL,
  `col_my_country_intl` int(6) DEFAULT NULL,
  `col_my_dxcc` int(6) DEFAULT NULL,
  `col_my_fists` int(10) DEFAULT NULL,
  `col_my_iota_island_id` varchar(10) DEFAULT NULL,
  `col_my_name_intl` varchar(255) DEFAULT NULL,
  `col_my_postcode_intl` varchar(255) DEFAULT NULL,
  `col_my_rig_intl` varchar(255) DEFAULT NULL,
  `col_my_sig_intl` varchar(255) DEFAULT NULL,
  `col_my_sig_info_intl` varchar(255) DEFAULT NULL,
  `col_my_sota_ref` varchar(50) DEFAULT NULL,
  `col_my_street_intl` varchar(255) DEFAULT NULL,
  `col_my_usaca_counties` varchar(255) DEFAULT NULL,
  `col_my_vucc_grids` varchar(50) DEFAULT NULL,
  `col_name_intl` varchar(255) DEFAULT NULL,
  `col_notes_intl` longtext DEFAULT NULL,
  `col_qrzcom_qso_upload_date` datetime DEFAULT NULL,
  `col_qrzcom_qso_upload_status` varchar(10) DEFAULT NULL,
  `col_qso_date` date DEFAULT NULL,
  `col_qso_date_off` date DEFAULT NULL,
  `col_qth_intl` varchar(255) DEFAULT NULL,
  `col_region` varchar(25) DEFAULT NULL,
  `col_rig_intl` varchar(255) DEFAULT NULL,
  `col_sig_intl` varchar(255) DEFAULT NULL,
  `col_sig_info_intl` varchar(255) DEFAULT NULL,
  `col_sota_ref` varchar(30) DEFAULT NULL,
  `col_submode` varchar(25) DEFAULT NULL,
  `col_uksmg` varchar(64) DEFAULT NULL,
  `col_usaca_counties` varchar(255) DEFAULT NULL,
  `col_vucc_grids` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`col_primary_key`),
  KEY `hrd_idx_col_band` (`col_band`),
  KEY `hrd_idx_col_call` (`col_call`),
  KEY `hrd_idx_col_cont` (`col_cont`),
  KEY `hrd_idx_col_dxcc` (`col_dxcc`),
  KEY `hrd_idx_col_iota` (`col_iota`),
  KEY `hrd_idx_col_mode` (`col_mode`),
  KEY `hrd_idx_col_pfx` (`col_pfx`),
  KEY `hrd_idx_col_time_on` (`col_time_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- records of table_hrd_contacts_v01
-- ----------------------------

DROP TABLE IF EXISTS `options`;
CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) DEFAULT NULL,
  `option_value` longtext NOT NULL,
  `autoload` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

-- 
-- Dumping data for table `options` that stops the version2 trigger from firing
INSERT INTO `options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES (NULL, 'version2_trigger', 'true', 'yes');

-- ----------------------------
-- Table structure for timezones
-- ----------------------------
DROP TABLE IF EXISTS `timezones`;
CREATE TABLE `timezones` (
	`id` int(11) NOT NULL AUTO_INCREMENT,
	`offset` decimal(3,1) NOT NULL,
	`name` varchar(120) COLLATE utf8mb4_bin NOT NULL,
	PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

-- ----------------------------
-- Records of timezones
-- ----------------------------
INSERT INTO `timezones` VALUES ('1', '-12.0', '(GMT-12:00)-International Date Line West');
INSERT INTO `timezones` VALUES ('4', '-9.0', '(GMT-09:00)-Alaska');
INSERT INTO `timezones` VALUES ('5', '-8.0', '(GMT-08:00)-Pacific Time (US & Canada); Tijuana');
INSERT INTO `timezones` VALUES ('6', '-7.0', '(GMT-07:00)-Arizona');
INSERT INTO `timezones` VALUES ('8', '-7.0', '(GMT-07:00)-Mountain Time (US & Canada)');
INSERT INTO `timezones` VALUES ('13', '-5.0', '(GMT-05:00)-Bogota, Lima, Quito');
INSERT INTO `timezones` VALUES ('15', '-5.0', '(GMT-05:00)-Indiana (East)');
INSERT INTO `timezones` VALUES ('17', '-4.0', '(GMT-04:00)-La Paz');
INSERT INTO `timezones` VALUES ('19', '-3.5', '(GMT-03:30)-Newfoundland');
INSERT INTO `timezones` VALUES ('22', '-3.0', '(GMT-03:00)-Greenland');
INSERT INTO `timezones` VALUES ('23', '-2.0', '(GMT-02:00)-Mid-Atlantic');
INSERT INTO `timezones` VALUES ('0', '0.0', '(GMT)-Greenwich Mean Time: Dublin, Edinburgh, Lisbon, London');
INSERT INTO `timezones` VALUES ('30', '1.0', '(GMT+01:00)-Brussels, Copenhagen, Madrid, Paris');
INSERT INTO `timezones` VALUES ('31', '1.0', '(GMT+01:00)-Sarajevo, Skopje, Warsaw, Zagreb');
INSERT INTO `timezones` VALUES ('35', '2.0', '(GMT+02:00)-Cairo');
INSERT INTO `timezones` VALUES ('36', '2.0', '(GMT+02:00)-Harare, Pretoria');
INSERT INTO `timezones` VALUES ('38', '2.0', '(GMT+02:00)-Jerusalem');
INSERT INTO `timezones` VALUES ('39', '3.0', '(GMT+03:00)-Baghdad');
INSERT INTO `timezones` VALUES ('41', '3.0', '(GMT+03:00)-Moscow, St. Petersburg, Volgograd');
INSERT INTO `timezones` VALUES ('43', '3.5', '(GMT+03:30)-Tehran');
INSERT INTO `timezones` VALUES ('44', '4.0', '(GMT+04:00)-Abu Dhabi, Muscat');
INSERT INTO `timezones` VALUES ('45', '4.0', '(GMT+04:00)-Baku, Tbilisi, Yerevan');
INSERT INTO `timezones` VALUES ('46', '4.5', '(GMT+04:30)-Kabul');
INSERT INTO `timezones` VALUES ('51', '6.0', '(GMT+06:00)-Almaty, Novosibirsk');
INSERT INTO `timezones` VALUES ('54', '6.5', '(GMT+06:30)-Rangoon');
INSERT INTO `timezones` VALUES ('55', '7.0', '(GMT+07:00)-Bangkok, Hanoi, Jakarta');
INSERT INTO `timezones` VALUES ('56', '7.0', '(GMT+07:00)-Krasnoyarsk');
INSERT INTO `timezones` VALUES ('58', '8.0', '(GMT+08:00)-Irkutsk, Ulaan Bataar');
INSERT INTO `timezones` VALUES ('59', '8.0', '(GMT+08:00)-Kuala Lumpur, Singapore');
INSERT INTO `timezones` VALUES ('60', '8.0', '(GMT+08:00)-Perth');
INSERT INTO `timezones` VALUES ('63', '9.0', '(GMT+09:00)-Seoul');
INSERT INTO `timezones` VALUES ('64', '9.0', '(GMT+09:00)-Vakutsk');
INSERT INTO `timezones` VALUES ('66', '9.5', '(GMT+09:30)-Darwin');
INSERT INTO `timezones` VALUES ('69', '10.0', '(GMT+10:00)-Guam, Port Moresby');
INSERT INTO `timezones` VALUES ('71', '10.0', '(GMT+10:00)-Vladivostok');
INSERT INTO `timezones` VALUES ('74', '12.0', '(GMT+12:00)-Fiji, Kamchatka, Marshall Is.');
INSERT INTO `timezones` VALUES ('76', '-11.0', '(GMT-11:00)-Midway Island, Samoa');
INSERT INTO `timezones` VALUES ('77', '-10.0', '(GMT-10:00)-Hawaii');
INSERT INTO `timezones` VALUES ('81', '-7.0', '(GMT-07:00)-Chihuahua, La Paz, Mazatlan');
INSERT INTO `timezones` VALUES ('83', '-6.0', '(GMT-06:00)-Central America');
INSERT INTO `timezones` VALUES ('84', '-6.0', '(GMT-06:00)-Central Time (US & Canada)');
INSERT INTO `timezones` VALUES ('85', '-6.0', '(GMT-06:00)-Guadalajara, Mexico City, Monterrey');
INSERT INTO `timezones` VALUES ('86', '-6.0', '(GMT-06:00)-Saskatchewan');
INSERT INTO `timezones` VALUES ('88', '-5.0', '(GMT-05:00)-Eastern Time (US & Canada)');
INSERT INTO `timezones` VALUES ('90', '-4.0', '(GMT-04:00)-Atlantic Time (Canada)');
INSERT INTO `timezones` VALUES ('91', '-4.0', '(GMT-04:00)-Caracas, La Paz');
INSERT INTO `timezones` VALUES ('92', '-4.0', '(GMT-04:00)-Santiago');
INSERT INTO `timezones` VALUES ('94', '-3.0', '(GMT-03:00)-Brasilia');
INSERT INTO `timezones` VALUES ('95', '-3.0', '(GMT-03:00)-Buenos Aires, Georgetown');
INSERT INTO `timezones` VALUES ('98', '-1.0', '(GMT-01:00)-Azores');
INSERT INTO `timezones` VALUES ('99', '-1.0', '(GMT-01:00)-Cape Verde Is.');
INSERT INTO `timezones` VALUES ('100', '0.0', '(GMT)-Casablanca, Monrovia');
INSERT INTO `timezones` VALUES ('102', '1.0', '(GMT+01:00)-Amsterdam, Berlin, Bern, Rome, Stockholm, Vienna');
INSERT INTO `timezones` VALUES ('103', '1.0', '(GMT+01:00)-Belgrade, Bratislava, Budapest, Ljubljana, Prague');
INSERT INTO `timezones` VALUES ('106', '1.0', '(GMT+01:00)-West Central Africa');
INSERT INTO `timezones` VALUES ('107', '2.0', '(GMT+02:00)-Athens, Beirut, Istanbul, Minsk');
INSERT INTO `timezones` VALUES ('108', '2.0', '(GMT+02:00)-Bucharest');
INSERT INTO `timezones` VALUES ('111', '2.0', '(GMT+02:00)-Helsinki, Kyiv, Riga, Sofia, Tallinn, Vilnius');
INSERT INTO `timezones` VALUES ('114', '3.0', '(GMT+03:00)-Kuwait, Riyadh');
INSERT INTO `timezones` VALUES ('116', '3.0', '(GMT+03:00)-Nairobi');
INSERT INTO `timezones` VALUES ('121', '5.0', '(GMT+05:00)-Ekaterinburg');
INSERT INTO `timezones` VALUES ('122', '5.0', '(GMT+05:00)-Islamabad, Karachi, Tashkent');
INSERT INTO `timezones` VALUES ('123', '5.5', '(GMT+05:30)-Chennai, Kolkata, Mumbai, New Delhi');
INSERT INTO `timezones` VALUES ('124', '5.8', '(GMT+05:45)-Kathmandu');
INSERT INTO `timezones` VALUES ('126', '6.0', '(GMT+06:00)-Astana, Dhaka');
INSERT INTO `timezones` VALUES ('127', '6.0', '(GMT+06:00)-Sri Jayawardenepura');
INSERT INTO `timezones` VALUES ('129', '7.0', '(GMT+07:00)-Bangkok, Hanoi, Jakarta');
INSERT INTO `timezones` VALUES ('131', '8.0', '(GMT+08:00)-Beijing, Chongqing, Hong Kong, Urumqi');
INSERT INTO `timezones` VALUES ('135', '8.0', '(GMT+08:00)-Taipei');
INSERT INTO `timezones` VALUES ('136', '9.0', '(GMT+09:00)-Osaka, Sapporo, Tokyo');
INSERT INTO `timezones` VALUES ('139', '9.5', '(GMT+09:30)-Adelaide');
INSERT INTO `timezones` VALUES ('141', '10.0', '(GMT+10:00)-Brisbane');
INSERT INTO `timezones` VALUES ('142', '10.0', '(GMT+10:00)-Canberra, Melbourne, Sydney');
INSERT INTO `timezones` VALUES ('144', '10.0', '(GMT+10:00)-Hobart');
INSERT INTO `timezones` VALUES ('146', '11.0', '(GMT+11:00)-Magadan, Solomon Is., New Caledonia');
INSERT INTO `timezones` VALUES ('147', '12.0', '(GMT+12:00)-Auckland, Wellington');
INSERT INTO `timezones` VALUES ('149', '13.0', '(GMT+13:00)-Nuku\'alofa ');
INSERT INTO `timezones` VALUES ('150', '-4.5', '(GMT-04:30)-Caracas');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique user ID',
  `user_name` varchar(32) NOT NULL COMMENT 'Username',
  `user_password` varchar(64) NOT NULL COMMENT 'Password',
  `user_email` varchar(64) NOT NULL COMMENT 'E-mail address',
  `user_type` varchar(8) NOT NULL COMMENT 'User type',
  `user_callsign` varchar(32) NOT NULL COMMENT 'User''s callsign',
  `user_locator` varchar(16) NOT NULL COMMENT 'User''s locator',
  `user_firstname` varchar(32) NOT NULL COMMENT 'User''s first name',
  `user_lastname` varchar(32) NOT NULL COMMENT 'User''s last name',
  `user_timezone` int(3) NOT NULL DEFAULT 0,
  `user_lotw_name` varchar(32) DEFAULT NULL,
  `user_lotw_password` varchar(64) DEFAULT NULL,
  `user_eqsl_name` varchar(32) DEFAULT NULL,
  `user_eqsl_password` varchar(64) DEFAULT NULL,
  `user_eqsl_qth_nickname` varchar(32) DEFAULT NULL,
  `active_station_logbook` int(11) DEFAULT NULL,
  `language` varchar(32) default 'english',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '%%FIRSTUSER_NAME%%', '%%FIRSTUSER_PASS%%', '%%FIRSTUSER_MAIL%%', '99', '%%FIRSTUSER_CALL%%', '%%FIRSTUSER_LOCATOR%%', '%%FIRSTUSER_FIRSTNAME%%', '%%FIRSTUSER_LASTNAME%%', '%%FIRSTUSER_TIMEZONE%%', null, null, null, null, null, 1, '%%FIRSTUSER_USERLANGUAGE%%');

-- ----------------------------
-- Records of station_logbooks
-- ----------------------------
INSERT INTO `station_logbooks` VALUES ('1', '1', '%%FIRSTUSER_CITY%%', null, null, 0);

-- ----------------------------
-- Records of station_profile
-- ----------------------------
INSERT INTO `station_profile` VALUES (
'1',
'%%FIRSTUSER_CITY%%',
'%%FIRSTUSER_LOCATOR%%',
'%%FIRSTUSER_CITY%%',
'',
'',
'%%FIRSTUSER_CALL%%',
null,
'%%FIRSTUSER_DXCC%%',
'',
'1',
'1',
'1',
'',
'',
'',
'',
'',
'',
'0',
'1',
'',
'',
'0',
'',
'0',
'',
'https://qo100dx.club/api',
'0',
'0',
'0',
'',
'');

-- ----------------------------
-- Records of station_logbooks_relationship
-- ----------------------------
INSERT INTO `station_logbooks_relationship` VALUES ('1', '1', '1', now());

DROP TABLE IF EXISTS `dxcc_entities`;
CREATE TABLE `dxcc_entities` (
  `adif` smallint(6) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `prefix` varchar(32) NOT NULL,
  `cqz` smallint(6) NOT NULL,
  `ituz` smallint(6) NOT NULL,
  `cont` varchar(5) NOT NULL,
  `long` float NOT NULL,
  `lat` float NOT NULL,
  `end` date DEFAULT NULL,
  `start` date DEFAULT NULL,
  PRIMARY KEY (`adif`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `dxcc_exceptions`;
CREATE TABLE `dxcc_exceptions` (
  `record` int(11) NOT NULL,
  `call` varchar(32) DEFAULT NULL,
  `entity` varchar(255) NOT NULL,
  `adif` smallint(6) NOT NULL,
  `cqz` smallint(6) NOT NULL,
  `cont` varchar(5) NOT NULL,
  `long` float NOT NULL,
  `lat` float NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  PRIMARY KEY (`record`),
  KEY `idx_dxcc_exceptions_logic` (`call`,`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

DROP TABLE IF EXISTS `dxcc_prefixes`;
CREATE TABLE `dxcc_prefixes` (
  `record` int(11) NOT NULL,
  `call` varchar(32) DEFAULT NULL,
  `entity` varchar(255) NOT NULL,
  `adif` smallint(6) NOT NULL,
  `cqz` smallint(6) NOT NULL,
  `cont` varchar(5) NOT NULL,
  `long` float NOT NULL,
  `lat` float NOT NULL,
  `start` date DEFAULT NULL,
  `end` date DEFAULT NULL,
  PRIMARY KEY (`record`),
  KEY `idx_dxcc_prefixes_logic` (`call`,`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
