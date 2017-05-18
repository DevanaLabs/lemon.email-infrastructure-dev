-- MySQL dump 10.13  Distrib 5.7.18, for Linux (x86_64)
--
-- Host: localhost    Database: postfixadmin
-- ------------------------------------------------------
-- Server version	5.6.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--
USE postfixadmin;
DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `role_id` int(11) DEFAULT '0',
  `name` varchar(45) DEFAULT NULL,
  `client_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`admin_id`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'lemonuser@lemon.local','$1$1c0178de$w3hwUkssouwm0PlZBCxZn0','2016-11-04 16:14:17','2016-11-04 16:14:17',1,1,NULL,0);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alias`
--

DROP TABLE IF EXISTS `alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias` (
  `address` varchar(255) NOT NULL,
  `goto` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`address`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `alias_domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alias_domain` (
  `alias_domain` varchar(255) NOT NULL,
  `target_domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`alias_domain`),
  KEY `active` (`active`),
  KEY `target_domain` (`target_domain`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Aliases';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alias_domain`
--

LOCK TABLES `alias_domain` WRITE;
/*!40000 ALTER TABLE `alias_domain` DISABLE KEYS */;
/*!40000 ALTER TABLE `alias_domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=latin1 COMMENT='PostfixAdmin settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES (1,'version','740'),(40,'domain_default','lemon.local'),(20,'role_domain_admin','3'),(21,'role_domain_mailbox','4'),(47,'dns_spf_value',''),(46,'dns_mx_value','172.19.25.3'),(41,'domain_secure_subdomain','secure'),(49,'dns_dmarc_value',''),(48,'dns_dkim_value','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `email` varchar(255) NOT NULL,
  `received` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


DROP TABLE IF EXISTS `domain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain` (
  `domain_id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 NOT NULL,
  `aliases` int(10) NOT NULL DEFAULT '0',
  `mailboxes` int(10) NOT NULL DEFAULT '0',
  `maxquota` bigint(20) NOT NULL DEFAULT '0',
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `transport` varchar(255) NOT NULL,
  `backupmx` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `client_id` int(11) NOT NULL DEFAULT '0',
  `dkim_selector` varchar(45) NOT NULL DEFAULT 'mail',
  `is_secure` tinyint(4) NOT NULL DEFAULT '0',
  `is_payed` tinyint(4) NOT NULL DEFAULT '0',
  `is_dns_valid` tinyint(4) NOT NULL DEFAULT '0',
  `is_relay` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`domain_id`),
  UNIQUE KEY `domain_UNIQUE` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Domains';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain`
--

LOCK TABLES `domain` WRITE;
/*!40000 ALTER TABLE `domain` DISABLE KEYS */;
INSERT INTO `domain` VALUES (1,'lemon.local','',0,0,0,0,'virtual',0,'2017-02-14 12:17:00','2017-02-14 12:17:00',1,1,'mail',0,0,1,0);
/*!40000 ALTER TABLE `domain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `domain_admins`
--

DROP TABLE IF EXISTS `domain_admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `domain_admins` (
  `admin_id` int(11) NOT NULL,
  `domain_id` int(11) NOT NULL,
  `created` datetime DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  KEY `username` (`admin_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Domain Admins';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `domain_admins`
--

LOCK TABLES `domain_admins` WRITE;
/*!40000 ALTER TABLE `domain_admins` DISABLE KEYS */;
/*!40000 ALTER TABLE `domain_admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fetchmail`
--

DROP TABLE IF EXISTS `fetchmail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fetchmail` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `mailbox` varchar(255) NOT NULL,
  `src_server` varchar(255) NOT NULL,
  `src_auth` enum('password','kerberos_v5','kerberos','kerberos_v4','gssapi','cram-md5','otp','ntlm','msn','ssh','any') DEFAULT NULL,
  `src_user` varchar(255) NOT NULL,
  `src_password` varchar(255) NOT NULL,
  `src_folder` varchar(255) NOT NULL,
  `poll_time` int(11) unsigned NOT NULL DEFAULT '10',
  `fetchall` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `keep` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `protocol` enum('POP3','IMAP','POP2','ETRN','AUTO') DEFAULT NULL,
  `usessl` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `extra_options` text,
  `returned_text` text,
  `mda` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fetchmail`
--

LOCK TABLES `fetchmail` WRITE;
/*!40000 ALTER TABLE `fetchmail` DISABLE KEYS */;
/*!40000 ALTER TABLE `fetchmail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `timestamp` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `action` varchar(255) NOT NULL,
  `data` text NOT NULL,
  KEY `timestamp` (`timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Log';
/*!40101 SET character_set_client = @saved_cs_client */;



DROP TABLE IF EXISTS `mailbox`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mailbox` (
  `mailbox_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `maildir` varchar(255) NOT NULL,
  `quota` bigint(20) NOT NULL DEFAULT '0',
  `local_part` varchar(255) NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `transport` varchar(45) NOT NULL DEFAULT 'lmtp:172.19.25.4:24',
  `is_blockchain` tinyint(4) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `is_blocked` tinyint(4) NOT NULL DEFAULT '0',
  `client_id` int(11) DEFAULT NULL,
  `jwt` varchar(255) DEFAULT NULL,
  `has_secure_email` tinyint(4) NOT NULL DEFAULT '0',
  `is_payed` tinyint(4) NOT NULL DEFAULT '0',
  `tier_type` tinyint(4) NOT NULL DEFAULT '0',
  `payed_until` datetime DEFAULT NULL,
  `subscription_id` varchar(255) NOT NULL DEFAULT '',
  `phone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`mailbox_id`,`username`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  KEY `domain` (`domain`)
) ENGINE=MyISAM AUTO_INCREMENT=781 DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Mailboxes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mailbox`
--

LOCK TABLES `mailbox` WRITE;
/*!40000 ALTER TABLE `mailbox` DISABLE KEYS */;
INSERT INTO `mailbox` VALUES (1,'lemonuser@lemon.local','$1$1c0178de$w3hwUkssouwm0PlZBCxZn0','lemonuser@lemon.local','lemonuser@lemon.local/',0,'lemonuser','lemon.local','2017-05-02 18:40:31','2017-05-02 18:40:31',1,'lmtp:172.19.25.4:24',0,4,0,0,'d4c01d3a6437ec9b4096b853fa4b8d30f591d483f450930ac2f66f67f8796c15',1,0,0,NULL,'','19177050425');
/*!40000 ALTER TABLE `mailbox` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_billing_plan`
--

DROP TABLE IF EXISTS `mu_billing_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_billing_plan` (
  `billing_plan_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `paypal_id` varchar(100) NOT NULL DEFAULT '0',
  `description` varchar(45) NOT NULL,
  `price` int(11) NOT NULL DEFAULT '0',
  `type` int(11) NOT NULL DEFAULT '0',
  `version` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`billing_plan_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_billing_plan`
--

LOCK TABLES `mu_billing_plan` WRITE;
/*!40000 ALTER TABLE `mu_billing_plan` DISABLE KEYS */;
INSERT INTO `mu_billing_plan` VALUES (1,'Lemon Email Professional','P-1JC53905K8403832DZZ3NL5Y','Real PayPal This time!',20,1,0);
/*!40000 ALTER TABLE `mu_billing_plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_client`
--

DROP TABLE IF EXISTS `mu_client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_client` (
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_client`
--

LOCK TABLES `mu_client` WRITE;
/*!40000 ALTER TABLE `mu_client` DISABLE KEYS */;
INSERT INTO `mu_client` VALUES (1,'Client 1',1),(2,'Client 2',1),(3,'vanja test',1),(4,'vanja test2',1),(5,'vanja test3',1),(6,'vanja test4',1),(7,'vanja test5',1),(8,'mydomain.com',1),(9,'csadsadsadsa.com',1),(10,'mica.gey',1),(11,'mica.feg',1),(12,'zasto.yu',1),(13,'borg.email',1),(14,'rade.com',1),(15,'bojan.email',1),(16,'asdf.com',1),(17,'radekralj.com',1),(18,'sda.com',1),(19,'test.rs',1),(20,'asdsa.com',1),(21,'sdaas.com',1),(22,'asddasd.com',1),(23,'test.com',1),(24,'symbol.agency',1),(26,'nikola.com',1),(27,'klotfrket.co',1),(28,'malisa.com',1);
/*!40000 ALTER TABLE `mu_client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_invoice`
--

DROP TABLE IF EXISTS `mu_invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_num` int(11) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mailbox_id` int(11) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  PRIMARY KEY (`invoice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_invoice`
--

LOCK TABLES `mu_invoice` WRITE;
/*!40000 ALTER TABLE `mu_invoice` DISABLE KEYS */;
INSERT INTO `mu_invoice` VALUES (1,70000,NULL,669,'2017-05-03 15:13:36',2.00);
/*!40000 ALTER TABLE `mu_invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_monthly_active`
--

DROP TABLE IF EXISTS `mu_monthly_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_monthly_active` (
  `mailbox_id` int(11) NOT NULL,
  `month` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  `datetime_created` datetime DEFAULT NULL,
  `is_billed` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mailbox_id`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_monthly_active`
--

LOCK TABLES `mu_monthly_active` WRITE;
/*!40000 ALTER TABLE `mu_monthly_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `mu_monthly_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_payment`
--

DROP TABLE IF EXISTS `mu_payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_payment` (
  `payment_id` varchar(100) NOT NULL,
  `amount` decimal(14,2) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  `mailbox_id` int(11) DEFAULT NULL,
  `datetime_created` datetime DEFAULT NULL,
  `datetime_payed` datetime DEFAULT NULL,
  `approval_link` varchar(1000) DEFAULT NULL,
  `invoice_id` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_payment`
--

LOCK TABLES `mu_payment` WRITE;
/*!40000 ALTER TABLE `mu_payment` DISABLE KEYS */;
INSERT INTO `mu_payment` VALUES ('PAY-2A512691BF7222710LEFQPTY',20.00,NULL,729,'2017-05-04 12:51:59',NULL,NULL,NULL,NULL,NULL),('PAY-7B742110R0515835ALEE5OYQ',2.00,NULL,669,'2017-05-03 15:13:06','2017-05-03 13:13:33',NULL,1,NULL,NULL),('PAY-9M568907EE859671FLEE6RQI',20.00,NULL,673,'2017-05-03 16:27:13',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `mu_payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_payment_log`
--

DROP TABLE IF EXISTS `mu_payment_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_payment_log` (
  `transaction_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `mailbox` varchar(255) NOT NULL DEFAULT '',
  `payer_mail` varchar(255) DEFAULT NULL,
  `ipn_track_id` varchar(45) DEFAULT NULL,
  `item_name` varchar(500) DEFAULT NULL,
  `price` decimal(14,2) DEFAULT NULL,
  `currency` varchar(45) DEFAULT NULL,
  `txn_id` varchar(45) NOT NULL DEFAULT '',
  `date_created` datetime DEFAULT NULL,
  `payment_status` varchar(255) NOT NULL DEFAULT '',
  `payload` text,
  PRIMARY KEY (`transaction_date`,`mailbox`,`txn_id`,`payment_status`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_payment_log`
--

LOCK TABLES `mu_payment_log` WRITE;
/*!40000 ALTER TABLE `mu_payment_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `mu_payment_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_price`
--

DROP TABLE IF EXISTS `mu_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_price` (
  `price_id` int(11) NOT NULL AUTO_INCREMENT,
  `currency_id` int(11) NOT NULL DEFAULT '0',
  `value` decimal(14,2) NOT NULL DEFAULT '0.00',
  `version` int(11) NOT NULL DEFAULT '0',
  `date_created` datetime DEFAULT NULL,
  `type_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`price_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_price`
--

LOCK TABLES `mu_price` WRITE;
/*!40000 ALTER TABLE `mu_price` DISABLE KEYS */;
/*!40000 ALTER TABLE `mu_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_privs`
--

DROP TABLE IF EXISTS `mu_privs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_privs` (
  `privs_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `priv_desc_id` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`privs_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_privs`
--

LOCK TABLES `mu_privs` WRITE;
/*!40000 ALTER TABLE `mu_privs` DISABLE KEYS */;
INSERT INTO `mu_privs` VALUES (13,3,'admin_user'),(14,3,'admin_domains'),(15,3,'admin_mailboxes');
/*!40000 ALTER TABLE `mu_privs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_role`
--

DROP TABLE IF EXISTS `mu_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `system_role` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_role`
--

LOCK TABLES `mu_role` WRITE;
/*!40000 ALTER TABLE `mu_role` DISABLE KEYS */;
INSERT INTO `mu_role` VALUES (1,'superadmin',1),(2,'guest',1),(3,'Domain admin',1),(4,'Mailbox',0);
/*!40000 ALTER TABLE `mu_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_subscription`
--

DROP TABLE IF EXISTS `mu_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_subscription` (
  `subscription_id` varchar(45) NOT NULL DEFAULT '0',
  `mailbox_id` int(11) NOT NULL,
  `date_created` datetime DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `token` varchar(45) NOT NULL,
  PRIMARY KEY (`subscription_id`,`mailbox_id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_subscription`
--

LOCK TABLES `mu_subscription` WRITE;
/*!40000 ALTER TABLE `mu_subscription` DISABLE KEYS */;
INSERT INTO `mu_subscription` VALUES ('0',729,NULL,NULL,'EC-98R890974K8126531'),('0',763,NULL,NULL,'EC-8JP02394XE915271E'),('0',777,NULL,NULL,'EC-4YB10192H2020540S');
/*!40000 ALTER TABLE `mu_subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mu_transport`
--

DROP TABLE IF EXISTS `mu_transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mu_transport` (
  `transport_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  `is_blockchain` tinyint(4) NOT NULL DEFAULT '0',
  `is_relay` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mu_transport`
--

LOCK TABLES `mu_transport` WRITE;
/*!40000 ALTER TABLE `mu_transport` DISABLE KEYS */;
INSERT INTO `mu_transport` VALUES (1,'lmtp:172.19.25.4:24',0,0),(2,'smtp:172.19.25.3:25',0,1);
/*!40000 ALTER TABLE `mu_transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota`
--

DROP TABLE IF EXISTS `quota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota` (
  `username` varchar(255) NOT NULL,
  `path` varchar(100) NOT NULL,
  `current` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`username`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota`
--

LOCK TABLES `quota` WRITE;
/*!40000 ALTER TABLE `quota` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quota2`
--

DROP TABLE IF EXISTS `quota2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota2` (
  `username` varchar(100) NOT NULL,
  `bytes` bigint(20) NOT NULL DEFAULT '0',
  `messages` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quota2`
--

LOCK TABLES `quota2` WRITE;
/*!40000 ALTER TABLE `quota2` DISABLE KEYS */;
/*!40000 ALTER TABLE `quota2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reset_tokens`
--

DROP TABLE IF EXISTS `reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reset_tokens` (
  `username` varchar(255) NOT NULL,
  `token` varchar(20) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `vacation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation` (
  `email` varchar(255) NOT NULL,
  `subject` varchar(255) CHARACTER SET utf8 NOT NULL,
  `body` text CHARACTER SET utf8 NOT NULL,
  `cache` text NOT NULL,
  `domain` varchar(255) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`email`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Postfix Admin - Virtual Vacation';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation`
--

LOCK TABLES `vacation` WRITE;
/*!40000 ALTER TABLE `vacation` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacation_notification`
--

DROP TABLE IF EXISTS `vacation_notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vacation_notification` (
  `on_vacation` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified` varchar(255) CHARACTER SET latin1 NOT NULL,
  `notified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`on_vacation`,`notified`),
  CONSTRAINT `vacation_notification_pkey` FOREIGN KEY (`on_vacation`) REFERENCES `vacation` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Postfix Admin - Virtual Vacation Notifications';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacation_notification`
--

LOCK TABLES `vacation_notification` WRITE;
/*!40000 ALTER TABLE `vacation_notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacation_notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `view_domain_transport`
--

DROP TABLE IF EXISTS `view_domain_transport`;
/*!50001 DROP VIEW IF EXISTS `view_domain_transport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_domain_transport` AS SELECT
 1 AS `domain`,
 1 AS `transport`,
 1 AS `active`,
 1 AS `backupmx`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_mailbox`
--

DROP TABLE IF EXISTS `view_mailbox`;
/*!50001 DROP VIEW IF EXISTS `view_mailbox`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_mailbox` AS SELECT
 1 AS `mailbox_id`,
 1 AS `username`,
 1 AS `password`,
 1 AS `name`,
 1 AS `maildir`,
 1 AS `quota`,
 1 AS `local_part`,
 1 AS `domain`,
 1 AS `created`,
 1 AS `modified`,
 1 AS `active`,
 1 AS `transport`,
 1 AS `is_blockchain`,
 1 AS `role_id`,
 1 AS `is_blocked`,
 1 AS `client_id`,
 1 AS `jwt`,
 1 AS `has_secure_email`,
 1 AS `is_payed`,
 1 AS `tier_type`,
 1 AS `payed_until`,
 1 AS `subscription_id`,
 1 AS `phone`,
 1 AS `is_dns_valid`,
 1 AS `domain_active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_mailbox_roles`
--

DROP TABLE IF EXISTS `view_mailbox_roles`;
/*!50001 DROP VIEW IF EXISTS `view_mailbox_roles`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_mailbox_roles` AS SELECT
 1 AS `username`,
 1 AS `password`,
 1 AS `name`,
 1 AS `maildir`,
 1 AS `quota`,
 1 AS `local_part`,
 1 AS `domain`,
 1 AS `created`,
 1 AS `modified`,
 1 AS `active`,
 1 AS `transport`,
 1 AS `is_blockchain`,
 1 AS `role_id`,
 1 AS `is_blocked`,
 1 AS `client_id`,
 1 AS `has_secure_email`,
 1 AS `is_payed`,
 1 AS `role_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_mailbox_transport`
--

DROP TABLE IF EXISTS `view_mailbox_transport`;
/*!50001 DROP VIEW IF EXISTS `view_mailbox_transport`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_mailbox_transport` AS SELECT
 1 AS `username`,
 1 AS `name`,
 1 AS `maildir`,
 1 AS `domain`,
 1 AS `local_part`,
 1 AS `active`,
 1 AS `is_blockchain`,
 1 AS `transport`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `view_monthly_active`
--

DROP TABLE IF EXISTS `view_monthly_active`;
/*!50001 DROP VIEW IF EXISTS `view_monthly_active`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `view_monthly_active` AS SELECT
 1 AS `mailbox_id`,
 1 AS `month`,
 1 AS `year`,
 1 AS `datetime_created`,
 1 AS `is_billed`,
 1 AS `domain`,
 1 AS `username`,
 1 AS `tier_type`,
 1 AS `client_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_domain_transport`
--

/*!50001 DROP VIEW IF EXISTS `view_domain_transport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_domain_transport` AS select `d`.`domain` AS `domain`,`t`.`value` AS `transport`,`d`.`active` AS `active`,`d`.`backupmx` AS `backupmx` from (`domain` `d` join `mu_transport` `t` on(((`t`.`is_blockchain` = `d`.`is_secure`) and (`t`.`is_relay` = `d`.`is_relay`)))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_mailbox`
--

/*!50001 DROP VIEW IF EXISTS `view_mailbox`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_mailbox` AS select `m`.`mailbox_id` AS `mailbox_id`,`m`.`username` AS `username`,`m`.`password` AS `password`,`m`.`name` AS `name`,`m`.`maildir` AS `maildir`,`m`.`quota` AS `quota`,`m`.`local_part` AS `local_part`,`m`.`domain` AS `domain`,`m`.`created` AS `created`,`m`.`modified` AS `modified`,`m`.`active` AS `active`,`m`.`transport` AS `transport`,`m`.`is_blockchain` AS `is_blockchain`,`m`.`role_id` AS `role_id`,`m`.`is_blocked` AS `is_blocked`,`m`.`client_id` AS `client_id`,`m`.`jwt` AS `jwt`,`m`.`has_secure_email` AS `has_secure_email`,`m`.`is_payed` AS `is_payed`,`m`.`tier_type` AS `tier_type`,`m`.`payed_until` AS `payed_until`,`m`.`subscription_id` AS `subscription_id`,`m`.`phone` AS `phone`,`d`.`is_dns_valid` AS `is_dns_valid`,`d`.`active` AS `domain_active` from (`mailbox` `m` join `domain` `d` on((`m`.`domain` = `d`.`domain`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_mailbox_roles`
--

/*!50001 DROP VIEW IF EXISTS `view_mailbox_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_mailbox_roles` AS select `mailbox`.`username` AS `username`,`mailbox`.`password` AS `password`,`mailbox`.`name` AS `name`,`mailbox`.`maildir` AS `maildir`,`mailbox`.`quota` AS `quota`,`mailbox`.`local_part` AS `local_part`,`mailbox`.`domain` AS `domain`,`mailbox`.`created` AS `created`,`mailbox`.`modified` AS `modified`,`mailbox`.`active` AS `active`,`mailbox`.`transport` AS `transport`,`mailbox`.`is_blockchain` AS `is_blockchain`,`mailbox`.`role_id` AS `role_id`,`mailbox`.`is_blocked` AS `is_blocked`,`mailbox`.`client_id` AS `client_id`,`mailbox`.`has_secure_email` AS `has_secure_email`,`mailbox`.`is_payed` AS `is_payed`,`mu_role`.`name` AS `role_name` from (`mailbox` left join `mu_role` on((`mailbox`.`role_id` = `mu_role`.`role_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_mailbox_transport`
--

/*!50001 DROP VIEW IF EXISTS `view_mailbox_transport`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_mailbox_transport` AS select `mailbox`.`username` AS `username`,`mailbox`.`name` AS `name`,`mailbox`.`maildir` AS `maildir`,`mailbox`.`domain` AS `domain`,`mailbox`.`local_part` AS `local_part`,`mailbox`.`active` AS `active`,`mailbox`.`is_blockchain` AS `is_blockchain`,`mu_transport`.`value` AS `transport` from (`mailbox` join `mu_transport` on((`mu_transport`.`is_blockchain` = `mailbox`.`is_blockchain`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_monthly_active`
--

/*!50001 DROP VIEW IF EXISTS `view_monthly_active`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `view_monthly_active` AS select `ma`.`mailbox_id` AS `mailbox_id`,`ma`.`month` AS `month`,`ma`.`year` AS `year`,`ma`.`datetime_created` AS `datetime_created`,`ma`.`is_billed` AS `is_billed`,`m`.`domain` AS `domain`,`m`.`username` AS `username`,`m`.`tier_type` AS `tier_type`,`d`.`client_id` AS `client_id` from ((`mu_monthly_active` `ma` join `mailbox` `m` on((`m`.`mailbox_id` = `ma`.`mailbox_id`))) join `domain` `d` on((`d`.`domain` = `m`.`domain`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-05 10:22:42
