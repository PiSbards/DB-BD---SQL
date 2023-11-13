-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

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
-- Table structure for table `aluno`
--

DROP TABLE IF EXISTS `aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aluno` (
  `id_aluno` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `fone` varchar(20) DEFAULT NULL,
  `celular` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_aluno`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aluno`
--

LOCK TABLES `aluno` WRITE;
/*!40000 ALTER TABLE `aluno` DISABLE KEYS */;
INSERT INTO `aluno` VALUES (1,'Jorge','jorge@jorge','999999','15668574321'),(2,'luizinho','luizinho@email','222222222','22222222'),(3,'Zezinho','zezinho@email','3333333','3333333'),(4,'Pedro','peter@email','444444444','444444444'),(5,'Moises','moises@email','33335498','77779841651');
/*!40000 ALTER TABLE `aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emprestimo`
--

DROP TABLE IF EXISTS `emprestimo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `emprestimo` (
  `id_emprestimo` int(11) NOT NULL AUTO_INCREMENT,
  `aluno_id_aluno` int(11) DEFAULT NULL,
  `livro_id_livro` int(11) DEFAULT NULL,
  `data_emprestimo` date DEFAULT NULL,
  `data_devolucao` date DEFAULT NULL,
  `multa` decimal(5,2) DEFAULT NULL,
  `nome_funcionario` varchar(45) NOT NULL,
  `numero_copia` int(11) NOT NULL,
  PRIMARY KEY (`id_emprestimo`),
  KEY `aluno_id_aluno` (`aluno_id_aluno`),
  KEY `livro_id_livro` (`livro_id_livro`),
  CONSTRAINT `emprestimo_ibfk_1` FOREIGN KEY (`aluno_id_aluno`) REFERENCES `aluno` (`id_aluno`),
  CONSTRAINT `emprestimo_ibfk_2` FOREIGN KEY (`livro_id_livro`) REFERENCES `livro` (`id_livro`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emprestimo`
--

LOCK TABLES `emprestimo` WRITE;
/*!40000 ALTER TABLE `emprestimo` DISABLE KEYS */;
INSERT INTO `emprestimo` VALUES (1,5,2,'2023-09-19','2023-09-26',NULL,'Sérgio',5),(2,4,5,'2023-08-21','2023-08-28',30.50,'Alex',2),(3,3,4,'2023-05-17','2023-05-24',150.50,'Alex',2),(4,1,1,'2022-09-30','2022-10-07',500.00,'Sérgio',5),(5,2,3,'2023-09-19','2023-09-26',NULL,'Sérgio',2);
/*!40000 ALTER TABLE `emprestimo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livro`
--

DROP TABLE IF EXISTS `livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `livro` (
  `id_livro` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) DEFAULT NULL,
  `autor` varchar(50) DEFAULT NULL,
  `id_assunto` int(11) DEFAULT NULL,
  `lancamento` date DEFAULT NULL,
  `copias` int(11) DEFAULT NULL,
  `ISBN` varchar(10) NOT NULL,
  `valor_pago` decimal(6,2) DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  KEY `id_assunto` (`id_assunto`),
  CONSTRAINT `livro_ibfk_1` FOREIGN KEY (`id_assunto`) REFERENCES `tipo_livro` (`id_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livro`
--

LOCK TABLES `livro` WRITE;
/*!40000 ALTER TABLE `livro` DISABLE KEYS */;
INSERT INTO `livro` VALUES (1,'Jorge e os jorginhos','Jorge',1,'1999-12-03',5,'7825',35.15),(2,'Senhor dos Anéis','Tolkien',5,'1954-07-29',5,'7321',85.50),(3,'Pedrinho no espaço','Pedro',4,'2002-05-07',2,'2656',32.25),(4,'Amanda e Jorge','Jorge',2,'2020-07-02',3,'7828',32.25),(5,'Super Jorge','Giorge',3,'2023-02-15',10,'1597',15.50);
/*!40000 ALTER TABLE `livro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_livro`
--

DROP TABLE IF EXISTS `tipo_livro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_livro` (
  `id_assunto` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) DEFAULT NULL,
  `data_registro` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_assunto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_livro`
--

LOCK TABLES `tipo_livro` WRITE;
/*!40000 ALTER TABLE `tipo_livro` DISABLE KEYS */;
INSERT INTO `tipo_livro` VALUES (1,'Comédia','2023-09-19 22:55:21'),(2,'Romance','2023-09-19 22:55:21'),(3,'Aventura','2023-09-19 22:55:21'),(4,'Sci-Fi','2023-09-19 22:55:21'),(5,'Fantasia','2023-09-19 22:55:21');
/*!40000 ALTER TABLE `tipo_livro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-19 22:04:52
