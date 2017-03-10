# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.15)
# Database: Company
# Generation Time: 2017-03-10 03:03:00 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `Company` CHARSET=utf8;
USE `Company`;

# Dump of table DEPARTMENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DEPARTMENT`;

CREATE TABLE `DEPARTMENT` (
  `Dnumber` int(2) unsigned NOT NULL,
  `Dname` varchar(50) DEFAULT NULL,
  `Mgr_ssn` int(9) unsigned NOT NULL,
  `Mgr_start_date` date DEFAULT NULL,
  PRIMARY KEY (`Dnumber`),
  KEY `fk_link_manager` (`Mgr_ssn`),
  CONSTRAINT `fk_link_manager` FOREIGN KEY (`Mgr_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DEPARTMENT` WRITE;
/*!40000 ALTER TABLE `DEPARTMENT` DISABLE KEYS */;

INSERT INTO `DEPARTMENT` (`Dnumber`, `Dname`, `Mgr_ssn`, `Mgr_start_date`)
VALUES
	(1,'Headquareters',888665555,'1981-06-19'),
	(4,'Administration',987654321,'1995-01-01'),
	(5,'Research',333445555,'1988-05-22');

/*!40000 ALTER TABLE `DEPARTMENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DEPENDENT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DEPENDENT`;

CREATE TABLE `DEPENDENT` (
  `Essn` int(9) unsigned NOT NULL,
  `Dependent_name` varchar(20) NOT NULL,
  `Sex` varchar(1) NOT NULL,
  `Bdate` date DEFAULT NULL,
  `Relationship` varchar(20) NOT NULL,
  PRIMARY KEY (`Essn`,`Dependent_name`),
  CONSTRAINT `fk_works_on` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DEPENDENT` WRITE;
/*!40000 ALTER TABLE `DEPENDENT` DISABLE KEYS */;

INSERT INTO `DEPENDENT` (`Essn`, `Dependent_name`, `Sex`, `Bdate`, `Relationship`)
VALUES
	(123456789,'Alice','F','1988-12-30','Daughter'),
	(123456789,'Elizabeth','F','1967-05-05','Spouse'),
	(123456789,'Michael','M','1988-01-04','Son'),
	(333445555,'Alice','F','1986-04-05','Daughter'),
	(333445555,'Joy','F','1958-05-03','Spouse'),
	(333445555,'Theodore','M','1983-10-25','Son'),
	(987654321,'Abner','M','1942-02-28','Spouse');

/*!40000 ALTER TABLE `DEPENDENT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table DEPT_LOCATIONS
# ------------------------------------------------------------

DROP TABLE IF EXISTS `DEPT_LOCATIONS`;

CREATE TABLE `DEPT_LOCATIONS` (
  `Dnumber` int(2) unsigned NOT NULL,
  `Dlocation` varchar(50) NOT NULL,
  PRIMARY KEY (`Dnumber`,`Dlocation`),
  CONSTRAINT `fk_department` FOREIGN KEY (`Dnumber`) REFERENCES `DEPARTMENT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `DEPT_LOCATIONS` WRITE;
/*!40000 ALTER TABLE `DEPT_LOCATIONS` DISABLE KEYS */;

INSERT INTO `DEPT_LOCATIONS` (`Dnumber`, `Dlocation`)
VALUES
	(1,'Houston'),
	(4,'Stafford'),
	(5,'Bellaire'),
	(5,'Houston'),
	(5,'Sugarland');

/*!40000 ALTER TABLE `DEPT_LOCATIONS` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table EMPLOYEE
# ------------------------------------------------------------

DROP TABLE IF EXISTS `EMPLOYEE`;

CREATE TABLE `EMPLOYEE` (
  `Ssn` int(9) unsigned NOT NULL,
  `Fname` varchar(50) DEFAULT NULL,
  `Minit` varchar(1) DEFAULT NULL,
  `Lname` varchar(50) DEFAULT NULL,
  `Bdate` date DEFAULT NULL,
  `Address` varchar(100) DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `Salary` varchar(10) DEFAULT NULL,
  `Super_ssn` int(9) unsigned DEFAULT NULL,
  `Dno` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`Ssn`),
  KEY `fk_ssn` (`Super_ssn`),
  KEY `fk_in_department` (`Dno`),
  CONSTRAINT `fk_in_department` FOREIGN KEY (`Dno`) REFERENCES `DEPARTMENT` (`Dnumber`) ON DELETE SET NULL ON UPDATE SET NULL,
  CONSTRAINT `fk_ssn` FOREIGN KEY (`Super_ssn`) REFERENCES `EMPLOYEE` (`Ssn`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `EMPLOYEE` WRITE;
/*!40000 ALTER TABLE `EMPLOYEE` DISABLE KEYS */;

INSERT INTO `EMPLOYEE` (`Ssn`, `Fname`, `Minit`, `Lname`, `Bdate`, `Address`, `Sex`, `Salary`, `Super_ssn`, `Dno`)
VALUES
	(123456789,'John','B','Smith','1965-01-09','731 Fondren, Houston, TX','M','30000',333445555,5),
	(333445555,'Franklin','T','Wong','1955-12-08','638 Voss, Houston, TX','M','40000',888665555,5),
	(453453453,'Joyce','A','English','1972-07-31','5631 Rice, Houston, TX','F','25000',333445555,5),
	(666884444,'Ramesh','K','Narayan','1962-09-15','975 Fire Oak, Humble, TX','M','38000',333445555,5),
	(888665555,'James','E','Borg','1937-11-10','450 Stone, Houston, TX','M','55000',NULL,1),
	(987654321,'Jennifer','S','Wallance','1941-06-20','291 Berry, Bellaire, TX','F','43000',888665555,4),
	(987987987,'Ahmad','V','Jabbar','1969-03-29','980 Dallas, Houston, TX','M','25000',987654321,4),
	(999887777,'Alicia','J','Zelaya','1968-01-19','3321 Castle, Spring, TX','F','25000',987654321,4);

/*!40000 ALTER TABLE `EMPLOYEE` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table PROJECT
# ------------------------------------------------------------

DROP TABLE IF EXISTS `PROJECT`;

CREATE TABLE `PROJECT` (
  `Pnumber` int(5) unsigned NOT NULL,
  `Pname` varchar(50) NOT NULL,
  `Plocation` varchar(50) NOT NULL,
  `Dnum` int(2) unsigned NOT NULL,
  PRIMARY KEY (`Pnumber`),
  KEY `fk_department_link` (`Dnum`),
  CONSTRAINT `fk_department_link` FOREIGN KEY (`Dnum`) REFERENCES `DEPARTMENT` (`Dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `PROJECT` WRITE;
/*!40000 ALTER TABLE `PROJECT` DISABLE KEYS */;

INSERT INTO `PROJECT` (`Pnumber`, `Pname`, `Plocation`, `Dnum`)
VALUES
	(1,'ProductX','Bellaire',5),
	(2,'ProductY','Sugarland',5),
	(3,'ProductZ','Houston',5),
	(10,'Computerization','Stafford',4),
	(20,'Reorganization','Houston',1),
	(30,'Newbenefits','Stafford',4);

/*!40000 ALTER TABLE `PROJECT` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table WORKS_ON
# ------------------------------------------------------------

DROP TABLE IF EXISTS `WORKS_ON`;

CREATE TABLE `WORKS_ON` (
  `Essn` int(9) unsigned NOT NULL,
  `Pno` int(3) unsigned NOT NULL,
  `Hourse` float(3,1) DEFAULT NULL,
  PRIMARY KEY (`Essn`,`Pno`),
  KEY `fk_launch_project` (`Pno`),
  CONSTRAINT `fk_employee_works` FOREIGN KEY (`Essn`) REFERENCES `EMPLOYEE` (`Ssn`),
  CONSTRAINT `fk_launch_project` FOREIGN KEY (`Pno`) REFERENCES `PROJECT` (`Pnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `WORKS_ON` WRITE;
/*!40000 ALTER TABLE `WORKS_ON` DISABLE KEYS */;

INSERT INTO `WORKS_ON` (`Essn`, `Pno`, `Hourse`)
VALUES
	(123456789,1,32.5),
	(123456789,2,7.5),
	(333445555,2,20.0),
	(333445555,3,10.0),
	(333445555,10,10.0),
	(333445555,20,10.0),
	(453453453,1,20.0),
	(453453453,2,20.2),
	(666884444,3,40.0),
	(888665555,20,NULL),
	(987654321,20,15.0),
	(987654321,30,20.0),
	(987987987,10,53.0),
	(987987987,30,5.0),
	(999887777,10,10.0),
	(999887777,30,30.0);

/*!40000 ALTER TABLE `WORKS_ON` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
