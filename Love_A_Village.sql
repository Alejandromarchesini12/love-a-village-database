-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: csci402_project_schema
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
-- Table structure for table `donor`
--

DROP TABLE IF EXISTS `donor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donor` (
  `donor_id` char(10) NOT NULL COMMENT 'Primary Identifier',
  `donor_name` varchar(100) NOT NULL COMMENT 'Donor must have a name, if anonymus state ANONYM',
  `donor_email` varchar(100) NOT NULL COMMENT 'Donor must have an email for communication',
  PRIMARY KEY (`donor_id`),
  UNIQUE KEY `donor_email_UNIQUE` (`donor_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donor`
--

LOCK TABLES `donor` WRITE;
/*!40000 ALTER TABLE `donor` DISABLE KEYS */;
INSERT INTO `donor` VALUES ('D000000001','Acme Foundation','contact@acme.org'),('D000000002','GreenTrust','hello@greentrust.org'),('D000000003','Community Aid','info@comm-aid.org'),('D000000004','Smith Family','smiths@example.com'),('D000000005','GlobalHands','donate@globalhands.org'),('D000000006','BrightFuture','bf@bright.org'),('D000000007','FarmersUnited','contact@farmersunited.org'),('D000000008','Tech4All','support@tech4all.org'),('D000000009','HealthBridge','gifts@healthbridge.org'),('D000000010','WomenFund','support@womenfund.org'),('D000000011','RoadsForAll','donate@roadsforall.org'),('D000000012','WaterWorks','hello@waterworks.org');
/*!40000 ALTER TABLE `donor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Table structure for table `project_plan`
--

DROP TABLE IF EXISTS `project_plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project_plan` (
  `project_id` char(10) NOT NULL COMMENT 'Primary Identifier',
  `project_name` varchar(100) NOT NULL COMMENT 'Name of the project require',
  `project_type` varchar(500) NOT NULL COMMENT 'Description of the project',
  `funds_recovered` decimal(10,2) DEFAULT NULL COMMENT 'Funds recovered from previous projects that could be used for later projects\n\n',
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project_plan`
--

LOCK TABLES `project_plan` WRITE;
/*!40000 ALTER TABLE `project_plan` DISABLE KEYS */;
INSERT INTO `project_plan` VALUES ('P000000001','Clean Water Initiative','Install wells and filtration systems',10000.00),('P000000002','Solar School','Provide solar panels and training',25000.00),('P000000003','Tree Planting','Reforestation and community training',5000.00),('P000000004','Health Outreach','Mobile clinics and vaccines',15000.00),('P000000005','Sanitation Upgrade','Build latrines and sewer improvements',12000.00),('P000000006','Agriculture Support','Seeds, tools and training',8000.00),('P000000007','ICT Lab','Create a computer lab for local school',18000.00),('P000000008','Women Empowerment','Microloans and workshops',9000.00),('P000000009','Road Repair','Repair village access roads',22000.00),('P000000010','Market Construction','Build covered market stalls',11000.00),('P000000011','Nutrition Program','Child nutrition and education',7000.00),('P000000012','Flood Defenses','Construct simple levees and drains',14000.00);
/*!40000 ALTER TABLE `project_plan` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `expertise`
--

DROP TABLE IF EXISTS `expertise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expertise` (
  `expertise_id` char(10) NOT NULL COMMENT 'Primary identifier',
  `name` varchar(100) NOT NULL COMMENT 'Field name (eg. Math)',
  `description` varchar(200) DEFAULT NULL COMMENT 'Description of the field is optional\n',
  `team_size` int NOT NULL COMMENT 'How many people is on the team',
  `project_id` char(10) NOT NULL COMMENT 'FK link to PROJECT PLAN',
  PRIMARY KEY (`expertise_id`,`project_id`),
  KEY `fk_EXPERTISE_PROJECT PLAN1` (`project_id`),
  CONSTRAINT `fk_EXPERTISE_PROJECT PLAN1` FOREIGN KEY (`project_id`) REFERENCES `project_plan` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expertise`
--

LOCK TABLES `expertise` WRITE;
/*!40000 ALTER TABLE `expertise` DISABLE KEYS */;
INSERT INTO `expertise` VALUES ('E000000001','Hydrology','Water resource specialists',6,'P000000001'),('E000000002','SolarTech','Solar installation team',8,'P000000002'),('E000000003','Forestry','Tree planting and care',5,'P000000003'),('E000000004','Medical','Mobile clinic staff',10,'P000000004'),('E000000005','Sanitation','Sanitation engineers',4,'P000000005'),('E000000006','Agro','Agricultural extension',7,'P000000006'),('E000000007','IT','ICT trainers and techs',5,'P000000007'),('E000000008','Microfinance','Loan officers',4,'P000000008'),('E000000009','Civil','Road construction team',9,'P000000009'),('E000000010','Construction','Market builders',6,'P000000010'),('E000000011','Nutrition','Dietitians and educators',5,'P000000011'),('E000000012','Hydraulics','Flood defense engineers',7,'P000000012');
/*!40000 ALTER TABLE `expertise` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `volunteer`
--

DROP TABLE IF EXISTS `volunteer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `volunteer` (
  `volunteer_id` char(10) NOT NULL COMMENT 'Primary identifier',
  `volunteer_name` varchar(100) NOT NULL COMMENT 'Name of the volunteer is required',
  `volunteer_email` varchar(100) NOT NULL COMMENT 'Email of the volunteer is required for communication',
  `volunteer_phone` varchar(20) DEFAULT NULL COMMENT 'Phone number can be optional since we already have the email',
  `location` varchar(100) NOT NULL COMMENT 'Where the volunteer is from is optional',
  `volunteer_type` varchar(15) NOT NULL COMMENT 'Specifying either a "Expert" or "Non-Expert"',
  `availability` date NOT NULL,
  `expertise_id` char(10) NOT NULL,
  `birthdate` date NOT NULL,
  PRIMARY KEY (`volunteer_id`,`expertise_id`),
  UNIQUE KEY `volunteer_email_UNIQUE` (`volunteer_email`),
  KEY `fk_Volunteer_Expertise1` (`expertise_id`),
  CONSTRAINT `fk_Volunteer_Expertise1` FOREIGN KEY (`expertise_id`) REFERENCES `expertise` (`expertise_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `volunteer`
--

LOCK TABLES `volunteer` WRITE;
/*!40000 ALTER TABLE `volunteer` DISABLE KEYS */;
INSERT INTO `volunteer` VALUES ('VLT0000001','Alice Johnson','alice.j@example.com','555-0101','Riverside','Expert','2026-01-10','E000000001','1986-05-12'),('VLT0000002','Bob Martinez','bob.m@example.com','555-0102','Hilltop','Expert','2026-02-01','E000000002','1979-11-03'),('VLT0000003','Carol Wang','carol.w@example.com','555-0103','Greenfield','Expert','2026-03-15','E000000003','1990-07-21'),('VLT0000004','David Lee','david.l@example.com','555-0104','Seaside','Expert','2026-01-05','E000000004','1982-02-02'),('VLT0000005','Eva Patel','eva.p@example.com','555-0105','Oak Grove','Non-Expert','2026-04-20','E000000005','1995-09-10'),('VLT0000006','Frank O\'Neil','frank.o@example.com','555-0106','Sunnyvale','Non-Expert','2026-05-03','E000000006','1998-12-30'),('VLT0000007','Grace Kim','grace.k@example.com','555-0107','Lakeside','Expert','2026-06-11','E000000007','1988-08-17'),('VLT0000008','Hassan Ali','hassan.a@example.com','555-0108','Maple Town','Non-Expert','2026-02-23','E000000008','1992-03-04'),('VLT0000009','Isabel Cruz','isabel.c@example.com','555-0109','Pine Hill','Non-Expert','2026-03-30','E000000009','1991-06-29'),('VLT0000010','John Doe','john.d@example.com','555-0110','Cedar Point','Expert','2026-01-20','E000000010','1975-10-12'),('VLT0000011','Kavita Rao','kavita.r@example.com','555-0111','Willow Bend','Expert','2026-07-01','E000000011','1984-04-08'),('VLT0000012','Liam O\'Connor','liam.o@example.com','555-0112','Stonebridge','Non-Expert','2026-08-15','E000000012','1996-01-22');
/*!40000 ALTER TABLE `volunteer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `expert`
--

DROP TABLE IF EXISTS `expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expert` (
  `volunteer_id` char(10) NOT NULL,
  `expertise_area` varchar(100) NOT NULL,
  `certifications` tinyint NOT NULL,
  `years_of_experience` int NOT NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_Expert_Volunteer1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expert`
--

LOCK TABLES `expert` WRITE;
/*!40000 ALTER TABLE `expert` DISABLE KEYS */;
INSERT INTO `expert` VALUES ('VLT0000001','Hydrology',2,8),('VLT0000002','Solar Installation',3,12),('VLT0000003','Forestry Management',1,6),('VLT0000004','General Medicine',2,10),('VLT0000007','IT Training',1,5),('VLT0000010','Construction Management',2,18),('VLT0000011','Nutrition',2,9);
/*!40000 ALTER TABLE `expert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `non_expert`
--

DROP TABLE IF EXISTS `non_expert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `non_expert` (
  `volunteer_id` char(10) NOT NULL,
  `skills` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`volunteer_id`),
  CONSTRAINT `fk_Non_Expert_Volunteer1` FOREIGN KEY (`volunteer_id`) REFERENCES `volunteer` (`volunteer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `non_expert`
--

LOCK TABLES `non_expert` WRITE;
/*!40000 ALTER TABLE `non_expert` DISABLE KEYS */;
INSERT INTO `non_expert` VALUES ('VLT0000005','Sanitation site assistance'),('VLT0000006','Seed distribution and field support'),('VLT0000008','Training logistics'),('VLT0000009','Road clearing and manual labor'),('VLT0000012','Community outreach and translation');
/*!40000 ALTER TABLE `non_expert` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `village`
--

DROP TABLE IF EXISTS `village`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `village` (
  `village_id` char(10) NOT NULL COMMENT 'Primary identifier\n',
  `village_name` varchar(100) NOT NULL COMMENT 'Name of the village is required for location',
  `longitude` float DEFAULT NULL COMMENT 'optional info of the village',
  `latitude` float DEFAULT NULL COMMENT 'optional info of the village',
  `village_size` int DEFAULT NULL COMMENT 'Number of people in the village',
  PRIMARY KEY (`village_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `village`
--

LOCK TABLES `village` WRITE;
/*!40000 ALTER TABLE `village` DISABLE KEYS */;
INSERT INTO `village` VALUES ('V000000001','Riverside',-82.9001,34.2001,850),('V000000002','Hilltop',-82.9123,34.2105,420),('V000000003','Greenfield',-82.89,34.18,1200),('V000000004','Seaside',-82.94,34.25,980),('V000000005','Oak Grove',-82.88,34.17,560),('V000000006','Sunnyvale',-82.87,34.16,340),('V000000007','Lakeside',-82.86,34.155,1400),('V000000008','Maple Town',-82.85,34.145,760),('V000000009','Pine Hill',-82.845,34.14,620),('V000000010','Cedar Point',-82.84,34.135,430),('V000000011','Willow Bend',-82.835,34.13,980),('V000000012','Stonebridge',-82.83,34.125,2100);
/*!40000 ALTER TABLE `village` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `request` (
  `request_id` char(10) NOT NULL COMMENT 'Primary identifier ',
  `project_request` varchar(500) NOT NULL COMMENT 'Required description of the village need and request in order to best accomodate a project\n',
  `village_id` char(10) NOT NULL COMMENT 'FK link to VILLAGE',
  PRIMARY KEY (`request_id`,`village_id`),
  KEY `fk_REQUEST_VILLAGE1` (`village_id`),
  CONSTRAINT `fk_REQUEST_VILLAGE1` FOREIGN KEY (`village_id`) REFERENCES `village` (`village_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES ('R00000001','Need clean drinking water and filtration systems','V000000001'),('R00000002','School needs reliable electricity via solar','V000000002'),('R00000003','Request assistance for tree planting around riverbanks','V000000003'),('R00000004','Request mobile clinic visits and vaccination drives','V000000004'),('R00000005','Urgent sanitation improvements required','V000000005'),('R00000006','Support for improved farming techniques and seeds','V000000006'),('R00000007','Request for community ICT training and hardware','V000000007'),('R00000008','Women need small loan programs and training','V000000008'),('R00000009','Access road is in poor condition and needs repair','V000000009'),('R00000010','Market space requested for local vendors','V000000010'),('R00000011','Child malnutrition concerns, seek nutrition program','V000000011'),('R00000012','Recurring floods — need simple levees and drains','V000000012');
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `donation`
--

DROP TABLE IF EXISTS `donation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donation` (
  `donation_id` char(10) NOT NULL COMMENT 'Primary Identifier',
  `donor_id` char(10) NOT NULL COMMENT 'FK link to DONOR',
  `project_id` char(10) NOT NULL COMMENT 'FK link to PROJECT PLAN',
  `amount_donated` decimal(10,2) unsigned NOT NULL COMMENT 'Amount donated from the donor',
  `donation_date` date NOT NULL COMMENT 'When the donation was given',
  PRIMARY KEY (`donation_id`,`donor_id`,`project_id`),
  KEY `fk_DONATION_PROJECT PLAN1` (`project_id`),
  KEY `fk_DONATION_DONOR1` (`donor_id`),
  CONSTRAINT `fk_DONATION_DONOR1` FOREIGN KEY (`donor_id`) REFERENCES `donor` (`donor_id`),
  CONSTRAINT `fk_DONATION_PROJECT PLAN1` FOREIGN KEY (`project_id`) REFERENCES `project_plan` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donation`
--

LOCK TABLES `donation` WRITE;
/*!40000 ALTER TABLE `donation` DISABLE KEYS */;
INSERT INTO `donation` VALUES ('DN0000001','D000000001','P000000001',5000.00,'2025-12-01'),('DN0000002','D000000002','P000000002',12000.00,'2025-11-15'),('DN0000003','D000000003','P000000003',2500.00,'2025-10-30'),('DN0000004','D000000004','P000000004',3000.00,'2025-12-02'),('DN0000005','D000000005','P000000005',4000.00,'2025-09-20'),('DN0000006','D000000006','P000000006',1500.00,'2025-08-10'),('DN0000007','D000000007','P000000007',8000.00,'2025-11-01'),('DN0000008','D000000008','P000000008',2000.00,'2025-10-05'),('DN0000009','D000000009','P000000009',10000.00,'2025-12-03'),('DN0000010','D000000010','P000000010',2500.00,'2025-09-30'),('DN0000011','D000000011','P000000011',3500.00,'2025-10-12'),('DN0000012','D000000012','P000000012',7000.00,'2025-11-20'),('DN200002','D000000001','P000000001',125.00,'2025-12-11');
/*!40000 ALTER TABLE `donation` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

--
-- Table structure for table `assigment`
--

DROP TABLE IF EXISTS `assigment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assigment` (
  `assigment_id` char(10) NOT NULL COMMENT 'Primary identifier',
  `request_id` char(10) NOT NULL COMMENT 'FK link to REQUEST\n',
  `start_date` date NOT NULL COMMENT 'Must know when the assigment starts\n',
  `end_date` date DEFAULT NULL,
  `location` varchar(100) NOT NULL COMMENT 'Where the assigment is at',
  `project_id` char(10) NOT NULL COMMENT 'FK links to PROJECT PLAN\n',
  PRIMARY KEY (`assigment_id`,`project_id`,`request_id`),
  KEY `fk_ASSIGMENT_PROJECT PLAN1` (`project_id`),
  KEY `fk_ASSIGMENT_REQUEST1` (`request_id`),
  CONSTRAINT `fk_ASSIGMENT_PROJECT PLAN1` FOREIGN KEY (`project_id`) REFERENCES `project_plan` (`project_id`),
  CONSTRAINT `fk_ASSIGMENT_REQUEST1` FOREIGN KEY (`request_id`) REFERENCES `request` (`request_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assigment`
--

LOCK TABLES `assigment` WRITE;
/*!40000 ALTER TABLE `assigment` DISABLE KEYS */;
INSERT INTO `assigment` VALUES ('A00000001','R00000001','2026-02-01','2026-06-01','Riverside community center','P000000001'),('A00000002','R00000002','2026-03-01',NULL,'Hilltop primary school','P000000002'),('A00000003','R00000003','2026-04-15','2026-05-30','Greenfield riverbanks','P000000003'),('A00000004','R00000004','2026-02-20','2026-03-05','Seaside clinic route','P000000004'),('A00000005','R00000005','2026-05-01',NULL,'Oak Grove sanitation sites','P000000005'),('A00000006','R00000006','2026-03-10','2026-04-30','Sunnyvale agriculture plots','P000000006'),('A00000007','R00000007','2026-06-01',NULL,'Lakeside school hall','P000000007'),('A00000008','R00000008','2026-04-01','2026-09-01','Maple Town training center','P000000008'),('A00000009','R00000009','2026-05-10','2026-08-15','Pine Hill access road','P000000009'),('A00000010','R00000010','2026-03-20','2026-06-20','Cedar Point market area','P000000010'),('A00000011','R00000011','2026-02-05','2026-05-05','Willow Bend health posts','P000000011'),('A00000012','R00000012','2026-07-01',NULL,'Stonebridge flood plain','P000000012');
/*!40000 ALTER TABLE `assigment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-26 12:19:51
