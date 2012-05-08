-- 
-- Flo Members db dump
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `accounts`
-- 

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `bank` tinytext collate utf8_swedish_ci NOT NULL,
  `account` tinytext collate utf8_swedish_ci NOT NULL,
  `iban` tinytext collate utf8_swedish_ci NOT NULL,
  `swift` tinytext collate utf8_swedish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=2 ;


-- 
-- Dumping data for table `accounts`
-- 

INSERT INTO `accounts` VALUES (1, 'Nordea', '123456-7890', 'FI09 1234 5600 1078 90', 'NDEAFIHH');

-- --------------------------------------------------------

DROP TABLE IF EXISTS `address_changes`;
CREATE TABLE `address_changes` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `type` smallint(6) unsigned NOT NULL default '1',
  `link_person` smallint(6) unsigned NOT NULL,
  `lastname` tinytext NOT NULL,
  `firstname` tinytext,
  `newname` tinytext,
  `address` tinytext,
  `postcode` tinytext NOT NULL,
  `postoffice` tinytext,
  `countrycode` tinytext,
  `country` tinytext,
  `change` smallint(6) unsigned NOT NULL,
  `created` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_person` (`type`,`link_person`,`change`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `bankdata_log`;
CREATE TABLE `bankdata_log` (
  `id` int(10) unsigned zerofill NOT NULL default '0000000000',
  `datetime` datetime default '0000-00-00 00:00:00',
  `transactions` smallint(6) NOT NULL default '0',
  `sum` decimal(10,3) NOT NULL default '0.000',
  `currency` tinytext collate utf8_swedish_ci NOT NULL,
  `account` varchar(14) collate utf8_swedish_ci default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- --------------------------------------------------------

DROP TABLE IF EXISTS `bankdata_nomatch`;
CREATE TABLE `bankdata_nomatch` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `tietuetunnus` tinyint(4) NOT NULL default '0',
  `tilinumero` tinytext collate utf8_swedish_ci NOT NULL,
  `kirjauspaiva` date NOT NULL default '0000-00-00',
  `maksupaiva` date NOT NULL default '0000-00-00',
  `arkistointitunnus` tinytext collate utf8_swedish_ci NOT NULL,
  `viite` tinytext collate utf8_swedish_ci NOT NULL,
  `nimilyhenne` tinytext collate utf8_swedish_ci,
  `rahayksikko` tinyint(4) NOT NULL default '0',
  `nimilahde` tinytext collate utf8_swedish_ci,
  `rahamaara` decimal(5,2) NOT NULL default '0.00',
  `oikaisutunnus` tinyint(4) NOT NULL default '0',
  `valitystapa` tinytext collate utf8_swedish_ci,
  `palautekoodi` tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `contacts`
-- 

DROP TABLE IF EXISTS `contacts`;
CREATE TABLE IF NOT EXISTS `contacts` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `lastname` tinytext collate utf8_swedish_ci NOT NULL,
  `firstname` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `address` tinytext collate utf8_swedish_ci,
  `extraaddress` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci NOT NULL,
  `postoffice` tinytext collate utf8_swedish_ci,
  `countrycode` tinytext collate utf8_swedish_ci,
  `country` tinytext collate utf8_swedish_ci,
  `extrainfo` text collate utf8_swedish_ci,
  `reference` tinytext collate utf8_swedish_ci,
  `residency` tinytext collate utf8_swedish_ci,
  `link_info` tinyint(3) unsigned NOT NULL default '0',
  `link_sex` tinyint(3) unsigned default NULL,
  `link_region` tinyint(3) unsigned default NULL,
  `link_province` tinyint(3) unsigned default NULL,
  `dateOfBirth` date default NULL,
  `language` tinytext collate utf8_swedish_ci,
  `is_notdoubles` tinyint(3) unsigned NOT NULL default '0',
  `is_foreign` tinyint(3) unsigned NOT NULL default '0',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `contacts`
-- 

INSERT INTO `contacts` VALUES (1, 'Tuominen', 'Ville', NULL, NULL, 'Paraistentie 17', NULL, '00280', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'fin', 0, 0, '2008-03-05');
INSERT INTO `contacts` VALUES (2, 'Eerola', 'Keijo', NULL, NULL, 'Ida Aalbergin tie 2', NULL, '00400', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'fin', 0, 0, '2009-02-05');
INSERT INTO `contacts` VALUES (3, 'Keskinen', 'Keijo', 'eetu@testi.fi', NULL, 'Ida Aalbergin tie 5', NULL, '00400', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, 'fin', 0, 0, '2009-02-05');

-- Contact history

DROP TABLE IF EXISTS `contact_history`;
CREATE TABLE `contact_history` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `date` date NOT NULL,
  `link_contact` smallint(5) unsigned NOT NULL default '0',
  `link_member` smallint(5) unsigned NOT NULL default '0',
  `link_payer` smallint(5) unsigned NOT NULL default '0',
  `link_subscriber` smallint(5) unsigned NOT NULL default '0',
  `contacted_by` tinytext collate utf8_swedish_ci,
  `link_contactmethod` tinyint(3) unsigned NOT NULL,
  `subject` text collate utf8_swedish_ci NOT NULL,
  `followup` text collate utf8_swedish_ci,
  `wait_till_date` date default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- Customizations

DROP TABLE IF EXISTS `custom_settings`;
CREATE TABLE `custom_settings` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `type` enum('select') collate utf8_swedish_ci NOT NULL,
  `required` tinyint(1) NOT NULL default '0',
  `required_in_application` tinyint(1) NOT NULL default '0',
  `show_in_application_form` tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

DROP TABLE IF EXISTS `custom_values`;
CREATE TABLE `custom_values` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `link_setting` smallint(5) unsigned NOT NULL,
  `use_as_label` tinyint(1) unsigned NOT NULL default '0',
  `fin` tinytext collate utf8_swedish_ci,
  `sve` tinytext collate utf8_swedish_ci,
  `eng` tinytext collate utf8_swedish_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- Email drafts

DROP TABLE IF EXISTS `emailDrafts`;
CREATE TABLE `emailDrafts` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `heading` tinytext collate utf8_swedish_ci,
  `draft` text collate utf8_swedish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=2 ;

INSERT INTO `emailDrafts` VALUES (1, 'Laskujen oheisteksti', 'Lasku', 'Hei,\nLiitteenä lasku.');

-- Emails

DROP TABLE IF EXISTS `emails`;
CREATE TABLE `emails` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `ids` text collate utf8_swedish_ci,
  `recipients` text collate utf8_swedish_ci,
  `subject` tinytext collate utf8_swedish_ci,
  `message` text collate utf8_swedish_ci,
  `attachments` text collate utf8_swedish_ci,
  `timestamp` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- Events

DROP TABLE IF EXISTS `events`;
CREATE TABLE `events` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `date` date NOT NULL,
  `deadline` date NOT NULL,
  `info_www` text collate utf8_swedish_ci NOT NULL,
  `info_mail` text collate utf8_swedish_ci NOT NULL,
  `max_participants` smallint(5) unsigned default '65000',
  `guests_allowed` tinyint(1) NOT NULL,
  `transport_from` tinyint(1) NOT NULL,
  `transport_to` tinyint(1) NOT NULL,
  `organiser` tinytext collate utf8_swedish_ci NOT NULL,
  `organiser_email` tinytext collate utf8_swedish_ci NOT NULL,
  `show_name_fields` tinyint(1) unsigned NOT NULL default '1',
  `is_name_mandatory` tinyint(1) unsigned NOT NULL default '1',
  `show_email_field` tinyint(1) unsigned NOT NULL default '1',
  `is_email_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `show_phone_field` tinyint(1) unsigned NOT NULL default '1',
  `is_phone_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `show_organization_fields` tinyint(1) unsigned NOT NULL default '1',
  `is_organization_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `show_country_field` tinyint(1) unsigned NOT NULL default '1',
  `is_country_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `show_diet_field` tinyint(1) unsigned NOT NULL default '0',
  `show_extrainfo_field` tinyint(1) unsigned NOT NULL default '1',
  `is_extrainfo_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `show_appellation_field` tinyint(1) unsigned NOT NULL default '0',
  `show_invoicing_address_field` tinyint(1) unsigned NOT NULL default '0',
  `extrainfo_descr` tinytext collate utf8_swedish_ci,
  `checkbox_value_1` tinytext collate utf8_swedish_ci,
  `checkbox_value_2` tinytext collate utf8_swedish_ci,
  `checkbox_value_3` tinytext collate utf8_swedish_ci,
  `checkbox_value_4` tinytext collate utf8_swedish_ci,
  `checkbox_value_5` tinytext collate utf8_swedish_ci,
  `checkbox_value_6` tinytext collate utf8_swedish_ci,
  `checkbox_value_7` tinytext collate utf8_swedish_ci,
  `checkbox_value_8` tinytext collate utf8_swedish_ci,
  `checkbox_value_9` tinytext collate utf8_swedish_ci,
  `checkbox_value_10` tinytext collate utf8_swedish_ci,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `event_registrations`
--

DROP TABLE IF EXISTS `event_registrations`;
CREATE TABLE `event_registrations` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `link_event` smallint(5) unsigned NOT NULL,
  `link_member` varchar(10) collate utf8_swedish_ci default NULL,
  `lastname` tinytext collate utf8_swedish_ci,
  `firstname` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `organisation` tinytext collate utf8_swedish_ci,
  `organisation_address` text collate utf8_swedish_ci,
  `country` tinytext collate utf8_swedish_ci,
  `extra` text collate utf8_swedish_ci,
  `transport_to` tinyint(1) default NULL,
  `transport_from` tinyint(1) default NULL,
  `guest_coming` tinyint(1) default NULL,
  `guest_name` tinytext collate utf8_swedish_ci,
  `guest_organisation` tinytext collate utf8_swedish_ci,
  `guest_email` tinytext collate utf8_swedish_ci,
  `cancel_code` tinytext collate utf8_swedish_ci NOT NULL,
  `appellation` tinytext collate utf8_swedish_ci,
  `invoicing_address` text collate utf8_swedish_ci,
  `diet` text collate utf8_swedish_ci,
  `checkbox_value_1` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_2` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_3` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_4` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_5` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_6` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_7` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_8` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_9` tinyint(1) unsigned NOT NULL default '0',
  `checkbox_value_10` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `link_event` (`link_event`),
  KEY `link_member` (`link_member`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;


-- 
-- Table structure for table `extra_invoice_options`
-- 

DROP TABLE IF EXISTS `extra_invoice_options`;
CREATE TABLE `extra_invoice_options` (
  `id` SMALLINT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
  `name` TINYTEXT NOT NULL ,
  `value` decimal(10,2) NOT NULL
) ENGINE = MYISAM ;

-- 
-- Table structure for table `form_options`
-- 

DROP TABLE IF EXISTS `form_options`;
CREATE TABLE `form_options` (
  `id` tinyint(3) unsigned NOT NULL auto_increment,
  `show_appellation_field` tinyint(1) unsigned NOT NULL default '1',
  `show_born_field` tinyint(1) unsigned NOT NULL default '1',
  `show_info_type_field` tinyint(1) unsigned NOT NULL default '1',
  `show_sex_field` tinyint(1) unsigned NOT NULL default '1',
  `show_employer_field` tinyint(1) unsigned NOT NULL default '0',
  `show_invoicing_address_field` tinyint(1) unsigned NOT NULL default '0',
  `show_language_field` tinyint(1) unsigned NOT NULL default '0',
  `show_region_fields` tinyint(1) unsigned NOT NULL default '0',
  `show_membership_prices` tinyint(1) unsigned NOT NULL default '0',
  `write_invoice_on_success` tinyint(1) unsigned NOT NULL default '0',
  `descr` text collate utf8_swedish_ci,
  `disclaimer` text collate utf8_swedish_ci,
  `info` text collate utf8_swedish_ci,
  `is_email_mandatory` tinyint(1) unsigned NOT NULL default '1',
  `is_born_field_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `is_employer_field_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `is_sex_field_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `is_phone_field_mandatory` tinyint(1) unsigned NOT NULL default '0',
  `payment_schedule` tinyint(1) unsigned NOT NULL default '2',
  `link_account` tinyint(3) unsigned default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

INSERT INTO `form_options` (id, show_region_fields) VALUES (DEFAULT, 1);


-- 
-- Table structure for table `groups`
-- 

DROP TABLE IF EXISTS `groups`;
CREATE TABLE `groups` (
  `id` smallint(6) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `groupFee` decimal(10,2) unsigned default NULL,
  `hide_in_member_view` tinyint(1) default '0',
  `show_in_application_form` tinyint(1) unsigned NOT NULL default '0',
  `visible_to_views` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`(45))
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- Dumping data for table `groups`
-- 

INSERT INTO `groups` VALUES (1, 'Yhdistyksen hallitus', NULL, 0, 0, 0);
INSERT INTO `groups` VALUES (2, 'Sählyporukka', NULL, 0, 0, 0);

-- --------------------------------------------------------

-- 
-- Table structure for table `groups_contacts`
-- 

DROP TABLE IF EXISTS `groups_contacts`;
CREATE TABLE `groups_contacts` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `link_group` mediumint(8) unsigned NOT NULL,
  `link_contact` mediumint(8) unsigned NOT NULL,
  `link_role` smallint(5) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  KEY `link_group` (`link_group`),
  KEY `link_contact` (`link_contact`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- Dumping data for table `groups_contacts`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `groups_members`
-- 

DROP TABLE IF EXISTS `groups_members`;
CREATE TABLE `groups_members` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `link_group` mediumint(8) unsigned NOT NULL,
  `link_member` mediumint(8) unsigned NOT NULL default '0',
  `link_role` smallint(5) unsigned NOT NULL default '0',
  `link_application` mediumint(8) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `link_group` (`link_group`),
  KEY `link_member` (`link_member`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- Dumping data for table `groups_members`
-- 

INSERT INTO `groups_members` VALUES (1, 1, 14, 1, NULL);
INSERT INTO `groups_members` VALUES (2, 1, 79, 0, NULL);
INSERT INTO `groups_members` VALUES (3, 2, 11, 0, NULL);
INSERT INTO `groups_members` VALUES (4, 2, 12, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `invoicerows`
--

DROP TABLE IF EXISTS `invoicerows`;
CREATE TABLE IF NOT EXISTS `invoicerows` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `link_invoice` smallint(5) unsigned NOT NULL,
  `descr` tinytext collate utf8_swedish_ci NOT NULL,
  `price` decimal(10,2) default '0.00',
  `vat` tinyint(3) unsigned NOT NULL default '0',
  `link_subscriber` smallint(6) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `link_invoice` (`link_invoice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `invoicerows`
--

INSERT INTO `invoicerows` VALUES (1, 1, 'Jäsenmaksu', 20.00, 0, NULL);


-- --------------------------------------------------------

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
CREATE TABLE IF NOT EXISTS `invoices` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `link_contact` smallint(5) unsigned NOT NULL default '0',
  `link_member` smallint(5) unsigned NOT NULL default '0',
  `link_payer` smallint(5) unsigned NOT NULL default '0',
  `link_subscriber` smallint(5) unsigned NOT NULL default '0',
  `link_application` smallint(5) unsigned NOT NULL default '0',
  `link_registration` smallint(5) unsigned NOT NULL default '0',
  `link_state` tinyint(3) unsigned NOT NULL default '0',
  `link_account` tinyint(3) unsigned NOT NULL default '1',
  `refnr` varchar(20) collate utf8_swedish_ci default NULL,
  `duedate` date default NULL,
  `postage` decimal(4,2) unsigned default NULL,
  `paiddate` date default NULL,
  `paidsum` decimal(10,2) default NULL,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `ourreference` tinytext collate utf8_swedish_ci,
  `yourreference` tinytext collate utf8_swedish_ci,
  `custom_reference` smallint(4) default NULL,
  `invoiceaddress` tinytext collate utf8_swedish_ci,
  `info` text collate utf8_swedish_ci,
  `is_sum_hidden` tinyint(3) unsigned NOT NULL default '0',
  `link_log` smallint(5) unsigned NOT NULL default '0',
  `amount` decimal(10,2) NOT NULL default '0.00',
  `is_midyear` tinyint(3) unsigned NOT NULL default '0',
  `is_sent_by_email` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `refnr` (`refnr`),
  KEY `link_account` (`link_account`),
  KEY `link_member` (`link_member`),
  KEY `link_log` (`link_log`),
  KEY `link_subscriber` (`link_subscriber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `invoices`
--

INSERT INTO `invoices` VALUES (1, 0, 90, 0, 0, 0, 0, 0, 1, '200900000010', '2009-03-05', NULL, NULL, NULL, '2009-02-19 19:09:59', NULL, NULL, NULL, NULL, NULL, 0, 1, 20.00, 1, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `invoices_log`
-- 

DROP TABLE IF EXISTS `invoices_log`;
CREATE TABLE IF NOT EXISTS `invoices_log` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  `type` enum('event','group','members','payers','single','subscribers') collate utf8_swedish_ci NOT NULL,
  `group_name` tinytext collate utf8_swedish_ci,
  `year` smallint(5) unsigned default NULL,
  PRIMARY KEY  (`id`),
  KEY `type` (`type`),
  KEY `year` (`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

INSERT INTO `invoices_log` VALUES (1, '2009-02-19 19:09:59', 'single', NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `members_history`
-- 

DROP TABLE IF EXISTS `members_history`;
CREATE TABLE `members_history` (
  `year` int(10) unsigned NOT NULL,
  `members` int(10) unsigned NOT NULL,
  `timestamp` timestamp NOT NULL default '0000-00-00 00:00:00' on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`year`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- 
-- Dumping data for table `members_history`
-- 

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` int(11) NOT NULL auto_increment,
  `headingFin` tinytext collate utf8_swedish_ci NOT NULL,
  `contentFin` text collate utf8_swedish_ci NOT NULL,
  `headingEng` tinytext collate utf8_swedish_ci NOT NULL,
  `contentEng` text collate utf8_swedish_ci NOT NULL,
  `mainDate` date NOT NULL,
  `endDate` date default NULL,
  `publishDate` date NOT NULL,
  `archiveDate` date default NULL,
  `link_category` tinyint(3) unsigned NOT NULL default '1',
  `link_user` tinyint(3) unsigned NOT NULL default '1',
  `is_approvalRequested` tinyint(3) unsigned NOT NULL default '0',
  `is_approved` tinyint(3) unsigned NOT NULL default '0',
  `is_frontpageNews` tinyint(3) unsigned NOT NULL default '0',
  `is_archivable` tinyint(3) unsigned NOT NULL default '1',
  `date` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `news`
--

INSERT INTO `news` (`id`, `headingFin`, `contentFin`, `headingEng`, `contentEng`, `mainDate`, `endDate`, `publishDate`, `archiveDate`, `link_category`, `link_user`, `is_approvalRequested`, `is_approved`, `is_frontpageNews`, `is_archivable`, `date`) VALUES
(1, 'Mikä materiaali mihinkin kenkään?', '<p>Seminaari ja keskustelutilaisuus Vaasassa. Paikalle odotetaan noin kolmeasataa kenkäentusiastia ympäri Pohjoismaita. Ilmoittautumisaika päättyy 1.3.2009.</p>', '', '', '2009-04-05', NULL, '2009-04-02', '2010-02-11', 1, 1, 0, 0, 0, 1, '2009-02-02 16:45:09'),
(2, 'Kansainvälinen jalkapäivä', '<p>Paljon erilaisia tapahtumia jalkoihin liittyen. Kaikki jalkaintoilijat tervetuloa!</p>', '', '', '2009-04-12', NULL, '2009-02-02', '2010-10-12', 1, 1, 0, 0, 0, 1, '2009-02-02 16:46:29'),
(3, 'Kenkien historiaa', '<p>Seminaari kenkien historiasta pidetään Säätytalolla Helsingissä 4.12.2009. Puhujina ovat muun muassa yhdistyksen puheenjohtaja Martti Pielonen ja hallituksen jäsen Pekka Korpi. Ilmoittautumiset sihteerille!</p>', '', '', '2009-12-04', NULL, '2009-02-02', '2010-12-04', 1, 1, 0, 0, 0, 1, '2009-02-02 16:47:59');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
CREATE TABLE IF NOT EXISTS `pages` (
  `id` int(11) NOT NULL auto_increment,
  `heading` tinytext collate utf8_swedish_ci NOT NULL,
  `content` text collate utf8_swedish_ci NOT NULL,
  `headingEng` tinytext collate utf8_swedish_ci,
  `contentEng` text collate utf8_swedish_ci,
  `url` varchar(60) collate utf8_swedish_ci NOT NULL,
  `childTo` varchar(60) collate utf8_swedish_ci,
  `subChildTo` tinytext collate utf8_swedish_ci,
  `itemOrder` int(10) unsigned NOT NULL default '0',
  `showInNavigation` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `unique_url` ( `url` , `childTo` )
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=13 ;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` VALUES (1, 'Tervetuloa', '<p>Kenk&auml;yhdistys Popot ry. on kaikille kengist&auml; kiinnostuneille ja kenk&auml;valmistajille ja -ker&auml;ilij&ouml;ille tarkoitettu yhdistys.</p><p>Sivuiltamme l&ouml;yd&auml;t tietoa yhdistyksen toiminnasta, sen historiasta, j&auml;seneksi liittymisest&auml; ja kenk&auml;tietoutta.</p><p><img alt="Kuva #1" src="images/main/shoe.jpg" /><em>Oheiseen kenkään voit tutustua osoitteessa <a href="http://www.slipperybrick.com/2007/09/cd-player-shoe/">http://www.slipperybrick.com/2007/09/cd-player-shoe/</a></em></p>', NULL, NULL, 'index', NULL, NULL, 1, 1);
INSERT INTO `pages` VALUES (3, 'Popot ry', '<p><span>\n</span></p><p>Yhdistyksemme tuo kengistä kiinnostuneet yhteen iästä, ammatista ja asuinpaikasta riippumatta. Yhdistys on perustettu vuonna 1998 ja sen jäseneksi voi liittyä kuka tahansa kengistä kiinnostunut.</p>\n<p>186 hengen jäsenkuntamme on kirjava: ikähaarukka on 14–77 v. , jäseniä löytyy lähes 200 eri kunnasta ja joukkoon mahtuu niin koululaisia, suutareita, johtajia kuin eläkeläisiäkin.</p>\nJärjestämme erilaisia kenkäaiheisia juhlia, seminaareja, keskustelutilaisuuksia ja muita tapahtumia. Voit lukea niistä lisää sivulta Toiminta &gt; Tapahtumat.<br />', NULL, NULL, 'popot-ry', NULL, NULL, 3, 1);
INSERT INTO `pages` VALUES (4, 'Hallitus 2009', '<p><strong>Huom.</strong> Flo 2.0 salaa sähköpostiosoitteet spämmiroboteilta automaattisesti!</p><p><strong>Hallituksen puheenjohtaja</strong><br />\r\nMartti Pielonen<br />\r\n<a href="mailto:martti.pielonen@popotry.fi">martti.pielonen@popotry.fi</a></p>\r\n<p><strong>Hallituksen varapuheenjohtaja </strong><br />\r\nSanna V&auml;is&auml;nen<br />\r\n<a href="mailto:sanna.vaisanen@popotry.fi">sanna.vaisanen@popotry.fi</a>&nbsp;</p>\r\n<p><strong>Hallituksen j&auml;senet:</strong>&nbsp;</p>\r\n<p>Pekka Korpi<br />\r\n<a href="mailto:pekka.korpi@popotry.fi">pekka.korpi@popotry.fi</a></p>\r\n<p>Hanna Kuusela<br />\r\n<a href="mailto:hanna.kuusela@popotry.fi">hanna.kuusela@popotry.fi</a></p>\r\n<p>Henriikka Sav&eacute;n<br />\r\n<a href="mailto:henriikka.saven@popotry.fi">henriikka.saven@popotry.fi</a></p>\r\n<p>Sami Lepp&auml;nen<br />\r\n<a href="mailto:sami.leppanen@popotry.fi">sami.leppanen@popotry.fi</a></p>\r\n<p>Kalle Syv&auml;oja<br />\r\n<a href="mailto:kalle.syvaoja@popotry.fi">kalle.syvaoja@popotry.fi</a></p>\r\n<p>Veera Kangas<br />\r\n<a href="mailto:veera.kangas@popotry.fi">veera.kangas@popotry.fi</a></p>\r\n<p>Elisa Kuura<br />\r\n<a href="mailto:elisa.kuura@popotry.fi">elisa.kuura@popotry.fi</a></p>\r\n<p><strong>Toimihenkil&ouml;t:&nbsp;</strong></p>\r\n<p>Sihteeri<br />\r\nM&aring;ns Berglund<br />\r\n<a href="mailto:mans.berglund@popotry.fi">mans.berglund@popotry.fi</a></p>\r\n<p>Taloudenhoitaja<br />\r\nVesa Huurila<br />\r\n<a href="mailto:vesa.huurila@popotry.fi">vesa.huurila@popotry.fi</a></p>\r\n<p>Tiedottaja<br />\r\nKaisa Liimatainen<br />\r\n<a href="mailto:kaisa.liimatainen@popotry.fi">kaisa.liimatainen@popotry.fi</a></p>', NULL, NULL, 'hallitus-2009', 'popot-ry', NULL, 4, 1);
INSERT INTO `pages` VALUES (5, 'Yhdistyksen historiaa', '<p>\n</p><p>Yhdistys perustettiin vuonna 1998 kahden yhteistä liikettä pitävän suutarin ja yhden kenkäkeräilijän, heidän erään kanta-asiakkaansa, voimin. Kenkäkeräilijä harmitteli eräänä päivänä suutareille ääneen, miten hänellä ei omassa tuttavapiirissään ole toista kenkäkeräilijää, jonka kanssa voisi vaihtaa kokemuksia kenkäkaupoista ja suositella helmiä, kertoa ja vastaanottaa kenkienhoitovinkkejä, keskustella ja kuulla erilaisista kenkämerkeistä ja -malleista ja ylipäätään jakaa harrastuksensa. Suutarit puolestaan harmittelivat, kuinka he tietävät heidän asiakaskunnassaan olevan lukuisia kenkäkeräilijöitä, mutta eivät keksineet kuinka saattaa heidät yhteen. Suomihan kuitenkin on yhdistysten luvattu maa, ja kolmikon lyödessä viisaat päänsä yhteen syntyi ajatus kenkäyhdistyksestä, joka keräisi yhteen kenkäintoilijoita niin paikallisesti kuin kautta maan.</p>\nAluksi yhdistys toimi vain perustajien kotikunnassa ja yhteydenpito hoitui suutarien ilmoitustaululla. Nyttemmin yhdistys on kasvanut huimasti, jäsenmäärä on 186 ja se toimii maanlaajuisesti. Se on kerännyt yhteen monia kengistä kiinnostuneita, niin harrastajia kuin ammattilaisiakin, jotka vaihtavat tietoa, vinkkejä ja mielipiteitä – sekä kengät omistajaa. Lisäksi yhdistyksen kautta moni on löytänyt toisistaan sydänystäviä, ja onpa muutamia romanssejakin syntynyt!', NULL, NULL, 'yhdistyksen-historiaa', 'popot-ry', NULL, 5, 1);
INSERT INTO `pages` VALUES (6, 'Jäsenyys', '<p>Sek&auml; yksityishenkil&ouml;t ett&auml; yritykset voivat olla Popot ry:n j&auml;seni&auml;. Henkil&ouml;j&auml;senyydest&auml; saat tiet&auml;&auml; lis&auml;&auml; Liity j&auml;seneksi -sivulla, yrityksen kannatusj&auml;senyydest&auml; puolestaan on kerrottu enemm&auml;n Kannatusj&auml;senet-sivulla.</p>', NULL, NULL, 'jasenyys', NULL, NULL, 6, 1);
INSERT INTO `pages` VALUES (7, 'Liity jäseneksi', '<p>\n</p><p>Popot ry:n jäsenyydestä on paljon iloa ja hyötyä kenkäfriikeille! Järjestämme paljon hauskoja tapahtumia sekä paikallisyhdistysten kautta että kansallisia tapahtumia. Tutustut helposti uusiin, mukaviin ihmisiin, joiden kanssa sinulla on yhteinen kiinnostuksen aihe, ja pääset vaihtamaan sekä vinkkejä että kokemuksia, ja parhaimmillaan myös kengät vaihtavat omistajaa.</p>\n<p>Jäsenmaksu on normaalihintaisena 25 euroa/vuosi, nuori 20 euroa/vuosi, junnu 10 euroa/vuosi ja perhejäsenyydet 17 euroa/jäsen/vuosi.</p>\n<p>Jäsenille postitetaan kolme kertaa vuodessa jäsenlehti "Popotuttaa".</p>\n<p>Yhteistyökumppaneillamme on säännöllisesti tarjouksia ja kampanjoita yhdistyksemme jäsenille, minkä lisäksi yhdistyksen jäsenet saavat aina kymmenen prosentin alennuksen seuraavista liikkeistä: Kenkäkauppa Mono (Helsinki, Vantaa, Turku ja Salo), Pumps (Espoo, Lappeenranta, Oulu), Boot Store -verkkokauppa, MinSandal (useita liikkeitä ympäri maan), Kenkähirmu (Kuopio) sekä Jalkataivas (Helsinki).</p>\n<p>Voit liittyä jäseneksi liittymislomakkeella.</p>\nOngelmatilanteissa ota yhteyttä yhdistyksen taloudenhoitajaan, Vesa Huurilaan.', NULL, NULL, 'liity-jaseneksi', 'jasenyys', NULL, 7, 1);
INSERT INTO `pages` VALUES (8, 'Kannatusjäsenet', '<p>\n</p><p>Kenkäaiheiset yritykset, kaupat, koulut ynnä vastaavat voivat liittyä Popot ry:n kannatusjäseniksi maksamalla vuosittaisen 150 euron kannatusjäsenmaksun. Vastineeksi teet yritystäsi/kouluasi/tms. tunnetuksi alan harrastajien parissa – jokaisesta uudesta kannatusjäsenestä teemme jutun jäsenlehteemme, ja jatkossakin ilmoittaminen ja mainostaminen on kannatusjäsenille erittäin edullista. Myös esittelykojun vuokraaminen tapahtumiimme on kannatusjäsenille huomattavasti edullisempaa normaalihintaan verrattuina, ja luonnollisesti myös muita ideoita saa tuoda esille – toteutamme niitä parhaamme mukaan!</p>\nMikäli olet kiinnostunut kannatusjäsenyydestä, ota yhteyttä yhdistyksen taloudenhoitajaan, Vesa Huurilaan.', NULL, NULL, 'kannatusjasenet', 'jasenyys', NULL, 8, 1);
INSERT INTO `pages` VALUES (9, 'Toiminta', '<p>Popot ry:n toiminta on monipuolista &ndash; j&auml;rjest&auml;mme sek&auml; erilaisia tapahtumia ett&auml; kilpailuja, sek&auml; toimimme yhteisty&ouml;ss&auml; muiden j&auml;rjest&auml;vien tahojen kanssa. Lue lis&auml;&auml; Tapahtumat- tai Kilpailut-osioista.</p>\r\n<table width="90%" border="0" cellpadding="1" cellspacing="1">\r\n    <tbody>\r\n        <tr>\r\n<td><img width="155" height="200" alt="Kuva #1" src="images/main/0309/kroona5_elo08.jpg" /></td>\r\n<td>J&auml;rjest&auml;mme esimerkiksi koirauintia.</td>\r\n</tr>\r\n<tr>\r\n<td><img width="236" height="200" alt="Kuva #2" src="images/main/0309/kroona6_elo08.jpg" /></td>\r\n<td>My&ouml;s nuuhkiminen kuuluu asiaan.</td>\r\n</tr>\r\n</tbody>\r\n</table>', NULL, NULL, 'toiminta', NULL, NULL, 9, 1);
INSERT INTO `pages` VALUES (10, 'Tapahtumat', '<p> </p>\n<p>Järjestämme erilaisia kenkäaiheisia juhlia, seminaareja, keskustelutilaisuuksia ja muita tapahtumia.</p>\n<p>Tulevia tapahtumia:<br />\n5.2.2009 seminaari ja keskustelutilaisuus: Mikä materiaali mihinkin kenkään?<br />\n14.3.2009 <span>kenkäkirpputori<br />\n4.5.2009 seminaari: Kenkien historiaa<br />\n10.6.2009 kesäjuhla: teemana sandaalit<br />\nKESÄTAUKO<br />\n9.9.2009 syyskauden avajaisjuhla: teemana kumisaappaat<br />\n10.10.2009 työpaja: Pohja vedenpitäväksi<br />\n25.11.2009 kenkäkirpputori<br />\n13.12.2009 pikkujoulut<br />\n20.12.2009 joulunäytelmä: ”Petteri Punakuonon uudet tinakengät”</span></p>', NULL, NULL, 'tapahtumat', 'toiminta', NULL, 10, 1);
INSERT INTO `pages` VALUES (11, 'Kilpailut', '<p>Suunnittele kauneimmat keng&auml;nnauhat! L&auml;het&auml; ehdotuksesi kuvatiedostona s&auml;hk&ouml;postin liitteen&auml; Hanna Kuuselalle osoitteeseen <a href="mailto:hanna.kuusela@popotry.fi">hanna.kuusela@popotry.fi</a> 16.2. klo 15 menness&auml;.</p>\r\n<p>Parhaat palkitaan Kenk&auml;kauppa Monon lahjakortein.</p>', NULL, NULL, 'kilpailut', 'toiminta', NULL, 11, 1);
INSERT INTO `pages` VALUES (12, 'Yhteystiedot', '<p>Kahlaajankuja 8 B 12, 00670 Helsinki.</p>\r\n<p>puh. &amp; fax 09-789457</p>\r\n<p><a href="mailto:hallitus@popotry.fi">hallitus@popotry.fi</a></p>', NULL, NULL, 'yhteystiedot', NULL, NULL, 12, 1);


-- --------------------------------------------------------

-- 
-- Table structure for table `roles`
-- 

DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` tinyint(6) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `visible_to_views` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`(30))
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

INSERT INTO `roles` VALUES (1, "Puheenjohtaja", 0);

-- 
-- Table structure for table `smscount`
-- 

DROP TABLE IF EXISTS `smscount`;
CREATE TABLE `smscount` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `sms` text collate utf8_swedish_ci NOT NULL,
  `time` timestamp NOT NULL default CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

-- 
-- Table structure for table `tblbanned`
-- 

DROP TABLE IF EXISTS `tblbanned`;
CREATE TABLE `tblbanned` (
  `ip` varchar(20) collate utf8_swedish_ci NOT NULL default '',
  `datetime` datetime NOT NULL default '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- 
-- Dumping data for table `tblbanned`
-- 

-- --------------------------------------------------------

-- 
-- Table structure for table `tbllimbo`
-- 

DROP TABLE IF EXISTS `tbllimbo`;
CREATE TABLE `tbllimbo` (
  `id` smallint(5) unsigned NOT NULL default '0',
  `lastname` tinytext collate utf8_swedish_ci NOT NULL,
  `firstname` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `address` tinytext collate utf8_swedish_ci,
  `extraaddress` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci,
  `postoffice` tinytext collate utf8_swedish_ci,
  `extrainfo` text collate utf8_swedish_ci,
  `link_type` tinyint(3) unsigned default NULL,
  `link_info` tinyint(3) unsigned default NULL,
  `link_sex` tinyint(3) unsigned default NULL,
  `born` smallint(5) unsigned default NULL,
  `date` date NOT NULL default '0000-00-00',
  `reason` tinytext collate utf8_swedish_ci NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- 
-- Dumping data for table `tbllimbo`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tblmembers`
-- 

DROP TABLE IF EXISTS `tblmembers`;
CREATE TABLE `tblmembers` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `memberid` varchar(10) collate utf8_swedish_ci NOT NULL default '',
  `lastname` tinytext collate utf8_swedish_ci NOT NULL,
  `firstname` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `mobile` tinytext collate utf8_swedish_ci,
  `address` tinytext collate utf8_swedish_ci,
  `extraaddress` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci,
  `postoffice` tinytext collate utf8_swedish_ci,
  `countrycode` tinytext collate utf8_swedish_ci,
  `country` tinytext collate utf8_swedish_ci,
  `extrainfo` text collate utf8_swedish_ci,
  `invoicing_address` text collate utf8_swedish_ci,
  `reference` tinytext collate utf8_swedish_ci,
  `businessid` tinytext collate utf8_swedish_ci,
  `ovt` tinytext collate utf8_swedish_ci,
  `invoice_preference` tinyint(1) unsigned NOT NULL default '1',
  `discount_years` tinytext collate utf8_swedish_ci,
  `pension_discount` tinyint(1) unsigned NOT NULL default '0',
  `link_type` tinyint(3) unsigned NOT NULL default '0',
  `link_info` tinyint(3) unsigned NOT NULL default '0',
  `link_sex` tinyint(3) unsigned default NULL,
  `link_region` tinyint(3) unsigned default NULL,
  `link_province` tinyint(3) unsigned default NULL,
  `born` date default '0000-00-00',
  `language` tinytext collate utf8_swedish_ci,
  `is_notdoubles` tinyint(3) unsigned NOT NULL default '0',
  `is_foreign` tinyint(3) NOT NULL default '0',
  `date` date NOT NULL default '0000-00-00',
  `residency` tinytext collate utf8_swedish_ci,
  `nationality` tinytext collate utf8_swedish_ci,
  `appellation` tinytext collate utf8_swedish_ci,
  `employer` tinytext collate utf8_swedish_ci,
  `employer_address` tinytext collate utf8_swedish_ci,
  `employer_postcode` tinytext collate utf8_swedish_ci,
  `employer_postoffice` tinytext collate utf8_swedish_ci,
  `password` varchar(60) collate utf8_swedish_ci default NULL,
  `is_onetime_password` tinyint(1) unsigned NOT NULL default '1',
  `is_resign_requested` tinyint(1) unsigned NOT NULL default '0',
  `resign_date` date default NULL,
  `custom1` varchar(128) collate utf8_swedish_ci default NULL,
  `is_password_sent` tinyint(1) unsigned NOT NULL default '0',
  `is_publishing_permission` tinyint(1) unsigned NOT NULL default '0',
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  `last_updated_by` tinytext collate utf8_swedish_ci,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `memberid` (`memberid`),
  KEY `link_type` (`link_type`),
  KEY `link_info` (`link_info`),
  FULLTEXT KEY `lastname` (`lastname`)
) ENGINE=MyISAM AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- create a copy of tblmembers as applications but drop index
-- 

DROP TABLE IF EXISTS `applications`;
CREATE TABLE applications LIKE tblmembers;
ALTER TABLE `applications` DROP INDEX `memberid`;

-- 
-- Dumping data for table `tblmembers`
-- 

INSERT INTO `tblmembers` VALUES (1, '0800001', 'Joentakanen', 'Hilja', NULL, NULL, '050 1234567', 'Tasankotie 1', NULL, '00730', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 3, 2, 2, 19, 1, '1945-01-08', 'fin', 0, 0, '2008-07-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '88747a1e3aef6d8b41e8a2db4e2d326aa8e5db0495e68c130', 0, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (2, '0800002', 'Lampila', 'Rolf W.', NULL, NULL, '050 1234567', 'Kirkkotie 2', NULL, '19600', 'HARTOLA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 3, 2, 1, 19, 1, '1968-07-04', 'fin', 0, 0, '2009-03-05', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (3, '0800003', 'Kaukajärvi', 'Johanna', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, '1972-05-05', 'fin', 0, 0, '2008-05-09', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (4, '0800004', 'Liljeroos', 'Kari', NULL, NULL, '050 1234567', 'Enqvistinkatu 5', NULL, '33400', 'TAMPERE', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, '1982-06-26', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (5, '0800005', 'Karpoff', 'Mika', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, '1986-12-12', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (6, '0800006', 'Toppoinen', 'Helena', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, '1968-07-07', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (7, '0800007', 'Salmioja', 'Erkki', NULL, NULL, '050 1234567', 'Jousitie 25', NULL, '19650', 'JOUTSA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, '1955-02-02', 'fin', 0, 0, '2009-03-11', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (8, '0800008', 'Lappeteläinen', 'Matti', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, '1958-03-07', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (9, '0800009', 'Haavikko', 'Sirkka-Liisa', 'tapio.nurminen@helsinki.fi', NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, '1943-01-28', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (10, '0800010', 'Naumov', 'Tuulikki', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (11, '0800011', 'Elomaa', 'Pirkko', 'tapio.nurminen@helsinki.fi', NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (12, '0800012', 'Vääränen', 'Erkki', NULL, NULL, '050 1234567', 'Kirkkokatu 6', NULL, '60100', 'SEINÄJOKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (13, '0800013', 'Benekini', 'Luis', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (14, '0800014', 'Siegberg', 'Zsuzsa', NULL, NULL, '050 1234567', 'Merimiehenkatu 30', NULL, '00150', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, '1993-01-09', 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (15, '0800015', 'Kotkaniemi', 'Kim', NULL, NULL, '050 1234567', 'Porintie 11', NULL, '29250', 'NAKKILA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-03-02', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (16, '0800016', 'Heimola', 'John', NULL, NULL, '050 1234567', 'Presidentinpuistokatu 14', NULL, '28130', 'PORI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-08', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (17, '0800017', 'Kauhanoja', 'Jussi', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (18, '0800018', 'Ruusulinna', 'Kaj', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (19, '0800019', 'Säilynkangas', 'Ambroz', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (20, '0800020', 'Kansanen', 'Timo', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (21, '0800021', 'Jämsä', 'Miklos', NULL, NULL, '050 1234567', 'Aleksanterinkatu 1', NULL, '15110', 'LAHTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2007-12-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (22, '0800022', 'Kastelli', 'Eran', NULL, NULL, '050 1234567', 'Vapaudenkatu 40-42', NULL, '40100', 'JYVÄSKYLÄ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2009-02-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (23, '0800023', 'Winbrennare', 'Toni', NULL, NULL, '0400 234 567', 'Peltolantie 8', NULL, '90210', 'OULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-08-26', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (24, '0800024', 'Kesänen', 'Rene', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (25, '0800025', 'Karppi', 'Satu', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (26, '0800026', 'Uotila', 'Laura', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (27, '0800027', 'Hietarinta', 'Christer', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (28, '0800028', 'Dikert', 'Sorella', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (29, '0800029', 'Meri-Kanto', 'Irina', NULL, NULL, '050 1234567', 'Hallituskatu 12', NULL, '13100', 'HÄMEENLINNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-01-12', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (30, '0800030', 'Tammivaara', 'Niklas', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (31, '0800031', 'Nesterov', 'Maynie', NULL, NULL, '050 1234567', 'Valtakatu 21', NULL, '96200', 'ROVANIEMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-13', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (32, '0800032', 'Kuoppamaa', 'Einar', NULL, NULL, '050 1234567', 'Ida Aalbergin tie 1', NULL, '00400', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-07-16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (33, '0800033', 'Kilpiä', 'Katarina', NULL, NULL, '050 1234567', 'Mannerheimintie 110', NULL, '00250', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2009-03-23', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (34, '0800034', 'Luoto', 'Arthur', NULL, NULL, '050 1234567', 'Otto Mannisen tie 8', NULL, '51200', 'KANGASNIEMI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-09-19', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (35, '0800035', 'Pränni', 'Åke', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (36, '0800036', 'Kantanen', 'Pauli', NULL, NULL, '050 1234567', 'Peltolantie 5', NULL, '90210', 'OULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (37, '0800037', 'Välitalo', 'Kaj-Erik', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (38, '0800038', 'Lehtinen', 'Rauno', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (39, '0800039', 'Parkku', 'Marko', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (40, '0800040', 'Perttola', 'T Ilmari', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (41, '0800041', 'Alstadius', 'Liisi', NULL, NULL, '050 1234567', 'Runeberginkatu 39', NULL, '00100', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (42, '0800042', 'Horttanainen', 'Juhani', NULL, NULL, '050 1234567', 'Eerolantie 1', NULL, '47400', 'KAUSALA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-20', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (43, '0800043', 'Höylä', 'Paavo', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (44, '0800044', 'Leppikangas', 'Matti', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (45, '0800045', 'Kesälahti', 'Elina', NULL, NULL, '050 1234567', 'Kirkkoniemenkatu 24', NULL, '57510', 'SAVONLINNA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (46, '0800046', 'Puntta', 'Kimmo', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (47, '0800047', 'Grote', 'Kirsti', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (48, '0800048', 'Huupponen', 'David', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (49, '0800049', 'Myntti', 'Jorma', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (50, '0800050', 'Nenola', 'Markku', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (51, '0800051', 'Märsy', 'Jukka', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (52, '0800052', 'Memmo', 'Sheldon', NULL, NULL, '050 1234567', 'Vapaudenkatu 12', NULL, '15110', 'LAHTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (53, '0800053', 'Sarapää', 'Aira', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (54, '0800054', 'Peuraharju', 'Mikko', NULL, NULL, '050 1234567', 'Iso Roobertinkatu 12', NULL, '00120', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-07', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (55, '0800055', 'Vaaratsalo', 'Esa', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (56, '0800056', 'Kantelinen', 'Pauli', NULL, NULL, '050 1234567', 'Peltolantie 5', NULL, '90210', 'OULU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (57, '0800057', 'Korsman', 'Eero', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (58, '0800058', 'Mähkönen', 'Katri', NULL, NULL, '050 1234567', 'Säterinkatu 6', NULL, '02600', 'ESPOO', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2009-02-24', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (59, '0800059', 'Korkee', 'Jan', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (60, '0800060', 'Ossipoff', 'Juha', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (61, '0800061', 'Wiiander', 'Sakari', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (62, '0800062', 'Kämäräinen', 'Pasi', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (63, '0800063', 'Mieskolainen', 'Salla', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (64, '0800064', 'Mäkiö', 'Pentti', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (65, '0800065', 'Meldo', 'Juha', NULL, NULL, '050 1234567', 'Vapaudenkatu 39–41', NULL, '40100', 'JYVÄSKYLÄ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-08-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (66, '0800066', 'Virransaari', 'Kari', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (67, '0800067', 'Pitkälä', 'Annikki', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (68, '0800068', 'Mämminmäki', 'Lars', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (69, '0800069', 'Pitkäpolvi', 'Jaakko', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (70, '0800070', 'Linkova', 'Mikko', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (71, '0800071', 'Ketonen', 'Toivo', NULL, NULL, '050 1234567', 'Kirkkokatu 19', NULL, '80100', 'JOENSUU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (72, '0800072', 'Niskala', 'Matti', NULL, NULL, '050 1234567', 'Vapaudenkatu 24', NULL, '15140', 'LAHTI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (73, '0800073', 'Marjomaa', 'Juha', NULL, NULL, '050 1234567', 'Penttiläntie 9', NULL, '49440', 'HAMINA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (74, '0800074', 'Vörgren', 'Pirkko', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (75, '0800075', 'Huurinainen', 'Marjaliisa', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (76, '0800076', 'Nurmiaho', 'Kumiko', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (77, '0800077', 'Toikkonen', 'Martti', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (78, '0800078', 'Pöntinö', 'Jukka', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (79, '0800079', 'Trast', 'Magdalena', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (80, '0800080', 'Tur', 'Pirkko', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (81, '0800081', 'Kaasalainen', 'Raili', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (82, '0800082', 'Björg', 'Lasse', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (83, '0800083', 'Alava', 'Pekka', NULL, NULL, '050 1234567', 'Satamatie 4', NULL, '80220', 'JOENSUU', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2009-01-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (84, '0800084', 'Lillviisala', 'Paul', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (85, '0800085', 'Laasonen', 'Jukka', NULL, NULL, '050 1234567', 'Kauppakartanonkatu 11', NULL, '00930', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2007-12-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (86, '0800086', 'Helomaa', 'Liisa', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (87, '0800087', 'Kotila', 'Aarre', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (88, '0800088', 'Taipale', 'Osmo', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (89, '0800089', 'Repola', 'Pekka', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (90, '0800090', 'Näveri', 'Anja', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (91, '0800091', 'Kaskinen', 'Jalmari', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (92, '0800092', 'Terva-aho', 'Matti', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (93, '0800093', 'Pieksiäinen', 'Helka', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (94, '0800094', 'Meltola', 'Marianna', NULL, NULL, '050 1234567', 'Sauherrantie 23 B', NULL, '98800', 'SAVUKOSKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (95, '0800095', 'Korpisaari', 'Sole', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (96, '0800096', 'Viljaranta', 'Sari', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (97, '0800097', 'Smalin', 'Jukka', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (98, '0800098', 'Ikahainen', 'Tauno', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (99, '0800099', 'Lydberg', 'Eeva-Liisa', NULL, NULL, '050 1234567', 'Eerontie 13', NULL, '05400', 'JOKELA', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 2, 19, 1, NULL, 'fin', 0, 0, '2009-01-30', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (100, '0800100', 'Ahtinen', 'Jozsef', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (101, '0800101', 'Kentta', 'Hilja', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (102, '0800102', 'Havana', 'Toini', NULL, NULL, '050 1234567', 'Sähköttäjänkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);
INSERT INTO `tblmembers` VALUES (103, '0800103', 'Haimakka', 'Kullervo', NULL, NULL, '050 1234567', 'Viipurinkatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, 1, 2, 1, 19, 1, NULL, 'fin', 0, 0, '2008-03-03', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0, 0, '2012-01-18 12:40:54', NULL);


-- --------------------------------------------------------

-- 
-- Table structure for table `tblmembertypes`
-- 

DROP TABLE IF EXISTS `tblmembertypes`;
CREATE TABLE `tblmembertypes` (
  `id` tinyint(6) unsigned NOT NULL auto_increment,
  `name` varchar(100) collate utf8_swedish_ci NOT NULL,
  `fee` decimal(5,2) unsigned NOT NULL default '0.00',
  `show_in_application_form` tinyint(1) unsigned NOT NULL default '0',
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- Dumping data for table `tblmembertypes`
-- 

INSERT INTO `tblmembertypes` VALUES (1, 'Jäsen', 20, 1);
INSERT INTO `tblmembertypes` VALUES (3, 'Kannattajajäsen', 20, 1);
INSERT INTO `tblmembertypes` VALUES (6, 'Juniorijäsen', 10, 1);

-- --------------------------------------------------------

-- 
-- Table structure for table `tblpayers`
-- 

DROP TABLE IF EXISTS `tblpayers`;
CREATE TABLE `tblpayers` (
  `id` smallint(9) unsigned NOT NULL auto_increment,
  `lastname` tinytext collate utf8_swedish_ci NOT NULL,
  `firstname` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `address` tinytext collate utf8_swedish_ci,
  `extraaddress` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci NOT NULL,
  `postoffice` tinytext collate utf8_swedish_ci NOT NULL,
  `countrycode` tinytext collate utf8_swedish_ci,
  `country` tinytext collate utf8_swedish_ci,
  `is_corporation` tinyint(4) NOT NULL default '0',
  `is_foreign` tinyint(4) NOT NULL default '0',
  `ovt` tinytext collate utf8_swedish_ci,
  `extrainfo` text collate utf8_swedish_ci,
  `language` tinytext collate utf8_swedish_ci NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `tblpayers`
-- 

INSERT INTO `tblpayers` VALUES (1, 'BTJ Prenumerationsservice', NULL, NULL, NULL, NULL, NULL, '22182 Lund', 'SVERIGE', NULL, NULL, 1, 1, NULL, NULL, 'sve');
INSERT INTO `tblpayers` VALUES (2, 'EBSCO', NULL, NULL, NULL, 'P.O. Box 1943, Birmingham', NULL, 'AL 35201-1943', 'USA', NULL, NULL, 1, 1, NULL, NULL, 'eng');
INSERT INTO `tblpayers` VALUES (3, 'SWETS Information Services BV', NULL, NULL, NULL, 'c/o Jagtvej 169B, 2.sal', NULL, '2100 Köpenhamn Ø', 'DANMARK', NULL, NULL, 1, 1, NULL, NULL, 'eng');

-- --------------------------------------------------------

-- 
-- Table structure for table `tblsessions`
-- 

DROP TABLE IF EXISTS `tblsessions`;
CREATE TABLE `tblsessions` (
  `sid` varchar(33) collate utf8_swedish_ci NOT NULL default '',
  `ip` varchar(16) collate utf8_swedish_ci NOT NULL default '',
  `uid` int(10) unsigned NOT NULL default '0',
  `created` datetime NOT NULL default '0000-00-00 00:00:00',
  `accessed` datetime NOT NULL default '0000-00-00 00:00:00',
  `data` text collate utf8_swedish_ci NOT NULL,
  `lang` tinytext collate utf8_swedish_ci NOT NULL,
  UNIQUE KEY `sid` (`sid`),
  KEY `ip` (`ip`,`uid`),
  KEY `accessed` (`accessed`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- 
-- Dumping data for table `tblsessions`
-- 


-- --------------------------------------------------------

-- 
-- Table structure for table `tblsubscribers`
-- 

DROP TABLE IF EXISTS `tblsubscribers`;
CREATE TABLE `tblsubscribers` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `lastname` tinytext collate utf8_swedish_ci NOT NULL,
  `firstname` tinytext collate utf8_swedish_ci,
  `email` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `address` tinytext collate utf8_swedish_ci,
  `extraaddress` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci,
  `postoffice` tinytext collate utf8_swedish_ci,
  `countrycode` tinytext collate utf8_swedish_ci,
  `country` tinytext collate utf8_swedish_ci,
  `is_foreign` tinyint(4) NOT NULL default '0',
  `ovt` tinytext collate utf8_swedish_ci,
  `extrainfo` text collate utf8_swedish_ci,
  `reference` tinytext collate utf8_swedish_ci,
  `link_type` tinyint(3) unsigned NOT NULL default '0',
  `link_info` tinyint(4) default NULL,
  `link_sex` tinyint(4) default NULL,
  `link_payer` smallint(5) unsigned default NULL,
  `language` tinytext collate utf8_swedish_ci NOT NULL,
  `clientnr` tinytext collate utf8_swedish_ci,
  `born` tinyint(4) default NULL,
  `date` date NOT NULL default '0000-00-00',
  `subscription_start_date` date default NULL,
  `subscription_end_date` date default NULL,
  PRIMARY KEY  (`id`),
  KEY `link_payer` (`link_payer`),
  KEY `subscription_end_date` (`subscription_end_date`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=17 ;

-- 
-- Dumping data for table `tblsubscribers`
-- 

INSERT INTO `tblsubscribers` VALUES (1, 'Suomen testiyhdistys', NULL, NULL, NULL, 'Karjalankatu 2', NULL, '00520', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2008-03-03', '2008-03-03', NULL);
INSERT INTO `tblsubscribers` VALUES (2, 'Tuominen', 'Eero', NULL, NULL, 'Paraistentie 17', NULL, '00280', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2008-03-05', '2008-03-20', NULL);
INSERT INTO `tblsubscribers` VALUES (3, 'Hänninen', 'Niko', NULL, '09-452789', 'Pikku-Roobertinkatu 1', NULL, '00130', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (4, 'Wallin', 'Julius', 'jwall@maili.com', NULL, 'Ruoholahdenkatu 20', NULL, '00180', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'sve', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (5, 'Visén', 'Elisabeth', 'elisabeth@visen.net', '044-4879563', 'Helsinginkatu 25', NULL, '00510', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, 1, 'sve', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (6, 'Saarni', 'Eero', 'eero.saarni@tapanila.net', NULL, 'Sompiontie 4', NULL, '00730', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (7, 'Donnell', 'Matthew', NULL, NULL, '14–19 Norfolk Terrace', NULL, 'BN1 3AD', 'Brighton, UK', NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, NULL, 3, 'eng', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (8, 'Mattlin', 'Sara', 'sara.mattlin@sagen.fi', NULL, 'Forsövägen 3', NULL, '07700', 'KOSKENKYLÄN SAHA', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, 1, 'sve', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (9, 'Hurstinen', 'Simo', NULL, NULL, 'Asematie 7', NULL, '01300', 'VANTAA', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (10, 'Sivonen', 'Leena', 'leena@paikka.com', NULL, 'Vanha maantie 9', NULL, '02070', 'ESPOO', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (11, 'Hännikäinen', 'Jesper', 'jesper@koulu.fi', NULL, 'Tallinnan aukio 9', NULL, '00930', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (12, 'Eskelinen', 'Miia', NULL, '0504879526', 'Hämeenkatu 16', NULL, '05800', 'HYVINKÄÄ', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (13, 'Aarni', 'Saila', NULL, NULL, 'Iso kylätie 14', NULL, '04130', 'NIKKILÄ', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (14, 'Bergström', 'Rikhard', 'riku@rikhard.net', NULL, 'Sundsbergintie 1', NULL, '02430', 'MASALA', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'sve', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (15, 'Fagernäs', 'Erik', NULL, NULL, 'Postintaival 7', NULL, '00230', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, NULL, 'sve', NULL, NULL, '2009-01-26', '0000-00-00', NULL);
INSERT INTO `tblsubscribers` VALUES (16, 'Kaarna', 'Veera', 'veerakaarna@tyl.fi', NULL, 'Vanhaistentie 6', NULL, '00420', 'HELSINKI', NULL, NULL, 0, NULL, NULL, NULL, 1, NULL, NULL, 2, 'fin', NULL, NULL, '2009-01-26', '0000-00-00', NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `tblsubscribertypes`
-- 

DROP TABLE IF EXISTS `tblsubscribertypes`;
CREATE TABLE `tblsubscribertypes` (
  `id` tinyint(6) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `price` decimal(5,2) unsigned NOT NULL default '0.00',
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=2 ;

-- 
-- Dumping data for table `tblsubscribertypes`
-- 

INSERT INTO `tblsubscribertypes` VALUES (1, 'Kestotilaaja', 80);

-- --------------------------------------------------------

-- 
-- Table structure for table `tblusers`
-- 

DROP TABLE IF EXISTS `tblusers`;
CREATE TABLE `tblusers` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) collate utf8_swedish_ci NOT NULL default '',
  `user` varchar(25) collate utf8_swedish_ci NOT NULL default '',
  `email` varchar(60) collate utf8_swedish_ci NOT NULL default '',
  `email_applications` tinytext collate utf8_swedish_ci,
  `email_invoicing` tinytext collate utf8_swedish_ci,
  `msg_signature` text collate utf8_swedish_ci,
  `passwd` varchar(45) collate utf8_swedish_ci NOT NULL default '',
  `userlevel` tinyint(4) NOT NULL default '0',
  `joined` datetime NOT NULL default '0000-00-00 00:00:00',
  `active` tinyint(1) NOT NULL default '1',
  `address` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci,
  `postoffice` tinytext collate utf8_swedish_ci,
  `url` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `bankaccount` tinytext collate utf8_swedish_ci NOT NULL,
  `businessid` tinytext collate utf8_swedish_ci,
  `rss_url` tinytext collate utf8_swedish_ci,
  `itella_code` tinytext collate utf8_swedish_ci,
  `maventa_uid` tinytext collate utf8_swedish_ci,
  `maventa_api` tinytext collate utf8_swedish_ci,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `user` (`user`),
  KEY `active` (`active`)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci ;

-- 
-- Dumping data for table `tblusers`
-- 

INSERT INTO `tblusers` VALUES (1, 'Helsinki Example FC', 'demo', 'info@tietokannat.info', NULL, NULL, NULL, '---', 1, '2006-12-06 00:00:00', 1, 'Esimerkkitie 8', '00100', 'HELSINKI', NULL, NULL, 'Nordea 123456-7890', NULL, "http://yle.fi/uutiset/rss/kotimaa.rss", NULL, NULL, NULL);

-- --------------------------------------------------------

-- 
-- Table structure for table `users`
-- 

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL auto_increment,
  `name` varchar(100) collate utf8_swedish_ci NOT NULL default '',
  `username` varchar(28) collate utf8_swedish_ci NOT NULL default '',
  `email` varchar(60) collate utf8_swedish_ci default NULL,
  `password` varchar(60) collate utf8_swedish_ci NOT NULL default '',
  `userlevel` tinyint(3) unsigned NOT NULL default '0',
  `readonly` tinyint(1) NOT NULL default '0',
  `is_onetime_password` tinyint(1) unsigned NOT NULL default '0',
  `link_view` SMALLINT UNSIGNED NULL,
  `last_updated` timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci AUTO_INCREMENT=1 ;

-- 
-- Dumping data for table `users`
-- 

INSERT INTO `users` VALUES (NULL , 'Demokäyttäjä', 'demo', 'info@tietokannat.fi', '7319bf5d9f36886fa3876144f7650f7d4516a73e2b66f0494', '1', 0, 0, NULL, NOW( )
);

-- --------------------------------------------------------

-- 
-- Table structure for table `views`
-- 

DROP TABLE IF EXISTS `views`;
CREATE TABLE `views` (
  `id` smallint(5) unsigned NOT NULL auto_increment,
  `name` tinytext collate utf8_swedish_ci NOT NULL,
  `email` tinytext collate utf8_swedish_ci,
  `link_view` smallint(5) unsigned default NULL,
  `address` tinytext collate utf8_swedish_ci,
  `postcode` tinytext collate utf8_swedish_ci,
  `postoffice` tinytext collate utf8_swedish_ci,
  `phone` tinytext collate utf8_swedish_ci,
  `url` tinytext collate utf8_swedish_ci,
  `fee` decimal(10,2) unsigned default NULL,
  PRIMARY KEY  (`id`),
  UNIQUE KEY `name` (`name`(30))
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

-- 
-- Dumping data for table `views`
-- 

INSERT INTO `views` VALUES (1, 'Keski-Suomen piiri', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Table structure for table `views_members`
--

DROP TABLE IF EXISTS `views_members`;
CREATE TABLE `views_members` (
  `link_view` mediumint(8) unsigned NOT NULL,
  `link_member` mediumint(8) unsigned default NULL,
  `link_application` mediumint(8) unsigned default NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;

INSERT INTO `views_members` VALUES (1, 2, NULL);
INSERT INTO `views_members` VALUES (1, 7, NULL);

-- change collation

ALTER DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci
