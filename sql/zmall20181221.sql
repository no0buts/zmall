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
) ENGINE=InnoDB AUTO_INCREMENT=100006 DEFAULT CHARSET=utf8 COMMENT='买家信息表';
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
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(45) NOT NULL COMMENT '订单编号',
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `product_count` int(11) NOT NULL DEFAULT '1' COMMENT '下单产品的数量',
  `order_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '下单时间',
  `pay_type` int(11) NOT NULL COMMENT '支付类型：1支付宝，2微信，3银联',
  `pay_time` datetime NOT NULL COMMENT '支付时间',
  `money_amount` double NOT NULL,
  `freight` double NOT NULL DEFAULT '0' COMMENT '运费',
  `money_actual` double NOT NULL COMMENT '订单状态：1-下单未支付，2-下单已支付，3-卖家发货，4-买家收到货，5-退货中，6-完成退货',
  `order_state` int(11) NOT NULL COMMENT '0chushi\n1dengdaizhi\n2yi\n3\n4\n5\n',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
-- Table structure for table `recipient`
--

DROP TABLE IF EXISTS `recipient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipient` (
  `recipient_id` int(11) NOT NULL AUTO_INCREMENT,
  `buyer_id` int(11) NOT NULL COMMENT '买家id',
  `recipient_name` varchar(45) NOT NULL COMMENT '收件人姓名',
  `recipient_phonenum` varchar(11) NOT NULL COMMENT '联系人电话',
  `recipient_address` varchar(45) NOT NULL COMMENT '收件人地址的省市区街道',
  `recipient_address_detail` varchar(45) CHARACTER SET ucs2 NOT NULL COMMENT '收件人地址详情，如：街道、楼栋',
  `recipient_default` char(2) NOT NULL DEFAULT '0' COMMENT '是否为默认的收件人:1表示默认，0则为非默认的',
  `recipient_create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '收件人创建时间',
  `recipient_update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '收件人修改时间',
  PRIMARY KEY (`recipient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000029 DEFAULT CHARSET=utf8 COMMENT='收件人';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipient`
--

LOCK TABLES `recipient` WRITE;
/*!40000 ALTER TABLE `recipient` DISABLE KEYS */;
INSERT INTO `recipient` VALUES (1000001,100001,'周海媚','13734231222','湖北省武汉市洪山区1','关山大道保利广场547','0','2018-12-04 04:53:34','2018-12-21 17:02:54'),(1000002,100001,'周芷若','18611312312','湖北省武汉市江夏区','教育中路湖北第二师范学院','1','2018-12-05 14:33:30','2018-12-21 16:21:50'),(1000003,100001,'张无忌','13734231222','上海市徐汇区徐家汇街道','虹桥路808号','0','2018-12-06 06:41:03','2018-12-21 16:17:18'),(1000004,100002,'郭靖','13543438888','江西省南昌市东湖区','中山西路滕王阁地铁站1出口','1','2018-12-19 16:04:53','0000-00-00 00:00:00'),(1000005,100002,'杨蓉','13513148888','江西省南昌市东湖区','中山西路滕王阁地铁站1出口','0','2018-12-19 16:04:53','2018-12-19 16:04:56'),(1000006,100002,'杨过','18688908899','上海市虹口区大连路','和平公园西南门纱线小吃','0','2018-12-21 12:39:45','2018-12-21 12:39:45'),(1000007,100001,'赵敏','15115453316','湖北省荆州市沙市区','荆沙大道红星路荆州市中医院101','0','2018-12-21 12:54:10','2018-12-21 16:22:06'),(1000008,100001,'谢逊','17764534213','湖北省宜昌市伍家岗区','城东大道星期天客栈105','0','2018-12-21 12:54:17','2018-12-21 13:36:27'),(1000009,100001,'贾静雯','13451327226','湖北省宜昌市西陵区','西陵二路快速路八达岭招待所','0','2018-12-21 12:58:14','2018-12-21 15:16:00'),(1000010,100001,'苏有朋','18611435222','湖北省宜昌市西陵区','西陵二路快速路三峡大学沁苑','0','2018-12-21 13:00:58','2018-12-21 13:40:31'),(1000011,100001,'灭绝师太','19816453662','湖北省武汉市江夏区','藏龙大道55号6栋','0','2018-12-21 13:03:56','2018-12-21 13:40:49'),(1000026,100001,'珠儿','15899828832','广东省广州市白云区','天河区中山大道暨南大学艺术学院','0','2018-12-21 15:15:11','2018-12-21 15:15:11'),(1000027,100001,'小昭','13712341234','贵州省贵阳市龙里县','西环路星城大厦309','0','2018-12-21 17:09:08','2018-12-21 17:09:08'),(1000028,100001,'曾阿牛','13645674566','四川省宜宾市长宁县','开佛镇曙光城1组42号','0','2018-12-21 17:14:53','2018-12-21 17:14:53');
/*!40000 ALTER TABLE `recipient` ENABLE KEYS */;
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

-- Dump completed on 2018-12-22  1:19:31
