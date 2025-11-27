-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: localhost    Database: iotstar_api_db
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'apple.png','Apple'),(2,'samsung.png','Samsung'),(3,'xiaomi.png','Xiaomi'),(4,'oppo.png','OPPO'),(5,'vivo.png','Vivo');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_date` datetime(6) DEFAULT NULL,
  `description` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `price` double DEFAULT NULL,
  `quantity` int NOT NULL,
  `sold_quantity` int DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKog2rp4qthbtt2lfyhfo32lsw9` (`category_id`),
  CONSTRAINT `FKog2rp4qthbtt2lfyhfo32lsw9` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'2025-11-27 08:17:46.140000','string','string','string',0,0,0,NULL),(2,'2025-11-27 15:15:26.000000','Màu hồng, Dynamic Island','ip15plus.jpg','iPhone 15 Plus',25990000,50,600,1),(3,'2025-10-28 15:15:26.000000','Huyền thoại giá rẻ','ip11.jpg','iPhone 11 64GB',9990000,200,5000,1),(4,'2025-11-07 15:15:26.000000','Nhỏ gọn','ip12mini.jpg','iPhone 12 Mini',11990000,20,50,1),(5,'2025-11-27 15:15:26.000000','Galaxy AI, bút SPen','s24ultra.jpg','Samsung S24 Ultra',29990000,80,900,2),(6,'2025-11-25 15:15:26.000000','Gập vỏ sò thời trang','zflip5.jpg','Samsung Z Flip 5',19990000,40,300,2),(7,'2025-11-27 15:15:26.000000','Viền kim loại, chống nước','a55.jpg','Samsung Galaxy A55',9990000,100,400,2),(8,'2025-11-12 15:15:26.000000','Pin trâu giá rẻ','a05.jpg','Samsung Galaxy A05',3090000,300,1200,2),(9,'2025-11-27 15:15:26.000000','Màn 120Hz viền mỏng','note13.jpg','Xiaomi Redmi Note 13',4590000,200,800,3),(10,'2025-11-27 15:15:26.000000','Camera Leica','mi14.jpg','Xiaomi 14',22990000,30,100,3),(11,'2025-11-24 15:15:26.000000','Chip Helio G99 Ultra','pocom6.jpg','Poco M6 Pro',5990000,60,250,3),(12,'2025-11-27 15:15:26.000000','Chuyên gia chân dung','reno11f.jpg','OPPO Reno 11 F',8990000,90,500,4),(13,'2025-10-18 15:15:26.000000','Giá rẻ cấu hình ổn','a18.jpg','OPPO A18',3290000,500,2500,4),(14,'2025-11-17 15:15:26.000000','Camera Hasselblad','findn3.jpg','OPPO Find N3 Flip',22990000,15,150,4),(15,'2025-11-27 15:15:26.000000','Sạc nhanh 44W','y36.jpg','Vivo Y36',5990000,40,80,5),(16,'2025-11-27 15:15:26.000000','Vòng sáng Aura','v29e.jpg','Vivo V29e',8490000,50,200,5),(17,'2025-09-28 15:15:26.000000','Thiết kế 2.5D','y02t.jpg','Vivo Y02t',2790000,100,300,5);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKr43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOcd7qa8qkrVm','ROLE_ADMIN','admin'),(2,'student@gmail.com','$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBOcd7qa8qkrVm','ROLE_USER','sinhvien');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'iotstar_api_db'
--

--
-- Dumping routines for database 'iotstar_api_db'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-27 15:21:07
