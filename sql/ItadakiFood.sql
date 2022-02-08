CREATE DATABASE  IF NOT EXISTS `itadakifood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `itadakifood`;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (7,1,'macs.jpg'),(8,20,'A-Roy-Thai.jpg'),(9,20,'a-Roy-Thai food.jpg'),(10,17,'Volare food.jpg'),(49,3,'shake shack49.jpg'),(50,4,'kfc50.png'),(51,1,'McDonalds Drive Thru51.jpg'),(52,1,'McDonalds resImg52.jpg'),(53,1,'McDonalds img53.jpg'),(54,1,'McDonalds54.jpg'),(56,20,'MacImg55.jpg');
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
) ENGINE=InnoDB AUTO_INCREMENT=167 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (23,40,13),(24,40,15),(118,100,24),(120,102,13),(121,102,13),(122,102,13),(123,100,10);
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
INSERT INTO `restaurants` VALUES (1,'Western','McDonalds',5,'21, 01-02 Tampines Ave 1, 30B Temasek Polytechnic, 529757','0800-1600','https://www.mcdonalds.com.sg/','ops@sg.mcd.com'),(2,'Japanese','Ichiban Boshi',5,'80 Marine Parade Road, Parkway Parade #02-12, 449269','1130-2200','https://www.ichibanboshi.com.sg/en/','contactus@res.com.sg'),(3,'Western','Shake Shack',5,'3 Temasek Blvd, #01-357, Singapore 038983','1030-2200','https://www.shakeshack.com.sg/','sharewithus@shakeshack.com.sg'),(4,'Western','KFC',5,'80 Marine Parade Road ＃01-11A Parkway Parade, Singapore 449269','0800-2200','https://www.kfc.com.sg/',NULL),(5,'Japanese','Sushiro',5,'302 Tiong Bahru Rd, #02-118, Singapore 168732','1100-2200','',NULL),(6,'Japanese','Ajisen Ramen',5,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1100-2200','https://www.ajisen.com.sg/','feedback@jfh.com.sg'),(7,'French','la bonne table',5,'311 New Upper Changi Rd, Bedok Mall, #01-69, Singapore 467360','1200-1400, 1800-2200','https://labonnetablesg.com/',NULL),(8,'Japanese','Pepper Lunch',5,'311 New Upper Changi Rd, #01-05/06/07/08, Singapore 467360','1000-2200','http://www.pepperlunch.com.sg/',NULL),(9,'Western','Subway',5,'1 Marine Parade Central, #01-05 Parkway Centre, Singapore 449408','0800-2200','https://www.subway.com/en-SG/','asia_development@subway.com'),(10,'German','Brotzeit Katong',5,'126 E Coast Rd, Singapore 428811','1100-2230','http://www.brotzeit.co/','info@brotzeit.co'),(11,'Seafood','Roland Restaurant',5,'89 Marine Parade Central, #06-750, Singapore 440089','1130-1430, 1800-2200','https://www.rolandrestaurant.com.sg/','justin@rolandrestaurant.com.sg'),(12,'Mexican','Lower East Side Tacqueria',5,'19 E Coast Rd, #01-02, Singapore 428746','1100-2300','https://www.hiddendoorconcepts.com/lowereastside','les@hiddendoor.com.sg'),(13,'Indian','The Mango Tree',5,'91 E Coast Rd, #01-00, Singapore 428791','1130-1430, 1800-2200','http://www.themangotree.com.sg/','feedback@themangotree.com.sg'),(14,'Asian','Baba Chews Bar and Eatery',5,'86 E Coast Rd, Katong Square, Singapore 428788','1130-2200','http://babachews.com.sg/',NULL),(15,'Mexican','Platypus Cantina',5,'171 E Coast Rd, Singapore 428877','1200-2230','http://www.platypuscantina.com/','plat@nicholaslin.com'),(16,'Chinese','Jia Wei Chinese Restaurant',5,'50 East Coast Road, Roxy Square, Level 2 Grand Mercure Singapore Roxy, 428769','1200-2100','https://www.jiaweirestaurant.com/',NULL),(17,'Italian','Volare',5,'11 E Coast Rd, 01-22, Singapore 428722','1130-2230','http://www.volare-sg.com/','hello@volare-sg.com '),(18,'Indian','Zaffron Kitchen',5,'137 E Coast Rd, 135, Singapore 428820','1130-1430, 1730-2200','http://www.zaffronkitchen.com/',NULL),(19,'Indian','Butter & Spice',5,'66 E Coast Rd, #01-06 The Flow, Singapore 428778','1100-2245','https://butterandspice.oddle.me/en_SG/','sachconcepts@gmail.com'),(20,'Thai','A-Roy Thai Restaurant',4.5,' 205 E Coast Rd, Singapore 428904','1130-1500, 1730-2130','',NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
INSERT INTO `reviews` VALUES (10,1,NULL,'Waitors were nice',5,'2022-01-05 01:46:00','Excellent service','Deleted User'),(11,2,NULL,'The design was pleasant',5,'2022-01-07 06:07:48','Great design','Deleted User'),(13,20,NULL,'Food was nice',5,'2022-01-06 13:22:38','Nice','Deleted User'),(14,20,20,'Food is delicious',5,'2022-01-07 06:06:23','Good food','Scarlet Witch'),(15,20,20,'The food was finger lickin\' good',5,'2022-01-07 06:09:29','100% would come again','Scarlet Witch'),(19,20,NULL,'The food was finger lickin\' good',5,'2022-01-11 07:54:47','100% would come again','Deleted User'),(21,20,NULL,'The food was great, would come again',4,'2022-01-25 07:11:00','Delicious Food','Deleted User'),(24,1,NULL,'I like the McChicken',4,'2022-01-31 10:26:11','Food is Nice','Deleted User'),(45,2,NULL,'cheap and good food but the mantou was grey',3,'2022-02-06 06:53:45','set menu was a bomb','Deleted User'),(47,18,103,'why is the mantou grey',5,'2022-02-06 06:56:02','yes','dd'),(48,3,103,'cheap and good food but the mantou was grey',4,'2022-02-06 06:56:26','they didnt let me take a cup of water','dd'),(50,4,NULL,'I love the zinger box',4,'2022-02-06 07:04:25','Its Finger Lickin\' good','Deleted User'),(51,2,107,'hi good restaurant',5,'2022-02-06 13:21:11','hello','zion'),(53,19,107,'food was fab would come again',5,'2022-02-06 13:25:32','good food','zion'),(55,20,NULL,'The food was michelin star',4,'2022-02-06 15:03:35','Food was great','Deleted User'),(56,20,NULL,'Food was bad',1,'2022-02-06 15:09:43','Not niceFood','Deleted User');
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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'Tony','Stark','Iron man','$2b$10$evpWwZh16nJX7mLODbK2mu4nDfjxeRtL7SQXL327pUrZQPOXv3mPC','male','1 HarbourFront Walk, #B2-22 VivoCity, Singapore 098585','ironman@gmail.com','97955963','iron man.jpg',0),(17,'Peter','Parker','Spiderman','$2b$10$rj4lYTH8A5Zdo0Av3YTGl.itIZr5O/X3JNUkATPeYT2iw1EuVCe3e','male','370 Alexandra Rd, Singapore 159953','spiderman@gmail.com','87161602','spiderman.jpg',0),(18,'Bucky','Barnes','Winter Soldier','$2b$10$fPrOywtB9UEhz4QHUj7YsOyMjdQq4VW0uuYRj3nOEUMrYB7SP7nbi','male','510 Bedok Nth St 3 #01-11','wintersoldier@gmail.com','97942408','Winter Soldier.jpg',0),(19,'Steve','Roger','Captain America','$2b$10$rtq3KUevq4Ljzzl77z1uIOexJvj8M.SgfebUI6QRaRHs27OS3BV..','male','432 Race Course Rd, Singapore 218678','captainamerica@gmail.com','98890632','captain america.jpg',0),(20,'Wanda','Maximoff','Scarlet Witch','$2b$10$ZuvdzpdNmHfI7COuf1yGZOzGJgyfyiyLgEkFXU7sq/DeJh1Kf160W','female','9002 Tampines Street 93, #03-02, Singapore 528836','scarletwitch@gmail.com','95456318','The Scarlet Witch.jpg',0),(37,'T','Challa','Black Panther','$2b$10$dDkqts7wH3iL29Htubi.t.5lls6zYYPklrgw1EvWEDMAyklSxhgbq','Male','1 Beach Rd, Singapore 189673','blackpanther@gmail.com','98329920',NULL,0),(40,'Bruce','Banner','Hulk','$2b$10$tecHrhdlGcIZKyHtEnktFueNsUpOr/TRY9a2MIlG3MTtV1gwHuch6','Male','3 Sungei Kadut Cres, Singapore 728686','hulk@gmail.com','86897279','hulk41.jpg',0),(41,'Natasha','Romanoff','Black Widow','$2b$10$w1gPLDOxWsiD4BH8b7zKgeBgtWek.P67h0daNRZgp.ovq6YIrqpkK','Female','360 Orchard Rd, Singapore 238869','blackwidow@gmail.com','85574388','black widow42.jpg',0),(98,'Loo','Mi','Loo','$2b$10$4xv4uNXEmGHvJBj1IjTHEOkhNz3UdCrC1pXDwtm2ARPdN/4AmzmKC','Female','Blk 55 Marine Terrace','lynn@yahoo.com.sg','96510186',NULL,0),(100,'ABig','Teapot','ABigTeapot','$2b$10$6XL9ckqd6bgh8mwDsYmSeu3udizKP/p4E5vLWeuV9W38xURhi1VBq','Female','314 Shunfu Rd, Singapore 570314','2101738I@student.tp.edu.sg','85410183','Bald Teapot101.jpg',0),(101,'Aloy','Tan','aloy12341','$2b$10$2WPwfI/B9Nm9BIfg1kgOteV1pfh0xbF1nlv6DluwzW2qv/mmzBeD2','Male','lllll@gmail.com','FireMan4302@gmail.com','90235252',NULL,0),(102,'Aloy','Aloy','Aloy1','$2b$10$q/hmsHFlZF80y12Q9qcnGOJHhif2ReVLjyg.j4/C/.A0buJycBk8u','Male','Aloy','Aloy@gm','Aloy',NULL,0),(103,'daniel','dd','dd','$2b$10$hudPmHcPGNd7IgfXp6CgaOadvcFyKkb6QBBbj6aNSc0hzE1HWwUkG','Male','dd','dd@ss.com','dd',NULL,0),(107,'zion','ng','zion','$2b$10$yxGI.9avnPu6.U.RLuDONOBvTQjH8GePyu9GvymyTVIuuBEKzARk2','Male','geylang','gohhongrui@gmail.com','83172379','Screenshot 2021-08-09 174330108.png',0);
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

-- Dump completed on 2022-02-06 23:17:39
