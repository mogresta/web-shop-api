
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
/*!50717 SELECT COUNT(*) INTO @rocksdb_has_p_s_session_variables FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'performance_schema' AND TABLE_NAME = 'session_variables' */;
/*!50717 SET @rocksdb_get_is_supported = IF (@rocksdb_has_p_s_session_variables, 'SELECT COUNT(*) INTO @rocksdb_is_supported FROM performance_schema.session_variables WHERE VARIABLE_NAME=\'rocksdb_bulk_load\'', 'SELECT 0') */;
/*!50717 PREPARE s FROM @rocksdb_get_is_supported */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;
/*!50717 SET @rocksdb_enable_bulk_load = IF (@rocksdb_is_supported, 'SET SESSION rocksdb_bulk_load = 1', 'SET @rocksdb_dummy_bulk_load = 0') */;
/*!50717 PREPARE s FROM @rocksdb_enable_bulk_load */;
/*!50717 EXECUTE s */;
/*!50717 DEALLOCATE PREPARE s */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `web_shop_api` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `web_shop_api`;
DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_number` longtext COLLATE utf8mb4_unicode_ci,
  `street` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `street2` longtext COLLATE utf8mb4_unicode_ci,
  `city` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` longtext COLLATE utf8mb4_unicode_ci,
  `country` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,'Dallas','Strosin','793.913.0964','8492 Dameon Summit',NULL,'Rosenbaumland',NULL,'Macao','84389'),(2,'Dallas','Strosin','1-733-227-3342','7509 Terry Squares',NULL,'New Laverneview',NULL,'ZW','97983'),(3,'Tod','Deckow','1-278-096-7620','2160 Modesta Meadows Apt. 686',NULL,'Port Savannah',NULL,'Denmark','00825'),(4,'Tod','Deckow','(103)321-1857','3731 Angelita Viaduct Apt. 554',NULL,'North Laurenceburgh',NULL,'NC','57433'),(5,'Kolby','Gerhold','(606)807-6080','9827 Mertie Cliff Suite 289',NULL,'Strosinfurt',NULL,'Singapore','26906-4812'),(6,'Kolby','Gerhold','838.206.6396','8611 Erick Mall Apt. 415',NULL,'West Magdalenafurt',NULL,'AX','59280-7084'),(7,'Esta','Tillman','(165)488-1248','500 Durgan Union Apt. 859',NULL,'North Neomachester',NULL,'Mauritius','53131'),(8,'Esta','Tillman','419-734-9230x1552','496 Feest Drive',NULL,'New Wilmerhaven',NULL,'DJ','50300'),(9,'Deonte','Leffler','(988)177-2174x784','873 Bashirian Throughway Apt. 141',NULL,'Marleneton',NULL,'Italy','93539'),(10,'Deonte','Leffler','752-270-0080','7625 Quitzon Lock',NULL,'Hadleyshire',NULL,'HK','51570-8919'),(11,'Jacinthe','Reinger','805-021-8699x245','77923 Bartoletti Landing',NULL,'West Laurettamouth',NULL,'Cocos (Keeling) Islands','25654-4484'),(12,'Jacinthe','Reinger','438-412-9824x9285','1952 Jules Fall Apt. 641',NULL,'Beierton',NULL,'PG','88752'),(13,'Ari','Trantow','1-222-540-0425','9083 Vandervort Throughway Apt. 354',NULL,'Sawaynhaven',NULL,'Belize','61998-6681'),(14,'Ari','Trantow','+25(8)3372202814','37159 Feil Crest Apt. 900',NULL,'Koelpintown',NULL,'CN','24774-8396'),(15,'Bart','Feil','1-347-286-7746','9211 Keebler Ports',NULL,'Dorcasborough',NULL,'Madagascar','75898-6433'),(16,'Bart','Feil','1-500-916-7228x8557','73316 Wisozk Camp Suite 984',NULL,'Connview',NULL,'LT','15838-0462'),(17,'Theodora','McKenzie','891-229-0773x78586','6220 Rowena Ford Suite 502',NULL,'West Siennaburgh',NULL,'Anguilla','45016'),(18,'Theodora','McKenzie','1-635-646-3418','68969 Janelle Prairie Apt. 790',NULL,'South Carolynfort',NULL,'BM','30964'),(19,'Elsa','Wisozk','00928822666','0601 Bosco Path',NULL,'Willmsborough',NULL,'China','43706-1881'),(20,'Elsa','Wisozk','(881)498-0040x208','3832 Joshuah Row Suite 553',NULL,'East Beverlychester',NULL,'CM','00853-2653');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_64C19C1727ACA70` (`parent_id`),
  CONSTRAINT `FK_64C19C1727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,NULL,'category 0','Dormouse. \'Write that down,\' the King in a low voice, \'Your Majesty must cross-examine THIS witness.\' \'Well, if I chose,\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY.'),(2,NULL,'category 1','I\'ve got to the jury, and the little door about fifteen inches high: she tried to speak, but for a dunce? Go on!\' \'I\'m a poor man,\' the Hatter hurriedly left the court, \'Bring me the list of the.'),(3,NULL,'category 2','YOUR table,\' said Alice; \'that\'s not at all comfortable, and it was a long tail, certainly,\' said Alice to find that she could see, when she looked down, was an old Turtle--we used to know. Let me.'),(4,NULL,'category 3','Once more she found she could not possibly reach it: she could not possibly reach it: she could get to the jury. They were indeed a queer-looking party that assembled on the end of the what?\' said.'),(5,NULL,'category 4','Gryphon, and all sorts of things, and she, oh! she knows such a tiny little thing!\' It did so indeed, and much sooner than she had to sing you a song?\' \'Oh, a song, please, if the Queen say only.'),(6,NULL,'category 5','And when I find a number of cucumber-frames there must be!\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can guess that,\' she added aloud. \'Do you mean by that?\' said the one.'),(7,NULL,'category 6','Alice said very humbly; \'I won\'t indeed!\' said Alice, in a very good advice, (though she very seldom followed it), and handed them round as prizes. There was exactly three inches high). \'But I\'m not.'),(8,NULL,'category 7','Yet you balanced an eel on the song, she kept fanning herself all the time when I find a number of bathing machines in the world am I? Ah, THAT\'S the great puzzle!\' And she opened the door and found.'),(9,NULL,'category 8','Soup of the bottle was NOT marked \'poison,\' so Alice ventured to ask. \'Suppose we change the subject of conversation. While she was now, and she drew herself up closer to Alice\'s great surprise, the.'),(10,NULL,'category 9','Alice, \'to pretend to be otherwise than what you mean,\' the March Hare. \'It was the BEST butter,\' the March Hare, who had followed him into the sky all the unjust things--\' when his eye chanced to.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `contract_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contract_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `price_list_id` int(11) NOT NULL,
  `vat_required` tinyint(1) NOT NULL,
  `vat_amount` double NOT NULL,
  `discount` double NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2CBDB6709395C3F3` (`customer_id`),
  KEY `IDX_2CBDB6705688DED7` (`price_list_id`),
  CONSTRAINT `FK_2CBDB6705688DED7` FOREIGN KEY (`price_list_id`) REFERENCES `price_list` (`id`),
  CONSTRAINT `FK_2CBDB6709395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `contract_list` WRITE;
/*!40000 ALTER TABLE `contract_list` DISABLE KEYS */;
INSERT INTO `contract_list` VALUES (1,4,3,1,0.21,0.34,1),(2,4,4,1,0.39,0.12,1),(3,3,3,0,0,0.23,1),(4,2,5,1,0.16,0.47,1),(5,1,3,0,0,0.35,1);
/*!40000 ALTER TABLE `contract_list` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `doctrine_migration_versions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `doctrine_migration_versions` WRITE;
/*!40000 ALTER TABLE `doctrine_migration_versions` DISABLE KEYS */;
INSERT INTO `doctrine_migration_versions` VALUES ('DoctrineMigrations\\Version20240128143911','2024-01-28 19:19:29',15),('DoctrineMigrations\\Version20240128144926','2024-01-28 19:19:29',77),('DoctrineMigrations\\Version20240128151205','2024-01-28 19:19:29',14),('DoctrineMigrations\\Version20240128151320','2024-01-28 19:19:29',46),('DoctrineMigrations\\Version20240128151435','2024-01-28 19:19:29',83),('DoctrineMigrations\\Version20240128151555','2024-01-28 19:19:30',13),('DoctrineMigrations\\Version20240128151738','2024-01-28 19:19:30',82),('DoctrineMigrations\\Version20240128152031','2024-01-28 19:19:30',16),('DoctrineMigrations\\Version20240128152043','2024-01-28 19:19:30',15),('DoctrineMigrations\\Version20240128152209','2024-01-28 19:19:30',279),('DoctrineMigrations\\Version20240128152610','2024-01-28 19:19:30',78);
/*!40000 ALTER TABLE `doctrine_migration_versions` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL,
  `order_subtotal` double NOT NULL,
  `order_total` double NOT NULL,
  `vat_amount` double NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F52993989395C3F3` (`customer_id`),
  KEY `IDX_F529939879D0C0E4` (`billing_address_id`),
  KEY `IDX_F52993984D4CFF2B` (`shipping_address_id`),
  KEY `IDX_F5299398C54C8C93` (`type_id`),
  KEY `IDX_F52993986BF700BD` (`status_id`),
  CONSTRAINT `FK_F52993984D4CFF2B` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_F52993986BF700BD` FOREIGN KEY (`status_id`) REFERENCES `order_status` (`id`),
  CONSTRAINT `FK_F529939879D0C0E4` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_F52993989395C3F3` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_F5299398C54C8C93` FOREIGN KEY (`type_id`) REFERENCES `order_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_52EA1F09FCDAEAAA` (`order_id`),
  KEY `IDX_52EA1F094584665A` (`product_id`),
  CONSTRAINT `FK_52EA1F094584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_52EA1F09FCDAEAAA` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'New'),(2,'Shipped'),(3,'Waiting'),(4,'Cancelled'),(5,'Completed');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `order_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `order_type` WRITE;
/*!40000 ALTER TABLE `order_type` DISABLE KEYS */;
INSERT INTO `order_type` VALUES (1,'Regular');
/*!40000 ALTER TABLE `order_type` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `price_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `price_list` WRITE;
/*!40000 ALTER TABLE `price_list` DISABLE KEYS */;
INSERT INTO `price_list` VALUES (1,'Littel, Krajcik and Dicki',1),(2,'Witting-Koelpin',1),(3,'Rice, Raynor and Johnston',1),(4,'Watsica-Farrell',1),(5,'Barrows, Ferry and Bradtke',1);
/*!40000 ALTER TABLE `price_list` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `price_list_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `price_list_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `price_list_id` int(11) NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_FBD6B5BD4584665A` (`product_id`),
  KEY `IDX_FBD6B5BD5688DED7` (`price_list_id`),
  CONSTRAINT `FK_FBD6B5BD4584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FK_FBD6B5BD5688DED7` FOREIGN KEY (`price_list_id`) REFERENCES `price_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `price_list_product` WRITE;
/*!40000 ALTER TABLE `price_list_product` DISABLE KEYS */;
INSERT INTO `price_list_product` VALUES (1,30,1,42.5),(2,9,1,32.73),(3,1,1,90.37),(4,15,1,99.02),(5,5,1,30.96),(6,14,1,11.26),(7,4,1,28.84),(8,30,2,39.28),(9,26,2,20.98),(10,9,2,73.34),(11,10,2,33.06),(12,11,2,55.7),(13,7,2,62.03),(14,30,3,85.59),(15,26,3,8.77),(16,7,3,55.21),(17,1,3,39.73),(18,3,3,16.94),(19,19,3,18.1),(20,28,3,39.15),(21,21,3,42.73),(22,18,3,12.02),(23,30,4,17.04),(24,14,4,22.96),(25,2,4,32.16),(26,6,4,56.37),(27,4,4,95.62),(28,9,4,55.32),(29,8,4,64.73),(30,12,4,39.88),(31,25,4,39.99),(32,29,4,13.46),(33,30,5,29.47),(34,19,5,66.63),(35,15,5,27.27),(36,28,5,7.26),(37,18,5,99.52),(38,2,5,23.65),(39,25,5,49.38);
/*!40000 ALTER TABLE `price_list_product` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sku` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'18155','product 0','Queen till she had sat down at once, with a knife, it usually bleeds; and she walked up towards it rather timidly, as she could, for her neck from being run over; and the blades of grass, but she.',16.07,'2012-07-13 14:39:28'),(2,'44094','product 1','For anything tougher than suet; Yet you turned a back-somersault in at the mushroom for a long argument with the glass table as before, \'It\'s all her knowledge of history, Alice had learnt several.',32.71,'2000-07-14 11:57:16'),(3,'83489','product 2','Yet you turned a back-somersault in at the March Hare interrupted, yawning. \'I\'m getting tired of being all alone here!\' As she said to Alice. \'Nothing,\' said Alice. \'You did,\' said the Hatter: \'but.',46.18,'1996-10-01 15:02:54'),(4,'75376','product 3','So they sat down, and felt quite unhappy at the Caterpillar\'s making such a wretched height to rest herself, and once she remembered having seen such a thing before, but she knew she had found her.',30.86,'2010-07-29 07:09:21'),(5,'12534','product 4','Majesty!\' the Duchess by this time). \'Don\'t grunt,\' said Alice; not that she was getting quite crowded with the other guinea-pig cheered, and was surprised to find her way through the doorway; \'and.',34.1,'1974-12-05 19:31:11'),(6,'61827','product 5','YOU?\' said the March Hare,) \'--it was at the mouth with strings: into this they slipped the guinea-pig, head first, and then, \'we went to school every day--\' \'I\'VE been to the little thing was.',17.86,'2016-05-12 14:20:59'),(7,'60300','product 6','Alice replied, so eagerly that the hedgehog a blow with its head, it WOULD twist itself round and round the rosetree; for, you see, as she could not possibly reach it: she could remember about.',61.26,'2023-02-21 04:41:07'),(8,'57493','product 7','Queen in front of the miserable Mock Turtle. \'And how many hours a day or two: wouldn\'t it be murder to leave off being arches to do THAT in a frightened tone. \'The Queen will hear you! You see, she.',85.56,'1985-07-05 09:04:14'),(9,'90497','product 8','Alice replied, so eagerly that the Gryphon at the corners: next the ten courtiers; these were all ornamented with hearts. Next came the royal children; there were a Duck and a scroll of parchment in.',5.4,'1988-12-18 03:07:20'),(10,'27632','product 9','The jury all wrote down on one of them can explain it,\' said Alice. The poor little thing was to find that the reason so many out-of-the-way things had happened lately, that Alice had got to the.',74.23,'1995-03-12 01:53:31'),(11,'78148','product 10','At last the Mouse, turning to Alice, \'Have you guessed the riddle yet?\' the Hatter said, tossing his head off outside,\' the Queen till she had never been so much already, that it felt quite unhappy.',26.17,'2008-02-06 11:00:16'),(12,'26525','product 11','SOMETHING interesting is sure to kill it in less than no time to be trampled under its feet, \'I move that the hedgehog had unrolled itself, and was going to dive in among the trees as well say,\'.',42.24,'1993-08-25 00:28:17'),(13,'24700','product 12','English, who wanted leaders, and had to run back into the earth. At last the Mock Turtle sighed deeply, and drew the back of one flapper across his eyes. \'I wasn\'t asleep,\' he said do. Alice looked.',77.18,'2020-10-30 10:23:43'),(14,'20585','product 13','For really this morning I\'ve nothing to what I like\"!\' \'You might just as well. The twelve jurors were all in bed!\' On various pretexts they all cheered. Alice thought she had never heard of one,\'.',94.88,'1984-11-05 02:45:20'),(15,'85419','product 14','When she got back to the Duchess: \'and the moral of that is--\"Be what you would have this cat removed!\' The Queen had never been so much into the sky all the time when I grow up, I\'ll write one--but.',73.97,'2018-04-29 17:01:11'),(16,'16457','product 15','Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Duchess. \'I make you a present of everything I\'ve said as yet.\' \'A cheap sort of present!\' thought Alice. \'I\'m glad they\'ve.',84.7,'2022-01-01 03:55:28'),(17,'25973','product 16','Dinah, and saying \"Come up again, dear!\" I shall have some fun now!\' thought Alice. \'Now we shall get on better.\' \'I\'d rather finish my tea,\' said the Queen. \'You make me giddy.\' And then, turning.',93.31,'1984-09-29 22:48:15'),(18,'12983','product 17','It means much the same words as before, \'and things are worse than ever,\' thought the poor child, \'for I never understood what it was: at first she thought it would,\' said the King, \'or I\'ll have.',82.2,'2010-04-24 09:44:12'),(19,'64031','product 18','I believe.\' \'Boots and shoes under the door; so either way I\'ll get into her face. \'Wake up, Alice dear!\' said her sister; \'Why, what are they made of?\' \'Pepper, mostly,\' said the King, \'that only.',53.27,'2008-06-01 16:45:39'),(20,'23573','product 19','Mock Turtle. So she began thinking over all she could not answer without a grin,\' thought Alice; \'I can\'t help it,\' said the Hatter: \'I\'m on the twelfth?\' Alice went on planning to herself that.',28.1,'2016-03-18 18:47:55'),(21,'43033','product 20','I know I have done that, you know,\' the Mock Turtle. \'No, no! The adventures first,\' said the King. \'I can\'t help that,\' said the Cat. \'I said pig,\' replied Alice; \'and I do so like that curious.',15.21,'2020-06-09 15:09:09'),(22,'85577','product 21','I\'ll tell him--it was for bringing the cook had disappeared. \'Never mind!\' said the Cat. \'I said pig,\' replied Alice; \'and I do it again and again.\' \'You are not attending!\' said the Queen. \'Well, I.',40.79,'1976-10-04 02:15:53'),(23,'19890','product 22','Dinah my dear! I wish you were me?\' \'Well, perhaps your feelings may be different,\' said Alice; \'I can\'t explain it,\' said Alice hastily; \'but I\'m not particular as to go nearer till she got to go.',86.01,'1990-09-17 21:33:22'),(24,'43994','product 23','Mock Turtle in the distance. \'Come on!\' and ran off, thinking while she was appealed to by all three to settle the question, and they walked off together, Alice heard it before,\' said the Queen.',59.15,'2018-10-12 17:17:42'),(25,'58536','product 24','Alice quietly said, just as I do,\' said the Hatter. \'You might just as I\'d taken the highest tree in front of the doors of the way--\' \'THAT generally takes some time,\' interrupted the Gryphon. \'I\'ve.',54.89,'1991-02-21 21:55:48'),(26,'27258','product 25','Alice quite jumped; but she stopped hastily, for the White Rabbit, jumping up and say \"How doth the little--\"\' and she tried to look at the White Rabbit cried out, \'Silence in the sun. (IF you don\'t.',37.8,'2014-01-28 12:22:07'),(27,'91505','product 26','Alice, as she went on, \'and most of \'em do.\' \'I don\'t know what to uglify is, you know. Come on!\' \'Everybody says \"come on!\" here,\' thought Alice, and looking at the Cat\'s head began fading away the.',21.64,'2004-02-05 04:34:56'),(28,'32226','product 27','Gryphon at the top of the mushroom, and her eyes to see what I get\" is the use of a dance is it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' said.',47.6,'2013-07-29 18:42:18'),(29,'13809','product 28','Now you know.\' \'I don\'t know where Dinn may be,\' said the Duchess. \'I make you grow taller, and the reason of that?\' \'In my youth,\' said his father, \'I took to the executioner: \'fetch her here.\' And.',50.47,'1978-06-15 02:09:51'),(30,'70576','product 29','Off--\' \'Nonsense!\' said Alice, very much of it at all,\' said the Cat, and vanished again. Alice waited patiently until it chose to speak again. In a minute or two sobs choked his voice. \'Same as if.',60.51,'1972-06-25 19:28:37');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_CDFC73564584665A` (`product_id`),
  KEY `IDX_CDFC735612469DE2` (`category_id`),
  CONSTRAINT `FK_CDFC735612469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_CDFC73564584665A` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (1,14,8),(2,27,7),(3,11,1),(4,24,7),(5,17,1),(6,1,7),(7,21,10),(8,11,10),(9,20,7),(10,20,8),(11,1,9),(12,14,4),(13,21,1),(14,5,9),(15,27,5),(16,25,5),(17,2,1),(18,22,6),(19,28,10),(20,5,7),(21,7,9),(22,10,3),(23,24,9),(24,27,3),(25,28,7),(26,17,7),(27,30,8),(28,24,2),(29,9,3),(30,16,2),(31,19,8),(32,18,5),(33,11,4),(34,19,9),(35,10,2),(36,6,10),(37,5,6),(38,23,2),(39,28,10),(40,24,4),(41,29,4),(42,23,8),(43,2,10),(44,20,9),(45,12,10),(46,4,7),(47,30,4),(48,28,7),(49,18,6),(50,30,3);
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;
DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `billing_address_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `first_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_8D93D64979D0C0E4` (`billing_address_id`),
  KEY `IDX_8D93D6494D4CFF2B` (`shipping_address_id`),
  CONSTRAINT `FK_8D93D6494D4CFF2B` FOREIGN KEY (`shipping_address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `FK_8D93D64979D0C0E4` FOREIGN KEY (`billing_address_id`) REFERENCES `address` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,2,'Dallas','Strosin','$2y$13$sCA8MSOYTB6gLBHmv.LGX.Ce4jbB2ucWtx3KmmzXy4x6LDjXq6L46','Dallas.Strosin@test.com'),(2,3,4,'Tod','Deckow','$2y$13$V2557ggLEdvqQ0s3TbQKruOrrd.wCGLBo3lypWNEdkLxDSq8afW4y','Tod.Deckow@test.com'),(3,5,6,'Kolby','Gerhold','$2y$13$YjC0Xky.Kvnh.Z1LQN1Ll.2ltTOU9FtajpbsdyNS9Nt7AY8IAHImq','Kolby.Gerhold@test.com'),(4,7,8,'Esta','Tillman','$2y$13$ZMuE1CgvtYWv2kZyHyARoOQsDYhywe0ZVnU6LhVszV704CrMgetWS','Esta.Tillman@test.com'),(5,9,10,'Deonte','Leffler','$2y$13$2CQNvM7KP6Tc3y5HzDFjQePflLSGFTBiWbNz4adO4s5J1HTZJ2O8G','Deonte.Leffler@test.com'),(6,11,12,'Jacinthe','Reinger','$2y$13$rd1pl7XlwPbDEtGG6IzzWeMUzHkE.619BxCV31Lq1dqkVNsEVvbcu','Jacinthe.Reinger@test.com'),(7,13,14,'Ari','Trantow','$2y$13$l5.cEJ/SVIkKmjX2hc7jNu74ctpY6lHODPszdXKgQK0a4HaTci.qK','Ari.Trantow@test.com'),(8,15,16,'Bart','Feil','$2y$13$OFbAk0yarHKULoNmrvvvo.aVUChD/0ma43gWy8Xnq82ahvteJcQi2','Bart.Feil@test.com'),(9,17,18,'Theodora','McKenzie','$2y$13$7hJKEqK2zhaKYZEZJZDkAewVqcx20pzQ88elUczRoVSdT0jJw4A6O','Theodora.McKenzie@test.com'),(10,19,20,'Elsa','Wisozk','$2y$13$k37TxBJ4.ICEbpsOe6/2leq1OU1wlG2nHoiyeD/Pv3PoxdPabcKZO','Elsa.Wisozk@test.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!50112 SET @disable_bulk_load = IF (@is_rocksdb_supported, 'SET SESSION rocksdb_bulk_load = @old_rocksdb_bulk_load', 'SET @dummy_rocksdb_bulk_load = 0') */;
/*!50112 PREPARE s FROM @disable_bulk_load */;
/*!50112 EXECUTE s */;
/*!50112 DEALLOCATE PREPARE s */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

