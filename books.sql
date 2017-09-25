-- MySQL dump 10.13  Distrib 5.7.19, for Linux (x86_64)
--
-- Host: localhost    Database: books
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `Author`
--

DROP TABLE IF EXISTS `Author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Author` (
  `authorID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`authorID`),
  UNIQUE KEY `authorID_UNIQUE` (`authorID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (1,'Erik B. L','Dahlman'),(2,'Stefan','Parkvall'),(3,'Johan','Sköld');
/*!40000 ALTER TABLE `Author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AuthorMap`
--

DROP TABLE IF EXISTS `AuthorMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AuthorMap` (
  `bookID` bigint(20) NOT NULL,
  `authorID` bigint(20) NOT NULL,
  PRIMARY KEY (`bookID`,`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorMap`
--

LOCK TABLES `AuthorMap` WRITE;
/*!40000 ALTER TABLE `AuthorMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `AuthorMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Book`
--

DROP TABLE IF EXISTS `Book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Book` (
  `bookID` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  `originalTitle` varchar(255) COLLATE utf8_swedish_ci DEFAULT NULL,
  `edition` int(11) DEFAULT NULL,
  `isbn` varchar(15) CHARACTER SET utf8 DEFAULT NULL,
  `locationID` bigint(20) DEFAULT NULL,
  `ownerID` bigint(20) DEFAULT NULL,
  `languageID` bigint(20) DEFAULT NULL,
  `categoryID` bigint(20) DEFAULT NULL,
  `publisherID` bigint(20) DEFAULT NULL,
  `statusID` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'Mobile Media and Applications - From Concept to Cash','',0,'0470017473',2,1,2,1,0,0),(2,'Professional Active Server Pages','',0,'1861002610',3,1,2,1,0,0),(3,'ASP 3.0','',0,'1861003234',3,1,2,1,NULL,NULL),(4,'Professional Linux Deployment','',0,'1861002874',3,1,2,1,NULL,NULL),(5,'Professional PHP Programming','',0,'1861002963',3,1,2,1,NULL,NULL),(6,'Programming the Micosoft Windows Driver Model','',0,'0735605882',3,1,2,1,NULL,NULL),(7,'Inside Microsoft Windows 2000 Third Edition','',3,'0735610215',3,1,2,1,NULL,NULL),(8,'Programming Windows with MFC Second Edition','',2,'1572316950',3,1,2,1,NULL,NULL),(9,'Windows NT/2000 Native API Reference','',0,'1578701996',3,1,2,1,NULL,NULL),(10,'Windows 2000 Server Secrets','',0,'0764546201',3,1,2,1,NULL,NULL),(11,'Microsoft Visual Basic 6.0 Programmer\'s Guide','',0,'1572318635',3,1,2,1,NULL,NULL),(12,'UNIX och X från Början','',0,'9144342926',3,1,1,1,NULL,NULL),(13,'UNIX System Programming using C++','',0,'0133315622',3,1,2,1,NULL,NULL),(14,'C++ Primer Third Edition','',3,'0201824701',3,1,2,1,NULL,NULL),(15,'More Effective C++','',0,'020163371X',3,1,2,1,NULL,NULL),(16,'C++ programmering 2:a upplagan','',2,'9136304167',3,1,1,1,NULL,NULL),(17,'Exceptional C++','',0,'0201615622',3,1,2,1,NULL,NULL),(18,'C++ programmering','',0,'9163607301',3,1,1,1,NULL,NULL),(19,'Practical Algorithms for Programmers','',0,'020163208X',3,1,2,1,NULL,NULL),(20,'The Art of Computer Programming Volume 1 Fundamental Algorithms Third Edition','',3,'0201896834',2,1,2,1,NULL,NULL),(21,'The Art of Computer Programming Volume 2 Seminumerical Algorithms Third Edition','',3,'0201896842',2,1,2,1,NULL,NULL),(22,'The Art of Computer Programming Volume 3 Sorting and Searching Second Edition','',2,'0201896850',2,1,2,1,NULL,NULL),(23,'Data Communications for Engineers','',0,'0201427885',2,1,2,1,NULL,NULL),(24,'Digital Communications','',0,'0471629472',2,1,2,1,NULL,NULL),(25,'Nätverkssamhällets Framväxt Band I, Informationsåldern','',0,'9171731148',2,1,1,1,NULL,NULL),(26,'4G LTE / LTE-Advanced for Mobile Broadband','',0,'9780123854896',2,1,2,1,NULL,NULL),(27,'Praktisk datamodellering - ta greppet om begreppen','',0,'9144380011',2,1,1,1,NULL,NULL),(28,'M68000 Family Programmer\'s Reference Manual','',0,'',2,1,2,1,NULL,NULL),(29,'TI-85 Grafiska Räknare','',0,NULL,2,1,1,1,NULL,NULL),(30,'TI-89',NULL,NULL,NULL,2,1,2,1,NULL,NULL),(31,'LAN och TCP/IP for Högskolan 2000','',0,'',2,1,1,1,NULL,NULL),(32,'Javascript The Definitive Guide','',3,'1565813928',2,1,2,1,NULL,NULL),(33,'Java Network Programming','',2,'1565818709',2,1,2,1,NULL,NULL),(34,'Core Java Volume I - Fundamentals','',0,'0137669577',2,1,2,1,NULL,NULL),(35,'Graphic Java Mastering the JFC','',3,'0130796670',2,1,2,1,NULL,NULL),(36,'Thinking in Java','',3,'0136597238',2,1,2,1,NULL,NULL),(37,'Thinking in Java','',4,'9780131872486',2,1,2,1,NULL,NULL);
/*!40000 ALTER TABLE `Book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Category`
--

DROP TABLE IF EXISTS `Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Category` (
  `categoryID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryID_UNIQUE` (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Category`
--

LOCK TABLES `Category` WRITE;
/*!40000 ALTER TABLE `Category` DISABLE KEYS */;
INSERT INTO `Category` VALUES (1,'Facklitteratur'),(2,'Skönlitteratur');
/*!40000 ALTER TABLE `Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CategoryMap`
--

DROP TABLE IF EXISTS `CategoryMap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CategoryMap` (
  `bookID` bigint(20) NOT NULL,
  `categoryID` bigint(20) NOT NULL,
  PRIMARY KEY (`bookID`,`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CategoryMap`
--

LOCK TABLES `CategoryMap` WRITE;
/*!40000 ALTER TABLE `CategoryMap` DISABLE KEYS */;
/*!40000 ALTER TABLE `CategoryMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Language`
--

DROP TABLE IF EXISTS `Language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Language` (
  `languageID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`languageID`),
  UNIQUE KEY `languageID_UNIQUE` (`languageID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES (1,'Svenska'),(2,'Engelska'),(3,'Tyska'),(4,'Franska');
/*!40000 ALTER TABLE `Language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Location`
--

DROP TABLE IF EXISTS `Location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Location` (
  `locationID` bigint(20) NOT NULL AUTO_INCREMENT,
  `roomID` bigint(20) NOT NULL,
  `bookshelf` int(11) NOT NULL,
  `shelf` int(11) NOT NULL,
  PRIMARY KEY (`locationID`),
  UNIQUE KEY `locationID_UNIQUE` (`locationID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (1,1,1,1),(2,1,1,2),(3,1,1,3);
/*!40000 ALTER TABLE `Location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Owner`
--

DROP TABLE IF EXISTS `Owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Owner` (
  `ownerID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `surname` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`ownerID`),
  UNIQUE KEY `ownerID_UNIQUE` (`ownerID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Owner`
--

LOCK TABLES `Owner` WRITE;
/*!40000 ALTER TABLE `Owner` DISABLE KEYS */;
INSERT INTO `Owner` VALUES (1,'Mikael','Bäckstedt'),(2,'Pimari','Bäckstedt');
/*!40000 ALTER TABLE `Owner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Publisher`
--

DROP TABLE IF EXISTS `Publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Publisher` (
  `publisherID` bigint(20) NOT NULL AUTO_INCREMENT,
  `namel` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`publisherID`),
  UNIQUE KEY `publisherID_UNIQUE` (`publisherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
/*!40000 ALTER TABLE `Publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Room` (
  `roomID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`roomID`),
  UNIQUE KEY `roomID_UNIQUE` (`roomID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,'Kontoret'),(2,'TV-rummet'),(3,'Köket'),(4,'Pi:s hobbyrum'),(5,'Vardagsrummet'),(6,'Gymmet'),(7,'Gästrummet'),(8,'Sovrummet'),(9,'Garaget');
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-25 14:34:03
