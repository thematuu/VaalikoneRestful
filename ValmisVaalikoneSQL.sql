-- MySQL dump 10.13  Distrib 5.7.37, for Win64 (x86_64)
--
-- Host: localhost    Database: db_vaalikone
-- ------------------------------------------------------
-- Server version	5.7.37-log

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
-- Table structure for table `adminlogin`
--

DROP TABLE IF EXISTS `adminlogin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminlogin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminlogin`
--

LOCK TABLES `adminlogin` WRITE;
/*!40000 ALTER TABLE `adminlogin` DISABLE KEYS */;
INSERT INTO `adminlogin` VALUES (1,'admin','1f5f6c73f6ee592520e6d9546d672f49');
/*!40000 ALTER TABLE `adminlogin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ehdokas`
--

DROP TABLE IF EXISTS `ehdokas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ehdokas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `puolue` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ehdokas`
--

LOCK TABLES `ehdokas` WRITE;
/*!40000 ALTER TABLE `ehdokas` DISABLE KEYS */;
INSERT INTO `ehdokas` VALUES (2,'Petteri','Orpo','Kokoomus'),(3,'Antti','Häkkänen','Kokoomus'),(4,'Elina','Valtonen','Kokoomus'),(5,'Annika','Saarikko','Keskusta'),(6,'Petri','Honkonen','Keskusta'),(7,'Markus','Lohi','Keskusta'),(8,'Sanna','Marin','Sosialidemokraatit'),(9,'Ville','Skinnari','Sosialidemokraatit'),(10,'Matias','Mäkynen','Sosialidemokraatit'),(11,'Tiina','Elo','Vihreät'),(12,'Pekka','Haavisto','Vihreät'),(13,'Atte','Harjanne','Vihreät');
/*!40000 ALTER TABLE `ehdokas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kysymys`
--

DROP TABLE IF EXISTS `kysymys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `kysymys` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kysymykset` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kysymys`
--

LOCK TABLES `kysymys` WRITE;
/*!40000 ALTER TABLE `kysymys` DISABLE KEYS */;
INSERT INTO `kysymys` VALUES (9,'Ultimately, each person is responsible for their own health and wellbeing.'),(10,'Public spending and revenues must be balanced by reducing expenditures rather than raising taxes.'),(11,'Finland must be a forerunner in the fight against climate change, even if it imposes costs on society.'),(12,'Those in senior positions in society do not understand the problems faced by the general public.'),(13,'Wellbeing services counties must be given the right to levy taxes in the future. '),(14,'Besides social, health and rescue services, no more tasks should be transferred to wellbeing services counties in the next few years.'),(15,'Health and social services must also be opened up to allow private providers to compete in the future. '),(16,'It must be accepted that one\'s place of residence affects access to public services.'),(17,'It is better to increase the number of intensive care places for coronavirus patients than restrictions on society as a whole.'),(18,'Euthanasia, i.e. providing assistance for death, should be permitted by law.'),(19,'I am prepared to compromise on the services of my municipality if it is in the interest of the entire wellbeing services county.'),(20,'All facilities in the county, such as hospitals and care homes, must have at least one vegetarian day a week. '),(21,'As a rule, each wellbeing services county should own its premises.'),(22,'My wellbeing services county should actively promote recruitment from outside the EU to meet the labour shortage.'),(23,'Providing health and social services for foreign-language speakers is worthwhile, even if it adds costs in the short term.');
/*!40000 ALTER TABLE `kysymys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puolueet`
--

DROP TABLE IF EXISTS `puolueet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `puolueet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `puolue` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puolueet`
--

LOCK TABLES `puolueet` WRITE;
/*!40000 ALTER TABLE `puolueet` DISABLE KEYS */;
INSERT INTO `puolueet` VALUES (1,'Kokoomus'),(2,'Keskusta'),(3,'Sosiaalidemokraatit'),(4,'Vihreät');
/*!40000 ALTER TABLE `puolueet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vastaus`
--

DROP TABLE IF EXISTS `vastaus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vastaus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vastaukset` int(1) NOT NULL,
  `eid` int(10) NOT NULL,
  `kid` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vastaus`
--

LOCK TABLES `vastaus` WRITE;
/*!40000 ALTER TABLE `vastaus` DISABLE KEYS */;
INSERT INTO `vastaus` VALUES (2,1,2,9),(3,3,2,10),(4,5,2,11),(5,2,2,12),(6,4,2,13),(7,1,2,14),(8,5,2,15),(9,5,2,16),(11,3,2,17),(12,5,2,18),(13,4,2,19),(14,1,2,20),(15,3,2,21),(16,4,2,22),(17,5,2,23),(18,3,3,9),(19,1,3,10),(20,4,3,11),(21,1,3,12),(22,5,3,13),(23,2,3,14),(24,4,3,15),(25,1,3,16),(27,2,3,17),(28,3,3,18),(29,4,3,19),(30,2,3,20),(31,1,3,21),(32,4,3,22),(33,2,3,23),(34,2,4,9),(35,2,4,10),(36,5,4,11),(37,3,4,12),(38,1,4,13),(39,4,4,14),(40,5,4,15),(41,2,4,16),(42,2,4,17),(43,1,4,18),(44,5,4,19),(45,1,4,20),(46,2,4,21),(47,5,4,22),(48,3,4,23),(49,2,5,9),(50,5,5,10),(51,5,5,11),(52,5,5,12),(53,4,5,13),(54,2,5,14),(55,3,5,15),(56,5,5,16),(57,1,5,17),(58,4,5,18),(59,3,5,19),(60,4,5,20),(61,4,5,21),(62,5,5,22),(63,2,5,23),(64,2,6,9),(65,2,6,10),(66,3,6,11),(67,2,6,12),(68,4,6,13),(69,5,6,14),(70,2,6,15),(71,1,6,16),(72,3,6,17),(73,2,6,18),(74,4,6,19),(75,4,6,20),(76,5,6,21),(77,5,6,22),(78,1,6,23),(79,5,7,9),(80,5,7,10),(81,5,7,11),(82,4,7,12),(83,4,7,13),(84,2,7,14),(85,3,7,15),(86,2,7,16),(87,3,7,17),(88,5,7,18),(89,4,7,19),(90,4,7,20),(91,5,7,21),(92,4,7,22),(93,3,7,23),(94,4,8,9),(95,1,8,10),(96,3,8,11),(97,1,8,12),(98,2,8,13),(99,5,8,14),(100,4,8,15),(101,1,8,16),(102,4,8,17),(103,5,8,18),(104,4,8,19),(105,1,8,20),(106,2,8,21),(107,5,8,23),(109,5,9,9),(110,2,9,10),(111,2,9,11),(112,1,9,12),(113,2,9,13),(114,4,9,14),(115,3,9,15),(116,2,9,16),(117,4,9,17),(118,5,9,18),(119,4,9,19),(120,2,9,20),(121,1,9,21),(122,5,9,23),(124,3,10,9),(125,1,10,10),(126,2,10,11),(127,1,10,12),(128,1,10,13),(129,4,10,14),(130,2,10,15),(131,2,10,16),(132,3,10,17),(133,4,10,18),(134,5,10,19),(135,2,10,20),(136,1,10,21),(137,5,10,23),(139,4,11,9),(140,5,11,10),(141,5,11,11),(142,5,11,12),(143,4,11,13),(144,4,11,14),(145,3,11,15),(146,1,11,16),(147,5,11,17),(148,4,11,18),(149,4,11,19),(150,2,11,20),(151,1,11,21),(152,5,11,22),(153,2,11,23),(154,4,12,9),(155,4,12,10),(156,4,12,11),(157,3,12,12),(158,2,12,13),(159,2,12,14),(160,1,12,15),(161,1,12,16),(162,2,12,17),(163,2,12,18),(164,4,12,19),(165,5,12,20),(166,3,12,21),(167,1,12,22),(168,2,12,23),(169,5,13,9),(170,1,13,10),(171,1,13,11),(172,1,13,12),(173,1,13,13),(174,5,13,14),(175,5,13,15),(176,4,13,16),(177,5,13,17),(178,1,13,18),(179,5,13,19),(180,2,13,20),(181,1,13,21),(182,4,13,22),(183,4,13,23),(184,2,8,22),(185,1,9,22),(186,1,10,22);
/*!40000 ALTER TABLE `vastaus` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-04 15:49:51
