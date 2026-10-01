CREATE DATABASE  IF NOT EXISTS `db_test_7b` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `db_test_7b`;
-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: db_test_7b
-- ------------------------------------------------------
-- Server version	8.0.45

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
-- Table structure for table `tb_logs`
--

DROP TABLE IF EXISTS `tb_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_logs` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `table_name` varchar(80) NOT NULL,
  `table_operation` enum('Create','Read','Update','Delete') DEFAULT NULL,
  `db_user` varchar(80) NOT NULL,
  `operation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `operation_description` text NOT NULL,
  `operation_status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_logs`
--

LOCK TABLES `tb_logs` WRITE;
/*!40000 ALTER TABLE `tb_logs` DISABLE KEYS */;
INSERT INTO `tb_logs` VALUES (1,'tb_users','Create','root@localhost','2026-09-10 09:58:11','Usuario creado. ID=3, email=marco.ramirez@utxicotepec.edu.mx, nick=MTI-MarcoRH, creation_date=2026-09-10 09:58:11, status=',_binary ''),(2,'tb_users','Create','root@localhost','2026-09-10 10:23:08','Usuario creado. ID=4, email=alejandra99@gmail.com, nick=Alex, creation_date=2026-09-10 10:23:08, status=',_binary ''),(3,'tb_users','Create','root@localhost','2026-09-10 10:23:39','Usuario creado. ID=5, email=fercho@hotmail.com, nick=FernandoxD, creation_date=2026-09-10 10:23:39, status=',_binary ''),(4,'tb_users','Create','vanessa.vergara@PC-02','2026-09-10 11:26:03','Usuario creado. ID=6, email=240270@utxicotepec.edu.mx, nick=Vanessa Vergara, creation_date=2026-09-10 11:26:03, status=',_binary ''),(5,'tb_users','Create','vanessa.vergara@PC-02','2026-09-10 11:27:08','Usuario creado. ID=7, email=240383@utxicotepec.edu.mx, nick=Samuel Ramírez, creation_date=2026-09-10 11:27:08, status=',_binary ''),(6,'tb_users','Create','vanessa.vergara@PC-02','2026-09-10 11:28:09','Usuario creado. ID=8, email=240780@utxicotepec.edu.mx, nick=Sarahi Torres, creation_date=2026-09-10 11:28:09, status=',_binary ''),(7,'tb_users','Delete','vanessa.vergara@PC-02','2026-09-10 12:41:39','Usuario eliminado. ID=8, email=240780@utxicotepec.edu.mx, nick=Sarahi Torres, creation_date=2026-09-10 11:28:09, last_update=NULL, last_login=NULL, status=1',_binary ''),(8,'tb_users','Update','vanessa.vergara@PC-02','2026-09-10 12:42:25','Usuario actualizado. ID=7. Cambios: nick: Samuel Ramírez -> Sam, last_update: NULL -> 2026-09-10 12:42:25',_binary '');
/*!40000 ALTER TABLE `tb_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_users`
--

DROP TABLE IF EXISTS `tb_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_users` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `nick` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_update` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `last_login` datetime DEFAULT NULL,
  `status` bit(1) DEFAULT b'1',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `nick` (`nick`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_users`
--

LOCK TABLES `tb_users` WRITE;
/*!40000 ALTER TABLE `tb_users` DISABLE KEYS */;
INSERT INTO `tb_users` VALUES (3,'marco.ramirez@utxicotepec.edu.mx','MTI-MarcoRH','871534c2971fceb021437786bc940bd2','2026-09-10 09:58:11',NULL,NULL,_binary ''),(4,'alejandra99@gmail.com','Alex','827ccb0eea8a706c4c34a16891f84e7b','2026-09-10 10:23:08',NULL,NULL,_binary ''),(5,'fercho@hotmail.com','FernandoxD','d8578edf8458ce06fbc5bb76a58c5ca4','2026-09-10 10:23:39',NULL,NULL,_binary ''),(6,'240270@utxicotepec.edu.mx','Vanessa Vergara','827ccb0eea8a706c4c34a16891f84e7b','2026-09-10 11:26:03',NULL,NULL,_binary ''),(7,'240383@utxicotepec.edu.mx','Sam','827ccb0eea8a706c4c34a16891f84e7b','2026-09-10 11:27:08','2026-09-10 12:42:25',NULL,_binary '');
/*!40000 ALTER TABLE `tb_users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_users_after_insert` AFTER INSERT ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_description,
        operation_date,
        operation_status
    )
    VALUES (
        'tb_users',
        'Create',
        USER(),
        CONCAT(
            'Usuario creado. ID=', NEW.ID,
            ', email=', NEW.email,
            ', nick=', NEW.nick,
            ', creation_date=', NEW.creation_date,
            ', status=', NEW.status
        ),
        CURRENT_TIMESTAMP,
        b'1'
    );
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_users_after_update` AFTER UPDATE ON `tb_users` FOR EACH ROW BEGIN
    DECLARE cambios TEXT;

    SET cambios = CONCAT_WS(
        ', ',

        IF(
            NOT (OLD.email <=> NEW.email),
            CONCAT(
                'email: ',
                IFNULL(OLD.email, 'NULL'),
                ' -> ',
                IFNULL(NEW.email, 'NULL')
            ),
            NULL
        ),

        IF(
            NOT (OLD.nick <=> NEW.nick),
            CONCAT(
                'nick: ',
                IFNULL(OLD.nick, 'NULL'),
                ' -> ',
                IFNULL(NEW.nick, 'NULL')
            ),
            NULL
        ),

        IF(
            NOT (OLD.password <=> NEW.password),
            'password: [MODIFICADA]',
            NULL
        ),

        IF(
            NOT (OLD.creation_date <=> NEW.creation_date),
            CONCAT(
                'creation_date: ',
                IFNULL(OLD.creation_date, 'NULL'),
                ' -> ',
                IFNULL(NEW.creation_date, 'NULL')
            ),
            NULL
        ),

        IF(
            NOT (OLD.last_update <=> NEW.last_update),
            CONCAT(
                'last_update: ',
                IFNULL(OLD.last_update, 'NULL'),
                ' -> ',
                IFNULL(NEW.last_update, 'NULL')
            ),
            NULL
        ),

        IF(
            NOT (OLD.last_login <=> NEW.last_login),
            CONCAT(
                'last_login: ',
                IFNULL(OLD.last_login, 'NULL'),
                ' -> ',
                IFNULL(NEW.last_login, 'NULL')
            ),
            NULL
        ),

        IF(
            NOT (OLD.status <=> NEW.status),
            CONCAT(
                'status: ',
                IFNULL(CAST(OLD.status AS UNSIGNED), 'NULL'),
                ' -> ',
                IFNULL(CAST(NEW.status AS UNSIGNED), 'NULL')
            ),
            NULL
        )
    );

    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_date,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_users',
        'Update',
        USER(),
        CURRENT_TIMESTAMP,
        CONCAT(
            'Usuario actualizado. ID=',
            NEW.ID,
            '. Cambios: ',
            IFNULL(
                NULLIF(cambios, ''),
                'Sin cambios de valor'
            )
        ),
        b'1'
    );

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_users_after_delete` AFTER DELETE ON `tb_users` FOR EACH ROW BEGIN
    INSERT INTO tb_logs (
        table_name,
        table_operation,
        db_user,
        operation_date,
        operation_description,
        operation_status
    )
    VALUES (
        'tb_users',
        'Delete',
        USER(),
        CURRENT_TIMESTAMP,
        CONCAT(
            'Usuario eliminado. ',
            'ID=', OLD.ID,
            ', email=', OLD.email,
            ', nick=', OLD.nick,
            ', creation_date=', OLD.creation_date,
            ', last_update=', IFNULL(OLD.last_update, 'NULL'),
            ', last_login=', IFNULL(OLD.last_login, 'NULL'),
            ', status=', IFNULL(CAST(OLD.status AS UNSIGNED), 'NULL')
        ),
        b'1'
    );
END */;;
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

-- Dump completed on 2026-09-15  7:37:43
