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
  UNIQUE KEY `authorID_UNIQUE` (`authorID`),
  UNIQUE KEY `name_UNIQUE` (`name`,`surname`)
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Author`
--

LOCK TABLES `Author` WRITE;
/*!40000 ALTER TABLE `Author` DISABLE KEYS */;
INSERT INTO `Author` VALUES (68,'Agatha','Christie'),(10,'Alex','Homer'),(102,'Andrea','Chiarelli'),(141,'Andrew','Binstock'),(151,'Andy','Johnston'),(29,'Anita','Amirrezvani'),(44,'Antony','Beevor'),(69,'Arthur C.','Clarke'),(61,'Augustin','Burroughs'),(43,'Belinda','Bauer'),(73,'Bengt','Anderberg'),(79,'Bertil','Hökby'),(110,'Bill','Kropog'),(49,'Boel','Bermann'),(7,'Brian','Francis'),(23,'Brian W.','Aldiss'),(72,'Bruce','Eckel'),(74,'Carl-Uno','Sjöblom'),(158,'Cay S.','Horstmann'),(28,'Charlotte Vale','Allen'),(22,'Chimamanda Ngozi','Adichie'),(107,'Chris','Blexrud'),(127,'Chris','Scollo'),(148,'Christoffer','Andersson'),(62,'Clare','Campbell'),(11,'Craig','McQueen'),(59,'Dan','Brown'),(6,'Dan','Denault'),(149,'Daniel','Freeman'),(27,'Dante','Alighieri'),(99,'Dave','Sussman'),(39,'David','Baldacci'),(156,'David','Flanagan'),(130,'David A.','Solomon'),(160,'David M.','Geary'),(111,'Dean','Sonderegger'),(128,'Depak','Veliath'),(37,'Desmond','Bagley'),(19,'Diane','Ackerman'),(101,'Dino','Esposito'),(143,'Donald E.','Knuth'),(20,'Douglas','Adams'),(157,'Elliotte Rusty','Harold'),(1,'Erik','Dahlman'),(77,'Eva','Rudskog'),(30,'Evelyn','Anthony'),(48,'Frans G.','Bengtsson'),(36,'Fredrik','Backman'),(113,'Ganesh','Prasad'),(159,'Gary','Cornell'),(133,'Gary','Nebbett'),(70,'Gentry','Lee'),(114,'Geoff','Sherlock'),(105,'George','Reilly'),(17,'Geraldine','Brooks'),(75,'Gilbert','Obermair'),(45,'Gioconda','Belli'),(80,'Gösta','Åberg'),(25,'Hans','Alfredsson'),(125,'Harish','Rawat'),(134,'Harry H.','Brelsford'),(140,'Herb','Sutter'),(40,'Iain M.','Banks'),(119,'Ian','Dickson'),(150,'Ian','James'),(26,'Inger','Alfvén'),(15,'Isaac','Asimov'),(54,'James','Blish'),(136,'Jan','Skansholm'),(132,'Jeff','Prosise'),(31,'Jeffrey','Archer'),(82,'Jesper','Ek'),(124,'Jesus','Castagnetto'),(16,'Jim','Murray'),(122,'Joel','Rowbottom'),(3,'Johan','Sköld'),(41,'John','Banville'),(64,'John','Le Carré'),(142,'John','Rex'),(13,'John','Schenken'),(117,'Jonathan','Kelly'),(118,'Jonathan','Pinnock'),(55,'Karin','Boye'),(32,'Kelley','Armstrong'),(14,'Kevin','Williams'),(65,'Kristin','Cashore'),(154,'Lars','Axelsson'),(50,'Lauren','Beukes'),(67,'Lee','Child'),(42,'Linwood','Barclay'),(34,'Lorayne','Ashton'),(60,'Lothar-Günther','Buchheim'),(153,'Manuel','Castells'),(9,'Marco','Gregorini'),(51,'Marcus','Birro'),(38,'Marjaneh','Bakhtiari'),(116,'Mark','Wilcox'),(131,'Mark E.','Russinovich'),(155,'Martin','Hidefjäll'),(8,'Matthew','Gibbs'),(58,'Max','Brooks'),(144,'Michael','Duck'),(121,'Mike','Banahan'),(115,'Mike','Boerner'),(18,'Muriel','Barbery'),(35,'Nadeem','Aslam'),(33,'Neal','Asher'),(123,'Nikhilesh Kumar','Mandalay'),(53,'Nina','Björk'),(46,'Peter','Benchley'),(52,'Peter','Berlin'),(145,'Peter','Bishop'),(21,'Richard','Adams'),(5,'Richard','Anderson'),(120,'Richard','Ollerenshaw'),(146,'Richard','Read'),(126,'Sacha','Schumann'),(138,'Scott','Meyers'),(147,'Simon','Haykin'),(12,'Simon','Robinson'),(152,'Staffan','Ljung'),(81,'Stanley B.','Lippman'),(2,'Stefan','Parkvall'),(139,'Stephen','Prata'),(24,'Susanna','Alakoski'),(137,'Terrence','Chan'),(71,'Tony','Buzan'),(135,'Torbjörn','Andréasson'),(76,'Tore','Sandgren'),(66,'Tracy','Chevalier'),(63,'Trudi','Canavan'),(78,'Ulf','Bergengren'),(47,'Victoria','Benedictsson'),(129,'Walter','Oney'),(56,'Willy','Breinholst');
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
  PRIMARY KEY (`bookID`,`authorID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`,`authorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AuthorMap`
--

LOCK TABLES `AuthorMap` WRITE;
/*!40000 ALTER TABLE `AuthorMap` DISABLE KEYS */;
INSERT INTO `AuthorMap` VALUES (1,148),(1,149),(1,150),(1,151),(1,152),(2,5),(2,6),(2,7),(2,8),(2,10),(2,11),(2,12),(2,13),(2,99),(2,101),(2,102),(2,105),(2,107),(2,110),(2,111),(3,5),(3,6),(3,7),(3,8),(3,9),(3,10),(3,11),(3,12),(3,13),(4,113),(4,114),(4,115),(4,116),(4,117),(4,118),(4,119),(4,120),(4,121),(4,122),(4,123),(5,124),(5,125),(5,126),(5,127),(5,128),(6,129),(7,130),(7,131),(8,132),(9,133),(10,134),(12,135),(12,136),(13,137),(14,81),(15,138),(16,139),(17,140),(18,82),(19,141),(19,142),(20,143),(21,143),(22,143),(23,144),(23,145),(23,146),(24,147),(25,153),(26,1),(26,2),(26,3),(27,154),(27,155),(32,156),(33,157),(34,158),(34,159),(35,160),(36,72),(37,72),(38,76),(38,77),(38,78),(41,75),(42,74),(43,74),(46,71),(47,71),(116,20),(117,73),(119,20),(128,16),(129,16),(130,16),(131,16),(132,16),(133,16),(134,16),(135,16),(136,16),(137,16),(146,16),(147,48),(148,48),(149,48),(150,48),(151,48),(152,48),(153,48),(154,48),(165,79),(165,80),(172,19),(173,20),(174,20),(175,21),(176,21),(177,22),(178,23),(179,24),(180,24),(181,25),(182,25),(183,26),(184,27),(185,28),(186,29),(187,30),(188,31),(189,31),(190,32),(191,32),(192,33),(193,34),(194,15),(195,15),(196,15),(197,15),(198,15),(199,15),(200,15),(201,15),(202,15),(203,15),(204,15),(205,15),(206,15),(207,15),(208,15),(209,15),(210,15),(211,15),(212,35),(213,36),(214,36),(215,37),(216,38),(217,39),(218,39),(219,40),(239,40),(240,41),(241,18),(242,18),(243,42),(244,43),(245,44),(246,45),(247,46),(248,46),(249,47),(250,48),(251,49),(252,50),(253,51),(254,52),(255,53),(256,54),(257,55),(258,56),(259,17),(260,58),(261,58),(262,59),(263,60),(264,61),(265,62),(266,63),(268,63),(269,63),(270,63),(271,63),(272,63),(273,63),(274,63),(275,63),(276,64),(277,65),(278,65),(279,65),(280,66),(281,67),(282,67),(283,68),(284,68),(285,68),(286,68),(287,69),(288,69),(289,69),(290,69),(291,69),(292,69),(293,69),(294,69),(295,69),(295,70);
/*!40000 ALTER TABLE `AuthorMap` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BindingType`
--

DROP TABLE IF EXISTS `BindingType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BindingType` (
  `bindingTypeID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`bindingTypeID`),
  UNIQUE KEY `bindingTypeID_UNIQUE` (`bindingTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BindingType`
--

LOCK TABLES `BindingType` WRITE;
/*!40000 ALTER TABLE `BindingType` DISABLE KEYS */;
INSERT INTO `BindingType` VALUES (1,'Inbunden'),(2,'Pocket'),(3,'Halvfranskt band'),(4,'Helfranskt band'),(5,'Häftad'),(6,'Okänd');
/*!40000 ALTER TABLE `BindingType` ENABLE KEYS */;
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
  `publisherID` bigint(20) NOT NULL DEFAULT '1',
  `statusID` bigint(20) NOT NULL DEFAULT '1',
  `bindingTypeID` bigint(20) NOT NULL DEFAULT '6',
  `published` date DEFAULT NULL,
  `originalPublished` date DEFAULT NULL,
  PRIMARY KEY (`bookID`),
  UNIQUE KEY `bookID_UNIQUE` (`bookID`)
) ENGINE=InnoDB AUTO_INCREMENT=319 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Book`
--

LOCK TABLES `Book` WRITE;
/*!40000 ALTER TABLE `Book` DISABLE KEYS */;
INSERT INTO `Book` VALUES (1,'Mobile Media and Applications - From Concept to Cash',NULL,NULL,'0470017473',2,1,2,1,1,1,6,NULL,NULL),(2,'Professional Active Server Pages 3.0','',NULL,'1861002610',3,1,2,1,1,1,6,NULL,NULL),(3,'ASP 3.0',NULL,NULL,'1861003234',3,1,2,1,1,1,6,NULL,NULL),(4,'Professional Linux Deployment',NULL,NULL,'1861002874',3,1,2,1,1,1,6,NULL,NULL),(5,'Professional PHP Programming',NULL,NULL,'1861002963',3,1,2,1,1,1,6,NULL,NULL),(6,'Programming the Micosoft Windows Driver Model',NULL,NULL,'0735605882',3,1,2,1,1,1,6,NULL,NULL),(7,'Inside Microsoft Windows 2000 Third Edition',NULL,3,'0735610215',3,1,2,1,1,1,6,NULL,NULL),(8,'Programming Windows with MFC Second Edition',NULL,2,'1572316950',3,1,2,1,1,1,6,NULL,NULL),(9,'Windows NT/2000 Native API Reference',NULL,NULL,'1578701996',3,1,2,1,1,1,6,NULL,NULL),(10,'Windows 2000 Server Secrets',NULL,NULL,'0764546201',3,1,2,1,1,1,6,NULL,NULL),(11,'Microsoft Visual Basic 6.0 Programmer\'s Guide',NULL,NULL,'1572318635',3,1,2,1,1,1,6,NULL,NULL),(12,'UNIX och X från Början',NULL,NULL,'9144342926',3,1,1,1,1,1,6,NULL,NULL),(13,'UNIX System Programming using C++',NULL,NULL,'0133315622',3,1,2,1,1,1,6,NULL,NULL),(14,'C++ Primer Third Edition',NULL,3,'0201824701',3,1,2,1,1,1,6,NULL,NULL),(15,'More Effective C++',NULL,NULL,'020163371X',3,1,2,1,1,1,6,NULL,NULL),(16,'C++ programmering 2:a upplagan',NULL,2,'9136304167',3,1,1,1,1,1,6,NULL,NULL),(17,'Exceptional C++',NULL,NULL,'0201615622',3,1,2,1,1,1,6,NULL,NULL),(18,'C++ programmering',NULL,NULL,'9163607301',3,1,1,1,1,1,6,NULL,NULL),(19,'Practical Algorithms for Programmers',NULL,NULL,'020163208X',3,1,2,1,1,1,6,NULL,NULL),(20,'The Art of Computer Programming Volume 1 Fundamental Algorithms Third Edition',NULL,3,'0201896834',2,1,2,1,1,1,6,NULL,NULL),(21,'The Art of Computer Programming Volume 2 Seminumerical Algorithms Third Edition',NULL,3,'0201896842',2,1,2,1,1,1,6,NULL,NULL),(22,'The Art of Computer Programming Volume 3 Sorting and Searching Second Edition',NULL,2,'0201896850',2,1,2,1,1,1,6,NULL,NULL),(23,'Data Communications for Engineers',NULL,NULL,'0201427885',2,1,2,1,1,1,6,NULL,NULL),(24,'Digital Communications',NULL,NULL,'0471629472',2,1,2,1,1,1,6,NULL,NULL),(25,'Nätverkssamhällets Framväxt Band I, Informationsåldern',NULL,NULL,'9171731148',2,1,1,1,1,1,6,NULL,NULL),(26,'4G LTE / LTE-Advanced for Mobile Broadband',NULL,NULL,'9780123854896',2,1,2,1,1,1,6,NULL,NULL),(27,'Praktisk datamodellering - ta greppet om begreppen',NULL,NULL,'9144380011',2,1,1,1,1,1,6,NULL,NULL),(28,'M68000 Family Programmer\'s Reference Manual',NULL,NULL,NULL,2,1,2,1,1,1,6,NULL,NULL),(29,'TI-85 Grafiska Räknare',NULL,NULL,NULL,2,1,1,1,1,1,6,NULL,NULL),(30,'TI-89',NULL,NULL,NULL,2,1,2,1,1,1,6,NULL,NULL),(31,'LAN och TCP/IP for Högskolan 2000',NULL,NULL,NULL,2,1,1,1,1,1,6,NULL,NULL),(32,'Javascript The Definitive Guide',NULL,3,'1565813928',2,1,2,1,1,1,6,NULL,NULL),(33,'Java Network Programming',NULL,2,'1565818709',2,1,2,1,1,1,6,NULL,NULL),(34,'Core Java Volume I - Fundamentals',NULL,NULL,'0137669577',2,1,2,1,1,1,6,NULL,NULL),(35,'Graphic Java Mastering the JFC',NULL,3,'0130796670',2,1,2,1,1,1,6,NULL,NULL),(36,'Thinking in Java',NULL,3,'0136597238',2,1,2,1,1,1,6,NULL,NULL),(37,'Thinking in Java',NULL,4,'9780131872486',2,1,2,1,1,1,6,NULL,NULL),(38,'Att lägga patiens',NULL,5,'9137030493',4,1,1,1,1,1,6,NULL,NULL),(39,'Kortoxen',NULL,NULL,'9137082663',4,1,1,1,1,1,6,NULL,NULL),(40,'Stora kortspelsboken',NULL,NULL,'9151814463',4,1,1,1,1,1,6,NULL,NULL),(41,'141 tändstickstrix','Streichholzspielereien',NULL,'9153407636',4,1,1,1,1,1,6,NULL,NULL),(42,'Frågelek 2',NULL,NULL,'9155219659',4,1,1,1,1,1,6,NULL,NULL),(43,'Frågelek',NULL,NULL,'9155218962',4,1,1,1,1,1,6,NULL,NULL),(44,'Karolinerna - Första delen',NULL,NULL,NULL,4,1,1,1,1,1,6,NULL,NULL),(45,'Den kryptiska boken',NULL,NULL,'9197057355',4,1,1,1,1,1,6,NULL,NULL),(46,'Speed Reading',NULL,NULL,NULL,4,1,2,1,1,1,6,NULL,NULL),(47,'Master Your Memory',NULL,NULL,NULL,4,1,2,1,1,1,6,NULL,NULL),(48,'Knock-Out Blackjack',NULL,NULL,'0929712315',4,1,2,1,1,1,6,NULL,NULL),(49,'Karl XII','Charles XII of Sweden',NULL,'9172681055',4,1,1,1,1,1,6,NULL,NULL),(50,'Historien om Sverige - Storhet och fall',NULL,NULL,'9119512821',4,1,1,1,1,1,6,NULL,NULL),(51,'Historien om Sverige - Från islossning till kungarike',NULL,NULL,'9119126425',4,1,1,1,1,1,6,NULL,NULL),(52,'Bonniers Lexikon - Band 2',NULL,NULL,'9163200384',4,1,1,1,1,1,6,NULL,NULL),(53,'Bonniers Lexikon - Band 1',NULL,NULL,'9163200376',4,1,1,1,1,1,6,NULL,NULL),(54,'Bonniers Lexikon - Band 5',NULL,NULL,'9163200414',4,1,1,1,1,1,6,NULL,NULL),(55,'Bonniers Lexikon - Band 4',NULL,NULL,'9163200406',4,1,1,1,1,1,6,NULL,NULL),(56,'Bonniers Lexikon - Band 3',NULL,NULL,'9163200392',4,1,1,1,1,1,6,NULL,NULL),(57,'Bonniers Lexikon - Band 8',NULL,NULL,'9163200449',4,1,1,1,1,1,6,NULL,NULL),(58,'Bonniers Lexikon - Band 7',NULL,NULL,'9163200430',4,1,1,1,1,1,6,NULL,NULL),(59,'Bonniers Lexikon - Band 6',NULL,NULL,'9163200422',4,1,1,1,1,1,6,NULL,NULL),(60,'Bonniers Lexikon - Band 11',NULL,NULL,'9163200473',4,1,1,1,1,1,6,NULL,NULL),(61,'Bonniers Lexikon - Band 10',NULL,NULL,'9163200465',4,1,1,1,1,1,6,NULL,NULL),(62,'Bonniers Lexikon - Band 9',NULL,NULL,'9163200457',4,1,1,1,1,1,6,NULL,NULL),(63,'Bonniers Lexikon - Band 14',NULL,NULL,'9163200511',4,1,1,1,1,1,6,NULL,NULL),(64,'Bonniers Lexikon - Band 13',NULL,NULL,'9163200503',4,1,1,1,1,1,6,NULL,NULL),(65,'Bonniers Lexikon - Band 12',NULL,NULL,'9163200481',4,1,1,1,1,1,6,NULL,NULL),(66,'Bonniers Lexikon - Band 17',NULL,NULL,'9163200554',4,1,1,1,1,1,6,NULL,NULL),(67,'Bonniers Lexikon - Band 16',NULL,NULL,'9163200546',4,1,1,1,1,1,6,NULL,NULL),(68,'Bonniers Lexikon - Band 15',NULL,NULL,'9163200538',4,1,1,1,1,1,6,NULL,NULL),(69,'Bonniers Lexikon - Band 20',NULL,NULL,'9163200589',4,1,1,1,1,1,6,NULL,NULL),(70,'Bonniers Lexikon - Band 19',NULL,NULL,'9163200570',4,1,1,1,1,1,6,NULL,NULL),(71,'Bonniers Lexikon - Band 18',NULL,NULL,'9163200562',4,1,1,1,1,1,6,NULL,NULL),(72,'Bonniers Lexikon - Band 24',NULL,NULL,'9163200627',4,1,1,1,1,1,6,NULL,NULL),(73,'Bonniers Lexikon - Band 23',NULL,NULL,'9163200619',4,1,1,1,1,1,6,NULL,NULL),(74,'Bonniers Lexikon - Band 22',NULL,NULL,'9163200600',4,1,1,1,1,1,6,NULL,NULL),(75,'Bonniers Lexikon - Band 21',NULL,NULL,'9163200597',4,1,1,1,1,1,6,NULL,NULL),(76,'JAS 39 Gripen',NULL,NULL,'9197389250',5,1,1,1,1,1,6,NULL,NULL),(77,'Philips\' World Atlas',NULL,NULL,NULL,5,1,2,1,1,1,6,NULL,NULL),(78,'The Power of the Mind',NULL,NULL,NULL,5,1,2,1,1,1,6,NULL,NULL),(79,'Vetenskapens Värld: Människan i framtiden','Future Earth',NULL,'9187012391',5,1,1,1,1,1,6,NULL,NULL),(80,'Illustrerad Vetenskaps Encyklopedi Vol 1: Världen idag - Canada och Arktis','Canada and the Arctic',NULL,'8742705185',5,1,1,1,1,1,6,NULL,NULL),(81,'The Ferengi Rules of Aquisition',NULL,NULL,'0671529366',5,1,2,1,1,1,6,NULL,NULL),(82,'The Klingon Way',NULL,NULL,'0671537555',5,1,2,1,1,1,6,NULL,NULL),(83,'The Klingon Dictionary',NULL,NULL,'067174559X',5,1,2,1,1,1,6,NULL,NULL),(84,'Star Trek: The Next Generation Technical Manual',NULL,NULL,'0671704273',5,1,2,1,1,1,6,NULL,NULL),(85,'Segelfartyg','The Sailing Ship',NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(86,'Örlogsboken',NULL,NULL,'9197067038',5,1,1,1,1,1,6,NULL,NULL),(87,'Luftens Dirigenter',NULL,NULL,'9197389269',5,1,1,1,1,1,6,NULL,NULL),(88,'Bonniers lilla uppslagsbok',NULL,4,'9134506640',5,1,1,1,1,1,6,NULL,NULL),(89,'Guinness Rekordbok 1996','Guinness Book of Records',NULL,'9137107232',5,1,1,1,1,1,6,NULL,NULL),(90,'Guinness Rekordbok 1995','Guinness Book of Records',NULL,'9137105450',5,1,1,1,1,1,6,NULL,NULL),(91,'BPA Måleri & Golv: Allsång',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(92,'Sångbok Kalmar Nation Lund',NULL,5,NULL,5,1,1,1,1,1,6,NULL,NULL),(93,'Sångbok Lundakarneval 22-24 Maj 1998',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(94,'Faust\'s lilla fula',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(95,'Sångbok för Högskolan i Trollhättan-Uddevalla 1993',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(96,'CNaSiga visor',NULL,1,NULL,5,1,1,1,1,1,6,NULL,NULL),(97,'Sångboken - Tredje upplagan',NULL,3,NULL,5,1,1,1,1,1,6,NULL,NULL),(98,'Wädur - Sångbock 2k2',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(99,'Teknologens Sångatlas - Kristianstads Ingenjörer',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(100,'Sånghäfte 01/02 INSATSCEKTN och Fest-N',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(101,'Greve Löwenhielms Sångbok',NULL,2,NULL,5,1,1,1,1,1,6,NULL,NULL),(102,'Sjungbok - musica pro mille',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(103,'Med mössan på sné',NULL,4,NULL,5,1,1,1,1,1,6,NULL,NULL),(104,'Med mössan på sné',NULL,2,NULL,5,1,1,1,1,1,6,NULL,NULL),(105,'Med mössan på sné',NULL,3,NULL,5,1,1,1,1,1,6,NULL,NULL),(106,'IHHJS Sångbok',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(107,'Psångboken',NULL,1,NULL,5,1,1,1,1,1,6,NULL,NULL),(108,'ESS på FESSt Ht97',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(109,'Rex Bibendi',NULL,1,NULL,5,1,1,1,1,1,6,NULL,NULL),(110,'Konglig Elektrosektionens Sångbok',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(111,'Fredmans Sånger',NULL,NULL,'9151823721',5,1,1,1,1,1,6,NULL,NULL),(112,'Richard Wagner och kvinnorna',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(113,'Johan Sebastian Bach',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(114,'SNAPSVISOR med bästa kryddrecepten och köpesnapsen!',NULL,1,'9789185329861',5,1,1,1,1,1,6,NULL,NULL),(115,'Överstens Snapsvisor - i smakfull blandning',NULL,NULL,NULL,5,1,1,1,1,1,6,NULL,NULL),(116,'Liftarens guide till galaxen','The Hitchhiker\'s Guide to the Galaxy',NULL,'9134516573',8,1,1,2,1,1,6,NULL,NULL),(117,'Fula visboken',NULL,NULL,'9155031056',5,1,1,1,1,1,6,NULL,NULL),(118,'Bonniers Rocklexikon',NULL,NULL,'9134512233',5,1,1,1,1,1,6,NULL,NULL),(119,'The Hitchhiker\'s Guide to the Galaxy',NULL,NULL,'0517149257',8,1,2,2,1,1,6,NULL,NULL),(120,'The Paul Simon Complete',NULL,NULL,'0860017532',5,1,2,1,1,1,6,NULL,NULL),(121,'Musikens Värld',NULL,1956,NULL,5,1,1,1,1,1,6,NULL,NULL),(122,'Rock dag för dag','Rock Day-By-Day',NULL,'9137094807',5,1,1,1,1,1,6,NULL,NULL),(123,'Clans & Tartans',NULL,NULL,'9780007178551',6,1,2,1,1,1,6,NULL,NULL),(124,'Great Beer Guide',NULL,NULL,'9780789451569',6,1,2,1,1,1,6,NULL,NULL),(125,'The Whisky Disitlleries of the United Kingdom',NULL,2008,'9781841586526',6,1,2,1,1,1,6,NULL,NULL),(126,'Whisky från hela världen',NULL,NULL,'9781407541815',6,1,1,1,1,1,6,NULL,NULL),(127,'Dryck i litet tryck - Maltwhisky','A Little Book of Malt Whiskies',NULL,'913232331X',6,1,1,1,1,1,6,NULL,NULL),(128,'Jim Murray\'s Whisky Bible 2010',NULL,7,'9780955472947',6,1,2,1,1,1,6,NULL,NULL),(129,'Jim Murray\'s Whisky Bible 2009',NULL,6,'9780955472930',6,1,2,1,1,1,6,NULL,NULL),(130,'Jim Murray\'s Whiskey Bible 2008',NULL,5,'9780955472916',6,1,2,1,1,1,6,NULL,NULL),(131,'Jim Murray\'s Whisky Bible 2007',NULL,4,'9780955472909',6,1,2,1,1,1,6,NULL,NULL),(132,'Jim Murray\'s Whisky Bible 2006',NULL,3,'1844425509',6,1,2,1,1,1,6,NULL,NULL),(133,'Jim Myrray\'s Whisky Bible 2016',NULL,13,'9780993298608',6,1,2,1,1,1,6,NULL,NULL),(134,'Jim Murray\'s Whisky Bible 2015',NULL,12,'9780955472992',6,1,2,1,1,1,6,NULL,NULL),(135,'Jim Murray\'s Whisky Bible 2013',NULL,10,'9780955472978',6,1,2,1,1,1,6,NULL,NULL),(136,'Jim Murray\'s Whisky Bible 2012','',9,'9780955472961',6,1,2,1,1,1,6,NULL,NULL),(137,'Jim Murray\'s Whisky Bible 2011',NULL,8,'9780955472954',6,1,2,1,1,1,6,NULL,NULL),(138,'Dryckjom',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(139,'Största Cocktailboken',NULL,4,'9158214615',6,1,1,1,1,1,6,NULL,NULL),(140,'Drinkar för fest och vardag',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(141,'Kallsupar & tilltugg',NULL,NULL,'9789153429791',6,1,1,1,1,1,6,NULL,NULL),(142,'Cocktailboken',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(143,'Guinness - An Official Ceebration of 250 Remarkable Years',NULL,NULL,'9780600619888',6,1,2,1,1,1,6,NULL,NULL),(144,'Öl från hela världen',NULL,NULL,'9781405463492',6,1,1,1,1,1,6,NULL,NULL),(145,'Kort om vin',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(146,'Classic Bourbon, Tennessee & Rye Whiskey',NULL,NULL,'3775003290',6,1,3,1,1,1,6,NULL,NULL),(147,'Röde Orm - Hemma och i österled',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(148,'Röde Orm - Sjöfarare i västerled',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(149,'Dikter / Folk som sjöng',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(150,'De långhåriga Merovingerna / Sällskap för en eremit',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(151,'Litteratörer och militärer / Den lustgård som jag minns',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(152,'Silversköldarna / För nöjes skull',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(153,'Karl XII:s levnad 2',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(154,'Karl XII:s levnad 1',NULL,NULL,NULL,6,1,1,2,1,1,6,NULL,NULL),(155,'Gustav V och hans tid 1907-1918',NULL,5,NULL,6,1,1,1,1,1,6,NULL,NULL),(156,'Gustav V och hans tid 1919-1927',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(157,'Gustav V och hans tid 1928-1938',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(158,'Gustav V och hans tid 1938-1947',NULL,NULL,NULL,6,1,1,1,1,1,6,NULL,NULL),(159,'Världens bästa lyrik',NULL,NULL,'9127026094',7,2,1,2,1,1,6,NULL,NULL),(160,'Hemlös - med egna ord',NULL,NULL,'9789185625710',7,2,1,2,1,1,6,NULL,NULL),(161,'Tusen och en natt',NULL,NULL,'9176422490',7,2,1,2,1,1,6,NULL,NULL),(162,'The Beef O\'Keefe\'s Guide to Irish Drinking Games',NULL,NULL,'9780615401539',7,1,2,1,1,1,6,NULL,NULL),(163,'När jag vaknade och dog',NULL,NULL,'9100473669',7,2,1,2,1,1,6,NULL,NULL),(164,'Perversioner',NULL,NULL,'9185000051',7,2,1,2,1,1,6,NULL,NULL),(165,'Bra sagt under tretusen år',NULL,NULL,'9174487140',7,2,1,2,1,1,6,NULL,NULL),(166,'Världens elakaste citat',NULL,NULL,'9185267848',7,2,1,2,1,1,6,NULL,NULL),(167,'Humor - det handlar om kärlek',NULL,NULL,NULL,7,1,1,2,1,1,6,NULL,NULL),(168,'The Complete Book of Insults',NULL,NULL,NULL,7,1,2,2,1,1,6,NULL,NULL),(169,'103 Norgehistorier',NULL,NULL,NULL,7,1,1,2,1,1,6,NULL,NULL),(170,'999 roliga historier',NULL,NULL,'9153403010',7,1,1,2,1,1,6,NULL,NULL),(171,'Alla gör det',NULL,NULL,'9132426976',7,1,1,2,1,1,6,NULL,NULL),(172,'Sinnenas Naturlära','A Natural History of the Senses',NULL,'9176428788',8,1,1,2,1,1,6,NULL,NULL),(173,'The Long Dark Teatime of the Soul',NULL,NULL,'0330309552',8,1,2,2,1,1,6,NULL,NULL),(174,'Dirk Gently\'s Holistic Detective Agency',NULL,NULL,'0330301624',8,1,2,2,1,1,6,NULL,NULL),(175,'Den långa flykten','Watership Down',NULL,'9100402524',8,2,1,2,1,1,6,NULL,NULL),(176,'Shardik',NULL,NULL,'9100412066',8,2,1,2,1,1,6,NULL,NULL),(177,'En halv gul sol','Half of a Yellow Sun',NULL,'9789100118679',8,2,1,2,1,1,6,NULL,NULL),(178,'Nonstop',NULL,NULL,'9172280301',8,2,1,2,1,1,6,NULL,NULL),(179,'Svinalängorna',NULL,NULL,'9789100114008',8,2,1,2,1,1,6,NULL,NULL),(180,'Oktober i fattigsverige',NULL,NULL,'9789100130107',8,2,1,2,1,1,6,NULL,NULL),(181,'En något större bok',NULL,NULL,'9146150420',8,2,1,2,1,1,6,NULL,NULL),(182,'Tiden är ingenting',NULL,NULL,'9176431347',8,2,1,2,1,1,6,NULL,NULL),(183,'Judiths teater',NULL,NULL,'9176425886',8,2,1,2,1,1,6,NULL,NULL),(184,'Den gudomliga komedin - Skärselden',NULL,NULL,'9137050559',8,1,1,2,1,1,6,NULL,NULL),(185,'Drömma i färg','Dreaming in Color',NULL,'9171196137',8,2,1,2,1,1,6,NULL,NULL),(186,'Flickan som vävde sidenmattor',NULL,NULL,'9789170016639',8,2,1,2,1,1,6,NULL,NULL),(187,'Röster i vinden','Voices on the wind',NULL,'9100469955',8,2,1,2,1,1,6,NULL,NULL),(188,'As the Crow Flies',NULL,NULL,'0060179147',8,2,2,2,1,1,6,NULL,NULL),(189,'Dömd till fängelse','A Prisoner of Birth',NULL,'9789173514712',8,2,1,2,1,1,6,NULL,NULL),(190,'Biten','Bitten',NULL,'9177112563',8,2,1,2,1,1,6,NULL,NULL),(191,'Märkt','Stolen',NULL,'9171304436',8,2,1,2,1,1,6,NULL,NULL),(192,'The Line of Polity',NULL,NULL,'0330484354',8,NULL,2,2,1,1,6,NULL,NULL),(193,'Hotet','Victims',NULL,'913503906X',9,2,1,2,1,1,6,NULL,NULL),(194,'The Complete Robot',NULL,NULL,'9780586057247',9,1,2,2,1,1,6,NULL,NULL),(195,'Den nakna solen','The Naked Sun',NULL,'9172282525',9,2,1,2,1,1,6,NULL,NULL),(196,'The Caves of Steel',NULL,NULL,'9780586008355',9,1,2,2,1,1,6,NULL,NULL),(197,'The Naked Sun',NULL,NULL,'9780586010167',9,1,2,2,1,1,6,NULL,NULL),(198,'The Robots of Dawn',NULL,NULL,'9780586061992',9,1,2,2,1,1,6,NULL,NULL),(199,'Robots and Empire',NULL,NULL,'9780586062005',9,1,2,2,1,1,6,NULL,NULL),(200,'The Stars, Like Dust',NULL,NULL,'9780765319159',9,1,2,2,1,1,6,NULL,NULL),(201,'The Currents of Space',NULL,NULL,'9780765319173',9,1,2,2,1,1,6,NULL,NULL),(202,'Pebble in the Sky',NULL,NULL,'9780765319135',9,1,2,2,1,1,6,NULL,NULL),(203,'The End of Eternity',NULL,NULL,'9780765319197',9,1,2,2,1,1,6,NULL,NULL),(204,'Nemesis',NULL,NULL,'9127034216',9,NULL,1,2,1,1,6,NULL,NULL),(205,'Prelude to Foundation',NULL,NULL,'0553278398',9,1,2,2,1,1,6,NULL,NULL),(206,'Forward the Foundation',NULL,NULL,'0553565079',9,1,2,2,1,1,6,NULL,NULL),(207,'Foundation',NULL,NULL,'0553293354',9,1,2,2,1,1,6,NULL,NULL),(208,'Foundation and Empire',NULL,NULL,'0553293370',9,1,2,2,1,1,6,NULL,NULL),(209,'Second Foundation',NULL,NULL,'0553293362',9,1,2,2,1,1,6,NULL,NULL),(210,'Foundation\'s Edge',NULL,NULL,'0553293389',9,1,2,2,1,1,6,NULL,NULL),(211,'Foundation and Earth',NULL,NULL,'0553587579',9,1,2,2,1,1,6,NULL,NULL),(212,'Maps for Lost Lovers',NULL,NULL,'0571221831',9,2,2,2,1,1,6,NULL,NULL),(213,'En man som heter Ove',NULL,NULL,'9789175031743',9,2,1,2,1,1,6,NULL,NULL),(214,'Min mormor hälsar och säger förlåt',NULL,NULL,'9789137142555',9,2,1,2,1,1,6,NULL,NULL),(215,'High Citadel',NULL,NULL,NULL,9,2,2,2,1,1,6,NULL,NULL),(216,'Kalla dig vad fan du vill',NULL,NULL,'9170371997',9,2,1,2,1,1,6,NULL,NULL),(217,'Simple Genius',NULL,NULL,'9780446999469',9,2,2,2,1,1,6,NULL,NULL),(218,'The Collectors',NULL,NULL,'9780330444088',9,2,2,2,1,1,6,NULL,NULL),(219,'Against a Dark Background',NULL,NULL,'1857231791',9,2,2,2,1,1,6,NULL,NULL),(220,'Sticka mjuka djur, häxor, tomtar och dockor','Easy to Make, New Knitted Toys',NULL,'9137107208',11,2,1,1,1,1,6,NULL,NULL),(221,'Nyckeln till framgång i alla IQ-tester',NULL,NULL,NULL,7,1,1,1,1,1,6,NULL,NULL),(222,'Skägg','',NULL,'9789187397172',7,1,1,1,1,1,6,NULL,NULL),(223,'The Mammoth Book of Dirty, Sick, X-rated & Politically Incorrect Jokes',NULL,NULL,'1841199672',7,1,2,2,1,1,6,NULL,NULL),(224,'Knop & stek','The Alternative Knot Book',NULL,'9153414268',7,1,1,1,1,1,6,NULL,NULL),(225,'100 Best Bars',NULL,NULL,'095421885X',7,1,2,1,1,1,6,NULL,NULL),(226,'The Star Trek the Next Generation Companion',NULL,NULL,'0671883402',12,1,2,1,1,1,6,NULL,NULL),(227,'Standard Catalog of Smith & Wesson',NULL,3,'9780896892934',10,1,2,1,1,1,6,NULL,NULL),(228,'Sportskytte med Pistol och Revolver','Sportliches Schiessen mit Faustfeuerwaffen',NULL,NULL,10,1,1,1,1,1,6,NULL,NULL),(229,'Wiederladen von H&N High-Speed Geschosen für Profis und Einsteiger',NULL,3,'9783000392740',10,1,3,1,1,1,6,NULL,NULL),(230,'Stora Vapenguiden',NULL,2017,NULL,10,1,1,1,1,1,6,NULL,NULL),(231,'Mjuka djur av fleece','Fleece Pets',NULL,'9789172331686',11,2,1,1,1,1,6,NULL,NULL),(232,'Vapen genom tiderna','The Lore of Arms',NULL,'917442016X',13,1,1,1,1,1,6,NULL,NULL),(233,'Standard Catalog of Colt Firearms',NULL,2,'9781440237478',13,1,2,1,1,1,6,NULL,NULL),(234,'Standard Catalog of Ruger Firearms',NULL,NULL,'9781440240607',13,1,2,1,1,1,6,NULL,NULL),(235,'GunDigest Book of REVOLVERS Assembly/Disassembly',NULL,NULL,'9781440214523',13,1,2,1,1,1,6,NULL,NULL),(236,'Ed McGivern\'s Book of Fast and Fancy Revolver Shooting',NULL,NULL,'9781602390867',13,1,2,1,1,1,6,NULL,NULL),(237,'Blue Book of Gun Values',NULL,27,'9781936120758',13,1,2,1,1,1,6,NULL,NULL),(238,'Blue Book of Gun Values',NULL,24,'9781936120314',7,1,2,1,1,1,6,NULL,NULL),(239,'Matter',NULL,NULL,'9781841494180',14,2,2,2,1,1,6,NULL,NULL),(240,'Havet','The Sea',NULL,'9789185251773',14,2,1,2,1,1,6,NULL,NULL),(241,'Igelkottens elegans','L\'élégance du hérisson',NULL,'9789197600378',14,2,1,2,1,1,6,NULL,NULL),(242,'Alvernas liv','La vie des elfes',NULL,'9789187648434',14,2,1,2,1,1,6,NULL,NULL),(243,'Utan ett ord','No time for goodbye',NULL,'9789186369156',14,2,1,2,1,1,6,NULL,NULL),(244,'Mörk Jord',NULL,NULL,'9789186629519',14,2,1,2,1,1,6,NULL,NULL),(245,'Stalingrad','Stalingrad',NULL,'918944423',14,1,1,2,1,1,6,NULL,NULL),(246,'Den förfördas hemlighet','El pergamino de la seducción',NULL,'9789113014382',14,2,1,2,1,1,6,NULL,NULL),(247,'Djupet','The Deep',NULL,'9100432776',14,2,1,2,1,1,6,NULL,NULL),(248,'Hajen','Jaws',NULL,'9100401005',14,2,1,2,1,1,6,NULL,NULL),(249,'Pengar',NULL,NULL,'9127043533',14,2,1,2,1,1,6,NULL,NULL),(250,'Röde Orm',NULL,NULL,'9117917026',14,1,1,2,1,1,6,NULL,NULL),(251,'Den nya människan',NULL,NULL,'9789187049569',14,2,1,2,1,1,6,NULL,NULL),(252,'Flickor som skimrar','The Shining Girls',NULL,'9789113055640',14,2,1,2,1,1,6,NULL,NULL),(253,'Landet utanför',NULL,NULL,'9170295239',14,2,1,2,1,1,6,NULL,NULL),(254,'Xenophobe\'s guide to the Swedes',NULL,NULL,'9781906042493',14,1,2,2,1,1,6,NULL,NULL),(255,'Sireners sång',NULL,NULL,'9146180214',14,2,1,2,1,1,6,NULL,NULL),(256,'Rymdstaden','A Life for the Stars',NULL,'9172280786',14,2,1,2,1,1,6,NULL,NULL),(257,'Samlade dikter',NULL,NULL,'9100105414',14,2,1,2,1,1,6,NULL,NULL),(258,'Den fullkomlige äkta mannen','Den fulkomne aegtemand',NULL,NULL,14,1,1,2,1,1,6,NULL,NULL),(259,'Allahs döttrar','Níne parts of Desire',NULL,'9177096045',14,2,1,2,1,1,6,NULL,NULL),(260,'The Zombie Survival Guide',NULL,NULL,'9781400049622',14,2,2,2,1,1,6,NULL,NULL),(261,'World War Z',NULL,NULL,'9780307888686',14,2,2,2,1,1,6,NULL,NULL),(262,'I cirkelns mitt','Deception Point',NULL,'9789100111892',14,2,1,2,1,1,6,NULL,NULL),(263,'Ubåt','Das Boot',NULL,'9137087711',14,1,1,2,1,1,6,NULL,NULL),(264,'Det är nåt som inte stämmer','Running with Scissors',NULL,'9789170022401',14,2,1,2,1,1,6,NULL,NULL),(265,'Tokyo Hostess',NULL,NULL,'9781847442079',14,2,2,2,1,1,6,NULL,NULL),(266,'The Black Magician Trilogy Book 3: The High Lord',NULL,NULL,'9781841493152',14,2,2,2,1,1,6,NULL,NULL),(268,'The Black Magician Trilogy Book 2: The Novice',NULL,NULL,'9781841493145',18,2,2,2,1,1,6,NULL,NULL),(269,'The Black Magician Trilogy Book 1: The Magicians\' Guild',NULL,NULL,'9781841493138',18,2,2,2,1,1,6,NULL,NULL),(270,'The Traitor Spy Trilogy 3: The Traitor Queen',NULL,NULL,'9781841495965',18,2,2,2,1,1,6,NULL,NULL),(271,'The Traitor Spy Trilogy 2: The Rogue',NULL,NULL,'9781841495941',18,2,2,2,1,1,6,NULL,NULL),(272,'The Traitor Spy Trilogy 1: The Ambassador\'s Mission',NULL,NULL,'9781841495927',18,2,2,2,1,1,6,NULL,NULL),(273,'Age of the Five 2: Last of the Wilds',NULL,NULL,'9784841495163',18,2,2,2,1,1,6,NULL,NULL),(274,'Age of the Five 3: Voice of the Gods',NULL,NULL,'9781841495170',18,2,2,2,1,1,6,NULL,NULL),(275,'Millennium\'s Rule 2: Angel of Storms',NULL,NULL,'9780356501154',18,2,2,2,1,1,6,NULL,NULL),(276,'Den trägne odlaren','The Constant Gardener',NULL,'9100579432',18,2,1,2,1,1,6,NULL,NULL),(277,'Fire',NULL,NULL,'9780575085138',18,2,2,2,1,1,6,NULL,NULL),(278,'Graceling',NULL,NULL,'9780575085305',18,2,2,2,1,1,6,NULL,NULL),(279,'Bitterblue',NULL,NULL,'9780575097186',18,2,2,2,1,1,6,NULL,NULL),(280,'Flicka med pärlörhänge','Girl with a Pearl Earring',NULL,'9132327277',18,2,1,2,1,1,6,NULL,NULL),(281,'Hetta','Echo Burning',NULL,'9789186587017',18,2,1,2,1,1,6,NULL,NULL),(282,'Besökaren','The Visitor',NULL,'9132330642',18,2,1,2,1,1,6,NULL,NULL),(283,'En flicka kom till Bagdad','They Came to Baghdad',NULL,'9100410365',18,2,1,2,1,1,6,NULL,NULL),(284,'Mrs McGinty är död','Mrs McGinty\'s dead',NULL,NULL,18,2,1,2,1,1,6,NULL,NULL),(285,'Mysteriet på Blå tåget','The Mystery of the Blue Train',NULL,'9100551651',18,2,1,2,1,1,6,NULL,NULL),(286,'The Pale Horse',NULL,NULL,'0671474227',18,2,2,2,1,1,6,NULL,NULL),(287,'2010: andra rymdodyssén','2010: Odyssey Two',NULL,'9151816458',18,2,1,2,1,1,6,NULL,NULL),(288,'The Fountains of Paradise',NULL,NULL,'9781857987218',18,1,2,2,1,1,6,NULL,NULL),(289,'2010: Odyssey Two',NULL,NULL,'9780586056998',18,1,2,2,1,1,6,NULL,NULL),(290,'2061: Odyssey Three',NULL,NULL,'9780586203194',18,1,2,2,1,1,6,NULL,NULL),(291,'3001: The Final Odyssey',NULL,NULL,'9780586066249',18,1,2,2,1,1,6,NULL,NULL),(292,'2001: A Space Odyssey',NULL,NULL,'9781857236644',18,1,2,2,1,1,6,NULL,NULL),(293,'The Collected Stories',NULL,NULL,'9781857983234',18,1,2,2,1,1,6,NULL,NULL),(294,'The Sentinel',NULL,NULL,'0586212043',19,1,2,2,1,1,6,NULL,NULL),(295,'Rama: The Omnibus',NULL,NULL,'9780575096868',19,1,2,2,1,1,6,NULL,NULL),(296,'Nattens onda öga','A Stranger is Watching',NULL,'9132310471',19,2,1,2,1,1,6,NULL,NULL),(297,'Grå själar','Les âmes grises',NULL,'9113013551',19,2,1,2,1,1,6,NULL,NULL),(298,'Shogun','Shogun',NULL,'9119323816',19,1,1,2,1,1,6,NULL,NULL),(299,'Rött stoft','Red bones',NULL,'9789174290707',19,2,1,2,1,1,6,NULL,NULL),(300,'Borta för alltid',NULL,NULL,'9170011680',19,2,1,2,1,1,6,NULL,NULL),(301,'Släpp inte taget','Hold Tight',NULL,'9789170017490',19,2,1,2,1,1,6,NULL,NULL),(302,'Veronika bestämmer sig för att dö','Veronica decide morrer',NULL,'9170280061',19,2,1,2,1,1,6,NULL,NULL),(303,'Poeten','The Poet',NULL,'9176437701',19,2,1,2,1,1,6,NULL,NULL),(304,'I lagens limo','The Lincoln Lawyer',NULL,'9789113015880',19,2,1,2,1,1,6,NULL,NULL),(305,'Det femte vittnet','The Fifth Witness',NULL,'9789113049366',19,2,1,2,1,1,6,NULL,NULL),(306,'Appassionata','Appassionata',NULL,'9132434278',19,2,1,2,1,1,6,NULL,NULL),(307,'Flyg fula fluga','Blow Fly',NULL,'9113016970',19,2,1,2,1,1,6,NULL,NULL),(308,'Rovdjuret','Predator',NULL,'9789172639119',19,2,1,2,1,1,6,NULL,NULL),(309,'De dödas bok','Book of the Dead',NULL,'9789113025643',19,2,1,2,1,1,6,NULL,NULL),(310,'Kroppsspråk','The Body Farm',NULL,'9172630256',19,2,1,2,1,1,6,NULL,NULL),(311,'Mörkrets Makt','Black Notice',NULL,'9113008293',19,2,1,2,1,1,6,NULL,NULL),(312,'Dunkla vatten','Cause of Death',NULL,'9172630108',19,2,1,2,1,1,6,NULL,NULL),(313,'Microserfs',NULL,NULL,'0006485898',19,2,2,2,1,1,6,NULL,NULL),(314,'JPod',NULL,NULL,'9780747589150',19,2,2,2,1,1,6,NULL,NULL),(315,'I dödens skugga','Secret Sins',NULL,'9164020673',19,2,1,2,1,1,6,NULL,NULL),(316,'Rovdjur','Prey',NULL,'9171301585',19,2,1,2,1,1,6,NULL,NULL),(317,'Jurassic Park - Urtidsparken','Jurassic Park',NULL,'9171195734',19,2,1,2,1,1,6,NULL,NULL),(318,'Accidental Empires',NULL,NULL,'0887308554',19,1,2,2,1,1,6,NULL,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Language`
--

LOCK TABLES `Language` WRITE;
/*!40000 ALTER TABLE `Language` DISABLE KEYS */;
INSERT INTO `Language` VALUES (1,'Svenska'),(2,'Engelska'),(3,'Tyska'),(4,'Franska'),(5,'Spanska');
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
  UNIQUE KEY `locationID_UNIQUE` (`locationID`),
  UNIQUE KEY `location` (`roomID`,`bookshelf`,`shelf`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Location`
--

LOCK TABLES `Location` WRITE;
/*!40000 ALTER TABLE `Location` DISABLE KEYS */;
INSERT INTO `Location` VALUES (17,0,0,0),(1,1,1,1),(2,1,1,2),(3,1,1,3),(12,2,2,1),(11,4,1,1),(6,5,1,1),(5,5,1,2),(4,5,1,3),(7,5,2,1),(10,6,2,4),(8,8,1,1),(9,8,1,2),(19,8,2,4),(18,8,2,5),(14,8,2,6),(13,8,5,1);
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
  `name` varchar(45) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`publisherID`),
  UNIQUE KEY `publisherID_UNIQUE` (`publisherID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Publisher`
--

LOCK TABLES `Publisher` WRITE;
/*!40000 ALTER TABLE `Publisher` DISABLE KEYS */;
INSERT INTO `Publisher` VALUES (1,'Okänt');
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

--
-- Table structure for table `Status`
--

DROP TABLE IF EXISTS `Status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Status` (
  `statusID` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`statusID`),
  UNIQUE KEY `statusID_UNIQUE` (`statusID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Status`
--

LOCK TABLES `Status` WRITE;
/*!40000 ALTER TABLE `Status` DISABLE KEYS */;
INSERT INTO `Status` VALUES (1,'Okänd');
/*!40000 ALTER TABLE `Status` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-09-30 14:26:42