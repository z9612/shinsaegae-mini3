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
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userno` int NOT NULL AUTO_INCREMENT COMMENT '유저no',
  `userid` varchar(45) NOT NULL COMMENT '유저id',
  `email` varchar(45) DEFAULT NULL COMMENT 'email',
  `userpasswd` varchar(45) DEFAULT NULL COMMENT '유저비밀번호',
  `username` varchar(45) NOT NULL COMMENT '유저이름',
  `iddate` varchar(45) DEFAULT NULL COMMENT '아이디 생성날짜',
  PRIMARY KEY (`userno`),
  UNIQUE KEY `id_UNIQUE` (`userno`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='유저 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'ww','whwo1124@naver.com','12345','jojaehyeong','2024-01-15 06:50:14'),(3,'hii','hii@naver.com','1234568','namjyungi','2024i'),(5,'ndh8767','dkehdrn@naver.com','１２３４５６７','dkehdrn','2024-01-15'),(6,'giun','z@gmail.com','1234','giun1','2024-01-16'),(7,'ndh8767１１１','dkehdrn@naver.com','１２３４５６７８９','dkehdrn１１１','2024-01-15'),(9,'id','email','２２２２','남정현','2024-01-16'),(13,'aZ','aaa@aaa','9999912','aAZ','2024-01-15'),(14,'today','is','so','happy','2024-01-16'),(15,'asdsad','asd','sdfdsf','sdfdd','2024-01-16'),(17,'xcvxv','xcv','xcv ','xcvcx','2024-01-16'),(22,'zqqqqqqqqq','s','5','t','2024-01-30'),(23,'3','3','3','3','2024-01-16'),(34,'4','4','4','4','2024-01-17'),(39,'11','11','11','11','2024-01-17'),(40,'166','166','166','166','2024-01-17'),(41,'122222','1','1','1','2024-01-17'),(42,'2222','222','222','222','2024-01-17'),(46,'ooooooo','oooooooooo','ooooooooo','ooooooooo','2024-01-17'),(47,'999','999','999','999','2024-01-17'),(49,'whwo1124','whwo1124@naver.com','12345','조재형','2024-01-18'),(50,'smi02036','1111','1111','이민아','2024-01-17'),(51,'giun1234','giun@123','12345','giun',''),(52,'giun1234','giun@123','12345','giun',''),(53,'gud020236','aa@aa','12345','aa','2024-01-18'),(54,'JoJaeHyeong','jojae@','12345','ww','2024-01-04'),(55,'tjehdgns0925','tjehdgns0925@naver.com','zzz123','서동훈','2024-01-18'),(57,'test_1','z@gmail.com','1234','테스트','2024-01-18');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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

-- Dump completed on 2024-01-18 16:42:17
