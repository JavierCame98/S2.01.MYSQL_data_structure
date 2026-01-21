-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (x86_64)
--
-- Host: 127.0.0.1    Database: optica
-- ------------------------------------------------------
-- Server version	9.5.0

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

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '9f51d000-efac-11f0-b0cd-5dface191416:1-349';


DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
                            `supplier_id` int NOT NULL AUTO_INCREMENT,
                            `name` varchar(100) NOT NULL,
                            `street` varchar(100) DEFAULT NULL,
                            `number` varchar(10) DEFAULT NULL,
                            `floor` varchar(10) DEFAULT NULL,
                            `door` varchar(10) DEFAULT NULL,
                            `city` varchar(50) DEFAULT NULL,
                            `zip_code` varchar(10) DEFAULT NULL,
                            `country` varchar(50) DEFAULT NULL,
                            `phone` varchar(20) DEFAULT NULL,
                            `fax` varchar(20) DEFAULT NULL,
                            `nif` varchar(20) NOT NULL,
                            PRIMARY KEY (`supplier_id`),
                            UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

LOCK TABLES `supplier` WRITE;
/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES (1,'Visió Pro Distribucions','Carrer de Balmes','150',NULL,NULL,'Barcelona','08008','Spain','934567890',NULL,'A12345678'),(2,'EuroGlasses Import','Rua da Prata','22',NULL,NULL,'Lisboa','1100-415','Portugal','351213456',NULL,'B98765432');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;
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

-- Dump completed on 2026-01-21 12:16:02


--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `brand_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `supplier_id` int NOT NULL,
  PRIMARY KEY (`brand_id`),
  KEY `fk_brand_supplier` (`supplier_id`),
  CONSTRAINT `fk_brand_supplier` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Ray-Ban',1),(2,'Oakley',1),(3,'Carrera',2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `address` varchar(150) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `registration_date` date NOT NULL,
  `recommended_by_id` int DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `fk_customer_recommendation` (`recommended_by_id`),
  CONSTRAINT `fk_customer_recommendation` FOREIGN KEY (`recommended_by_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Joan García','Av. Gaudí 10, 2-1','600111222','joan@email.com','2023-01-15',NULL),(2,'Marta Roure','Carrer Gran 5','655444333','marta@email.com','2023-05-20',1);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Laura Soler'),(2,'Marc Ripoll');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `glasses_id` int NOT NULL AUTO_INCREMENT,
  `brand_id` int NOT NULL,
  `prescription_left` decimal(4,2) DEFAULT NULL,
  `prescription_right` decimal(4,2) DEFAULT NULL,
  `frame_type` enum('rimless','acetate','metallic') NOT NULL,
  `frame_color` varchar(30) DEFAULT NULL,
  `glass_color_left` varchar(30) DEFAULT NULL,
  `glass_color_right` varchar(30) DEFAULT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`glasses_id`),
  KEY `fk_glasses_brand` (`brand_id`),
  CONSTRAINT `fk_glasses_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,1,1.25,1.50,'acetate','Black','Green','Green',145.50),(2,2,0.00,0.00,'metallic','Silver','Blue','Blue',180.00),(3,3,2.00,2.25,'rimless','Gold','Transparent','Transparent',210.00);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sale`
--

DROP TABLE IF EXISTS `sale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sale` (
  `sale_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int NOT NULL,
  `employee_id` int NOT NULL,
  `glasses_id` int NOT NULL,
  `sale_date` datetime NOT NULL,
  PRIMARY KEY (`sale_id`),
  KEY `fk_sale_customer` (`customer_id`),
  KEY `fk_sale_employee` (`employee_id`),
  KEY `fk_sale_glasses` (`glasses_id`),
  CONSTRAINT `fk_sale_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_sale_employee` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_sale_glasses` FOREIGN KEY (`glasses_id`) REFERENCES `glasses` (`glasses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sale`
--

LOCK TABLES `sale` WRITE;
/*!40000 ALTER TABLE `sale` DISABLE KEYS */;
INSERT INTO `sale` VALUES (1,1,1,1,'2023-10-05 11:30:00'),(2,2,2,3,'2023-11-12 17:45:00');
/*!40000 ALTER TABLE `sale` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supplier`
--

