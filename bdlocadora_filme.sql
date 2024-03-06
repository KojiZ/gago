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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `filme`
--

LOCK TABLES `filme` WRITE;
/*!40000 ALTER TABLE `filme` DISABLE KEYS */;
INSERT INTO `filme` VALUES (1,1,'Fast and Furious 2','fast-2.jpg','Former police officer Brian O\'Conner moves from Los Angeles to Miami to start his life over. He ends up getting involved in fights in his new city with his friend Tej and Suki.','2024-03-01 13:10:48','A','2024-03-04 16:53:38'),(2,2,'    Clube da luta','acao-1.png','A depressed man suffering from insomnia meets a strange salesman named Tyler Durden and finds himself living in a dirty house after his perfect apartment is destroyed.','2024-03-01 14:13:05','A','2024-03-01 19:14:26'),(4,1,'Fast and Furious 3','corrida-1.jpg','Sean Boswell is a street racer who challenges his rival and crashes his car at the end of the race. He decides to move to Japan to avoid arrest in the United States, as rachas are not at all popular with the authorities.','2024-03-04 13:39:00','A','2024-03-04 16:39:00'),(5,3,' Indiana Jones','indiana.jpg','Archaeologist Indiana Jones needs to find the Ark of the Covenant, a biblical relic that contains the ten commandments','2024-03-04 13:41:39','A','2024-03-04 16:54:39'),(7,6,'Taxi Driver','14-cartaz.jpg','New York taxi driver Travis Bickle, a Vietnam War veteran, constantly reflects on the corruption of life around him and feels increasingly disturbed by his own loneliness and alienation.','2024-03-04 15:08:16','A','2024-03-04 18:08:16'),(8,2,'Maze Runner','aventura-3-maze.jpg','In an apocalyptic future, young Thomas is chosen to face the system. He wakes up in a dark, moving elevator and can\'t even remember his name.','2024-03-04 15:09:11','A','2024-03-04 18:09:11'),(9,3,'Rio','aventura-1-rio.jpeg','Captured by animal smugglers when she was just born, Blu the macaw never learned to fly and lives a happy domesticated life in Minnesota, United States, with her owner, Linda.','2024-03-04 15:10:01','A','2024-03-04 18:10:01'),(10,5,'Lights Out','04-cartaz.jpg','Rebecca left the house and thought she would forget her childhood fears, as she never knew what was real and what wasn\'t when the lights went out.','2024-03-04 15:10:47','A','2024-03-04 18:10:47'),(11,7,'Grown Ups','24-cartaz.jpg','Google users The death of old friends\' childhood basketball coach brings the gang together in the same place they celebrated a championship years ago. The friends, accompanied by their wives and children, discover that age does not mean the same','2024-03-04 15:12:37','A','2024-03-04 18:12:37'),(12,7,'We\'re the Millers','23-cartaz.jpg','Drug dealer David needs to go to Mexico to pick up a shipment of marijuana. To improve his chances of crossing the border, he asks a stripper and two local teenagers to accompany him and pretend they are a family on vacation.','2024-03-04 15:13:41','A','2024-03-04 18:13:41'),(13,2,'Lucy','12-cartaz.jpg','Lucy is forced to smuggle drugs inside her stomach. But the young woman\'s body absorbs the substances and she starts to have superpowers, such as telepathy, telekinesis, the absence of pain and the ability to acquire knowledge instantly.','2024-03-04 15:15:08','A','2024-03-04 18:15:08');
/*!40000 ALTER TABLE `filme` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-06 13:08:37
