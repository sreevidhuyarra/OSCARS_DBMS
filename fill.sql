-- MySQL dump 10.13  Distrib 8.0.35, for Linux (x86_64)
--
-- Host: localhost    Database: phase_4
-- ------------------------------------------------------
-- Server version	8.0.35-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `phase_4`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `phase_4` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `phase_4`;

--
-- Table structure for table `Actor`
--

DROP TABLE IF EXISTS `Actor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Actor` (
  `Artist_Id` int NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Year_Of_Birth` year DEFAULT NULL,
  PRIMARY KEY (`Artist_Id`),
  CONSTRAINT `Actor_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Actor`
--

LOCK TABLES `Actor` WRITE;
/*!40000 ALTER TABLE `Actor` DISABLE KEYS */;
INSERT INTO `Actor` VALUES (1,'Female',2002),(2,'Male',1961),(3,'Male',1949),(4,'Male',1975),(5,'Male',1967),(6,'Male',1958),(7,'Male',1974),(8,'Male',1968),(9,'Female',1981),(10,'Female',1955),(11,'Male',1956),(12,'Male',1953),(13,'Male',1964),(14,'Female',1996),(15,'Female',1978),(16,'Male',1972),(17,'Female',1971),(18,'Female',1980),(19,'Female',1971),(43,'Female',1962),(44,'Male',1971),(45,'Female',1958),(46,'Female',1957),(47,'Male',1974),(48,'Female',1976),(49,'Male',1947),(50,'Female',1970),(51,'Female',1976),(52,'Female',1978),(53,'Male',1967),(55,'Male',1974),(56,'Female',1974),(57,'Female',1990),(58,'Male',1975),(61,'Female',1988);
/*!40000 ALTER TABLE `Actor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist`
--

DROP TABLE IF EXISTS `Artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist` (
  `Artist_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Country_Of_Origin` varchar(25) DEFAULT NULL,
  `Artist_Type` varchar(25) NOT NULL,
  PRIMARY KEY (`Artist_Id`),
  CONSTRAINT `Artist_chk_1` CHECK ((`Artist_Type` in (_utf8mb4'Director',_utf8mb4'Singer',_utf8mb4'Actor',_utf8mb4'Others',_utf8mb4'Mult')))
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist`
--

LOCK TABLES `Artist` WRITE;
/*!40000 ALTER TABLE `Artist` DISABLE KEYS */;
INSERT INTO `Artist` VALUES (1,'Emilia Annis I. Jones','England','Actor'),(2,'Eugenio González Derbez','Mexico','Actor'),(3,'David Russell Strathairn','USA','Actor'),(4,'Lee Sun-kyun','South Korea','Actor'),(5,'Song Kang-ho','South Korea','Actor'),(6,'Viggo Peter Mortensen Jr.','USA','Actor'),(7,'Leonardo DiCaprio','USA','Actor'),(8,'Willard Carroll Smith II','USA','Actor'),(9,'Stephanie Beatriz','USA','Actor'),(10,'María Cecilia Botero','Colombia','Actor'),(11,'Thomas Jeffrey Hanks','USA','Actor'),(12,'Timothy Alan','USA','Actor'),(13,'Keanu Reeves','Canada','Actor'),(14,'Hailee Steinfeld','USA','Actor'),(15,'Ginnifer Goodwin','USA','Actor'),(16,'Idris Elba','England','Actor'),(17,'Amy Poehler','USA','Actor'),(18,'Kristen Bell','USA','Actor'),(19,'Idina Menzel','USA','Actor'),(20,'Rahul Sipligunj','India','Singer'),(21,'Billie Eilish','USA','Singer'),(22,'Kendrick Lamar','USA','Singer'),(23,'Carlos Rivera','Mexico','Singer'),(24,'Ryan Gosling','Canada','Mult'),(25,'Solána Imani Rowe','USA','Singer'),(26,'Chloé Zhao','China','Director'),(27,'Jane Campion','New Zealand','Director'),(28,'Daniels (Duo)','USA','Director'),(29,'Bong Joon-ho','South Korea','Director'),(30,'Guillermo del Toro','Mexico','Director'),(31,'Barry Jenkins','USA','Director'),(32,'Tom McCarthy','USA','Director'),(33,'Jennifer Lee','USA','Director'),(34,'Peter Farrelly','USA','Director'),(35,'Sian Heder','USA','Director'),(36,'Peter Hans Docter','USA','Director'),(37,'Josh Cooley','USA','Director'),(38,'Peter Ramsey','USA','Director'),(39,'Rich Moore','USA','Director'),(40,'Jared Bush','USA','Director'),(41,'Chris Williams','Canada','Director'),(42,'Lee Edward Unkrich','USA','Director'),(43,'Michelle Yeoh','Malaysia','Actor'),(44,'Ke Huy Quan','USA','Actor'),(45,'Jamie Lee Curtis','USA','Actor'),(46,'Frances McDormand','USA','Actor'),(47,'Mahershala Ali','USA','Actor'),(48,'Sally Hawkins','England','Actor'),(49,'Richard Dale Jenkins','USA','Actor'),(50,'Octavia Spencer','USA','Actor'),(51,'Naomie Harris','England','Actor'),(52,'Rachel McAdams','Canada','Actor'),(53,'Mark Ruffalo','USA','Actor'),(54,'David O. Russell','USA','Director'),(55,'Christian Bale','England','Actor'),(56,'Amy Adams','USA','Actor'),(57,'Jennifer Lawrence','USA','Actor'),(58,'Bradley Cooper','USA','Actor'),(59,'Damien Chazelle','USA','Director'),(61,'Emma Stone','USA','Actor');
/*!40000 ALTER TABLE `Artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Artist_Nomination`
--

DROP TABLE IF EXISTS `Artist_Nomination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Artist_Nomination` (
  `Artist_Id` int NOT NULL,
  `Year` year NOT NULL,
  `Category` int NOT NULL,
  `Win` int NOT NULL,
  PRIMARY KEY (`Artist_Id`,`Year`,`Category`),
  KEY `Category` (`Category`),
  CONSTRAINT `Artist_Nomination_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Artist_Nomination_ibfk_2` FOREIGN KEY (`Category`) REFERENCES `Award_Category` (`Award_Category_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Artist_Nomination`
--

LOCK TABLES `Artist_Nomination` WRITE;
/*!40000 ALTER TABLE `Artist_Nomination` DISABLE KEYS */;
INSERT INTO `Artist_Nomination` VALUES (6,2019,3,0),(11,1994,3,1),(11,1995,3,1),(21,2022,20,1),(22,2019,20,0),(24,2016,3,0),(24,2016,20,1),(25,2019,20,0),(26,2021,2,1),(27,2022,2,1),(28,2023,2,1),(29,2020,2,1),(30,2018,2,1),(31,2017,2,0),(32,2016,2,0),(43,2023,4,1),(44,2023,5,1),(45,2023,6,1),(46,2021,4,1),(47,2019,5,1),(48,2018,4,0),(49,2018,5,0),(50,2018,6,0),(51,2017,6,0),(52,2016,6,0),(53,2016,5,0),(55,2014,3,0),(56,2014,4,0),(57,2014,6,0),(58,2014,5,0),(61,2016,4,1);
/*!40000 ALTER TABLE `Artist_Nomination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Award_Category`
--

DROP TABLE IF EXISTS `Award_Category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Award_Category` (
  `Name` varchar(50) DEFAULT NULL,
  `Awardee` varchar(25) DEFAULT NULL,
  `Award_Category_Id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Award_Category_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Award_Category`
--

LOCK TABLES `Award_Category` WRITE;
/*!40000 ALTER TABLE `Award_Category` DISABLE KEYS */;
INSERT INTO `Award_Category` VALUES ('Best Picture','Movie',1),('Best Director','Director',2),('Best Actor in a Leading Role','Actor',3),('Best Actress in a Leading Role','Actor',4),('Best Actor in a Supporting Role','Actor',5),('Best Actress in a Supporting Role','Actor',6),('Best Animated Feature Film','Movie',7),('Best International Feature Film','Movie',8),('Best Original Screenplay','Others',9),('Best Adapted Screenplay','Others',10),('Best Cinematography','Others',11),('Best Film Editing','Others',12),('Best Production Design','Others',13),('Best Costume Design','Others',14),('Best Makeup and Hairstyling','Others',15),('Best Visual Effects','Others',16),('Best Sound Editing','Others',17),('Best Sound Mixing','Others',18),('Best Original Score','Others',19),('Best Original Song','Singer',20);
/*!40000 ALTER TABLE `Award_Category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ceremony`
--

DROP TABLE IF EXISTS `Ceremony`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Ceremony` (
  `Year` year NOT NULL,
  `Venue` varchar(50) DEFAULT NULL,
  `Host_Id` int NOT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Year`,`Host_Id`),
  KEY `fk_ceremony_host` (`Host_Id`),
  CONSTRAINT `fk_ceremony_host` FOREIGN KEY (`Host_Id`) REFERENCES `Host` (`Host_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ceremony`
--

LOCK TABLES `Ceremony` WRITE;
/*!40000 ALTER TABLE `Ceremony` DISABLE KEYS */;
INSERT INTO `Ceremony` VALUES (2000,'Shine Auditorium',10,'2000-03-26'),(2001,'Shine Auditorium',5,'2001-03-25'),(2002,'Kodak Auditorium (Now Dolby Theatre)',16,'2002-03-24'),(2003,'Kodak Auditorium (Now Dolby Theatre)',5,'2003-03-23'),(2004,'Kodak Auditorium (Now Dolby Theatre)',10,'2004-02-29'),(2005,'Kodak Auditorium (Now Dolby Theatre)',6,'2005-02-27'),(2006,'Kodak Auditorium (Now Dolby Theatre)',11,'2006-03-05'),(2007,'Kodak Auditorium (Now Dolby Theatre)',8,'2007-02-25'),(2008,'Kodak Auditorium (Now Dolby Theatre)',11,'2008-02-24'),(2009,'Kodak Auditorium (Now Dolby Theatre)',15,'2009-02-22'),(2010,'Kodak Auditorium (Now Dolby Theatre)',13,'2010-03-07'),(2011,'Kodak Auditorium (Now Dolby Theatre)',12,'2011-02-27'),(2012,'Hollywood and Highland Centre (Now Dolby Theatre)',10,'2012-02-26'),(2013,'Dolby Theatre',9,'2013-02-24'),(2014,'Dolby Theatre',8,'2014-03-02'),(2015,'Dolby Theatre',7,'2015-02-22'),(2016,'Dolby Theatre',6,'2016-02-28'),(2017,'Dolby Theatre',1,'2017-02-26'),(2018,'Dolby Theatre',1,'2018-03-04'),(2019,'Dolby Theatre',14,'2019-02-24'),(2020,'Dolby Theatre',14,'2020-02-09'),(2021,'Union Station',14,'2021-04-25'),(2022,'Dolby Theatre',4,'2022-03-27'),(2023,'Dolby Theatre',1,'2023-03-12');
/*!40000 ALTER TABLE `Ceremony` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Character_Table`
--

DROP TABLE IF EXISTS `Character_Table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Character_Table` (
  `Character_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  PRIMARY KEY (`Character_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Character_Table`
--

LOCK TABLES `Character_Table` WRITE;
/*!40000 ALTER TABLE `Character_Table` DISABLE KEYS */;
INSERT INTO `Character_Table` VALUES (1,'Elsa','Female',21),(2,'Anna','Female',18),(3,'Joy','Female',11),(4,'Judy Hopps','Female',24),(5,'Chief Bogo','Male',44),(6,'Gwen Stacy','Female',17),(7,'Woody','Male',59),(8,'Buzz Lightyear','Male',55),(9,'Duke Caboom','Male',40),(10,'Mirabel Madrigal','Female',15),(11,'Abuela Alma Madrigal','Female',75),(12,'Ruby Rossi','Female',17),(13,'Bernardo Villalobos','Male',40),(14,'Kim Ki-taek','Male',65),(15,'Park Dong-ik','Male',47),(16,'Tony Lip','Male',32);
/*!40000 ALTER TABLE `Character_Table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Director`
--

DROP TABLE IF EXISTS `Director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Director` (
  `Artist_Id` int NOT NULL,
  `Gender` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Artist_Id`),
  CONSTRAINT `Director_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Director`
--

LOCK TABLES `Director` WRITE;
/*!40000 ALTER TABLE `Director` DISABLE KEYS */;
INSERT INTO `Director` VALUES (26,'Female'),(27,'Female'),(28,'Male'),(29,'Male'),(30,'Male'),(31,'Male'),(32,'Male'),(33,'Female'),(34,'Male'),(35,'Female'),(36,'Male'),(37,'Male'),(38,'Male'),(39,'Male'),(40,'Male'),(41,'Male'),(42,'Male'),(54,'Male'),(59,'Male');
/*!40000 ALTER TABLE `Director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Family_Member`
--

DROP TABLE IF EXISTS `Family_Member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Family_Member` (
  `Member_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  `Relation` varchar(25) NOT NULL,
  PRIMARY KEY (`Member_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Family_Member`
--

LOCK TABLES `Family_Member` WRITE;
/*!40000 ALTER TABLE `Family_Member` DISABLE KEYS */;
INSERT INTO `Family_Member` VALUES (1,'Jane Hajduk','Spouse'),(2,'Rita Wilson','Spouse'),(3,'Jim Hanks','Brother'),(4,'Alexandra Grant','Spouse'),(5,'Maggie Baird','Mother'),(6,'Nick Young','Cousin'),(7,'Baby Keem','Cousin');
/*!40000 ALTER TABLE `Family_Member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Featured_In`
--

DROP TABLE IF EXISTS `Featured_In`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Featured_In` (
  `Song_Id` int NOT NULL,
  `Movie_Id` int NOT NULL,
  PRIMARY KEY (`Song_Id`,`Movie_Id`),
  KEY `Featured_In_Movie` (`Movie_Id`),
  CONSTRAINT `Featured_In_Movie` FOREIGN KEY (`Movie_Id`) REFERENCES `Movie` (`Movie_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Featured_In_Song` FOREIGN KEY (`Song_Id`) REFERENCES `Song` (`Song_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Featured_In`
--

LOCK TABLES `Featured_In` WRITE;
/*!40000 ALTER TABLE `Featured_In` DISABLE KEYS */;
INSERT INTO `Featured_In` VALUES (8,1),(6,9),(3,13);
/*!40000 ALTER TABLE `Featured_In` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Genre`
--

DROP TABLE IF EXISTS `Genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Genre` (
  `Genre_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(25) NOT NULL,
  PRIMARY KEY (`Genre_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Genre`
--

LOCK TABLES `Genre` WRITE;
/*!40000 ALTER TABLE `Genre` DISABLE KEYS */;
INSERT INTO `Genre` VALUES (1,'Pop'),(2,'Rock'),(3,'Hip-Hop'),(4,'Country'),(5,'Jazz'),(6,'Electronic'),(7,'R&B'),(8,'Classical'),(9,'Blues'),(10,'Reggae'),(11,'Desi'),(12,'Folk');
/*!40000 ALTER TABLE `Genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Host`
--

DROP TABLE IF EXISTS `Host`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Host` (
  `Host_Id` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Host_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Host`
--

LOCK TABLES `Host` WRITE;
/*!40000 ALTER TABLE `Host` DISABLE KEYS */;
INSERT INTO `Host` VALUES (1,'Jimmy Kimmel'),(2,'Regina Hall'),(3,'Amy Schumer'),(4,'Wanda Sykes'),(5,'Steve Martin'),(6,'Chris Rock'),(7,'Neil Patrick Harris'),(8,'Ellen DeGeneres'),(9,'Seth MacFarlane'),(10,'Billy Crystal'),(11,'James Franco'),(12,'Anne Hathaway'),(13,'Alec Baldwin'),(14,'No Host'),(15,'Hugh Jackman'),(16,'Whoopi Goldberg'),(17,'David Letterman'),(18,'Chevy Chase');
/*!40000 ALTER TABLE `Host` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Movie`
--

DROP TABLE IF EXISTS `Movie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Movie` (
  `Movie_Id` int NOT NULL AUTO_INCREMENT,
  `Title` varchar(50) NOT NULL,
  `Year` year NOT NULL,
  `Budget` int DEFAULT NULL,
  `Gross_Income` int DEFAULT NULL,
  `Genre` varchar(25) DEFAULT NULL,
  `Director_Id` int DEFAULT NULL,
  PRIMARY KEY (`Movie_Id`),
  KEY `Movie_Director_FK` (`Director_Id`),
  CONSTRAINT `Movie_Director_FK` FOREIGN KEY (`Director_Id`) REFERENCES `Director` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=20236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Movie`
--

LOCK TABLES `Movie` WRITE;
/*!40000 ALTER TABLE `Movie` DISABLE KEYS */;
INSERT INTO `Movie` VALUES (1,'Frozen',2013,150000000,1280000000,'Musical-Fantasy',33),(2,'Big Hero 6',2014,165000000,657800000,'Superhero',41),(3,'Spotlight',2015,20000000,98700000,'Biographical Drama',32),(4,'Inside Out',2015,175000000,858800000,'Coming-of-Age',36),(5,'La La Land',2016,30000000,472000000,'Romantic-Musical',59),(6,'Moonlight',2016,1500000,65200000,'Coming-of-Age',31),(7,'Zootopia',2016,150000000,1025000000,'Cop Action Comedy',39),(8,'The Shape of Water',2017,20000000,195300000,'Romantic-Fantasy',30),(9,'Coco',2017,175000000,814300000,'Fantasy',42),(10,'Green Book',2018,23000000,321800000,'Biographical Comedy-Drama',34),(11,'Spider-Man: Into the Spider-Verse',2018,90000000,384300000,'Superhero',38),(12,'Parasite',2019,15500000,262700000,'Comedy-Thriller',29),(13,'Toy Story 4',2019,200000000,1073000000,'Comedy-Drama',37),(14,'Nomadland',2020,5000000,39500000,'Drama',26),(15,'Soul',2020,150000000,121000000,'Fantasy Comedy-Drama',36),(16,'CODA',2021,10000000,2200000,'Comedy-Drama',35),(17,'Encanto',2021,120000000,256800000,'Musical-Fantasy',40),(18,'Everything Everywhere All at Once',2022,15000000,141200000,'Comedy',28),(19,'Guillermo del \'s Pinocchio',2022,35000000,109846,'Musical-Fantasy',30),(20,'American Hustle',2013,40000000,251200000,'Black-Comedy Crime',54);
/*!40000 ALTER TABLE `Movie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Others`
--

DROP TABLE IF EXISTS `Others`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Others` (
  `Artist_Id` int NOT NULL,
  PRIMARY KEY (`Artist_Id`),
  CONSTRAINT `Others_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Others`
--

LOCK TABLES `Others` WRITE;
/*!40000 ALTER TABLE `Others` DISABLE KEYS */;
/*!40000 ALTER TABLE `Others` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Played`
--

DROP TABLE IF EXISTS `Played`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Played` (
  `Artist_Id` int NOT NULL,
  `Movie_Id` int NOT NULL,
  `Character_Id` int NOT NULL,
  PRIMARY KEY (`Artist_Id`,`Movie_Id`,`Character_Id`),
  KEY `Character_Id` (`Character_Id`),
  KEY `Played_Movie` (`Movie_Id`),
  CONSTRAINT `Played_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Actor` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Played_ibfk_3` FOREIGN KEY (`Character_Id`) REFERENCES `Character_Table` (`Character_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Played_Movie` FOREIGN KEY (`Movie_Id`) REFERENCES `Movie` (`Movie_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Played`
--

LOCK TABLES `Played` WRITE;
/*!40000 ALTER TABLE `Played` DISABLE KEYS */;
INSERT INTO `Played` VALUES (19,1,1),(18,1,2),(17,4,3),(15,7,4),(16,7,5),(14,11,6),(11,13,7),(12,13,8),(13,13,9),(9,17,10),(10,17,11),(1,16,12),(2,16,13),(5,12,14),(4,12,15),(6,10,16);
/*!40000 ALTER TABLE `Played` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Related_To`
--

DROP TABLE IF EXISTS `Related_To`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Related_To` (
  `Artist_Id` int NOT NULL,
  `Member_Id` int NOT NULL,
  PRIMARY KEY (`Artist_Id`,`Member_Id`),
  KEY `Related_To_ibfk_2` (`Member_Id`),
  CONSTRAINT `Related_To_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Related_To_ibfk_2` FOREIGN KEY (`Member_Id`) REFERENCES `Family_Member` (`Member_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Related_To`
--

LOCK TABLES `Related_To` WRITE;
/*!40000 ALTER TABLE `Related_To` DISABLE KEYS */;
INSERT INTO `Related_To` VALUES (12,1),(11,2),(11,3),(13,4),(21,5),(22,6),(23,7);
/*!40000 ALTER TABLE `Related_To` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sang`
--

DROP TABLE IF EXISTS `Sang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Sang` (
  `Artist_Id` int NOT NULL,
  `Song_Id` int NOT NULL,
  PRIMARY KEY (`Artist_Id`,`Song_Id`),
  KEY `Sang_Song` (`Song_Id`),
  CONSTRAINT `Sang_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Singer` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Sang_Song` FOREIGN KEY (`Song_Id`) REFERENCES `Song` (`Song_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sang`
--

LOCK TABLES `Sang` WRITE;
/*!40000 ALTER TABLE `Sang` DISABLE KEYS */;
INSERT INTO `Sang` VALUES (20,1),(21,2),(23,4),(22,5),(25,5),(24,7),(19,8);
/*!40000 ALTER TABLE `Sang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Singer`
--

DROP TABLE IF EXISTS `Singer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Singer` (
  `Artist_Id` int NOT NULL,
  PRIMARY KEY (`Artist_Id`),
  CONSTRAINT `Singer_ibfk_1` FOREIGN KEY (`Artist_Id`) REFERENCES `Artist` (`Artist_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Singer`
--

LOCK TABLES `Singer` WRITE;
/*!40000 ALTER TABLE `Singer` DISABLE KEYS */;
INSERT INTO `Singer` VALUES (19),(20),(21),(22),(23),(24),(25);
/*!40000 ALTER TABLE `Singer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Song`
--

DROP TABLE IF EXISTS `Song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Song` (
  `Song_Id` int NOT NULL AUTO_INCREMENT,
  `Genre_Id` int NOT NULL,
  `Title` varchar(50) DEFAULT NULL,
  `Results` varchar(25) DEFAULT NULL,
  `Year_Of_Nomination` year DEFAULT NULL,
  `Language` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`Song_Id`,`Genre_Id`),
  KEY `Song_genre` (`Genre_Id`),
  CONSTRAINT `Song_genre` FOREIGN KEY (`Genre_Id`) REFERENCES `Genre` (`Genre_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Song`
--

LOCK TABLES `Song` WRITE;
/*!40000 ALTER TABLE `Song` DISABLE KEYS */;
INSERT INTO `Song` VALUES (1,11,'Naatu Naatu','Winner',2023,'Telugu'),(2,1,'No Time to Die','Winner',2022,'English'),(3,1,'I Can\'t Let You Throw Yourself Away','Nominated',2020,'English'),(4,12,'Dos Oruguitas','Nominated',2022,'Spanish'),(5,1,'All the Stars','Nominated',2019,'English'),(6,1,'Remember Me','Winner',2018,'English'),(7,5,'City of Stars','Winner',2017,'English'),(8,1,'Let It Go','Winner',2014,'English');
/*!40000 ALTER TABLE `Song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Wins`
--

DROP TABLE IF EXISTS `Wins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Wins` (
  `Movie_Id` int NOT NULL,
  `Ceremony_Year` year NOT NULL,
  `Artist_Id` int DEFAULT NULL,
  `Award_Category_Id` int NOT NULL,
  `Winner` int DEFAULT '1',
  PRIMARY KEY (`Movie_Id`,`Ceremony_Year`,`Award_Category_Id`),
  KEY `Artist_Id` (`Artist_Id`),
  KEY `Ceremony_Year` (`Ceremony_Year`),
  KEY `wins_category` (`Award_Category_Id`),
  CONSTRAINT `wins_category` FOREIGN KEY (`Award_Category_Id`) REFERENCES `Award_Category` (`Award_Category_Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wins_movie` FOREIGN KEY (`Movie_Id`) REFERENCES `Movie` (`Movie_Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Wins`
--

LOCK TABLES `Wins` WRITE;
/*!40000 ALTER TABLE `Wins` DISABLE KEYS */;
INSERT INTO `Wins` VALUES (1,2014,NULL,7,1),(1,2014,19,20,1),(2,2014,NULL,7,1),(3,2015,NULL,1,1),(3,2016,32,2,0),(3,2016,53,5,0),(3,2016,52,6,0),(3,2016,NULL,9,0),(3,2016,NULL,12,0),(4,2015,NULL,7,1),(4,2016,NULL,9,0),(5,2017,NULL,1,0),(5,2017,59,2,1),(5,2017,24,3,0),(5,2017,61,4,1),(5,2017,NULL,9,0),(5,2017,NULL,11,1),(5,2017,NULL,12,0),(5,2017,NULL,13,1),(5,2017,NULL,14,0),(5,2017,NULL,17,0),(5,2017,NULL,18,0),(5,2017,NULL,19,0),(5,2017,24,20,1),(6,2016,NULL,1,1),(6,2017,31,2,0),(6,2017,47,5,1),(6,2017,51,6,0),(6,2017,NULL,10,1),(6,2017,NULL,11,0),(6,2017,NULL,12,0),(6,2017,NULL,19,0),(7,2016,NULL,7,1),(8,2017,NULL,1,1),(8,2018,30,2,1),(8,2018,48,4,0),(8,2018,49,5,0),(8,2018,50,6,0),(8,2018,NULL,9,0),(8,2018,NULL,11,0),(8,2018,NULL,12,0),(8,2018,NULL,13,1),(8,2018,NULL,14,0),(8,2018,NULL,17,0),(8,2018,NULL,18,0),(8,2018,NULL,19,1),(9,2017,NULL,7,1),(9,2018,NULL,20,1),(10,2018,NULL,1,1),(10,2019,6,3,0),(10,2019,47,5,1),(10,2019,NULL,9,1),(10,2019,NULL,12,0),(11,2018,NULL,7,1),(12,2019,NULL,1,1),(12,2020,29,2,1),(12,2020,NULL,8,1),(12,2020,NULL,9,1),(12,2020,NULL,12,0),(12,2020,NULL,13,0),(13,2019,NULL,7,1),(14,2020,NULL,1,1),(14,2021,26,2,1),(14,2021,46,4,1),(14,2021,NULL,10,0),(14,2021,NULL,11,0),(14,2021,NULL,12,0),(15,2020,NULL,7,1),(15,2021,NULL,17,0),(15,2021,NULL,19,1),(16,2021,NULL,1,1),(16,2022,NULL,5,1),(16,2022,NULL,10,1),(17,2021,NULL,7,1),(17,2022,NULL,19,0),(17,2022,NULL,20,0),(18,2022,NULL,1,1),(18,2023,28,2,1),(18,2023,43,4,1),(18,2023,44,5,1),(18,2023,45,6,1),(18,2023,NULL,9,0),(18,2023,NULL,12,0),(18,2023,NULL,14,0),(18,2023,NULL,19,0),(18,2023,NULL,20,0),(19,2022,NULL,7,1),(20,2014,NULL,1,0),(20,2014,54,2,0),(20,2014,55,3,0),(20,2014,56,4,0),(20,2014,58,5,0),(20,2014,57,6,0),(20,2014,NULL,9,0),(20,2014,NULL,12,0),(20,2014,NULL,13,0),(20,2014,NULL,14,0);
/*!40000 ALTER TABLE `Wins` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-02 22:46:41
