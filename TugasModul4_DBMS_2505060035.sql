-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fttid
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `mahsiwa`
--

DROP TABLE IF EXISTS `mahsiwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mahsiwa` (
  `NPM` int(5) NOT NULL,
  `Nama` varchar(20) NOT NULL,
  `Prodi` varchar(10) NOT NULL,
  PRIMARY KEY (`NPM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mahsiwa`
--

LOCK TABLES `mahsiwa` WRITE;
/*!40000 ALTER TABLE `mahsiwa` DISABLE KEYS */;
INSERT INTO `mahsiwa` VALUES (900,'Yatno','Elektro'),(901,'Yanti','Elektro'),(902,'Budi','Elektro'),(1234,'Martanto','Mesin'),(2001,'Maul','Tif'),(2002,'Lana','Tif'),(2345,'Yant','Mesin');
/*!40000 ALTER TABLE `mahsiwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matkul`
--

DROP TABLE IF EXISTS `matkul`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `matkul` (
  `NPM` int(5) NOT NULL,
  `Matkul` varchar(20) NOT NULL,
  `nilai_matkul` int(3) DEFAULT NULL,
  PRIMARY KEY (`NPM`,`Matkul`),
  CONSTRAINT `matkul_ibfk_1` FOREIGN KEY (`NPM`) REFERENCES `mahsiwa` (`NPM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matkul`
--

LOCK TABLES `matkul` WRITE;
/*!40000 ALTER TABLE `matkul` DISABLE KEYS */;
INSERT INTO `matkul` VALUES (900,'Fisika',90),(900,'Kalkulus',90),(901,'Kalkulus',75),(902,'Biologi',98),(902,'Fisika',89),(1234,'Biologi',88),(1234,'Kimia',88),(2001,'Kimia',77),(2002,'Kimia',70),(2345,'Biologi',98),(2345,'Fisika',95),(2345,'Kimia',99);
/*!40000 ALTER TABLE `matkul` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-11 11:10:30
