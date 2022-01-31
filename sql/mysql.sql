CREATE DATABASE  IF NOT EXISTS `itadakifood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `itadakifood`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: itadakifood
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `restaurantId2` int NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `image_UNIQUE` (`image`),
  KEY `restaurantId_idx` (`restaurantId2`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (7,1,'macs.jpg'),(8,20,'A-Roy-Thai.jpg'),(9,20,'a-Roy-Thai food.jpg'),(10,17,'Volare food.jpg'),(12,3,'shake shack.jpg');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `userId2` int DEFAULT NULL,
  `reviewId` int NOT NULL,
  PRIMARY KEY (`_id`),
  KEY `userId_idx` (`userId2`),
  KEY `reviewId_idx` (`reviewId`),
  CONSTRAINT `reviewId` FOREIGN KEY (`reviewId`) REFERENCES `reviews` (`id`),
  CONSTRAINT `userId2` FOREIGN KEY (`userId2`) REFERENCES `users` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (23,40,13),(24,40,15),(25,25,13),(26,25,15);
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `restaurants` VALUES (1,'Western','MacDonalds',5,'21, 01-02 Tampines Ave 1, 30B Temasek Polytechnic, 529757','0800-1600','https://www.mcdonalds.com.sg/','ops@sg.mcd.com'),(2,'Japanese','Ichiban Boshi',5,'80 Marine Parade Road, Parkway Parade #02-12, 449269','1130-2200','https://www.ichibanboshi.com.sg/en/','contactus@res.com.sg'),(3,'Western','Shake Shack',0,'3 Temasek Blvd, #01-357, Singapore 038983','1030-2200','https://www.shakeshack.com.sg/','sharewithus@shakeshack.com.sg'),(4,'Western','KFC',0,'80 Marine Parade Road ＃01-11A Parkway Parade, Singapore 449269','0800-2200','https://www.kfc.com.sg/',NULL),(5,'Japanese','Sushiro',0,'302 Tiong Bahru Rd, #02-118, Singapore 168732','1100-2200','',NULL),(6,'Japanese','Ajisen Ramen',0,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1100-2200','https://www.ajisen.com.sg/','feedback@jfh.com.sg'),(7,'French','la bonne table',0,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1200-1400, 1800-2200','https://labonnetablesg.com/',NULL),(8,'Japanese','Pepper Lunch',0,'311 New Upper Changi Rd, #01-05/06/07/08, Singapore 467360','1000-2200','http://www.pepperlunch.com.sg/',NULL),(9,'Western','Subway',0,'1 Marine Parade Central, #01-05 Parkway Centre, Singapore 449408','0800-2200','https://www.subway.com/en-SG/','asia_development@subway.com'),(10,'German','Brotzeit Katong',0,'126 E Coast Rd, Singapore 428811','1100-2230','http://www.brotzeit.co/','info@brotzeit.co'),(11,'Seafood','Roland Restaurant',0,'89 Marine Parade Central, #06-750, Singapore 440089','1130-1430, 1800-2200','https://www.rolandrestaurant.com.sg/','justin@rolandrestaurant.com.sg'),(12,'Mexican','Lower East Side Tacqueria',0,'19 E Coast Rd, #01-02, Singapore 428746','1100-2300','https://www.hiddendoorconcepts.com/lowereastside','les@hiddendoor.com.sg'),(13,'Indian','The Mango Tree',0,'91 E Coast Rd, #01-00, Singapore 428791','1130-1430, 1800-2200','http://www.themangotree.com.sg/','feedback@themangotree.com.sg'),(14,'Asian','Baba Chews Bar and Eatery',0,'86 E Coast Rd, Katong Square, Singapore 428788','1130-2200','http://babachews.com.sg/',NULL),(15,'Mexican','Platypus Cantina',0,'171 E Coast Rd, Singapore 428877','1200-2230','http://www.platypuscantina.com/','plat@nicholaslin.com'),(16,'Chinese','Jia Wei Chinese Restaurant',0,'50 East Coast Road, Roxy Square, Level 2 Grand Mercure Singapore Roxy, 428769','1200-2100','https://www.jiaweirestaurant.com/',NULL),(17,'Italian','Volare',0,'11 E Coast Rd, 01-22, Singapore 428722','1130-2230','http://www.volare-sg.com/','hello@volare-sg.com '),(18,'Indian','Zaffron Kitchen',0,'137 E Coast Rd, 135, Singapore 428820','1130-1430, 1730-2200','http://www.zaffronkitchen.com/',NULL),(19,'Indian','Butter & Spice',0,'66 E Coast Rd, #01-06 The Flow, Singapore 428778','1100-2245','https://butterandspice.oddle.me/en_SG/','sachconcepts@gmail.com'),(20,'Thai','A-Roy Thai Restaurant',4.5,' 205 E Coast Rd, Singapore 428904','1130-1500, 1730-2130','',NULL);
/*!40000 ALTER TABLE `restaurants` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurantId` int NOT NULL,
  `userId` int DEFAULT NULL,
  `review` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `rating` int NOT NULL,
  `date` datetime NOT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `restaurantId_idx` (`restaurantId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `restaurantId` FOREIGN KEY (`restaurantId`) REFERENCES `restaurants` (`_id`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (10,1,NULL,'Waitors were nice',5,'2022-01-05 01:46:00','Excellent service','Deleted User'),(11,2,NULL,'The design was pleasant',5,'2022-01-07 06:07:48','Great design','Deleted User'),(13,20,NULL,'Food was nice',5,'2022-01-06 13:22:38','Nice','Deleted User'),(14,20,20,'Food is delicious',5,'2022-01-07 06:06:23','Good food','Scarlet Witch'),(15,20,20,'The food was finger lickin\' good',5,'2022-01-07 06:09:29','100% would come again','Scarlet Witch'),(19,20,NULL,'The food was finger lickin\' good',5,'2022-01-11 07:54:47','100% would come again','Deleted User'),(21,20,NULL,'The food was great, would come again',4,'2022-01-25 07:11:00','Delicious Food','Deleted User'),(24,1,94,'I like the McChicken',4,'2022-01-31 10:26:11','Food is Nice','ABigTeapot');
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(72) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(90) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `likes` int NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'Tony','Stark','Iron man','$2b$10$evpWwZh16nJX7mLODbK2mu4nDfjxeRtL7SQXL327pUrZQPOXv3mPC','male','1 HarbourFront Walk, #B2-22 VivoCity, Singapore 098585','ironman@gmail.com','97955963','iron man.jpg',0),(17,'Peter','Parker','Spiderman','$2b$10$rj4lYTH8A5Zdo0Av3YTGl.itIZr5O/X3JNUkATPeYT2iw1EuVCe3e','male','370 Alexandra Rd, Singapore 159953','spiderman@gmail.com','87161602','spiderman.jpg',0),(18,'Bucky','Barnes','Winter Soldier','$2b$10$fPrOywtB9UEhz4QHUj7YsOyMjdQq4VW0uuYRj3nOEUMrYB7SP7nbi','male','510 Bedok Nth St 3 #01-11','wintersoldier@gmail.com','97942408','Winter Soldier.jpg',0),(19,'Steve','Roger','Captain America','$2b$10$rtq3KUevq4Ljzzl77z1uIOexJvj8M.SgfebUI6QRaRHs27OS3BV..','male','432 Race Course Rd, Singapore 218678','captainamerica@gmail.com','98890632','captain america.jpg',0),(20,'Wanda','Maximoff','Scarlet Witch','$2b$10$ZuvdzpdNmHfI7COuf1yGZOzGJgyfyiyLgEkFXU7sq/DeJh1Kf160W','female','9002 Tampines Street 93, #03-02, Singapore 528836','scarletwitch@gmail.com','95456318','The Scarlet Witch.jpg',0),(25,'Steven','Strange','Doctor Strange','$2b$10$grTfD6hLa4.GBrcq0CH2gu9mGHLIwbj.BmEttl0KXaTQxd/rzUqCy','Male','125 Telok Ayer St, Singapore 068594','doctorstrange@gmail.com','93930959','doctor-strange pfp21.jpg',0),(37,'T','Challa','Black Panther','$2b$10$dDkqts7wH3iL29Htubi.t.5lls6zYYPklrgw1EvWEDMAyklSxhgbq','Male','1 Beach Rd, Singapore 189673','blackpanther@gmail.com','98329920',NULL,0),(40,'Bruce','Banner','Hulk','$2b$10$tecHrhdlGcIZKyHtEnktFueNsUpOr/TRY9a2MIlG3MTtV1gwHuch6','Male','3 Sungei Kadut Cres, Singapore 728686','hulk@gmail.com','86897279','hulk41.jpg',0),(41,'Natasha','Romanoff','Black Widow','$2b$10$w1gPLDOxWsiD4BH8b7zKgeBgtWek.P67h0daNRZgp.ovq6YIrqpkK','Female','360 Orchard Rd, Singapore 238869','blackwidow@gmail.com','85574388','black widow42.jpg',0),(94,'A Big','Teapot','ABigTeapot','$2b$10$2gN7L4WtIijWdfC6/28oq.l.30UJ0pq/3VUlF00E1kXjZWNZXG6wy','Male','13B Tuas Rd, Singapore 638514','iamsmolboy@gmail.com','91583401','Bald Teapot95.jpg',0),(96,'Hong Ler','Goh','bruhmoment','$2b$10$CCEomkaiN7UhfeXqURwPo.1IjEhZ79dULfZ3qBTH/WCJWEcOPSOvy','Female','17 Stanley St, Singapore 068736','gohhongrui@gmail.com','83381497','bruhmomentpff95.jpg',0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-31 21:51:48
