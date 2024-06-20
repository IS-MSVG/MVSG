-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 39.104.112.98    Database: msvg_test
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `call_chain`
--

DROP TABLE IF EXISTS `call_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_chain` (
  `uri` varchar(300) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `chain_id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chain_id`),
  KEY `call_chain_m_service_service_name_fk` (`service`),
  CONSTRAINT `call_chain_m_service_service_name_fk` FOREIGN KEY (`service`) REFERENCES `m_service` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_chain`
--

LOCK TABLES `call_chain` WRITE;
/*!40000 ALTER TABLE `call_chain` DISABLE KEYS */;
INSERT INTO `call_chain` VALUES ('/api/v1/foods/{date}/{startStation}/{endStation}/{tripId}','get',1,'ts-food-service'),('/api/agent1/chain/one','get',2,'agent-test1'),('/api/agent1/chain/two','get',3,'agent-test1'),('/api/agent1/chain/three','get',4,'agent-test1'),('/api/agent2/chain/one','get',5,'agent-test2'),('/api/agent2/chain/two','get',6,'agent-test2'),('/api/agent3/chain/one','get',7,'agent-test3'),('/api/agent2/chain/zero','get',8,'agent-test2'),('/api/agent3/chain/zero','get',9,'agent-test3');
/*!40000 ALTER TABLE `call_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `call_chain_node`
--

DROP TABLE IF EXISTS `call_chain_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `call_chain_node` (
  `node_id` int NOT NULL AUTO_INCREMENT,
  `chain_id` int DEFAULT NULL,
  `from_service` varchar(100) DEFAULT NULL,
  `from_version` varchar(30) DEFAULT NULL,
  `to_service` varchar(100) DEFAULT NULL,
  `to_version` varchar(30) DEFAULT NULL,
  `uri` varchar(300) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  KEY `call_chain_node_call_chain_chain_id_fk` (`chain_id`),
  CONSTRAINT `call_chain_node_call_chain_chain_id_fk` FOREIGN KEY (`chain_id`) REFERENCES `call_chain` (`chain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `call_chain_node`
--

LOCK TABLES `call_chain_node` WRITE;
/*!40000 ALTER TABLE `call_chain_node` DISABLE KEYS */;
INSERT INTO `call_chain_node` VALUES (1,1,'ts-food-service','v1.0.0','ts-trainfood-service','v1.0.0','/api/v1/trainfoodservice/trainfoods/{tripId}','get'),(2,1,'ts-food-service','v1.0.0','ts-travel-service','v1.0.0','/api/v1/travelservice/routes/{tripId}','get'),(3,1,'ts-food-service','v1.0.0','ts-stationfood-service','v1.0.0','/api/v1/stationfoodservice/stationfoodstores','post'),(4,2,'agent-test1','v1.0.0','agent-test2','v1.0.0','/api/agent2/chain/zero','get'),(5,3,'agent-test1','v1.0.0','agent-test2','v1.0.0','/api/agent2/chain/one','get'),(6,3,'agent-test2','v1.0.0','agent-test3','v1.0.0','/api/agent3/chain/zero','get'),(7,4,'agent-test1','v1.0.0','agent-test2','v1.0.0','/api/agent2/chain/one','get'),(8,4,'agent-test1','v1.0.0','agent-test3','v1.0.0','/api/agent3/chain/zero','get'),(9,4,'agent-test2','v1.0.0','agent-test3','v1.0.0','/api/agent3/chain/zero','get'),(10,5,'agent-test2','v1.0.0','agent-test3','v1.0.0','/api/agent3/chain/zero','get'),(11,6,'agent-test2','v1.0.0','agent-test3','v1.0.0','/api/agent3/chain/one','get'),(12,6,'agent-test3','v1.0.0','agent-test2','v1.0.0','/api/agent2/chain/zero','get'),(13,7,'agent-test3','v1.0.0','agent-test2','v1.0.0','/api/agent2/chain/zero','get');
/*!40000 ALTER TABLE `call_chain_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execute_chain`
--

DROP TABLE IF EXISTS `execute_chain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `execute_chain` (
  `uri` varchar(300) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `chain_id` int NOT NULL AUTO_INCREMENT,
  `service` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`chain_id`),
  KEY `execute_chain_m_service_service_name_fk` (`service`),
  CONSTRAINT `execute_chain_m_service_service_name_fk` FOREIGN KEY (`service`) REFERENCES `m_service` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execute_chain`
--

LOCK TABLES `execute_chain` WRITE;
/*!40000 ALTER TABLE `execute_chain` DISABLE KEYS */;
INSERT INTO `execute_chain` VALUES ('/api/v1/foods/{date}/{startStation}/{endStation}/{tripId}','get',1,'ts-food-service'),('/api/agent1/chain/one','get',2,'agent-test1'),('/api/agent1/chain/two','get',3,'agent-test1'),('/api/agent1/chain/three','get',4,'agent-test1'),('/api/agent2/chain/one','get',5,'agent-test2'),('/api/agent2/chain/two','get',6,'agent-test2'),('/api/agent3/chain/one','get',7,'agent-test3'),('/api/agent2/chain/zero','get',8,'agent-test2'),('/api/agent3/chain/zero','get',9,'agent-test3');
/*!40000 ALTER TABLE `execute_chain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `execute_chain_node`
--

DROP TABLE IF EXISTS `execute_chain_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `execute_chain_node` (
  `node_id` int NOT NULL AUTO_INCREMENT,
  `chain_id` int DEFAULT NULL,
  `from_service` varchar(100) DEFAULT NULL,
  `to_instance_ip` varchar(20) DEFAULT NULL,
  `to_instance_port` int DEFAULT NULL,
  `uri` varchar(300) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`node_id`),
  KEY `execute_chain_node_execute_chain_chain_id_fk` (`chain_id`),
  CONSTRAINT `execute_chain_node_execute_chain_chain_id_fk` FOREIGN KEY (`chain_id`) REFERENCES `execute_chain` (`chain_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `execute_chain_node`
--

LOCK TABLES `execute_chain_node` WRITE;
/*!40000 ALTER TABLE `execute_chain_node` DISABLE KEYS */;
INSERT INTO `execute_chain_node` VALUES (1,1,'ts-food-service','192.168.12.21',56786,'/api/v1/trainfoodservice/trainfoods/{tripId}','get'),(2,1,'ts-food-service','192.168.12.12',56800,'/api/v1/travelservice/routes/{tripId}','get'),(3,1,'ts-food-service','192.168.12.12',56787,'/api/v1/stationfoodservice/stationfoodstores','post'),(4,2,'agent-test1','172.24.58.115',15705,'/api/agent2/chain/zero','get'),(5,3,'agent-test1','172.24.58.115',15705,'/api/agent2/chain/one','get'),(6,3,'agent-test2','172.24.58.115',15703,'/api/agent3/chain/zero','get'),(7,4,'agent-test1','172.24.58.115',15705,'/api/agent2/chain/one','get'),(8,4,'agent-test1','172.24.58.115',15703,'/api/agent3/chain/zero','get'),(9,4,'agent-test2','172.24.58.115',15703,'/api/agent3/chain/zero','get'),(10,5,'agent-test2','172.24.58.115',15703,'/api/agent3/chain/zero','get'),(11,6,'agent-test2','172.24.58.115',15703,'/api/agent3/chain/one','get'),(12,6,'agent-test3','172.24.58.115',15705,'/api/agent2/chain/zero','get'),(13,7,'agent-test3','172.24.58.115',15705,'/api/agent2/chain/zero','get');
/*!40000 ALTER TABLE `execute_chain_node` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingress`
--

DROP TABLE IF EXISTS `ingress`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ingress` (
  `id` int NOT NULL AUTO_INCREMENT,
  `api_version` varchar(50) DEFAULT NULL,
  `kind` varchar(30) DEFAULT NULL,
  `metadata` text,
  `spec` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingress`
--

LOCK TABLES `ingress` WRITE;
/*!40000 ALTER TABLE `ingress` DISABLE KEYS */;
INSERT INTO `ingress` VALUES (1,'networking.istio.io/v1alpha3','Gateway','{\"name\": \"service-gateway\"}','{\"selector\":{\"istio\":\"ingressgateway\"},\"server\":{\"port\":{\"number\":80,\"name\":\"http\",\"protocol\":\"HTTP\"},\"hosts\":[\"*\"]}}'),(2,'networking.istio.io/v1alpha3','VirtualService','{\"name\": \"service\"}','{\"id\":1,\"hosts\":\"*\",\"gateways\":\"service-gateway\",\"http\":\"{\\\"id\\\":0,\\\"name\\\":\\\"service-/**-v0.0.1\\\",\\\"uriMatch\\\":\\\"{\\\\\\\"match\\\\\\\":{\\\\\\\"uri\\\\\\\":{\\\\\\\"prefix\\\\\\\":\\\\\\\"/**\\\\\\\"},\\\\\\\"headers\\\\\\\":{\\\\\\\"x-request-version\\\\\\\":\\\\\\\"v0.0.1\\\\\\\"}}}\\\",\\\"rewrite\\\":null,\\\"route\\\":null,\\\"redirect\\\":null,\\\"specId\\\":1,\\\"new\\\":false}\",\"ingressId\":2,\"new\":false}');
/*!40000 ALTER TABLE `ingress` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instance`
--

DROP TABLE IF EXISTS `instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instance` (
  `service_id` int DEFAULT NULL,
  `version_id` int DEFAULT NULL,
  `ip` varchar(30) DEFAULT NULL,
  `port` int DEFAULT NULL,
  `healthy` int DEFAULT NULL,
  `instance_id` int NOT NULL AUTO_INCREMENT,
  `service_name` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`instance_id`),
  KEY `instance_m_service_service_id_fk` (`service_id`),
  KEY `instance_m_service_service_name_fk` (`service_name`),
  KEY `instance_m_service_version_version_id_fk` (`version_id`),
  CONSTRAINT `instance_m_service_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `m_service` (`service_id`),
  CONSTRAINT `instance_m_service_service_name_fk` FOREIGN KEY (`service_name`) REFERENCES `m_service` (`service_name`),
  CONSTRAINT `instance_m_service_version_version_id_fk` FOREIGN KEY (`version_id`) REFERENCES `m_service_version` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instance`
--

LOCK TABLES `instance` WRITE;
/*!40000 ALTER TABLE `instance` DISABLE KEYS */;
INSERT INTO `instance` VALUES (2,2,'192.168.12.21',56808,0,1,'ts-seat-service'),(2,2,'192.168.12.12',56808,0,2,'ts-seat-service'),(2,4,'192.168.12.21',56807,0,3,'ts-seat-service'),(2,5,'192.168.12.12',56806,0,4,'ts-seat-service'),(2,7,'192.168.12.12',56807,0,5,'ts-seat-service'),(2,8,'192.168.12.21',56805,0,6,'ts-seat-service'),(2,14,'192.168.12.12',56805,0,7,'ts-seat-service'),(3,3,'192.168.12.21',56804,0,8,'ts-price-service'),(3,6,'192.168.12.12',56804,0,9,'ts-price-service'),(4,9,'192.168.12.21',56803,0,10,'ts-order-service'),(5,10,'192.168.12.12',56803,0,11,'ts-basic-service'),(5,10,'192.168.12.21',56802,0,12,'ts-basic-service'),(6,11,'192.168.12.12',56802,0,13,'ts-config-service'),(7,12,'192.168.12.21',56801,0,14,'ts-route-service'),(5,10,'192.168.12.12',56801,0,15,'ts-basic-service'),(8,13,'192.168.12.21',56800,0,16,'ts-station-service'),(9,15,'192.168.12.12',56800,0,17,'ts-travel-service'),(9,18,'192.168.12.21',56799,0,18,'ts-travel-service'),(9,21,'192.168.12.12',56799,0,19,'ts-travel-service'),(10,23,'192.168.12.21',56798,0,20,'ts-adminbasics-ervice'),(11,24,'192.168.12.12',56798,0,21,'ts-adminorder-service'),(12,25,'192.168.12.21',56797,0,22,'ts-adminrouter-service'),(13,26,'192.168.12.12',56797,0,23,'ts-admintravel-service'),(14,27,'192.168.12.21',56796,0,24,'ts-adminuser-service'),(15,28,'192.168.12.12',56796,0,25,'ts-assurance-service'),(16,29,'192.168.12.21',56795,0,26,'ts-auth-service'),(17,30,'192.168.12.12',56795,0,27,'ts-cancel-service'),(18,31,'192.168.12.21',56794,0,28,'ts-consign-service'),(19,32,'192.168.12.12',56794,0,29,'ts-consignprice-service'),(20,33,'192.168.12.21',56793,0,30,'ts-contacts-service'),(21,34,'192.168.12.12',56793,0,31,'ts-execute-service'),(22,35,'192.168.12.21',56792,0,32,'ts-food-service'),(23,36,'192.168.12.12',56792,0,33,'ts-fooddelivery-service'),(24,37,'192.168.12.21',56791,0,34,'ts-insidepayment'),(25,38,'192.168.12.12',56791,0,35,'ts-notification-service'),(26,39,'192.168.12.21',56790,0,36,'ts-orderother-service'),(27,40,'192.168.12.12',56790,0,37,'ts-payment-service'),(28,41,'192.168.12.21',56789,0,38,'ts-preserve-service'),(29,42,'192.168.12.12',56789,0,39,'ts-preserveother-service'),(30,43,'192.168.12.21',56788,0,40,'ts-rebook-service'),(31,44,'192.168.12.12',56788,0,41,'ts-routeplan-service'),(32,45,'192.168.12.21',56787,0,42,'ts-security-service'),(33,46,'192.168.12.12',56787,0,43,'ts-stationfood-service'),(34,47,'192.168.12.21',56786,0,44,'ts-trainfood-service'),(35,48,'192.168.12.12',56786,0,45,'ts-travel2-service'),(36,49,'192.168.12.21',56785,0,46,'ts-travelplan-service'),(37,50,'192.168.12.12',56785,0,47,'ts-user-service'),(38,51,'192.168.12.21',56784,0,48,'ts-verification-service'),(39,52,'192.168.12.12',56784,0,49,'ts-waitlistorder-service'),(1,1,'192.168.1.1',55555,1,50,'service'),(22,35,'172.24.58.115',15964,0,52,'ts-food-service'),(22,53,'172.24.58.115',15693,0,53,'ts-food-service'),(44,58,'172.24.58.115',15704,0,54,'agent-test1'),(45,59,'172.24.58.115',15705,0,55,'agent-test2'),(43,57,'172.24.58.115',15703,0,56,'agent-test3');
/*!40000 ALTER TABLE `instance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `instance_view`
--

DROP TABLE IF EXISTS `instance_view`;
/*!50001 DROP VIEW IF EXISTS `instance_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `instance_view` AS SELECT 
 1 AS `service_id`,
 1 AS `version_id`,
 1 AS `major_version`,
 1 AS `minor_version`,
 1 AS `patch_version`,
 1 AS `ip`,
 1 AS `port`,
 1 AS `healthy`,
 1 AS `service_name`,
 1 AS `instance_id`,
 1 AS `description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `m_service`
--

DROP TABLE IF EXISTS `m_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_service` (
  `service_name` varchar(30) NOT NULL,
  `service_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  UNIQUE KEY `m_service_pk` (`service_name`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_service`
--

LOCK TABLES `m_service` WRITE;
/*!40000 ALTER TABLE `m_service` DISABLE KEYS */;
INSERT INTO `m_service` VALUES ('service',1,'demo service'),('ts-seat-service',2,'seat service of train-ticket'),('ts-price-service',3,'price service of train-ticket'),('ts-order-service',4,'order service of train-ticket'),('ts-basic-service',5,'basic service of train-ticket'),('ts-config-service',6,'config service of train-ticket'),('ts-route-service',7,'route service of train-ticket'),('ts-station-service',8,'station service of train-ticket'),('ts-travel-service',9,'travel service of train-ticket'),('ts-adminbasics-ervice',10,'admin basics service of train-ticket'),('ts-adminorder-service',11,'admin order service of train-ticket'),('ts-adminrouter-service',12,'admin router service of train-ticket'),('ts-admintravel-service',13,'admin travel service of train-ticket'),('ts-adminuser-service',14,'admin user service of train-ticket'),('ts-assurance-service',15,'assurance service of train-ticket'),('ts-auth-service',16,'auth service of train-ticket'),('ts-cancel-service',17,'cancel service of train-ticket'),('ts-consign-service',18,'consign service of train-ticket'),('ts-consignprice-service',19,'consign price service of train-ticket'),('ts-contacts-service',20,'contacts service of train-ticket'),('ts-execute-service',21,'execute service of train-ticket'),('ts-food-service',22,'food service of train-ticket'),('ts-fooddelivery-service',23,'food delivery service of train-ticket'),('ts-insidepayment',24,'inside payment service of train-ticket'),('ts-notification-service',25,'notification service of train-ticket'),('ts-orderother-service',26,'order other service of train-ticket'),('ts-payment-service',27,'payment service of train-ticket'),('ts-preserve-service',28,'preserve service of train-ticket'),('ts-preserveother-service',29,'preserve other service of train-ticket'),('ts-rebook-service',30,'rebook service of train-ticket'),('ts-routeplan-service',31,'route plan service of train-ticket'),('ts-security-service',32,'security service of train-ticket'),('ts-stationfood-service',33,'station food service of train-ticket'),('ts-trainfood-service',34,'train food service of train-ticket'),('ts-travel2-service',35,'travel2 service of train-ticket'),('ts-travelplan-service',36,'travel plan service of train-ticket'),('ts-user-service',37,'user service of train-ticket'),('ts-verification-service',38,'verification service of train-ticket'),('ts-waitlistorder-service',39,'wait list order service of train-ticket'),('agent-test3',43,'agent test service one'),('agent-test1',44,'agent test service two'),('agent-test2',45,'agent test service three');
/*!40000 ALTER TABLE `m_service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_service_interface`
--

DROP TABLE IF EXISTS `m_service_interface`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_service_interface` (
  `interface_id` int NOT NULL AUTO_INCREMENT,
  `uri` varchar(500) DEFAULT NULL,
  `compatible_marker` int DEFAULT NULL,
  `type` char(6) DEFAULT NULL,
  `version_id` int DEFAULT NULL,
  `interval` varchar(30) DEFAULT NULL,
  `task_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`interface_id`),
  KEY `m_service_interface_m_service_version_version_id_fk` (`version_id`),
  CONSTRAINT `m_service_interface_m_service_version_version_id_fk` FOREIGN KEY (`version_id`) REFERENCES `m_service_version` (`version_id`)
) ENGINE=InnoDB AUTO_INCREMENT=433 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_service_interface`
--

LOCK TABLES `m_service_interface` WRITE;
/*!40000 ALTER TABLE `m_service_interface` DISABLE KEYS */;
INSERT INTO `m_service_interface` VALUES (1,'/api/infos',1,'get',1,'0.0.1,0.0.1','io'),(2,'/api/infos',1,'post',1,'0.0.1,0.0.1','io'),(3,'/api/v1/seatservice/welcome',0,'get',2,'1.0.0,1.1.2','io'),(4,'/api/v1/seatservice/seats',0,'post',2,'1.0.0,1.1.2','io'),(5,'/api/v1/seatservice/seats/left_tickets',0,'post',2,'1.0.0,1.0.0','calculate'),(6,'/api/v1/priceservice/prices/welcome',0,'get',3,'1.0.0,1.0.1','io'),(7,'/api/v1/priceservice/prices/{routeId}/{trainType}',0,'get',3,'1.0.0,1.0.1','io'),(8,'/api/v1/priceservice/prices/byRouteIdsAndTrainTypes',0,'post',3,'1.0.0,1.0.0','calculate'),(9,'/api/v1/priceservice/prices',0,'get',3,'1.0.0,1.0.0','io'),(10,'/api/v1/priceservice/prices',0,'post',3,'1.0.0,1.0.1','io'),(11,'/api/v1/priceservice/prices',0,'put',3,'1.0.0,1.0.1','io'),(12,'/api/v1/priceservice/prices/{pricesId}',0,'delete',3,'1.0.0,1.0.1','io'),(13,'/api/v1/seatservice/welcome',0,'get',4,'1.0.0,1.1.2','io'),(14,'/api/v1/seatservice/seats',0,'post',4,'1.0.0,1.1.2','io'),(15,'/api/v1/seatservice/seats/left_tickets',1,'post',4,'1.0.1,1.0.1','calculate'),(16,'/api/v1/seatservice/welcome',0,'get',5,'1.0.0,1.1.2','io'),(17,'/api/v1/seatservice/seats',0,'post',5,'1.0.0,1.1.2','io'),(18,'/api/v1/seatservice/seats/left_tickets',1,'post',5,'1.0.2,1.0.2','calculate'),(19,'/api/v1/priceservice/prices/welcome',0,'get',6,'1.0.0,1.0.1','io'),(20,'/api/v1/priceservice/prices/{routeId}/{trainType}',0,'get',6,'1.0.0,1.0.1','io'),(21,'/api/v1/priceservice/prices/byRouteIdsAndTrainTypes',1,'post',6,'1.0.1,1.0.1','calculate'),(22,'/api/v1/priceservice/prices',1,'get',6,'1.0.1,1.0.1','io'),(23,'/api/v1/priceservice/prices',0,'post',6,'1.0.0,1.0.1','io'),(24,'/api/v1/priceservice/prices',0,'put',6,'1.0.0,1.0.1','io'),(25,'/api/v1/priceservice/prices/{pricesId}',0,'delete',6,'1.0.0,1.0.1','io'),(26,'/api/v1/seatservice/welcome',0,'get',7,'1.0.0,1.1.2','io'),(27,'/api/v1/seatservice/seats',0,'post',7,'1.0.0,1.1.2','io'),(28,'/api/v1/seatservice/seats/left_tickets',1,'post',7,'1.0.3,1.0.3','calculate'),(29,'/api/v1/seatservice/welcome',0,'get',8,'1.0.0,1.1.2','io'),(30,'/api/v1/seatservice/seats',0,'post',8,'1.0.0,1.1.2','io'),(31,'/api/v1/seatservice/seats/left_tickets',1,'post',8,'1.0.4,1.0.4','calculate'),(32,'/api/v1/orderservice/welcome',0,'get',9,'1.0.0,1.0.0','io'),(33,'/api/v1/orderservice/order/tickets',0,'post',9,'1.0.0,1.0.0','io'),(34,'/api/v1/orderservice/order',0,'post',9,'1.0.0,1.0.0','io'),(35,'/api/v1/orderservice/order',0,'put',9,'1.0.0,1.0.0','io'),(36,'/api/v1/orderservice/order',0,'get',9,'1.0.0,1.0.0','io'),(37,'/api/v1/orderservice/order/admin',0,'post',9,'1.0.0,1.0.0','io'),(38,'/api/v1/orderservice/order/admin',0,'put',9,'1.0.0,1.0.0','io'),(39,'/api/v1/orderservice/order/query',0,'post',9,'1.0.0,1.0.0','io'),(40,'/api/v1/orderservice/order/refresh',0,'post',9,'1.0.0,1.0.0','io'),(41,'/api/v1/orderservice/order/{travelDate}/{trainNumber}',0,'get',9,'1.0.0,1.0.0','io'),(42,'/api/v1/orderservice/order/price/{orderId}',0,'get',9,'1.0.0,1.0.0','io'),(43,'/api/v1/orderservice/order/orderPay/{orderId}',0,'get',9,'1.0.0,1.0.0','io'),(44,'/api/v1/orderservice/order/{orderId}',0,'get',9,'1.0.0,1.0.0','io'),(45,'/api/v1/orderservice/order/{orderId}',0,'delete',9,'1.0.0,1.0.0','io'),(46,'/api/v1/orderservice/order/status/{orderId}/{status}',0,'get',9,'1.0.0,1.0.0','io'),(47,'/api/v1/orderservice/order/security/{checkDate}/{accountId}',0,'get',9,'1.0.0,1.0.0','io'),(48,'/api/v1/basicservice/welcome',0,'get',10,'1.0.0,1.0.0','io'),(49,'/api/v1/basicservice/basic/travel',1,'post',10,'1.0.0,1.0.0','io'),(50,'/api/v1/basicservice/basic/travels',1,'post',10,'1.0.0,1.0.0','io'),(51,'/api/v1/basicservice/basic/{stationName}',0,'get',10,'1.0.0,1.0.0','io'),(52,'/api/v1/configservice/welcome',0,'get',11,'1.0.0,1.0.0','io'),(53,'/api/v1/configservice/configs',0,'get',11,'1.0.0,1.0.0','io'),(54,'/api/v1/configservice/configs',0,'post',11,'1.0.0,1.0.0','io'),(55,'/api/v1/configservice/configs',0,'put',11,'1.0.0,1.0.0','io'),(56,'/api/v1/configservice/configs/{configName}',0,'delete',11,'1.0.0,1.0.0','io'),(57,'/api/v1/configservice/configs/{configName}',0,'get',11,'1.0.0,1.0.0','io'),(58,'/api/v1/routeservice/welcome',0,'get',12,'1.0.0,1.0.0','io'),(59,'/api/v1/routeservice/routes',0,'post',12,'1.0.0,1.0.0','io'),(60,'/api/v1/routeservice/routes',0,'get',12,'1.0.0,1.0.0','io'),(61,'/api/v1/routeservice/routes/{routeId}',0,'delete',12,'1.0.0,1.0.0','io'),(62,'/api/v1/routeservice/routes/{routeId}',0,'get',12,'1.0.0,1.0.0','io'),(63,'/api/v1/routeservice/routes/byIds',0,'post',12,'1.0.0,1.0.0','io'),(64,'/api/v1/routeservice/routes/{start}/{end}',0,'get',12,'1.0.0,1.0.0','io'),(65,'/api/v1/stationservice/welcome',0,'get',13,'1.0.0,1.0.0','io'),(66,'/api/v1/stationservice/stations',0,'get',13,'1.0.0,1.0.0','io'),(67,'/api/v1/stationservice/stations',0,'post',13,'1.0.0,1.0.0','io'),(68,'/api/v1/stationservice/stations',0,'put',13,'1.0.0,1.0.0','io'),(69,'/api/v1/stationservice/stations/{stationsId}',0,'delete',13,'1.0.0,1.0.0','io'),(70,'/api/v1/stationservice/stations/id/{stationNameForId}',0,'get',13,'1.0.0,1.0.0','io'),(71,'/api/v1/stationservice/stations/idlist',0,'post',13,'1.0.0,1.0.0','io'),(72,'/api/v1/stationservice/stations/name/{stationIdForName}',0,'get',13,'1.0.0,1.0.0','io'),(73,'/api/v1/stationservice/stations/namelist',0,'post',13,'1.0.0,1.0.0','io'),(74,'/api/v1/seatservice/welcome',0,'get',14,'1.0.0,1.1.2','io'),(75,'/api/v1/seatservice/seats',0,'post',14,'1.0.0,1.1.2','io'),(76,'/api/v1/seatservice/seats/left_tickets',1,'post',14,'1.1.2,1.1.2','calculate'),(77,'/api/v1/travelservice/welcome',0,'get',15,'1.0.0,1.0.9','io'),(78,'/api/v1/travelservice/train_types/{tripId}',0,'get',15,'1.0.0,1.0.0','io'),(79,'/api/v1/travelservice/routes/{tripId}',0,'get',15,'1.0.0,1.0.0','io'),(80,'/api/v1/travelservice/trips/routes',0,'post',15,'1.0.0,1.1.0','io'),(81,'/api/v1/travelservice/trips',0,'post',15,'1.0.0,1.1.0','io'),(82,'/api/v1/travelservice/trips',0,'put',15,'1.0.0,1.1.0','io'),(83,'/api/v1/travelservice/trips',0,'get',15,'1.0.0,1.1.0','io'),(84,'/api/v1/travelservice/trips/{tripId}',0,'get',15,'1.0.0,1.1.0','io'),(85,'/api/v1/travelservice/trips/{tripId}',0,'delete',15,'1.0.0,1.1.0','io'),(86,'/api/v1/travelservice/trips/left',0,'post',15,'1.0.0,1.1.0','io'),(87,'/api/v1/travelservice/trips/left_parallel',0,'post',15,'1.0.0,1.1.0','calculate'),(88,'/api/v1/travelservice/trip_detail',0,'post',15,'1.0.0,1.1.0','io'),(89,'/api/v1/travelservice/admin_trip',0,'get',15,'1.0.0,1.1.0','io'),(90,'/api/v1/travelservice/welcome',1,'get',16,'1.1.0,1.1.0','io'),(91,'/api/v1/travelservice/train_types/{tripId}',0,'get',16,'1.0.9,1.1.0','io'),(92,'/api/v1/travelservice/routes/{tripId}',1,'get',16,'1.1.0,1.1.0','io'),(93,'/api/v1/travelservice/trips/routes',0,'post',16,'1.0.0,1.1.0','io'),(94,'/api/v1/travelservice/trips',0,'post',16,'1.0.0,1.1.0','io'),(95,'/api/v1/travelservice/trips',0,'put',16,'1.0.0,1.1.0','io'),(96,'/api/v1/travelservice/trips',0,'get',16,'1.0.0,1.1.0','io'),(97,'/api/v1/travelservice/trips/{tripId}',0,'get',16,'1.0.0,1.1.0','io'),(98,'/api/v1/travelservice/trips/{tripId}',0,'delete',16,'1.0.0,1.1.0','io'),(99,'/api/v1/travelservice/trips/left',0,'post',16,'1.0.0,1.1.0','io'),(100,'/api/v1/travelservice/trips/left_parallel',0,'post',16,'1.0.0,1.1.0','calculate'),(101,'/api/v1/travelservice/trip_detail',0,'post',16,'1.0.0,1.1.0','io'),(102,'/api/v1/travelservice/admin_trip',0,'get',16,'1.0.0,1.1.0','io'),(103,'/api/v1/travelservice/welcome',0,'get',17,'1.0.0,1.0.9','io'),(104,'/api/v1/travelservice/train_types/{tripId}',1,'get',17,'1.0.5,1.0.5','io'),(105,'/api/v1/travelservice/routes/{tripId}',1,'get',17,'1.0.5,1.0.5','io'),(106,'/api/v1/travelservice/trips/routes',0,'post',17,'1.0.0,1.1.0','io'),(107,'/api/v1/travelservice/trips',0,'post',17,'1.0.0,1.1.0','io'),(108,'/api/v1/travelservice/trips',0,'put',17,'1.0.0,1.1.0','io'),(109,'/api/v1/travelservice/trips',0,'get',17,'1.0.0,1.1.0','io'),(110,'/api/v1/travelservice/trips/{tripId}',0,'get',17,'1.0.0,1.1.0','io'),(111,'/api/v1/travelservice/trips/{tripId}',0,'delete',17,'1.0.0,1.1.0','io'),(112,'/api/v1/travelservice/trips/left',0,'post',17,'1.0.0,1.1.0','io'),(113,'/api/v1/travelservice/trips/left_parallel',0,'post',17,'1.0.0,1.1.0','calculate'),(114,'/api/v1/travelservice/trip_detail',0,'post',17,'1.0.0,1.1.0','io'),(115,'/api/v1/travelservice/admin_trip',0,'get',17,'1.0.0,1.1.0','io'),(116,'/api/v1/travelservice/welcome',0,'get',18,'1.0.0,1.0.9','io'),(117,'/api/v1/travelservice/train_types/{tripId}',1,'get',18,'1.0.6,1.0.6','io'),(118,'/api/v1/travelservice/routes/{tripId}',1,'get',18,'1.0.6,1.0.6','io'),(119,'/api/v1/travelservice/trips/routes',0,'post',18,'1.0.0,1.1.0','io'),(120,'/api/v1/travelservice/trips',0,'post',18,'1.0.0,1.1.0','io'),(121,'/api/v1/travelservice/trips',0,'put',18,'1.0.0,1.1.0','io'),(122,'/api/v1/travelservice/trips',0,'get',18,'1.0.0,1.1.0','io'),(123,'/api/v1/travelservice/trips/{tripId}',0,'get',18,'1.0.0,1.1.0','io'),(124,'/api/v1/travelservice/trips/{tripId}',0,'delete',18,'1.0.0,1.1.0','io'),(125,'/api/v1/travelservice/trips/left',0,'post',18,'1.0.0,1.1.0','io'),(126,'/api/v1/travelservice/trips/left_parallel',0,'post',18,'1.0.0,1.1.0','calculate'),(127,'/api/v1/travelservice/trip_detail',0,'post',18,'1.0.0,1.1.0','io'),(128,'/api/v1/travelservice/admin_trip',0,'get',18,'1.0.0,1.1.0','io'),(129,'/api/v1/travelservice/welcome',0,'get',19,'1.0.0,1.0.9','io'),(130,'/api/v1/travelservice/train_types/{tripId}',1,'get',19,'1.0.7,1.0.7','io'),(131,'/api/v1/travelservice/routes/{tripId}',1,'get',19,'1.0.7,1.0.7','io'),(132,'/api/v1/travelservice/trips/routes',0,'post',19,'1.0.0,1.1.0','io'),(133,'/api/v1/travelservice/trips',0,'post',19,'1.0.0,1.1.0','io'),(134,'/api/v1/travelservice/trips',0,'put',19,'1.0.0,1.1.0','io'),(135,'/api/v1/travelservice/trips',0,'get',19,'1.0.0,1.1.0','io'),(136,'/api/v1/travelservice/trips/{tripId}',0,'get',19,'1.0.0,1.1.0','io'),(137,'/api/v1/travelservice/trips/{tripId}',0,'delete',19,'1.0.0,1.1.0','io'),(138,'/api/v1/travelservice/trips/left',0,'post',19,'1.0.0,1.1.0','io'),(139,'/api/v1/travelservice/trips/left_parallel',0,'post',19,'1.0.0,1.1.0','calculate'),(140,'/api/v1/travelservice/trip_detail',0,'post',19,'1.0.0,1.1.0','io'),(141,'/api/v1/travelservice/admin_trip',0,'get',19,'1.0.0,1.1.0','io'),(142,'/api/v1/travelservice/welcome',0,'get',20,'1.0.0,1.0.9','io'),(143,'/api/v1/travelservice/train_types/{tripId}',1,'get',20,'1.0.8,1.0.8','io'),(144,'/api/v1/travelservice/routes/{tripId}',1,'get',20,'1.0.8,1.0.8','io'),(145,'/api/v1/travelservice/trips/routes',0,'post',20,'1.0.0,1.1.0','io'),(146,'/api/v1/travelservice/trips',0,'post',20,'1.0.0,1.1.0','io'),(147,'/api/v1/travelservice/trips',0,'put',20,'1.0.0,1.1.0','io'),(148,'/api/v1/travelservice/trips',0,'get',20,'1.0.0,1.1.0','io'),(149,'/api/v1/travelservice/trips/{tripId}',0,'get',20,'1.0.0,1.1.0','io'),(150,'/api/v1/travelservice/trips/{tripId}',0,'delete',20,'1.0.0,1.1.0','io'),(151,'/api/v1/travelservice/trips/left',0,'post',20,'1.0.0,1.1.0','io'),(152,'/api/v1/travelservice/trips/left_parallel',0,'post',20,'1.0.0,1.1.0','calculate'),(153,'/api/v1/travelservice/trip_detail',0,'post',20,'1.0.0,1.1.0','io'),(154,'/api/v1/travelservice/admin_trip',0,'get',20,'1.0.0,1.1.0','io'),(155,'/api/v1/travelservice/welcome',0,'get',22,'1.0.0,1.0.9','io'),(156,'/api/v1/travelservice/train_types/{tripId}',1,'get',22,'1.0.9,1.1.0','io'),(157,'/api/v1/travelservice/routes/{tripId}',1,'get',22,'1.0.9,1.0.9','io'),(158,'/api/v1/travelservice/trips/routes',0,'post',22,'1.0.0,1.1.0','io'),(159,'/api/v1/travelservice/trips',0,'post',22,'1.0.0,1.1.0','io'),(160,'/api/v1/travelservice/trips',0,'put',22,'1.0.0,1.1.0','io'),(161,'/api/v1/travelservice/trips',0,'get',22,'1.0.0,1.1.0','io'),(162,'/api/v1/travelservice/trips/{tripId}',0,'get',22,'1.0.0,1.1.0','io'),(163,'/api/v1/travelservice/trips/{tripId}',0,'delete',22,'1.0.0,1.1.0','io'),(164,'/api/v1/travelservice/trips/left',0,'post',22,'1.0.0,1.1.0','io'),(165,'/api/v1/travelservice/trips/left_parallel',0,'post',22,'1.0.0,1.1.0','calculate'),(166,'/api/v1/travelservice/trip_detail',0,'post',22,'1.0.0,1.1.0','io'),(167,'/api/v1/travelservice/admin_trip',0,'get',22,'1.0.0,1.1.0','io'),(168,'/api/v1/adminbasicservice/welcome',1,'get',23,'1.0.0,1.0.0','io'),(169,'/api/v1/adminbasicservice/adminbasic/contacts',0,'get',23,'1.0.0,1.0.0','io'),(170,'/api/v1/adminbasicservice/adminbasic/contacts',0,'put',23,'1.0.0,1.0.0','io'),(171,'/api/v1/adminbasicservice/adminbasic/contacts',1,'post',23,'1.0.0,1.0.0','io'),(172,'/api/v1/adminbasicservice/adminbasic/contacts/{contactsId}',0,'delete',23,'1.0.0,1.0.0','io'),(173,'/api/v1/adminbasicservice/adminbasic/stations',0,'get',23,'1.0.0,1.0.0','io'),(174,'/api/v1/adminbasicservice/adminbasic/stations',1,'put',23,'1.0.0,1.0.0','io'),(175,'/api/v1/adminbasicservice/adminbasic/stations',1,'post',23,'1.0.0,1.0.0','io'),(176,'/api/v1/adminbasicservice/adminbasic/stations/{id}',0,'delete',23,'1.0.0,1.0.0','io'),(177,'/api/v1/adminbasicservice/adminbasic/trains',1,'get',23,'1.0.0,1.0.0','io'),(178,'/api/v1/adminbasicservice/adminbasic/trains',0,'put',23,'1.0.0,1.0.0','io'),(179,'/api/v1/adminbasicservice/adminbasic/trains',1,'post',23,'1.0.0,1.0.0','io'),(180,'/api/v1/adminbasicservice/adminbasic/trains/{id}',0,'delete',23,'1.0.0,1.0.0','io'),(181,'/api/v1/adminbasicservice/adminbasic/configs',0,'get',23,'1.0.0,1.0.0','io'),(182,'/api/v1/adminbasicservice/adminbasic/configs',1,'put',23,'1.0.0,1.0.0','io'),(183,'/api/v1/adminbasicservice/adminbasic/configs',1,'post',23,'1.0.0,1.0.0','io'),(184,'/api/v1/adminbasicservice/adminbasic/configs/{name}',0,'delete',23,'1.0.0,1.0.0','io'),(185,'/api/v1/adminbasicservice/adminbasic/prices',0,'get',23,'1.0.0,1.0.0','io'),(186,'/api/v1/adminbasicservice/adminbasic/prices',1,'put',23,'1.0.0,1.0.0','io'),(187,'/api/v1/adminbasicservice/adminbasic/prices',1,'post',23,'1.0.0,1.0.0','io'),(188,'/api/v1/adminbasicservice/adminbasic/prices/{pricesId}',0,'delete',23,'1.0.0,1.0.0','io'),(189,'/api/v1/adminorderservice/welcome',0,'get',24,'1.0.0,1.0.0','io'),(190,'/api/v1/adminorderservice/adminorder',0,'get',24,'1.0.0,1.0.0','io'),(191,'/api/v1/adminorderservice/adminorder',1,'post',24,'1.0.0,1.0.0','io'),(192,'/api/v1/adminorderservice/adminorder',1,'put',24,'1.0.0,1.0.0','io'),(193,'/api/v1/adminorderservice/adminorder/{orderId}/{trainNumber}',1,'delete',24,'1.0.0,1.0.0','io'),(194,'/api/v1/adminrouteservice/welcome',0,'get',25,'1.0.0,1.0.0','io'),(195,'/api/v1/adminrouteservice/adminroute',0,'get',25,'1.0.0,1.0.0','io'),(196,'/api/v1/adminrouteservice/adminroute',1,'post',25,'1.0.0,1.0.0','io'),(197,'/api/v1/adminrouteservice/adminroute/{routeId}',0,'delete',25,'1.0.0,1.0.0','io'),(198,'/api/v1/admintravelservice/welcome',0,'get',26,'1.0.0,1.0.0','io'),(199,'/api/v1/admintravelservice/admintravel',0,'get',26,'1.0.0,1.0.0','io'),(200,'/api/v1/admintravelservice/admintravel',1,'post',26,'1.0.0,1.0.0','io'),(201,'/api/v1/admintravelservice/admintravel',1,'put',26,'1.0.0,1.0.0','io'),(202,'/api/v1/admintravelservice/admintravel/{tripId}',1,'delete',26,'1.0.0,1.0.0','io'),(203,'/api/v1/adminuserservice/users/welcome',0,'get',27,'1.0.0,1.0.0','io'),(204,'/api/v1/adminuserservice/users',0,'get',27,'1.0.0,1.0.0','io'),(205,'/api/v1/adminuserservice/users',1,'put',27,'1.0.0,1.0.0','io'),(206,'/api/v1/adminuserservice/users',1,'post',27,'1.0.0,1.0.0','io'),(207,'/api/v1/adminuserservice/users/{userId}',1,'delete',27,'1.0.0,1.0.0','io'),(208,'/api/v1/assuranceservice/welcome',0,'get',28,'1.0.0,1.0.0','io'),(209,'/api/v1/assuranceservice/assurances',0,'get',28,'1.0.0,1.0.0','io'),(210,'/api/v1/assuranceservice/assurances/types',0,'get',28,'1.0.0,1.0.0','io'),(211,'/api/v1/assuranceservice/assurances/assuranceid/{assuranceId}',1,'delete',28,'1.0.0,1.0.0','io'),(212,'/api/v1/assuranceservice/assurances/assuranceid/{assuranceId}',0,'get',28,'1.0.0,1.0.0','io'),(213,'/api/v1/assuranceservice/assurances/orderid/{orderId}',1,'delete',28,'1.0.0,1.0.0','io'),(214,'/api/v1/assuranceservice/assurances/{assuranceId}/{orderId}/{typeIndex}',1,'patch',28,'1.0.0,1.0.0','io'),(215,'/api/v1/assuranceservice/assurances/{typeIndex}/{orderId}',0,'get',28,'1.0.0,1.0.0','io'),(216,'/api/v1/assuranceservice/assurance/orderid/{orderId}',0,'get',28,'1.0.0,1.0.0','io'),(217,'/api/v1/auth/hello',0,'get',29,'1.0.0,1.0.0','io'),(218,'/api/v1/auth',1,'post',29,'1.0.0,1.0.0','io'),(219,'/api/v1/auth',0,'get',29,'1.0.0,1.0.0','io'),(220,'/api/v1/users/login',1,'post',29,'1.0.0,1.0.0','io'),(221,'/api/v1/users',0,'get',29,'1.0.0,1.0.0','io'),(222,'/api/v1/users/{userId}',1,'delete',29,'1.0.0,1.0.0','io'),(223,'/api/v1/cancelservice/welcome',0,'get',30,'1.0.0,1.0.0','io'),(224,'/api/v1/cancelservice/cancel/refound/{orderId}',1,'get',30,'1.0.0,1.0.0','io'),(225,'/api/v1/cancelservice/cancel/{orderId}/{loginId}',0,'get',30,'1.0.0,1.0.0','io'),(226,'/api/v1/consignservice/welcome',0,'get',31,'1.0.0,1.0.0','io'),(227,'/api/v1/consignservice/consigns',1,'post',31,'1.0.0,1.0.0','io'),(228,'/api/v1/consignservice/consigns',1,'put',31,'1.0.0,1.0.0','io'),(229,'/api/v1/consignservice/consigns/account/{id}',0,'get',31,'1.0.0,1.0.0','io'),(230,'/api/v1/consignservice/consigns/order/{id}',0,'get',31,'1.0.0,1.0.0','io'),(231,'/api/v1/consignservice/consigns/{consignee}',0,'get',31,'1.0.0,1.0.0','io'),(232,'/api/v1/consignpriceservice/welcome',0,'get',32,'1.0.0,1.0.0','io'),(233,'/api/v1/consignpriceservice/consignprice/{weight}/{isWithinRegion}',0,'get',32,'1.0.0,1.0.0','io'),(234,'/api/v1/consignpriceservice/consignprice/price',0,'get',32,'1.0.0,1.0.0','io'),(235,'/api/v1/consignpriceservice/consignprice/config',0,'get',32,'1.0.0,1.0.0','io'),(236,'/api/v1/consignpriceservice/consignprice',1,'post',32,'1.0.0,1.0.0','io'),(237,'/api/v1/contactservice/contacts/welcome',0,'get',33,'1.0.0,1.0.0','io'),(238,'/api/v1/contactservice/contacts',0,'get',33,'1.0.0,1.0.0','io'),(239,'/api/v1/contactservice/contacts',1,'post',33,'1.0.0,1.0.0','io'),(240,'/api/v1/contactservice/contacts',1,'put',33,'1.0.0,1.0.0','io'),(241,'/api/v1/contactservice/contacts/admin',0,'post',33,'1.0.0,1.0.0','io'),(242,'/api/v1/contactservice/contacts/{contactsId}',0,'delete',33,'1.0.0,1.0.0','io'),(243,'/api/v1/contactservice/contacts/account/{accountId}',0,'get',33,'1.0.0,1.0.0','io'),(244,'/api/v1/contactservice/contacts/{id}',0,'get',33,'1.0.0,1.0.0','io'),(245,'/api/v1/executeservice/welcome',0,'get',34,'1.0.0,1.0.0','io'),(246,'/api/v1/executeservice/execute/execute/{orderId}',0,'get',34,'1.0.0,1.0.0','io'),(247,'/api/v1/executeservice/execute/collected/{orderId}',0,'get',34,'1.0.0,1.0.0','io'),(248,'/api/foodservice/welcome',0,'get',35,'1.0.0,2.0.0','io'),(249,'/api/foodservice/test_send_delivery',0,'get',35,'1.0.0,2.0.0','io'),(250,'/api/foodservice/orders',0,'get',35,'1.0.0,2.0.0','io'),(251,'/api/foodservice/orders',1,'post',35,'1.0.0,1.0.0','io'),(252,'/api/foodservice/orders',0,'put',35,'1.0.0,1.0.0','io'),(253,'/api/foodservice/createOrderBatch',1,'post',35,'1.0.0,1.0.0','io'),(254,'/api/foodservice/orders/{orderId}',0,'delete',35,'1.0.0,2.0.0','io'),(255,'/api/foodservice/orders/{orderId}',0,'get',35,'1.0.0,2.0.0','io'),(256,'/api/foodservice/foods/{date}/{startStation}/{endStation}/{tripId}',0,'get',35,'1.0.0,2.0.0','io'),(257,'/api/v1/fooddeliveryservice/welcome',0,'get',36,'1.0.0,1.0.0','io'),(258,'/api/v1/fooddeliveryservice/orders',1,'post',36,'1.0.0,1.0.0','io'),(259,'/api/v1/fooddeliveryservice/orders/d/{orderId}',0,'delete',36,'1.0.0,1.0.0','io'),(260,'/api/v1/fooddeliveryservice/orders/{orderId}',0,'get',36,'1.0.0,1.0.0','io'),(261,'/api/v1/fooddeliveryservice/orders/all',0,'get',36,'1.0.0,1.0.0','io'),(262,'/api/v1/fooddeliveryservice/orders/store/{storeId}',0,'get',36,'1.0.0,1.0.0','io'),(263,'/api/v1/fooddeliveryservice/orders/tripid',1,'put',36,'1.0.0,1.0.0','io'),(264,'/api/v1/fooddeliveryservice/orders/seatno',0,'put',36,'1.0.0,1.0.0','io'),(265,'/api/v1/inside_pay_service/welcome',0,'get',37,'1.0.0,1.0.0','io'),(266,'/api/v1/inside_pay_service/inside_payment',1,'post',37,'1.0.0,1.0.0','io'),(267,'/api/v1/inside_pay_service/inside_payment/account',1,'post',37,'1.0.0,1.0.0','io'),(268,'/api/v1/inside_pay_service/inside_payment/account',0,'get',37,'1.0.0,1.0.0','io'),(269,'/api/v1/inside_pay_service/inside_payment/{userId}/{money}',0,'get',37,'1.0.0,1.0.0','io'),(270,'/api/v1/inside_pay_service/inside_payment/payment',0,'get',37,'1.0.0,1.0.0','io'),(271,'/api/v1/inside_pay_service/inside_payment/drawback/{userId}/{money}',0,'get',37,'1.0.0,1.0.0','io'),(272,'/api/v1/inside_pay_service/inside_payment/difference',1,'post',37,'1.0.0,1.0.0','io'),(273,'/api/v1/inside_pay_service/inside_payment/money',0,'get',37,'1.0.0,1.0.0','io'),(274,'/api/v1/notifyservice/welcome',0,'get',38,'1.0.0,1.0.0','io'),(275,'/api/v1/notifyservice/test_send_mq',0,'get',38,'1.0.0,1.0.0','io'),(276,'/api/v1/notifyservice/test_send_mail',0,'get',38,'1.0.0,1.0.0','io'),(277,'/api/v1/notifyservice/notification/preserve_success',1,'post',38,'1.0.0,1.0.0','io'),(278,'/api/v1/notifyservice/notification/order_create_success',0,'post',38,'1.0.0,1.0.0','io'),(279,'/api/v1/notifyservice/notification/order_changed_success',0,'post',38,'1.0.0,1.0.0','io'),(280,'/api/v1/notifyservice/notification/order_cancel_success',1,'post',38,'1.0.0,1.0.0','io'),(281,'/api/v1/orderOtherService/welcome',0,'get',39,'1.0.0,1.0.0','io'),(282,'/api/v1/orderOtherService/orderOther/tickets',1,'post',39,'1.0.0,1.0.0','io'),(283,'/api/v1/orderOtherService/orderOther',1,'post',39,'1.0.0,1.0.0','io'),(284,'/api/v1/orderOtherService/orderOther',0,'put',39,'1.0.0,1.0.0','io'),(285,'/api/v1/orderOtherService/orderOther',0,'get',39,'1.0.0,1.0.0','io'),(286,'/api/v1/orderOtherService/orderOther/admin',1,'post',39,'1.0.0,1.0.0','io'),(287,'/api/v1/orderOtherService/orderOther/admin',1,'put',39,'1.0.0,1.0.0','io'),(288,'/api/v1/orderOtherService/orderOther/query',1,'post',39,'1.0.0,1.0.0','io'),(289,'/api/v1/orderOtherService/orderOther/refresh',1,'post',39,'1.0.0,1.0.0','io'),(290,'/api/v1/orderOtherService/orderOther/{travelDate}/{trainNumber}',0,'get',39,'1.0.0,1.0.0','io'),(291,'/api/v1/orderOtherService/orderOther/price/{orderId}',0,'get',39,'1.0.0,1.0.0','io'),(292,'/api/v1/orderOtherService/orderOther/orderPay/{orderId}',0,'get',39,'1.0.0,1.0.0','io'),(293,'/api/v1/orderOtherService/orderOther/{orderId}',0,'get',39,'1.0.0,1.0.0','io'),(294,'/api/v1/orderOtherService/orderOther/{orderId}',1,'delete',39,'1.0.0,1.0.0','io'),(295,'/api/v1/orderOtherService/orderOther/status/{orderId}/{status}',0,'get',39,'1.0.0,1.0.0','io'),(296,'/api/v1/orderOtherService/orderOther/security/{checkDate}/{accountId}',0,'get',39,'1.0.0,1.0.0','io'),(297,'/api/v1/paymentservice/welcome',0,'get',40,'1.0.0,1.0.0','io'),(298,'/api/v1/paymentservice/payment',1,'post',40,'1.0.0,1.0.0','io'),(299,'/api/v1/paymentservice/payment',0,'get',40,'1.0.0,1.0.0','io'),(300,'/api/v1/paymentservice/payment/money',1,'post',40,'1.0.0,1.0.0','io'),(301,'/api/v1/preserveservice/welcome',0,'get',41,'1.0.0,1.0.0','io'),(302,'/api/v1/preserveservice/preserve',1,'post',41,'1.0.0,1.0.0','io'),(303,'/api/v1/preserveotherservice/welcome',0,'get',42,'1.0.0,1.0.0','io'),(304,'/api/v1/preserveotherservice/preserveOther',1,'post',42,'1.0.0,1.0.0','io'),(305,'/api/v1/rebookservice/welcome',0,'get',43,'1.0.0,1.0.0','io'),(306,'/api/v1/rebookservice/rebook/difference',0,'post',43,'1.0.0,1.0.0','io'),(307,'/api/v1/rebookservice/rebook',0,'post',43,'1.0.0,1.0.0','io'),(308,'/api/v1/routeplanservice/welcome',0,'get',44,'1.0.0,1.0.0','io'),(309,'/api/v1/routeplanservice/routePlan/cheapestRoute',1,'post',44,'1.0.0,1.0.0','calculate'),(310,'/api/v1/routeplanservice/routePlan/quickestRoute',0,'post',44,'1.0.0,1.0.0','calculate'),(311,'/api/v1/routeplanservice/routePlan/minStopStations',1,'post',44,'1.0.0,1.0.0','calculate'),(312,'/api/v1/securityservice/welcome',0,'get',45,'1.0.0,1.0.0','io'),(313,'/api/v1/securityservice/securityConfigs',0,'get',45,'1.0.0,1.0.0','io'),(314,'/api/v1/securityservice/securityConfigs',1,'post',45,'1.0.0,1.0.0','io'),(315,'/api/v1/securityservice/securityConfigs',1,'put',45,'1.0.0,1.0.0','io'),(316,'/api/v1/securityservice/securityConfigs/{id}',0,'delete',45,'1.0.0,1.0.0','io'),(317,'/api/v1/securityservice/securityConfigs/{accountId}',0,'get',45,'1.0.0,1.0.0','io'),(318,'/api/v1/stationfoodservice/stationfoodstores/welcome',0,'get',46,'1.0.0,1.0.0','io'),(319,'/api/v1/stationfoodservice/stationfoodstores',0,'get',46,'1.0.0,1.0.0','io'),(320,'/api/v1/stationfoodservice/stationfoodstores',1,'post',46,'1.0.0,1.0.0','io'),(321,'/api/v1/stationfoodservice/stationfoodstores/{stationId}',0,'get',46,'1.0.0,1.0.0','io'),(322,'/api/v1/stationfoodservice/stationfoodstores/bystoreid/{stationFoodStoreId}',0,'get',46,'1.0.0,1.0.0','io'),(323,'/api/v1/trainfoodservice/trainfoods/welcome',0,'get',47,'1.0.0,1.0.0','io'),(324,'/api/v1/trainfoodservice/trainfoods',0,'get',47,'1.0.0,1.0.0','io'),(325,'/api/v1/trainfoodservice/trainfoods/{tripId}',0,'get',47,'1.0.0,1.0.0','io'),(326,'/api/v1/travel2service/welcome',0,'get',48,'1.0.0,1.0.0','io'),(327,'/api/v1/travel2service/train_types/{tripId}',0,'get',48,'1.0.0,1.0.0','io'),(328,'/api/v1/travel2service/routes/{tripId}',0,'get',48,'1.0.0,1.0.0','io'),(329,'/api/v1/travel2service/trips/routes',1,'post',48,'1.0.0,1.0.0','io'),(330,'/api/v1/travel2service/trips',0,'post',48,'1.0.0,1.0.0','io'),(331,'/api/v1/travel2service/trips',0,'put',48,'1.0.0,1.0.0','io'),(332,'/api/v1/travel2service/trips',0,'get',48,'1.0.0,1.0.0','io'),(333,'/api/v1/travel2service/trips/{tripId}',0,'get',48,'1.0.0,1.0.0','io'),(334,'/api/v1/travel2service/trips/{tripId}',1,'delete',48,'1.0.0,1.0.0','io'),(335,'/api/v1/travel2service/trips/left',1,'post',48,'1.0.0,1.0.0','io'),(336,'/api/v1/travel2service/trip_detail',1,'post',48,'1.0.0,1.0.0','io'),(337,'/api/v1/travel2service/admin_trip',0,'get',48,'1.0.0,1.0.0','io'),(338,'/api/v1/travelplanservice/welcome',0,'get',49,'1.0.0,1.0.0','io'),(339,'/api/v1/travelplanservice/travelPlan/transferResult',1,'post',49,'1.0.0,1.0.0','io'),(340,'/api/v1/travelplanservice/travelPlan/cheapest',1,'post',49,'1.0.0,1.0.0','calculate'),(341,'/api/v1/travelplanservice/travelPlan/quickest',1,'post',49,'1.0.0,1.0.0','calculate'),(342,'/api/v1/travelplanservice/travelPlan/minStation',1,'post',49,'1.0.0,1.0.0','calculate'),(343,'/api/v1/travelservice/welcome',0,'get',50,'1.0.0,1.0.0','io'),(344,'/api/v1/travelservice/train_types/{tripId}',0,'get',50,'1.0.0,1.0.0','io'),(345,'/api/v1/travelservice/routes/{tripId}',0,'get',50,'1.0.0,1.0.0','io'),(346,'/api/v1/travelservice/trips/routes',1,'post',50,'1.0.0,1.0.0','io'),(347,'/api/v1/travelservice/trips',1,'post',50,'1.0.0,1.0.0','io'),(348,'/api/v1/travelservice/trips',1,'put',50,'1.0.0,1.0.0','io'),(349,'/api/v1/travelservice/trips',0,'get',50,'1.0.0,1.0.0','io'),(350,'/api/v1/travelservice/trips/{tripId}',0,'get',50,'1.0.0,1.0.0','io'),(351,'/api/v1/travelservice/trips/{tripId}',1,'delete',50,'1.0.0,1.0.0','io'),(352,'/api/v1/travelservice/trips/left',1,'post',50,'1.0.0,1.0.0','io'),(353,'/api/v1/travelservice/trips/left_parallel',1,'post',50,'1.0.0,1.0.0','io'),(354,'/api/v1/travelservice/trip_detail',0,'post',50,'1.0.0,1.0.0','io'),(355,'/api/v1/travelservice/admin_trip',0,'get',50,'1.0.0,1.0.0','io'),(356,'/api/v1/verifycode/generate',0,'get',51,'1.0.0,1.0.0','io'),(357,'/api/v1/verifycode/verify/{verifyCode}',0,'get',51,'1.0.0,1.0.0','io'),(358,'/api/v1/waitorderservice/welcome',0,'get',52,'1.0.0,1.0.0','io'),(359,'/api/v1/waitorderservice/order',1,'post',52,'1.0.0,1.0.0','io'),(360,'/api/v1/waitorderservice/orders',0,'get',52,'1.0.0,1.0.0','io'),(361,'/api/v1/waitorderservice/waitlistorders',0,'get',52,'1.0.0,1.0.0','io'),(362,'/api/v1/fooddeliveryservice/orders/dtime',0,'put',36,'1.0.0,1.0.0','io'),(363,'/api/foodservice/welcome',0,'get',53,'1.0.0,2.0.0','io'),(364,'/api/foodservice/test_send_delivery',0,'get',53,'1.0.0,2.0.0','io'),(365,'/api/foodservice/orders',0,'get',53,'1.0.0,2.0.0','io'),(366,'/api/foodservice/orders',1,'post',53,'2.0.0,2.0.0','io'),(367,'/api/foodservice/orders',1,'put',53,'2.0.0,2.0.0','io'),(368,'/api/foodservice/createOrderBatch',1,'post',53,'2.0.0,2.0.0','io'),(369,'/api/foodservice/orders/{orderId}',0,'delete',53,'1.0.0,2.0.0','io'),(370,'/api/foodservice/orders/{orderId}',0,'get',53,'1.0.0,2.0.0','io'),(371,'/api/foodservice/foods/{date}/{startStation}/{endStation}/{tripId}',0,'get',53,'1.0.0,2.0.0','io'),(389,'/api/agent3/chain/zero',0,'get',57,'1.0.0,1.0.0','io'),(390,'/api/agent3/chain/one',0,'get',57,'1.0.0,1.0.0','io'),(391,'/api/agent1/chain/one',0,'get',58,'1.0.0,1.0.0','io'),(392,'/api/agent1/chain/two',0,'get',58,'1.0.0,1.0.0','io'),(393,'/api/agent1/chain/three',0,'get',58,'1.0.0,1.0.0','io'),(394,'/api/agent2/chain/zero',0,'get',59,'1.0.0,1.0.0','io'),(395,'/api/agent2/chain/one',0,'get',59,'1.0.0,1.0.0','io'),(396,'/api/agent2/chain/two',0,'get',59,'1.0.0,1.0.0','io'),(415,'/api/v1/foodservice/welcome',0,'get',35,'1.0.0,1.0.1','io'),(416,'/api/v1/foodservice/test_send_delivery',0,'get',35,'1.0.0,1.0.1','io'),(417,'/api/v1/foodservice/orders',0,'get',35,'1.0.0,1.0.1','io'),(418,'/api/v1/foodservice/orders',1,'post',35,'1.0.0,1.0.0','io'),(419,'/api/v1/foodservice/orders',0,'put',35,'1.0.0,1.0.0','io'),(420,'/api/v1/foodservice/createOrderBatch',1,'post',35,'1.0.0,1.0.0','io'),(421,'/api/v1/foodservice/orders/{orderId}',0,'delete',35,'1.0.0,1.0.1','io'),(422,'/api/v1/foodservice/orders/{orderId}',0,'get',35,'1.0.0,1.0.1','io'),(423,'/api/v1/foodservice/foods/{date}/{startStation}/{endStation}/{tripId}',0,'get',35,'1.0.0,1.0.1','io'),(424,'/api/v1/foodservice/welcome',0,'get',60,'1.0.0,1.0.1','io'),(425,'/api/v1/foodservice/test_send_delivery',0,'get',60,'1.0.0,1.0.1','io'),(426,'/api/v1/foodservice/orders',0,'get',60,'1.0.0,1.0.1','io'),(427,'/api/v1/foodservice/orders',1,'post',60,'1.0.1,1.0.1','io'),(428,'/api/v1/foodservice/orders',1,'put',60,'1.0.1,1.0.1','io'),(429,'/api/v1/foodservice/createOrderBatch',1,'post',60,'1.0.1,1.0.1','io'),(430,'/api/v1/foodservice/orders/{orderId}',0,'delete',60,'1.0.0,1.0.1','io'),(431,'/api/v1/foodservice/orders/{orderId}',0,'get',60,'1.0.0,1.0.1','io'),(432,'/api/v1/foodservice/foods/{date}/{startStation}/{endStation}/{tripId}',0,'get',60,'1.0.0,1.0.1','io');
/*!40000 ALTER TABLE `m_service_interface` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `m_service_version`
--

DROP TABLE IF EXISTS `m_service_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `m_service_version` (
  `version_id` int NOT NULL AUTO_INCREMENT,
  `service_id` int DEFAULT NULL,
  `major_version` int DEFAULT NULL,
  `minor_version` int DEFAULT NULL,
  `patch_version` int DEFAULT NULL,
  PRIMARY KEY (`version_id`),
  KEY `m_service_version_m_service_service_id_fk` (`service_id`),
  CONSTRAINT `m_service_version_m_service_service_id_fk` FOREIGN KEY (`service_id`) REFERENCES `m_service` (`service_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `m_service_version`
--

LOCK TABLES `m_service_version` WRITE;
/*!40000 ALTER TABLE `m_service_version` DISABLE KEYS */;
INSERT INTO `m_service_version` VALUES (1,1,0,0,1),(2,2,1,0,0),(3,3,1,0,0),(4,2,1,0,1),(5,2,1,0,2),(6,3,1,0,1),(7,2,1,0,3),(8,2,1,0,4),(9,4,1,0,0),(10,5,1,0,0),(11,6,1,0,0),(12,7,1,0,0),(13,8,1,0,0),(14,2,1,1,2),(15,9,1,0,0),(16,9,1,1,0),(17,9,1,0,5),(18,9,1,0,6),(19,9,1,0,7),(20,9,1,0,8),(21,9,1,0,10),(22,9,1,0,9),(23,10,1,0,0),(24,11,1,0,0),(25,12,1,0,0),(26,13,1,0,0),(27,14,1,0,0),(28,15,1,0,0),(29,16,1,0,0),(30,17,1,0,0),(31,18,1,0,0),(32,19,1,0,0),(33,20,1,0,0),(34,21,1,0,0),(35,22,1,0,0),(36,23,1,0,0),(37,24,1,0,0),(38,25,1,0,0),(39,26,1,0,0),(40,27,1,0,0),(41,28,1,0,0),(42,29,1,0,0),(43,30,1,0,0),(44,31,1,0,0),(45,32,1,0,0),(46,33,1,0,0),(47,34,1,0,0),(48,35,1,0,0),(49,36,1,0,0),(50,37,1,0,0),(51,38,1,0,0),(52,39,1,0,0),(53,22,2,0,0),(57,43,1,0,0),(58,44,1,0,0),(59,45,1,0,0),(60,22,1,0,1),(61,22,1,0,2);
/*!40000 ALTER TABLE `m_service_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rule`
--

DROP TABLE IF EXISTS `rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rule` (
  `name` varchar(20) DEFAULT NULL,
  `uri_match` varchar(300) DEFAULT NULL,
  `rewrite` varchar(300) DEFAULT NULL,
  `route` varchar(400) DEFAULT NULL,
  `redirect` varchar(400) DEFAULT NULL,
  `spec_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `rule_spec_id_fk` (`spec_id`),
  CONSTRAINT `rule_spec_id_fk` FOREIGN KEY (`spec_id`) REFERENCES `spec` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rule`
--

LOCK TABLES `rule` WRITE;
/*!40000 ALTER TABLE `rule` DISABLE KEYS */;
INSERT INTO `rule` VALUES ('service-/**-v0.0.1','{\"match\":{\"uri\":{\"prefix\":\"/**\"},\"headers\":{\"x-request-version\":\"v0.0.1\"}}}',NULL,NULL,NULL,1,8);
/*!40000 ALTER TABLE `rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `ser_interface`
--

DROP TABLE IF EXISTS `ser_interface`;
/*!50001 DROP VIEW IF EXISTS `ser_interface`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `ser_interface` AS SELECT 
 1 AS `service_id`,
 1 AS `version_id`,
 1 AS `interface_id`,
 1 AS `service_name`,
 1 AS `description`,
 1 AS `major_version`,
 1 AS `minor_version`,
 1 AS `patch_version`,
 1 AS `uri`,
 1 AS `type`,
 1 AS `interval`,
 1 AS `compatible_marker`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `service_to_key`
--

DROP TABLE IF EXISTS `service_to_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_to_key` (
  `key` varchar(100) NOT NULL,
  `service` varchar(120) NOT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `service_to_key_pk` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_to_key`
--

LOCK TABLES `service_to_key` WRITE;
/*!40000 ALTER TABLE `service_to_key` DISABLE KEYS */;
INSERT INTO `service_to_key` VALUES ('YWdlbnQtdGVzdDE=.1','agent-test1',1),('YWdlbnQtdGVzdDI=.1','agent-test2',2),('YWdlbnQtdGVzdDM=.1','agent-test3',3);
/*!40000 ALTER TABLE `service_to_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spec`
--

DROP TABLE IF EXISTS `spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spec` (
  `hosts` varchar(500) DEFAULT NULL,
  `gateways` varchar(500) DEFAULT NULL,
  `http` varchar(1000) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `ingress_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `spec_ingress_id_fk` (`ingress_id`),
  CONSTRAINT `spec_ingress_id_fk` FOREIGN KEY (`ingress_id`) REFERENCES `ingress` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec`
--

LOCK TABLES `spec` WRITE;
/*!40000 ALTER TABLE `spec` DISABLE KEYS */;
INSERT INTO `spec` VALUES ('*','service-gateway','{\"id\":0,\"name\":\"service-/**-v0.0.1\",\"uriMatch\":\"{\\\"match\\\":{\\\"uri\\\":{\\\"prefix\\\":\\\"/**\\\"},\\\"headers\\\":{\\\"x-request-version\\\":\\\"v0.0.1\\\"}}}\",\"rewrite\":null,\"route\":null,\"redirect\":null,\"specId\":1,\"new\":false}',1,2);
/*!40000 ALTER TABLE `spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_route_conf`
--

DROP TABLE IF EXISTS `sys_route_conf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sys_route_conf` (
  `id` int NOT NULL AUTO_INCREMENT,
  `route_id` varchar(100) DEFAULT NULL,
  `filters` varchar(1000) DEFAULT NULL,
  `uri` varchar(30) DEFAULT NULL,
  `orders` int DEFAULT NULL,
  `predicates` varchar(10000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_route_conf`
--

LOCK TABLES `sys_route_conf` WRITE;
/*!40000 ALTER TABLE `sys_route_conf` DISABLE KEYS */;
INSERT INTO `sys_route_conf` VALUES (1,'service',NULL,'lb://service',3,'Path=/service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/**'),(2,'ts-seat-service',NULL,'lb://ts-seat-service',3,'Path=/ts-seat-service/api/v1/seatservice/seats/left_tickets,/ts-seat-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/seatservice/seats/left_tickets,/ts-seat-service/api/v1/seatservice/welcome,/ts-seat-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/seatservice/welcome,/ts-seat-service/api/v1/seatservice/seats,/ts-seat-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/seatservice/seats'),(3,'ts-price-service',NULL,'lb://ts-price-service',3,'Path=/ts-price-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/priceservice/prices/{routeId}/{trainType}, /ts-price-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/priceservice/prices/{pricesId}, /ts-price-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/**'),(4,'ts-order-service',NULL,'lb://ts-order-service',3,'Path=/ts-order-service/api/v1/orderservice/order/tickets,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/tickets,/ts-order-service/api/v1/orderservice/order/admin,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/admin,/ts-order-service/api/v1/orderservice/order/query,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/query,/ts-order-service/api/v1/orderservice/order/refresh,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/refresh,/ts-order-service/api/v1/orderservice/welcome,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/welcome,/ts-order-service/api/v1/orderservice/order,/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order,/ts-order-service/api/v1/orderservice/order/status/{orderId}/{status},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/status/{orderId}/{status},/ts-order-service/api/v1/orderservice/order/security/{checkDate}/{accountId},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/security/{checkDate}/{accountId},/ts-order-service/api/v1/orderservice/order/price/{orderId},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/price/{orderId},/ts-order-service/api/v1/orderservice/order/orderPay/{orderId},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/orderPay/{orderId},/ts-order-service/api/v1/orderservice/order/{travelDate}/{trainNumber},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/{travelDate}/{trainNumber},/ts-order-service/api/v1/orderservice/order/{orderId},/ts-order-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderservice/order/{orderId}'),(5,'ts-basic-service',NULL,'lb://ts-basic-service',3,'Path=/ts-basic-service/api/v1/basicservice/basic/travel,/ts-basic-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/basicservice/basic/travel,/ts-basic-service/api/v1/basicservice/basic/travels,/ts-basic-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/basicservice/basic/travels,/ts-basic-service/api/v1/basicservice/welcome,/ts-basic-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/basicservice/welcome,/ts-basic-service/api/v1/basicservice/basic/{stationName},/ts-basic-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/basicservice/basic/{stationName}'),(6,'ts-config-service',NULL,'lb://ts-config-service',3,'Path=/ts-config-service/api/v1/configservice/welcome,/ts-config-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/configservice/welcome,/ts-config-service/api/v1/configservice/configs,/ts-config-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/configservice/configs,/ts-config-service/api/v1/configservice/configs/{configName},/ts-config-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/configservice/configs/{configName}'),(7,'ts-route-service',NULL,'lb://ts-route-service',3,'Path=/ts-route-service/api/v1/routeservice/routes/byIds,/ts-route-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeservice/routes/byIds,/ts-route-service/api/v1/routeservice/welcome,/ts-route-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeservice/welcome,/ts-route-service/api/v1/routeservice/routes,/ts-route-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeservice/routes,/ts-route-service/api/v1/routeservice/routes/{start}/{end},/ts-route-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeservice/routes/{start}/{end},/ts-route-service/api/v1/routeservice/routes/{routeId},/ts-route-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeservice/routes/{routeId}'),(8,'ts-station-service',NULL,'lb://ts-station-service',3,'Path=/ts-station-service/api/v1/stationservice/stations/idlist,/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations/idlist,/ts-station-service/api/v1/stationservice/stations/namelist,/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations/namelist,/ts-station-service/api/v1/stationservice/welcome,/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/welcome,/ts-station-service/api/v1/stationservice/stations,/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations,/ts-station-service/api/v1/stationservice/stations/id/{stationNameForId},/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations/id/{stationNameForId},/ts-station-service/api/v1/stationservice/stations/name/{stationIdForName},/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations/name/{stationIdForName},/ts-station-service/api/v1/stationservice/stations/{stationsId},/ts-station-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationservice/stations/{stationsId}'),(9,'ts-travel-service',NULL,'lb://ts-travel-service',3,'Path=/ts-travel-service/api/v1/travelservice/trips/routes,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/routes,/ts-travel-service/api/v1/travelservice/trips/left,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/left,/ts-travel-service/api/v1/travelservice/trips/left_parallel,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/left_parallel,/ts-travel-service/api/v1/travelservice/welcome,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/welcome,/ts-travel-service/api/v1/travelservice/trips,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips,/ts-travel-service/api/v1/travelservice/trip_detail,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trip_detail,/ts-travel-service/api/v1/travelservice/admin_trip,/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/admin_trip,/ts-travel-service/api/v1/travelservice/train_types/{tripId},/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/train_types/{tripId},/ts-travel-service/api/v1/travelservice/routes/{tripId},/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/routes/{tripId},/ts-travel-service/api/v1/travelservice/trips/{tripId},/ts-travel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/{tripId}'),(10,'ts-adminorder-service',NULL,'lb://ts-adminorder-service',3,'Path=/ts-adminorder-service/api/v1/adminorderservice/welcome,/ts-adminorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminorderservice/welcome,/ts-adminorder-service/api/v1/adminorderservice/adminorder,/ts-adminorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminorderservice/adminorder,/ts-adminorder-service/api/v1/adminorderservice/adminorder/{orderId}/{trainNumber},/ts-adminorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminorderservice/adminorder/{orderId}/{trainNumber}'),(11,'ts-adminrouter-service',NULL,'lb://ts-adminrouter-service',3,'Path=/ts-adminrouter-service/api/v1/adminrouteservice/welcome,/ts-adminrouter-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminrouteservice/welcome,/ts-adminrouter-service/api/v1/adminrouteservice/adminroute,/ts-adminrouter-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminrouteservice/adminroute,/ts-adminrouter-service/api/v1/adminrouteservice/adminroute/{routeId},/ts-adminrouter-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminrouteservice/adminroute/{routeId}'),(12,'ts-admintravel-service',NULL,'lb://ts-admintravel-service',3,'Path=/ts-admintravel-service/api/v1/admintravelservice/welcome,/ts-admintravel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/admintravelservice/welcome,/ts-admintravel-service/api/v1/admintravelservice/admintravel,/ts-admintravel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/admintravelservice/admintravel,/ts-admintravel-service/api/v1/admintravelservice/admintravel/{tripId},/ts-admintravel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/admintravelservice/admintravel/{tripId}'),(13,'ts-adminuser-service',NULL,'lb://ts-adminuser-service',3,'Path=/ts-adminuser-service/api/v1/adminuserservice/users/welcome,/ts-adminuser-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminuserservice/users/welcome,/ts-adminuser-service/api/v1/adminuserservice/users,/ts-adminuser-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminuserservice/users,/ts-adminuser-service/api/v1/adminuserservice/users/{userId},/ts-adminuser-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/adminuserservice/users/{userId}'),(14,'ts-assurance-service',NULL,'lb://ts-assurance-service',3,'Path=/ts-assurance-service/api/v1/assuranceservice/assurances/types,/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances/types,/ts-assurance-service/api/v1/assuranceservice/welcome,/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/welcome,/ts-assurance-service/api/v1/assuranceservice/assurances,/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances,/ts-assurance-service/api/v1/assuranceservice/assurances/assuranceid/{assuranceId},/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances/assuranceid/{assuranceId},/ts-assurance-service/api/v1/assuranceservice/assurances/orderid/{orderId},/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances/orderid/{orderId},/ts-assurance-service/api/v1/assuranceservice/assurance/orderid/{orderId},/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurance/orderid/{orderId},/ts-assurance-service/api/v1/assuranceservice/assurances/{assuranceId}/{orderId}/{typeIndex},/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances/{assuranceId}/{orderId}/{typeIndex},/ts-assurance-service/api/v1/assuranceservice/assurances/{typeIndex}/{orderId},/ts-assurance-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/assuranceservice/assurances/{typeIndex}/{orderId}'),(15,'ts-auth-service',NULL,'lb://ts-auth-service',3,'Path=/ts-auth-service/api/v1/auth/hello,/ts-auth-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/auth/hello,/ts-auth-service/api/v1/users/login,/ts-auth-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/users/login,/ts-auth-service/api/v1/auth,/ts-auth-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/auth,/ts-auth-service/api/v1/users,/ts-auth-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/users,/ts-auth-service/api/v1/users/{userId},/ts-auth-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/users/{userId}'),(16,'ts-cancel-service',NULL,'lb://ts-cancel-service',3,'Path=/ts-cancel-service/api/v1/cancelservice/welcome,/ts-cancel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/cancelservice/welcome,/ts-cancel-service/api/v1/cancelservice/cancel/refound/{orderId},/ts-cancel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/cancelservice/cancel/refound/{orderId},/ts-cancel-service/api/v1/cancelservice/cancel/{orderId}/{loginId},/ts-cancel-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/cancelservice/cancel/{orderId}/{loginId}'),(17,'ts-consign-service',NULL,'lb://ts-consign-service',3,'Path=/ts-consign-service/api/v1/consignservice/welcome,/ts-consign-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignservice/welcome,/ts-consign-service/api/v1/consignservice/consigns,/ts-consign-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignservice/consigns,/ts-consign-service/api/v1/consignservice/consigns/account/{id},/ts-consign-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignservice/consigns/account/{id},/ts-consign-service/api/v1/consignservice/consigns/order/{id},/ts-consign-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignservice/consigns/order/{id},/ts-consign-service/api/v1/consignservice/consigns/{consignee},/ts-consign-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignservice/consigns/{consignee}'),(18,'ts-consignprice-service',NULL,'lb://ts-consignprice-service',3,'Path=/ts-consignprice-service/api/v1/consignpriceservice/consignprice/price,/ts-consignprice-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignpriceservice/consignprice/price,/ts-consignprice-service/api/v1/consignpriceservice/consignprice/config,/ts-consignprice-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignpriceservice/consignprice/config,/ts-consignprice-service/api/v1/consignpriceservice/welcome,/ts-consignprice-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignpriceservice/welcome,/ts-consignprice-service/api/v1/consignpriceservice/consignprice,/ts-consignprice-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignpriceservice/consignprice,/ts-consignprice-service/api/v1/consignpriceservice/consignprice/{weight}/{isWithinRegion},/ts-consignprice-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/consignpriceservice/consignprice/{weight}/{isWithinRegion}'),(19,'ts-contacts-service',NULL,'lb://ts-contacts-service',3,'Path=/ts-contacts-service/api/v1/contactservice/contacts/welcome,/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts/welcome,/ts-contacts-service/api/v1/contactservice/contacts/admin,/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts/admin,/ts-contacts-service/api/v1/contactservice/contacts,/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts,/ts-contacts-service/api/v1/contactservice/contacts/account/{accountId},/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts/account/{accountId},/ts-contacts-service/api/v1/contactservice/contacts/{contactsId},/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts/{contactsId},/ts-contacts-service/api/v1/contactservice/contacts/{id},/ts-contacts-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/contactservice/contacts/{id}'),(20,'ts-execute-service',NULL,'lb://ts-execute-service',3,'Path=/ts-execute-service/api/v1/executeservice/welcome,/ts-execute-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/executeservice/welcome,/ts-execute-service/api/v1/executeservice/execute/execute/{orderId},/ts-execute-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/executeservice/execute/execute/{orderId},/ts-execute-service/api/v1/executeservice/execute/collected/{orderId},/ts-execute-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/executeservice/execute/collected/{orderId}'),(21,'ts-food-service',NULL,'lb://ts-food-service',3,'Path=/ts-food-service/api/foodservice/welcome,/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/welcome,/ts-food-service/api/foodservice/test_send_delivery,/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/test_send_delivery,/ts-food-service/api/foodservice/orders,/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/orders,/ts-food-service/api/foodservice/createOrderBatch,/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/createOrderBatch,/ts-food-service/api/foodservice/foods/{date}/{startStation}/{endStation}/{tripId},/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/foods/{date}/{startStation}/{endStation}/{tripId},/ts-food-service/api/foodservice/orders/{orderId},/ts-food-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/foodservice/orders/{orderId}'),(22,'ts-insidepayment',NULL,'lb://ts-insidepayment',3,'Path=/ts-insidepayment/api/v1/inside_pay_service/inside_payment/account,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/account,/ts-insidepayment/api/v1/inside_pay_service/inside_payment/payment,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/payment,/ts-insidepayment/api/v1/inside_pay_service/inside_payment/difference,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/difference,/ts-insidepayment/api/v1/inside_pay_service/inside_payment/money,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/money,/ts-insidepayment/api/v1/inside_pay_service/welcome,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/welcome,/ts-insidepayment/api/v1/inside_pay_service/inside_payment,/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment,/ts-insidepayment/api/v1/inside_pay_service/inside_payment/drawback/{userId}/{money},/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/drawback/{userId}/{money},/ts-insidepayment/api/v1/inside_pay_service/inside_payment/{userId}/{money},/ts-insidepayment/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/inside_pay_service/inside_payment/{userId}/{money}'),(23,'ts-notification-service',NULL,'lb://ts-notification-service',3,'Path=/ts-notification-service/api/v1/notifyservice/notification/preserve_success,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/notification/preserve_success,/ts-notification-service/api/v1/notifyservice/notification/order_create_success,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/notification/order_create_success,/ts-notification-service/api/v1/notifyservice/notification/order_changed_success,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/notification/order_changed_success,/ts-notification-service/api/v1/notifyservice/notification/order_cancel_success,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/notification/order_cancel_success,/ts-notification-service/api/v1/notifyservice/welcome,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/welcome,/ts-notification-service/api/v1/notifyservice/test_send_mq,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/test_send_mq,/ts-notification-service/api/v1/notifyservice/test_send_mail,/ts-notification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/notifyservice/test_send_mail'),(24,'ts-orderother-service',NULL,'lb://ts-orderother-service',3,'Path=/ts-orderother-service/api/v1/orderOtherService/orderOther/tickets,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/tickets,/ts-orderother-service/api/v1/orderOtherService/orderOther/admin,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/admin,/ts-orderother-service/api/v1/orderOtherService/orderOther/query,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/query,/ts-orderother-service/api/v1/orderOtherService/orderOther/refresh,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/refresh,/ts-orderother-service/api/v1/orderOtherService/welcome,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/welcome,/ts-orderother-service/api/v1/orderOtherService/orderOther,/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther,/ts-orderother-service/api/v1/orderOtherService/orderOther/status/{orderId}/{status},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/status/{orderId}/{status},/ts-orderother-service/api/v1/orderOtherService/orderOther/security/{checkDate}/{accountId},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/security/{checkDate}/{accountId},/ts-orderother-service/api/v1/orderOtherService/orderOther/price/{orderId},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/price/{orderId},/ts-orderother-service/api/v1/orderOtherService/orderOther/orderPay/{orderId},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/orderPay/{orderId},/ts-orderother-service/api/v1/orderOtherService/orderOther/{travelDate}/{trainNumber},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/{travelDate}/{trainNumber},/ts-orderother-service/api/v1/orderOtherService/orderOther/{orderId},/ts-orderother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/orderOtherService/orderOther/{orderId}'),(25,'ts-payment-service',NULL,'lb://ts-payment-service',3,'Path=/ts-payment-service/api/v1/paymentservice/payment/money,/ts-payment-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/paymentservice/payment/money,/ts-payment-service/api/v1/paymentservice/welcome,/ts-payment-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/paymentservice/welcome,/ts-payment-service/api/v1/paymentservice/payment,/ts-payment-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/paymentservice/payment'),(26,'ts-preserve-service',NULL,'lb://ts-preserve-service',3,'Path=/ts-preserve-service/api/v1/preserveservice/welcome,/ts-preserve-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/preserveservice/welcome,/ts-preserve-service/api/v1/preserveservice/preserve,/ts-preserve-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/preserveservice/preserve'),(27,'ts-preserveother-service',NULL,'lb://ts-preserveother-service',3,'Path=/ts-preserveother-service/api/v1/preserveotherservice/welcome,/ts-preserveother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/preserveotherservice/welcome,/ts-preserveother-service/api/v1/preserveotherservice/preserveOther,/ts-preserveother-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/preserveotherservice/preserveOther'),(28,'ts-rebook-service',NULL,'lb://ts-rebook-service',3,'Path=/ts-rebook-service/api/v1/rebookservice/rebook/difference,/ts-rebook-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/rebookservice/rebook/difference,/ts-rebook-service/api/v1/rebookservice/welcome,/ts-rebook-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/rebookservice/welcome,/ts-rebook-service/api/v1/rebookservice/rebook,/ts-rebook-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/rebookservice/rebook'),(29,'ts-routeplan-service',NULL,'lb://ts-routeplan-service',3,'Path=/ts-routeplan-service/api/v1/routeplanservice/routePlan/cheapestRoute,/ts-routeplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeplanservice/routePlan/cheapestRoute,/ts-routeplan-service/api/v1/routeplanservice/routePlan/quickestRoute,/ts-routeplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeplanservice/routePlan/quickestRoute,/ts-routeplan-service/api/v1/routeplanservice/routePlan/minStopStations,/ts-routeplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeplanservice/routePlan/minStopStations,/ts-routeplan-service/api/v1/routeplanservice/welcome,/ts-routeplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/routeplanservice/welcome'),(30,'ts-security-service',NULL,'lb://ts-security-service',3,'Path=/ts-security-service/api/v1/securityservice/welcome,/ts-security-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/securityservice/welcome,/ts-security-service/api/v1/securityservice/securityConfigs,/ts-security-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/securityservice/securityConfigs,/ts-security-service/api/v1/securityservice/securityConfigs/{id},/ts-security-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/securityservice/securityConfigs/{id},/ts-security-service/api/v1/securityservice/securityConfigs/{accountId},/ts-security-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/securityservice/securityConfigs/{accountId}'),(31,'ts-stationfood-service',NULL,'lb://ts-stationfood-service',3,'Path=/ts-stationfood-service/api/v1/stationfoodservice/stationfoodstores/welcome,/ts-stationfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationfoodservice/stationfoodstores/welcome,/ts-stationfood-service/api/v1/stationfoodservice/stationfoodstores,/ts-stationfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationfoodservice/stationfoodstores,/ts-stationfood-service/api/v1/stationfoodservice/stationfoodstores/bystoreid/{stationFoodStoreId},/ts-stationfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationfoodservice/stationfoodstores/bystoreid/{stationFoodStoreId},/ts-stationfood-service/api/v1/stationfoodservice/stationfoodstores/{stationId},/ts-stationfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/stationfoodservice/stationfoodstores/{stationId}'),(32,'ts-trainfood-service',NULL,'lb://ts-trainfood-service',3,'Path=/ts-trainfood-service/api/v1/trainfoodservice/trainfoods/welcome,/ts-trainfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/trainfoodservice/trainfoods/welcome,/ts-trainfood-service/api/v1/trainfoodservice/trainfoods,/ts-trainfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/trainfoodservice/trainfoods,/ts-trainfood-service/api/v1/trainfoodservice/trainfoods/{tripId},/ts-trainfood-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/trainfoodservice/trainfoods/{tripId}'),(33,'ts-travel2-service',NULL,'lb://ts-travel2-service',3,'Path=/ts-travel2-service/api/v1/travel2service/trips/routes,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/trips/routes,/ts-travel2-service/api/v1/travel2service/trips/left,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/trips/left,/ts-travel2-service/api/v1/travel2service/welcome,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/welcome,/ts-travel2-service/api/v1/travel2service/trips,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/trips,/ts-travel2-service/api/v1/travel2service/trip_detail,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/trip_detail,/ts-travel2-service/api/v1/travel2service/admin_trip,/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/admin_trip,/ts-travel2-service/api/v1/travel2service/train_types/{tripId},/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/train_types/{tripId},/ts-travel2-service/api/v1/travel2service/routes/{tripId},/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/routes/{tripId},/ts-travel2-service/api/v1/travel2service/trips/{tripId},/ts-travel2-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travel2service/trips/{tripId}'),(34,'ts-travelplan-service',NULL,'lb://ts-travelplan-service',3,'Path=/ts-travelplan-service/api/v1/travelplanservice/travelPlan/transferResult,/ts-travelplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelplanservice/travelPlan/transferResult,/ts-travelplan-service/api/v1/travelplanservice/travelPlan/cheapest,/ts-travelplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelplanservice/travelPlan/cheapest,/ts-travelplan-service/api/v1/travelplanservice/travelPlan/quickest,/ts-travelplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelplanservice/travelPlan/quickest,/ts-travelplan-service/api/v1/travelplanservice/travelPlan/minStation,/ts-travelplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelplanservice/travelPlan/minStation,/ts-travelplan-service/api/v1/travelplanservice/welcome,/ts-travelplan-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelplanservice/welcome'),(35,'ts-user-service',NULL,'lb://ts-user-service',3,'Path=/ts-user-service/api/v1/travelservice/trips/routes,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/routes,/ts-user-service/api/v1/travelservice/trips/left,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/left,/ts-user-service/api/v1/travelservice/trips/left_parallel,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/left_parallel,/ts-user-service/api/v1/travelservice/welcome,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/welcome,/ts-user-service/api/v1/travelservice/trips,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips,/ts-user-service/api/v1/travelservice/trip_detail,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trip_detail,/ts-user-service/api/v1/travelservice/admin_trip,/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/admin_trip,/ts-user-service/api/v1/travelservice/train_types/{tripId},/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/train_types/{tripId},/ts-user-service/api/v1/travelservice/routes/{tripId},/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/routes/{tripId},/ts-user-service/api/v1/travelservice/trips/{tripId},/ts-user-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/travelservice/trips/{tripId}'),(36,'ts-verification-service',NULL,'lb://ts-verification-service',3,'Path=/ts-verification-service/api/v1/verifycode/generate,/ts-verification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/verifycode/generate,/ts-verification-service/api/v1/verifycode/verify/{verifyCode},/ts-verification-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/verifycode/verify/{verifyCode}'),(37,'ts-waitlistorder-service',NULL,'lb://ts-waitlistorder-service',3,'Path=/ts-waitlistorder-service/api/v1/waitorderservice/welcome,/ts-waitlistorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/waitorderservice/welcome,/ts-waitlistorder-service/api/v1/waitorderservice/order,/ts-waitlistorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/waitorderservice/order,/ts-waitlistorder-service/api/v1/waitorderservice/orders,/ts-waitlistorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/waitorderservice/orders,/ts-waitlistorder-service/api/v1/waitorderservice/waitlistorders,/ts-waitlistorder-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/waitorderservice/waitlistorders'),(38,'ts-fooddelivery-service',NULL,'lb://ts-fooddelivery-service',3,'Path=/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/all,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/all,/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/tripid,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/tripid,/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/seatno,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/seatno,/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/dtime,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/dtime,/ts-fooddelivery-service/api/v1/fooddeliveryservice/welcome,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/welcome,/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders,/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders,/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/d/{orderId},/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/d/{orderId},/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/store/{storeId},/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/store/{storeId},/ts-fooddelivery-service/api/v1/fooddeliveryservice/orders/{orderId},/ts-fooddelivery-service/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/v1/fooddeliveryservice/orders/{orderId}'),(42,'agent-test3',NULL,'lb://agent-test3',3,'Path=/agent-test3/api/agent3/chain/zero,/agent-test3/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent3/chain/zero,/agent-test3/api/agent3/chain/one,/agent-test3/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent3/chain/one'),(43,'agent-test1',NULL,'lb://agent-test1',3,'Path=/agent-test1/api/agent1/chain/one,/agent-test1/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent1/chain/one,/agent-test1/api/agent1/chain/two,/agent-test1/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent1/chain/two,/agent-test1/api/agent1/chain/three,/agent-test1/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent1/chain/three'),(44,'agent-test2',NULL,'lb://agent-test2',3,'Path=/agent-test2/api/agent2/chain/zero,/agent-test2/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent2/chain/zero,/agent-test2/api/agent2/chain/one,/agent-test2/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent2/chain/one,/agent-test2/api/agent2/chain/two,/agent-test2/{version:v[0-9]+\\.[0-9]+\\.[0-9]+}/api/agent2/chain/two');
/*!40000 ALTER TABLE `sys_route_conf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `instance_view`
--

/*!50001 DROP VIEW IF EXISTS `instance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `instance_view` AS select `instance`.`service_id` AS `service_id`,`instance`.`version_id` AS `version_id`,`m_service_version`.`major_version` AS `major_version`,`m_service_version`.`minor_version` AS `minor_version`,`m_service_version`.`patch_version` AS `patch_version`,`instance`.`ip` AS `ip`,`instance`.`port` AS `port`,`instance`.`healthy` AS `healthy`,`instance`.`service_name` AS `service_name`,`instance`.`instance_id` AS `instance_id`,`m_service`.`description` AS `description` from ((`instance` join `m_service_version`) join `m_service`) where ((`instance`.`version_id` = `m_service_version`.`version_id`) and (`instance`.`service_id` = `m_service`.`service_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `ser_interface`
--

/*!50001 DROP VIEW IF EXISTS `ser_interface`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `ser_interface` AS select `m_service`.`service_id` AS `service_id`,`m_service_version`.`version_id` AS `version_id`,`m_service_interface`.`interface_id` AS `interface_id`,`m_service`.`service_name` AS `service_name`,`m_service`.`description` AS `description`,`m_service_version`.`major_version` AS `major_version`,`m_service_version`.`minor_version` AS `minor_version`,`m_service_version`.`patch_version` AS `patch_version`,`m_service_interface`.`uri` AS `uri`,`m_service_interface`.`type` AS `type`,`m_service_interface`.`interval` AS `interval`,`m_service_interface`.`compatible_marker` AS `compatible_marker` from ((`m_service` join `m_service_version`) join `m_service_interface`) where ((`m_service_version`.`version_id` = `m_service_interface`.`version_id`) and (`m_service`.`service_id` = `m_service_version`.`service_id`)) */;
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

-- Dump completed on 2024-06-18 16:50:33
