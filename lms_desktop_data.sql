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
CREATE DATABASE IF NOT EXISTS `lms_desktop_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.admin_salary: ~0 rows (approximately)
DELETE FROM `admin_salary`;

-- Dumping structure for table lms_desktop_db.attendence
CREATE TABLE IF NOT EXISTS `attendence` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` int NOT NULL,
  `time_slot_id` int NOT NULL,
  `student_nic` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_attendence_time_slot1_idx` (`time_slot_id`),
  KEY `fk_attendence_student1_idx` (`student_nic`),
  CONSTRAINT `fk_attendence_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_attendence_time_slot1` FOREIGN KEY (`time_slot_id`) REFERENCES `time_slot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.city: ~0 rows (approximately)
DELETE FROM `city`;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.class: ~0 rows (approximately)
DELETE FROM `class`;
INSERT INTO `class` (`id`, `grade_id`, `subject_id`, `class_fees_id`) VALUES
	(1, 1, 1, 2);

-- Dumping structure for table lms_desktop_db.class_fees
CREATE TABLE IF NOT EXISTS `class_fees` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fee` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.class_fees: ~2 rows (approximately)
DELETE FROM `class_fees`;
INSERT INTO `class_fees` (`id`, `fee`) VALUES
	(1, 234),
	(2, 500),
	(3, 4354);

-- Dumping structure for table lms_desktop_db.district
CREATE TABLE IF NOT EXISTS `district` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `province_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_district_province1_idx` (`province_id`),
  CONSTRAINT `fk_district_province1` FOREIGN KEY (`province_id`) REFERENCES `province` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.district: ~0 rows (approximately)
DELETE FROM `district`;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.exam: ~0 rows (approximately)
DELETE FROM `exam`;

-- Dumping structure for table lms_desktop_db.gender
CREATE TABLE IF NOT EXISTS `gender` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.gender: ~0 rows (approximately)
DELETE FROM `gender`;

-- Dumping structure for table lms_desktop_db.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.grade: ~2 rows (approximately)
DELETE FROM `grade`;
INSERT INTO `grade` (`id`, `name`) VALUES
	(1, '12'),
	(2, '13');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.instructor_salary: ~0 rows (approximately)
DELETE FROM `instructor_salary`;

-- Dumping structure for table lms_desktop_db.invoice
CREATE TABLE IF NOT EXISTS `invoice` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `payment_method_id` int NOT NULL,
  `student_nic` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_invoice_payment_method1_idx` (`payment_method_id`),
  KEY `fk_invoice_student1_idx` (`student_nic`),
  CONSTRAINT `fk_invoice_payment_method1` FOREIGN KEY (`payment_method_id`) REFERENCES `payment_method` (`id`),
  CONSTRAINT `fk_invoice_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.invoice_item: ~0 rows (approximately)
DELETE FROM `invoice_item`;

-- Dumping structure for table lms_desktop_db.month
CREATE TABLE IF NOT EXISTS `month` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.month: ~0 rows (approximately)
DELETE FROM `month`;

-- Dumping structure for table lms_desktop_db.payment_method
CREATE TABLE IF NOT EXISTS `payment_method` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.payment_method: ~0 rows (approximately)
DELETE FROM `payment_method`;

-- Dumping structure for table lms_desktop_db.position
CREATE TABLE IF NOT EXISTS `position` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.position: ~0 rows (approximately)
DELETE FROM `position`;

-- Dumping structure for table lms_desktop_db.province
CREATE TABLE IF NOT EXISTS `province` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.province: ~0 rows (approximately)
DELETE FROM `province`;

-- Dumping structure for table lms_desktop_db.salary
CREATE TABLE IF NOT EXISTS `salary` (
  `id` int NOT NULL AUTO_INCREMENT,
  `salary` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.salary: ~0 rows (approximately)
DELETE FROM `salary`;

-- Dumping structure for table lms_desktop_db.student
CREATE TABLE IF NOT EXISTS `student` (
  `nic` varchar(20) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `mobile_number` varchar(10) NOT NULL,
  `grade_id` int NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `barcode` tinytext,
  `student_img_id` int NOT NULL,
  `gender_id` int NOT NULL,
  `registered_date` datetime NOT NULL,
  PRIMARY KEY (`nic`),
  KEY `fk_student_grade2_idx` (`grade_id`),
  KEY `fk_student_student_img1_idx` (`student_img_id`),
  KEY `fk_student_gender2_idx` (`gender_id`),
  CONSTRAINT `fk_student_gender2` FOREIGN KEY (`gender_id`) REFERENCES `gender` (`id`),
  CONSTRAINT `fk_student_grade2` FOREIGN KEY (`grade_id`) REFERENCES `grade` (`id`),
  CONSTRAINT `fk_student_student_img1` FOREIGN KEY (`student_img_id`) REFERENCES `student_img` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.student: ~0 rows (approximately)
DELETE FROM `student`;

-- Dumping structure for table lms_desktop_db.student_has_address
CREATE TABLE IF NOT EXISTS `student_has_address` (
  `address_id` int NOT NULL,
  `student_nic` varchar(20) NOT NULL,
  PRIMARY KEY (`address_id`,`student_nic`),
  KEY `fk_student_has_address_address1_idx` (`address_id`),
  KEY `fk_student_has_address_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_address_address1` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  CONSTRAINT `fk_student_has_address_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.student_has_address: ~0 rows (approximately)
DELETE FROM `student_has_address`;

-- Dumping structure for table lms_desktop_db.student_has_exam
CREATE TABLE IF NOT EXISTS `student_has_exam` (
  `exam_id` int NOT NULL,
  `marks` double NOT NULL,
  `student_nic` varchar(20) NOT NULL,
  PRIMARY KEY (`exam_id`,`student_nic`),
  KEY `fk_student_has_exam_exam1_idx` (`exam_id`),
  KEY `fk_student_has_exam_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_exam_exam1` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `fk_student_has_exam_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.student_has_exam: ~0 rows (approximately)
DELETE FROM `student_has_exam`;

-- Dumping structure for table lms_desktop_db.student_has_subject
CREATE TABLE IF NOT EXISTS `student_has_subject` (
  `subject_id` int NOT NULL,
  `student_nic` varchar(20) NOT NULL,
  PRIMARY KEY (`subject_id`,`student_nic`),
  KEY `fk_student_has_subject_subject1_idx` (`subject_id`),
  KEY `fk_student_has_subject_student1_idx` (`student_nic`),
  CONSTRAINT `fk_student_has_subject_student1` FOREIGN KEY (`student_nic`) REFERENCES `student` (`nic`),
  CONSTRAINT `fk_student_has_subject_subject1` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.student_has_subject: ~0 rows (approximately)
DELETE FROM `student_has_subject`;

-- Dumping structure for table lms_desktop_db.student_img
CREATE TABLE IF NOT EXISTS `student_img` (
  `id` int NOT NULL AUTO_INCREMENT,
  `img` tinytext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.student_img: ~0 rows (approximately)
DELETE FROM `student_img`;

-- Dumping structure for table lms_desktop_db.subject
CREATE TABLE IF NOT EXISTS `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.subject: ~10 rows (approximately)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.subject_has_subject_stream: ~0 rows (approximately)
DELETE FROM `subject_has_subject_stream`;

-- Dumping structure for table lms_desktop_db.subject_price
CREATE TABLE IF NOT EXISTS `subject_price` (
  `id` int NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.subject_price: ~0 rows (approximately)
DELETE FROM `subject_price`;

-- Dumping structure for table lms_desktop_db.subject_stream
CREATE TABLE IF NOT EXISTS `subject_stream` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Dumping data for table lms_desktop_db.time_slot: ~0 rows (approximately)
DELETE FROM `time_slot`;
INSERT INTO `time_slot` (`id`, `start_time`, `end_time`, `status`, `class_id`) VALUES
	(1, '2024-05-01 16:21:08', '2024-05-01 18:21:10', 1, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
