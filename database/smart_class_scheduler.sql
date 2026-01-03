-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: smart_scheduler
-- ------------------------------------------------------
-- Server version	8.0.43

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

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
INSERT INTO `classrooms` VALUES (1,'Room No. 36','Classroom',80,'Projector, GreenBoard'),(2,'Room No. 37','Classroom',80,'Smart Board, GreenBoard'),(3,'Lab No. 5','Computer Lab',35,'30 PCs, Projector, GreenBoard');
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
INSERT INTO `notices` VALUES (1,'Id-E-Milad Holiday','Friday, 5th September, 2025 is a public Holiday on account of Id-E-Milad.','Holiday','Principal','2025-09-15 15:46:25'),(2,'BSc IT Semester V Examination','Final examinations for TYBSc IT Semester V will commence from 15th October 2025.','Exam','Examination Department ','2025-09-15 15:46:25'),(3,'Industry 4.0 Workshop','Workshop on Industry 4.0 and IoT applications for all BSc IT students on 20th September 2025.','Event','Ms. Rinjal Jain','2025-09-15 15:46:25'),(4,'New Academic Session','Academic session 2025-26 has commenced. Students collect updated timetables from IT department.','General','IT Department','2025-09-15 15:46:25');
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (11,'SBTTEC101','Imperative Programming',1,2,13,'2025-09-15 18:23:36','2025-09-15 18:24:30'),(12,'SBTTEC102','Digital Electronics',1,2,12,'2025-09-15 18:23:36','2025-09-15 18:24:39'),(13,'SBTTEC103','Operating Systems',1,2,15,'2025-09-15 18:23:36','2025-09-15 18:24:47'),(14,'SBTTEC104','Discrete Mathematics',1,2,16,'2025-09-15 18:23:36','2025-09-15 18:25:02'),(15,'SBTTEC105','Communication Skills',1,2,12,'2025-09-15 18:23:36','2025-09-15 18:25:11'),(16,'SBTTECP101','Imperative Programming Practical',1,2,13,'2025-09-15 18:23:36','2025-09-15 18:25:18'),(17,'SBTTECP102','Digital Electronics Practical',1,2,12,'2025-09-15 18:23:36','2025-09-15 18:25:28'),(18,'SBTTECP103','Operating Systems Practical',1,2,15,'2025-09-15 18:23:36','2025-09-15 18:25:38'),(19,'SBTTECP104','Discrete Mathematics Practical',1,2,16,'2025-09-15 18:23:36','2025-09-15 18:25:48'),(20,'SBTTECP105','Communication Skills Practical',1,2,12,'2025-09-15 18:23:36','2025-09-15 18:25:56'),(21,'SBTTEC201','Object Oriented Programming',2,2,13,'2025-09-15 18:23:36','2025-09-15 18:26:05'),(22,'SBTTEC202','Microprocessor and Microcontroller',2,2,16,'2025-09-15 18:23:36','2025-09-15 18:26:18'),(23,'SBTTEC203','Web Programming',2,2,13,'2025-09-15 18:23:36','2025-09-15 18:26:28'),(24,'SBTTEC204','Numerical and Statistical Methods',2,2,15,'2025-09-15 18:23:36','2025-09-15 18:26:37'),(25,'SBTTEC205','Green Computing',2,2,12,'2025-09-15 18:23:36','2025-09-15 18:26:44'),(26,'SBTTECP201','Object Oriented Programming Practical',2,2,13,'2025-09-15 18:23:36','2025-09-15 18:26:57'),(27,'SBTTECP202','Microprocessor and Microcontroller Practical',2,2,16,'2025-09-15 18:23:36','2025-09-15 18:27:05'),(28,'SBTTECP203','Web Programming Practical',2,2,13,'2025-09-15 18:23:36','2025-09-15 18:27:14'),(29,'SBTTECP204','Numerical and Statistical Methods Practical',2,2,15,'2025-09-15 18:23:36','2025-09-15 18:27:49'),(30,'SBTTECP205','Green Computing Practical',2,2,12,'2025-09-15 18:23:36','2025-09-15 18:27:58'),(31,'SBTTEC301','Python Programming',3,2,13,'2025-09-15 18:23:36','2025-09-15 18:28:07'),(32,'SBTTEC302','Data Structures',3,2,15,'2025-09-15 18:23:36','2025-09-15 18:28:15'),(33,'SBTTEC303','Computer Networks',3,2,14,'2025-09-15 18:23:36','2025-09-15 18:28:26'),(34,'SBTTEC304','Database Management Systems',3,2,16,'2025-09-15 18:23:36','2025-09-15 18:28:38'),(36,'SBTTECP301','Python Programming Practical',3,2,13,'2025-09-15 18:23:36','2025-09-15 18:29:40'),(37,'SBTTECP302','Data Structures Practical',3,2,13,'2025-09-15 18:23:36','2025-09-15 18:29:49'),(38,'SBTTECP303','Computer Networks Practical',3,2,14,'2025-09-15 18:23:36','2025-09-15 18:30:02'),(39,'SBTTECP304','Database Management Systems Practical',3,2,16,'2025-09-15 18:23:36','2025-09-15 18:30:29'),(41,'SBTTEC401','Core Java',4,2,13,'2025-09-15 18:23:36','2025-09-15 18:29:17'),(42,'SBTTEC402','Computer Forensics',4,2,15,'2025-09-15 18:23:36','2025-09-15 18:29:29'),(43,'SBTTEC403','Artificial Intelligence',4,2,12,'2025-09-15 18:23:36','2025-09-15 18:30:14'),(46,'SBTTECP401','Core Java Practical',4,2,13,'2025-09-15 18:23:36','2025-09-15 18:31:45'),(47,'SBTTECP402','Computer Forensics Practical',4,2,15,'2025-09-15 18:23:36','2025-09-15 18:31:55'),(48,'SBTTECP403','Artificial Intelligence Practical',4,2,12,'2025-09-15 18:23:36','2025-09-15 18:32:04'),(49,'SBTTECP404','Advanced Mobile Programming Practical',4,2,14,'2025-09-15 18:23:36','2025-09-15 18:32:16'),(51,'SBTTEC501','Software Engineering Practicals',5,2,14,'2025-09-15 18:23:36','2025-09-15 18:33:58'),(52,'SBTTEC502','Internet of Things',5,2,14,'2025-09-15 18:23:36','2025-09-15 18:34:11'),(53,'SBTTEC503','Advanced Web Programming using .NET',5,2,15,'2025-09-15 18:23:36','2025-09-15 18:34:29'),(55,'SBTTEC505','Enterprise Java',5,2,13,'2025-09-15 18:23:36','2025-09-15 18:35:04'),(56,'SBTTECP501','Software Engineering',5,2,14,'2025-09-15 18:23:36','2025-09-15 18:35:15'),(57,'SBTTECP502','Internet of Things Practical',5,2,14,'2025-09-15 18:23:36','2025-09-15 18:35:33'),(58,'SBTTECP503','Advanced Web Programming using .NET Practical',5,2,15,'2025-09-15 18:23:36','2025-09-15 18:34:46'),(60,'SBTTECP505','Enterprise Java Practical',5,2,13,'2025-09-15 18:23:36','2025-09-15 18:35:42'),(61,'SBTTEC601','Software Testing',6,2,14,'2025-09-15 18:23:36','2025-09-15 18:35:58'),(62,'SBTTEC602','Cloud Computing',6,2,14,'2025-09-15 18:23:36','2025-09-15 18:36:09'),(63,'SBTTEC603','Full Stack Web Development',6,2,15,'2025-09-15 18:23:36','2025-09-15 18:36:33'),(64,'SBTTEC604','Project / Elective',6,2,12,'2025-09-15 18:23:36','2025-09-15 18:37:05'),(65,'SBTTECP601','Software Testing Practical',6,2,14,'2025-09-15 18:23:36','2025-09-15 18:37:18'),(66,'SBTTECP602','Cloud Computing Practical',6,2,14,'2025-09-15 18:23:36','2025-09-15 18:27:40'),(67,'SBTTECP603','Full Stack Web Development Practical',6,2,15,'2025-09-15 18:23:36','2025-09-15 18:27:31');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (12,'Mrs. Rinjal Jain','BSc.(IT) Co-ordinator','rinjal.jain@sophiacollegemumbai.com','M.Sc.(IT)'),(13,'Mr. Gauri Shankar Singh','Professor','gaurishankarsingh@sophiacollegemumbai.com','MCA, MPhil'),(14,'Ms. Saqueba Mistry','Professor','saqueba.mistry@sophiacollegemumbai.com','Diploma (IT), B.E (Computer), M.Sc.(IT)'),(15,'Ms. Sidranaaz Qazi','Professor','sidranaazqazi@sophiacollegemumbai.com','M.Sc.(IT)'),(16,'Ms. Ambreen Shaikh','Professor','ambreenshaikh@sophiacollegemumbai.com','B.E (Computers), M.E(Computers)');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
INSERT INTO `timetable` VALUES (36,'Monday','08:00:00','09:00:00',55,13,1,'TY','Sem 5','2025-09-17 04:51:07'),(37,'Tuesday','08:00:00','09:00:00',62,14,1,'TY','Sem 5','2025-09-17 04:51:07'),(38,'Wednesday','08:00:00','09:00:00',53,15,1,'TY','Sem 5','2025-09-17 04:51:07'),(39,'Thursday','08:00:00','09:00:00',66,14,1,'TY','Sem 5','2025-09-17 04:51:07'),(40,'Friday','08:00:00','09:00:00',60,13,1,'TY','Sem 5','2025-09-17 04:51:07'),(41,'Saturday','08:00:00','09:00:00',65,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(42,'Monday','09:00:00','10:00:00',58,15,1,'TY','Sem 5','2025-09-17 04:51:08'),(43,'Tuesday','09:00:00','10:00:00',67,15,1,'TY','Sem 5','2025-09-17 04:51:08'),(44,'Wednesday','09:00:00','10:00:00',51,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(45,'Thursday','09:00:00','10:00:00',63,15,1,'TY','Sem 5','2025-09-17 04:51:08'),(46,'Friday','09:00:00','10:00:00',52,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(47,'Saturday','09:00:00','10:00:00',57,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(48,'Monday','10:00:00','11:00:00',61,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(49,'Tuesday','10:00:00','11:00:00',64,12,1,'TY','Sem 5','2025-09-17 04:51:08'),(50,'Wednesday','10:00:00','11:00:00',56,14,1,'TY','Sem 5','2025-09-17 04:51:08'),(66,'Monday','08:00:00','09:00:00',29,15,1,'FY','Sem 1','2025-09-17 05:16:51'),(67,'Tuesday','08:00:00','09:00:00',20,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(68,'Wednesday','08:00:00','09:00:00',24,15,1,'FY','Sem 1','2025-09-17 05:16:51'),(69,'Thursday','08:00:00','09:00:00',30,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(70,'Friday','08:00:00','09:00:00',15,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(71,'Saturday','08:00:00','09:00:00',23,13,1,'FY','Sem 1','2025-09-17 05:16:51'),(72,'Monday','09:00:00','10:00:00',28,13,1,'FY','Sem 1','2025-09-17 05:16:51'),(73,'Tuesday','09:00:00','10:00:00',18,15,1,'FY','Sem 1','2025-09-17 05:16:51'),(74,'Wednesday','09:00:00','10:00:00',25,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(75,'Thursday','09:00:00','10:00:00',13,15,1,'FY','Sem 1','2025-09-17 05:16:51'),(76,'Friday','09:00:00','10:00:00',27,16,1,'FY','Sem 1','2025-09-17 05:16:51'),(77,'Saturday','09:00:00','10:00:00',22,16,1,'FY','Sem 1','2025-09-17 05:16:51'),(78,'Monday','10:00:00','11:00:00',21,13,1,'FY','Sem 1','2025-09-17 05:16:51'),(79,'Tuesday','10:00:00','11:00:00',12,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(80,'Wednesday','10:00:00','11:00:00',17,12,1,'FY','Sem 1','2025-09-17 05:16:51'),(81,'Thursday','10:00:00','11:00:00',26,13,1,'FY','Sem 1','2025-09-17 05:16:51'),(82,'Friday','10:00:00','11:00:00',19,16,1,'FY','Sem 1','2025-09-17 05:16:52'),(83,'Saturday','10:00:00','11:00:00',16,13,1,'FY','Sem 1','2025-09-17 05:16:52'),(84,'Monday','11:30:00','12:30:00',11,13,1,'FY','Sem 1','2025-09-17 05:16:52'),(85,'Tuesday','11:30:00','12:30:00',14,16,1,'FY','Sem 1','2025-09-17 05:16:52'),(86,'Monday','08:00:00','09:00:00',38,14,1,'SY','Sem 3','2025-09-17 05:18:28'),(87,'Tuesday','08:00:00','09:00:00',32,15,1,'SY','Sem 3','2025-09-17 05:18:28'),(88,'Wednesday','08:00:00','09:00:00',46,13,1,'SY','Sem 3','2025-09-17 05:18:28'),(89,'Thursday','08:00:00','09:00:00',41,13,1,'SY','Sem 3','2025-09-17 05:18:29'),(90,'Friday','08:00:00','09:00:00',49,14,1,'SY','Sem 3','2025-09-17 05:18:29'),(91,'Saturday','08:00:00','09:00:00',37,13,1,'SY','Sem 3','2025-09-17 05:18:29'),(92,'Monday','09:00:00','10:00:00',31,13,1,'SY','Sem 3','2025-09-17 05:18:29'),(93,'Tuesday','09:00:00','10:00:00',39,16,1,'SY','Sem 3','2025-09-17 05:18:29'),(94,'Wednesday','09:00:00','10:00:00',47,15,1,'SY','Sem 3','2025-09-17 05:18:29'),(95,'Thursday','09:00:00','10:00:00',43,12,1,'SY','Sem 3','2025-09-17 05:18:29'),(96,'Friday','09:00:00','10:00:00',33,14,1,'SY','Sem 3','2025-09-17 05:18:29'),(97,'Saturday','09:00:00','10:00:00',34,16,1,'SY','Sem 3','2025-09-17 05:18:29'),(98,'Monday','10:00:00','11:00:00',42,15,1,'SY','Sem 3','2025-09-17 05:18:29'),(99,'Tuesday','10:00:00','11:00:00',48,12,1,'SY','Sem 3','2025-09-17 05:18:29'),(100,'Wednesday','10:00:00','11:00:00',36,13,1,'SY','Sem 3','2025-09-17 05:18:29'),(101,'Monday','08:00:00','09:00:00',13,15,1,'FY','Sem 2','2026-01-03 17:01:18'),(102,'Tuesday','08:00:00','09:00:00',29,15,1,'FY','Sem 2','2026-01-03 17:01:18'),(103,'Wednesday','08:00:00','09:00:00',27,16,1,'FY','Sem 2','2026-01-03 17:01:18'),(104,'Thursday','08:00:00','09:00:00',20,12,1,'FY','Sem 2','2026-01-03 17:01:18'),(105,'Friday','08:00:00','09:00:00',22,16,1,'FY','Sem 2','2026-01-03 17:01:18'),(106,'Saturday','08:00:00','09:00:00',16,13,1,'FY','Sem 2','2026-01-03 17:01:18'),(107,'Monday','09:00:00','10:00:00',26,13,1,'FY','Sem 2','2026-01-03 17:01:19'),(108,'Tuesday','09:00:00','10:00:00',23,13,1,'FY','Sem 2','2026-01-03 17:01:19'),(109,'Wednesday','09:00:00','10:00:00',17,12,1,'FY','Sem 2','2026-01-03 17:01:19'),(110,'Thursday','09:00:00','10:00:00',24,15,1,'FY','Sem 2','2026-01-03 17:01:19'),(111,'Friday','09:00:00','10:00:00',19,16,1,'FY','Sem 2','2026-01-03 17:01:19'),(112,'Saturday','09:00:00','10:00:00',28,13,1,'FY','Sem 2','2026-01-03 17:01:19'),(113,'Monday','10:00:00','11:00:00',30,12,1,'FY','Sem 2','2026-01-03 17:01:19'),(114,'Tuesday','10:00:00','11:00:00',14,16,1,'FY','Sem 2','2026-01-03 17:01:19'),(115,'Wednesday','10:00:00','11:00:00',18,15,1,'FY','Sem 2','2026-01-03 17:01:19'),(116,'Thursday','10:00:00','11:00:00',15,12,1,'FY','Sem 2','2026-01-03 17:01:19'),(117,'Friday','10:00:00','11:00:00',11,13,1,'FY','Sem 2','2026-01-03 17:01:19'),(118,'Saturday','10:00:00','11:00:00',21,13,1,'FY','Sem 2','2026-01-03 17:01:19'),(119,'Monday','11:30:00','12:30:00',12,12,1,'FY','Sem 2','2026-01-03 17:01:19'),(120,'Tuesday','11:30:00','12:30:00',25,12,1,'FY','Sem 2','2026-01-03 17:01:19'),(121,'Monday','08:00:00','09:00:00',38,14,1,'SY','Sem 4','2026-01-03 17:01:29'),(122,'Tuesday','08:00:00','09:00:00',46,13,1,'SY','Sem 4','2026-01-03 17:01:29'),(123,'Wednesday','08:00:00','09:00:00',48,12,1,'SY','Sem 4','2026-01-03 17:01:29'),(124,'Thursday','08:00:00','09:00:00',41,13,1,'SY','Sem 4','2026-01-03 17:01:29'),(125,'Friday','08:00:00','09:00:00',43,12,1,'SY','Sem 4','2026-01-03 17:01:29'),(126,'Saturday','08:00:00','09:00:00',31,13,1,'SY','Sem 4','2026-01-03 17:01:29'),(127,'Monday','09:00:00','10:00:00',39,16,1,'SY','Sem 4','2026-01-03 17:01:29'),(128,'Tuesday','09:00:00','10:00:00',36,13,1,'SY','Sem 4','2026-01-03 17:01:29'),(129,'Wednesday','09:00:00','10:00:00',33,14,1,'SY','Sem 4','2026-01-03 17:01:29'),(130,'Thursday','09:00:00','10:00:00',32,15,1,'SY','Sem 4','2026-01-03 17:01:29'),(131,'Friday','09:00:00','10:00:00',42,15,1,'SY','Sem 4','2026-01-03 17:01:29'),(132,'Saturday','09:00:00','10:00:00',37,13,1,'SY','Sem 4','2026-01-03 17:01:29'),(133,'Monday','10:00:00','11:00:00',49,14,1,'SY','Sem 4','2026-01-03 17:01:29'),(134,'Tuesday','10:00:00','11:00:00',34,16,1,'SY','Sem 4','2026-01-03 17:01:29'),(135,'Wednesday','10:00:00','11:00:00',47,15,1,'SY','Sem 4','2026-01-03 17:01:29'),(136,'Monday','08:00:00','09:00:00',67,15,1,'TY','Sem 6','2026-01-03 17:01:37'),(137,'Tuesday','08:00:00','09:00:00',61,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(138,'Wednesday','08:00:00','09:00:00',64,12,1,'TY','Sem 6','2026-01-03 17:01:37'),(139,'Thursday','08:00:00','09:00:00',63,15,1,'TY','Sem 6','2026-01-03 17:01:37'),(140,'Friday','08:00:00','09:00:00',66,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(141,'Saturday','08:00:00','09:00:00',57,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(142,'Monday','09:00:00','10:00:00',52,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(143,'Tuesday','09:00:00','10:00:00',65,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(144,'Wednesday','09:00:00','10:00:00',56,14,1,'TY','Sem 6','2026-01-03 17:01:37'),(145,'Thursday','09:00:00','10:00:00',60,13,1,'TY','Sem 6','2026-01-03 17:01:37'),(146,'Friday','09:00:00','10:00:00',55,13,1,'TY','Sem 6','2026-01-03 17:01:37'),(147,'Saturday','09:00:00','10:00:00',58,15,1,'TY','Sem 6','2026-01-03 17:01:38'),(148,'Monday','10:00:00','11:00:00',51,14,1,'TY','Sem 6','2026-01-03 17:01:38'),(149,'Tuesday','10:00:00','11:00:00',62,14,1,'TY','Sem 6','2026-01-03 17:01:38'),(150,'Wednesday','10:00:00','11:00:00',53,15,1,'TY','Sem 6','2026-01-03 17:01:38');
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123','admin'),(2,'student1','stud123','student');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-03 23:30:39
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: timetabledb
-- ------------------------------------------------------
-- Server version	8.0.43

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

--
-- Dumping data for table `classrooms`
--

LOCK TABLES `classrooms` WRITE;
/*!40000 ALTER TABLE `classrooms` DISABLE KEYS */;
/*!40000 ALTER TABLE `classrooms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notices`
--

LOCK TABLES `notices` WRITE;
/*!40000 ALTER TABLE `notices` DISABLE KEYS */;
/*!40000 ALTER TABLE `notices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `timeslots`
--

LOCK TABLES `timeslots` WRITE;
/*!40000 ALTER TABLE `timeslots` DISABLE KEYS */;
/*!40000 ALTER TABLE `timeslots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `timetable_entries`
--

LOCK TABLES `timetable_entries` WRITE;
/*!40000 ALTER TABLE `timetable_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin123','admin',NULL,'System Administrator',1,'2025-09-10 14:22:49',NULL),(2,'student1','stud123','student','FYBSc IT','Priya Sharma',1,'2025-09-10 14:22:49',NULL),(3,'student2','stud123','student','SYBSc IT','Anjali Patel',1,'2025-09-10 14:22:49',NULL),(4,'student3','stud123','student','TYBSc IT','Kavya Singh',1,'2025-09-10 14:22:49',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-03 23:30:39
