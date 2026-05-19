-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: db_gymart
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
-- Table structure for table `clase`
--

DROP TABLE IF EXISTS `clase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clase` (
  `id_clase` int NOT NULL AUTO_INCREMENT,
  `nombre_clase` varchar(25) NOT NULL,
  `hora_inicio` time NOT NULL,
  `hora_fin` time NOT NULL,
  `capacidad_maxima` int NOT NULL,
  `id_instructor` varchar(10) NOT NULL,
  PRIMARY KEY (`id_clase`),
  KEY `fk_clase_instructor` (`id_instructor`),
  CONSTRAINT `fk_clase_instructor` FOREIGN KEY (`id_instructor`) REFERENCES `instructor` (`id_instructor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clase`
--

LOCK TABLES `clase` WRITE;
/*!40000 ALTER TABLE `clase` DISABLE KEYS */;
INSERT INTO `clase` VALUES (1,'Crossfit','07:00:00','08:00:00',20,'1105423654'),(2,'Musculación','09:00:00','10:30:00',25,'1102233445'),(3,'Yoga','17:00:00','18:00:00',2,'1109988776'),(4,'Boxeo','19:00:00','20:00:00',15,'1106655443'),(5,'Pilates','08:00:00','09:00:00',10,'1103322110'),(6,'Natación','06:00:00','07:30:00',12,'1107788992'),(7,'Zumba','18:30:00','19:30:00',30,'1101122334'),(8,'Funcional','16:00:00','17:00:00',20,'1104455667');
/*!40000 ALTER TABLE `clase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` varchar(10) NOT NULL,
  `nombre_cliente` varchar(25) NOT NULL,
  `apellido_cliente` varchar(25) NOT NULL,
  `edad` int DEFAULT NULL,
  `correo` varchar(50) NOT NULL,
  `telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `uk_cliente_correo` (`correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('1101112223','Alexander','Riofrio',21,'alex@mail.com','0987654321'),('1102233119','Pedro','Armijos',28,'pedro@mail.com','0966554433'),('1103344552','Lucia','Cueva',24,'lucia@mail.com','0955443322'),('1104041619','Alexandra','Guarnizo',44,'alexandra@mail.com','0994200089'),('1104433221','Maria','Samaniego',25,'maria@mail.com','0991234567'),('1105544331','Mateo','Jaramillo',19,'mateo@mail.com','0944332211'),('1105566778','Juan','Perez',30,'juan@mail.com','0912344321'),('1106086117','Rodolfo','Gallo',18,'rodolfo@mail.com','0967008558'),('1106677880','Sofia','Vallejo',27,'sofia@mail.com','0933221100'),('1108899001','Elena','Castillo',22,'elena@mail.com','0977665544');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inscripcion`
--

DROP TABLE IF EXISTS `inscripcion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inscripcion` (
  `id_inscripcion` int NOT NULL AUTO_INCREMENT,
  `fecha_inscripcion` date NOT NULL,
  `estado_asistencia` enum('Pendiente','Presente','Ausente','Justificado') NOT NULL,
  `id_cliente` varchar(10) NOT NULL,
  `id_clase` int NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `fk_inscripcion_cliente` (`id_cliente`),
  KEY `fk_inscripcion_clase` (`id_clase`),
  CONSTRAINT `fk_inscripcion_clase` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  CONSTRAINT `fk_inscripcion_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inscripcion`
--

LOCK TABLES `inscripcion` WRITE;
/*!40000 ALTER TABLE `inscripcion` DISABLE KEYS */;
INSERT INTO `inscripcion` VALUES (1,'2026-05-07','Presente','1101112223',1),(2,'2026-05-07','Presente','1104433221',1),(3,'2026-05-08','Presente','1105566778',3),(4,'2026-05-08','Presente','1108899001',3),(5,'2026-05-09','Ausente','1102233119',2),(6,'2026-05-09','Presente','1103344552',4),(7,'2026-05-10','Presente','1105544331',6),(8,'2026-05-10','Presente','1106677880',1);
/*!40000 ALTER TABLE `inscripcion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instructor`
--

DROP TABLE IF EXISTS `instructor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instructor` (
  `id_instructor` varchar(10) NOT NULL,
  `nombre_instructor` varchar(25) NOT NULL,
  `apellido_instructor` varchar(25) NOT NULL,
  `especialidad` varchar(25) NOT NULL,
  `anios_experiencia` int NOT NULL,
  PRIMARY KEY (`id_instructor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instructor`
--

LOCK TABLES `instructor` WRITE;
/*!40000 ALTER TABLE `instructor` DISABLE KEYS */;
INSERT INTO `instructor` VALUES ('1101122334','Paola','Vaca','Zumba',2),('1102233445','Marcos','Guerrero','Musculación',5),('1103322110','Diana','Paredes','Pilates',4),('1104455667','Roberto','Leon','Funcional',7),('1105423654','Rene','Guaman','Crossfit',10),('1106655443','Carlos','Mendoza','Boxeo',8),('1107788992','Luis','Torres','Natación',6),('1109988776','Ana','Rojas','Yoga',3);
/*!40000 ALTER TABLE `instructor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresia`
--

DROP TABLE IF EXISTS `membresia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresia` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Diaria','Mensual','Trimestral','Anual') NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `estado` enum('Activa','Vencida','Cancelada') NOT NULL,
  `id_cliente` varchar(10) NOT NULL,
  PRIMARY KEY (`id_membresia`),
  KEY `fk_membresia_cliente` (`id_cliente`),
  CONSTRAINT `fk_membresia_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresia`
--

LOCK TABLES `membresia` WRITE;
/*!40000 ALTER TABLE `membresia` DISABLE KEYS */;
INSERT INTO `membresia` VALUES (1,'Mensual','2026-05-01','2026-05-31','Activa','1101112223'),(2,'Anual','2026-01-01','2026-12-31','Activa','1104433221'),(3,'Mensual','2026-04-01','2026-04-30','Vencida','1105566778'),(4,'Trimestral','2026-05-01','2026-08-01','Activa','1108899001'),(5,'Mensual','2026-05-10','2026-06-10','Activa','1102233119'),(6,'Anual','2025-05-01','2026-05-01','Vencida','1103344552'),(7,'Diaria','2026-02-01','2026-08-01','Activa','1105544331'),(8,'Mensual','2026-05-15','2026-06-15','Activa','1106677880');
/*!40000 ALTER TABLE `membresia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `view_countC5`
--

DROP TABLE IF EXISTS `view_countC5`;
/*!50001 DROP VIEW IF EXISTS `view_countC5`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_countC5` AS SELECT 
 1 AS `tipo`,
 1 AS `Total_clientes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_instructorC1`
--

DROP TABLE IF EXISTS `view_instructorC1`;
/*!50001 DROP VIEW IF EXISTS `view_instructorC1`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_instructorC1` AS SELECT 
 1 AS `nombre_instructor`,
 1 AS `apellido_instructor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_interseccionC3`
--

DROP TABLE IF EXISTS `view_interseccionC3`;
/*!50001 DROP VIEW IF EXISTS `view_interseccionC3`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_interseccionC3` AS SELECT 
 1 AS `id_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_joinC4`
--

DROP TABLE IF EXISTS `view_joinC4`;
/*!50001 DROP VIEW IF EXISTS `view_joinC4`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_joinC4` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `nombre_clase`,
 1 AS `nombre_instructor`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_unionC2`
--

DROP TABLE IF EXISTS `view_unionC2`;
/*!50001 DROP VIEW IF EXISTS `view_unionC2`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_unionC2` AS SELECT 
 1 AS `id_cliente`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `view_countC5`
--

/*!50001 DROP VIEW IF EXISTS `view_countC5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_countC5` AS select `me`.`tipo` AS `tipo`,count(`me`.`id_cliente`) AS `Total_clientes` from `membresia` `me` group by `me`.`tipo` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_instructorC1`
--

/*!50001 DROP VIEW IF EXISTS `view_instructorC1`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_instructorC1` AS select `it`.`nombre_instructor` AS `nombre_instructor`,`it`.`apellido_instructor` AS `apellido_instructor` from `instructor` `it` where (`it`.`anios_experiencia` > 5) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_interseccionC3`
--

/*!50001 DROP VIEW IF EXISTS `view_interseccionC3`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_interseccionC3` AS select `cl`.`id_cliente` AS `id_cliente` from `cliente` `cl` intersect select `me`.`id_cliente` AS `id_cliente` from `membresia` `me` where `me`.`id_cliente` in (select `ins`.`id_cliente` from `inscripcion` `ins`) is false */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_joinC4`
--

/*!50001 DROP VIEW IF EXISTS `view_joinC4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_joinC4` AS select `cl`.`nombre_cliente` AS `nombre_cliente`,`ca`.`nombre_clase` AS `nombre_clase`,`it`.`nombre_instructor` AS `nombre_instructor` from ((((`cliente` `cl` join `inscripcion` `ins` on((`cl`.`id_cliente` = `ins`.`id_cliente`))) join `clase` `ca` on((`ins`.`id_clase` = `ca`.`id_clase`))) join `instructor` `it` on((`ca`.`id_instructor` = `it`.`id_instructor`))) join `membresia` `me` on((`cl`.`id_cliente` = `me`.`id_cliente`))) where (`me`.`estado` = 'Activa') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_unionC2`
--

/*!50001 DROP VIEW IF EXISTS `view_unionC2`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_unionC2` AS select `cl`.`id_cliente` AS `id_cliente` from `cliente` `cl` union select `it`.`id_instructor` AS `id_instructor` from `instructor` `it` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-18 20:49:04
