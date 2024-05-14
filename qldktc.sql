-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: qldktc
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
-- Table structure for table `tbldangkihoc`
--

DROP TABLE IF EXISTS `tbldangkihoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbldangkihoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idsinhvienkhoa` int DEFAULT NULL,
  `idmonhoc` int DEFAULT NULL,
  `idlophocphan` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idsinhvienkhoa` (`idsinhvienkhoa`),
  CONSTRAINT `tbldangkihoc_ibfk_1` FOREIGN KEY (`idsinhvienkhoa`) REFERENCES `tblsinhvienkhoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbldangkihoc`
--

LOCK TABLES `tbldangkihoc` WRITE;
/*!40000 ALTER TABLE `tbldangkihoc` DISABLE KEYS */;
INSERT INTO `tbldangkihoc` VALUES (1,1,NULL,NULL),(2,2,NULL,NULL),(3,3,NULL,NULL),(4,4,NULL,NULL),(5,1,NULL,NULL),(6,2,NULL,NULL),(7,3,NULL,NULL),(8,4,NULL,NULL),(25,1,NULL,6),(26,3,NULL,3),(190,1,NULL,1),(191,1,NULL,2);
/*!40000 ALTER TABLE `tbldangkihoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblgiangvien`
--

DROP TABLE IF EXISTS `tblgiangvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblgiangvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblgiangvien`
--

LOCK TABLES `tblgiangvien` WRITE;
/*!40000 ALTER TABLE `tblgiangvien` DISABLE KEYS */;
INSERT INTO `tblgiangvien` VALUES (1,'Nguyen Van A'),(2,'Tran Thi Binh'),(3,'Pham Minh Cuong'),(4,'Le Thi Dung'),(5,'Hoang Van Nam'),(6,'Nguyen Thi Hang'),(7,'Vu Van Hung'),(8,'Le Thi Thu'),(9,'Dang Van Hai'),(10,'Tran Thi Thanh');
/*!40000 ALTER TABLE `tblgiangvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblhocki`
--

DROP TABLE IF EXISTS `tblhocki`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblhocki` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblhocki`
--

LOCK TABLES `tblhocki` WRITE;
/*!40000 ALTER TABLE `tblhocki` DISABLE KEYS */;
INSERT INTO `tblhocki` VALUES (1,'Spring'),(2,'Summer'),(3,'Fall'),(4,'Winter'),(5,'Hoc ki 5'),(6,'Hoc ki 6'),(7,'Hoc ki 7'),(8,'Hoc ki 8'),(9,'Hoc ki 9'),(10,'Hoc ki 10');
/*!40000 ALTER TABLE `tblhocki` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblketqua`
--

DROP TABLE IF EXISTS `tblketqua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblketqua` (
  `id` int NOT NULL AUTO_INCREMENT,
  `iddangkihoc` int DEFAULT NULL,
  `diem` decimal(5,2) DEFAULT NULL,
  `idmonhocdaudiem` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `iddangkihoc` (`iddangkihoc`),
  CONSTRAINT `tblketqua_ibfk_1` FOREIGN KEY (`iddangkihoc`) REFERENCES `tbldangkihoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblketqua`
--

LOCK TABLES `tblketqua` WRITE;
/*!40000 ALTER TABLE `tblketqua` DISABLE KEYS */;
INSERT INTO `tblketqua` VALUES (1,1,8.50,NULL),(2,2,7.90,NULL),(3,3,9.20,NULL),(4,4,8.70,NULL);
/*!40000 ALTER TABLE `tblketqua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkhoa`
--

DROP TABLE IF EXISTS `tblkhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkhoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkhoa`
--

LOCK TABLES `tblkhoa` WRITE;
/*!40000 ALTER TABLE `tblkhoa` DISABLE KEYS */;
INSERT INTO `tblkhoa` VALUES (1,'Computer Science'),(2,'Electrical Engineering'),(3,'Mechanical Engineering'),(4,'Civil Engineering'),(5,'Khoa 5'),(6,'Khoa 6'),(7,'Khoa 7'),(8,'Khoa 8'),(9,'Khoa 9'),(10,'Khoa 10');
/*!40000 ALTER TABLE `tblkhoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkihoc`
--

DROP TABLE IF EXISTS `tblkihoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkihoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idnamhoc` int DEFAULT NULL,
  `idhocki` int DEFAULT NULL,
  `dangdk` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idnamhoc` (`idnamhoc`),
  KEY `idhocki` (`idhocki`),
  CONSTRAINT `tblkihoc_ibfk_1` FOREIGN KEY (`idnamhoc`) REFERENCES `tblnamhoc` (`id`),
  CONSTRAINT `tblkihoc_ibfk_2` FOREIGN KEY (`idhocki`) REFERENCES `tblhocki` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkihoc`
--

LOCK TABLES `tblkihoc` WRITE;
/*!40000 ALTER TABLE `tblkihoc` DISABLE KEYS */;
INSERT INTO `tblkihoc` VALUES (1,1,1,1),(2,2,2,1),(3,3,3,1),(4,4,4,1),(5,5,5,1),(6,6,6,1),(7,7,7,1),(8,8,8,1),(9,9,9,1),(10,10,10,0);
/*!40000 ALTER TABLE `tblkihoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblkip`
--

DROP TABLE IF EXISTS `tblkip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblkip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblkip`
--

LOCK TABLES `tblkip` WRITE;
/*!40000 ALTER TABLE `tblkip` DISABLE KEYS */;
INSERT INTO `tblkip` VALUES (1,'8:00 - 10:00'),(2,'10:00 - 12:00'),(3,'13:00 - 15:00'),(4,'15:00 - 17:00'),(8,'17:00 - 19:00');
/*!40000 ALTER TABLE `tblkip` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllichhoc`
--

DROP TABLE IF EXISTS `tbllichhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbllichhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idlophocphan` int DEFAULT NULL,
  `idgiangvien` int DEFAULT NULL,
  `idtuan` int DEFAULT NULL,
  `idngay` int DEFAULT NULL,
  `idkip` int DEFAULT NULL,
  `idphonghoc` int DEFAULT NULL,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idlophocphan` (`idlophocphan`),
  CONSTRAINT `tbllichhoc_ibfk_1` FOREIGN KEY (`idlophocphan`) REFERENCES `tbllophocphan` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllichhoc`
--

LOCK TABLES `tbllichhoc` WRITE;
/*!40000 ALTER TABLE `tbllichhoc` DISABLE KEYS */;
INSERT INTO `tbllichhoc` VALUES (1,1,1,1,1,1,1,NULL),(2,2,2,2,2,2,2,NULL),(3,3,3,3,3,3,3,NULL),(4,4,4,4,4,4,4,NULL),(5,5,5,5,5,5,5,NULL),(6,6,6,6,6,6,1,NULL),(7,7,7,7,7,7,2,NULL),(8,8,8,8,8,8,3,NULL),(9,9,9,9,9,9,4,NULL),(10,10,9,10,10,10,5,NULL),(11,1,1,1,1,1,2,NULL),(12,2,1,1,1,1,NULL,NULL);
/*!40000 ALTER TABLE `tbllichhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbllophocphan`
--

DROP TABLE IF EXISTS `tbllophocphan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbllophocphan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `sisotoida` int DEFAULT NULL,
  `idmonhockihoc` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmonhockihoc` (`idmonhockihoc`),
  CONSTRAINT `tbllophocphan_ibfk_1` FOREIGN KEY (`idmonhockihoc`) REFERENCES `tblmonhockihoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbllophocphan`
--

LOCK TABLES `tbllophocphan` WRITE;
/*!40000 ALTER TABLE `tbllophocphan` DISABLE KEYS */;
INSERT INTO `tbllophocphan` VALUES (1,'Lop hoc phan 1',30,1),(2,'Lop hoc phan 2',25,2),(3,'Lop hoc phan 3',35,3),(4,'Lop hoc phan 4',40,4),(5,'Lop hoc phan 5',30,5),(6,'Lop hoc phan 6',25,6),(7,'Lop hoc phan 7',35,7),(8,'Lop hoc phan 8',40,8),(9,'Lop hoc phan 9',30,9),(10,'Lop hoc phan 10',25,10);
/*!40000 ALTER TABLE `tbllophocphan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMonhoc`
--

DROP TABLE IF EXISTS `tblMonhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblMonhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  `sotc` int DEFAULT NULL,
  `idkhoa` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_monhoc_khoa` (`idkhoa`),
  CONSTRAINT `fk_monhoc_khoa` FOREIGN KEY (`idkhoa`) REFERENCES `tblKhoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMonhoc`
--

LOCK TABLES `tblMonhoc` WRITE;
/*!40000 ALTER TABLE `tblMonhoc` DISABLE KEYS */;
INSERT INTO `tblMonhoc` VALUES (1,'Calculus',3,1),(2,'Physics',4,1),(3,'Chemistry',3,1),(4,'Introduction to Programming',4,1),(5,'Statics and Dynamics',3,2),(6,'Strength of Materials',4,2),(7,'Hydraulics and Water Resources Engineering',3,2),(8,'Monhoc 8',4,2),(9,'Monhoc 9',3,3),(10,'Monhoc 10',4,3);
/*!40000 ALTER TABLE `tblMonhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmonhocdaudiem`
--

DROP TABLE IF EXISTS `tblmonhocdaudiem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmonhocdaudiem` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idmonhoc` int DEFAULT NULL,
  `tile` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmonhoc` (`idmonhoc`),
  CONSTRAINT `tblmonhocdaudiem_ibfk_1` FOREIGN KEY (`idmonhoc`) REFERENCES `tblmonhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmonhocdaudiem`
--

LOCK TABLES `tblmonhocdaudiem` WRITE;
/*!40000 ALTER TABLE `tblmonhocdaudiem` DISABLE KEYS */;
INSERT INTO `tblmonhocdaudiem` VALUES (1,1,0.8),(2,2,0.7),(3,3,0.9),(4,4,0.85);
/*!40000 ALTER TABLE `tblmonhocdaudiem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmonhockihoc`
--

DROP TABLE IF EXISTS `tblmonhockihoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmonhockihoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idmonhoc` int DEFAULT NULL,
  `idkihoc` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmonhoc` (`idmonhoc`),
  KEY `idkihoc` (`idkihoc`),
  CONSTRAINT `tblmonhockihoc_ibfk_1` FOREIGN KEY (`idmonhoc`) REFERENCES `tblmonhoc` (`id`),
  CONSTRAINT `tblmonhockihoc_ibfk_2` FOREIGN KEY (`idkihoc`) REFERENCES `tblkihoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmonhockihoc`
--

LOCK TABLES `tblmonhockihoc` WRITE;
/*!40000 ALTER TABLE `tblmonhockihoc` DISABLE KEYS */;
INSERT INTO `tblmonhockihoc` VALUES (1,1,1),(2,2,1),(3,3,1),(4,4,1),(5,5,1),(6,6,2),(7,7,2),(8,8,2),(9,9,3),(10,10,10);
/*!40000 ALTER TABLE `tblmonhockihoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblmontienquyet`
--

DROP TABLE IF EXISTS `tblmontienquyet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblmontienquyet` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idmonhoc` int DEFAULT NULL,
  `idmontienquyet` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idmonhoc` (`idmonhoc`),
  KEY `idmontienquyet` (`idmontienquyet`),
  CONSTRAINT `tblmontienquyet_ibfk_1` FOREIGN KEY (`idmonhoc`) REFERENCES `tblmonhoc` (`id`),
  CONSTRAINT `tblmontienquyet_ibfk_2` FOREIGN KEY (`idmontienquyet`) REFERENCES `tblmonhoc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblmontienquyet`
--

LOCK TABLES `tblmontienquyet` WRITE;
/*!40000 ALTER TABLE `tblmontienquyet` DISABLE KEYS */;
INSERT INTO `tblmontienquyet` VALUES (1,2,1),(2,3,2),(3,4,3),(4,5,4),(5,6,5),(6,7,6),(7,8,7),(8,9,8),(9,10,9),(10,2,10),(11,1,NULL),(12,2,NULL),(13,3,NULL),(14,4,NULL),(15,1,NULL),(16,2,NULL),(17,3,NULL),(18,4,NULL);
/*!40000 ALTER TABLE `tblmontienquyet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblnamhoc`
--

DROP TABLE IF EXISTS `tblnamhoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblnamhoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblnamhoc`
--

LOCK TABLES `tblnamhoc` WRITE;
/*!40000 ALTER TABLE `tblnamhoc` DISABLE KEYS */;
INSERT INTO `tblnamhoc` VALUES (1,'2021-2022'),(2,'2022-2023'),(3,'2023-2024'),(4,'2020-2021'),(5,'2020-2021'),(6,'2020-2021'),(7,'2020-2021'),(8,'2020-2021'),(9,'2020-2021'),(10,'2020-2021');
/*!40000 ALTER TABLE `tblnamhoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblngay`
--

DROP TABLE IF EXISTS `tblngay`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblngay` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblngay`
--

LOCK TABLES `tblngay` WRITE;
/*!40000 ALTER TABLE `tblngay` DISABLE KEYS */;
INSERT INTO `tblngay` VALUES (1,'Monday'),(2,'Tuesday'),(3,'Wednesday'),(4,'Thursday'),(5,'Friday'),(6,'Saturday'),(7,'Sunday');
/*!40000 ALTER TABLE `tblngay` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblphonghoc`
--

DROP TABLE IF EXISTS `tblphonghoc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblphonghoc` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblphonghoc`
--

LOCK TABLES `tblphonghoc` WRITE;
/*!40000 ALTER TABLE `tblphonghoc` DISABLE KEYS */;
INSERT INTO `tblphonghoc` VALUES (1,'Room A'),(2,'Room B'),(3,'Room C'),(4,'Room D'),(5,'Room E');
/*!40000 ALTER TABLE `tblphonghoc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsinhvien`
--

DROP TABLE IF EXISTS `tblsinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsinhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `masv` varchar(255) DEFAULT NULL,
  `idthanhvien` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idthanhvien` (`idthanhvien`),
  CONSTRAINT `tblsinhvien_ibfk_1` FOREIGN KEY (`idthanhvien`) REFERENCES `tblthanhvien` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsinhvien`
--

LOCK TABLES `tblsinhvien` WRITE;
/*!40000 ALTER TABLE `tblsinhvien` DISABLE KEYS */;
INSERT INTO `tblsinhvien` VALUES (1,'SV001',1),(2,'SV002',2),(3,'SV003',3),(4,'SV004',4),(5,'SV005',5),(6,'SV006',6),(7,'SV007',7),(8,'SV008',8),(9,'SV009',9),(10,'SV010',10);
/*!40000 ALTER TABLE `tblsinhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblsinhvienkhoa`
--

DROP TABLE IF EXISTS `tblsinhvienkhoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblsinhvienkhoa` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idsinhvien` int DEFAULT NULL,
  `idkhoa` int DEFAULT NULL,
  `danghoc` tinyint(1) DEFAULT NULL,
  `nienkhoa` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idsinhvien` (`idsinhvien`),
  KEY `idkhoa` (`idkhoa`),
  CONSTRAINT `tblsinhvienkhoa_ibfk_1` FOREIGN KEY (`idsinhvien`) REFERENCES `tblsinhvien` (`id`),
  CONSTRAINT `tblsinhvienkhoa_ibfk_2` FOREIGN KEY (`idkhoa`) REFERENCES `tblkhoa` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblsinhvienkhoa`
--

LOCK TABLES `tblsinhvienkhoa` WRITE;
/*!40000 ALTER TABLE `tblsinhvienkhoa` DISABLE KEYS */;
INSERT INTO `tblsinhvienkhoa` VALUES (1,1,1,1,'2022-2023'),(2,2,2,1,'2021-2022'),(3,3,3,1,'2023-2024'),(4,4,4,1,'2022-2023'),(5,5,5,1,'2021-2022'),(6,6,6,1,'2020-2021'),(7,7,7,1,'2019-2020'),(8,8,8,1,'2018-2019'),(9,9,9,1,'2017-2018'),(10,10,10,1,'2016-2017');
/*!40000 ALTER TABLE `tblsinhvienkhoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblthanhvien`
--

DROP TABLE IF EXISTS `tblthanhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblthanhvien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `vaitro` varchar(45) NOT NULL,
  `hodem` varchar(45) NOT NULL,
  `ten` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblthanhvien`
--

LOCK TABLES `tblthanhvien` WRITE;
/*!40000 ALTER TABLE `tblthanhvien` DISABLE KEYS */;
INSERT INTO `tblthanhvien` VALUES (1,'user1','pass1','sinhvien','John','Doe'),(2,'user2','pass2','sinhvien','Jane','Doe'),(3,'user3','pass3','sinhvien','Alice','Smith'),(4,'user4','pass4','sinhvien','Bob','Johnson'),(5,'user5','pass5','sinhvien','Michael','Brown'),(6,'user6','pass6','sinhvien','Emily','Davis'),(7,'user7','pass7','sinhvien','Daniel','Miller'),(8,'user8','pass8','sinhvien','Sarah','Wilson'),(9,'user9','pass9','role9','David','Martinez'),(10,'user10','pass10','sinhvien','Emma','Anderson');
/*!40000 ALTER TABLE `tblthanhvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbltuan`
--

DROP TABLE IF EXISTS `tbltuan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbltuan` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ten` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbltuan`
--

LOCK TABLES `tbltuan` WRITE;
/*!40000 ALTER TABLE `tbltuan` DISABLE KEYS */;
INSERT INTO `tbltuan` VALUES (1,'Tuan 1'),(2,'Tuan 2'),(3,'Tuan 3'),(4,'Tuan 4'),(5,'Tuan 5'),(6,'Tuan 6'),(7,'Tuan 7'),(8,'Tuan 8'),(9,'Tuan 9'),(10,'Tuan 10');
/*!40000 ALTER TABLE `tbltuan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'qldktc'
--

--
-- Dumping routines for database 'qldktc'
--
/*!50003 DROP PROCEDURE IF EXISTS `DKcuaSVtheoKi` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DKcuaSVtheoKi`(IN idSVK int, IN idKihoc int)
BEGIN
    SELECT 
        a.*, 
        c.id as idmhkh, 
        d.id as idmh, 
        d.ten as tenmh, 
        d.sotc,
        b.id as idlhp, 
        b.ten as tenlhp, 
        d.idkhoa,
        e.nienkhoa, 
        e.idsinhvien, 
        f.masv, 
        g.hodem, 
        g.ten as tensv,
        h.ten as tenkhoa
    FROM 
        tbldangkihoc a
        INNER JOIN tbllophocphan b ON b.id = a.idlophocphan
        INNER JOIN tblmonhockihoc c ON c.id = b.idmonhockihoc
        INNER JOIN tblmonhoc d ON d.id = c.idmonhoc
        INNER JOIN tblsinhvienkhoa e ON e.id = a.idsinhvienkhoa
        INNER JOIN tblsinhvien f ON f.id = e.idsinhvien
        INNER JOIN tblthanhvien g ON g.id = f.idthanhvien
        INNER JOIN tblkhoa h ON h.id = d.idkhoa
    WHERE 
        c.idkihoc = idKihoc
        AND e.idsinhvien = idSVK;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kiDangDK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kiDangDK`()
BEGIN
    SELECT a.id as idnamhoc, a.ten as namhoc, b.id as idhocki,
    b.ten as hocki, c.id as idkihoc
    FROM tblnamhoc a, tblhocki b, tblkihoc c
    WHERE c.idnamhoc = a.id AND c.idhocki = b.id AND c.dangdk = 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `kiemtraDN` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `kiemtraDN`(IN usr VARCHAR(255), IN pwd VARCHAR(255))
BEGIN
    SELECT * FROM tblthanhvien WHERE username = usr AND password = pwd;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LHPchoSVdangki` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LHPchoSVdangki`(IN idSVK INT, IN idMHKH INT)
BEGIN
    DECLARE idKH INT;

    -- Get the academic term ID
    SELECT idkihoc INTO idKH
    FROM tblmonhockihoc WHERE id = idMHKH;

    -- Drop temporary tables if they exist
    DROP TEMPORARY TABLE IF EXISTS slotdadangki;
    DROP TEMPORARY TABLE IF EXISTS lhpchuaday;

    -- Create temporary table to store slots already enrolled by the student
    CREATE TEMPORARY TABLE slotdadangki AS
        SELECT a.idtuan, a.idngay, a.idkip
        FROM tbllichhoc a
        JOIN tbllophocphan b ON a.idlophocphan = b.id
        JOIN tbldangkihoc c ON c.idlophocphan = b.id
        JOIN tblmonhockihoc d ON d.id = b.idmonhockihoc
        WHERE d.idkihoc = idKH AND c.idsinhvienkhoa = idSVK;

    -- Create temporary table to store sections available for enrollment
    CREATE TEMPORARY TABLE lhpchuaday AS
        SELECT a.id, a.ten, a.sisotoida, a.idmonhockihoc,
               COUNT(e.id) AS sisothuc
        FROM tbllophocphan a
        LEFT JOIN tbldangkihoc e ON e.idlophocphan = a.id
        WHERE a.idmonhockihoc = idMHKH
        GROUP BY a.id
        HAVING a.sisotoida > sisothuc;

    -- Select sections available for enrollment
    SELECT a.*, b.idkihoc, d.id AS idmh, d.ten AS tenmh, d.sotc
    FROM lhpchuaday a
    JOIN tblmonhockihoc b ON b.id = a.idmonhockihoc
    JOIN tblmonhoc d ON d.id = b.idmonhoc
    WHERE a.id NOT IN (
        SELECT b.id
        FROM tbllichhoc b
        JOIN slotdadangki c ON b.idtuan = c.idtuan AND b.idngay = c.idngay AND b.idkip = c.idkip
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `LichLHP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `LichLHP`(IN idLHP int)
BEGIN
    SELECT a.*, b.ten as tengv, b.hodem as hodemgv, c.ten as tenphong,
    d.ten as tentuan, e.ten as tenngay, f.ten as tenkip
    FROM tbllichhoc a, tblthanhvien b, tblphonghoc c,
    tbltuan d, tblngay e, tblkip f
    WHERE a.idlophocphan = idLHP AND b.id = a.idgiangvien
    AND c.id = a.idphonghoc AND d.id = a.idtuan
    AND e.id = a.idngay AND f.id = a.idkip;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `MHmaSVduocDK` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `MHmaSVduocDK`(IN idSVK INT, IN idKihoc INT)
BEGIN
    DROP TEMPORARY TABLE IF EXISTS ketquamon;
    DROP TEMPORARY TABLE IF EXISTS idmondaqua;
    DROP TEMPORARY TABLE IF EXISTS idmonchuaqua;

    CREATE TEMPORARY TABLE ketquamon AS
    SELECT l.idmonhoc, SUM(k.diem*l.tile) as ketqua
    FROM tblmonhoc h
    JOIN tbldangkihoc i ON h.id = i.idmonhoc
    JOIN tblketqua k ON k.iddangkihoc = i.id
    JOIN tblmonhocdaudiem l ON l.id = k.idmonhocdaudiem
    WHERE i.idsinhvienkhoa = idSVK
    GROUP BY l.idmonhoc;

    CREATE TEMPORARY TABLE idmondaqua AS
    SELECT idmonhoc FROM ketquamon WHERE ketqua >= 4;

    CREATE TEMPORARY TABLE idmonchuaqua AS
    SELECT idmonhoc FROM ketquamon WHERE ketqua < 4;

    SELECT a.id as idmhkh, b.id as idmh, b.ten as tenmh, b.sotc
    FROM tblmonhockihoc a
    JOIN tblmonhoc b ON a.idmonhoc = b.id
    WHERE a.idkihoc = idKihoc
    AND (
        b.id NOT IN (SELECT idmonhoc FROM ketquamon WHERE ketqua >= 4)
        OR b.id IN (SELECT idmonhoc FROM idmonchuaqua)
        OR EXISTS (
            SELECT 1
            FROM tblmontienquyet g
            WHERE g.idmonhoc = b.id
            AND g.idmontienquyet IN (SELECT idmonhoc FROM idmondaqua)
        )
        OR NOT EXISTS (SELECT 1 FROM tblmontienquyet WHERE idmonhoc = b.id)
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `nganhcuaSV` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `nganhcuaSV`(IN idSV INT)
BEGIN
    SELECT a.id as idkhoa, a.ten as tenkhoa, b.id as idsvk,
    c.masv, d.*
    FROM tblkhoa a, tblsinhvienkhoa b, tblsinhvien c, tblthanhvien d
    WHERE b.idsinhvien = idSV AND b.idkhoa = a.id
    AND b.danghoc = 1 AND c.idthanhvien = idSV
    AND d.id = idSV;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-14 18:48:40
