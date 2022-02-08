-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: itadakifooddb.mysql.database.azure.com    Database: itadakifood
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `restaurants`
--

DROP TABLE IF EXISTS `restaurants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurants` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `cuisine` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `restaurant_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` float NOT NULL,
  `location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `operating_hours` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(2049) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `restaurant_name_UNIQUE` (`restaurant_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurants`
--

LOCK TABLES `restaurants` WRITE;
/*!40000 ALTER TABLE `restaurants` DISABLE KEYS */;
INSERT INTO `restaurants` VALUES (1,'Western','McDonalds',5,'21, 01-02 Tampines Ave 1, 30B Temasek Polytechnic, 529757','0800-1600','https://www.mcdonalds.com.sg/','ops@sg.mcd.com'),(2,'Japanese','Ichiban Boshi',5,'80 Marine Parade Road, Parkway Parade #02-12, 449269','1130-2200','https://www.ichibanboshi.com.sg/en/','contactus@res.com.sg'),(3,'Western','Shake Shack',5,'3 Temasek Blvd, #01-357, Singapore 038983','1030-2200','https://www.shakeshack.com.sg/','sharewithus@shakeshack.com.sg'),(4,'Western','KFC',5,'80 Marine Parade Road ＃01-11A Parkway Parade, Singapore 449269','0800-2200','https://www.kfc.com.sg/',NULL),(5,'Japanese','Sushiro',5,'302 Tiong Bahru Rd, #02-118, Singapore 168732','1100-2200','',NULL),(6,'Japanese','Ajisen Ramen',5,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1100-2200','https://www.ajisen.com.sg/','feedback@jfh.com.sg'),(7,'French','la bonne table',5,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1200-1400, 1800-2200','https://labonnetablesg.com/',NULL),(8,'Japanese','Pepper Lunch',5,'311 New Upper Changi Rd, #01-05/06/07/08, Singapore 467360','1000-2200','http://www.pepperlunch.com.sg/',NULL),(9,'Western','Subway',5,'1 Marine Parade Central, #01-05 Parkway Centre, Singapore 449408','0800-2200','https://www.subway.com/en-SG/','asia_development@subway.com'),(10,'German','Brotzeit Katong',5,'126 E Coast Rd, Singapore 428811','1100-2230','http://www.brotzeit.co/','info@brotzeit.co'),(11,'Seafood','Roland Restaurant',5,'89 Marine Parade Central, #06-750, Singapore 440089','1130-1430, 1800-2200','https://www.rolandrestaurant.com.sg/','justin@rolandrestaurant.com.sg'),(12,'Mexican','Lower East Side Tacqueria',5,'19 E Coast Rd, #01-02, Singapore 428746','1100-2300','https://www.hiddendoorconcepts.com/lowereastside','les@hiddendoor.com.sg'),(13,'Indian','The Mango Tree',5,'91 E Coast Rd, #01-00, Singapore 428791','1130-1430, 1800-2200','http://www.themangotree.com.sg/','feedback@themangotree.com.sg'),(14,'Asian','Baba Chews Bar and Eatery',5,'86 E Coast Rd, Katong Square, Singapore 428788','1130-2200','http://babachews.com.sg/',NULL),(15,'Mexican','Platypus Cantina',5,'171 E Coast Rd, Singapore 428877','1200-2230','http://www.platypuscantina.com/','plat@nicholaslin.com'),(16,'Chinese','Jia Wei Chinese Restaurant',5,'50 East Coast Road, Roxy Square, Level 2 Grand Mercure Singapore Roxy, 428769','1200-2100','https://www.jiaweirestaurant.com/',NULL),(17,'Italian','Volare',5,'11 E Coast Rd, 01-22, Singapore 428722','1130-2230','http://www.volare-sg.com/','hello@volare-sg.com '),(18,'Indian','Zaffron Kitchen',5,'137 E Coast Rd, 135, Singapore 428820','1130-1430, 1730-2200','http://www.zaffronkitchen.com/',NULL),(19,'Indian','Butter & Spice',5,'66 E Coast Rd, #01-06 The Flow, Singapore 428778','1100-2245','https://butterandspice.oddle.me/en_SG/','sachconcepts@gmail.com'),(20,'Thai','A-Roy Thai Restaurant',4.5,' 205 E Coast Rd, Singapore 428904','1130-1500, 1730-2130','',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 23:17:06
