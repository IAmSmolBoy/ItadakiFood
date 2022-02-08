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

-- Dump completed on 2022-02-06 23:17:07
