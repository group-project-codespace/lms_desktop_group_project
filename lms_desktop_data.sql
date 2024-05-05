-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               8.0.36-0ubuntu0.22.04.1 - (Ubuntu)
-- Server OS:                    Linux
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for lms_desktop_db
CREATE DATABASE IF NOT EXISTS `lms_desktop_db` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms_desktop_db`;

-- Dumping structure for table lms_desktop_db.address
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `line1` varchar(45) NOT NULL,
  `line2` varchar(45) DEFAULT NULL,
  `city_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_address_city1_idx` (`city_id`),
  CONSTRAINT `fk_address_city1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.address: ~0 rows (approximately)
DELETE FROM `address`;

-- Dumping structure for table lms_desktop_db.admin
CREATE TABLE IF NOT EXISTS `admin` (
  `nic` varchar(45) NOT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(100) NOT NULL,
  `position_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `address_id` int NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_admin_position_idx` (`position_id`),
  KEY `fk_admin_gender1_idx` (`gender_id`),
  KEY `fk_admin_address1_idx` (`address_id`),
  CONSTRAINT `fk_admin_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_admin_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_admin_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.admin: ~0 rows (approximately)
DELETE FROM `admin`;

-- Dumping structure for table lms_desktop_db.admin_salary
CREATE TABLE IF NOT EXISTS `admin_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_nic` varchar(45) NOT NULL,
  `salary_id` int NOT NULL,
  `date` datetime NOT NULL,
  `month_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_admin_has_salary_salary1_idx` (`salary_id`),
  KEY `fk_admin_has_salary_admin1_idx` (`admin_nic`),
  KEY `fk_admin_salary_month1_idx` (`month_id`),
  CONSTRAINT `fk_admin_has_salary_admin1` FOREIGN KEY (`admin_nic`) REFERENCES `admin` (`nic`),
  CONSTRAINT `fk_admin_has_salary_salary1` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`id`),
  CONSTRAINT `fk_admin_salary_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.admin_salary: ~0 rows (approximately)
DELETE FROM `admin_salary`;

-- Dumping structure for table lms_desktop_db.attendence
CREATE TABLE IF NOT EXISTS `attendence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `time_slot_id` int NOT NULL,
  `student_nic` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendence_time_slot1_idx` (`time_slot_id`),
  KEY `fk_attendence_student1_idx` (`student_nic`),
  CONSTRAINT `fk_attendence_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_attendence_time_slot1` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.attendence: ~0 rows (approximately)
DELETE FROM `attendence`;

-- Dumping structure for table lms_desktop_db.city
CREATE TABLE IF NOT EXISTS `city` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `district_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_city_district1_idx` (`district_id`),
  CONSTRAINT `fk_city_district1` FOREIGN KEY (`district_id`) REFERENCES `district` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.city: ~0 rows (approximately)
DELETE FROM `city`;
INSERT INTO `city` (`id`, `name`, `district_id`) VALUES
	(1, 'Kandy', 1),
	(2, 'Peradeniya', 1),
	(3, 'Katugastota', 1),
	(4, 'Gampola', 1),
	(5, 'Akurana', 1),
	(6, 'Digana', 1),
	(7, 'Nawalapitiya', 1),
	(8, 'Matale', 2),
	(9, 'Dambulla', 2),
	(10, 'Rattota', 2),
	(11, 'Galewela', 2),
	(12, 'Palapathwela', 2),
	(13, 'Ukuwela', 2),
	(14, 'Nuwara Eliya', 3),
	(15, 'Hatton', 3),
	(16, 'Talawakele', 3),
	(17, 'Ginigathhena', 3),
	(18, 'Ragala', 3),
	(19, 'Lindula', 3),
	(20, 'Ampara', 4),
	(21, 'Akkaraipattu', 4),
	(22, 'Kalmunai', 4),
	(23, 'Sammanthurai', 4),
	(24, 'Pottuvil', 4),
	(25, 'Batticaloa', 5),
	(26, 'Kattankudy', 5),
	(27, 'Valaichchenai', 5),
	(28, 'Eravur', 5),
	(29, 'Chenkalady', 5),
	(40, 'Trincomalee', 6),
	(41, 'Kinniya', 6),
	(42, 'Gomarankadawala', 6),
	(43, 'Nilaveli', 6),
	(44, 'Anuradhapura', 7),
	(45, 'Medawachchiya', 7),
	(46, 'Talawa', 7),
	(47, 'Kekirawa', 7),
	(48, 'Kebithigollewa', 7);

-- Dumping structure for table lms_desktop_db.class
CREATE TABLE IF NOT EXISTS `class` (
  `id` int NOT NULL AUTO_INCREMENT,
  `grade_id` int NOT NULL,
  `subject_id` int NOT NULL,
  `class_fees_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_class_grade1_idx` (`grade_id`),
  KEY `fk_class_subject1_idx` (`subject_id`),
  KEY `fk_class_class_fees1_idx` (`class_fees_id`),
  CONSTRAINT `fk_class_class_fees1` FOREIGN KEY (`class_fees_id`) REFERENCES `class_fees` (`id`),
  CONSTRAINT `fk_class_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_class_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.class: ~0 rows (approximately)
DELETE FROM `class`;

-- Dumping structure for table lms_desktop_db.class_fees
CREATE TABLE IF NOT EXISTS `class_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.class_fees: ~0 rows (approximately)
DELETE FROM `class_fees`;

-- Dumping structure for table lms_desktop_db.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.district: ~0 rows (approximately)
DELETE FROM `district`;
INSERT INTO `district` (`id`, `name`, `province_id`) VALUES
	(1, 'Kandy', 1),
	(2, 'Matale', 1),
	(3, 'Nuwara Eliya', 1),
	(4, 'Ampara', 2),
	(5, 'Batticaloa', 2),
	(6, 'Trincomalee', 2),
	(7, 'Anuradhapura', 3),
	(8, 'Polonnaruwa', 3),
	(9, 'Jaffna', 4),
	(10, 'Kilinochchi', 4),
	(11, 'Mannar', 4),
	(12, 'Mullaitivu', 4),
	(13, 'Vavuniya', 4),
	(14, 'Kurunegala', 5),
	(15, 'Puttalam', 5),
	(16, 'Kegalle', 6),
	(17, 'Ratnapura', 6),
	(18, 'Galle', 7),
	(19, 'Hambantota', 7),
	(20, 'Matara', 7),
	(21, 'Badulla', 8),
	(22, 'Monaragala', 8),
	(23, 'Colombo', 9),
	(24, 'Gampaha', 9),
	(25, 'Kalutara', 9);

-- Dumping structure for table lms_desktop_db.exam
CREATE TABLE IF NOT EXISTS `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam` varchar(45) NOT NULL,
  `from` datetime NOT NULL,
  `to` datetime NOT NULL,
  `subject_id` int NOT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_exam_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_exam_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.exam: ~0 rows (approximately)
DELETE FROM `exam`;

-- Dumping structure for table lms_desktop_db.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.gender: ~0 rows (approximately)
DELETE FROM `gender`;
INSERT INTO `gender` (`id`, `name`) VALUES
	(1, 'male'),
	(2, 'female');

-- Dumping structure for table lms_desktop_db.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.grade: ~0 rows (approximately)
DELETE FROM `grade`;
INSERT INTO `grade` (`id`, `name`) VALUES
	(1, '11'),
	(2, '12');

-- Dumping structure for table lms_desktop_db.instructor
CREATE TABLE IF NOT EXISTS `instructor` (
  `nic` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(10) DEFAULT NULL,
  `subject_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `gender_id` int NOT NULL,
  `address_id` int NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_instructor_subject1_idx` (`subject_id`),
  KEY `fk_instructor_gender1_idx` (`gender_id`),
  KEY `fk_instructor_address1_idx` (`address_id`),
  CONSTRAINT `fk_instructor_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_instructor_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_instructor_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.instructor: ~0 rows (approximately)
DELETE FROM `instructor`;

-- Dumping structure for table lms_desktop_db.instructor_salary
CREATE TABLE IF NOT EXISTS `instructor_salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `month_id` int NOT NULL,
  `class_id` int NOT NULL,
  `instructor_nic` int NOT NULL,
  `salary_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_instructor_salary_month1_idx` (`month_id`),
  KEY `fk_instructor_salary_class1_idx` (`class_id`),
  KEY `fk_instructor_salary_instructor1_idx` (`instructor_nic`),
  KEY `fk_instructor_salary_salary1_idx` (`salary_id`),
  CONSTRAINT `fk_instructor_salary_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_instructor_salary_instructor1` FOREIGN KEY (`instructor_nic`) REFERENCES `instructor` (`nic`),
  CONSTRAINT `fk_instructor_salary_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`),
  CONSTRAINT `fk_instructor_salary_salary1` FOREIGN KEY (`salary_id`) REFERENCES `salary` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.instructor_salary: ~0 rows (approximately)
DELETE FROM `instructor_salary`;

-- Dumping structure for table lms_desktop_db.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `payment_method_id` int NOT NULL,
  `student_nic` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  KEY `fk_invoice_student1_idx` (`student_nic`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_invoice_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.invoice: ~0 rows (approximately)
DELETE FROM `invoice`;

-- Dumping structure for table lms_desktop_db.invoice_item
CREATE TABLE IF NOT EXISTS `invoice_item` (
  `id` int NOT NULL AUTO_INCREMENT,
  `value` double NOT NULL,
  `month_id` int NOT NULL,
  `class_id` int NOT NULL,
  `invoice_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_item_month1_idx` (`month_id`),
  KEY `fk_invoice_item_class1_idx` (`class_id`),
  KEY `fk_invoice_item_invoice1_idx` (`invoice_id`),
  CONSTRAINT `fk_invoice_item_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`),
  CONSTRAINT `fk_invoice_item_invoice1` FOREIGN KEY (`invoice_id`) REFERENCES `invoice` (`id`),
  CONSTRAINT `fk_invoice_item_month1` FOREIGN KEY (`month_id`) REFERENCES `month` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.invoice_item: ~0 rows (approximately)
DELETE FROM `invoice_item`;

-- Dumping structure for table lms_desktop_db.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.month: ~0 rows (approximately)
DELETE FROM `month`;
INSERT INTO `month` (`id`, `name`) VALUES
	(1, 'January'),
	(2, 'February'),
	(3, 'March'),
	(4, 'April'),
	(5, 'May'),
	(6, 'June'),
	(7, 'July'),
	(8, 'August'),
	(9, 'September'),
	(10, 'October'),
	(11, 'November'),
	(12, 'December');

-- Dumping structure for table lms_desktop_db.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.payment_method: ~0 rows (approximately)
DELETE FROM `payment_method`;
INSERT INTO `payment_method` (`id`, `name`) VALUES
	(1, 'cash'),
	(2, 'credit card'),
	(3, 'debit card'),
	(4, 'check');

-- Dumping structure for table lms_desktop_db.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.position: ~0 rows (approximately)
DELETE FROM `position`;
INSERT INTO `position` (`id`, `name`) VALUES
	(1, 'super admin'),
	(2, 'manager');

-- Dumping structure for table lms_desktop_db.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.province: ~0 rows (approximately)
DELETE FROM `province`;
INSERT INTO `province` (`id`, `name`) VALUES
	(1, 'North Central'),
	(2, 'Central Province'),
	(3, 'Eastern Province'),
	(4, 'Northern Province'),
	(5, 'North Western Province'),
	(6, 'Sabaragamuwa Province'),
	(7, 'Southern Province'),
	(8, 'Uva Province'),
	(9, 'Western Province');

-- Dumping structure for table lms_desktop_db.salary
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.salary: ~0 rows (approximately)
DELETE FROM `salary`;

-- Dumping structure for table lms_desktop_db.student
CREATE TABLE IF NOT EXISTS `student` (
  `nic` int NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `gender_id` int NOT NULL,
  `grade_id` int NOT NULL,
  `registered_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_student_gender1_idx` (`gender_id`),
  KEY `fk_student_grade1_idx` (`grade_id`),
  CONSTRAINT `fk_student_gender1` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_student_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.student: ~0 rows (approximately)
DELETE FROM `student`;

-- Dumping structure for table lms_desktop_db.student_has_address
CREATE TABLE IF NOT EXISTS `student_has_address` (
  `address_id` int NOT NULL,
  `student_nic` int NOT NULL,
  PRIMARY KEY (`address_id`,`student_nic`),
  KEY `fk_student_has_address_address1_idx` (`address_id`),
  KEY `fk_student_has_address_student2_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_address_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_student_has_address_student2` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.student_has_address: ~0 rows (approximately)
DELETE FROM `student_has_address`;

-- Dumping structure for table lms_desktop_db.student_has_exam
CREATE TABLE IF NOT EXISTS `student_has_exam` (
  `student_nic` int NOT NULL,
  `exam_id` int NOT NULL,
  `marks` double NOT NULL,
  PRIMARY KEY (`student_nic`,`exam_id`),
  KEY `fk_student_has_exam_exam1_idx` (`exam_id`),
  KEY `fk_student_has_exam_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_exam_exam1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_student_has_exam_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.student_has_exam: ~0 rows (approximately)
DELETE FROM `student_has_exam`;

-- Dumping structure for table lms_desktop_db.student_has_subject
CREATE TABLE IF NOT EXISTS `student_has_subject` (
  `subject_id` int NOT NULL,
  `student_nic` int NOT NULL,
  PRIMARY KEY (`subject_id`,`student_nic`),
  KEY `fk_student_has_subject_subject1_idx` (`subject_id`),
  KEY `fk_student_has_subject_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_subject_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_student_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.student_has_subject: ~0 rows (approximately)
DELETE FROM `student_has_subject`;

-- Dumping structure for table lms_desktop_db.student_img
CREATE TABLE IF NOT EXISTS `student_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.student_img: ~0 rows (approximately)
DELETE FROM `student_img`;

-- Dumping structure for table lms_desktop_db.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.subject: ~0 rows (approximately)
DELETE FROM `subject`;
INSERT INTO `subject` (`id`, `name`, `status`) VALUES
	(1, 'Combined Mathematics', 1),
	(2, 'Physics', 1),
	(3, 'Chemistry', 1),
	(4, 'Biology', 1),
	(5, 'ICT', 1),
	(6, 'Physical Science', 1),
	(7, 'Engineering Technology', 1),
	(8, 'Science For Technology', 1),
	(9, 'Accounting', 1),
	(10, 'Business Studies', 1);

-- Dumping structure for table lms_desktop_db.subject_has_grade
CREATE TABLE IF NOT EXISTS `subject_has_grade` (
  `subject_id` int NOT NULL,
  `grade_id` int NOT NULL,
  `subject_price_id` int NOT NULL,
  PRIMARY KEY (`subject_id`,`grade_id`,`subject_price_id`),
  KEY `fk_subject_has_grade_grade1_idx` (`grade_id`),
  KEY `fk_subject_has_grade_subject1_idx` (`subject_id`),
  KEY `fk_subject_has_grade_subject_price1_idx` (`subject_price_id`),
  CONSTRAINT `fk_subject_has_grade_grade1` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_subject_has_grade_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_subject_has_grade_subject_price1` FOREIGN KEY (`subject_price_id`) REFERENCES `subject_price` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.subject_has_grade: ~0 rows (approximately)
DELETE FROM `subject_has_grade`;

-- Dumping structure for table lms_desktop_db.subject_has_subject_stream
CREATE TABLE IF NOT EXISTS `subject_has_subject_stream` (
  `subject_id` int NOT NULL,
  `subject_stream_id` int NOT NULL,
  PRIMARY KEY (`subject_id`,`subject_stream_id`),
  KEY `fk_subject_has_subject_stream_subject_stream1_idx` (`subject_stream_id`),
  KEY `fk_subject_has_subject_stream_subject1_idx` (`subject_id`),
  CONSTRAINT `fk_subject_has_subject_stream_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `fk_subject_has_subject_stream_subject_stream1` FOREIGN KEY (`subject_stream_id`) REFERENCES `subject_stream` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.subject_has_subject_stream: ~0 rows (approximately)
DELETE FROM `subject_has_subject_stream`;

-- Dumping structure for table lms_desktop_db.subject_price
CREATE TABLE IF NOT EXISTS `subject_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.subject_price: ~0 rows (approximately)
DELETE FROM `subject_price`;

-- Dumping structure for table lms_desktop_db.subject_stream
CREATE TABLE IF NOT EXISTS `subject_stream` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.subject_stream: ~0 rows (approximately)
DELETE FROM `subject_stream`;

-- Dumping structure for table lms_desktop_db.time_slot
CREATE TABLE IF NOT EXISTS `time_slot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `status` int NOT NULL,
  `class_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_time_slot_class1_idx` (`class_id`),
  CONSTRAINT `fk_time_slot_class1` FOREIGN KEY (`class_id`) REFERENCES `class` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- Dumping data for table lms_desktop_db.time_slot: ~0 rows (approximately)
DELETE FROM `time_slot`;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
