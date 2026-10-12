-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: epidemic_management
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `diseases`
--

DROP TABLE IF EXISTS `diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diseases` (
  `Disease_ID` int NOT NULL AUTO_INCREMENT,
  `Disease_Name` varchar(100) NOT NULL,
  `Symptoms` text NOT NULL,
  `Mortality_Rate` decimal(5,2) NOT NULL,
  PRIMARY KEY (`Disease_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diseases`
--

LOCK TABLES `diseases` WRITE;
/*!40000 ALTER TABLE `diseases` DISABLE KEYS */;
INSERT INTO `diseases` VALUES (1,'khujli','Itching',100.00),(2,'Histrionic Personality Disorder','excessive emotionality and attention-seeking behaviors',3.80);
/*!40000 ALTER TABLE `diseases` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outbreaks`
--

DROP TABLE IF EXISTS `outbreaks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outbreaks` (
  `Outbreak_ID` int NOT NULL AUTO_INCREMENT,
  `Disease_ID` int NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Start_Date` date NOT NULL,
  `End_Date` date DEFAULT NULL,
  `Number_of_Cases` int NOT NULL DEFAULT '0',
  `Fatality_Rate` decimal(5,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`Outbreak_ID`),
  KEY `Disease_ID` (`Disease_ID`),
  CONSTRAINT `outbreaks_ibfk_1` FOREIGN KEY (`Disease_ID`) REFERENCES `diseases` (`Disease_ID`) ON DELETE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outbreaks`
--

LOCK TABLES `outbreaks` WRITE;
/*!40000 ALTER TABLE `outbreaks` DISABLE KEYS */;
/*!40000 ALTER TABLE `outbreaks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `Patient_ID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  `Gender` enum('Male','Female','Other') NOT NULL,
  `Address` text NOT NULL,
  `Disease_ID` int NOT NULL,
  `Status` enum('Infected','Recovered','Deceased') NOT NULL,
  PRIMARY KEY (`Patient_ID`),
  KEY `Disease_ID` (`Disease_ID`),
  CONSTRAINT `patients_ibfk_1` FOREIGN KEY (`Disease_ID`) REFERENCES `diseases` (`Disease_ID`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (2,'Jai',42,'Male','Waaji City',2,'Infected'),(3,'Vardharaja Mannar',32,'Male','Khansaar',2,'Infected'),(4,'Ballala Deva',53,'Male','Maheshmathi Samrajyam',2,'Infected');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource_allocation`
--

DROP TABLE IF EXISTS `resource_allocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource_allocation` (
  `Allocation_ID` int NOT NULL AUTO_INCREMENT,
  `Resource_ID` int NOT NULL,
  `Outbreak_ID` int NOT NULL,
  `Quantity_Allocated` int NOT NULL,
  PRIMARY KEY (`Allocation_ID`),
  KEY `Resource_ID` (`Resource_ID`),
  KEY `Outbreak_ID` (`Outbreak_ID`),
  CONSTRAINT `resource_allocation_ibfk_1` FOREIGN KEY (`Resource_ID`) REFERENCES `resources` (`Resource_ID`) ON DELETE CASCADE,
  CONSTRAINT `resource_allocation_ibfk_2` FOREIGN KEY (`Outbreak_ID`) REFERENCES `outbreaks` (`Outbreak_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource_allocation`
--

LOCK TABLES `resource_allocation` WRITE;
/*!40000 ALTER TABLE `resource_allocation` DISABLE KEYS */;
/*!40000 ALTER TABLE `resource_allocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resources` (
  `Resource_ID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(100) NOT NULL,
  `Location` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `Allocated` int NOT NULL,
  PRIMARY KEY (`Resource_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `User_ID` int NOT NULL AUTO_INCREMENT,
  `Role` enum('Admin','Healthcare Worker','Analyst') NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(255) NOT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin','admin','admin@example.com','$2b$12$U8rqBX6vPJDk68aQTCOb..ZG90cEctTtxmZgD0G3n3u.cw1Dnz0QK'),(2,'Healthcare Worker','worker','worker@example.com','$2b$12$bMFFNCm/V6xlsUJyAKvr1.UrY461ZBdR/0XxixarNdZh9TAt33Yti'),(3,'Analyst','analyst','analyst@example.com','$2b$12$hQXOxu7BJRMjAnv6Nfrfru6O7O56WuUXT.S441GgLXCCi89i6qFmi');
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

-- Dump completed on 2026-10-12 22:35:19
