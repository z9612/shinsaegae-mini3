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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `event` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `userno` int DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `end_date` timestamp NOT NULL,
  `memo` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `event_userno_idx` (`userno`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,1,'저녁 약속','event-info','2024-01-09 06:28:00','2024-01-10 12:14:00','강남역'),(2,1,'스키장','event-important','2024-01-18 06:28:00','2024-01-20 06:17:00','정선_1'),(3,1,'기운 일정','','2024-01-16 06:28:51','2024-01-02 06:23:00','기운'),(4,2,'남의 일정','','2024-01-16 06:28:51','2024-01-02 06:23:00','남남'),(40,NULL,'코드 통합 일정','event-info','2024-02-02 08:16:00','2024-02-02 12:16:00','코드 통합 일정'),(42,6,'일정1','event-important','2024-01-15 11:28:00','2024-01-16 14:28:00','일정2'),(43,1,'눈을감자','','2024-01-29 11:36:00','2024-01-31 11:36:00','감자존맛'),(45,6,'오늘의 일정','event-info','2024-01-18 03:27:00','2024-01-19 03:27:00','977'),(46,6,'test111','event-important','2024-01-24 04:51:00','2024-01-24 04:51:00','test111'),(47,1,'화이팅','event-info','2024-01-17 05:00:00','2024-01-18 05:00:00','메모'),(55,6,'새해에는 열심히하자','event-important','2024-01-01 01:12:00','2024-01-01 09:20:00','새해 ^_^'),(56,6,'약속99','event-info','2024-01-06 05:26:00','2024-01-07 05:26:00','약속99(수정)'),(58,1234,'화이팅','','2024-01-17 05:31:51','0000-00-00 00:00:00',NULL),(59,6,'먼저 일정등록','event-info','2024-01-03 05:32:00','2024-01-04 05:32:00','먼저 일정등록'),(60,1,'약속99','','2024-01-17 05:36:59','0000-00-00 00:00:00',NULL),(62,6,'눈을감자','','2024-01-17 05:39:04','0000-00-00 00:00:00',NULL),(65,155,'저녁 약속','','2024-01-17 05:46:04','0000-00-00 00:00:00',NULL),(66,48,'112 일정','event-important','2024-01-01 05:59:00','2024-01-06 05:59:00','112 일정'),(68,112,'화이팅','','2024-01-17 07:05:09','0000-00-00 00:00:00',NULL),(69,1,'일정1','','2024-01-18 02:58:42','0000-00-00 00:00:00',NULL),(71,55,'눈을감자','','2024-01-18 06:33:00','0000-00-00 00:00:00',NULL),(72,55,'시험','event-important','2024-01-18 06:50:00','2024-01-20 06:50:00','ㅇㅇ'),(74,57,'일정1','','2024-01-18 07:13:11','0000-00-00 00:00:00',NULL);
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
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
