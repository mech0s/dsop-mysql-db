CREATE DATABASE  IF NOT EXISTS `devopstoolsraw` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `devopstoolsraw`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: devopstoolsraw
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `phase` varchar(20) NOT NULL,
  `activity` varchar(60) NOT NULL,
  `description` varchar(440) DEFAULT NULL,
  `tool_dependencies` varchar(440) DEFAULT NULL,
  `inputs` varchar(440) DEFAULT NULL,
  `outputs` varchar(440) DEFAULT NULL,
  `srcorder` int DEFAULT '0',
  `data_cleansed` tinyint DEFAULT '0',
  PRIMARY KEY (`activity`,`phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `all_artifacts`
--

DROP TABLE IF EXISTS `all_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_artifacts` (
  `name` varchar(250) NOT NULL,
  `srctype` varchar(12) DEFAULT NULL,
  `srcsense` varchar(12) DEFAULT NULL,
  `srcphase` varchar(45) DEFAULT NULL,
  `srcname` varchar(100) DEFAULT NULL,
  `srcord` int DEFAULT NULL,
  `data_cleansed` tinyint DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `all_tools`
--

DROP TABLE IF EXISTS `all_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `all_tools` (
  `name` varchar(250) NOT NULL,
  `srctype` varchar(12) DEFAULT NULL,
  `srcphase` varchar(45) DEFAULT NULL,
  `srcname` varchar(100) DEFAULT NULL,
  `srcord` int DEFAULT NULL,
  `data_cleansed` tinyint NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_info`
--

DROP TABLE IF EXISTS `source_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_info` (
  `xlsx_version` varchar(20) NOT NULL,
  `excel2db_version` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools` (
  `phase` varchar(20) NOT NULL,
  `tool` varchar(60) NOT NULL,
  `features` varchar(640) DEFAULT NULL,
  `benefits` varchar(440) DEFAULT NULL,
  `baseline` varchar(60) DEFAULT NULL,
  `inputs` varchar(440) DEFAULT NULL,
  `outputs` varchar(440) DEFAULT NULL,
  `srcorder` int DEFAULT '0',
  `data_cleansed` tinyint DEFAULT '0',
  PRIMARY KEY (`phase`,`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 13:40:07
CREATE DATABASE  IF NOT EXISTS `devopstools` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `devopstools`;
-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: devopstools
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `activity` varchar(60) NOT NULL,
  `phase` varchar(20) NOT NULL,
  `description` varchar(440) DEFAULT NULL,
  `data_cleansed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity`),
  KEY `act_phase_fk_idx` (`phase`),
  CONSTRAINT `act_phase_fk` FOREIGN KEY (`phase`) REFERENCES `phases` (`phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_artifacts`
--

DROP TABLE IF EXISTS `activity_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_artifacts` (
  `activity` varchar(100) NOT NULL,
  `artifact` varchar(250) NOT NULL,
  `input` tinyint DEFAULT NULL,
  `output` tinyint DEFAULT NULL,
  `data_cleansed` tinyint DEFAULT NULL,
  PRIMARY KEY (`artifact`,`activity`),
  KEY `aa_activity_fk_idx` (`activity`),
  CONSTRAINT `aa_activity_fk` FOREIGN KEY (`activity`) REFERENCES `activities` (`activity`),
  CONSTRAINT `aa_artifacts_fk` FOREIGN KEY (`artifact`) REFERENCES `artifacts` (`artifact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `activity_tools`
--

DROP TABLE IF EXISTS `activity_tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_tools` (
  `activity` varchar(60) NOT NULL,
  `tool` varchar(250) NOT NULL,
  `data_cleansed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`activity`,`tool`),
  KEY `at_a_fk_idx` (`activity`),
  KEY `at_t_fk_idx` (`tool`),
  CONSTRAINT `at_a_fk` FOREIGN KEY (`activity`) REFERENCES `activities` (`activity`),
  CONSTRAINT `at_t_fk` FOREIGN KEY (`tool`) REFERENCES `tools` (`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `artifacts`
--

DROP TABLE IF EXISTS `artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artifacts` (
  `artifact` varchar(250) NOT NULL,
  `data_cleansed` tinyint DEFAULT '0',
  PRIMARY KEY (`artifact`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `phases`
--

DROP TABLE IF EXISTS `phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phases` (
  `phase` varchar(20) NOT NULL,
  PRIMARY KEY (`phase`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `source_info`
--

DROP TABLE IF EXISTS `source_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `source_info` (
  `xlsx_version` varchar(20) NOT NULL,
  `excel2db_version` varchar(20) NOT NULL,
  `normalisation_version` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tool_artifacts`
--

DROP TABLE IF EXISTS `tool_artifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_artifacts` (
  `tool` varchar(100) NOT NULL,
  `artifact` varchar(250) NOT NULL,
  `input` tinyint DEFAULT NULL,
  `output` tinyint DEFAULT NULL,
  `data_cleansed` tinyint DEFAULT NULL,
  PRIMARY KEY (`artifact`,`tool`),
  KEY `ta_tool_fk_idx` (`tool`),
  CONSTRAINT `ta_artifact_fk` FOREIGN KEY (`artifact`) REFERENCES `artifacts` (`artifact`),
  CONSTRAINT `ta_tool_fk` FOREIGN KEY (`tool`) REFERENCES `tools` (`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tool_phases`
--

DROP TABLE IF EXISTS `tool_phases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tool_phases` (
  `phase` varchar(45) NOT NULL,
  `tool` varchar(250) NOT NULL,
  `data_cleansed` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`phase`,`tool`),
  KEY `tp_tool_fk_idx` (`tool`),
  CONSTRAINT `tp_phase_fk` FOREIGN KEY (`phase`) REFERENCES `phases` (`phase`),
  CONSTRAINT `tp_tool_fk` FOREIGN KEY (`tool`) REFERENCES `tools` (`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `tools`
--

DROP TABLE IF EXISTS `tools`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tools` (
  `tool` varchar(250) NOT NULL,
  `features` varchar(640) DEFAULT NULL,
  `benefits` varchar(440) DEFAULT NULL,
  `data_cleansed` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`tool`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-03 13:40:07
