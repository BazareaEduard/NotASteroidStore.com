-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: ecommerce
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl70asp4l4w0jmbm1tqyofho4o` (`user_id`),
  CONSTRAINT `FKl70asp4l4w0jmbm1tqyofho4o` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_products`
--

DROP TABLE IF EXISTS `cart_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_products` (
  `cart_id` bigint(20) NOT NULL,
  `products_id` bigint(20) NOT NULL,
  `products` int(11) DEFAULT NULL,
  `products_key` bigint(20) NOT NULL,
  PRIMARY KEY (`cart_id`,`products_id`),
  UNIQUE KEY `UK_3kg5kx19f8oy0lo76hdhc1uw1` (`products_id`),
  CONSTRAINT `FKhyhnx21758m3wmbi4ps96m0yw` FOREIGN KEY (`products_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKnlhjc091rdu9k5c8u9xwp280w` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_products`
--

LOCK TABLES `cart_products` WRITE;
/*!40000 ALTER TABLE `cart_products` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_seq`
--

DROP TABLE IF EXISTS `cart_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_seq`
--

LOCK TABLES `cart_seq` WRITE;
/*!40000 ALTER TABLE `cart_seq` DISABLE KEYS */;
INSERT INTO `cart_seq` VALUES (1);
/*!40000 ALTER TABLE `cart_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_item`
--

DROP TABLE IF EXISTS `order_line_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_item` (
  `id` bigint(20) NOT NULL,
  `qty` int(11) NOT NULL,
  `product_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK9ju2t8oi6c26mtfhltwpwhfpv` (`product_id`),
  CONSTRAINT `FK9ju2t8oi6c26mtfhltwpwhfpv` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_item`
--

LOCK TABLES `order_line_item` WRITE;
/*!40000 ALTER TABLE `order_line_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_line_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_line_item_seq`
--

DROP TABLE IF EXISTS `order_line_item_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_line_item_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_line_item_seq`
--

LOCK TABLES `order_line_item_seq` WRITE;
/*!40000 ALTER TABLE `order_line_item_seq` DISABLE KEYS */;
INSERT INTO `order_line_item_seq` VALUES (1);
/*!40000 ALTER TABLE `order_line_item_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order`
--

DROP TABLE IF EXISTS `product_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order` (
  `id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order`
--

LOCK TABLES `product_order` WRITE;
/*!40000 ALTER TABLE `product_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order_order_line_items`
--

DROP TABLE IF EXISTS `product_order_order_line_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order_order_line_items` (
  `product_order_id` bigint(20) NOT NULL,
  `order_line_items_id` bigint(20) NOT NULL,
  PRIMARY KEY (`product_order_id`,`order_line_items_id`),
  UNIQUE KEY `UK_39gpjdh1fsm047wmauh7apc6h` (`order_line_items_id`),
  CONSTRAINT `FK6sumakmf6nknxqpj0ssacjevc` FOREIGN KEY (`order_line_items_id`) REFERENCES `order_line_item` (`id`),
  CONSTRAINT `FK6xkskx8mcwgccab5ist60xaqw` FOREIGN KEY (`product_order_id`) REFERENCES `product_order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order_order_line_items`
--

LOCK TABLES `product_order_order_line_items` WRITE;
/*!40000 ALTER TABLE `product_order_order_line_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `product_order_order_line_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_order_seq`
--

DROP TABLE IF EXISTS `product_order_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_order_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_order_seq`
--

LOCK TABLES `product_order_seq` WRITE;
/*!40000 ALTER TABLE `product_order_seq` DISABLE KEYS */;
INSERT INTO `product_order_seq` VALUES (1);
/*!40000 ALTER TABLE `product_order_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_seq`
--

DROP TABLE IF EXISTS `product_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_seq`
--

LOCK TABLES `product_seq` WRITE;
/*!40000 ALTER TABLE `product_seq` DISABLE KEYS */;
INSERT INTO `product_seq` VALUES (1);
/*!40000 ALTER TABLE `product_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `application_type` varchar(255) DEFAULT NULL,
  `most_wanted` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (4,'Decadron','anabolics','Discover the power of Decadron for your anabolic needs.',49.99,'deca.png','injectable','\0'),(5,'Winstrol','sarms','Highly effective injectable SARMs for optimal performance.',39.99,'winstrol.png','injectable',''),(6,'Testosterone','peptides','Boost your performance with injectable Testosterone.',29.99,'test.png','injectable',''),(7,'Oxydrol','anabolics','High-quality injectable anabolic Oxydrol.',44.99,'oxydrol.png','injectable','\0'),(8,'Boldenone','sarms','Injectable Boldenone for muscle gain.',24.99,'boldenone.png','injectable','\0'),(9,'Dostranolone','peptides','Premium Dostranolone injectable for enhanced results.',54.99,'dostranolonepng.png','injectable','\0'),(10,'Enblone','anabolics','Advanced anabolic injectable Enblone.',59.99,'enblone.png','injectable','\0'),(11,'Equipose','sarms','Equipose injectable for effective SARM benefits.',19.99,'equipose.png','injectable','\0'),(12,'Generic Injectable','peptides','Affordable and effective generic injectable.',9.99,'genericInjectable.png','injectable','\0'),(13,'Primobolan','anabolics','Injectable Primobolan for premium anabolic performance.',44.99,'primobolanpng.png','injectable','\0'),(14,'Profina','sarms','Highly effective Profina injectable SARMs.',14.99,'profina.png','injectable','\0'),(15,'Steropropican','peptides','Premium Steropropican injectable for ultimate results.',94.99,'steropropican.png','injectable','\0'),(16,'Sustanon','anabolics','Top-tier injectable anabolic Sustanon.',17.99,'sustanon.png','injectable','\0'),(17,'TesMix5','sarms','Injectable TesMix5 SARMs for enhanced performance.',29.99,'tesMix5.png','injectable','\0'),(18,'TestoE','peptides','Injectable TestoE for superior results.',44.99,'testoE.png','injectable','\0'),(19,'Anavar','anabolics','Edible Anavar for anabolic performance enhancement.',199.99,'anavar.png','edible',''),(20,'Dianabol','sarms','Edible Dianabol SARMs for muscle building.',39.99,'dianabol__01788.png','edible','\0'),(21,'Trenbolone','peptides','Highly potent edible Trenbolone.',89.99,'tren.png','edible',''),(22,'Stanobol','anabolics','Edible Stanobol for effective anabolic results.',29.99,'stanabol.png','edible','\0'),(23,'Corticosteroid','sarms','Edible corticosteroid SARMs for effective treatment.',24.99,'corticosteroid.png','edible','\0'),(24,'Dexamethasone','peptides','Edible Dexamethasone for enhanced benefits.',54.99,'dexamethasone.png','edible','\0'),(25,'Generic Edible','anabolics','Affordable and effective generic edible.',59.99,'genericedible.png','edible',''),(26,'Medrone','sarms','Edible Medrone for SARMs enthusiasts.',19.99,'medrone.png','edible',''),(27,'Methyprednisone','peptides','Affordable Methyprednisone for optimal results.',9.99,'methyprednisone.png','edible',''),(28,'Prednidale','anabolics','Edible Prednidale for anabolic benefits.',44.99,'prednidale.png','edible','\0'),(29,'Prednisone','sarms','Edible Prednisone for muscle growth.',14.99,'prednisone.png','edible','\0'),(30,'Unleash','peptides','Unleash the Power with this premium edible.',94.99,'unleash.png','edible','\0');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_seq`
--

DROP TABLE IF EXISTS `products_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_seq`
--

LOCK TABLES `products_seq` WRITE;
/*!40000 ALTER TABLE `products_seq` DISABLE KEYS */;
INSERT INTO `products_seq` VALUES (1);
/*!40000 ALTER TABLE `products_seq` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'$2a$10$fQ5MzlrT4lfRCLlNG5uyteUTGcCi.ihr1HWfvmyljrAhLYS7elOLa','user1'),(2,'$2a$10$92A4qVO0aPzKtvIrol1r/O2.5wvxdv3dsPbr1VLhadVZ9gMEQ5jca','user2'),(52,'$2a$10$3M3FapBtpEcCYL6DY0Hb.OMfX0BiwCgzJl1UTkN.aQlbWEdoqrkWO','user1'),(53,'$2a$10$aLh5TYUW2aiCw93C/6NaOujZ4iJuIyx7mTToVeNO6D3sA4pqbqe42','user2'),(102,'$2a$10$LpGsLjrLugZ7ZNhOttW3POMffG0MOUTOr6HJQaFRQ9RDSkCPm0CBi','user1'),(103,'$2a$10$x4pG429HvahM/Eb9nhFx9u0H5o42S62TZpM6pn/L7TTw5vNyAtOH6','user2'),(152,'$2a$10$o/JYvMotifdXZQYra0RnUeHF5GecZW2P2eaoyDWy4tNuZhmME7Idm','user1'),(153,'$2a$10$80RnOKlVKrS8JghqcP/DMuT1EMstK04f7p6zY3RADUdGi5dbtpxLe','user2'),(202,'$2a$10$J5f5daPVV8hR9PDAf4kRZ.XT17mxlcxKVvvF8WmrikpP465lkSFce','user1'),(203,'$2a$10$HtkyL3ThWvE9v5pLfiBHoOC79bmTMsUJ275CkQVakyE2g.ecD7Jk6','user2'),(252,'$2a$10$QSypmgFFOLnC.imXNPFY8.003.K2pkmN.S/DyJYBYfEyiKF2jfxYq','user1'),(253,'$2a$10$SwQGln44G4O0ohueiDtrDuyyA8ryiRRlyxHKGdE263EfiQX89E2oq','user2'),(302,'$2a$10$qpaGHBkjoQhuW4RfrxsbT.U7r8UDKubFQdD0tGQgwpExql8CThXqq','user1'),(303,'$2a$10$elQy16dN9pb/ULXcGZdh3.3bQBi1IuXm3HLe.n0ohwwY4BrtqJ6GW','user2'),(352,'$2a$10$/S4UwuTQFcsrNrlhtPanq.02PjRerrCPIGhli8p0KDAvnuvaIPDkW','user1'),(353,'$2a$10$jtcyVsHN46F/Tgq5jwd1m.a.1SAG/PINnx1PKfnk50yeo2Z1PePve','user2'),(402,'$2a$10$ZuWcX/LL1TUKPE9hUqljRONYRo4yXdnkfSNrATZOE8A1IfYVE0dL6','user1'),(403,'$2a$10$C5zj/A9MR6Kvy.PXIhAoCe5R5oOdo8tzpBLd53c7wkONGyRk9o/8e','user2'),(452,'$2a$10$n4cyChS4LFuBzoromKpvwu3riU54RyqPTV6sQfESpEucaQ/A7mDdG','user1'),(453,'$2a$10$LhN49ATEXwDUsgnOAmYIxexHv7a//bjVnzAjBRwesKO5cyukBeh3y','user2'),(502,'$2a$10$24LATwBQClkCG83z9ZCet.9iBOvaQA5Sg3QSOsTEN0RROFaWjYT26','user1'),(503,'$2a$10$odMgFEaA8SGQjQ8IYtzypO0FP9XI2inVfuf0Kd6Zz.D.GGXAvBGcu','user2'),(552,'$2a$10$eQJVWfATPpDr8TCRbxcw0.aB.jLAkkLt2kG99kQWi9GWohKIn9ory','user1'),(553,'$2a$10$WIuoeVCyRRgTGCvOoV3sieKZvRBuTo7JCXCDFTtxzNKbwEmekDvFK','user2'),(602,'$2a$10$HUIKDwoh2C62tUevGIjaWezIkoD2.XFr9itxXCdskvyAOAHmzfAai','user1'),(603,'$2a$10$gbqbaQ.78heboyFNAmcxZOYDPRwileMYTRTy1akoUr7bQNvNiGMhK','user2'),(652,'$2a$10$dfO80Sf8BXq4QndV6ybJLe6exo7bD0POb21UgA4dDEcl/ELa7Gf3m','user1'),(653,'$2a$10$G0fHDBDN9wsA6yQc8EtBYeNDqX/Gkt2gCexREEzUKZErD5MtvjgOu','user2'),(702,'$2a$10$C7fIZ5.DcV1GrI6iQVN0OOu.IUz4W.guOJzWc8U7mmLDq7Tzjz3xy','user1'),(703,'$2a$10$JRfvFTJWuQIwqHOpuGR8UOIPKyCyHoEBqm7Yjtd4QifuvNY2gBlE.','user2'),(752,'$2a$10$lDWXEkYZh8xo/u3MQr/MsOKKXWSJAa7WEOlWHxylNwfV0hHG6AFom','user1'),(753,'$2a$10$c.730h7IKJfHlNXmyg6yXOGVWM9P8ZcDbQLkU.wzmA/wsZz9irr3y','user2'),(802,'$2a$10$0HOLNjv7umz2/2PwIK3URev5R3Q81MzRoBlz93Yt2SmQIgmBwJcD2','user1'),(803,'$2a$10$OB6wLaUKqTrtFLbXmjuBju60XErb9u1dZRKvyggn/tyngSrAbptb2','user2'),(852,'$2a$10$yFUUzqA81ZWskfSzDbqh..LADd70jtHp2ClpJnw6kPdMYszeNJTyi','user1'),(853,'$2a$10$LzhleiZA45gkD/BLPyDR5OsRxYbmqCgXE0OqItBQx1iFU23lMYIy.','user2'),(902,'$2a$10$Uo1PUoRPl92YwEP0CMsygekbjJHUlanfRWUcrcQr/d5vARMZadMre','user1'),(903,'$2a$10$bYcbkE/0qBw3pV0qjmWbSOpxqrBcEX7WfNfbUVjo8que6N4l5K88u','user2'),(952,'$2a$10$Q2KoH.6f0IRzx/e3/L4hwOlx1euc3JO38qH2As/6WUFQYMIiS7s0u','user1'),(953,'$2a$10$t4/4Wx8rZpzF27jghQy0i.dLx1Mv0rUjDQS.Wt8KE07D.foYdA4aC','user2'),(1002,'$2a$10$wxHYMUkteagnj/ZaCIAXwegS8OUcygxvt72Fhe0IH49B5Mi1Qupui','user1'),(1003,'$2a$10$7UXwyAY66BZzCYmZ9wO85ekWdDogjtdCwIY12dDMKMKAAVr2UwaIa','user2'),(1052,'$2a$10$QPagpqJNJ2z1kbXt9rgUsuovtL/WnbUUqzYRjSJ3Q7JyKsLdRfaja','user1'),(1053,'$2a$10$X7q04YrwtzoOQ3vy.gLekekvt0bizrcUPgvUQFFbRFqdaX0MwuaWO','user2'),(1102,'$2a$10$kw1Hh9BgedT9jSJuJe8o1uCT83FDJoWkppmkN7FRiL.BYOucSyqZm','user1'),(1103,'$2a$10$5mJhHTsAMjc6PKkTjFx/LOGITXFp3VcCcD.srqRgf1X1TRhzGXPdi','user2'),(1152,'$2a$10$5pbqisKe9eTyho2kd5cCu.loQLEzDP0upzZGds0CahXpWB9m7DXOi','user1'),(1153,'$2a$10$V9Ryh33xoHouFas6f9tALOP5rXXEu09PNdBlwWhF4p6ASqjt/ZDq2','user2'),(1202,'$2a$10$1OzTne10a4uKKnf5KoGyqO9qx.Oow8F1HTOL9vpZ0brSjM6IAOI/y','user1'),(1203,'$2a$10$x9EBvGopKK.hA9dNGr9EVO60cJcSyjqgPpEYBAr64wXshcJwD7gBO','user2'),(1252,'$2a$10$4DUjRmcZCVmvHM3Q2UJzLeEU/8bJ1vuPAbj4YTrT2py6h3cFpPXfS','user1'),(1253,'$2a$10$CZOGxN5wYHKK2up2PDf.TuaZg6saeuxc6pw9AiTI8ZZRYTLk6fRd6','user2'),(1302,'$2a$10$nNEDRG.sb8UmbtmX2tzWg.G3QSfcGjo0gLfrXB6P2XzE.xivumuSG','user1'),(1303,'$2a$10$uiaMH6v/qM.h/cER0efWR.uykHP3ARUAzotedLlzc/RjDxKMOG2uO','user2'),(1352,'$2a$10$JvsqtnFmplD.spTRoNoCz.z9CZ2kuAgGi5VpF9bIeFO2Khaklo5qi','user1'),(1353,'$2a$10$EnEDJutUYTJYomyYiPDon.ArSKEfAfGzrlU6KNDuAMs3e4vLAw.66','user2'),(1402,'$2a$10$tcmblwA1xENP728EFfRhZ.Pdo17ZuWzItgTJxurzf9p3sfpoiYVGa','user1'),(1403,'$2a$10$NP8si4ym5lNsVEnCPZg7LOMQ3bPHUnHmzH1vbZchgkzGE/peK84Ga','user2'),(1452,'$2a$10$5pBGP29el1bLV6CmH8JKJeg99BqKaxFi1gaOINBkmTecly3oPiQzm','user1'),(1453,'$2a$10$IFqVnJ1Jfy0/9FZXDDG39.yRhylgXZHs8BhvT9i1Ki2edyjQM.Z3S','user2'),(1502,'$2a$10$CBoCXoPQxPPeYCk59q83MeLO4lX2EhJwZZqJCMGIuO.rCuzT7BHTO','user1'),(1503,'$2a$10$C8sHoaG5VyInENsG/JEYAeMxVz5OF1VLCXDuKXah/TCzI/LKcz/2u','user2'),(1552,'$2a$10$8yfygQ7Yg35IG7vWNzgVQO/k5aoDx379uUhSzbOxDK14wA78EpqXm','user1'),(1553,'$2a$10$OJa7qLAAJSJx2VINvkevcud4bcMylRv15H6z4zR/eUWBboi9XYR1.','user2'),(1602,'$2a$10$cEKj8z8zjgscUDR3XqavD.P/FzFE1dUjF5u0Z6vepOj9GZFg.DiDi','user1'),(1603,'$2a$10$ex4of7O7X5ywnEbFxKju6uwYIQOtB7J8ZSOWpuO4OFJo5lArQPww.','user2'),(1652,'$2a$10$Dxd0sOfiYszYkD5QlKQwoujCJMZD0xfv8U33WKppd7pVg0QdwT2FS','user1'),(1653,'$2a$10$RUKc/72PT55ohrAyje2aOuJt5eNMg1Orw0Z5KO9hTddwbZyR7dluK','user2'),(1702,'$2a$10$a8TmGk18J/vt.wqJqzo.M.5IIWhH7kvaPgKMmru7WHbwsjUj2T.FS','user1'),(1703,'$2a$10$LReVPd..QWLeHvDLuhAqbuIvQw.fRYUY9NcD9OiHI2Tfj4xTHAgSq','user2'),(1752,'$2a$10$QjX.x/PTdhvyM5Bx2L1qMO1GbW4xyN6AsHqWDh6qeKwZcmxkiaeoW','user1'),(1753,'$2a$10$ymgee0ktoE1GgIRC3ZQIheJby6PwO/Gl8MVPn0o4endZFo//8RYQK','user2'),(1802,'$2a$10$dE3WkE/xOzzciwK.rLhBw.XkG04SfJv8uADR6eUbSo2DRnxOY65MG','user1'),(1803,'$2a$10$lJTSEG1zOr1tPf9tK1Rd1uB9meVKfynNczplAltjaBhrvdw0fqMca','user2'),(1852,'$2a$10$5ZEAXQSvRa1sd3tQGeyptuW2DDrwQJ5j9g3DPHqBGeEyT6tP2TqKa','user1'),(1853,'$2a$10$NJ9rtxTCmOEfmCu7ZCrXvuF/X/LA4YdFuJVPFYR31eacuhoL6.RF.','user2'),(1902,'$2a$10$0POmyuowxdge3FrBzq0EWOIwkK8q8FNeXmQIS3Zl9xXPagAOQCaE6','user1'),(1903,'$2a$10$vaC6YFpMJ08ZbQyYTNZ4E.PseybjSvm5hitS/4Lb4.GN3pBZPyZt6','user2'),(1952,'$2a$10$FwmF7000N7kcrelfzyddKuoNCb1l8oB/d6s4dX.phMOHRjA9Qgu5y','user1'),(1953,'$2a$10$kmmznQUlxtS6sxqXD//eMuRdkTlA6FSGRLyjnefoOpEug9qtd5NHm','user2'),(2002,'$2a$10$REB/v1mCz93YQoKfA5AGluNhGOG9dMD.23Qjf27rEe13j0FZ3vB7u','user1'),(2003,'$2a$10$ULBNHhrnp2BzwktpT/jQO.FNDyZgUz8v6k/ASuw/FzCDTlre8HUmC','user2'),(2052,'$2a$10$Plx/9IuIVaSgu6wHFKcXn.VrocEYc3/mdIy.j4iDLlr7H8Bb1rCvu','user1'),(2053,'$2a$10$oFCOkXgGep32SvRBwLZ/kOzZXkkD01damYA4pUbq./jiZEqRWShH6','user2'),(2102,'$2a$10$lajsixFw1wFPK4Jfiroljub34XMYIhPAcODPYL8Qkkedrgr9YXjdy','user1'),(2103,'$2a$10$SPhagSVDNs0RXQLInzQY3O2oBJT.rKzgjoRknTH7kZzfshAjH1VcS','user2'),(2152,'$2a$10$VVpDD4RboVz1JyfvJ7djMuaFb649wJrzuzHL7cEDg4xv2suNYrLMG','user1'),(2153,'$2a$10$jOBqwyiWrVOtxt8FyW0g0eG4YQEg5KlZmPNFIokIWv4YbW.hmPWqG','user2'),(2202,'$2a$10$qV7vQvNMTcdqB7xLK3YDj.D3oLUO2EVbck0zFxTI08jMm9WSFWMIu','user1'),(2203,'$2a$10$9ImM2QNdhSMyXE9KSeKPweiSoQRPdAAhgqWN.To803GYRkD5/cfWi','user2'),(2252,'$2a$10$zIt6vdLv9IfUaFBf/4J5YulumnlK.UKEOcJ1xsH1cDzW4L8TsaKnO','user1'),(2253,'$2a$10$1J.js8XhlI3o8FB6/A7zH.Te6oueKY222qXoElactoBKDmywjfKe6','user2'),(2302,'$2a$10$gw1unNR5h63XmkNLmyjoguFwFco6Y3qmy.SNsTaXe8IhevyC1NN5C','user1'),(2303,'$2a$10$qmkPs8XouQms4ImmXJXCLOr5vn1qFLkBfBcIOKx8fuW.cBZ2kOeGK','user2'),(2352,'$2a$10$tPp5QBXfKNcTMEy13EXsJ.5J73qwGe9pmR6exnzNj8z7TilTcHH5y','user1'),(2353,'$2a$10$ZfhD.JOkS6H/5W.cxK/CMuvnK8nF7zMRqFbv77BLZiu2xo5Mb9SNK','user2'),(2402,'$2a$10$ZPkSlhGFVrklhmaW9AFMNuBDezQC/pU4cKE5TAOv8FI6NPe/MadWG','user1'),(2403,'$2a$10$Q.jcn2rXmQOQjEaZtFU4jO6ZjGOALu1kN98lov3TjlsKpdjLvQElK','user2'),(2452,'$2a$10$TgpyQqUdwOYohvU64TLV3e.BxyzefqX/hLRxzfk9pl6fV24af4FhO','user1'),(2453,'$2a$10$mGgq7sfjVEtFpwZUsnDymeDuXMELr.g4Q20xx78.ydDnhxNHGWrKq','user2'),(2502,'$2a$10$MEY3DfF/52IWHoj2d98Wse1olNiKteAV2q.7nME8jyj/6Jno.mljy','user1'),(2503,'$2a$10$za6lj5/COanI44GM8suQS.LeyUqqRPbkRBOZCtQXo1EYGYzQwQlAu','user2'),(2552,'$2a$10$I.XGFGlF7lY2hl5kzvJoceYVdtjb0GfOfBNvjKISHKVTl1.dVySzO','user1'),(2553,'$2a$10$/L0bx7soHjeOGrTO99OBMOW4d9cKahE.dg83CeG4zxjsg20RYq3/K','user2'),(2602,'$2a$10$2SOm2eaQHfp2cYpKVJeEWOxDzGw50kdrgC4tqEZ0rrc2wg7nfA/1S','user1'),(2603,'$2a$10$XPc5g/kEETKlfTBGi7Uxg.fh6ulflI/I7eExhnDYFZ5E12xXcv0eC','user2'),(2652,'$2a$10$49FJMWri1Y6hXZlIbRcCU.JTCsB9mfgezSrikj9CEYyluQJbyPutS','user1'),(2653,'$2a$10$gNjx2FGdZlnlStVtbwfI1O3TikYGU/D7J4REfvhgOeCV0fN6i9x0W','user2');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles` smallint(6) DEFAULT NULL,
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,0),(2,1),(52,0),(53,1),(102,0),(103,1),(152,0),(153,1),(202,0),(203,1),(252,0),(253,1),(302,0),(303,1),(352,0),(353,1),(402,0),(403,1),(452,0),(453,1),(502,0),(503,1),(552,0),(553,1),(602,0),(603,1),(652,0),(653,1),(702,0),(703,1),(752,0),(753,1),(802,0),(803,1),(852,0),(853,1),(902,0),(903,1),(952,0),(953,1),(1002,0),(1003,1),(1052,0),(1053,1),(1102,0),(1103,1),(1152,0),(1153,1),(1202,0),(1203,1),(1252,0),(1253,1),(1302,0),(1303,1),(1352,0),(1353,1),(1402,0),(1403,1),(1452,0),(1453,1),(1502,0),(1503,1),(1552,0),(1553,1),(1602,0),(1603,1),(1652,0),(1653,1),(1702,0),(1703,1),(1752,0),(1753,1),(1802,0),(1803,1),(1852,0),(1853,1),(1902,0),(1903,1),(1952,0),(1953,1),(2002,0),(2003,1),(2052,0),(2053,1),(2102,0),(2103,1),(2152,0),(2153,1),(2202,0),(2203,1),(2252,0),(2253,1),(2302,0),(2303,1),(2352,0),(2353,1),(2402,0),(2403,1),(2452,0),(2453,1),(2502,0),(2503,1),(2552,0),(2553,1),(2602,0),(2603,1),(2652,0),(2653,1);
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_seq`
--

DROP TABLE IF EXISTS `user_seq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_seq`
--

LOCK TABLES `user_seq` WRITE;
/*!40000 ALTER TABLE `user_seq` DISABLE KEYS */;
INSERT INTO `user_seq` VALUES (2751);
/*!40000 ALTER TABLE `user_seq` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-11 16:53:48
