-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: transporte_camion
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `matricula` varchar(10) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `modelo` varchar(45) DEFAULT NULL,
  `potencia` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionero`
--

DROP TABLE IF EXISTS `camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero` (
  `cedula` varchar(20) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `telefono` varchar(20) NOT NULL,
  `poblacion` varchar(45) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionero`
--

LOCK TABLES `camionero` WRITE;
/*!40000 ALTER TABLE `camionero` DISABLE KEYS */;
/*!40000 ALTER TABLE `camionero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionero_camion`
--

DROP TABLE IF EXISTS `camionero_camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero_camion` (
  `cedula` varchar(20) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula`,`matricula`),
  KEY `fk_camionero_has_camion_camion1_idx` (`matricula`),
  KEY `fk_camionero_has_camion_camionero1_idx` (`cedula`),
  CONSTRAINT `fk_camionero_has_camion_camion1` FOREIGN KEY (`matricula`) REFERENCES `camion` (`matricula`),
  CONSTRAINT `fk_camionero_has_camion_camionero1` FOREIGN KEY (`cedula`) REFERENCES `camionero` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionero_camion`
--

LOCK TABLES `camionero_camion` WRITE;
/*!40000 ALTER TABLE `camionero_camion` DISABLE KEYS */;
/*!40000 ALTER TABLE `camionero_camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destinatario`
--

DROP TABLE IF EXISTS `destinatario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destinatario` (
  `id_destinatario` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(100) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_destinatario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destinatario`
--

LOCK TABLES `destinatario` WRITE;
/*!40000 ALTER TABLE `destinatario` DISABLE KEYS */;
/*!40000 ALTER TABLE `destinatario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `cod_paquete` varchar(50) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `id_destinatario` int NOT NULL,
  `cedula` varchar(20) NOT NULL,
  `cod_provincia` varchar(10) NOT NULL,
  PRIMARY KEY (`cod_paquete`),
  KEY `fk_paquete_destinatario_idx` (`id_destinatario`),
  KEY `fk_paquete_camionero1_idx` (`cedula`),
  KEY `fk_paquete_provincia1_idx` (`cod_provincia`),
  CONSTRAINT `fk_paquete_camionero1` FOREIGN KEY (`cedula`) REFERENCES `camionero` (`cedula`),
  CONSTRAINT `fk_paquete_destinatario` FOREIGN KEY (`id_destinatario`) REFERENCES `destinatario` (`id_destinatario`),
  CONSTRAINT `fk_paquete_provincia1` FOREIGN KEY (`cod_provincia`) REFERENCES `provincia` (`cod_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `cod_provincia` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  PRIMARY KEY (`cod_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 10:07:58
