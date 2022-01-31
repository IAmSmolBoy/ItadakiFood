CREATE DATABASE  IF NOT EXISTS `itadakifood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `itadakifood`;
-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: itadakifood
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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(45) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(72) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(90) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mobile_number` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_pic` longtext COLLATE utf8mb4_unicode_ci,
  `likes` int NOT NULL,
  PRIMARY KEY (`_id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (16,'Tony','Stark','Iron man','$2b$10$evpWwZh16nJX7mLODbK2mu4nDfjxeRtL7SQXL327pUrZQPOXv3mPC','male','1 HarbourFront Walk, #B2-22 VivoCity, Singapore 098585','ironman@gmail.com','97955963','iron man.jpg',0),(17,'Peter','Parker','Spiderman','$2b$10$rj4lYTH8A5Zdo0Av3YTGl.itIZr5O/X3JNUkATPeYT2iw1EuVCe3e','male','370 Alexandra Rd, Singapore 159953','spiderman@gmail.com','87161602','spiderman.jpg',0),(18,'Bucky','Barnes','Winter Soldier','$2b$10$fPrOywtB9UEhz4QHUj7YsOyMjdQq4VW0uuYRj3nOEUMrYB7SP7nbi','male','510 Bedok Nth St 3 #01-11','wintersoldier@gmail.com','97942408','Winter Soldier.jpg',0),(19,'Steve','Roger','Captain America','$2b$10$rtq3KUevq4Ljzzl77z1uIOexJvj8M.SgfebUI6QRaRHs27OS3BV..','male','432 Race Course Rd, Singapore 218678','captainamerica@gmail.com','98890632','captain america.jpg',0),(20,'Wanda','Maximoff','Scarlet Witch','$2b$10$ZuvdzpdNmHfI7COuf1yGZOzGJgyfyiyLgEkFXU7sq/DeJh1Kf160W','female','9002 Tampines Street 93, #03-02, Singapore 528836','scarletwitch@gmail.com','95456318','The Scarlet Witch.jpg',0),(25,'Steven','Strange','Doctor Strange','$2b$10$grTfD6hLa4.GBrcq0CH2gu9mGHLIwbj.BmEttl0KXaTQxd/rzUqCy','Male','125 Telok Ayer St, Singapore 068594','doctorstrange@gmail.com','93930959','doctor-strange pfp21.jpg',0),(26,'Bruce','Banner','Hulk','$2b$10$eLmCRdIrVXy5QwPn5issT.wWmomcrGhN3iURlmJXDVvhJueRwGiY6','Male','3 Sungei Kadut Cres, Singapore 728686','hulk@gmail.com','86897279','hulk26.jpg',0),(37,'T','Challa','Black Panther','$2b$10$dDkqts7wH3iL29Htubi.t.5lls6zYYPklrgw1EvWEDMAyklSxhgbq','Male','1 Beach Rd, Singapore 189673','blackpanther@gmail.com','98329920',NULL,0);
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

-- Dump completed on 2022-01-28  4:19:29
