-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: zmall
-- ------------------------------------------------------
-- Server version	5.7.22-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `buyer`
--

DROP TABLE IF EXISTS `buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `buyer` (
  `buyer_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_account` varchar(20) NOT NULL,
  `buyer_password` varchar(16) NOT NULL,
  `buyer_nickname` varchar(45) NOT NULL,
  `buyer_truename` varchar(45) NOT NULL,
  `buyer_headimg` varchar(45) DEFAULT NULL,
  `buyer_phonenum` varchar(11) NOT NULL,
  PRIMARY KEY (`buyer_id`),
  UNIQUE KEY `buyer_id_UNIQUE` (`buyer_id`),
  UNIQUE KEY `buyer_accountnum_UNIQUE` (`buyer_account`)
) ENGINE=InnoDB AUTO_INCREMENT=100011 DEFAULT CHARSET=utf8 COMMENT='买家信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `buyer`
--

LOCK TABLES `buyer` WRITE;
/*!40000 ALTER TABLE `buyer` DISABLE KEYS */;
INSERT INTO `buyer` VALUES (100001,'1903749370','123456','小周','周丽',NULL,'15172363731'),(100002,'3251332530','123456','哈哈哈','王二妮',NULL,'17632456789'),(100003,'z111111111','666666','哈妹','薛佳凝',NULL,'13533445432'),(100004,'2332332332','123456','小哇','钟汉良',NULL,'18683456789'),(100005,'10101010','12345678','喵喵喵','唐小薇',NULL,'15123433288');
/*!40000 ALTER TABLE `buyer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_info`
--

DROP TABLE IF EXISTS `product_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_info` (
  `product_id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `product_price` double NOT NULL COMMENT '产品价格',
  `product_originalprice` double NOT NULL COMMENT '产品原价',
  `product_salesvolume` int(11) NOT NULL COMMENT '产品销量',
  `product_image` varchar(1000) NOT NULL,
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `product_id_UNIQUE` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_info`
--

LOCK TABLES `product_info` WRITE;
/*!40000 ALTER TABLE `product_info` DISABLE KEYS */;
INSERT INTO `product_info` VALUES (570133,'Xiaomi/小米 小米8年度旗舰全面屏骁龙845双频GPS 智能拍照游戏手机 旗舰官方正品',2199,2499,17449,'https://img.alicdn.com/imgextra/i4/1714128138/O1CN0129zFev1ky01qSG9_!!1714128138.jpg_2200x2200Q50s50.jpg_.webp'),(572473,'Xiaomi/小米 小米8SE全面屏拍照游戏智能手机学生机商务机8周年 官方旗舰店正品',1649,1999,4416,'https://img.alicdn.com/imgextra/i2/1714128138/O1CN01wjNTNT29zFetDlM3l_!!0-item_pic.jpg_2200x2200Q50s50.jpg_.webpspm=a320p.7692363.0.0.5fe350adqnYuJK&id=572473824056&pic=//img.alicdn.com/bao/uploaded/i3/1714128138/O1CN0129zFeoxyQY9SUzn_!!0-item_pic.jpg_250x250Q50s50.jpg_.webp&itemTitle=%E3%80%90%E5%8F%8C11%E6%9C%80%E9%AB%98%E5%8F%AF%E7%94%A8300%E5%85%83%E5%A4%A9%E7%8C%AB%E5%88%B8%E3%80%91Xiaomi/%E5%B0%8F%E7%B1%B3%20%E5%B0%8F%E7%B1%B38SE%E5%85%A8%E9%9D%A2%E5%B1%8F%E6%8B%8D%E7%85%A7%E6%B8%B8%E6%88%8F%E6%99%BA%E8%83%BD%E6%89%8B%E6%9C%BA%E5%AD%A6%E7%94%9F%E6%9C%BA%E5%95%86%E5%8A%A1%E6%9C%BA8%E5%91%A8%E5%B9%B4%20%E5%AE%98%E6%96%B9%E6%97%97%E8%88%B0%E5%BA%97%E6%ADhttps://img.alicdn.com/imgextra/i2/1714128138/O1CN01wjNTNT29zFetDlM3l_!!0-item_pic.jpg_2200x2200Q50s50.jpg_.webp'),(573627,'Xiaomi/小米 小米Max3全面屏大屏大电量游戏手机智能拍照手机官方旗舰店正品',1599,1999,3495,'https://img.alicdn.com/imgextra/i2/1714128138/O1CN01NoNOav29zFeoyij05_!!1714128138.jpg_2200x2200Q50s50.jpg_.webp'),(577610,'Xiaomi/小米 小米8 屏幕指纹版 双频GPS压感屏幕指纹全面屏拍照游戏智能手机',2749,3199,3320,'https://img.alicdn.com/imgextra/i4/1714128138/O1CN0129zFet2yIkvEAq8_!!1714128138.jpg_2200x2200Q50s50.jpg_.webp');
/*!40000 ALTER TABLE `product_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'zmall'
--

--
-- Dumping routines for database 'zmall'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-23 17:43:05
