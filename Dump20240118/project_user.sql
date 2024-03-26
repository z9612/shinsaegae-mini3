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
) 


