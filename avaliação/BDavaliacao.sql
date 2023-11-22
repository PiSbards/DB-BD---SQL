-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: bdavaliacao
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
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `codigo_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`codigo_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Congresso'),(2,'Simpósio'),(3,'Feira'),(4,'Semana Acadêmica'),(5,'Encontro');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `codigo_evento` int(11) NOT NULL AUTO_INCREMENT,
  `nome_evento` varchar(60) DEFAULT NULL,
  `local_evento` varchar(100) DEFAULT NULL,
  `data_evento` date DEFAULT NULL,
  `email_evento` varchar(50) DEFAULT NULL,
  `codigo_categoria` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_evento`),
  KEY `codigo_categoria` (`codigo_categoria`),
  CONSTRAINT `evento_ibfk_1` FOREIGN KEY (`codigo_categoria`) REFERENCES `categoria` (`codigo_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Semana de TI','Senai','2017-09-13','semanati@evento.br',4),(2,'Simpósio de Eletrônica','Senai','2017-07-20','Eletronica@teste.com.br',2),(3,'Semana Acadêmica','Faculdade Albert Einstein','2017-05-31','albert@einstein.com.br',4),(4,'Feira Metal Mecânica','Parque de Exposição','2017-09-01','metal@mecanica.com.br',3),(5,'Simpósio de Filosofia','Unicesumar','2023-10-17','simposiofilosofia@cesu.br',2),(6,'Congresso de Direito','UEM','2023-09-14','congressodtouem@uem.org.br',1);
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante`
--

DROP TABLE IF EXISTS `participante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante` (
  `codigo_participante` int(11) NOT NULL AUTO_INCREMENT,
  `nome_participante` varchar(60) DEFAULT NULL,
  `logradouro` varchar(60) DEFAULT NULL,
  `numero` varchar(10) DEFAULT NULL,
  `bairro` varchar(50) DEFAULT NULL,
  `cidade` varchar(50) DEFAULT NULL,
  `estado` varchar(2) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`codigo_participante`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante`
--

LOCK TABLES `participante` WRITE;
/*!40000 ALTER TABLE `participante` DISABLE KEYS */;
INSERT INTO `participante` VALUES (1,'João Silva','Rua Alegria','123','Centro','São Paulo','SP','joao.silva@example.com'),(2,'Maria Santos','Avenida Paz','456','Vila Feliz','Rio de Janeiro','RJ','maria.santos@example.com'),(3,'Pedro Souza','Travessa Amizade','789','Bairro Novo','Belo Horizonte','MG','pedro.souza@example.com'),(4,'Ana Pereira','Alameda Esperança','101','Cidade Alta','Porto Alegre','RS','ana.pereira@example.com'),(5,'Lucas Ferreira','Rua Harmonia','112','Bairro Sol','Curitiba','PR','lucas.ferreira@example.com'),(6,'Mariana Costa','Avenida Felicidade','131','Cidade Nova','Salvador','BA','mariana.costa@example.com'),(7,'Felipe Santos','Rua União','142','Cidade Baixa','Florianópolis','SC','felipe.santos@example.com'),(8,'Carla Oliveira','Travessa União','155','Bairro Sul','Fortaleza','CE','carla.oliveira@example.com'),(9,'Rafael Rodrigues','Avenida Esperança','167','Vila Bela','Recife','PE','rafael.rodrigues@example.com'),(10,'Isabel Almeida','Rua Harmonia','180','Centro','Belém','PA','isabel.almeida@example.com');
/*!40000 ALTER TABLE `participante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participante_inscricao`
--

DROP TABLE IF EXISTS `participante_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `participante_inscricao` (
  `cod_part_insc` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_participante` int(11) DEFAULT NULL,
  `codigo_tipo` int(11) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL,
  `data_inscricao` date DEFAULT NULL,
  PRIMARY KEY (`cod_part_insc`),
  KEY `codigo_participante` (`codigo_participante`),
  KEY `codigo_tipo` (`codigo_tipo`),
  CONSTRAINT `participante_inscricao_ibfk_1` FOREIGN KEY (`codigo_participante`) REFERENCES `participante` (`codigo_participante`),
  CONSTRAINT `participante_inscricao_ibfk_2` FOREIGN KEY (`codigo_tipo`) REFERENCES `tipo_inscricao` (`codigo_tipo`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participante_inscricao`
--

LOCK TABLES `participante_inscricao` WRITE;
/*!40000 ALTER TABLE `participante_inscricao` DISABLE KEYS */;
INSERT INTO `participante_inscricao` VALUES (1,1,5,'AB','2023-05-30'),(2,2,2,'PA','2017-06-29'),(3,3,6,'AB','2023-03-28'),(4,4,3,'CA','2017-02-27'),(5,5,1,'PA','2017-01-26'),(6,6,5,'AB','2023-04-25'),(7,7,5,'CA','2023-03-24'),(8,8,6,'AB','2023-05-23'),(9,9,4,'PA','2017-04-22'),(10,10,6,'CA','2023-03-21');
/*!40000 ALTER TABLE `participante_inscricao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_inscricao`
--

DROP TABLE IF EXISTS `tipo_inscricao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_inscricao` (
  `codigo_tipo` int(11) NOT NULL AUTO_INCREMENT,
  `codigo_evento` int(11) DEFAULT NULL,
  `valor_tipo` int(11) DEFAULT NULL,
  PRIMARY KEY (`codigo_tipo`),
  KEY `codigo_evento` (`codigo_evento`),
  CONSTRAINT `tipo_inscricao_ibfk_1` FOREIGN KEY (`codigo_evento`) REFERENCES `evento` (`codigo_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_inscricao`
--

LOCK TABLES `tipo_inscricao` WRITE;
/*!40000 ALTER TABLE `tipo_inscricao` DISABLE KEYS */;
INSERT INTO `tipo_inscricao` VALUES (1,1,80),(2,1,98),(3,2,30),(4,2,40),(5,3,150),(6,3,180),(7,4,90),(8,4,140);
/*!40000 ALTER TABLE `tipo_inscricao` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-20 21:44:55
