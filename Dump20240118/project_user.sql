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
) ;

DROP TABLE IF EXISTS `calendar`;
CREATE TABLE `calendar` (
  `calendarno` int NOT NULL COMMENT '캘린더no',
  `userno` int NOT NULL COMMENT '유저no',
  PRIMARY KEY (`calendarno`),
  KEY `new_userno_idx` (`userno`),
  CONSTRAINT `fk_calendar_userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule` (
  `scheduleno` int NOT NULL COMMENT '스케쥴no (일정 넘버)',
  `userno` int NOT NULL COMMENT '유저no',
  `date` datetime DEFAULT NULL COMMENT '날짜',
  `title` varchar(45) DEFAULT NULL COMMENT '제목',
  `content` varchar(45) DEFAULT NULL COMMENT '내용',
  PRIMARY KEY (`scheduleno`,`userno`),
  KEY `fk_schedule_userid_idx` (`userno`),
  CONSTRAINT `fk_schedule_userid` FOREIGN KEY (`userno`) REFERENCES `calendar` (`userno`)
);

DROP TABLE IF EXISTS `event`;
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
)
