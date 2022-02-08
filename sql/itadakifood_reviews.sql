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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-02-06 23:17:06
