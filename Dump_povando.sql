-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hospital
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_hora` datetime NOT NULL,
  `medico_id` int NOT NULL,
  `paciente_id` int NOT NULL,
  `valor_consulta` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `consultas_ibfk_1` (`medico_id`),
  KEY `consultas_ibfk_2` (`paciente_id`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
INSERT INTO `consultas` VALUES (1,'2015-05-01 08:50:00',2,1,0),(2,'2015-05-15 14:30:15',10,14,250),(3,'2015-06-27 09:00:30',4,4,0),(4,'2015-09-14 00:00:00',7,10,600),(5,'2015-10-24 00:00:00',5,14,300),(6,'2015-11-11 08:25:30',3,2,0),(7,'2015-12-25 13:50:14',8,5,250),(8,'2016-01-12 09:30:15',1,15,0),(9,'2016-03-01 16:00:02',6,3,240),(10,'2016-01-20 16:00:55',9,6,0),(11,'2016-03-14 12:15:20',8,13,0),(12,'2016-05-10 11:22:30',3,5,200),(13,'2016-06-10 14:30:15',9,10,280),(14,'2016-07-19 08:40:01',5,2,0),(15,'2016-09-11 16:30:14',2,4,0),(16,'2016-12-05 09:05:55',5,14,200),(17,'2017-01-15 10:44:40',7,9,300),(18,'2017-02-11 14:22:15',3,1,0),(19,'2017-04-12 08:22:15',8,15,0),(20,'2017-05-28 17:15:10',10,10,250);
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convenio`
--

DROP TABLE IF EXISTS `convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convenio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `CNPJ` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CNPJ` (`CNPJ`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convenio`
--

LOCK TABLES `convenio` WRITE;
/*!40000 ALTER TABLE `convenio` DISABLE KEYS */;
INSERT INTO `convenio` VALUES (1,'Amil','70501763000100'),(2,'Porto Seguro','69847008000194'),(3,'Unimed','26037319000185'),(4,'Os Bandeirantes','56584515000130'),(5,'Agiliza Saude','66985974000180'),(6,'Met Life','1922164000139'),(7,'Mais Saude','49815398000103');
/*!40000 ALTER TABLE `convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfer_inter`
--

DROP TABLE IF EXISTS `enfer_inter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfer_inter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `enfermeiro_id` int DEFAULT NULL,
  `internacao_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `enfermeiro_id` (`enfermeiro_id`),
  KEY `internacao_id` (`internacao_id`),
  CONSTRAINT `enfer_inter_ibfk_1` FOREIGN KEY (`enfermeiro_id`) REFERENCES `enfermeiro` (`id`),
  CONSTRAINT `enfer_inter_ibfk_2` FOREIGN KEY (`internacao_id`) REFERENCES `internacao` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfer_inter`
--

LOCK TABLES `enfer_inter` WRITE;
/*!40000 ALTER TABLE `enfer_inter` DISABLE KEYS */;
INSERT INTO `enfer_inter` VALUES (1,1,9),(2,5,9),(3,3,10),(4,5,10),(5,7,15),(6,10,15),(7,2,11),(8,4,11),(9,2,12),(10,6,12),(11,9,14),(12,8,14),(13,2,13),(14,8,13),(15,9,16),(16,10,16),(17,1,17),(18,3,17),(19,4,18),(20,5,18);
/*!40000 ALTER TABLE `enfer_inter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermeiro`
--

DROP TABLE IF EXISTS `enfermeiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermeiro` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `CRE` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `CRE` (`CRE`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermeiro`
--

LOCK TABLES `enfermeiro` WRITE;
/*!40000 ALTER TABLE `enfermeiro` DISABLE KEYS */;
INSERT INTO `enfermeiro` VALUES (1,'Lindomar da Paixão','89932294063','82624229027'),(2,'Valdirene Castanho','96748273072','40690787030'),(3,'Marcio Delgado','56377658044','51196651019'),(4,'Daniel Ferroz','75022229013','25693942031'),(5,'Manoela Caratin','24800512000','60500767076'),(6,'Eduardo Marçal','6845812055','86938492042'),(7,'Daniela Martin','69930444041','31454019042'),(8,'Caio Castanho','93520368080','50880737042'),(9,'Aline Flodeliz','22339113008','63446580026'),(10,'Joaquim Romeno','23403925005','43415676080');
/*!40000 ALTER TABLE `enfermeiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade`
--

DROP TABLE IF EXISTS `especialidade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome_especialidade` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade`
--

LOCK TABLES `especialidade` WRITE;
/*!40000 ALTER TABLE `especialidade` DISABLE KEYS */;
INSERT INTO `especialidade` VALUES (1,'Pediatra'),(2,'Clinico Geral'),(3,'Gastroentologia'),(4,'Dermatologista'),(5,'Ortondontia'),(6,'Obstetra'),(7,'Cardiaco'),(8,'Psiquiatra'),(9,'Ginecologista'),(10,'Oftalmologista');
/*!40000 ALTER TABLE `especialidade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especialidade_medico`
--

DROP TABLE IF EXISTS `especialidade_medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especialidade_medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `especialidade_id` int DEFAULT NULL,
  `medico_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `especialidade_id` (`especialidade_id`),
  KEY `medico_id` (`medico_id`),
  CONSTRAINT `especialidade_medico_ibfk_1` FOREIGN KEY (`especialidade_id`) REFERENCES `especialidade` (`id`),
  CONSTRAINT `especialidade_medico_ibfk_2` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidade_medico`
--

LOCK TABLES `especialidade_medico` WRITE;
/*!40000 ALTER TABLE `especialidade_medico` DISABLE KEYS */;
INSERT INTO `especialidade_medico` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5),(6,6,6),(7,7,7),(8,8,8),(9,9,9),(10,10,10);
/*!40000 ALTER TABLE `especialidade_medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `internacao`
--

DROP TABLE IF EXISTS `internacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `internacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `data_entrada` date NOT NULL,
  `data_prev_alta` date NOT NULL,
  `procedimento` varchar(200) NOT NULL,
  `medico_id` int DEFAULT NULL,
  `quarto_id` int DEFAULT NULL,
  `paciente_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `medico_id` (`medico_id`),
  KEY `quarto_id` (`quarto_id`),
  KEY `paciente_id` (`paciente_id`),
  CONSTRAINT `internacao_ibfk_1` FOREIGN KEY (`medico_id`) REFERENCES `medico` (`id`),
  CONSTRAINT `internacao_ibfk_2` FOREIGN KEY (`quarto_id`) REFERENCES `quarto` (`id`),
  CONSTRAINT `internacao_ibfk_3` FOREIGN KEY (`paciente_id`) REFERENCES `paciente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internacao`
--

LOCK TABLES `internacao` WRITE;
/*!40000 ALTER TABLE `internacao` DISABLE KEYS */;
INSERT INTO `internacao` VALUES (9,'2015-01-02','2015-01-19','IMPLANTE DE CATETER FEMORAL PARA HEMODIÁLISE',2,3,5),(10,'2015-02-14','2015-02-22','REALIZAÇÃO DE BLOQUEIOS NÃO CONVENCIONAIS PARA TRATAMENTO DE DOR',4,4,13),(11,'2015-02-21','2015-02-24','EXAMES DE TOMOGRAFIA COMPUTADORIZADA (POR SEGMENTO)',6,3,15),(12,'2015-03-25','2015-04-15','ANESTESIA GERAL PARA REALIZAÇÃO DE CURATIVOS DE QUEIMADOS',2,2,8),(13,'2015-06-11','2015-07-11','AVALIAÇÃO CLÍNICA DIÁRIA PARENTERAL',2,2,8),(14,'2015-08-12','2015-08-28','ECOCARDIOGRAMA DE STRESS FARMACOLÓGICO',7,4,7),(15,'2015-09-10','2015-10-11','EXAME CITOPATOLÓGICO ONCÓTICO DE LÍQUIDOS (ASCÍTICO, PLEURAL, URINA, ESCARRO, ETC.) E RASPADOS OU \"IMPRINT\" DE LESÕES (BOCA, OLHO, URETRA, VULVA, ENDOMÉTRIO, ETC.',2,2,3),(16,'2016-01-05','2016-01-12','ANESTESIA PARA A REALIZAÇÃO DE ELETROCONVULSOTERAPIA',7,2,6),(17,'2016-03-15','2016-04-16','AVALIAÇÃO CLÍNICA DIÁRIA ENTERAL',2,4,11),(18,'2016-07-15','2016-07-21','AVALIAÇÃO NUTRICIONAL COM BIOIMPEDANCIOMETRIA',2,4,11);
/*!40000 ALTER TABLE `internacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medico`
--

DROP TABLE IF EXISTS `medico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `data_nasc` date NOT NULL,
  `CRM` varchar(45) NOT NULL,
  `ESTADO` varchar(2) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `endereco` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `CRM` (`CRM`),
  UNIQUE KEY `telefone` (`telefone`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medico`
--

LOCK TABLES `medico` WRITE;
/*!40000 ALTER TABLE `medico` DISABLE KEYS */;
INSERT INTO `medico` VALUES (1,'Miguel Juan','1974-01-12','90.254','SP','1425426257','Rua Barentz, 29 - Jardim do Mar São Bernardo do Campo/SP - CEP 09750-630'),(2,'Arthur Lourenço','1980-09-15','10.254','RS','1945244951','Avenida Padre Virgílio Campelo, 150 Encosta Norte - CEP 08131-310 '),(3,'Gael Fianco','1956-08-20','14.265','MT','1922145624','Rua Ari da Rocha Miranda, 36 Conjunto Habitacional Jova Rural - CEP 02281-200'),(4,'Heitor Manoel','1978-04-17','13.144','MG','1554218754','Rua Itápolis, 389 Pacaembu - CEP 01245-000'),(5,'Theo Luiz','1985-06-11','50.665','DF','1199946654','Rua Barentz, 29 - Jardim do Mar São Bernardo do Campo/SP - CEP 09750-630'),(6,'Davi Gabriel','1991-07-19','75.255','BA','1998545425','Avenida do Contorno, 60 Metrô Itaquera - CEP 08220-380'),(7,'Gabriela Matarazo','1974-05-29','99.544','CE','1244558877','Rua João Ramalho, 295 Perdizes - CEP 05008-001'),(8,'Bernadete Gardenete','1985-06-20','41.562','DF','1511224455','Rua Maria Cândida, 1.813 Vila Guilherme - CEP 02071-013'),(9,'Samuel Weljacson','1990-02-25','51.254','AM','3274589636','Rua Heitor, 228 Centro de Itaquera - CEP 08210-160'),(10,'João Miguel','1999-03-01','70.845','AL','1914523674','Rua Taguá, 106 Liberdade - CEP 01508-010');
/*!40000 ALTER TABLE `medico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente`
--

DROP TABLE IF EXISTS `paciente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) NOT NULL,
  `data_nasc` date NOT NULL,
  `endereco` varchar(200) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `e_mail` varchar(100) DEFAULT NULL,
  `CPF` varchar(11) NOT NULL,
  `RG` varchar(20) NOT NULL,
  `se_convenio` char(1) NOT NULL,
  `convenio_id` int DEFAULT NULL,
  `numb_cart_pac` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `telefone` (`telefone`),
  UNIQUE KEY `CPF` (`CPF`),
  UNIQUE KEY `RG` (`RG`),
  UNIQUE KEY `e_mail` (`e_mail`),
  UNIQUE KEY `numb_cart_pac` (`numb_cart_pac`),
  KEY `convenio_id` (`convenio_id`),
  CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente`
--

LOCK TABLES `paciente` WRITE;
/*!40000 ALTER TABLE `paciente` DISABLE KEYS */;
INSERT INTO `paciente` VALUES (1,'Dante Silva','1995-05-25','Praça da Gardênia, 4, Centro, Alphavile, Barueri','5429163249','Dante@realweb.com.br','54534394080','374854208','S',1,'85531427209'),(2,'Thales Galileu','1974-04-01','Alameda Araguaia, 101, Alphavile, Barueri','56989656025',NULL,'99575485068','280185753','S',4,'16295558489'),(3,'Yago Marcondes','2000-03-19','Rua dos Marianos, 234, Centro, Osasco ','6725635070',NULL,'99275200696','237179039','S',2,'31359310150'),(4,'José Leopoldo','1984-07-29','R.Antártico, 117 V.Reginalice, Diadema','8325298575','Yago_Marcondes@mail.com','96970225429','494649458','S',3,'75411347804'),(5,'Estevão Amarante','2013-04-14','R. João Batista Medina, 1585, Cid JD Cumbica, Embu das Artes','83983604581','joseLeopoldo@santarte.com','68782088403','394494519','N',NULL,NULL),(6,'Ruan Duales','1987-09-27','R. Niterói, 68, Centro, S.C.S','67984333560',NULL,'56279496511','498004740','S',7,'34864847160'),(7,'Rodrigo Takahama','1978-04-06','R. Amazonas, 1187, Centro, S.B.C','8636084952','Takahama@econe.com.br','84999614952','123917402','S',7,'57857954648'),(8,'Helena Miague','2009-04-27','R.Rafael Corria Sampaio, 270, Centro, S.C.S','8698445165','Helena_miague@hotmail.com','20454469721','109830568','S',5,'10969555153'),(9,'Alice Dertonio','2015-01-08','Av.Elias Yasbek, 2617, Centro, Guarulhos','6529890327','AliceDer_gmail.com','93100873580','156520722','N',NULL,NULL),(10,'Laura Manoeli','2020-04-16','R.Tasman, 448, Jd do Mar, S.B.C','65999601067','LauraManoeli@gmail.com','1464373140','295958893','N',NULL,NULL),(11,'Manuela Beutran','2014-01-06','R. João Batista Medina, 1585, Cid JD Cumbica, Embu das Artes','9238144838',NULL,'72645462928','474742568','S',6,'28640072208'),(12,'Isabella Belgine','1965-09-22','R. João Basso, 405, Centro, Poá','92991947825',NULL,'33400330809','185194369','S',1,'83925377549'),(13,'Sophia Martins','1977-12-15','R. Cavadas, 137, Itapegica, Osasco','9528525794',NULL,'46162865584','388268463','S',2,'36963228731'),(14,'Luisa Limas','1999-11-01','R. Marcelino Bruneti, 190 Jd. Santa Fé, Mogi das Cruzes','95995354110','Luisa-90@bitco.cc','53916382160','166424894','N',NULL,NULL),(15,'Heloisa Lopes','1994-01-27','R. Orense, 712, Centro, Diadema','8128186197','Heloisa-lopes72@lavabit.com','77940149130','499002313','S',2,'82654213024');
/*!40000 ALTER TABLE `paciente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paciente_convenio`
--

DROP TABLE IF EXISTS `paciente_convenio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paciente_convenio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `convenio_id` int DEFAULT NULL,
  `consultas_id` int DEFAULT NULL,
  `tempo_carencia` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `convenio_id` (`convenio_id`),
  KEY `consultas_id` (`consultas_id`),
  CONSTRAINT `paciente_convenio_ibfk_1` FOREIGN KEY (`convenio_id`) REFERENCES `convenio` (`id`),
  CONSTRAINT `paciente_convenio_ibfk_2` FOREIGN KEY (`consultas_id`) REFERENCES `consultas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=102 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paciente_convenio`
--

LOCK TABLES `paciente_convenio` WRITE;
/*!40000 ALTER TABLE `paciente_convenio` DISABLE KEYS */;
INSERT INTO `paciente_convenio` VALUES (81,1,1,'2018-09-20'),(82,3,3,'2016-06-11'),(83,4,6,'2017-01-29'),(94,3,15,'2018-02-28'),(95,7,10,'2019-08-17'),(96,2,11,'2017-05-20'),(97,2,11,'2017-05-20'),(98,4,14,'2016-06-11'),(99,2,15,'2017-09-20'),(100,1,18,'2018-09-20'),(101,6,19,'2019-10-11');
/*!40000 ALTER TABLE `paciente_convenio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quarto`
--

DROP TABLE IF EXISTS `quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `quarto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `numero` varchar(2) DEFAULT NULL,
  `tipo_quarto_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `numero` (`numero`),
  KEY `tipo_quarto_id` (`tipo_quarto_id`),
  CONSTRAINT `quarto_ibfk_1` FOREIGN KEY (`tipo_quarto_id`) REFERENCES `tipo_quarto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quarto`
--

LOCK TABLES `quarto` WRITE;
/*!40000 ALTER TABLE `quarto` DISABLE KEYS */;
INSERT INTO `quarto` VALUES (2,'A1',2),(3,'A2',3),(4,'A3',4);
/*!40000 ALTER TABLE `quarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receita`
--

DROP TABLE IF EXISTS `receita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `receita` (
  `id` int NOT NULL AUTO_INCREMENT,
  `medicamentos` varchar(100) NOT NULL,
  `quantidade` varchar(100) NOT NULL,
  `receita_remedio` varchar(100) NOT NULL,
  `consultas_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `consultas_id` (`consultas_id`),
  CONSTRAINT `receita_ibfk_1` FOREIGN KEY (`consultas_id`) REFERENCES `consultas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receita`
--

LOCK TABLES `receita` WRITE;
/*!40000 ALTER TABLE `receita` DISABLE KEYS */;
INSERT INTO `receita` VALUES (1,'Dipirona','500 MG','Tomar 2 vezes ao dia se tiver dor de 12h em 12h',1),(2,'Vitamina C','500 mg','Tomar 1  comp 1x dia por 15 dias',1),(3,'Amoxilina','500 mg','Tomar 1 cap a cada 8h por 14 dias',2),(4,'Albenzadol','400 mg','Tomar 1 cap Mastigavel por 7 dias',2),(5,'Catopril','25 mg','Tomar 1 comp a cada 4 horas por 20 dias',4),(6,'Vitamina C','500 mg','Tomar 1  comp 1x dia por 15 dias',4),(7,'Diazepam','10 mg','Tomar 1 com por dia por 7 dias',5),(8,'Paracetamol','500 mg','Tomar 3 comprimidos ao dia a cada 8 horas se tiver dor',6),(9,'Ratinidina','150 mg','Tomar 1 comp por dia durante 5 dias',6),(10,'Ibuprofeno','300 mg','Tomar 2 Comp por dia se tiver dor',7),(11,'Metildopa','250 mg','Tomar 4 comp por 15 dias de 6h em 6h',8),(12,'Vitamina C','50 mg','Tomar 2 Cap por dia duarante 30 dias',8),(13,'Dipirona','500 MG','Tomar 2 comp por dia ou 30 gostas a cada 12h',10),(14,'Enalapril','10 mg','Tomar 2 comp por dia a cada 8h por 5 dias',13),(15,'Furosemida','40 mg','Tomar 1 comp por dia durante 10 dias',13),(16,'Losartana','50 mg','Tomar 2 cap por dia a cada 8 horas durante 30 dias',15);
/*!40000 ALTER TABLE `receita` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_quarto`
--

DROP TABLE IF EXISTS `tipo_quarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_quarto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(200) NOT NULL,
  `valor_diaria` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_quarto`
--

LOCK TABLES `tipo_quarto` WRITE;
/*!40000 ALTER TABLE `tipo_quarto` DISABLE KEYS */;
INSERT INTO `tipo_quarto` VALUES (2,'Quarto semiprivativo: dois pacientes por quarto, banheiro privativo, poltrona para acompanhante, ar-condicionado, wireless e TV.',100.00),(3,'Quarto privativo: um paciente por quarto, banheiro privativo, acomodações para acompanhante, ar condicionado, frigobar, telefone, wireless e TV com NET.',220.00),(4,'Suíte: um paciente por quarto, antessala, acomodação para acompanhante, frigobar, telefone, wireless, TV com NET, ar condicionado e banheiro privativo.',315.00);
/*!40000 ALTER TABLE `tipo_quarto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-21 22:01:28
