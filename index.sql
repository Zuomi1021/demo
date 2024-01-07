-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: index
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `ad`
--

DROP TABLE IF EXISTS `ad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ad` (
  `id` int NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ad`
--

LOCK TABLES `ad` WRITE;
/*!40000 ALTER TABLE `ad` DISABLE KEYS */;
INSERT INTO `ad` VALUES (1,'橫幅4','banner/banner4'),(2,'橫幅1','banner/banner1'),(3,'橫幅2','banner/banner2'),(4,'橫幅3','banner/banner3');
/*!40000 ALTER TABLE `ad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car` (
  `id` int NOT NULL AUTO_INCREMENT,
  `quantity` int DEFAULT '1',
  `src` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `price` int DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `account` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `good_id` (`src`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car`
--

LOCK TABLES `car` WRITE;
/*!40000 ALTER TABLE `car` DISABLE KEYS */;
INSERT INTO `car` VALUES (45,2,'wear/wear1','聖誕造型眼鏡',200,NULL,NULL),(46,5,'wear/wear2','聖誕動物髮夾',100,NULL,NULL),(47,2,'decoration/decoration6','聖誕花圈',450,NULL,NULL);
/*!40000 ALTER TABLE `car` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id` int NOT NULL,
  `account` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `joindate` varchar(45) DEFAULT NULL,
  `leavedate` varchar(45) DEFAULT NULL,
  `rank` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (1,'topmanager@1','topmanager@1password','2023-12-12',NULL,'top'),(2,'middlemanager@1','middlemanager@1password','2024-1-2',NULL,'middle');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` int NOT NULL DEFAULT '1729',
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1729,'2024-04-21');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payway`
--

DROP TABLE IF EXISTS `payway`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payway` (
  `id` int NOT NULL AUTO_INCREMENT,
  `member_id` int DEFAULT NULL,
  `cash` varchar(255) DEFAULT NULL,
  `credit_card` varchar(255) DEFAULT NULL,
  `mobile_pay` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `member_id` (`member_id`),
  CONSTRAINT `payway_ibfk_1` FOREIGN KEY (`member_id`) REFERENCES `personal_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payway`
--

LOCK TABLES `payway` WRITE;
/*!40000 ALTER TABLE `payway` DISABLE KEYS */;
/*!40000 ALTER TABLE `payway` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_data`
--

DROP TABLE IF EXISTS `personal_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `account` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `phone_number` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `sex` int DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `auth` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT '原石VIP會員',
  `pfp` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'member/profile',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_data`
--

LOCK TABLES `personal_data` WRITE;
/*!40000 ALTER TABLE `personal_data` DISABLE KEYS */;
INSERT INTO `personal_data` VALUES (1,'user@123','user@123password','一號使用者','新北市板橋區','user1@gmail.com','0989441123',2,'2000-11-03','1號','鑽石VIP會員','member/profile'),(2,'user@223','user@223password','使用者二號','台北市大安區','user2@gmail.com','0989111222',1,'1999-11-23','二號','黃金VIP會員','member/profile'),(3,'user@323','user@323','使用者三號','高雄市楠梓區','user3@gmail.com','0912345688',2,'2023-12-22','三號','白金VIP會員','member/profile'),(4,'user@423','user@423','使用者四號','澎湖縣','user4@gmail.com','0912345687',2,'2023-12-08','四號','原石VIP會員','member/profile'),(5,'11','11','null','111','11@','11',1,'2024-01-04','null','原石VIP會員','member/profile');
/*!40000 ALTER TABLE `personal_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` int DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `storage` int DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `info` varchar(255) DEFAULT NULL,
  `detail` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,200,'wear/wear1','聖誕造型眼鏡',10,'聖誕造型眼鏡種類','1','1','1',5),(2,100,'wear/wear2','聖誕動物髮夾',7,'聖誕動物髮夾種類','2','2','2',2),(3,100,'wear/wear3','聖誕造型髮夾',5,'聖誕造型髮夾種類','3','3','3',3),(4,150,'wear/wear4','聖誕髮箍',3,'聖誕髮箍種類','4','4','4',1),(5,350,'wear/wear5','聖誕風格耳環',5,'聖誕風格耳環種類','5','5','5',2),(6,350,'wear/wear6','聖誕風格手鍊',8,'聖誕風格手鍊種類','6','6','6',4),(7,10,'decoration/decoration1','聖誕球',200,'聖誕球種類','7','7','7',100),(8,50,'decoration/decoration2','聖誕樹裝飾',10,'聖誕樹裝飾種類','8','8','8',2),(9,499,'decoration/decoration3','聖誕小樹',20,'聖誕小樹種類','info9','9','9',10),(10,50,'decoration/decoration4','聖誕燈串',30,'聖誕燈串種類','info10','10','10',2),(11,150,'decoration/decoration5','聖誕小鹿裝飾',2,'聖誕小鹿裝飾種類','info11','11','11',1),(12,450,'decoration/decoration6','聖誕花圈',5,'聖誕花圈種類','info12','12','12',3),(13,499,'cookie/product1','杏仁手工餅乾',15,'杏仁手工餅乾種類','info13','13','13',10),(14,499,'cookie/product2','經典手作餅乾',20,'遇見美好-蔓越莓酥 4片/盒。/想念的你-伯爵茶餅乾 8片/盒。/微酸戀曲-香檸桔球 8-12個/盒。','餅乾入口的那一剎那，是心的悸動，是味蕾的饗宴，更是幸福的滋味。','遇見美好-蔓越莓酥/想念的你-伯爵茶餅乾/微酸戀曲-香凝桔球。','✶遇見美好-蔓越莓酥｜成份－低筋麵粉、安佳奶油、蔓越莓乾、砂糖、雞蛋白(白殼)、低鈉鹽。/✶想念的你-伯爵茶餅乾｜成份－低筋麵粉、安佳奶油、糖粉、安佳牛奶、伯爵紅茶。/✶微酸戀曲-香檸桔球｜成份－低筋麵粉、安佳奶油、桔子皮、糖粉、雞蛋白(白殼)、檸檬汁。',10),(15,499,'cookie/product3','巧克力夏威夷果',11,'巧克力夏威夷果種類','info15','15','15',5),(16,499,'cookie/product4','噠啵曲奇-莓果雙拼',13,'噠啵曲奇-莓果雙拼種類','info16','16','16',7),(17,499,'cookie/product5','噠啵曲奇-雙拼派對',17,'噠啵曲奇-雙拼派對種類','info17','17','17',4),(18,499,'cookie/product6','黑熊曲奇餅-繽紛三色',15,'黑熊曲奇餅-繽紛三色種類','info18','18','18',12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-07 16:45:38
