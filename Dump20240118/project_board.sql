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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `postno` int NOT NULL AUTO_INCREMENT COMMENT '게시판_no',
  `userno` int NOT NULL COMMENT '작성자_no',
  `title` varchar(45) NOT NULL COMMENT '제목',
  `content` varchar(3000) DEFAULT NULL COMMENT '내용',
  `view_count` int DEFAULT '0' COMMENT '조회수',
  `coment_count` int DEFAULT '0' COMMENT '댓글 수',
  `create_date` datetime DEFAULT NULL COMMENT '작성일',
  `modify_date` datetime DEFAULT NULL COMMENT '수정 날짜',
  `comment_count` int DEFAULT '0',
  `image_path` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`postno`),
  UNIQUE KEY `boardno_UNIQUE` (`postno`),
  KEY `userno_idx` (`userno`),
  CONSTRAINT `fk_board_userno` FOREIGN KEY (`userno`) REFERENCES `user` (`userno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=162 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시판';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (129,49,'게시판의 첫번째 게시글!','안녕하세요. \r\n잘부탁드려요.\r\n',12,0,NULL,NULL,2,NULL),(130,50,'다음주에 서울 놀러가는데 관광지 추천좀..','서울은 처음이라 설레어요\r\n코스 추천부탁드려요',7,0,NULL,NULL,2,NULL),(131,51,'신세계 클라우드팀 화이팅!','모두다 화이팅입니다~',3,0,NULL,NULL,1,NULL),(132,53,'웹서버 배우는데 너무 어렵네요','배포까지 성공했으면 좋았을걸',7,0,NULL,NULL,1,NULL),(133,49,'안녕하세요','내용입니다.',0,0,NULL,NULL,0,NULL),(134,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(135,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(136,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(137,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(138,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(139,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(140,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(141,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(142,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(143,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(144,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(145,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(146,50,'테스트 샘플','내용입니다.',0,0,NULL,NULL,0,NULL),(147,53,'테스트해보기','반가워요',2,0,NULL,NULL,0,NULL),(148,49,'테스트 샘플','내용입니다.',4,0,NULL,NULL,0,NULL),(149,49,'테스트 샘플','내용입니다.',4,0,NULL,NULL,0,NULL),(150,51,'테스트 샘플','내용입니다.',1,0,NULL,NULL,0,NULL),(151,51,'테스트 샘플','내용입니다.',1,0,NULL,NULL,0,NULL),(152,52,'테스트 샘플','내용입니다.',1,0,NULL,NULL,0,NULL),(153,52,'테스트 샘플','내용입니다.',4,0,NULL,NULL,1,NULL),(154,53,'테스트 샘플','내용입니다.',4,0,NULL,NULL,2,NULL),(155,53,'테스트 샘플','내용입니다.',3,0,NULL,NULL,0,NULL),(156,53,'테스트!','ㅎㅇㄹ',8,0,NULL,NULL,1,NULL),(157,6,'난관을 겪은 부분과 해결책','1. 프론트엔드 프레임워크가 아닌 html, css, js 기반으로 화면을 제작\r\n→ jinja template 을 통해서 프론트엔드와 백엔드를 효과적으로 결합 가능했음. 파이썬 코드를 삽입할 수 있어서 동적인 내용을 렌더링하거나 조건부로 템플릿을 제어하는 데 유용하게 사용함.\r\n\r\n2. DB 구성 방식\r\n→ 팀원 중 한 PC를 db서버로 두고 각자 그 서버에 연결해서 사용하고 싶었으나 강의장 네트워크 구성상 불가능 할 것으로 보여서 \r\nAWS RDS 를 사용함으로서 해결함.\r\n\r\n3. DB에는 값을 넣으면 시간대가 맞으나 실제로 화면단에서 뿌릴때는 시간대가 15시간 차이나서 안 맞는 문제\r\n→ 타임존 문제일거라 생각은 했으나  검색을 통해서 RDS를 재부팅해야 변경사항이 적용된다는 것을 알게됨.\r\n클라우드 서비스를 이용하는건 굉장히 편하지만, 정확히 구동 방식이나 내용을 모르고 사용만하면 이런 현상이 발생한다는 것을 깨달습니다.',15,0,NULL,NULL,2,NULL),(158,55,'난관과 해결책','채팅방 부분 \r\n=>웹소켓부분 내용숙지가 미숙해서 DB를 읽고 쓰는방식으로 진행하였음   하지만 실시간 통신엔 결국 웹소켓이 필요해서 향후 개선해야함\r\n\r\n일정공유부분\r\n=>일정공유받은사람이 추가할때 title만 추가되는데 이후엔 일정공유에대한 날짜 , 내용등등 기타 부분추가 및 삭제까지 지원하는것도 하고싶음\r\n\r\n전반적으로 웹에대한 이해가 많이 낮아서 한계를 많이 느꼈는데 , 최대한 DB를 이용해서 그나마 이정도로 구현 할 수 있었습니다.',9,0,NULL,NULL,1,NULL),(159,54,'미니프로젝트 느낀점 및 후기',' 살면서 처음 진행한 팀프로젝트였습니다. \r\n 제가 제작한 기능들은 게시판을 중점으로 제작했고, 게시판에서 글과 댓글의 조회, 삭제, 수정, 작성이 주된 기능들이었습니다. \r\n\r\n\r\n 주어진 시간이 짧아 UI부분이 많이 부족하여 아쉬웠습니다. 하지만 UI보단 기능적인 부분에 초점을 두고 프로젝트를 진행 하였으며, 적은 인원으로 기능적인 부분을 많이 구현한 것 같아 뿌듯했습니다. \r\n\r\n 처음 사용해보는 git, 처음 해보는 웹프로젝트였기에 발생한 문제들이 많았습니다. AWS에 DB서버를 올리면서 과금이되지는 않을까 조마조마하며 서버연동을 했고, 인증과정에서 session문제로 서버 새로고침마다 인증키가바뀌어 로그아웃이 되는 문제가 발생했습니다. 또, BluePrint 과정에서 각자 만든 py 문서가 연동이 되지않아 당황을 했었습니다. 두 문제다 해결방법이 어렵지 않은 부분이여서 팀원들과 함께 해결했습니다. \r\n \r\n\r\n\r\n생각보다 제작한 페이지의 기능들이 나쁘지않아 매우 만족했습니다. 약 4일간 같이 고생한 팀원들에게 감사를 표합니다. ',35,0,NULL,NULL,3,NULL),(161,54,'미니 후기(남졍)','짧은기간이었지만 완전 재밌었다\r\n팀원들과 다같이 몰입형모드로 진입한 것 같았다 ㅋㄷㅋㄷㅋ\r\n다음 프로젝트도 너무너무 기대된다!!!!!!!!!!! 야호!!!!!!!!!!!',10,0,NULL,NULL,0,NULL);
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
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
