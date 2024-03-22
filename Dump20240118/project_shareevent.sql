-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: database-1.cyrzsv0jbwjm.ap-northeast-2.rds.amazonaws.com    Database: project
-- ------------------------------------------------------
-- Server version	8.0.35

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `shareevent`
--

DROP TABLE IF EXISTS `shareevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shareevent` (
  `shareno` int NOT NULL AUTO_INCREMENT,
  `userno` int DEFAULT NULL,
  `chatid` int DEFAULT NULL,
  `event` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`shareno`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shareevent`
--

LOCK TABLES `shareevent` WRITE;
/*!40000 ALTER TABLE `shareevent` DISABLE KEYS */;
INSERT INTO `shareevent` VALUES (34,6,1,'약속99'),(35,1,1,'눈을감자'),(36,1,1,'저녁 약속'),(37,1,1,'화이팅'),(38,6,123,'일정1'),(39,6,123,'일정1'),(40,1,123,'저녁 약속'),(41,1,123,'저녁 약속'),(42,1,123,'스키장'),(43,1,123,'저녁 약속'),(44,1,123,'저녁 약속'),(45,1,123,'저녁 약속'),(46,1,123,'저녁 약속'),(47,1,123,'저녁 약속'),(48,1,123,'저녁 약속'),(49,1,123,'저녁 약속'),(50,1,123,'저녁 약속'),(51,1,123,'저녁 약속'),(52,1,123,'저녁 약속'),(53,1,123,'저녁 약속'),(54,1,1,'저녁 약속'),(55,6,123,'일정1'),(56,55,1,'눈을감자'),(57,6,123,'눈을감자'),(58,6,123,'새해에는 열심히하자'),(59,6,123,'새해에는 열심히하자');
/*!40000 ALTER TABLE `shareevent` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-18 16:42:16
