-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: waitlist
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `access_token`
--

DROP TABLE IF EXISTS `access_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `access_token` (
  `character_id` bigint NOT NULL,
  `access_token` varchar(2048) NOT NULL,
  `expires` bigint NOT NULL,
  `scopes` varchar(1024) NOT NULL,
  PRIMARY KEY (`character_id`),
  CONSTRAINT `access_token_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_token`
--

LOCK TABLES `access_token` WRITE;
/*!40000 ALTER TABLE `access_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `character_id` bigint NOT NULL,
  `role` varchar(64) NOT NULL,
  `granted_at` bigint NOT NULL,
  `granted_by_id` bigint NOT NULL,
  PRIMARY KEY (`character_id`),
  KEY `admin_character` (`granted_by_id`),
  CONSTRAINT `admin_character` FOREIGN KEY (`granted_by_id`) REFERENCES `character` (`id`),
  CONSTRAINT `character_role` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alliance`
--

DROP TABLE IF EXISTS `alliance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alliance` (
  `id` bigint NOT NULL,
  `name` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alliance`
--

LOCK TABLES `alliance` WRITE;
/*!40000 ALTER TABLE `alliance` DISABLE KEYS */;
/*!40000 ALTER TABLE `alliance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alt_character`
--

DROP TABLE IF EXISTS `alt_character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alt_character` (
  `account_id` bigint NOT NULL,
  `alt_id` bigint NOT NULL,
  PRIMARY KEY (`account_id`,`alt_id`),
  KEY `alt_id` (`alt_id`),
  CONSTRAINT `alt_character_ibfk_1` FOREIGN KEY (`account_id`) REFERENCES `character` (`id`),
  CONSTRAINT `alt_character_ibfk_2` FOREIGN KEY (`alt_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alt_character`
--

LOCK TABLES `alt_character` WRITE;
/*!40000 ALTER TABLE `alt_character` DISABLE KEYS */;
/*!40000 ALTER TABLE `alt_character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcement`
--

DROP TABLE IF EXISTS `announcement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcement` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `message` varchar(512) NOT NULL,
  `is_alert` tinyint(1) NOT NULL DEFAULT '0',
  `pages` text,
  `created_by_id` bigint NOT NULL,
  `created_at` bigint NOT NULL,
  `revoked_by_id` bigint DEFAULT NULL,
  `revoked_at` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `announcement_by` (`created_by_id`),
  KEY `announcement_revoked_by` (`revoked_by_id`),
  CONSTRAINT `announcement_by` FOREIGN KEY (`created_by_id`) REFERENCES `character` (`id`),
  CONSTRAINT `announcement_revoked_by` FOREIGN KEY (`revoked_by_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcement`
--

LOCK TABLES `announcement` WRITE;
/*!40000 ALTER TABLE `announcement` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge`
--

DROP TABLE IF EXISTS `badge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL,
  `exclude_badge_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `exclude_badge` (`exclude_badge_id`),
  CONSTRAINT `exclude_badge` FOREIGN KEY (`exclude_badge_id`) REFERENCES `badge` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge`
--

LOCK TABLES `badge` WRITE;
/*!40000 ALTER TABLE `badge` DISABLE KEYS */;
INSERT INTO `badge` VALUES (1,'DPS',NULL),(2,'ALT',NULL),(3,'LOGI',NULL);
/*!40000 ALTER TABLE `badge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `badge_assignment`
--

DROP TABLE IF EXISTS `badge_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `badge_assignment` (
  `characterId` bigint NOT NULL,
  `badgeId` bigint NOT NULL,
  `grantedById` bigint DEFAULT NULL,
  `grantedAt` bigint NOT NULL,
  KEY `characterId` (`characterId`),
  KEY `badgeId` (`badgeId`),
  KEY `grantedById` (`grantedById`),
  CONSTRAINT `badgeId` FOREIGN KEY (`badgeId`) REFERENCES `badge` (`id`) ON DELETE CASCADE,
  CONSTRAINT `characterId` FOREIGN KEY (`characterId`) REFERENCES `character` (`id`),
  CONSTRAINT `grantedById` FOREIGN KEY (`grantedById`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `badge_assignment`
--

LOCK TABLES `badge_assignment` WRITE;
/*!40000 ALTER TABLE `badge_assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `badge_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ban`
--

DROP TABLE IF EXISTS `ban`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ban` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `entity_id` bigint NOT NULL,
  `entity_name` varchar(64) DEFAULT NULL,
  `entity_type` varchar(16) NOT NULL,
  `issued_at` bigint NOT NULL,
  `issued_by` bigint NOT NULL,
  `public_reason` varchar(512) DEFAULT NULL,
  `reason` varchar(512) NOT NULL,
  `revoked_at` bigint DEFAULT NULL,
  `revoked_by` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `issued_by` (`issued_by`),
  KEY `revoked_by` (`revoked_by`),
  CONSTRAINT `issued_by` FOREIGN KEY (`issued_by`) REFERENCES `character` (`id`),
  CONSTRAINT `revoked_by` FOREIGN KEY (`revoked_by`) REFERENCES `character` (`id`),
  CONSTRAINT `ban_chk_1` CHECK ((`entity_type` in (_utf8mb4'Account',_utf8mb4'Character',_utf8mb4'Corporation',_utf8mb4'Alliance')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ban`
--

LOCK TABLES `ban` WRITE;
/*!40000 ALTER TABLE `ban` DISABLE KEYS */;
/*!40000 ALTER TABLE `ban` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character`
--

DROP TABLE IF EXISTS `character`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character` (
  `id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `corporation_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `character_corporation` (`corporation_id`),
  FULLTEXT KEY `name` (`name`) /*!50100 WITH PARSER `ngram` */ ,
  CONSTRAINT `character_corporation` FOREIGN KEY (`corporation_id`) REFERENCES `corporation` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character`
--

LOCK TABLES `character` WRITE;
/*!40000 ALTER TABLE `character` DISABLE KEYS */;
/*!40000 ALTER TABLE `character` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `character_note`
--

DROP TABLE IF EXISTS `character_note`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `character_note` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `author_id` bigint NOT NULL,
  `note` text NOT NULL,
  `logged_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_note_ibfk_1` (`character_id`),
  KEY `character_note_ibfk_2` (`author_id`),
  CONSTRAINT `character_note_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `character_note_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `character_note`
--

LOCK TABLES `character_note` WRITE;
/*!40000 ALTER TABLE `character_note` DISABLE KEYS */;
/*!40000 ALTER TABLE `character_note` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `corporation`
--

DROP TABLE IF EXISTS `corporation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `corporation` (
  `id` bigint NOT NULL,
  `name` text NOT NULL,
  `alliance_id` bigint DEFAULT NULL,
  `updated_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `alliance_id` (`alliance_id`),
  CONSTRAINT `alliance_id` FOREIGN KEY (`alliance_id`) REFERENCES `alliance` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `corporation`
--

LOCK TABLES `corporation` WRITE;
/*!40000 ALTER TABLE `corporation` DISABLE KEYS */;
/*!40000 ALTER TABLE `corporation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fit_history`
--

DROP TABLE IF EXISTS `fit_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fit_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `fit_id` bigint NOT NULL,
  `implant_set_id` bigint NOT NULL,
  `logged_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `fit_id` (`fit_id`),
  KEY `implant_set_id` (`implant_set_id`),
  CONSTRAINT `fit_history_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `fit_history_ibfk_2` FOREIGN KEY (`fit_id`) REFERENCES `fitting` (`id`),
  CONSTRAINT `fit_history_ibfk_3` FOREIGN KEY (`implant_set_id`) REFERENCES `implant_set` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fit_history`
--

LOCK TABLES `fit_history` WRITE;
/*!40000 ALTER TABLE `fit_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `fit_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fitting`
--

DROP TABLE IF EXISTS `fitting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fitting` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `dna` varchar(1024) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `hull` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dna` (`dna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fitting`
--

LOCK TABLES `fitting` WRITE;
/*!40000 ALTER TABLE `fitting` DISABLE KEYS */;
/*!40000 ALTER TABLE `fitting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet`
--

DROP TABLE IF EXISTS `fleet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet` (
  `id` bigint NOT NULL,
  `boss_id` bigint NOT NULL,
  `is_updating` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `boss_id` (`boss_id`),
  CONSTRAINT `fleet_ibfk_1` FOREIGN KEY (`boss_id`) REFERENCES `character` (`id`),
  CONSTRAINT `fleet_chk_1` CHECK ((`is_updating` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet`
--

LOCK TABLES `fleet` WRITE;
/*!40000 ALTER TABLE `fleet` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_activity`
--

DROP TABLE IF EXISTS `fleet_activity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_activity` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `fleet_id` bigint NOT NULL,
  `first_seen` bigint NOT NULL,
  `last_seen` bigint NOT NULL,
  `hull` int NOT NULL,
  `has_left` tinyint NOT NULL,
  `is_boss` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `ix_fleet_activity_fleet_id` (`fleet_id`),
  CONSTRAINT `fleet_activity_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `fleet_activity_chk_1` CHECK ((`has_left` in (0,1))),
  CONSTRAINT `fleet_activity_chk_2` CHECK ((`is_boss` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_activity`
--

LOCK TABLES `fleet_activity` WRITE;
/*!40000 ALTER TABLE `fleet_activity` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fleet_squad`
--

DROP TABLE IF EXISTS `fleet_squad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fleet_squad` (
  `fleet_id` bigint NOT NULL,
  `category` varchar(10) NOT NULL,
  `wing_id` bigint NOT NULL,
  `squad_id` bigint NOT NULL,
  PRIMARY KEY (`fleet_id`,`category`),
  CONSTRAINT `fleet_squad_ibfk_1` FOREIGN KEY (`fleet_id`) REFERENCES `fleet` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fleet_squad`
--

LOCK TABLES `fleet_squad` WRITE;
/*!40000 ALTER TABLE `fleet_squad` DISABLE KEYS */;
/*!40000 ALTER TABLE `fleet_squad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `implant_set`
--

DROP TABLE IF EXISTS `implant_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `implant_set` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `implants` varchar(255) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `implants` (`implants`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `implant_set`
--

LOCK TABLES `implant_set` WRITE;
/*!40000 ALTER TABLE `implant_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `implant_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `refresh_token`
--

DROP TABLE IF EXISTS `refresh_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `refresh_token` (
  `character_id` bigint NOT NULL,
  `refresh_token` varchar(255) NOT NULL,
  `scopes` varchar(1024) NOT NULL,
  PRIMARY KEY (`character_id`),
  CONSTRAINT `refresh_token_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `refresh_token`
--

LOCK TABLES `refresh_token` WRITE;
/*!40000 ALTER TABLE `refresh_token` DISABLE KEYS */;
/*!40000 ALTER TABLE `refresh_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_current`
--

DROP TABLE IF EXISTS `skill_current`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_current` (
  `character_id` bigint NOT NULL,
  `skill_id` int NOT NULL,
  `level` tinyint NOT NULL,
  PRIMARY KEY (`character_id`,`skill_id`),
  CONSTRAINT `skill_current_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_current`
--

LOCK TABLES `skill_current` WRITE;
/*!40000 ALTER TABLE `skill_current` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_current` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skill_history`
--

DROP TABLE IF EXISTS `skill_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `skill_history` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `skill_id` int NOT NULL,
  `old_level` tinyint NOT NULL,
  `new_level` tinyint NOT NULL,
  `logged_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  CONSTRAINT `skill_history_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skill_history`
--

LOCK TABLES `skill_history` WRITE;
/*!40000 ALTER TABLE `skill_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `skill_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlist`
--

DROP TABLE IF EXISTS `waitlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `is_open` tinyint NOT NULL,
  `is_archived` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `waitlist_chk_1` CHECK ((`is_open` in (0,1))),
  CONSTRAINT `waitlist_chk_2` CHECK ((`is_archived` in (0,1)))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlist`
--

LOCK TABLES `waitlist` WRITE;
/*!40000 ALTER TABLE `waitlist` DISABLE KEYS */;
INSERT INTO `waitlist` VALUES (1,'TDF HQ',0,0);
/*!40000 ALTER TABLE `waitlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlist_entry`
--

DROP TABLE IF EXISTS `waitlist_entry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist_entry` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `waitlist_id` bigint NOT NULL,
  `account_id` bigint NOT NULL,
  `joined_at` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `waitlist_id` (`waitlist_id`,`account_id`),
  KEY `account_id` (`account_id`),
  CONSTRAINT `waitlist_entry_ibfk_1` FOREIGN KEY (`waitlist_id`) REFERENCES `waitlist` (`id`),
  CONSTRAINT `waitlist_entry_ibfk_2` FOREIGN KEY (`account_id`) REFERENCES `character` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlist_entry`
--

LOCK TABLES `waitlist_entry` WRITE;
/*!40000 ALTER TABLE `waitlist_entry` DISABLE KEYS */;
/*!40000 ALTER TABLE `waitlist_entry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `waitlist_entry_fit`
--

DROP TABLE IF EXISTS `waitlist_entry_fit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waitlist_entry_fit` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `character_id` bigint NOT NULL,
  `entry_id` bigint NOT NULL,
  `fit_id` bigint NOT NULL,
  `implant_set_id` bigint NOT NULL,
  `approved` tinyint NOT NULL,
  `tags` varchar(255) NOT NULL,
  `category` varchar(10) NOT NULL,
  `fit_analysis` text,
  `review_comment` text,
  `cached_time_in_fleet` bigint NOT NULL,
  `is_alt` tinyint NOT NULL,
  `messagexup` text,
  PRIMARY KEY (`id`),
  KEY `character_id` (`character_id`),
  KEY `entry_id` (`entry_id`),
  KEY `fit_id` (`fit_id`),
  KEY `implant_set_id` (`implant_set_id`),
  CONSTRAINT `waitlist_entry_fit_ibfk_1` FOREIGN KEY (`character_id`) REFERENCES `character` (`id`),
  CONSTRAINT `waitlist_entry_fit_ibfk_2` FOREIGN KEY (`entry_id`) REFERENCES `waitlist_entry` (`id`),
  CONSTRAINT `waitlist_entry_fit_ibfk_3` FOREIGN KEY (`fit_id`) REFERENCES `fitting` (`id`),
  CONSTRAINT `waitlist_entry_fit_ibfk_4` FOREIGN KEY (`implant_set_id`) REFERENCES `implant_set` (`id`),
  CONSTRAINT `waitlist_entry_fit_chk_1` CHECK ((`approved` in (0,1)))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waitlist_entry_fit`
--

LOCK TABLES `waitlist_entry_fit` WRITE;
/*!40000 ALTER TABLE `waitlist_entry_fit` DISABLE KEYS */;
/*!40000 ALTER TABLE `waitlist_entry_fit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-13 12:12:54
