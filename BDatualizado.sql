-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bdlocadora
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `filme`
--

DROP TABLE IF EXISTS `filme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `filme` (
  `idfilme` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `idgenero` int(10) unsigned NOT NULL,
  `filme` varchar(100) NOT NULL,
  `foto` varchar(245) NOT NULL,
  `descricao` varchar(245) NOT NULL,
  `cadastro` datetime DEFAULT current_timestamp(),
  `ativo` char(1) DEFAULT 'A',
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idfilme`,`idgenero`),
  KEY `fk_filme_genero` (`idgenero`),
  CONSTRAINT `fk_filme_genero` FOREIGN KEY (`idgenero`) REFERENCES `genero` (`idgenero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,1,' Velozes e Furiosos 2','fast-2.jpg','Former police officer Brian O\'Conner moves from Los Angeles to Miami to start his life over. He ends up getting involved in fights in his new city with his friend Tej and Suki.','2024-03-01 13:10:48','A','2024-03-01 19:18:45'),(2,2,'    Clube da luta','acao-1.png','A depressed man suffering from insomnia meets a strange salesman named Tyler Durden and finds himself living in a dirty house after his perfect apartment is destroyed.','2024-03-01 14:13:05','A','2024-03-01 19:14:26');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero`
--

DROP TABLE IF EXISTS `genero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero` (
  `idgenero` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `genero` varchar(30) NOT NULL,
  `cadastro` datetime DEFAULT current_timestamp(),
  `ativo` char(1) DEFAULT 'A',
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idgenero`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero`
--

LOCK TABLES `genero` WRITE;
/*!40000 ALTER TABLE `genero` DISABLE KEYS */;
INSERT INTO `genero` VALUES (1,'Racing','2024-02-29 16:50:29','A','2024-03-01 17:34:50'),(2,'Action','2024-02-29 16:50:29','A','2024-03-01 17:34:50'),(3,'Adventure','2024-02-29 16:50:29','A','2024-03-01 17:34:50');
/*!40000 ALTER TABLE `genero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `adm` varchar(10) NOT NULL DEFAULT 'Cliente',
  `nome` varchar(100) NOT NULL,
  `email` varchar(245) NOT NULL,
  `senha` varchar(245) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `cadastro` datetime DEFAULT current_timestamp(),
  `ativo` char(1) DEFAULT 'A',
  `alteracao` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`idusuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Adm','KojiZ','koji@gmail.com','$2y$12$7ThK2K7YPJjxU6xjo0feHe0S8y3LWTlLMrNruBLDKZqP8qzOsEn8.','02207858642','2024-02-29 16:28:40','A','2024-03-01 18:58:17'),(3,'Cliente','Miguel','miguel@gmail.com','$2y$12$Srq9MHeKXz7.TGDg1BXLSOd1tTXv8IuQxNlM8ZC//GngLOCIZxLq6','12412321','2024-03-01 16:01:04','A','2024-03-01 19:01:04');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-01 16:48:03
