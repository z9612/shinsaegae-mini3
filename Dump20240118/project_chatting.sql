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
-- Table structure for table `chatting`
--

DROP TABLE IF EXISTS `chatting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chatting` (
  `textno` int NOT NULL AUTO_INCREMENT,
  `text` varchar(45) DEFAULT NULL,
  `chatid` int NOT NULL,
  `userno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`textno`)
) ENGINE=InnoDB AUTO_INCREMENT=172 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chatting`
--

LOCK TABLES `chatting` WRITE;
/*!40000 ALTER TABLE `chatting` DISABLE KEYS */;
INSERT INTO `chatting` VALUES (17,'dasd',12,'12345'),(18,'됩니까',12,'12345'),(19,'나두옴',12,'hello'),(32,'123',159,'셀트리온'),(33,'ㅁㅁㅁ',159,'셀트리온'),(34,'123',159,'포모스'),(35,'ㅇㅇㅇ',159,'포모스'),(38,'ㅎㅎㅁㄴ',1,'1'),(39,'ㅇㅇㅇ',1,'1'),(40,'ㅎㅇ',1,'1'),(41,'aaaa',1,'1'),(42,'aaaag',1,'1'),(43,'',1,'1'),(44,'asd',1,'1'),(45,'',1,'1'),(46,'ㅁㄴㅇ',1,'1'),(47,'ㅁㄴㅇ',1,'1'),(48,'ㅏㅏ',1,'1123'),(59,'',1,'1'),(60,'',1,'123'),(61,'',1,'1'),(62,'gd',1,'1'),(63,'ㅎㅇ',1,'123'),(99,'',123,'1'),(100,'zzz',123,'6'),(101,'gg',123,'giun'),(102,'hihi',123,'giun'),(103,'aa',123,'1'),(104,'aa',123,'1'),(105,'123',123,'ww'),(106,'123',123,'ww'),(107,'123',123,'ww'),(108,'123',123,'ww'),(109,'123',123,'ww'),(110,'123',123,'ww'),(111,'123',123,'ww'),(112,'123',123,'ww'),(113,'123',123,'ww'),(114,'123',123,'ww'),(115,'123',123,'ww'),(116,'gggzz',123,'6'),(117,'되죠',123,'giun'),(118,'123',123,'ww'),(119,'허어\\\\\\',123,'giun'),(120,'훠어어어',123,'giun'),(121,'훠어어어',123,'giun'),(122,'11',123,'6'),(123,'123',123,'ww'),(124,'테스트!',123,'1'),(125,'하는중!',123,'6'),(126,'ㅂㅂㅂ',123,'ww'),(127,'하는중!',123,'6'),(128,'qq',123,'giun'),(129,'asdasd',123,'giun'),(130,'qq',123,'giun'),(131,'qq',123,'giun'),(132,'gd',44,'1233'),(133,'ㅎㅇ',44,'1233'),(134,'ㅇ',44,'1233'),(135,'ㅎㅇ',44,'1233'),(136,'gd',44,'1233'),(137,'',44,'1233'),(138,'',44,'1233'),(139,'',44,'1233'),(140,'',44,'1233'),(141,'',44,'1233'),(142,'',44,'1233'),(143,'qq',123,'giun'),(144,'',123,'1'),(145,'123',123,'1'),(146,'123',123,'51'),(147,'',1,'55'),(148,'',1,'55'),(149,'나는 채팅 메시지',123,'57'),(150,'채팅 메시지 계속 입력',123,'test_1'),(151,'PRD가 뭐지',123,'test_1'),(152,'부트스트랩 ㅋㅋ',123,'57'),(153,'적용한겁니다 하하',123,'test_1'),(154,'이런 문제가 있네요',123,'test_1'),(155,'ㅋ',123,'6'),(156,'999',123,'giun'),(157,'응원해주세요',123,'6'),(158,'응원화이팅!',123,'giun'),(159,'이런식으로 채팅공유',123,'giun'),(160,'으우언응원',123,'giun'),(161,'디테일 중요하죠',123,'6'),(162,'깔끔한게 중요합니다',123,'giun'),(163,'냠냠',123,'giun'),(164,'냠냠냠',123,'giun'),(165,'새로운 채팅방입니다',777,'6'),(166,'새롭죠',777,'giun'),(167,'늘 새로워',777,'giun'),(168,'test119',123,'6'),(169,'test113',123,'giun'),(170,'test114',123,'giun'),(171,'test115',123,'giun');
/*!40000 ALTER TABLE `chatting` ENABLE KEYS */;
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
