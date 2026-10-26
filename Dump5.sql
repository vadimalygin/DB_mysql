-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: localhost    Database: test_db
-- ------------------------------------------------------
-- Server version	8.0.46

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id_department` int NOT NULL,
  `name` varchar(75) NOT NULL,
  `chief_of_dept` int NOT NULL,
  PRIMARY KEY (`id_department`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Математики и методики обучения математики',1004),(2,'Физики, техники и технологического образования',1005),(3,'Педагогики и психологии',1006),(4,'Информационных систем и цифрового образования',1007);
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exams`
--

DROP TABLE IF EXISTS `exams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exams` (
  `student` int NOT NULL,
  `teacher` int NOT NULL,
  `subject` int NOT NULL,
  `date` date NOT NULL,
  `mark` int NOT NULL,
  PRIMARY KEY (`student`,`teacher`,`subject`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Examination process';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exams`
--

LOCK TABLES `exams` WRITE;
/*!40000 ALTER TABLE `exams` DISABLE KEYS */;
INSERT INTO `exams` VALUES (101,1002,12,'2026-09-09',4),(101,1008,11,'2026-09-09',5),(102,1001,13,'2026-09-09',3),(102,1001,18,'2026-09-09',4),(102,1002,11,'2026-12-25',5),(103,1001,12,'2026-12-25',4);
/*!40000 ALTER TABLE `exams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `id_group` varchar(10) NOT NULL,
  `major` varchar(100) NOT NULL DEFAULT 'Major',
  PRIMARY KEY (`id_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Information about study groups';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES ('3.008.2.23','IT'),('3.008.2.24','Math'),('3.008.2.25','Teaching');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `id_student` int NOT NULL,
  `name` varchar(40) NOT NULL,
  `birthday` date NOT NULL,
  `group` varchar(10) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_student`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Information about students';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (100,'Иванов Иван Иваныч','2000-12-01','3.008.2.24','Томск'),(101,'Малыгин Вадим Алексеевич','2001-03-26','3.008.2.23','Новосибирск'),(102,'Шеремета Леонид','2005-09-24','3.008.2.23','Барабинск'),(103,'Каркавина Юлия','2001-10-05','3.008.2.25','Томск'),(104,'Николо Макиавелли','2000-08-26',NULL,'Омск');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subj_teachers`
--

DROP TABLE IF EXISTS `subj_teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subj_teachers` (
  `id_subject` int NOT NULL DEFAULT '10',
  `id_teacher` int NOT NULL DEFAULT '1000',
  PRIMARY KEY (`id_subject`,`id_teacher`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subj_teachers`
--

LOCK TABLES `subj_teachers` WRITE;
/*!40000 ALTER TABLE `subj_teachers` DISABLE KEYS */;
INSERT INTO `subj_teachers` VALUES (11,1001),(11,1008),(12,1002),(12,1008),(13,1001),(14,1006),(15,1002),(16,1003),(16,1006),(17,1002),(18,1003),(18,1005);
/*!40000 ALTER TABLE `subj_teachers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `id_subject` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `time(hours)` int NOT NULL DEFAULT '0',
  `department` int NOT NULL,
  PRIMARY KEY (`id_subject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Information about subjects';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (11,'Базы данных',40,4),(12,'Инф. безопасность',70,4),(13,'Мат. анализ',100,1),(14,'Педагогика',20,3),(15,'Физика',75,2),(16,'Психология',30,3),(17,'Инженерная графика',55,2),(18,'Алгебра',50,1);
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `id_teacher` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `group` varchar(10) DEFAULT NULL,
  `years_of_exp` double(4,2) unsigned NOT NULL DEFAULT '0.00',
  `city` varchar(45) DEFAULT NULL,
  `boss` int DEFAULT NULL,
  PRIMARY KEY (`id_teacher`),
  UNIQUE KEY `group_num_UNIQUE` (`group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1001,'Ступин Андрей Анатольевич','3.008.2.24',7.25,'Новосибирск',1006),(1002,'Петров Андрей Николаевич',NULL,5.30,'Новосибирск',1005),(1003,'Каменев Роман Владимирович',NULL,10.00,'Чита',NULL),(1004,'Яровая Евгения Анатольевна',NULL,28.00,'Томск',1003),(1005,'Верещагина Александра Сергеевна',NULL,30.00,'Томск',1003),(1006,'Андриенко Елена Васильевна',NULL,27.50,'Томск',1003),(1007,'Сартаков Игорь Витальевич',NULL,35.70,'Омск',1003),(1008,'Классов Александр Борисович','3.008.2.23',10.50,'Новосибирск',1007);
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-12 15:35:01
