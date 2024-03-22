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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `commentno` int NOT NULL AUTO_INCREMENT COMMENT '댓글no',
  `userno` int NOT NULL COMMENT '유저no',
  `content` varchar(45) DEFAULT NULL COMMENT '내용',
  `create_date` datetime DEFAULT NULL COMMENT '생성일자',
  `modify_date` datetime DEFAULT NULL COMMENT '수정날짜',
  `postno` int DEFAULT NULL,
  PRIMARY KEY (`commentno`),
  UNIQUE KEY `commentno_UNIQUE` (`commentno`),
  KEY `fk_comment_userno_idx` (`userno`),
  KEY `fk_comment_postno_idx` (`postno`),
  CONSTRAINT `fk_comment_postno` FOREIGN KEY (`postno`) REFERENCES `board` (`postno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comment_userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (68,50,'반가워요!',NULL,NULL,129),(69,49,'서울은 역시 남산타워 돈까스죠',NULL,NULL,130),(70,51,'안녕하세요~ 반갑습니다~',NULL,NULL,129),(71,51,'여의도 더현대 추천드려요',NULL,NULL,130),(72,50,'끝까지 화이팅~!',NULL,NULL,131),(73,51,'웹서버 나중에 올려보면 되죠~ 화이팅!',NULL,NULL,132),(74,53,'화이팅',NULL,NULL,156),(75,53,'좋아요~',NULL,NULL,154),(76,51,'반가워요',NULL,NULL,154),(77,6,'ㄹㅇㅋㅋ',NULL,NULL,157),(78,6,'좋아요',NULL,NULL,159),(79,54,'좋아요',NULL,NULL,158),(80,54,'좋아요',NULL,NULL,157),(81,54,'좋아요',NULL,NULL,159),(82,57,'진짜 감동적이네요.',NULL,NULL,159);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
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

-- Dump completed on 2024-01-18 16:42:15
