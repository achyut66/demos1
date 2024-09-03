-- phpMyAdmin SQL Dump
-- version 4.4.15.10
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 03, 2024 at 05:03 AM
-- Server version: 10.11.3-MariaDB
-- PHP Version: 7.3.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `galchhi_business`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsertGroupPermission`(IN `module_id` INT, IN `user_action_id` INT, IN `group_id` INT, IN `added_by` INT, IN `added_date` DATETIME, IN `modified_by` INT, IN `modified_date` DATETIME)
BEGIN
INSERT INTO permissions_per_group (
        module_id,
        user_action_id,
        group_id,
        added_by,
        added_date,
        modified_by,
        modified_date
    )
    VALUES (
        module_id,
        user_action_id,
        group_id,
        added_by,
        added_date,
        modified_by,
        modified_date
    );
END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CheckGroupPermission`(`ModuleId` INT(11), `UserActionId` INT(11), `GroupId` INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE bReturn BOOL;
	IF GroupId = 1 THEN
		RETURN TRUE;
	END IF;
	IF EXISTS 
		(
		 SELECT permission_per_group_id 
		 FROM permissions_per_group
		 WHERE module_id = ModuleId
		 AND user_action_id = UserActionId
		 AND group_id = GroupId
		 ) 
		THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CheckMenuPermission`(`MenuId` INT(11), `LoginId` INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE bReturn BOOL;
	DECLARE GroupId INT(11);	
	SELECT user_group INTO GroupId FROM users  WHERE userid = LoginId;
	IF GroupId = 1 THEN RETURN 1; END IF;
	IF EXISTS 
		(
			 SELECT permission_per_user_id 
			 FROM permissions_per_user
			 WHERE module_id = MenuId
			 AND user_id = LoginId LIMIT 0,1
		 ) 
		THEN
		RETURN 1;
	ELSEIF EXISTS
			(
				 SELECT permission_per_group_id 
				 FROM permissions_per_group
				 WHERE module_id = MenuId
				 AND group_id = GroupId LIMIT 0,1
			 ) 
		THEN
		RETURN 1;
	END IF;
	RETURN 0;
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CheckPermissionByLoginId`(`ModuleCode` VARCHAR(20), `UserActionCode` VARCHAR(20), `LoginId` INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE bReturn BOOL;
	DECLARE GroupId INT(11);
	DECLARE ModuleId INT(11);
	DECLARE UserActionId INT(11);
	SELECT fn_GetModuleId(ModuleCode) INTO ModuleId;
	SELECT fn_GetUserActionId(UserActionCode) INTO UserActionId;
	SELECT user_group INTO GroupId FROM users  WHERE userid = LoginId;
	IF fn_CheckUserPermission(ModuleId, UserActionId, LoginId) = 1  THEN
		RETURN TRUE;
	ELSEIF fn_CheckGroupPermission(ModuleId, UserActionId, GroupId) = 1 THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_CheckUserPermission`(`ModuleId` INT(11), `UserActionId` INT(11), `UserId` INT(11)) RETURNS tinyint(1)
BEGIN
	DECLARE bReturn BOOL;
	IF EXISTS 
		(
		 SELECT permission_per_user_id 
		 FROM permissions_per_user
		 WHERE module_id = ModuleId
		 AND user_action_id = UserActionId
		 AND user_id = UserId
		 ) 
		THEN
		RETURN TRUE;
	END IF;
	RETURN FALSE;
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetModuleId`(`ModuleCode` VARCHAR(20)) RETURNS int(11)
BEGIN
	DECLARE iReturn INT(11);
	SET iReturn = 0;
	SELECT menuid INTO iReturn FROM admin_menu WHERE module_code = ModuleCode;
	RETURN iReturn;
    END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `fn_GetUserActionId`(`UserActionCode` VARCHAR(20)) RETURNS int(11)
BEGIN
	DECLARE iReturn INT(11);
	SET iReturn = 0;
	SELECT user_action_id INTO iReturn FROM user_actions WHERE user_action_code = UserActionCode;
	RETURN iReturn;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE IF NOT EXISTS `admin_menu` (
  `menuid` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `menu_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `menu_link` varchar(255) NOT NULL,
  `group_label` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `module_code` varchar(50) DEFAULT NULL,
  `description` text NOT NULL,
  `position` tinyint(4) NOT NULL,
  `icon_class` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`menuid`, `parent_id`, `menu_name`, `menu_link`, `group_label`, `status`, `module_code`, `description`, `position`, `icon_class`) VALUES
(1, 0, 'ड्यासबोर्ड', 'Dashboard', '', 1, 'DASHBOARD', '', 1, 'fa fa-dashboard'),
(2, 0, 'व्यवसाय दर्ता', '#', '', 1, '', '', 4, 'fa f fa-dot-circle-o'),
(3, 0, 'सेटिंग', '#', '', 1, '', '', 2, 'fa fa-cogs'),
(4, 3, 'व्यवसाय शिर्षक ', 'BusinessType', '', 1, '', '', 2, 'fa f fa-dot-circle-o'),
(5, 3, 'शर्तहरु', 'Commitment', '', 1, 'COMMITMENT', '', 3, 'fa fa-cogs'),
(6, 2, ' व्यवसाय दर्ता फारम', 'Register/add', '', 1, '', '', 3, 'fa fa-info-circle'),
(7, 2, 'व्यवसाय दर्ता सुची', 'Register', '', 1, 'REGISTER', '', 3, 'fa fa-info-circle'),
(8, 0, 'प्रयोगकर्ता व्यवस्थापन', '#', '', 1, '', '', 99, 'fa fa-users'),
(9, 8, 'भूमिका', 'Groups', '', 1, 'USER-ROLE', '', 99, 'fa fa-users'),
(10, 8, 'प्रयोगकर्ता', 'Users', '', 1, 'USER-ROLE', '', 2, 'fa fa-users'),
(11, 0, 'रिपोर्ट हेर्नुहोस', '#', '', 1, '', '', 98, 'fa fa-book'),
(12, 3, 'वर्ग', 'Category', '', 1, 'CATEGORY', '', 1, 'fa f fa-dot-circle-o'),
(13, 3, 'कर्मचारी', 'Staff', '', 1, 'STAFF', '', 4, 'fa f fa-dot-circle-o'),
(14, 0, 'कृषि समुह दर्ता', 'AgricultureDepartment', '', 1, 'AG-DEPARTMENT', '', 5, 'fa f fa-dot-circle-o'),
(15, 14, 'समुह दर्ता फारम ', 'AgricultureDepartment/Add', '', 1, 'AG-DEPARTMENT-ADD', '', 1, 'fa f fa-dot-circle-o'),
(16, 14, 'कृषि समुह दर्ता सुची', 'AgricultureDepartment', '', 1, 'AG-DEPARTMENT-LIST', '', 1, 'fa f fa-dot-circle-o'),
(17, 3, 'कार्यविधि', 'KaryaBidi', '', 1, 'KARYA-BIDI', '', 5, 'fa fa-cogs'),
(18, 0, 'सहकारी संस्था दर्ता', 'SahakariDarta/add', '', 1, '#', '', 6, 'fa f fa-dot-circle-o'),
(19, 18, 'दर्ता फारम', 'SahakariDarta/add', '', 1, 'SAHAKARI-DARTA', '', 1, 'fa f fa-dot-circle-o'),
(20, 18, 'दर्ता सुची', 'SahakariDarta', '', 1, 'SAHAKARI-DARTA-LIST', '', 1, 'fa f fa-dot-circle-o'),
(21, 0, 'खानेपानी दर्ता प्रमाणपत्र', '#', '', 1, '', '', 7, 'fa f fa-dot-circle-o'),
(22, 21, 'दर्ता फारम', 'Khanepani/add', '', 1, 'KAHNE-PANI', '', 1, ''),
(23, 21, 'दर्ता सुची', 'Khanepani', '', 1, 'KAHNE-PANI-LIST', '', 2, ''),
(24, 0, 'इजाजत पत्र', 'IjajatPatra', '', 1, 'IJAJATA-PATRA', '', 3, 'fa f fa-dot-circle-o'),
(25, 0, 'रासायनिक मल बिक्रेता', 'RasaynikMaal', '', 1, 'RASAINIK-MAAL', '', 3, 'fa f fa-dot-circle-o'),
(26, 0, 'मेलमिलाप प्रमाण पत्र', 'Melmilap', '', 1, 'MELMILAP', '', 3, 'fa f fa-dot-circle-o'),
(27, 0, 'आवद्धताको प्रमाण पत्र', 'Affiliation', '', 1, 'AFFILIATION', '', 3, 'fa f fa-dot-circle-o'),
(28, 0, 'संचालन अनुमति पत्र', 'PermissionLetter', '', 1, 'PERMISSION-LETTER', '', 3, 'fa f fa-dot-circle-o'),
(29, 3, 'आर्थिक वर्ष', 'FiscalYear', '', 1, 'FISCAL YEAR', '', 6, 'fa fa-cogs'),
(30, 3, 'स्थानीय सरकार ऐन', 'SarkarYain', '', 1, 'YAIN', '', 7, 'fa fa-cogs'),
(31, 0, 'संस्था दर्ता', 'Sansthadarta', '', 1, 'SANSTHA', '', 4, 'fa f fa-dot-circle-o'),
(32, 31, 'संस्था दर्ता  फारम ', 'Sanstha/add', '', 1, 'SANSTHA', '', 4, 'fa f fa-dot-circle-o'),
(33, 31, 'संस्था दर्ता  सुची ', 'Sanstha', '', 1, 'SANSTHA', '', 4, 'fa f fa-dot-circle-o'),
(34, 3, 'दर्ता/ सुचिकृत ', 'DartaSuchikrit', '', 2, 'DARTASUCHIKRIT', '', 8, 'fa f fa-dot-circle-o'),
(35, 0, 'संस्था सुचिकृत निबेदन', 'SansthaSuchikritNibedan/Add', '', 1, 'SANSTHASUCHIKRITNIBEDAN', '', 4, 'fa f fa-dot-circle-o'),
(38, 31, 'सुचिकृत निबेदन', 'Sanstha/SansthaNibedanDemo', '', 1, 'SANSTHA', '', 3, 'fa f fa-dot-circle-o'),
(40, 11, 'व्यवसाय दर्ता रिपोर्ट', 'Report/Business', '', 1, 'BUSINESSREPORT', '', 98, 'fa fa-book'),
(41, 11, 'व्यवसाय किसिम अनुसार', 'Report', '', 1, 'REPORT', '', 97, 'fa fa-book'),
(42, 11, 'संस्था दर्ता रिपोर्ट', 'Report/Sanstha', '', 1, 'SANSTHAREPORT', '', 99, 'fa fa-book');

-- --------------------------------------------------------

--
-- Table structure for table `affiliation`
--

CREATE TABLE IF NOT EXISTS `affiliation` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_en` varchar(255) NOT NULL,
  `n_date` varchar(255) NOT NULL,
  `meeting_no` int(11) DEFAULT 0,
  `desicion_no` int(11) DEFAULT 0,
  `bidi` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `darta_miti` varchar(255) NOT NULL,
  `maker` int(11) DEFAULT NULL,
  `checker` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_at` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `pradesh` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gapa_napa` varchar(255) DEFAULT NULL,
  `ward_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bms_nagadi_setting`
--

CREATE TABLE IF NOT EXISTS `bms_nagadi_setting` (
  `id` int(11) NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` int(11) NOT NULL,
  `state_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `gapa_napa` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `slogan` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `ward` int(11) NOT NULL,
  `calculation_setting` enum('1','2') NOT NULL COMMENT '''1=roapani 2 =khatta''',
  `module_setting` enum('1','2','3') NOT NULL,
  `d_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bms_system_register`
--

CREATE TABLE IF NOT EXISTS `bms_system_register` (
  `id` int(11) NOT NULL,
  `site_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_district` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_head` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_email` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `site_pardesh` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_letter_settings`
--

CREATE TABLE IF NOT EXISTS `business_letter_settings` (
  `id` int(11) NOT NULL,
  `setting_type` varchar(255) NOT NULL,
  `bsetting` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `business_letter_settings`
--

INSERT INTO `business_letter_settings` (`id`, `setting_type`, `bsetting`, `darta_no`) VALUES
(1, 'किसिम ', '', 1),
(2, 'दनजल', 'नखवज', 8),
(3, 'kisim', '', 2),
(4, 'ldkjlkad', 'sadjsadj', 11);

-- --------------------------------------------------------

--
-- Table structure for table `business_register`
--

CREATE TABLE IF NOT EXISTS `business_register` (
  `id` int(11) NOT NULL,
  `fiscal_year` varchar(25) NOT NULL,
  `register_date` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `certificate_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `owner_gender` varchar(25) NOT NULL,
  `owner_number` varchar(15) NOT NULL,
  `userfile` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `owner_road_name` varchar(255) NOT NULL,
  `owner_house_no` varchar(255) NOT NULL,
  `owner_per_napa` varchar(255) NOT NULL,
  `owner_per_ward` int(11) NOT NULL,
  `owner_per_tol` varchar(255) NOT NULL,
  `owner_present_na` varchar(255) NOT NULL,
  `owner_present_ward` int(11) NOT NULL,
  `owner_present_tol` varchar(255) NOT NULL,
  `firm_capital` varchar(255) NOT NULL,
  `firm_aim` varchar(255) NOT NULL,
  `firm_employee_no` int(11) NOT NULL,
  `firm_branch` varchar(255) NOT NULL,
  `firm_name_nepali` varchar(255) NOT NULL,
  `firm_name_en` varchar(255) NOT NULL,
  `firm_income_bill` varchar(255) NOT NULL,
  `firm_level` varchar(255) NOT NULL,
  `firm_address` varchar(255) NOT NULL,
  `firm_ward` int(11) NOT NULL,
  `firm_tol` varchar(255) NOT NULL,
  `firm_operator_name` varchar(255) NOT NULL,
  `firm_operator_address` varchar(255) NOT NULL,
  `firm_land_rent` varchar(255) NOT NULL,
  `firm_road_name` varchar(255) NOT NULL,
  `firm_house_number` varchar(255) NOT NULL,
  `trans_name` varchar(255) NOT NULL,
  `trans_address` varchar(255) NOT NULL,
  `trans_date` varchar(255) NOT NULL,
  `trans_verify` varchar(255) NOT NULL,
  `czn_no` varchar(255) NOT NULL,
  `czn_date` varchar(255) NOT NULL,
  `czn_dis` varchar(255) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_on` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `status` int(11) NOT NULL,
  `initial_flag` int(11) NOT NULL DEFAULT 0,
  `darta_suchikrit` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `category`) VALUES
(1, 'क '),
(2, 'ख '),
(3, 'ग '),
(4, 'घ ');

-- --------------------------------------------------------

--
-- Table structure for table `commitment`
--

CREATE TABLE IF NOT EXISTS `commitment` (
  `id` int(11) NOT NULL,
  `commits` text NOT NULL,
  `type` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `commitment`
--

INSERT INTO `commitment` (`id`, `commits`, `type`) VALUES
(1, 'यो प्रमाण-पत्र पसल वा कार्यलयमा देखिने गरि राख्नुपर्नेछ |', 1),
(2, 'यो प्रमाण-पत्र प्रत्येक वर्षको श्रावन देखि असोज मसान्तसम्ममा नवीकरण गरि सक्नु पर्नेछ |', 1),
(3, 'अन्य निकायको अनुमति लिनु  पर्ने भएमा अनुमति लिएर कारोबार गर्नु पर्नेछ | ', 1);

-- --------------------------------------------------------

--
-- Table structure for table `darta`
--

CREATE TABLE IF NOT EXISTS `darta` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `submission_no` varchar(255) NOT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `darta_miti` varchar(30) NOT NULL,
  `pp_no` varchar(255) NOT NULL,
  `business_name_np` varchar(255) NOT NULL,
  `business_name_en` varchar(255) NOT NULL,
  `b_pradesh` int(11) NOT NULL,
  `b_district` int(11) NOT NULL,
  `b_gapa` int(11) NOT NULL,
  `b_ward` int(11) NOT NULL,
  `b_tol` varchar(255) NOT NULL,
  `b_captial` double NOT NULL,
  `fixed_capital` double NOT NULL,
  `chalu_capital` double NOT NULL,
  `b_aim` varchar(255) NOT NULL,
  `b_type` varchar(255) NOT NULL,
  `b_subtype` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `b_capital_source` varchar(255) NOT NULL,
  `b_workdetails` text NOT NULL,
  `b_darta_office` varchar(255) NOT NULL,
  `b_odarta_miti` varchar(30) NOT NULL,
  `b_odarta_no` varchar(255) NOT NULL,
  `b_pan_no` varchar(255) NOT NULL,
  `b_owner_name` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `b_ctzn_no` varchar(255) NOT NULL,
  `b_ctzn_district` varchar(255) NOT NULL,
  `b_ctzn_date` varchar(255) NOT NULL,
  `p_pradesh` int(11) NOT NULL,
  `p_district` int(11) NOT NULL,
  `p_gapa` int(11) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `t_pradesh` int(11) NOT NULL,
  `t_district` int(11) NOT NULL,
  `t_gapa` int(11) NOT NULL,
  `t_ward` int(11) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_address` varchar(255) NOT NULL,
  `grandfather_name` varchar(255) NOT NULL,
  `grandfather_address` text NOT NULL,
  `landlord` text NOT NULL,
  `landlord_address` text NOT NULL,
  `rent` double NOT NULL,
  `b_anual_production` varchar(255) NOT NULL,
  `b_electricity` varchar(255) DEFAULT NULL,
  `no_of_workers` int(11) NOT NULL,
  `nibedan_dastur` double NOT NULL,
  `darta_dastur` double NOT NULL,
  `b_kar` double NOT NULL,
  `fine_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `rasid_date` varchar(255) NOT NULL,
  `rasid_no` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `maker` varchar(255) DEFAULT NULL,
  `checker` varchar(255) NOT NULL,
  `added_on` varchar(30) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_ward` int(11) DEFAULT NULL,
  `modified_on` varchar(30) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `is_trash` int(11) DEFAULT 0,
  `darta_suchikrit` varchar(255) NOT NULL,
  `nibedan_image` varchar(255) NOT NULL,
  `s_phone_number` varchar(255) DEFAULT NULL,
  `s_email` varchar(255) DEFAULT NULL,
  `b_phone_number` varchar(255) DEFAULT NULL,
  `b_email` varchar(255) DEFAULT NULL,
  `road_name` varchar(255) DEFAULT NULL,
  `party_size` varchar(255) NOT NULL,
  `darta_entry_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `darta`
--

INSERT INTO `darta` (`id`, `darta_no`, `submission_no`, `fiscal_year`, `darta_miti`, `pp_no`, `business_name_np`, `business_name_en`, `b_pradesh`, `b_district`, `b_gapa`, `b_ward`, `b_tol`, `b_captial`, `fixed_capital`, `chalu_capital`, `b_aim`, `b_type`, `b_subtype`, `category`, `b_capital_source`, `b_workdetails`, `b_darta_office`, `b_odarta_miti`, `b_odarta_no`, `b_pan_no`, `b_owner_name`, `phone_no`, `image`, `b_ctzn_no`, `b_ctzn_district`, `b_ctzn_date`, `p_pradesh`, `p_district`, `p_gapa`, `p_ward`, `t_pradesh`, `t_district`, `t_gapa`, `t_ward`, `father_name`, `father_address`, `grandfather_name`, `grandfather_address`, `landlord`, `landlord_address`, `rent`, `b_anual_production`, `b_electricity`, `no_of_workers`, `nibedan_dastur`, `darta_dastur`, `b_kar`, `fine_amount`, `total_amount`, `rasid_date`, `rasid_no`, `status`, `maker`, `checker`, `added_on`, `added_by`, `added_ward`, `modified_on`, `modified_by`, `is_trash`, `darta_suchikrit`, `nibedan_image`, `s_phone_number`, `s_email`, `b_phone_number`, `b_email`, `road_name`, `party_size`, `darta_entry_date`) VALUES
(1, 1175, '2081043111175', '2081/082', '2081-04-31', '1175', 'खड्का खाजा घर', 'Khadka khaja ghar', 3, 514, 2557, 7, '', 100000, 50000, 50000, 'स्थानीय व्यापार', '3', '44', '', '----', 'सामन्य खाजा घर', '-------------', '---------', '------------', '-------------', 'पुरूषाेत्तम खड्का', '', NULL, '-----------', 'धादिङ', '-------------', 3, 514, 2557, 7, 3, 514, 2557, 7, 'टेक बहादुर खड्का', 'गल्छी ७', 'तिलक खड्का', 'गल्छी ७', 'माया खतिवडा', 'गल्छी ७', 0, '----', '-----', 0, 0, 0, 0, 0, 0, '-----------', '------------', 1, '5', '5', '2024-08-16', 17, 6, '', 0, 0, '2', '', NULL, NULL, NULL, NULL, NULL, '-----------', '2081-04-32'),
(2, 1, '2081050411', '2081/082', '2081-05-04', '1', 'बिजनेस  म्यानेजमेन्ट सर्भिसेस प्रा.लि ', 'business management services pvt.ltd ', 3, 514, 2557, 2, 'baireni ', 3000, 1000, 2000, 'स्थानीय व्यापार', '3', '40', 'ख ', 'loan', 'कस्मेटिक सम्बंदी सम्पूर्ण सामान बिक्रि गर्ने ', '', '', '', '', 'रचना पण्डित ', '', NULL, '26-01-7500484', 'धादिङ', '2076-08-01', 3, 514, 2557, 3, 3, 514, 2557, 3, 'नबराज पण्डित ', 'धादिंग ', '', '', 'आफ्नै ', 'बैरेनी ', 15000, '200', '600', 0, 100, 200, 300, 50, 650, '2081-05-04', '1425', 1, '4', '1', '2024-08-20', 4, 0, '', 0, 0, '1', '', '983891104', '', '9840559229', '', 'baireni sadak', '100', '2081-05-04'),
(3, 2, '2081050412', '2081/082', '2081-05-04', '2', 'लालीगुराँस इन्फोटेक प्रा.लि ', 'laigurans infotech pvt.ltd', 3, 514, 2557, 3, 'सातकिला ', 3000, 2000, 1000, 'स्थानीय व्यापार', '2', '30', 'घ ', 'loan', 'sabbai medicine haru bechne ', '', '', '', '', 'रचना पण्डित ', '', NULL, '26-017400458', 'धादिङ', '2079-09-01', 3, 514, 2557, 3, 3, 514, 2557, 1, 'nabaraj pandit', 'nalang', '', '', 'aafnai ', 'baireni', 20000, '', '', 0, 100, 200, 200, 50, 550, '2081-05-04', '10', 1, '5', '1', '2024-08-20', 4, 0, '', 0, 0, '1', '', '01-5233429', 'laliguransinfotech@gmail.com', '9840559229', 'rachanapandit@gmail.com', '', '', '2081-05-04'),
(4, 1174, '2081042111174', '2081/082', '2081-04-21', '1174', 'कविता खाजा घर', 'kabita khaja ghar', 3, 514, 2557, 7, '----------', 200000, 100000, 100000, 'स्थानीय व्यापार', '3', '44', '', '------------', 'मदिरा सहितको खाजा घर', '', '', '', '', 'कविता कर्कि', '', NULL, '----', 'धादिङ', '----------', 3, 514, 2557, 1, 3, 514, 2557, 1, 'टंक बहादुर कार्की', 'गल्छी १', '--------------', '------------', 'राज कुमार थापा', 'गल्छी ७', 0, '---------------', '--------------', 0, 100, 0, 4000, 0, 0, '----------', '-----------', 1, '5', '5', '2024-08-29', 17, 6, '', 0, 0, '1', '', NULL, NULL, NULL, NULL, NULL, '', '2081-05-13');

-- --------------------------------------------------------

--
-- Table structure for table `darta_migration`
--

CREATE TABLE IF NOT EXISTS `darta_migration` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `submission_no` varchar(255) NOT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `darta_miti` varchar(30) NOT NULL,
  `pp_no` varchar(255) NOT NULL,
  `business_name_np` varchar(255) NOT NULL,
  `business_name_en` varchar(255) NOT NULL,
  `b_pradesh` int(11) NOT NULL,
  `b_district` int(11) NOT NULL,
  `b_gapa` int(11) NOT NULL,
  `b_ward` int(11) NOT NULL,
  `b_tol` varchar(255) NOT NULL,
  `b_captial` double NOT NULL,
  `fixed_capital` double NOT NULL,
  `chalu_capital` double NOT NULL,
  `b_aim` varchar(255) NOT NULL,
  `b_type` varchar(255) NOT NULL,
  `b_subtype` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `b_capital_source` varchar(255) NOT NULL,
  `b_workdetails` text NOT NULL,
  `b_darta_office` varchar(255) NOT NULL,
  `b_odarta_miti` varchar(30) NOT NULL,
  `b_odarta_no` varchar(255) NOT NULL,
  `b_pan_no` varchar(255) NOT NULL,
  `b_owner_name` varchar(255) NOT NULL,
  `phone_no` varchar(10) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `b_ctzn_no` varchar(255) NOT NULL,
  `b_ctzn_district` varchar(255) NOT NULL,
  `b_ctzn_date` varchar(255) NOT NULL,
  `p_pradesh` int(11) NOT NULL,
  `p_district` int(11) NOT NULL,
  `p_gapa` int(11) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `t_pradesh` int(11) NOT NULL,
  `t_district` int(11) NOT NULL,
  `t_gapa` int(11) NOT NULL,
  `t_ward` int(11) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `father_address` varchar(255) NOT NULL,
  `grandfather_name` varchar(255) NOT NULL,
  `grandfather_address` text NOT NULL,
  `landlord` text NOT NULL,
  `landlord_address` text NOT NULL,
  `rent` double NOT NULL,
  `b_anual_production` varchar(255) NOT NULL,
  `b_electricity` varchar(255) DEFAULT NULL,
  `no_of_workers` int(11) NOT NULL,
  `nibedan_dastur` double NOT NULL,
  `darta_dastur` double NOT NULL,
  `b_kar` double NOT NULL,
  `fine_amount` double NOT NULL,
  `total_amount` double NOT NULL,
  `rasid_date` varchar(255) NOT NULL,
  `rasid_no` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `maker` varchar(255) DEFAULT NULL,
  `checker` varchar(255) NOT NULL,
  `added_on` varchar(30) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_ward` int(11) DEFAULT NULL,
  `modified_on` varchar(30) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `is_trash` int(11) DEFAULT 0,
  `darta_suchikrit` varchar(255) NOT NULL,
  `nibedan_image` varchar(255) NOT NULL,
  `s_phone_number` varchar(255) DEFAULT NULL,
  `s_email` varchar(255) DEFAULT NULL,
  `b_phone_number` varchar(255) DEFAULT NULL,
  `b_email` varchar(255) DEFAULT NULL,
  `road_name` varchar(255) DEFAULT NULL,
  `party_size` varchar(255) NOT NULL,
  `prev_darta_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `darta_suchikrit`
--

CREATE TABLE IF NOT EXISTS `darta_suchikrit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `darta_suchikrit`
--

INSERT INTO `darta_suchikrit` (`id`, `name`) VALUES
(1, 'दर्ता'),
(2, 'सुचिकृत');

-- --------------------------------------------------------

--
-- Table structure for table `device_details`
--

CREATE TABLE IF NOT EXISTS `device_details` (
  `id` int(11) NOT NULL,
  `device_name` varchar(255) NOT NULL,
  `device_no` varchar(255) NOT NULL,
  `device_capacity` varchar(255) NOT NULL,
  `device_amount` varchar(255) NOT NULL,
  `device_date` varchar(255) NOT NULL,
  `other_detail` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id` int(11) NOT NULL,
  `reg_id` int(11) NOT NULL,
  `doc_type` varchar(255) NOT NULL,
  `doc_name` varchar(255) NOT NULL,
  `doc_slug` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `error_message` varchar(255) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`id`, `reg_id`, `doc_type`, `doc_name`, `doc_slug`, `status`, `error_message`, `message`) VALUES
(1, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(2, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(3, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(4, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(5, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(6, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(7, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(8, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(9, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error'),
(10, 0, '', '', '', 0, '<p>The upload destination folder does not appear to be writable.</p>', 'error');

-- --------------------------------------------------------

--
-- Table structure for table `firm_transaction`
--

CREATE TABLE IF NOT EXISTS `firm_transaction` (
  `id` int(11) NOT NULL,
  `trans_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trans_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `trans_date` varchar(25) NOT NULL,
  `trans_verify` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `firm_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year`
--

CREATE TABLE IF NOT EXISTS `fiscal_year` (
  `id` int(11) NOT NULL,
  `year` varchar(9) NOT NULL,
  `is_current` tinyint(1) DEFAULT NULL,
  `is_closed` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fiscal_year`
--

INSERT INTO `fiscal_year` (`id`, `year`, `is_current`, `is_closed`) VALUES
(1, '2074/075', 0, ''),
(2, '2075/076', 0, ''),
(3, '2076/077', 0, ''),
(4, '2077/078', 0, ''),
(5, '2078/079', 0, ''),
(6, '2079/080', 0, ''),
(7, '2080/081', 0, ''),
(8, '2081/082', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year_end_date`
--

CREATE TABLE IF NOT EXISTS `fiscal_year_end_date` (
  `id` int(11) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `fiscal_year_end_date`
--

INSERT INTO `fiscal_year_end_date` (`id`, `start_date`, `end_date`) VALUES
(1, '2077-04-01', '2078-03-01');

-- --------------------------------------------------------

--
-- Table structure for table `group`
--

CREATE TABLE IF NOT EXISTS `group` (
  `groupid` int(11) NOT NULL,
  `group_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `status` tinyint(4) DEFAULT 0,
  `created_by` int(11) DEFAULT NULL,
  `created_ip` varchar(255) DEFAULT NULL,
  `created_at` varchar(255) DEFAULT NULL,
  `updated_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `group`
--

INSERT INTO `group` (`groupid`, `group_name`, `status`, `created_by`, `created_ip`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 0, 0, '', '', ''),
(2, 'एडमिन प्रयोगकर्ता', 0, 1, '127.0.0.1', NULL, NULL),
(3, 'वडा प्रयोगकर्ता', 0, 1, '127.0.0.1', NULL, NULL),
(4, 'कृषि विकास शाखा', 0, 1, '182.50.67.158', NULL, NULL),
(5, 'सहकारी शाखा', 0, 1, '::1', NULL, NULL),
(6, 'उद्योग शाखा', 0, 4, '182.93.75.102', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ijajat_patra`
--

CREATE TABLE IF NOT EXISTS `ijajat_patra` (
  `id` int(11) NOT NULL,
  `fiscal_year` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_miti` varchar(50) NOT NULL,
  `p_pradesh` varchar(255) NOT NULL,
  `p_district` varchar(255) NOT NULL,
  `p_gapa` varchar(255) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `tol` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `firm_type` varchar(255) NOT NULL,
  `contact_person` varchar(255) NOT NULL,
  `contact_address` text NOT NULL,
  `c_number` varchar(255) NOT NULL,
  `c_email` varchar(255) NOT NULL,
  `org_darta_no` varchar(255) NOT NULL,
  `org_darta_miti` varchar(25) NOT NULL,
  `a_capital` varchar(255) NOT NULL,
  `c_capital` varchar(255) NOT NULL,
  `warga` varchar(255) NOT NULL,
  `samuha` varchar(255) NOT NULL,
  `s_amount` varchar(255) NOT NULL,
  `s_bank` varchar(255) NOT NULL,
  `m_amount` varchar(255) NOT NULL,
  `m_bank` varchar(255) NOT NULL,
  `c_amount` varchar(255) NOT NULL,
  `c_bank` varchar(255) NOT NULL,
  `b_amount` varchar(255) NOT NULL,
  `b_bank` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `renew_status` int(11) NOT NULL DEFAULT 0,
  `maker` int(11) NOT NULL,
  `checker` int(11) DEFAULT NULL,
  `yain` varchar(255) DEFAULT NULL,
  `b_detail` text DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jala_sorot`
--

CREATE TABLE IF NOT EXISTS `jala_sorot` (
  `id` int(11) NOT NULL,
  `jalsorot_name` varchar(255) NOT NULL,
  `jalsorot_address` varchar(255) NOT NULL,
  `jalsorot_usages` varchar(255) NOT NULL,
  `jalsorot_amount` varchar(255) NOT NULL,
  `jalsorot_current_usages` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karya_bidi`
--

CREATE TABLE IF NOT EXISTS `karya_bidi` (
  `id` int(11) NOT NULL,
  `detail` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `keys`
--

CREATE TABLE IF NOT EXISTS `keys` (
  `id` int(11) NOT NULL,
  `key` varchar(40) NOT NULL,
  `level` int(11) NOT NULL,
  `ignore_limits` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `keys`
--

INSERT INTO `keys` (`id`, `key`, `level`, `ignore_limits`, `date_created`) VALUES
(1, '8okkoo04kksckoows0cgggccww88ww4wcgggk04o', 1, 1, 1482821480),
(2, 'wc0488cs0ko044go8wgw4kkgsw8gkgk8sck44sc8', 1, 1, 1482821569);

-- --------------------------------------------------------

--
-- Table structure for table `khanepani`
--

CREATE TABLE IF NOT EXISTS `khanepani` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_miti` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `working_area` varchar(255) NOT NULL,
  `p_pardesh` varchar(255) NOT NULL,
  `p_district` varchar(255) NOT NULL,
  `p_gapa` varchar(255) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `tol` varchar(255) NOT NULL,
  `sorot` varchar(255) NOT NULL,
  `aim` varchar(255) NOT NULL,
  `maker` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(25) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` varchar(25) NOT NULL,
  `fiscal_year` varchar(255) NOT NULL,
  `ain` text NOT NULL,
  `renew_status` int(11) NOT NULL DEFAULT 0,
  `ad_name` varchar(255) DEFAULT NULL,
  `ad_pad` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khanepani_darta_members`
--

CREATE TABLE IF NOT EXISTS `khanepani_darta_members` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `occupation` varchar(255) NOT NULL,
  `czn_no` varchar(255) NOT NULL,
  `contact_no` varchar(25) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khane_pani_sewa`
--

CREATE TABLE IF NOT EXISTS `khane_pani_sewa` (
  `id` int(11) NOT NULL,
  `sewa` varchar(255) NOT NULL,
  `sewa_area` varchar(255) NOT NULL,
  `total_user` varchar(255) NOT NULL,
  `has_enanchment` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krishi_samuha_darta`
--

CREATE TABLE IF NOT EXISTS `krishi_samuha_darta` (
  `id` int(11) NOT NULL,
  `bidi` text NOT NULL,
  `samuha_name` varchar(255) NOT NULL,
  `samuha_type` varchar(255) NOT NULL,
  `p_pardesh` varchar(255) NOT NULL,
  `p_district` varchar(255) NOT NULL,
  `p_gapa` varchar(255) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `tol` varchar(255) NOT NULL,
  `total_male_member` int(11) NOT NULL,
  `total_female_member` int(11) NOT NULL,
  `total_member` int(11) NOT NULL,
  `gathan_miti` varchar(255) NOT NULL,
  `baithak_day` varchar(255) NOT NULL,
  `rakam` int(11) NOT NULL,
  `total_rakam` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `fiscal_year` varchar(255) NOT NULL,
  `darta_date` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `maker` varchar(255) NOT NULL,
  `checker` varchar(255) NOT NULL,
  `created_at` varchar(25) NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` varchar(25) DEFAULT NULL,
  `renew_status` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `krishi_samuha_members`
--

CREATE TABLE IF NOT EXISTS `krishi_samuha_members` (
  `id` int(11) NOT NULL,
  `samuha_id` int(11) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `deg` varchar(255) NOT NULL,
  `qualification` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `jagga` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `land_owner_profile_basic`
--

CREATE TABLE IF NOT EXISTS `land_owner_profile_basic` (
  `id` int(11) NOT NULL,
  `fiscal_year` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `land_own_type` varchar(255) DEFAULT NULL,
  `land_owner_name_np` varchar(255) DEFAULT NULL,
  `land_owner_name_en` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `land_owner_father_name` varchar(255) DEFAULT NULL,
  `land_owner_grandpa_name` varchar(255) DEFAULT NULL,
  `land_owner_occupation` varchar(255) DEFAULT NULL,
  `land_owner_gender` varchar(10) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `land_owner_email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `land_owner_contact_no` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `file_no` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `remarks` text DEFAULT NULL,
  `lo_state` int(11) DEFAULT NULL,
  `lo_district` varchar(255) DEFAULT NULL,
  `lo_gapa_napa` varchar(255) DEFAULT NULL,
  `lo_ward` int(11) DEFAULT NULL,
  `lo_land_lac_ward` varchar(255) DEFAULT NULL,
  `lo_temp_address` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lo_house_no` varchar(255) DEFAULT NULL,
  `lo_tol` text DEFAULT NULL,
  `lo_temp_state` int(11) DEFAULT NULL,
  `lo_temp_dis` varchar(255) DEFAULT NULL,
  `lo_temp_gapanapa` varchar(255) DEFAULT NULL,
  `lo_czn_no` varchar(255) DEFAULT NULL,
  `lo_pan_no` varchar(255) DEFAULT NULL,
  `lo_temp_ward` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lo_temp_tol` varchar(255) DEFAULT NULL,
  `lo_temp_house_no` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `lo_fi_state` varchar(255) DEFAULT NULL,
  `lo_fi_district` varchar(255) DEFAULT NULL,
  `lo_fi_gapa_napa` varchar(255) DEFAULT NULL,
  `lo_fi_ward` varchar(255) DEFAULT NULL,
  `lo_fi_relation` varchar(255) DEFAULT NULL,
  `lo_fi_name` varchar(255) DEFAULT NULL,
  `lo_fi_date` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_by` int(11) DEFAULT NULL,
  `added_on` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `added_ward` int(11) DEFAULT NULL,
  `modified_on` varchar(25) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `initial_flag` int(11) DEFAULT 0,
  `current_flag` int(11) DEFAULT 0,
  `suchak_state` varchar(255) DEFAULT NULL,
  `suchak_district` varchar(255) DEFAULT NULL,
  `suchak_gapanapa` varchar(255) DEFAULT NULL,
  `suchak_ward` varchar(255) DEFAULT NULL,
  `suchak_name` varchar(255) DEFAULT NULL,
  `suchak_relation` varchar(255) DEFAULT NULL,
  `form_type` enum('1','2') CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL COMMENT '''1=business profile,2=personal_profile'''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `main_topic`
--

CREATE TABLE IF NOT EXISTS `main_topic` (
  `id` int(11) NOT NULL,
  `topic_no` varchar(255) DEFAULT NULL,
  `topic_name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `fiscal_year` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `main_topic`
--

INSERT INTO `main_topic` (`id`, `topic_no`, `topic_name`, `fiscal_year`) VALUES
(1, NULL, 'व्यापारिक वस्तु', ''),
(2, NULL, 'विषेशज्ञ सेवा', ''),
(3, NULL, 'सेवा ब्यवसाय', ''),
(4, NULL, 'स्वास्थ्य सेवा', ''),
(5, NULL, 'शिक्षा सेवा', ''),
(7, NULL, 'सेवा ब्याबसाय ', '');

-- --------------------------------------------------------

--
-- Table structure for table `mel_milap`
--

CREATE TABLE IF NOT EXISTS `mel_milap` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `n_date` varchar(255) NOT NULL,
  `meeting_no` int(11) NOT NULL DEFAULT 0,
  `desicion_no` int(11) NOT NULL DEFAULT 0,
  `bidi` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `darta_miti` varchar(255) NOT NULL,
  `maker` int(11) DEFAULT NULL,
  `checker` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_at` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `pradesh` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gapa_napa` varchar(255) DEFAULT NULL,
  `ward_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_per_group`
--

CREATE TABLE IF NOT EXISTS `permissions_per_group` (
  `permission_per_group_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_action_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=1389 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `permissions_per_group`
--

INSERT INTO `permissions_per_group` (`permission_per_group_id`, `module_id`, `user_action_id`, `group_id`, `added_by`, `added_date`, `modified_by`, `modified_date`) VALUES
(429, 1, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(430, 1, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(431, 1, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(432, 1, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(433, 2, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(434, 2, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(435, 2, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(436, 2, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(437, 4, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(438, 4, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(439, 4, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(440, 4, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(441, 6, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(442, 6, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(443, 6, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(444, 6, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(445, 7, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(446, 7, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(447, 7, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(448, 7, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(449, 11, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(450, 11, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(451, 11, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(452, 11, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(453, 19, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(454, 19, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(455, 19, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(456, 19, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(457, 20, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(458, 20, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(459, 20, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(460, 20, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(461, 22, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(462, 22, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(463, 22, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(464, 22, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(465, 23, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(466, 23, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(467, 23, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(468, 23, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(469, 31, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(470, 31, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(471, 31, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(472, 31, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(473, 32, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(474, 32, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(475, 32, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(476, 32, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(477, 33, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(478, 33, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(479, 33, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(480, 33, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(481, 35, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(482, 35, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(483, 35, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(484, 35, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(485, 38, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(486, 38, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(487, 38, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(488, 38, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(489, 40, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(490, 40, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(491, 40, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(492, 40, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(493, 41, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(494, 41, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(495, 41, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(496, 41, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(497, 42, 1, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(498, 42, 2, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(499, 42, 3, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(500, 42, 4, 6, 4, '2024-08-06 16:13:16', 4, '2024-08-06 16:13:16'),
(513, 1, 1, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(514, 1, 2, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(515, 1, 3, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(516, 1, 4, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(517, 18, 1, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(518, 18, 2, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(519, 18, 3, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(520, 18, 4, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(521, 19, 1, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(522, 19, 2, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(523, 19, 3, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(524, 19, 4, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(525, 20, 1, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(526, 20, 2, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(527, 20, 3, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(528, 20, 4, 5, 4, '2024-08-06 16:21:14', 4, '2024-08-06 16:21:14'),
(529, 1, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(530, 1, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(531, 1, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(532, 1, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(533, 2, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(534, 2, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(535, 2, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(536, 2, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(537, 6, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(538, 6, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(539, 6, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(540, 6, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(541, 7, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(542, 7, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(543, 7, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(544, 7, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(545, 11, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(546, 11, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(547, 11, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(548, 11, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(549, 12, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(550, 12, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(551, 12, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(552, 12, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(553, 14, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(554, 14, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(555, 14, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(556, 14, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(557, 15, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(558, 15, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(559, 15, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(560, 15, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(561, 16, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(562, 16, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(563, 16, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(564, 16, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(565, 18, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(566, 18, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(567, 18, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(568, 18, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(569, 19, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(570, 19, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(571, 19, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(572, 19, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(573, 20, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(574, 20, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(575, 20, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(576, 20, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(577, 21, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(578, 21, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(579, 21, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(580, 21, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(581, 22, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(582, 22, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(583, 22, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(584, 22, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(585, 23, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(586, 23, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(587, 23, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(588, 23, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(589, 24, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(590, 24, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(591, 24, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(592, 24, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(593, 25, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(594, 25, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(595, 25, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(596, 25, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(597, 26, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(598, 26, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(599, 26, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(600, 26, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(601, 27, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(602, 27, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(603, 27, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(604, 27, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(605, 28, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(606, 28, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(607, 28, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(608, 28, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(609, 31, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(610, 31, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(611, 31, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(612, 31, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(613, 32, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(614, 32, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(615, 32, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(616, 32, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(617, 33, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(618, 33, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(619, 33, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(620, 33, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(621, 34, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(622, 34, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(623, 34, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(624, 34, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(625, 35, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(626, 35, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(627, 35, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(628, 35, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(629, 38, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(630, 38, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(631, 38, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(632, 38, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(633, 40, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(634, 40, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(635, 40, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(636, 40, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(637, 41, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(638, 41, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(639, 41, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(640, 41, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(641, 42, 1, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(642, 42, 2, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(643, 42, 3, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(644, 42, 4, 3, 4, '2024-08-06 16:30:21', 4, '2024-08-06 16:30:21'),
(1317, 1, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1318, 1, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1319, 1, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1320, 1, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1321, 2, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1322, 2, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1323, 2, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1324, 2, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1325, 4, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1326, 4, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1327, 4, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1328, 4, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1329, 5, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1330, 5, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1331, 5, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1332, 5, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1333, 6, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1334, 6, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1335, 6, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1336, 6, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1337, 7, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1338, 7, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1339, 7, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1340, 7, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1341, 8, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1342, 8, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1343, 8, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1344, 8, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1345, 11, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1346, 11, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1347, 11, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1348, 11, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1349, 12, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1350, 12, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1351, 12, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1352, 12, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1353, 13, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1354, 13, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1355, 13, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1356, 13, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1357, 14, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1358, 14, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1359, 14, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1360, 14, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1361, 15, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1362, 15, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1363, 15, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1364, 15, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1365, 16, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1366, 16, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1367, 16, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1368, 16, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1369, 17, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1370, 17, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1371, 17, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1372, 17, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1373, 25, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1374, 25, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1375, 25, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1376, 25, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1377, 40, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1378, 40, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1379, 40, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1380, 40, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1381, 41, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1382, 41, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1383, 41, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1384, 41, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1385, 42, 1, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1386, 42, 2, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1387, 42, 3, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34'),
(1388, 42, 4, 4, 4, '2024-08-11 14:24:34', 4, '2024-08-11 14:24:34');

-- --------------------------------------------------------

--
-- Table structure for table `permissions_per_user`
--

CREATE TABLE IF NOT EXISTS `permissions_per_user` (
  `permission_per_user_id` int(11) NOT NULL,
  `module_id` int(11) NOT NULL,
  `user_action_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_date` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_date` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `permissions_per_user`
--

INSERT INTO `permissions_per_user` (`permission_per_user_id`, `module_id`, `user_action_id`, `user_id`, `added_by`, `added_date`, `modified_by`, `modified_date`) VALUES
(1, 1, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(2, 2, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(3, 6, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(4, 7, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(5, 11, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(6, 14, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(7, 15, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(8, 16, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(9, 18, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(10, 19, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(11, 20, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(12, 26, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(13, 25, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(14, 24, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(15, 23, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(16, 22, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(17, 21, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(18, 27, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(19, 28, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(20, 29, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(21, 31, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(22, 32, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(23, 33, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(24, 35, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(25, 38, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(26, 40, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(27, 41, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(28, 42, 5, 5, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(29, 1, 4, 4, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(30, 2, 4, 4, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31'),
(31, 6, 4, 4, 4, '2024-04-29 01:26:31', 0, '2024-04-29 01:26:31');

-- --------------------------------------------------------

--
-- Table structure for table `permission_letter`
--

CREATE TABLE IF NOT EXISTS `permission_letter` (
  `id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `n_date` varchar(255) NOT NULL,
  `sawari_no` varchar(255) NOT NULL,
  `desicion_no` int(11) NOT NULL DEFAULT 0,
  `bidi` varchar(255) DEFAULT NULL,
  `fiscal_year` varchar(50) NOT NULL,
  `darta_miti` varchar(255) NOT NULL,
  `maker` int(11) DEFAULT NULL,
  `checker` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_at` varchar(50) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `pradesh` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `gapa_napa` varchar(255) DEFAULT NULL,
  `ward_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE IF NOT EXISTS `position` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prakar`
--

CREATE TABLE IF NOT EXISTS `prakar` (
  `id` int(11) NOT NULL,
  `topic_no` int(11) DEFAULT NULL,
  `fiscal_year` varchar(15) DEFAULT NULL,
  `main_topic` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `sub_topic` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `darta_dastur` double NOT NULL,
  `renew_dastur` double NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `added_by` int(11) DEFAULT NULL,
  `added_on` varchar(25) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_on` varchar(25) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `prakar`
--

INSERT INTO `prakar` (`id`, `topic_no`, `fiscal_year`, `main_topic`, `sub_topic`, `darta_dastur`, `renew_dastur`, `status`, `added_by`, `added_on`, `modified_by`, `modified_on`) VALUES
(1, NULL, '2079/080', '1', 'डिपार्टमेन्टल स्टोर्स', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(2, NULL, '2079/080', '1', 'ज्वेलरी, सुन, चाँदी पसल	', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(6, NULL, '2079/080', '1', 'इलेक्ट्रिक्स, इलेक्ट्रोनिक्स र विद्युतीय सामग्री/उपकरण पसल', 1500, 1000, 1, 2, '2079-12-06', 0, ''),
(7, NULL, '2079/080', '1', 'इट्टा, ढुङ्गा, गिट्टी, वालुवा, सिमेन्ट, छड, पेन्ट, स्यानिटरी, प्लम्बिङका सामान लगायतका निर्माण सामग्री बिक्रि केन्द्र/डिपो आदि', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(8, NULL, '2079/080', '1', 'पेट्रोलियम पदार्थ/पेट्रोल पम्प', 5000, 2000, 1, 2, '2079-12-06', 0, ''),
(9, NULL, '2079/080', '1', 'सवारी साधन, लुब्रीकेन्टस र पार्ट्स बिक्रि केन्द्र आदि', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(10, NULL, '2079/080', '1', 'फर्निचर, फर्निसिङ्ग, मेसिनरी तथा मेसिनरी पार्टस् बिक्रि पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(11, NULL, '2079/080', '1', 'सवै किसिमका औषधि पसल', 1500, 1000, 1, 2, '2079-12-06', 0, ''),
(12, NULL, '2079/080', '1', 'दैनिक उपभोग्य खाद्य पदार्थ बिक्रि पसल', 1500, 1000, 1, 2, '2079-12-06', 0, ''),
(13, NULL, '2079/080', '1', 'कपडा, कस्टमेटिक, भाँडा, जुत्ता पसल आदि', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(14, NULL, '2079/080', '1', 'उनी धागो पसल	', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(15, NULL, '2079/080', '1', '	स्टेशसनरी तथा पुस्तक पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(16, NULL, '2079/080', '1', '	क्युरियो/सौभिनियर पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(17, NULL, '2079/080', '1', 'फलफूल, सागसब्जी, माछा मासु बिक्रि पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(18, NULL, '2079/080', '1', 'मदिरा विक्रि पसल', 3000, 2000, 1, 2, '2079-12-06', 0, ''),
(19, NULL, '2079/080', '1', 'मोटरसाइकल विक्रि पसल', 5000, 3000, 1, 2, '2079-12-06', 0, ''),
(20, NULL, '2079/080', '1', 'साइकल विक्रि पसल', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(21, NULL, '2079/080', '1', 'चार पाङ्ग्रे सवारी साधन विक्रि पसल	', 10000, 5000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(22, NULL, '2079/080', '1', 'पशु औषधि विक्रि पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(23, NULL, '2079/080', '1', 'विज भण्डार तथा विक्रेता पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(24, NULL, '2079/080', '1', 'मोवाइल टावर राखेको', 10000, 5000, 1, 2, '2079-12-06', 0, ''),
(25, NULL, '2079/080', '1', 'रसायनिक मल तथा किटनाशक औषधि विक्रि पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(26, NULL, '2079/080', '1', 'चस्मा पसल', 5000, 3000, 1, 2, '2079-12-06', 0, ''),
(27, NULL, '2079/080', '1', 'सिरक तथा डसना तयारी एवं विक्रि पसल', 2000, 1500, 1, 2, '2079-12-06', 0, ''),
(28, NULL, '2079/080', '1', 'जडिवुटी तथा आयुर्वेद औषधि पसल', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(29, NULL, '2079/080', '1', 'अन्य ब्यापारिक वस्तु', 2000, 1000, 1, 2, '2079-12-06', 0, ''),
(30, NULL, '2079/080', '2', 'चिकित्सकीय सेव', 5000, 2000, 1, 2, '2079-12-06', 0, ''),
(31, NULL, '2079/080', '2', 'इन्जिनियरीङ सेवा', 5000, 2000, 1, 2, '2079-12-06', 0, ''),
(32, NULL, '2079/080', '2', 'सेयर अभिकर्ता, कानून ब्यवसाय, लेखापढी, विज्ञापन, लेखापरीक्षक, मेनपावर सप्लायर्स, पेन्टर, सर्भेयर, क्राफ्टिङ्ग, कार्भिङ्ग आदि', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(33, NULL, '2079/080', '2', 'ज्योतिष परामर्श सेवा', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(34, NULL, '2079/080', '2', 'लेखापरीक्षण सेवा', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(35, NULL, '2079/080', '2', 'दन्त सेवा', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(36, NULL, '2079/080', '2', 'अनुसन्धान, सर्भेयर, अनुवादक आदि', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(37, NULL, '2079/080', '3', 'निर्माण ब्यवसाय	', 8000, 5000, 1, 2, '2079-12-06', 0, ''),
(38, NULL, '2079/080', '3', 'ढुवानी सेवा	', 3000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(39, NULL, '2079/080', '3', 'यातायात सेवा	', 3000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(40, NULL, '2079/080', '3', 'ब्युटि पार्लर, मसाज, शैलुन, पेन्टिङ्ग आदि	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(41, NULL, '2079/080', '3', 'पार्टि प्यालेस, टेन्ट हाउस, क्याटरिङ्ग आदि	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(42, NULL, '2079/080', '3', 'केवल, इन्टरनेट, एफ एम, रेडियो, कम्युनिकेशन, आदि	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(43, NULL, '2079/080', '3', 'फोटो स्टुडियो	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(44, NULL, '2079/080', '3', 'रेस्टुरा, खाजा घर, मिठाई पसल,	', 2000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(45, NULL, '2079/080', '3', 'दुध दही पसल आदि	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(46, NULL, '2079/080', '3', 'सर्टिङ्ग/सुटिङ्ग टेलरिङ्ग	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(47, NULL, '2079/080', '3', 'सिलाई कटाई सेवा	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(48, NULL, '2079/080', '3', 'सवारी साधन÷विद्युतिय उपकरण/मेशिनरी औजार मर्मत केन्द्र	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(49, NULL, '2079/080', '3', 'रियल स्टेट/आवासिय घर निर्माण तथा विक्रि	', 5000, 3000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(50, NULL, '2079/080', '3', 'पुल हाउस, जिम, साउना आदि	', 3000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(51, NULL, '2079/080', '3', 'ट्राभल, टुरीजम, टिकट घर	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(52, NULL, '2079/080', '3', 'होम स्टे सेवा	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(53, NULL, '2079/080', '3', 'आर्ट, कला कृति लेखन तथा प्रकासन	', 3000, 2000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(54, NULL, '2079/080', '3', 'कवाडी संकलन तथा प्रशोधन पसल	', 2000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(55, NULL, '2079/080', '3', 'नृत्य कला केन्द्र	', 2000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(56, NULL, '2079/080', '3', 'प्राकृतिक चिकित्सा सेवा	', 2000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(57, NULL, '2079/080', '3', 'अन्य सेवा	', 2000, 1500, 1, 2, '2079-12-06', 2, '2079-12-06'),
(58, NULL, '2079/080', '3', 'आमा समुह दर्ता	', 1000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(59, NULL, '2079/080', '3', 'बाल तथा युवा कल्व दर्ता	', 1000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(60, NULL, '2079/080', '3', 'कृषक समुह दर्ता	', 1000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(61, NULL, '2079/080', '3', 'सामुदायिक समुह, गुठि ,टोल सुधार तथा उपभोक्ता समिति दर्ता	', 1000, 1000, 1, 2, '2079-12-06', 2, '2079-12-06'),
(62, NULL, '2079/080', '4', 'निजी क्षेत्रवाट संचालित नर्सिङ्ग होम तथा अस्पताल र सामुदायिक अस्पताल	', 5000, 3000, 1, 2, '2079-12-06', 0, ''),
(63, NULL, '2079/080', '4', 'क्लिनिक तथा ल्याव, फिजियोथेरापी', 4000, 2000, 1, 2, '2079-12-06', 0, ''),
(64, NULL, '2079/080', '4', 'अन्य स्वास्थ्य सेवा', 3000, 1500, 1, 2, '2079-12-06', 0, ''),
(67, NULL, '2079/080', '3', 'राईस मिल', 3000, 1000, 1, 2, '2080-01-19', 0, ''),
(68, NULL, '2079/080', '', 'कुखुरा तथा माछा पालन', 3000, 1000, 1, 2, '2080-01-19', 0, ''),
(69, NULL, '2079/080', '1', 'कुखुरा एवं माछा फर्म', 3000, 1000, 1, 2, '2080-01-26', 0, ''),
(70, NULL, '2079/080', '1', 'कृषि तथा नर्सरी', 3000, 1000, 1, 2, '2080-01-26', 0, ''),
(71, NULL, '2079/080', '3', 'मासु पसल', 3000, 1000, 1, 2, '2080-01-27', 0, ''),
(72, NULL, '2079/080', '1', ' पशु तथा कृषि फर्म', 3000, 1000, 1, 2, '2080-01-27', 0, ''),
(73, NULL, '2079/080', '1', 'कृषि तथा पशु फर्म', 3000, 1000, 1, 2, '2080-02-01', 0, ''),
(74, NULL, '2079/080', '3', 'बेकरी उद्योग', 3000, 1000, 1, 2, '2080-02-01', 0, ''),
(75, NULL, '2079/080', '3', 'चटपट तथा पानीपुरी पसल', 1500, 1000, 1, 2, '2080-03-18', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `previouis_work_details`
--

CREATE TABLE IF NOT EXISTS `previouis_work_details` (
  `id` int(11) NOT NULL,
  `pre_work` varchar(255) NOT NULL,
  `per_work_year` varchar(255) NOT NULL,
  `work_amount` varchar(255) NOT NULL,
  `work_office` varchar(255) NOT NULL,
  `work_status` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `trans_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE IF NOT EXISTS `provinces` (
  `ID` int(11) NOT NULL,
  `Code` varchar(10) NOT NULL,
  `Title` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `Status` enum('Active','Inactive','Deleted') NOT NULL DEFAULT 'Active'
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`ID`, `Code`, `Title`, `Status`) VALUES
(1, 'P1', 'कोशी प्रदेश', 'Active'),
(2, 'P2', 'मधेश प्रदेश', 'Active'),
(3, 'P3', 'बागमती प्रदेश', 'Active'),
(4, 'P4', 'गण्डकी प्रदेश', 'Active'),
(5, 'P5', 'लुम्बिनी प्रदेश', 'Active'),
(6, 'P6', 'कर्णाली प्रदेश', 'Active'),
(7, 'P7', 'सुदूरपश्चिम प्रदेश', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `rasayenik_maal`
--

CREATE TABLE IF NOT EXISTS `rasayenik_maal` (
  `id` int(11) NOT NULL,
  `fiscal_year` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_miti` varchar(255) NOT NULL,
  `bidi` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `pradesh` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `gapa_napa` varchar(255) NOT NULL,
  `ward_no` int(11) NOT NULL,
  `tol` varchar(255) NOT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `is_personal` int(11) DEFAULT 0,
  `maker` int(11) DEFAULT NULL,
  `checker` int(11) DEFAULT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `renew`
--

CREATE TABLE IF NOT EXISTS `renew` (
  `id` int(11) NOT NULL,
  `b_type` varchar(255) NOT NULL,
  `b_subtype` varchar(255) DEFAULT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `rasid_no` varchar(255) NOT NULL,
  `dastur` double NOT NULL,
  `fiscal_year_from` varchar(255) NOT NULL,
  `fiscal_year_to` varchar(255) NOT NULL,
  `renew_type` int(11) NOT NULL DEFAULT 0,
  `remarks` text NOT NULL,
  `fiscal_year` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `created_by` int(11) NOT NULL,
  `added_ward` int(11) DEFAULT NULL,
  `created_ward` int(11) NOT NULL,
  `modified_at` varchar(255) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sahakari_darta`
--

CREATE TABLE IF NOT EXISTS `sahakari_darta` (
  `id` int(11) NOT NULL,
  `fiscal_year` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `p_pradesh` varchar(255) NOT NULL,
  `p_district` varchar(255) NOT NULL,
  `p_gapa` varchar(255) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `tol` varchar(255) NOT NULL,
  `t_male` int(11) NOT NULL,
  `t_female` int(11) NOT NULL,
  `total_member` int(11) NOT NULL,
  `working_area` varchar(255) NOT NULL,
  `responsibility` varchar(255) NOT NULL,
  `total_share_amount` double NOT NULL,
  `entry_share_amount` double NOT NULL,
  `aim` text NOT NULL,
  `main_work` text NOT NULL,
  `sakari_datra_ain` varchar(255) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `darta_miti` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `renew_status` int(11) NOT NULL DEFAULT 0,
  `maker` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` varchar(50) NOT NULL,
  `modified_by` int(11) NOT NULL,
  `modified_at` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha`
--

CREATE TABLE IF NOT EXISTS `sanstha` (
  `id` int(11) NOT NULL,
  `karyawidi` varchar(255) DEFAULT NULL,
  `sanstha_name` varchar(255) DEFAULT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `sanstha_type` varchar(255) DEFAULT NULL,
  `adhaxya_name` varchar(255) NOT NULL,
  `p_pardesh` varchar(255) DEFAULT NULL,
  `p_district` varchar(255) DEFAULT NULL,
  `p_gapa` varchar(255) DEFAULT NULL,
  `p_ward` varchar(255) DEFAULT NULL,
  `tol` varchar(255) DEFAULT NULL,
  `male_member` varchar(255) DEFAULT NULL,
  `female_member` varchar(255) DEFAULT NULL,
  `total_member` varchar(255) DEFAULT NULL,
  `gathan_miti` varchar(255) DEFAULT NULL,
  `baithak_day` varchar(255) DEFAULT NULL,
  `rakam` varchar(255) DEFAULT NULL,
  `total_rakam` varchar(255) DEFAULT NULL,
  `darta_no` int(11) DEFAULT NULL,
  `nibedan_miti` varchar(255) NOT NULL,
  `darta_date` date NOT NULL,
  `status` tinyint(1) NOT NULL,
  `renew_status` int(11) NOT NULL,
  `darta_miti` varchar(255) NOT NULL,
  `fiscal_year` varchar(255) DEFAULT NULL,
  `added_on` varchar(255) NOT NULL,
  `added_by` varchar(255) NOT NULL,
  `darta_suchikrit` varchar(255) NOT NULL,
  `nirnaya_date` varchar(255) NOT NULL,
  `certificate_no` varchar(255) NOT NULL,
  `b_darta_office` varchar(255) NOT NULL,
  `b_odarta_miti` varchar(255) NOT NULL,
  `b_odarta_no` varchar(255) NOT NULL,
  `b_pan_no` varchar(255) NOT NULL,
  `phone_no` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `maker` varchar(255) NOT NULL,
  `checker` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha_members`
--

CREATE TABLE IF NOT EXISTS `sanstha_members` (
  `id` int(11) NOT NULL,
  `sanstha_id` int(11) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `deg` varchar(255) DEFAULT NULL,
  `qualification` varchar(255) DEFAULT NULL,
  `age` varchar(255) DEFAULT NULL,
  `contact_no` varchar(255) DEFAULT NULL,
  `darta_no` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha_suchikrit_nibedan`
--

CREATE TABLE IF NOT EXISTS `sanstha_suchikrit_nibedan` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `nibedan_content` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sarkar_yain`
--

CREATE TABLE IF NOT EXISTS `sarkar_yain` (
  `id` int(11) NOT NULL,
  `rules` varchar(255) NOT NULL,
  `fiscal_year` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scan_photo`
--

CREATE TABLE IF NOT EXISTS `scan_photo` (
  `id` int(11) NOT NULL,
  `image_name` varchar(255) NOT NULL,
  `image_type` varchar(255) NOT NULL,
  `image_data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_district`
--

CREATE TABLE IF NOT EXISTS `settings_district` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `state` int(11) NOT NULL,
  `state_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=558 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings_district`
--

INSERT INTO `settings_district` (`id`, `name`, `state`, `state_name`) VALUES
(481, 'ताप्लेजुङ', 1, '१ नं. प्रदेश'),
(482, 'पाँचथर', 1, '१ नं. प्रदेश'),
(483, 'ईलाम', 1, '१ नं. प्रदेश'),
(484, 'झापा', 1, '१ नं. प्रदेश'),
(485, 'मोरङ', 1, '१ नं. प्रदेश'),
(486, 'सुनसरी', 1, '१ नं. प्रदेश'),
(487, 'धनकुटा', 1, '१ नं. प्रदेश'),
(488, 'तेहथुम', 1, '१ नं. प्रदेश'),
(489, 'संखुवासभा', 1, '१ नं. प्रदेश'),
(490, 'भोजपुर', 1, '१ नं. प्रदेश'),
(491, 'सोलुखुम्बु', 1, '१ नं. प्रदेश'),
(492, 'ओखलढुंगा', 1, '१ नं. प्रदेश'),
(493, 'खोटाङ', 1, '१ नं. प्रदेश'),
(494, 'उदयपुर', 1, '१ नं. प्रदेश'),
(495, 'सप्तरी', 2, '२ नं. प्रदेश'),
(497, 'सिराहा', 2, '२ नं. प्रदेश'),
(498, 'धनुषा', 2, '२ नं. प्रदेश'),
(499, 'महोत्तरी', 2, '२ नं. प्रदेश'),
(500, 'सर्लाही', 2, '२ नं. प्रदेश'),
(501, 'रौतहट', 2, '२ नं. प्रदेश'),
(502, 'वारा', 2, '२ नं. प्रदेश'),
(503, 'पर्सा', 2, '२ नं. प्रदेश'),
(504, 'सिन्धुली', 3, 'बागमती प्रदेश'),
(505, 'रामेछाप', 3, 'बागमती प्रदेश'),
(506, 'दोलखा', 3, 'बागमती प्रदेश'),
(507, 'सिन्धुपाल्चोक', 3, 'बागमती प्रदेश'),
(508, 'काभ्रेपलान्चोक', 3, 'बागमती प्रदेश'),
(509, 'ललितपुर', 3, 'बागमती प्रदेश'),
(510, 'भक्तपुर', 3, 'बागमती प्रदेश'),
(511, 'काठमाण्डौ', 3, 'बागमती प्रदेश'),
(512, 'नुवाकोट', 3, 'बागमती प्रदेश'),
(513, 'रसुवा', 3, 'बागमती प्रदेश'),
(514, 'धादिङ', 3, 'बागमती प्रदेश'),
(515, 'मकवानपुर', 3, 'बागमती प्रदेश'),
(516, 'चितवन', 3, 'बागमती प्रदेश'),
(517, 'गोरखा', 4, 'गण्डकी प्रदेश'),
(518, 'लमजुङ', 4, 'गण्डकी प्रदेश'),
(519, 'तनहुँ', 4, 'गण्डकी प्रदेश'),
(520, 'स्याङजा', 4, 'गण्डकी प्रदेश'),
(521, 'कास्की', 4, 'गण्डकी प्रदेश'),
(522, 'मुस्ताङ', 4, 'गण्डकी प्रदेश'),
(523, 'म्याग्दी', 4, 'गण्डकी प्रदेश'),
(524, 'पर्वत', 4, 'गण्डकी प्रदेश'),
(525, 'वाग्लुङ', 4, 'गण्डकी प्रदेश'),
(526, 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 4, 'गण्डकी प्रदेश'),
(527, 'गुल्मी', 5, '५ नं. प्रदेश'),
(528, 'पाल्पा', 5, '५ नं. प्रदेश'),
(529, 'रुपन्देही', 5, '५ नं. प्रदेश'),
(530, 'कपिलबस्तु', 5, '५ नं. प्रदेश'),
(531, 'अर्घाखाँची', 5, '५ नं. प्रदेश'),
(532, 'प्यूठान', 5, '५ नं. प्रदेश'),
(533, 'रोल्पा', 5, '५ नं. प्रदेश'),
(534, 'रुकुम (पूर्वी भाग)', 5, '५ नं. प्रदेश'),
(535, 'दाङ', 5, '५ नं. प्रदेश'),
(536, 'बाँके', 5, '५ नं. प्रदेश'),
(537, 'बर्दिया', 5, '५ नं. प्रदेश'),
(538, 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 5, '५ नं. प्रदेश'),
(539, 'रुकुम (पश्चिम भाग)', 6, 'कर्णाली प्रदेश'),
(540, 'सल्यान', 6, 'कर्णाली प्रदेश'),
(541, 'सुर्खेत', 6, 'कर्णाली प्रदेश'),
(542, 'दैलेख', 6, 'कर्णाली प्रदेश'),
(543, 'जाजरकोट', 6, 'कर्णाली प्रदेश'),
(544, 'डोल्पा', 6, 'कर्णाली प्रदेश'),
(545, 'जुम्ला', 6, 'कर्णाली प्रदेश'),
(546, 'कालिकोट', 6, 'कर्णाली प्रदेश'),
(547, 'मुगु', 6, 'कर्णाली प्रदेश'),
(548, 'हुम्ला', 6, 'कर्णाली प्रदेश'),
(549, 'बाजुरा', 7, 'सुदूरपश्चिम प्रदेश'),
(550, 'बझाङ', 7, 'सुदूरपश्चिम प्रदेश'),
(551, 'अछाम', 7, 'सुदूरपश्चिम प्रदेश'),
(552, 'डोटी', 7, 'सुदूरपश्चिम प्रदेश'),
(553, 'कैलाली', 7, 'सुदूरपश्चिम प्रदेश'),
(554, 'कञ्चनपुर', 7, 'सुदूरपश्चिम प्रदेश'),
(555, 'डडेलधुरा', 7, 'सुदूरपश्चिम प्रदेश'),
(556, 'बैतडी', 7, 'सुदूरपश्चिम प्रदेश'),
(557, 'दार्चुला', 7, 'सुदूरपश्चिम प्रदेश');

-- --------------------------------------------------------

--
-- Table structure for table `settings_vdc_municipality`
--

CREATE TABLE IF NOT EXISTS `settings_vdc_municipality` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `district` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `district_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2945 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings_vdc_municipality`
--

INSERT INTO `settings_vdc_municipality` (`id`, `name`, `district`, `type`, `district_id`) VALUES
(2191, 'फुङलिङ नगरपालिका', 'ताप्लेजुङ', 'नगरपालिका', 481),
(2192, 'आठराई त्रिवेणी गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2193, 'सिदिङ्वा गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2194, 'फक्ताङलुङ गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2195, 'मिक्वाखोला गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2196, 'मेरिङदेन गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2197, 'मैवाखोला गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2198, 'याङवरक गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2199, 'सिरीजङ्घा गाउँपालिका', 'ताप्लेजुङ', 'गाउँपालिका', 481),
(2200, 'फिदिम नगरपालिका', 'पाँचथर', 'नगरपालिका', 482),
(2201, 'फालेलुंग गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2202, 'फाल्गुनन्द गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2203, 'हिलिहाङ गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2204, 'कुम्मायक गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2205, 'मिक्लाजुङ गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2206, 'तुम्बेवा गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2207, 'याङवरक गाउँपालिका', 'पाँचथर', 'गाउँपालिका', 482),
(2208, 'ईलाम नगरपालिका', 'ईलाम', 'नगरपालिका', 483),
(2209, 'देउमाई नगरपालिका', 'ईलाम', 'नगरपालिका', 483),
(2210, 'माई नगरपालिका', 'ईलाम', 'नगरपालिका', 483),
(2211, 'सूर्योदय नगरपालिका', 'ईलाम', 'नगरपालिका', 483),
(2212, 'फाकफोकथुम गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2213, 'चुलाचुली गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2214, 'माईजोगमाई गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2215, 'माङसेबुङ गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2216, 'रोङ गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2217, 'सन्दकपुर गाउँपालिका', 'ईलाम', 'गाउँपालिका', 483),
(2218, 'मेचीनगर नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2219, 'दमक नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2220, 'कन्काई नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2221, 'भद्रपुर नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2222, 'अर्जुनधारा नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2223, 'शिवशताक्षी नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2224, 'गौरादह नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2225, 'विर्तामोड नगरपालिका', 'झापा', 'नगरपालिका', 484),
(2226, 'कमल गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2227, 'गौरीगंज गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2228, 'बाह्रदशी गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2229, 'झापा गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2230, 'बुद्धशान्ति गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2231, 'हल्दिवारी गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2232, 'कचनकवल गाउँपालिका', 'झापा', 'गाउँपालिका', 484),
(2233, 'विराटनगर महानगरपालिका', 'मोरङ', 'महानगरपालिका', 485),
(2234, 'बेलवारी नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2235, 'लेटाङ नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2236, 'पथरी शनिश्चरे नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2237, 'रंगेली नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2238, 'रतुवामाई नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2239, 'सुनवर्षि नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2240, 'उर्लावारी नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2241, 'सुन्दरहरैचा नगरपालिका', 'मोरङ', 'नगरपालिका', 485),
(2242, 'बुढीगंगा गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2243, 'धनपालथान गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2244, 'ग्रामथान गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2245, 'जहदा गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2246, 'कानेपोखरी गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2247, 'कटहरी गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2248, 'केरावारी गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2249, 'मिक्लाजुङ गाउँपालिका', 'मोरङ', 'गाउँपालिका', 485),
(2250, 'ईटहरी उपमहानगरपालिका', 'सुनसरी', 'उपमहानगरपालिका', 486),
(2251, 'धरान उपमहानगरपालिका', 'सुनसरी', 'उपमहानगरपालिका', 486),
(2252, 'ईनरुवा नगरपालिका', 'सुनसरी', 'नगरपालिका', 486),
(2253, 'दुहवी नगरपालिका', 'सुनसरी', 'नगरपालिका', 486),
(2254, 'रामधुनी नगरपालिका', 'सुनसरी', 'नगरपालिका', 486),
(2255, 'बराह नगरपालिका', 'सुनसरी', 'नगरपालिका', 486),
(2256, 'देवानगञ्ज गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2257, 'कोशी गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2258, 'गढी गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2259, 'बर्जु गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2260, 'भोक्राहा गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2261, 'हरिनगरा गाउँपालिका', 'सुनसरी', 'गाउँपालिका', 486),
(2262, 'पाख्रिबास नगरपालिका', 'धनकुटा', 'नगरपालिका', 487),
(2263, 'धनकुटा नगरपालिका', 'धनकुटा', 'नगरपालिका', 487),
(2264, 'महालक्ष्मी नगरपालिका', 'धनकुटा', 'नगरपालिका', 487),
(2265, 'साँगुरीगढी गाउँपालिका', 'धनकुटा', 'गाउँपालिका', 487),
(2266, 'खाल्सा छिन्ताङ सहिदभूमि गाउँपालिका', 'धनकुटा', 'गाउँपालिका', 487),
(2267, 'छथर जोरपाटी गाउँपालिका', 'धनकुटा', 'गाउँपालिका', 487),
(2268, 'चौविसे गाउँपालिका', 'धनकुटा', 'गाउँपालिका', 487),
(2269, 'म्याङलुङ नगरपालिका', 'तेहथुम', 'नगरपालिका', 488),
(2270, 'लालीगुराँस नगरपालिका', 'तेहथुम', 'नगरपालिका', 488),
(2271, 'आठराई गाउँपालिका', 'तेहथुम', 'गाउँपालिका', 488),
(2272, 'छथर गाउँपालिका', 'तेहथुम', 'गाउँपालिका', 488),
(2273, 'फेदाप गाउँपालिका', 'तेहथुम', 'गाउँपालिका', 488),
(2274, 'मेन्छयायेम गाउँपालिका', 'तेहथुम', 'गाउँपालिका', 488),
(2275, 'चैनपुर नगरपालिका', 'संखुवासभा', 'नगरपालिका', 489),
(2276, 'धर्मदेवी नगरपालिका', 'संखुवासभा', 'नगरपालिका', 489),
(2277, 'खाँदवारी नगरपालिका', 'संखुवासभा', 'नगरपालिका', 489),
(2278, 'मादी नगरपालिका', 'संखुवासभा', 'नगरपालिका', 489),
(2279, 'पाँचखपन नगरपालिका', 'संखुवासभा', 'नगरपालिका', 489),
(2280, 'भोटखोला गाउँपालिका', 'संखुवासभा', 'गाउँपालिका', 489),
(2281, 'चिचिला गाउँपालिका', 'संखुवासभा', 'गाउँपालिका', 489),
(2282, 'मकालु गाउँपालिका', 'संखुवासभा', 'गाउँपालिका', 489),
(2283, 'सभापोखरी गाउँपालिका', 'संखुवासभा', 'गाउँपालिका', 489),
(2284, 'सिलीचोङ गाउँपालिका', 'संखुवासभा', 'गाउँपालिका', 489),
(2285, 'भोजपुर नगरपालिका', 'भोजपुर', 'नगरपालिका', 490),
(2286, 'षडानन्द नगरपालिका', 'भोजपुर', 'नगरपालिका', 490),
(2287, 'ट्याम्केमैयुम गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2288, 'रामप्रसाद राई गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2289, 'अरुण गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2290, 'पौवादुङमा गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2291, 'साल्पासिलिछो गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2292, 'आमचोक गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2293, 'हतुवागढी गाउँपालिका', 'भोजपुर', 'गाउँपालिका', 490),
(2294, 'सोलुदुधकुण्ड नगरपालिका', 'सोलुखुम्बु', 'नगरपालिका', 491),
(2295, 'दुधकोसी गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2296, 'खुम्वु पासाङल्हमु गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2297, 'दुधकौशिका गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2298, 'नेचासल्यान गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2299, 'माहाकुलुङ गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2300, 'लिखु पिके गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2301, 'सोताङ गाउँपालिका', 'सोलुखुम्बु', 'गाउँपालिका', 491),
(2302, 'सिद्दिचरण नगरपालिका', 'ओखलढुंगा', 'नगरपालिका', 492),
(2303, 'खिजिदेम्बा गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2304, 'चम्पादेवी गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2305, 'चिशंखुगढी गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2306, 'मानेभञ्याङ गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2307, 'मोलुङ गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2308, 'लिखु गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2309, 'सुनकोशी गाउँपालिका', 'ओखलढुंगा', 'गाउँपालिका', 492),
(2310, 'हलेसी तुवाचुङ नगरपालिका', 'खोटाङ', 'नगरपालिका', 493),
(2311, 'रुपाकोट मझुवागढी नगरपालिका', 'खोटाङ', 'नगरपालिका', 493),
(2312, 'ऐसेलुखर्क गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2313, 'लामीडाँडा गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2314, 'जन्तेढुंगा गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2315, 'खोटेहाङ गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2316, 'केपिलासगढी गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2317, 'दिप्रुङ गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2318, 'साकेला गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2319, 'वराहपोखरी गाउँपालिका', 'खोटाङ', 'गाउँपालिका', 493),
(2320, 'कटारी नगरपालिका', 'उदयपुर', 'नगरपालिका', 494),
(2321, 'चौदण्डीगढी नगरपालिका', 'उदयपुर', 'नगरपालिका', 494),
(2322, 'त्रियुगा नगरपालिका', 'उदयपुर', 'नगरपालिका', 494),
(2323, 'वेलका नगरपालिका', 'उदयपुर', 'नगरपालिका', 494),
(2324, 'उदयपुरगढी गाउँपालिका', 'उदयपुर', 'गाउँपालिका', 494),
(2325, 'ताप्ली गाउँपालिका', 'उदयपुर', 'गाउँपालिका', 494),
(2326, 'रौतामाई गाउँपालिका', 'उदयपुर', 'गाउँपालिका', 494),
(2327, 'सुनकोशी गाउँपालिका', 'उदयपुर', 'गाउँपालिका', 494),
(2328, 'राजविराज नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2329, 'कञ्चनरुप नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2330, 'डाक्नेश्वरी नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2331, 'बोदेबरसाईन नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2332, 'खडक नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2333, 'शम्भुनाथ नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2334, 'सुरुङ्‍गा नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2335, 'हनुमाननगर कङ्‌कालिनी नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2336, 'सप्तकोशी नगरपालिका', 'सप्तरी', 'नगरपालिका', 495),
(2337, 'अग्निसाइर कृष्णासवरन गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2338, 'छिन्नमस्ता गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2339, 'महादेवा गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2340, 'तिरहुत गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2341, 'तिलाठी कोईलाडी गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2342, 'रुपनी गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2343, 'बेल्ही चपेना गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2344, 'बिष्णुपुर गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2345, 'बलान-बिहुल गाउँपालिका', 'सप्तरी', 'गाउँपालिका', 495),
(2346, 'लहान नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2347, 'धनगढीमाई नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2348, 'सिरहा नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2349, 'गोलबजार नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2350, 'मिर्चैयाँ नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2351, 'कल्याणपुर नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2352, 'कर्जन्हा नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2353, 'सुखीपुर नगरपालिका', 'सिराहा', 'नगरपालिका', 497),
(2354, 'भगवानपुर गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2355, 'औरही गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2356, 'विष्णुपुर गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2357, 'बरियारपट्टी गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2358, 'लक्ष्मीपुर पतारी गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2359, 'नरहा गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2360, 'सखुवानान्कारकट्टी गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2361, 'अर्नमा गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2362, 'नवराजपुर गाउँपालिका', 'सिराहा', 'गाउँपालिका', 497),
(2363, 'जनकपुर उपमहानगरपालिका', 'धनुषा', 'उपमहानगरपालिका', 498),
(2364, 'क्षिरेश्वरनाथ नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2365, 'गणेशमान चारनाथ नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2366, 'धनुषाधाम नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2367, 'नगराइन नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2368, 'विदेह नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2369, 'मिथिला नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2370, 'शहीदनगर नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2371, 'सबैला नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2372, 'कमला नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2373, 'मिथिला बिहारी नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2374, 'हंसपुर नगरपालिका', 'धनुषा', 'नगरपालिका', 498),
(2375, 'जनकनन्दिनी गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2376, 'बटेश्वर गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2377, 'मुखियापट्टी मुसहरमिया गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2378, 'लक्ष्मीनिया गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2379, 'औरही गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2380, 'धनौजी गाउँपालिका', 'धनुषा', 'गाउँपालिका', 498),
(2381, 'जलेश्वर नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2382, 'बर्दिबास नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2383, 'गौशाला नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2384, 'लोहरपट्टी नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2385, 'रामगोपालपुर नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2386, 'मनरा शिसवा नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2387, 'मटिहानी नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2388, 'भँगाहा नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2389, 'बलवा नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2390, 'औरही नगरपालिका', 'महोत्तरी', 'नगरपालिका', 499),
(2391, 'एकडारा गाउँपालिका', 'महोत्तरी', 'गाउँपालिका', 499),
(2392, 'सोनमा गाउँपालिका', 'महोत्तरी', 'गाउँपालिका', 499),
(2393, 'साम्सी गाउँपालिका', 'महोत्तरी', 'गाउँपालिका', 499),
(2394, 'महोत्तरी गाउँपालिका', 'महोत्तरी', 'गाउँपालिका', 499),
(2395, 'पिपरा गाउँपालिका', 'महोत्तरी', 'गाउँपालिका', 499),
(2396, 'ईश्वरपुर नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2397, 'मलंगवा नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2398, 'लालबन्दी नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2399, 'हरिपुर नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2400, 'हरिपुर्वा नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2401, 'हरिवन नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2402, 'बरहथवा नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2403, 'बलरा नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2404, 'गोडैटा नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2405, 'बागमती नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2406, 'कविलासी नगरपालिका', 'सर्लाही', 'नगरपालिका', 500),
(2407, 'चक्रघट्टा गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2408, 'चन्द्रनगर गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2409, 'धनकौल गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2410, 'ब्रह्मपुरी गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2411, 'रामनगर गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2412, 'विष्णु गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2413, 'कौडेना गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2414, 'पर्सा गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2415, 'बसबरीया गाउँपालिका', 'सर्लाही', 'गाउँपालिका', 500),
(2416, 'चन्द्रपुर नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2417, 'गरुडा नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2418, 'गौर नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2419, 'बौधीमाई नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2420, 'बृन्दावन नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2421, 'देवाही गोनाही नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2422, 'गढीमाई नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2423, 'गुजरा नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2424, 'कटहरिया नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2425, 'माधव नारायण नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2426, 'मौलापुर नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2427, 'फतुवाबिजयपुर नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2428, 'ईशनाथ नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2429, 'परोहा नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2430, 'राजपुर नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2431, 'राजदेवी नगरपालिका', 'रौतहट', 'नगरपालिका', 501),
(2432, 'दुर्गा भगवती गाउँपालिका', 'रौतहट', 'गाउँपालिका', 501),
(2433, 'यमुनामाई गाउँपालिका', 'रौतहट', 'गाउँपालिका', 501),
(2434, 'कलैया उपमहानगरपालिका', 'वारा', 'उपमहानगरपालिका', 502),
(2435, 'जीतपुर सिमरा उपमहानगरपालिका', 'वारा', 'उपमहानगरपालिका', 502),
(2436, 'कोल्हवी नगरपालिका', 'वारा', 'नगरपालिका', 502),
(2437, 'निजगढ नगरपालिका', 'वारा', 'नगरपालिका', 502),
(2438, 'महागढीमाई नगरपालिका', 'वारा', 'नगरपालिका', 502),
(2439, 'सिम्रौनगढ नगरपालिका', 'वारा', 'नगरपालिका', 502),
(2440, 'पचरौता नगरपालिका', 'वारा', 'नगरपालिका', 502),
(2441, 'आदर्श कोटवाल गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2442, 'करैयामाई गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2443, 'देवताल गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2444, 'परवानीपुर गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2445, 'प्रसौनी गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2446, 'फेटा गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2447, 'बारागढीगाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2448, 'सुवर्ण गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2449, 'विश्रामपुर गाउँपालिका', 'वारा', 'गाउँपालिका', 502),
(2450, 'बिरगंज महानगरपालिका', 'पर्सा', 'महानगरपालिका', 503),
(2451, 'पोखरिया नगरपालिका', 'पर्सा', 'नगरपालिका', 503),
(2452, 'बहुदरमाई नगरपालिका', 'पर्सा', 'नगरपालिका', 503),
(2453, 'पर्सागढी नगरपालिका', 'पर्सा', 'नगरपालिका', 503),
(2454, 'ठोरी गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2455, 'जगरनाथपुर गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2456, 'धोबीनी गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2457, 'छिपहरमाई गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2458, 'पकाहा मैनपुर गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2459, 'बिन्दबासिनी गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2460, 'सखुवा प्रसौनी गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2461, 'पटेर्वा सुगौली गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2462, 'कालिकामाई गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2463, 'जिरा भवानी गाउँपालिका', 'पर्सा', 'गाउँपालिका', 503),
(2464, 'कमलामाई नगरपालिका', 'सिन्धुली', 'नगरपालिका', 504),
(2465, 'दुधौली नगरपालिका', 'सिन्धुली', 'नगरपालिका', 504),
(2466, 'गोलन्जर गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2467, 'घ्याङलेख गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2468, 'तीनपाटन गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2469, 'फिक्कल गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2470, 'मरिण गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2471, 'सुनकोशी गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2472, 'हरिहरपुरगढी गाउँपालिका', 'सिन्धुली', 'गाउँपालिका', 504),
(2473, 'मन्थली नगरपालिका', 'रामेछाप', 'नगरपालिका', 505),
(2474, 'रामेछाप नगरपालिका', 'रामेछाप', 'नगरपालिका', 505),
(2475, 'उमाकुण्ड गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2476, 'खाँडादेवी गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2477, 'गोकुलगङ्गा गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2478, 'दोरम्बा गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2479, 'लिखु गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2480, 'सुनापती गाउँपालिका', 'रामेछाप', 'गाउँपालिका', 505),
(2481, 'जिरी नगरपालिका', 'दोलखा', 'नगरपालिका', 506),
(2482, 'भिमेश्वर नगरपालिका', 'दोलखा', 'नगरपालिका', 506),
(2483, 'कालिन्चोक गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2484, 'गौरीशङ्कर गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2485, 'तामाकोशी गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2486, 'मेलुङ्ग गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2487, 'विगु गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2488, 'वैतेश्वर गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2489, 'शैलुङ्ग गाउँपालिका', 'दोलखा', 'गाउँपालिका', 506),
(2490, 'चौतारा साँगाचोकगढी नगरपालिका', 'सिन्धुपाल्चोक', 'नगरपालिका', 507),
(2491, 'बाह्रविसे नगरपालिका', 'सिन्धुपाल्चोक', 'नगरपालिका', 507),
(2492, 'मेलम्ची नगरपालिका', 'सिन्धुपाल्चोक', 'नगरपालिका', 507),
(2493, 'ईन्द्रावती गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2494, 'जुगल गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2495, 'पाँचपोखरी थाङपाल गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2496, 'बलेफी गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2497, 'भोटेकोशी गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2498, 'लिसङ्खु पाखर गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2499, 'सुनकोशी गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2500, 'हेलम्बु गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2501, 'त्रिपुरासुन्दरी गाउँपालिका', 'सिन्धुपाल्चोक', 'गाउँपालिका', 507),
(2502, 'धुलिखेल नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2503, 'बनेपा नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2504, 'पनौती नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2505, 'पाँचखाल नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2506, 'नमोबुद्ध नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2507, 'मण्डनदेउपुर नगरपालिका', 'काभ्रेपलान्चोक', 'नगरपालिका', 508),
(2508, 'खानीखोला गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2509, 'चौंरीदेउराली गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2510, 'तेमाल गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2511, 'बेथानचोक गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2512, 'भुम्लु गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2513, 'महाभारत गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2514, 'रोशी गाउँपालिका', 'काभ्रेपलान्चोक', 'गाउँपालिका', 508),
(2515, 'ललितपुर महानगरपालिका', 'ललितपुर', 'महानगरपालिका', 509),
(2516, 'गोदावरी नगरपालिका', 'ललितपुर', 'नगरपालिका', 509),
(2517, 'महालक्ष्मी नगरपालिका', 'ललितपुर', 'नगरपालिका', 509),
(2518, 'कोन्ज्योसोम गाउँपालिका', 'ललितपुर', 'गाउँपालिका', 509),
(2519, 'बागमती गाउँपालिका', 'ललितपुर', 'गाउँपालिका', 509),
(2520, 'महाङ्काल गाउँपालिका', 'ललितपुर', 'गाउँपालिका', 509),
(2521, 'चाँगुनारायण नगरपालिका', 'भक्तपुर', 'नगरपालिका', 510),
(2522, 'भक्तपुर नगरपालिका', 'भक्तपुर', 'नगरपालिका', 510),
(2523, 'मध्यपुर थिमी नगरपालिका', 'भक्तपुर', 'नगरपालिका', 510),
(2524, 'सूर्यविनायक नगरपालिका', 'भक्तपुर', 'नगरपालिका', 510),
(2525, 'काठमाण्डौं महानगरपालिका', 'काठमाण्डौ', 'महानगरपालिका', 511),
(2526, 'कागेश्वरी मनोहरा नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2527, 'कीर्तिपुर नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2528, 'गोकर्णेश्वर नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2529, 'चन्द्रागिरी नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2530, 'टोखा नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2531, 'तारकेश्वर नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2532, 'दक्षिणकाली नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2533, 'नागार्जुन नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2534, 'बुढानिलकण्ठ नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2535, 'शङ्खरापुर नगरपालिका', 'काठमाण्डौ', 'नगरपालिका', 511),
(2536, 'विदुर नगरपालिका', 'नुवाकोट', 'नगरपालिका', 512),
(2537, 'बेलकोटगढी नगरपालिका', 'नुवाकोट', 'नगरपालिका', 512),
(2538, 'ककनी गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2539, 'किस्पाङ गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2540, 'तादी गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2541, 'तारकेश्वर गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2542, 'दुप्चेश्वर गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2543, 'पञ्चकन्या गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2544, 'लिखु गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2545, 'मेघाङ गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2546, 'शिवपुरी गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2547, 'सुर्यगढी गाउँपालिका', 'नुवाकोट', 'गाउँपालिका', 512),
(2548, 'उत्तरगया गाउँपालिका', 'रसुवा', 'गाउँपालिका', 513),
(2549, 'कालिका गाउँपालिका', 'रसुवा', 'गाउँपालिका', 513),
(2550, 'गोसाईकुण्ड गाउँपालिका', 'रसुवा', 'गाउँपालिका', 513),
(2551, 'नौकुण्ड गाउँपालिका', 'रसुवा', 'गाउँपालिका', 513),
(2552, 'आमाछोदिङमो गाउँपालिका', 'रसुवा', 'गाउँपालिका', 513),
(2553, 'धुनीबेंशी नगरपालिका', 'धादिङ', 'नगरपालिका', 514),
(2554, 'निलकण्ठ नगरपालिका', 'धादिङ', 'नगरपालिका', 514),
(2555, 'खनियाबास गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2556, 'गजुरी गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2557, 'गल्छी गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2558, 'गङ्गाजमुना गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2559, 'ज्वालामूखी गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2560, 'थाक्रे गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2561, 'नेत्रावति गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2562, 'बेनीघाट रोराङ्ग गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2563, 'रुवी भ्याली गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2564, 'सिद्धलेक गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2565, 'त्रिपुरासुन्दरी गाउँपालिका', 'धादिङ', 'गाउँपालिका', 514),
(2566, 'हेटौडा उपमहानगरपालिका', 'मकवानपुर', 'उपमहानगरपालिका', 515),
(2567, 'थाहा नगरपालिका', 'मकवानपुर', 'नगरपालिका', 515),
(2568, 'इन्द्रसरोबर गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2569, 'कैलाश गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2570, 'बकैया गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2571, 'बाग्मति गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2572, 'भिमफेदी गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2573, 'मकवानपुरगढी गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2574, 'मनहरी गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2575, 'राक्सिराङ्ग गाउँपालिका', 'मकवानपुर', 'गाउँपालिका', 515),
(2576, 'भरतपुर महानगरपालिका', 'चितवन', 'महानगरपालिका', 516),
(2577, 'कालिका नगरपालिका', 'चितवन', 'नगरपालिका', 516),
(2578, 'खैरहनी नगरपालिका', 'चितवन', 'नगरपालिका', 516),
(2579, 'माडी नगरपालिका', 'चितवन', 'नगरपालिका', 516),
(2580, 'रत्ननगर नगरपालिका', 'चितवन', 'नगरपालिका', 516),
(2581, 'राप्ती नगरपालिका', 'चितवन', 'नगरपालिका', 516),
(2582, 'इच्छाकामना गाउँपालिका', 'चितवन', 'गाउँपालिका', 516),
(2583, 'गोरखा नगरपालिका', 'गोरखा', 'नगरपालिका', 517),
(2584, 'पालुङटार नगरपालिका', 'गोरखा', 'नगरपालिका', 517),
(2585, 'सुलीकोट गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2586, 'सिरानचोक गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2587, 'अजिरकोट गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2588, 'आरूघाट गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2589, 'गण्डकी गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2590, 'चुमनुव्री गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2591, 'धार्चे गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2592, 'भिमसेन गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2593, 'शहिद लखन गाउँपालिका', 'गोरखा', 'गाउँपालिका', 517),
(2594, 'बेसीशहर नगरपालिका', 'लमजुङ', 'नगरपालिका', 518),
(2595, 'मध्यनेपाल नगरपालिका', 'लमजुङ', 'नगरपालिका', 518),
(2596, 'राइनास नगरपालिका', 'लमजुङ', 'नगरपालिका', 518),
(2597, 'सुन्दरबजार नगरपालिका', 'लमजुङ', 'नगरपालिका', 518),
(2598, 'क्व्होलासोथार गाउँपालिका', 'लमजुङ', 'गाउँपालिका', 518),
(2599, 'दूधपोखरी गाउँपालिका', 'लमजुङ', 'गाउँपालिका', 518),
(2600, 'दोर्दी गाउँपालिका', 'लमजुङ', 'गाउँपालिका', 518),
(2601, 'मर्स्याङदी गाउँपालिका', 'लमजुङ', 'गाउँपालिका', 518),
(2602, 'भानु नगरपालिका', 'तनहुँ', 'नगरपालिका', 519),
(2603, 'भिमाद नगरपालिका', 'तनहुँ', 'नगरपालिका', 519),
(2604, 'व्यास नगरपालिका', 'तनहुँ', 'नगरपालिका', 519),
(2605, 'शुक्लागण्डकी नगरपालिका', 'तनहुँ', 'नगरपालिका', 519),
(2606, 'आँबुखैरेनी गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2607, 'ऋषिङ्ग गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2608, 'घिरिङ गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2609, 'देवघाट गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2610, 'म्याग्दे गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2611, 'वन्दिपुर गाउँपालिका', 'तनहुँ', 'गाउँपालिका', 519),
(2612, 'गल्याङ नगरपालिका', 'स्याङजा', 'नगरपालिका', 520),
(2613, 'चापाकोट नगरपालिका', 'स्याङजा', 'नगरपालिका', 520),
(2614, 'पुतलीबजार नगरपालिका', 'स्याङजा', 'नगरपालिका', 520),
(2615, 'भीरकोट नगरपालिका', 'स्याङजा', 'नगरपालिका', 520),
(2616, 'वालिङ नगरपालिका', 'स्याङजा', 'नगरपालिका', 520),
(2617, 'अर्जुनचौपारी गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2618, 'आँधिखोला गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2619, 'कालीगण्डकी गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2620, 'फेदीखोला गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2621, 'बिरुवा गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2622, 'हरिनास गाउँपालिका', 'स्याङजा', 'गाउँपालिका', 520),
(2623, 'पोखरा लेखनाथ महानगरपालिका', 'कास्की', 'महानगरपालिका', 521),
(2624, 'अन्नपूर्ण गाउँपालिका', 'कास्की', 'गाउँपालिका', 521),
(2625, 'माछापुच्छ्रे गाउँपालिका', 'कास्की', 'गाउँपालिका', 521),
(2626, 'मादी गाउँपालिका', 'कास्की', 'गाउँपालिका', 521),
(2627, 'रूपा गाउँपालिका', 'कास्की', 'गाउँपालिका', 521),
(2628, 'चामे गाउँपालिका', 'मनाङ', 'गाउँपालिका', 0),
(2629, 'नारफू गाउँपालिका', 'मनाङ', 'गाउँपालिका', 0),
(2630, 'नाशोङ गाउँपालिका', 'मनाङ', 'गाउँपालिका', 0),
(2631, 'नेस्याङ गाउँपालिका', 'मनाङ', 'गाउँपालिका', 0),
(2632, 'घरपझोङ गाउँपालिका', 'मुस्ताङ', 'गाउँपालिका', 522),
(2633, 'थासाङ गाउँपालिका', 'मुस्ताङ', 'गाउँपालिका', 522),
(2634, 'दालोमे गाउँपालिका', 'मुस्ताङ', 'गाउँपालिका', 522),
(2635, 'लोमन्थाङ गाउँपालिका', 'मुस्ताङ', 'गाउँपालिका', 522),
(2636, 'वाह्रगाउँ मुक्तिक्षेत्र गाउँपालिका', 'मुस्ताङ', 'गाउँपालिका', 522),
(2637, 'बेनी नगरपालिका', 'म्याग्दी', 'नगरपालिका', 523),
(2638, 'अन्नपूर्ण गाउँपालिका', 'म्याग्दी', 'गाउँपालिका', 523),
(2639, 'धवलागिरी गाउँपालिका', 'म्याग्दी', 'गाउँपालिका', 523),
(2640, 'मंगला गाउँपालिका', 'म्याग्दी', 'गाउँपालिका', 523),
(2641, 'मालिका गाउँपालिका', 'म्याग्दी', 'गाउँपालिका', 523),
(2642, 'रघुगंगा गाउँपालिका', 'म्याग्दी', 'गाउँपालिका', 523),
(2643, 'कुश्मा नगरपालिका', 'पर्वत', 'नगरपालिका', 524),
(2644, 'फलेवास नगरपालिका', 'पर्वत', 'नगरपालिका', 524),
(2645, 'जलजला गाउँपालिका', 'पर्वत', 'गाउँपालिका', 524),
(2646, 'पैयूं गाउँपालिका', 'पर्वत', 'गाउँपालिका', 524),
(2647, 'महाशिला गाउँपालिका', 'पर्वत', 'गाउँपालिका', 524),
(2648, 'मोदी गाउँपालिका', 'पर्वत', 'गाउँपालिका', 524),
(2649, 'विहादी गाउँपालिका', 'पर्वत', 'गाउँपालिका', 524),
(2650, 'बागलुङ नगरपालिका', 'वाग्लुङ', 'नगरपालिका', 525),
(2651, 'गल्कोट नगरपालिका', 'वाग्लुङ', 'नगरपालिका', 525),
(2652, 'जैमूनी नगरपालिका', 'वाग्लुङ', 'नगरपालिका', 525),
(2653, 'ढोरपाटन नगरपालिका', 'वाग्लुङ', 'नगरपालिका', 525),
(2654, 'वरेङ गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2655, 'काठेखोला गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2656, 'तमानखोला गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2657, 'ताराखोला गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2658, 'निसीखोला गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2659, 'वडिगाड गाउँपालिका', 'वाग्लुङ', 'गाउँपालिका', 525),
(2660, 'कावासोती नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'नगरपालिका', 526),
(2661, 'गैडाकोट नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'नगरपालिका', 526),
(2662, 'देवचुली नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'नगरपालिका', 526),
(2663, 'मध्यविन्दु नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'नगरपालिका', 526),
(2664, 'बुङ्दीकाली गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'गाउँपालिका', 526),
(2665, 'बुलिङटार गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'गाउँपालिका', 526),
(2666, 'विनयी त्रिवेणी गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'गाउँपालिका', 526),
(2667, 'हुप्सेकोट गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पूर्व)', 'गाउँपालिका', 526),
(2668, 'मुसिकोट नगरपालिका', 'गुल्मी', 'नगरपालिका', 527),
(2669, 'रेसुङ्गा नगरपालिका', 'गुल्मी', 'नगरपालिका', 527),
(2670, 'ईस्मा गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2671, 'कालीगण्डकी गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2672, 'गुल्मी दरबार गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2673, 'सत्यवती गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2674, 'चन्द्रकोट गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2675, 'रुरु गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2676, 'छत्रकोट गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2677, 'धुर्कोट गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2678, 'मदाने गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2679, 'मालिका गाउँपालिका', 'गुल्मी', 'गाउँपालिका', 527),
(2680, 'रामपुर नगरपालिका', 'पाल्पा', 'नगरपालिका', 528),
(2681, 'तानसेन नगरपालिका', 'पाल्पा', 'नगरपालिका', 528),
(2682, 'निस्दी गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2683, 'पूर्वखोला गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2684, 'रम्भा गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2685, 'माथागढी गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2686, 'तिनाउ गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2687, 'बगनासकाली गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2688, 'रिब्दिकोट गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2689, 'रैनादेवी छहरा गाउँपालिका', 'पाल्पा', 'गाउँपालिका', 528),
(2690, 'बुटवल उपमहानगरपालिका', 'रुपन्देही', 'उपमहानगरपालिका', 529),
(2691, 'देवदह नगरपालिका', 'रुपन्देही', 'नगरपालिका', 529),
(2692, 'लुम्बिनी सांस्कृतिक नगरपालिका', 'रुपन्देही', 'नगरपालिका', 529),
(2693, 'सैनामैना नगरपालिका', 'रुपन्देही', 'नगरपालिका', 529),
(2694, 'सिद्धार्थनगर नगरपालिका', 'रुपन्देही', 'नगरपालिका', 529),
(2695, 'तिलोत्तमा नगरपालिका', 'रुपन्देही', 'नगरपालिका', 529),
(2696, 'गैडहवा गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2697, 'कन्चन गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2698, 'कोटहीमाई गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2699, 'मर्चवारी गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2700, 'मायादेवी गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2701, 'ओमसतिया गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2702, 'रोहिणी गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2703, 'सम्मरीमाई गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2704, 'सियारी गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2705, 'शुद्धोधन गाउँपालिका', 'रुपन्देही', 'गाउँपालिका', 529),
(2706, 'कपिलवस्तु नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2707, 'बुद्धभूमी नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2708, 'शिवराज नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2709, 'महाराजगंज नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2710, 'कृष्णनगर नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2711, 'बाणगंगा नगरपालिका', 'कपिलबस्तु', 'नगरपालिका', 530),
(2712, 'मायादेवी गाउँपालिका', 'कपिलबस्तु', 'गाउँपालिका', 530),
(2713, 'यसोधरा गाउँपालिका', 'कपिलबस्तु', 'गाउँपालिका', 530),
(2714, 'सुद्धोधन गाउँपालिका', 'कपिलबस्तु', 'गाउँपालिका', 530),
(2715, 'विजयनगर गाउँपालिका', 'कपिलबस्तु', 'गाउँपालिका', 530),
(2716, 'सन्धिखर्क नगरपालिका', 'अर्घाखाँची', 'नगरपालिका', 531),
(2717, 'शितगंगा नगरपालिका', 'अर्घाखाँची', 'नगरपालिका', 531),
(2718, 'भूमिकास्थान नगरपालिका', 'अर्घाखाँची', 'नगरपालिका', 531),
(2719, 'छत्रदेव गाउँपालिका', 'अर्घाखाँची', 'गाउँपालिका', 531),
(2720, 'पाणिनी गाउँपालिका', 'अर्घाखाँची', 'गाउँपालिका', 531),
(2721, 'मालारानी गाउँपालिका', 'अर्घाखाँची', 'गाउँपालिका', 531),
(2722, 'प्यूठान नगरपालिका', 'प्यूठान', 'नगरपालिका', 532),
(2723, 'स्वर्गद्वारी नगरपालिका', 'प्यूठान', 'नगरपालिका', 532),
(2724, 'गौमुखी गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2725, 'माण्डवी गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2726, 'सरुमारानी गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2727, 'मल्लरानी गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2728, 'नौवहिनी गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2729, 'झिमरुक गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2730, 'ऐरावती गाउँपालिका', 'प्यूठान', 'गाउँपालिका', 532),
(2731, 'रोल्पा नगरपालिका', 'रोल्पा', 'नगरपालिका', 533),
(2732, 'त्रिवेणी गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2733, 'दुईखोली गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2734, 'माडी गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2735, 'रुन्टीगढी गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2736, 'लुङग्री गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2737, 'सुकिदह गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2738, 'सुनछहरी गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2739, 'सुवर्णावती गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2740, 'थवाङ गाउँपालिका', 'रोल्पा', 'गाउँपालिका', 533),
(2741, 'पुथा उत्तरगंगा गाउँपालिका', 'रुकुम (पूर्वी भाग)', 'गाउँपालिका', 534),
(2742, 'भूमे गाउँपालिका', 'रुकुम (पूर्वी भाग)', 'गाउँपालिका', 534),
(2743, 'सिस्ने गाउँपालिका', 'रुकुम (पूर्वी भाग)', 'गाउँपालिका', 534),
(2744, 'तुल्सीपुर उपमहानगरपालिका', 'दाङ', 'उपमहानगरपालिका', 535),
(2745, 'घोराही उपमहानगरपालिका', 'दाङ', 'उपमहानगरपालिका', 535),
(2746, 'लमही नगरपालिका', 'दाङ', 'नगरपालिका', 535),
(2747, 'बंगलाचुली गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2748, 'दंगीशरण गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2749, 'गढवा गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2750, 'राजपुर गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2751, 'राप्ती गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2752, 'शान्तिनगर गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2753, 'बबई गाउँपालिका', 'दाङ', 'गाउँपालिका', 535),
(2754, 'नेपालगंज उपमहानगरपालिका', 'बाँके', 'उपमहानगरपालिका', 536),
(2755, 'कोहलपुर नगरपालिका', 'बाँके', 'नगरपालिका', 536),
(2756, 'नरैनापुर गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2757, 'राप्तीसोनारी गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2758, 'बैजनाथ गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2759, 'खजुरा गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2760, 'डुडुवा गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2761, 'जानकी गाउँपालिका', 'बाँके', 'गाउँपालिका', 536),
(2762, 'गुलरिया नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2763, 'मधुवन नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2764, 'राजापुर नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2765, 'ठाकुरबाबा नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2766, 'बाँसगढी नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2767, 'बारबर्दिया नगरपालिका', 'बर्दिया', 'नगरपालिका', 537),
(2768, 'बढैयाताल गाउँपालिका', 'बर्दिया', 'गाउँपालिका', 537),
(2769, 'गेरुवा गाउँपालिका', 'बर्दिया', 'गाउँपालिका', 537),
(2770, 'बर्दघाट नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'नगरपालिका', 538),
(2771, 'रामग्राम नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'नगरपालिका', 538),
(2772, 'सुनवल नगरपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'नगरपालिका', 538),
(2773, 'सुस्ता गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'गाउँपालिका', 538),
(2774, 'पाल्हीनन्दन गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'गाउँपालिका', 538),
(2775, 'प्रतापपुर गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'गाउँपालिका', 538),
(2776, 'सरावल गाउँपालिका', 'नवलपरासी (बर्दघाट सुस्ता पश्चिम)', 'गाउँपालिका', 538),
(2777, 'मुसिकोट नगरपालिका', 'रुकुम (पश्चिम भाग)', 'नगरपालिका', 539),
(2778, 'चौरजहारी नगरपालिका', 'रुकुम (पश्चिम भाग)', 'नगरपालिका', 539),
(2779, 'आठबिसकोट नगरपालिका', 'रुकुम (पश्चिम भाग)', 'नगरपालिका', 539),
(2780, 'बाँफिकोट गाउँपालिका', 'रुकुम (पश्चिम भाग)', 'गाउँपालिका', 539),
(2781, 'त्रिवेणी गाउँपालिका', 'रुकुम (पश्चिम भाग)', 'गाउँपालिका', 539),
(2782, 'सानी भेरी गाउँपालिका', 'रुकुम (पश्चिम भाग)', 'गाउँपालिका', 539),
(2783, 'शारदा नगरपालिका', 'सल्यान', 'नगरपालिका', 540),
(2784, 'बागचौर नगरपालिका', 'सल्यान', 'नगरपालिका', 540),
(2785, 'बनगाड कुपिण्डे नगरपालिका', 'सल्यान', 'नगरपालिका', 540),
(2786, 'कालिमाटी गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2787, 'त्रिवेणी गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2788, 'कपुरकोट गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2789, 'छत्रेश्वरी गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2790, 'ढोरचौर गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2791, 'कुमाखमालिका गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2792, 'दार्मा गाउँपालिका', 'सल्यान', 'गाउँपालिका', 540),
(2793, 'बीरेन्द्रनगर नगरपालिका', 'सुर्खेत', 'नगरपालिका', 541),
(2794, 'भेरीगंगा नगरपालिका', 'सुर्खेत', 'नगरपालिका', 541),
(2795, 'गुर्भाकोट नगरपालिका', 'सुर्खेत', 'नगरपालिका', 541),
(2796, 'पञ्चपुरी नगरपालिका', 'सुर्खेत', 'नगरपालिका', 541),
(2797, 'लेकवेशी नगरपालिका', 'सुर्खेत', 'नगरपालिका', 541),
(2798, 'चौकुने गाउँपालिका', 'सुर्खेत', 'गाउँपालिका', 541),
(2799, 'बराहताल गाउँपालिका', 'सुर्खेत', 'गाउँपालिका', 541),
(2800, 'चिङ्गाड गाउँपालिका', 'सुर्खेत', 'गाउँपालिका', 541),
(2801, 'सिम्ता गाउँपालिका', 'सुर्खेत', 'गाउँपालिका', 541),
(2802, 'नारायण नगरपालिका', 'दैलेख', 'नगरपालिका', 542),
(2803, 'दुल्लु नगरपालिका', 'दैलेख', 'नगरपालिका', 542),
(2804, 'चामुण्डा विन्द्रासैनी नगरपालिका', 'दैलेख', 'नगरपालिका', 542),
(2805, 'आठबीस नगरपालिका', 'दैलेख', 'नगरपालिका', 542),
(2806, 'भगवतीमाई गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2807, 'गुराँस गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2808, 'डुंगेश्वर गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2809, 'नौमुले गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2810, 'महावु गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2811, 'भैरवी गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2812, 'ठाँटीकाँध गाउँपालिका', 'दैलेख', 'गाउँपालिका', 542),
(2813, 'भेरी नगरपालिका', 'जाजरकोट', 'नगरपालिका', 543),
(2814, 'छेडागाड नगरपालिका', 'जाजरकोट', 'नगरपालिका', 543),
(2815, 'त्रिवेणी नलगाड नगरपालिका', 'जाजरकोट', 'नगरपालिका', 543),
(2816, 'बारेकोट गाउँपालिका', 'जाजरकोट', 'गाउँपालिका', 543),
(2817, 'कुसे गाउँपालिका', 'जाजरकोट', 'गाउँपालिका', 543),
(2818, 'जुनीचाँदे गाउँपालिका', 'जाजरकोट', 'गाउँपालिका', 543),
(2819, 'शिवालय गाउँपालिका', 'जाजरकोट', 'गाउँपालिका', 543),
(2820, 'ठुली भेरी नगरपालिका', 'डोल्पा', 'नगरपालिका', 544),
(2821, 'त्रिपुरासुन्दरी नगरपालिका', 'डोल्पा', 'नगरपालिका', 544),
(2822, 'डोल्पो बुद्ध गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2823, 'शे फोक्सुन्डो गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2824, 'जगदुल्ला गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2825, 'मुड्केचुला गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2826, 'काईके गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2827, 'छार्का ताङसोङ गाउँपालिका', 'डोल्पा', 'गाउँपालिका', 544),
(2828, 'चन्दननाथ नगरपालिका', 'जुम्ला', 'नगरपालिका', 545),
(2829, 'कनकासुन्दरी गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2830, 'सिंजा गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2831, 'हिमा गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2832, 'तिला गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2833, 'गुठिचौर गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2834, 'तातोपानी गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2835, 'पातारासी गाउँपालिका', 'जुम्ला', 'गाउँपालिका', 545),
(2836, 'खाँडाचक्र नगरपालिका', 'कालिकोट', 'नगरपालिका', 546),
(2837, 'रास्कोट नगरपालिका', 'कालिकोट', 'नगरपालिका', 546),
(2838, 'तिलागुफा नगरपालिका', 'कालिकोट', 'नगरपालिका', 546),
(2839, 'पचालझरना गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2840, 'सान्नी त्रिवेणी गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2841, 'नरहरिनाथ गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2842, 'कालिका गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2843, 'महावै गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2844, 'पलाता गाउँपालिका', 'कालिकोट', 'गाउँपालिका', 546),
(2845, 'छायाँनाथ रारा नगरपालिका', 'मुगु', 'नगरपालिका', 547),
(2846, 'मुगुम कार्मारोंग गाउँपालिका', 'मुगु', 'गाउँपालिका', 547),
(2847, 'सोरु गाउँपालिका', 'मुगु', 'गाउँपालिका', 547),
(2848, 'खत्याड गाउँपालिका', 'मुगु', 'गाउँपालिका', 547),
(2849, 'सिमकोट गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2850, 'नाम्खा गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2851, 'खार्पुनाथ गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2852, 'सर्केगाड गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2853, 'चंखेली गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2854, 'अदानचुली गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2855, 'ताँजाकोट गाउँपालिका', 'हुम्ला', 'गाउँपालिका', 548),
(2856, 'बडीमालिका नगरपालिका', 'बाजुरा', 'नगरपालिका', 549),
(2857, 'त्रिवेणी नगरपालिका', 'बाजुरा', 'नगरपालिका', 549),
(2858, 'बुढीगंगा नगरपालिका', 'बाजुरा', 'नगरपालिका', 549),
(2859, 'बुढीनन्दा नगरपालिका', 'बाजुरा', 'नगरपालिका', 549),
(2860, 'गौमुल गाउँपालिका', 'बाजुरा', 'गाउँपालिका', 549),
(2861, 'पाण्डव गुफा गाउँपालिका', 'बाजुरा', 'गाउँपालिका', 549),
(2862, 'स्वामीकार्तिक गाउँपालिका', 'बाजुरा', 'गाउँपालिका', 549),
(2863, 'छेडेदह गाउँपालिका', 'बाजुरा', 'गाउँपालिका', 549),
(2864, 'हिमाली गाउँपालिका', 'बाजुरा', 'गाउँपालिका', 549),
(2865, 'जयपृथ्वी नगरपालिका', 'बझाङ', 'नगरपालिका', 550),
(2866, 'बुंगल नगरपालिका', 'बझाङ', 'नगरपालिका', 550),
(2867, 'तलकोट गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2868, 'मष्टा गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2869, 'खप्तडछान्ना गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2870, 'थलारा गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2871, 'वित्थडचिर गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2872, 'सूर्मा गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2873, 'छबिसपाथिभेरा गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2874, 'दुर्गाथली गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2875, 'केदारस्युँ गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2876, 'काँडा गाउँपालिका', 'बझाङ', 'गाउँपालिका', 550),
(2877, 'मंगलसेन नगरपालिका', 'अछाम', 'नगरपालिका', 551),
(2878, 'कमलबजार नगरपालिका', 'अछाम', 'नगरपालिका', 551),
(2879, 'साँफेबगर नगरपालिका', 'अछाम', 'नगरपालिका', 551),
(2880, 'पन्चदेवल विनायक नगरपालिका', 'अछाम', 'नगरपालिका', 551),
(2881, 'चौरपाटी गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2882, 'मेल्लेख गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2883, 'बान्निगढी जयगढ गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2884, 'रामारोशन गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2885, 'ढकारी गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2886, 'तुर्माखाँद गाउँपालिका', 'अछाम', 'गाउँपालिका', 551),
(2887, 'दिपायल सिलगढी नगरपालिका', 'डोटी', 'नगरपालिका', 552),
(2888, 'शिखर नगरपालिका', 'डोटी', 'नगरपालिका', 552),
(2889, 'पूर्वीचौकी गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2890, 'बडीकेदार गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2891, 'जोरायल गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2892, 'सायल गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2893, 'आदर्श गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2894, 'के.आई.सिं. गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2895, 'बोगटान गाउँपालिका', 'डोटी', 'गाउँपालिका', 552),
(2896, 'धनगढी उपमहानगरपालिका', 'कैलाली', 'उपमहानगरपालिका', 553),
(2897, 'टिकापुर नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2898, 'घोडाघोडी नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2899, 'लम्कीचुहा नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2900, 'भजनी नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2901, 'गोदावरी नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2902, 'गौरीगंगा नगरपालिका', 'कैलाली', 'नगरपालिका', 553),
(2903, 'जानकी गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2904, 'बर्दगोरिया गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2905, 'मोहन्याल गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2906, 'कैलारी गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2907, 'जोशीपुर गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2908, 'चुरे गाउँपालिका', 'कैलाली', 'गाउँपालिका', 553),
(2909, 'भीमदत्त नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2910, 'पुर्नवास नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2911, 'वेदकोट नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2912, 'महाकाली नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2913, 'शुक्लाफाँटा नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2914, 'बेलौरी नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2915, 'कृष्णपुर नगरपालिका', 'कञ्चनपुर', 'नगरपालिका', 554),
(2916, 'बेलडाडी गाउँपालिका', 'कञ्चनपुर', 'गाउँपालिका', 554),
(2917, 'लालझाडी गाउँपालिका', 'कञ्चनपुर', 'गाउँपालिका', 554),
(2918, 'अमरगढी नगरपालिका', 'डडेलधुरा', 'नगरपालिका', 555),
(2919, 'परशुराम नगरपालिका', 'डडेलधुरा', 'नगरपालिका', 555),
(2920, 'आलिताल गाउँपालिका', 'डडेलधुरा', 'गाउँपालिका', 555),
(2921, 'भागेश्वर गाउँपालिका', 'डडेलधुरा', 'गाउँपालिका', 555),
(2922, 'नवदुर्गा गाउँपालिका', 'डडेलधुरा', 'गाउँपालिका', 555),
(2923, 'अजयमेरु गाउँपालिका', 'डडेलधुरा', 'गाउँपालिका', 555),
(2924, 'गन्यापधुरा गाउँपालिका', 'डडेलधुरा', 'गाउँपालिका', 555),
(2925, 'दशरथचन्द नगरपालिका', 'बैतडी', 'नगरपालिका', 556),
(2926, 'पाटन नगरपालिका', 'बैतडी', 'नगरपालिका', 556),
(2927, 'मेलौली नगरपालिका', 'बैतडी', 'नगरपालिका', 556),
(2928, 'पुर्चौडी नगरपालिका', 'बैतडी', 'नगरपालिका', 556),
(2929, 'सुर्नया गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2930, 'सिगास गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2931, 'शिवनाथ गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2932, 'पञ्चेश्वर गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2933, 'दोगडाकेदार गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2934, 'डीलासैनी गाउँपालिका', 'बैतडी', 'गाउँपालिका', 556),
(2935, 'महाकाली नगरपालिका', 'दार्चुला', 'नगरपालिका', 557),
(2936, 'शैल्यशिखर नगरपालिका', 'दार्चुला', 'नगरपालिका', 557),
(2937, 'मालिकार्जुन गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2938, 'अपिहिमाल गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2939, 'दुहुँ गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2940, 'नौगाड गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2941, 'मार्मा गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2942, 'लेकम गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2943, 'ब्याँस गाउँपालिका', 'दार्चुला', 'गाउँपालिका', 557),
(2944, 'नमुना नगरपालिका', 'ताप्लेजुङ', 'नगरपालिका', 481);

-- --------------------------------------------------------

--
-- Table structure for table `settings_ward`
--

CREATE TABLE IF NOT EXISTS `settings_ward` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings_ward`
--

INSERT INTO `settings_ward` (`id`, `name`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `settings_year`
--

CREATE TABLE IF NOT EXISTS `settings_year` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL
) ENGINE=MyISAM AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `settings_year`
--

INSERT INTO `settings_year` (`id`, `name`) VALUES
(1, 2050),
(2, 2051),
(3, 2052),
(4, 2053),
(5, 2054),
(6, 2055),
(7, 2056),
(8, 2057),
(9, 2058),
(10, 2059),
(11, 2060),
(12, 2061),
(13, 2062),
(14, 2063),
(15, 2064),
(16, 2065),
(17, 2066),
(18, 2067),
(19, 2068),
(20, 2069),
(21, 2070),
(22, 2071),
(23, 2072),
(24, 2073),
(25, 2074),
(26, 2075),
(27, 2076),
(28, 2077);

-- --------------------------------------------------------

--
-- Table structure for table `set_up`
--

CREATE TABLE IF NOT EXISTS `set_up` (
  `id` int(11) NOT NULL,
  `palika_name` varchar(255) NOT NULL,
  `palika_name_en` varchar(255) NOT NULL,
  `karay_palika_np` varchar(255) NOT NULL,
  `karay_palika_en` varchar(255) NOT NULL,
  `state_np` varchar(255) NOT NULL,
  `state_en` varchar(255) NOT NULL,
  `district_np` varchar(255) NOT NULL,
  `district_en` varchar(255) NOT NULL,
  `office_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `office_address_en` varchar(255) DEFAULT NULL,
  `sarkar_logo` varchar(255) NOT NULL,
  `palika_logo` varchar(255) NOT NULL,
  `palika_slogan` varchar(255) NOT NULL,
  `palika_slogan_en` varchar(255) NOT NULL,
  `website` varchar(255) NOT NULL,
  `phone_no` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `facebook` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Dumping data for table `set_up`
--

INSERT INTO `set_up` (`id`, `palika_name`, `palika_name_en`, `karay_palika_np`, `karay_palika_en`, `state_np`, `state_en`, `district_np`, `district_en`, `office_address`, `office_address_en`, `sarkar_logo`, `palika_logo`, `palika_slogan`, `palika_slogan_en`, `website`, `phone_no`, `email`, `facebook`, `created_at`) VALUES
(1, 'गल्छी गाउँपालिका', 'Galchhi Rural Municipality', 'गाउँ कार्यपालिकाको कार्यालय', 'Office Of Rural Municipality', 'बागमती प्रदेश', 'Bagmati Provience', 'धादिङ', 'Dhading', 'बैरेनी', 'Baireni', '', '', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"', '""', 'https://galchhimun.gov.np/', 1, 'galchhimun@gmail.com', 'facebook.com', '2023-01-01 02:51:51pm');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE IF NOT EXISTS `staff` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `designation` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `status` enum('1','2') NOT NULL DEFAULT '1' COMMENT '''1= active, 2=inactive''',
  `remarks` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`id`, `name`, `designation`, `mobile`, `email`, `status`, `remarks`) VALUES
(1, 'नर बहादुर विश्वकर्मा', 'प्रमुख प्रशासकीय अधिकृत', '9851105982', 'narbdrbk84@gmail.com', '1', ''),
(4, 'किरण गिरी', 'प्राविधिक सहायक', '9844269456', 'kgiri6145@gmail.com', '1', 'कृषि विकास शाखा प्रमुख '),
(5, 'पूर्ण प्रसाद तिवारी', 'अधिकृत छैठौ‌', '9849226094', 'purnatiwariskt@gmail.com', '1', 'शाखा प्रमूख');

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE IF NOT EXISTS `topic` (
  `id` int(11) NOT NULL,
  `main_topic` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `topic_no` varchar(15) NOT NULL,
  `sub_topic` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `rate` varchar(15) DEFAULT NULL,
  `parent_id` int(11) NOT NULL,
  `is_percentage` tinyint(1) DEFAULT NULL,
  `fiscal_year` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=499 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `main_topic`, `topic_no`, `sub_topic`, `rate`, `parent_id`, `is_percentage`, `fiscal_year`) VALUES
(1, '1', '14253', 'होटेल/लज/रेष्टुरेन्ट', NULL, 1, NULL, '2077/078'),
(2, '1', '14253', 'मासु पसल', NULL, 1, NULL, '2077/078'),
(3, '1', '14253', 'मदिरा पसल', NULL, 1, NULL, '2077/078'),
(4, '1', '14253', 'कोल्ड ड्रिंक्स पसल', NULL, 1, NULL, '2077/078'),
(5, '1', '14253', 'सुन चांदी गहना पसल', NULL, 1, NULL, '2077/078'),
(6, '1', '14253', 'ईलेक्ट्रोनिक्स पसल', NULL, 1, NULL, '2077/078'),
(7, '1', '14253', 'स्विमिङ्गपूल', NULL, 1, NULL, '2077/078'),
(8, '1', '14253', 'माटो सिमेन्टका भांडा तथा मगला बनाउने', NULL, 1, NULL, '2077/078'),
(9, '1', '14253', 'केबल टि.भि. सेवा प्रदायक', NULL, 1, NULL, '2077/078'),
(10, '1', '14253', 'फोटो स्टुडियो', NULL, 1, NULL, '2077/078'),
(11, '1', '14253', 'हजाम', NULL, 1, NULL, '2077/078'),
(12, '1', '14253', 'टेलरिङ्ग', NULL, 1, NULL, '2077/078'),
(13, '1', '14253', 'जुत्ता पसल', NULL, 1, NULL, '2077/078'),
(14, '1', '14253', 'मोटर वर्कशप', NULL, 1, NULL, '2077/078'),
(15, '1', '14253', 'छापाखाना', NULL, 1, NULL, '2077/078'),
(16, '1', '14253', 'स्वास्थ्य सेवा', NULL, 1, NULL, '2077/078'),
(17, '1', '14253', 'मेटल वर्कशप', NULL, 1, NULL, '2077/078'),
(18, '1', '14253', 'काष्ठ उद्योग', NULL, 1, NULL, '2077/078'),
(19, '1', '14253', 'ईट्टा भट्टा ईट्टा डिपो', NULL, 1, NULL, '2077/078'),
(20, '1', '14253', 'कम्प्यूटर ईन्ष्टिच्यूट', NULL, 1, NULL, '2077/078'),
(21, '1', '14253', 'नर्सरी', NULL, 1, NULL, '2077/078'),
(22, '1', '14253', 'पान पसल', NULL, 1, NULL, '2077/078'),
(23, '1', '14253', 'बेकरी उद्योग/पसल', NULL, 1, NULL, '2077/078'),
(24, '1', '14253', 'तरकारी तथा फलफूल', NULL, 1, NULL, '2077/078'),
(25, '1', '14253', 'चित्रा पसल', NULL, 1, NULL, '2077/078'),
(26, '1', '14253', 'मिलहरु', NULL, 1, NULL, '2077/078'),
(27, '12', '11691', 'ढुंगा , गिट्टी ,बालुवा, माटो अन्य  सामग्री संकलन वा कवाडी वस्तु', NULL, 12, NULL, '2077/078'),
(28, '12', '11691', 'साधारण निर्माणजन्य सामग्री', NULL, 12, NULL, '2077/078'),
(34, '2', '11472', 'ठेक्कामा परेका', NULL, 2, NULL, '2077/078'),
(35, '2', '11472', 'ठेक्कामा नपरेका', NULL, 2, NULL, '2077/078'),
(36, '4', '14265', 'सरसफाई शुल्क', NULL, 4, NULL, '2077/078'),
(37, '4', '14265', 'बसपार्क प्रवेश शुल्क', NULL, 4, NULL, '2077/078'),
(38, '4', '14244', 'पञ्जीकरण दर्ता दस्तुर', NULL, 4, NULL, '2077/078'),
(39, '4', '14242', 'घर निर्माण नक्सापास दस्तुर', NULL, 4, NULL, '2077/078'),
(40, '4', '14243', 'चार किल्ला प्रमाणित दस्तुर', NULL, 4, NULL, '2077/078'),
(41, '4', '14229', 'निवेदन दस्तुर', NULL, 4, NULL, '2077/078'),
(42, '4', '14229', 'प्रतिलिपी दस्तुर', NULL, 4, NULL, '2077/078'),
(43, '4', '14243', 'सिफारिस दस्तुर', NULL, 4, NULL, '2077/078'),
(44, '4', '14229', 'अन्य शुल्क', NULL, 4, NULL, '2077/078'),
(45, '13', '14151', 'नगरपालिकामा रहेको हल तथा प्रोजेक्टर प्रयोग गरे वापत कर', NULL, 13, NULL, '2077/078'),
(46, '15', '14249', 'व्यवस्थित पार्किङ्ग', NULL, 15, NULL, '2077/078'),
(47, '15', '14249', 'नगरपालिका क्षेत्रभित्र पार्किङ्ग', NULL, 15, NULL, '2077/078'),
(48, '16', '14253', 'सिनेमा हल', NULL, 16, NULL, '2077/078'),
(49, '16', '11479', 'विदेशी चलचित्र सुटिङ्ग', NULL, 16, NULL, '2077/078'),
(50, '16', '11479', 'नेपाली ठूलो पर्दाको सुटिङ्ग', NULL, 16, NULL, '2077/078'),
(51, '16', '11479', 'नेपाली टेलिचलचित्र सुटिङ्ग', NULL, 16, NULL, '2077/078'),
(52, '16', '11479', 'म्यूजिक भिडियो सुटिङ्ग', NULL, 16, NULL, '2077/078'),
(53, '16', '11479', 'व्यवसायीक टि.भि. सञ्चालन', NULL, 16, NULL, '2077/078'),
(56, '1', '14253', 'डिलर', NULL, 1, NULL, '2077/078'),
(57, '1', '14253', 'साईकल भाडा तथा मर्मत', NULL, 1, NULL, '2077/078'),
(58, '1', '14253', 'निर्माण व्यवसायी', NULL, 1, NULL, '2077/078'),
(59, '1', '14253', 'कपडा पसल', NULL, 1, NULL, '2077/078'),
(60, '1', '14253', 'किराना  पसल', NULL, 1, NULL, '2077/078'),
(61, '1', '14253', 'खाद्य पसल', NULL, 1, NULL, '2077/078'),
(62, '1', '14253', 'भांडा पसल', NULL, 1, NULL, '2077/078'),
(63, '1', '14253', 'चुरा धागाे तथा श्रृङ्गार', NULL, 1, NULL, '2077/078'),
(64, '1', '14253', 'कुखुरा पालन', NULL, 1, NULL, '2077/078'),
(65, '1', '14253', 'तयारी पोशाक', NULL, 1, NULL, '2077/078'),
(66, '1', '14253', 'तयारी जुत्ता पसल', NULL, 1, NULL, '2077/078'),
(67, '1', '14253', 'दन्त क्लिनिक', NULL, 1, NULL, '2077/078'),
(68, '1', '14253', 'हार्डवेयर', NULL, 1, NULL, '2077/078'),
(69, '1', '14253', 'ईलेक्ट्रिक पसल', NULL, 1, NULL, '2077/078'),
(70, '1', '14253', 'कानुनी फर्म', NULL, 1, NULL, '2077/078'),
(71, '1', '14253', 'साईन वोर्ड पेन्टिङ्ग', NULL, 1, NULL, '2077/078'),
(72, '1', '14253', 'फर्निचर एण्ड फर्निसिङ्ग/सिसा पसल', NULL, 1, NULL, '2077/078'),
(73, '1', '14253', 'स्टेशनरी पसल', NULL, 1, NULL, '2077/078'),
(74, '1', '14253', 'अण्डाको क्रेट बनाउने', NULL, 1, NULL, '2077/078'),
(75, '1', '14253', 'लेखा परीक्षक', NULL, 1, NULL, '2077/078'),
(76, '1', '14253', 'जिपफ्लायर', NULL, 1, NULL, '2077/078'),
(77, '1', '14253', 'यातायात कम्पनी', NULL, 1, NULL, '2077/078'),
(78, '1', '14253', 'विज्ञापन सेवा वा एजेन्ट', NULL, 1, NULL, '2077/078'),
(79, '1', '14253', 'पशु वधशाला', NULL, 1, NULL, '2077/078'),
(80, '1', '14253', 'अन्तर्राष्ट्रिय गैरसरकारी संस्था', NULL, 1, NULL, '2077/078'),
(81, '1', '14253', 'राष्ट्रिया /स्थानीय गैरसरकारी संस्था ', NULL, 1, NULL, '2077/078'),
(82, '1', '14253', 'वित्तीय सेवा', NULL, 1, NULL, '2077/078'),
(83, '1', '14253', 'बीमा कम्पनी/सेवा', NULL, 1, NULL, '2077/078'),
(84, '1', '14253', 'सिनेमा हल', NULL, 1, NULL, '2077/078'),
(85, '1', '14253', 'चस्मा पसल', NULL, 1, NULL, '2077/078'),
(86, '1', '14253', 'शिलाइ मेशिन विक्री तथा मर्मत पसल ', NULL, 1, NULL, '2077/078'),
(87, '1', '14253', 'डेरी उद्योग', NULL, 1, NULL, '2077/078'),
(88, '1', '14253', 'दुग्ध डिपो/पसल', NULL, 1, NULL, '2077/078'),
(89, '1', '14253', 'ब्यूटी पार्लर', NULL, 1, NULL, '2077/078'),
(90, '1', '14253', 'विभिन्न सप्लायर्श', NULL, 1, NULL, '2077/078'),
(91, '1', '14253', 'टेलिफोन टावर राखि संचार सेवा उपलब्ध गरउने', NULL, 1, NULL, '2077/078'),
(92, '1', '14253', 'जग्गा विकास / हाउजिङ्ग', NULL, 1, NULL, '2077/078'),
(93, '1', '14253', 'म्यानपावर सेवा', NULL, 1, NULL, '2077/078'),
(94, '1', '14253', 'क्याट्रिङ्ग सेवा', NULL, 1, NULL, '2077/078'),
(95, '1', '14253', 'सहकारी', NULL, 1, NULL, '2077/078'),
(96, '1', '14253', 'मार्वल/टायल पसल', NULL, 1, NULL, '2077/078'),
(97, '1', '14253', 'सवारी साधनको शो रुम', NULL, 1, NULL, '2077/078'),
(98, '1', '14253', 'कृषि सामग्री/भेटेनरी पसल', NULL, 1, NULL, '2077/078'),
(99, '1', '14253', 'आईसक्रिम पसल', NULL, 1, NULL, '2077/078'),
(100, '1', '14253', 'दाना उद्योग', NULL, 1, NULL, '2077/078'),
(101, '1', '14253', 'तारजाली बनाउने उद्योग ', NULL, 1, NULL, '2077/078'),
(102, '1', '14253', 'कृषि व्यवसाय ', NULL, 1, NULL, '2077/078'),
(103, '1', '14253', 'ब्लक उद्योग ', NULL, 1, NULL, '2077/078'),
(104, '1', '14253', 'मिनरल वाटर उद्योग', NULL, 1, NULL, '2077/078'),
(105, '1', '14253', 'पानी ट्यांकर ', NULL, 1, NULL, '2077/078'),
(106, '1', '14253', 'ग्यास डिपो ', NULL, 1, NULL, '2077/078'),
(107, '1', '14253', 'कोल्डस्टोर (शितभणडार)', NULL, 1, NULL, '2077/078'),
(108, '1', '14253', 'तालिम तथा अनुसन्धान केन्द्र, कम्प्युटर टाईपिङ्ग, भाषा प्रशिक्षण लगाएतका संस्था', NULL, 1, NULL, '2077/078'),
(109, '1', '14253', 'विशेष तयारी कक्षा', NULL, 1, NULL, '2077/078'),
(110, '1', '14253', 'पूर्व प्राथमिक विद्यालय', NULL, 1, NULL, '2077/078'),
(111, '1', '14253', 'निजी आभारभुत विद्यालय', NULL, 1, NULL, '2077/078'),
(112, '1', '14253', 'निजी माद्यामिक विद्यालय', NULL, 1, NULL, '2077/078'),
(113, '1', '14253', 'निजि क्याम्पस, कलेज', NULL, 1, NULL, '2077/078'),
(114, '1', '14253', 'विश्व विद्यालय', NULL, 1, NULL, '2077/078'),
(115, '1', '14253', 'फुटसल', NULL, 1, NULL, '2077/078'),
(116, '1', '14253', 'स्नूकर हाउस', NULL, 1, NULL, '2077/078'),
(117, '1', '14253', 'जिम/फिटनेस सेन्टर', NULL, 1, NULL, '2077/078'),
(118, '1', '14253', 'ट्रान्सपोर्ट कम्पनी', NULL, 1, NULL, '2077/078'),
(119, '1', '14253', 'कलाकेन्द्र/ईभेन्टम्यानेजमेन्ट', NULL, 1, NULL, '2077/078'),
(120, '1', '14253', 'भाषा सिकाई केन्द्र', NULL, 1, NULL, '2077/078'),
(121, '1', '14253', 'विशेषज्ञ, परामर्श सेवा', NULL, 1, NULL, '2077/078'),
(122, '1', '14253', 'प्राईभेट फर्म', NULL, 1, NULL, '2077/078'),
(123, '1', '14253', 'साझेदारी फर्म', NULL, 1, NULL, '2077/078'),
(126, '16', '11479', 'व्यवसायिक टि.भि.च्यानल उपयोग गर्ने ग्राहक', NULL, 16, NULL, '2077/078'),
(127, '14', '11691', 'विद्युत र टेलिफाेन प्रसारणकाे लाइन', NULL, 14, NULL, '2077/078'),
(128, '17', '11321', 'घरबहाल कर', NULL, 17, NULL, '2077/078'),
(129, '4', '14245', 'नाता प्रमाणित', NULL, 4, NULL, '2077/078'),
(370, '27', '14253', 'होटेल/लज/रेष्टुरेन्ट', NULL, 27, NULL, '2078/079'),
(371, '27', '14253', 'मासु पसल', NULL, 27, NULL, '2078/079'),
(372, '27', '14253', 'मदिरा पसल', NULL, 27, NULL, '2078/079'),
(373, '27', '14253', 'कोल्ड ड्रिंक्स पसल', NULL, 27, NULL, '2078/079'),
(374, '27', '14253', 'सुन चांदी गहना पसल', NULL, 27, NULL, '2078/079'),
(375, '27', '14253', 'ईलेक्ट्रोनिक्स पसल', NULL, 27, NULL, '2078/079'),
(376, '27', '14253', 'स्विमिङ्गपूल', NULL, 27, NULL, '2078/079'),
(377, '27', '14253', 'माटो सिमेन्टका भांडा तथा मगला बनाउने', NULL, 27, NULL, '2078/079'),
(378, '27', '14253', 'केबल टि.भि. सेवा प्रदायक', NULL, 27, NULL, '2078/079'),
(379, '27', '14253', 'फोटो स्टुडियो', NULL, 27, NULL, '2078/079'),
(380, '27', '14253', 'हजाम', NULL, 27, NULL, '2078/079'),
(381, '27', '14253', 'टेलरिङ्ग', NULL, 27, NULL, '2078/079'),
(382, '27', '14253', 'जुत्ता पसल', NULL, 27, NULL, '2078/079'),
(383, '27', '14253', 'मोटर वर्कशप', NULL, 27, NULL, '2078/079'),
(384, '27', '14253', 'छापाखाना', NULL, 27, NULL, '2078/079'),
(385, '27', '14253', 'स्वास्थ्य सेवा', NULL, 27, NULL, '2078/079'),
(386, '27', '14253', 'मेटल वर्कशप', NULL, 27, NULL, '2078/079'),
(387, '27', '14253', 'काष्ठ उद्योग', NULL, 27, NULL, '2078/079'),
(388, '27', '14253', 'ईट्टा भट्टा ईट्टा डिपो', NULL, 27, NULL, '2078/079'),
(389, '27', '14253', 'कम्प्यूटर ईन्ष्टिच्यूट', NULL, 27, NULL, '2078/079'),
(390, '27', '14253', 'नर्सरी', NULL, 27, NULL, '2078/079'),
(391, '27', '14253', 'पान पसल', NULL, 27, NULL, '2078/079'),
(392, '27', '14253', 'बेकरी उद्योग/पसल', NULL, 27, NULL, '2078/079'),
(393, '27', '14253', 'तरकारी तथा फलफूल', NULL, 27, NULL, '2078/079'),
(394, '27', '14253', 'चित्रा पसल', NULL, 27, NULL, '2078/079'),
(395, '27', '14253', 'मिलहरु', NULL, 27, NULL, '2078/079'),
(396, '30', '11691', 'ढुंगा , गिट्टी ,बालुवा, माटो अन्य  सामग्री संकलन वा कवाडी वस्तु', NULL, 30, NULL, '2078/079'),
(397, '30', '11691', 'साधारण निर्माणजन्य सामग्री', NULL, 30, NULL, '2078/079'),
(398, '28', '11472', 'ठेक्कामा परेका', NULL, 28, NULL, '2078/079'),
(399, '28', '11472', 'ठेक्कामा नपरेका', NULL, 28, NULL, '2078/079'),
(400, '29', '14265', 'सरसफाई शुल्क', NULL, 29, NULL, '2078/079'),
(401, '29', '14265', 'बसपार्क प्रवेश शुल्क', NULL, 29, NULL, '2078/079'),
(402, '29', '14244', 'पञ्जीकरण दर्ता दस्तुर', NULL, 29, NULL, '2078/079'),
(403, '29', '14242', 'घर निर्माण नक्सापास दस्तुर', NULL, 29, NULL, '2078/079'),
(404, '29', '14243', 'चार किल्ला प्रमाणित दस्तुर', NULL, 29, NULL, '2078/079'),
(405, '29', '14229', 'निवेदन दस्तुर', NULL, 29, NULL, '2078/079'),
(406, '29', '14229', 'प्रतिलिपी दस्तुर', NULL, 29, NULL, '2078/079'),
(407, '29', '14243', 'सिफारिस दस्तुर', NULL, 29, NULL, '2078/079'),
(408, '29', '14229', 'अन्य शुल्क', NULL, 29, NULL, '2078/079'),
(409, '31', '14151', 'नगरपालिकामा रहेको हल तथा प्रोजेक्टर प्रयोग गरे वापत कर', NULL, 31, NULL, '2078/079'),
(410, '33', '14249', 'व्यवस्थित पार्किङ्ग', NULL, 33, NULL, '2078/079'),
(411, '33', '14249', 'नगरपालिका क्षेत्रभित्र पार्किङ्ग', NULL, 33, NULL, '2078/079'),
(412, '34', '14253', 'सिनेमा हल', NULL, 34, NULL, '2078/079'),
(413, '34', '11479', 'विदेशी चलचित्र सुटिङ्ग', NULL, 34, NULL, '2078/079'),
(414, '34', '11479', 'नेपाली ठूलो पर्दाको सुटिङ्ग', NULL, 34, NULL, '2078/079'),
(415, '34', '11479', 'नेपाली टेलिचलचित्र सुटिङ्ग', NULL, 34, NULL, '2078/079'),
(416, '34', '11479', 'म्यूजिक भिडियो सुटिङ्ग', NULL, 34, NULL, '2078/079'),
(417, '34', '11479', 'व्यवसायीक टि.भि. सञ्चालन', NULL, 34, NULL, '2078/079'),
(418, '27', '14253', 'डिलर', NULL, 27, NULL, '2078/079'),
(419, '27', '14253', 'साईकल भाडा तथा मर्मत', NULL, 27, NULL, '2078/079'),
(420, '27', '14253', 'निर्माण व्यवसायी', NULL, 27, NULL, '2078/079'),
(421, '27', '14253', 'कपडा पसल', NULL, 27, NULL, '2078/079'),
(422, '27', '14253', 'किराना  पसल', NULL, 27, NULL, '2078/079'),
(423, '27', '14253', 'खाद्य पसल', NULL, 27, NULL, '2078/079'),
(424, '27', '14253', 'भांडा पसल', NULL, 27, NULL, '2078/079'),
(425, '27', '14253', 'चुरा धागाे तथा श्रृङ्गार', NULL, 27, NULL, '2078/079'),
(426, '27', '14253', 'कुखुरा पालन', NULL, 27, NULL, '2078/079'),
(427, '27', '14253', 'तयारी पोशाक', NULL, 27, NULL, '2078/079'),
(428, '27', '14253', 'तयारी जुत्ता पसल', NULL, 27, NULL, '2078/079'),
(429, '27', '14253', 'दन्त क्लिनिक', NULL, 27, NULL, '2078/079'),
(430, '27', '14253', 'हार्डवेयर', NULL, 27, NULL, '2078/079'),
(431, '27', '14253', 'ईलेक्ट्रिक पसल', NULL, 27, NULL, '2078/079'),
(432, '27', '14253', 'कानुनी फर्म', NULL, 27, NULL, '2078/079'),
(433, '27', '14253', 'साईन वोर्ड पेन्टिङ्ग', NULL, 27, NULL, '2078/079'),
(434, '27', '14253', 'फर्निचर एण्ड फर्निसिङ्ग/सिसा पसल', NULL, 27, NULL, '2078/079'),
(435, '27', '14253', 'स्टेशनरी पसल', NULL, 27, NULL, '2078/079'),
(436, '27', '14253', 'अण्डाको क्रेट बनाउने', NULL, 27, NULL, '2078/079'),
(437, '27', '14253', 'लेखा परीक्षक', NULL, 27, NULL, '2078/079'),
(438, '27', '14253', 'जिपफ्लायर', NULL, 27, NULL, '2078/079'),
(439, '27', '14253', 'यातायात कम्पनी', NULL, 27, NULL, '2078/079'),
(440, '27', '14253', 'विज्ञापन सेवा वा एजेन्ट', NULL, 27, NULL, '2078/079'),
(441, '27', '14253', 'पशु वधशाला', NULL, 27, NULL, '2078/079'),
(442, '27', '14253', 'अन्तर्राष्ट्रिय गैरसरकारी संस्था', NULL, 27, NULL, '2078/079'),
(443, '27', '14253', 'राष्ट्रिया /स्थानीय गैरसरकारी संस्था ', NULL, 27, NULL, '2078/079'),
(444, '27', '14253', 'वित्तीय सेवा', NULL, 27, NULL, '2078/079'),
(445, '27', '14253', 'बीमा कम्पनी/सेवा', NULL, 27, NULL, '2078/079'),
(446, '27', '14253', 'सिनेमा हल', NULL, 27, NULL, '2078/079'),
(447, '27', '14253', 'चस्मा पसल', NULL, 27, NULL, '2078/079'),
(448, '27', '14253', 'शिलाइ मेशिन विक्री तथा मर्मत पसल ', NULL, 27, NULL, '2078/079'),
(449, '27', '14253', 'डेरी उद्योग', NULL, 27, NULL, '2078/079'),
(450, '27', '14253', 'दुग्ध डिपो/पसल', NULL, 27, NULL, '2078/079'),
(451, '27', '14253', 'ब्यूटी पार्लर', NULL, 27, NULL, '2078/079'),
(452, '27', '14253', 'विभिन्न सप्लायर्श', NULL, 27, NULL, '2078/079'),
(453, '27', '14253', 'टेलिफोन टावर राखि संचार सेवा उपलब्ध गरउने', NULL, 27, NULL, '2078/079'),
(454, '27', '14253', 'जग्गा विकास / हाउजिङ्ग', NULL, 27, NULL, '2078/079'),
(455, '27', '14253', 'म्यानपावर सेवा', NULL, 27, NULL, '2078/079'),
(456, '27', '14253', 'क्याट्रिङ्ग सेवा', NULL, 27, NULL, '2078/079'),
(457, '27', '14253', 'सहकारी', NULL, 27, NULL, '2078/079'),
(458, '27', '14253', 'मार्वल/टायल पसल', NULL, 27, NULL, '2078/079'),
(459, '27', '14253', 'सवारी साधनको शो रुम', NULL, 27, NULL, '2078/079'),
(460, '27', '14253', 'कृषि सामग्री/भेटेनरी पसल', NULL, 27, NULL, '2078/079'),
(461, '27', '14253', 'आईसक्रिम पसल', NULL, 27, NULL, '2078/079'),
(462, '27', '14253', 'दाना उद्योग', NULL, 27, NULL, '2078/079'),
(463, '27', '14253', 'तारजाली बनाउने उद्योग ', NULL, 27, NULL, '2078/079'),
(464, '27', '14253', 'कृषि व्यवसाय ', NULL, 27, NULL, '2078/079'),
(465, '27', '14253', 'ब्लक उद्योग ', NULL, 27, NULL, '2078/079'),
(466, '27', '14253', 'मिनरल वाटर उद्योग', NULL, 27, NULL, '2078/079'),
(467, '27', '14253', 'पानी ट्यांकर ', NULL, 27, NULL, '2078/079'),
(468, '27', '14253', 'ग्यास डिपो ', NULL, 27, NULL, '2078/079'),
(469, '27', '14253', 'कोल्डस्टोर (शितभणडार)', NULL, 27, NULL, '2078/079'),
(470, '27', '14253', 'तालिम तथा अनुसन्धान केन्द्र, कम्प्युटर टाईपिङ्ग, भाषा प्रशिक्षण लगाएतका संस्था', NULL, 27, NULL, '2078/079'),
(471, '27', '14253', 'विशेष तयारी कक्षा', NULL, 27, NULL, '2078/079'),
(472, '27', '14253', 'पूर्व प्राथमिक विद्यालय', NULL, 27, NULL, '2078/079'),
(473, '27', '14253', 'निजी आभारभुत विद्यालय', NULL, 27, NULL, '2078/079'),
(474, '27', '14253', 'निजी माद्यामिक विद्यालय', NULL, 27, NULL, '2078/079'),
(475, '27', '14253', 'निजि क्याम्पस, कलेज', NULL, 27, NULL, '2078/079'),
(476, '27', '14253', 'विश्व विद्यालय', NULL, 27, NULL, '2078/079'),
(477, '27', '14253', 'फुटसल', NULL, 27, NULL, '2078/079'),
(478, '27', '14253', 'स्नूकर हाउस', NULL, 27, NULL, '2078/079'),
(479, '27', '14253', 'जिम/फिटनेस सेन्टर', NULL, 27, NULL, '2078/079'),
(480, '27', '14253', 'ट्रान्सपोर्ट कम्पनी', NULL, 27, NULL, '2078/079'),
(481, '27', '14253', 'कलाकेन्द्र/ईभेन्टम्यानेजमेन्ट', NULL, 27, NULL, '2078/079'),
(482, '27', '14253', 'भाषा सिकाई केन्द्र', NULL, 27, NULL, '2078/079'),
(483, '27', '14253', 'विशेषज्ञ, परामर्श सेवा', NULL, 27, NULL, '2078/079'),
(484, '27', '14253', 'प्राईभेट फर्म', NULL, 27, NULL, '2078/079'),
(485, '27', '14253', 'साझेदारी फर्म', NULL, 27, NULL, '2078/079'),
(486, '34', '11479', 'व्यवसायिक टि.भि.च्यानल उपयोग गर्ने ग्राहक', NULL, 34, NULL, '2078/079'),
(487, '32', '11691', 'विद्युत र टेलिफाेन प्रसारणकाे लाइन', NULL, 32, NULL, '2078/079'),
(488, '35', '11321', 'घरबहाल कर', NULL, 35, NULL, '2078/079'),
(489, '29', '14245', 'नाता प्रमाणित', NULL, 29, NULL, '2078/079'),
(490, '29', '14229', 'स्वास्थ्य संस्था प्रयोगशाला ', NULL, 29, NULL, '2078/079'),
(494, '29', '14223', 'शिक्षा क्षेत्रको शुल्क तथा दस्तुर', NULL, 29, NULL, '2078/079'),
(495, '36', '14229', 'दर्ता / नविकरण', NULL, 36, NULL, '2078/079'),
(496, '36', '14249', 'जरिवाना', NULL, 36, NULL, '2078/079'),
(497, '27', '14253', 'वाणिज्य दर्ता तर्फ', NULL, 27, NULL, '2078/079'),
(498, '27', '14253', 'उद्याेग दर्ता तर्फ', NULL, 27, NULL, '2078/079');

-- --------------------------------------------------------

--
-- Table structure for table `trans_log`
--

CREATE TABLE IF NOT EXISTS `trans_log` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `module_link` varchar(255) NOT NULL,
  `user_action` varchar(255) NOT NULL,
  `trans_log_date_ad` varchar(25) NOT NULL,
  `trans_log_date_nepali` varchar(25) NOT NULL,
  `trans_log_ip` varchar(255) NOT NULL,
  `module_code` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `trans_log`
--

INSERT INTO `trans_log` (`id`, `user_id`, `module_link`, `user_action`, `trans_log_date_ad`, `trans_log_date_nepali`, `trans_log_ip`, `module_code`) VALUES
(1, 4, 'Users/Add', 'user created', '2081-02-15', '2024-05-28', '', 'USERS'),
(2, 4, 'Users/Add', 'user created', '2081-04-15', '2024-07-30', '', 'USERS'),
(3, 4, 'Users/Add', 'user created', '2081-04-16', '2024-07-31', '', 'USERS'),
(4, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(5, 4, 'Users/updateUsers', 'Edit user', '2081-04-22', '2024-08-06', '', 'USERS'),
(6, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(7, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(8, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(9, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(10, 4, 'Users/Add', 'user created', '2081-04-22', '2024-08-06', '', 'USERS'),
(11, 4, 'Users/updateUsers', 'Edit user', '2081-04-27', '2024-08-11', '', 'USERS'),
(12, 4, 'Users/Add', 'user created', '2081-04-27', '2024-08-11', '', 'USERS'),
(13, 4, 'Users/Add', 'user created', '2081-04-27', '2024-08-11', '', 'USERS'),
(14, 4, 'Users/Add', 'user created', '2081-04-30', '2024-08-14', '', 'USERS');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE IF NOT EXISTS `userlog` (
  `logid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `log_time` varchar(255) NOT NULL,
  `action` enum('login','logout') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`logid`, `userid`, `log_time`, `action`) VALUES
(1, 4, '2024-05-27 16:03:40', 'login'),
(2, 4, '2024-05-28 11:09:38', 'logout'),
(3, 4, '2024-05-28 11:10:07', 'login'),
(4, 4, '2024-05-28 11:10:55', 'login'),
(5, 4, '2024-05-28 11:14:30', 'logout'),
(6, 6, '2024-05-28 11:14:36', 'login'),
(7, 6, '2024-05-28 11:14:42', 'logout'),
(8, 4, '2024-05-28 11:17:12', 'logout'),
(9, 6, '2024-05-28 11:17:29', 'login'),
(10, 6, '2024-05-28 11:20:14', 'logout'),
(11, 4, '2024-05-28 11:20:23', 'login'),
(12, 4, '2024-05-28 11:21:09', 'logout'),
(13, 6, '2024-05-28 11:21:29', 'login'),
(14, 6, '2024-05-28 11:26:01', 'login'),
(15, 6, '2024-05-28 11:27:06', 'logout'),
(16, 6, '2024-05-28 11:27:14', 'login'),
(17, 6, '2024-05-28 11:27:35', 'logout'),
(18, 6, '2024-05-28 11:28:15', 'login'),
(19, 6, '2024-05-28 11:45:04', 'login'),
(20, 6, '2024-05-28 11:45:04', 'logout'),
(21, 4, '2024-05-28 11:45:12', 'login'),
(22, 4, '2024-05-28 11:47:04', 'login'),
(23, 4, '2024-05-28 11:47:55', 'logout'),
(24, 4, '2024-05-28 11:48:05', 'login'),
(25, 4, '2024-05-28 11:49:02', 'logout'),
(26, 4, '2024-05-28 11:49:09', 'login'),
(27, 4, '2024-05-28 11:50:59', 'logout'),
(28, 6, '2024-05-28 11:53:37', 'logout'),
(29, 4, '2024-05-29 12:06:22', 'login'),
(30, 4, '2024-05-29 12:06:40', 'logout'),
(31, 4, '2024-05-29 12:49:42', 'login'),
(32, 4, '2024-05-30 10:19:40', 'login'),
(33, 4, '2024-05-30 10:19:57', 'login'),
(34, 4, '2024-05-30 10:35:54', 'logout'),
(35, 4, '2024-05-30 11:24:32', 'login'),
(36, 4, '2024-05-30 11:41:45', 'login'),
(37, 4, '2024-05-30 12:05:31', 'login'),
(38, 4, '2024-05-30 13:09:52', 'logout'),
(39, 4, '2024-05-31 16:47:27', 'login'),
(40, 4, '2024-05-31 16:47:36', 'logout'),
(41, 4, '2024-05-31 16:58:25', 'login'),
(42, 4, '2024-05-31 16:59:00', 'logout'),
(43, 4, '2024-06-14 06:58:46', 'login'),
(44, 4, '2024-06-16 13:39:54', 'login'),
(45, 4, '2024-06-16 13:42:33', 'logout'),
(46, 4, '2024-06-26 15:28:38', 'login'),
(47, 4, '2024-06-26 15:31:02', 'logout'),
(48, 4, '2024-06-27 10:37:35', 'login'),
(49, 4, '2024-06-27 10:39:40', 'logout'),
(50, 4, '2024-06-28 08:34:26', 'login'),
(51, 4, '2024-06-28 11:24:25', 'login'),
(52, 4, '2024-06-28 11:25:45', 'logout'),
(53, 4, '2024-06-28 11:48:24', 'login'),
(54, 4, '2024-06-28 11:48:30', 'logout'),
(55, 4, '2024-06-28 13:43:47', 'login'),
(56, 4, '2024-06-28 15:49:50', 'login'),
(57, 4, '2024-06-28 15:55:34', 'login'),
(58, 4, '2024-06-28 15:55:40', 'login'),
(59, 4, '2024-06-28 15:55:52', 'login'),
(60, 4, '2024-06-28 15:55:56', 'login'),
(61, 4, '2024-06-28 15:56:00', 'login'),
(62, 4, '2024-06-28 15:56:03', 'login'),
(63, 4, '2024-06-28 15:56:06', 'login'),
(64, 4, '2024-06-28 15:56:12', 'login'),
(65, 4, '2024-06-28 15:56:12', 'login'),
(66, 4, '2024-06-28 15:56:28', 'login'),
(67, 4, '2024-06-28 15:56:28', 'login'),
(68, 4, '2024-06-28 15:56:36', 'login'),
(69, 4, '2024-06-28 15:58:22', 'login'),
(70, 4, '2024-06-28 16:00:29', 'login'),
(71, 4, '2024-06-28 16:07:59', 'login'),
(72, 4, '2024-06-28 16:12:45', 'login'),
(73, 4, '2024-06-28 16:15:36', 'logout'),
(74, 4, '2024-06-28 16:39:04', 'login'),
(75, 4, '2024-06-28 16:42:12', 'logout'),
(76, 4, '2024-06-28 16:49:01', 'login'),
(77, 4, '2024-06-30 10:08:58', 'login'),
(78, 4, '2024-06-30 10:42:26', 'logout'),
(79, 4, '2024-06-30 16:01:56', 'login'),
(80, 4, '2024-07-02 11:28:12', 'login'),
(81, 4, '2024-07-02 12:00:15', 'logout'),
(82, 4, '2024-07-02 12:32:02', 'login'),
(83, 4, '2024-07-02 12:33:49', 'logout'),
(84, 4, '2024-07-02 12:57:35', 'login'),
(85, 4, '2024-07-02 13:18:16', 'logout'),
(86, 4, '2024-07-04 10:37:58', 'login'),
(87, 4, '2024-07-04 13:13:43', 'login'),
(88, 4, '2024-07-05 10:35:52', 'login'),
(89, 4, '2024-07-05 11:08:27', 'login'),
(90, 4, '2024-07-05 11:09:23', 'logout'),
(91, 4, '2024-07-05 16:42:14', 'login'),
(92, 4, '2024-07-07 12:22:47', 'login'),
(93, 4, '2024-07-07 14:00:24', 'login'),
(94, 4, '2024-07-07 14:10:18', 'logout'),
(95, 4, '2024-07-14 11:53:06', 'login'),
(96, 4, '2024-07-24 15:38:20', 'login'),
(97, 4, '2024-07-24 15:53:49', 'logout'),
(98, 4, '2024-07-25 12:35:57', 'login'),
(99, 4, '2024-07-30 13:41:56', 'login'),
(100, 4, '2024-07-31 10:18:56', 'login'),
(101, 4, '2024-07-31 10:24:06', 'logout'),
(102, 4, '2024-07-31 10:32:36', 'login'),
(103, 4, '2024-07-31 10:46:01', 'login'),
(104, 4, '2024-07-31 10:47:30', 'login'),
(105, 4, '2024-07-31 12:27:04', 'logout'),
(106, 4, '2024-08-05 13:19:44', 'login'),
(107, 4, '2024-08-05 13:20:12', 'logout'),
(108, 4, '2024-08-05 13:40:55', 'login'),
(109, 4, '2024-08-06 14:44:08', 'logout'),
(110, 9, '2024-08-06 14:44:16', 'login'),
(111, 9, '2024-08-06 15:30:00', 'logout'),
(112, 4, '2024-08-06 15:30:08', 'login'),
(113, 4, '2024-08-06 15:55:32', 'logout'),
(114, 9, '2024-08-06 15:55:40', 'login'),
(115, 9, '2024-08-06 15:55:53', 'logout'),
(116, 4, '2024-08-06 15:56:15', 'login'),
(117, 4, '2024-08-06 16:13:33', 'logout'),
(118, 9, '2024-08-06 16:13:42', 'login'),
(119, 9, '2024-08-06 16:14:14', 'logout'),
(120, 4, '2024-08-06 16:14:20', 'login'),
(121, 4, '2024-08-06 16:16:08', 'logout'),
(122, 4, '2024-08-06 16:16:27', 'login'),
(123, 4, '2024-08-06 16:16:44', 'logout'),
(124, 8, '2024-08-06 16:16:51', 'login'),
(125, 8, '2024-08-06 16:17:00', 'logout'),
(126, 4, '2024-08-06 16:17:03', 'login'),
(127, 4, '2024-08-06 16:18:08', 'logout'),
(128, 8, '2024-08-06 16:18:17', 'login'),
(129, 8, '2024-08-06 16:20:52', 'logout'),
(130, 4, '2024-08-06 16:20:56', 'login'),
(131, 4, '2024-08-06 16:21:16', 'logout'),
(132, 8, '2024-08-06 16:21:25', 'login'),
(133, 8, '2024-08-06 16:21:50', 'logout'),
(134, 4, '2024-08-06 16:23:09', 'login'),
(135, 4, '2024-08-06 16:26:21', 'logout'),
(136, 4, '2024-08-06 16:28:08', 'login'),
(137, 4, '2024-08-06 16:28:13', 'logout'),
(138, 4, '2024-08-06 16:28:20', 'login'),
(139, 4, '2024-08-06 16:28:43', 'logout'),
(140, 5, '2024-08-06 16:28:53', 'login'),
(141, 5, '2024-08-06 16:29:03', 'logout'),
(142, 4, '2024-08-06 16:29:07', 'login'),
(143, 4, '2024-08-06 16:30:24', 'logout'),
(144, 5, '2024-08-06 16:30:29', 'login'),
(145, 5, '2024-08-06 16:30:40', 'logout'),
(146, 4, '2024-08-06 16:30:44', 'login'),
(147, 4, '2024-08-06 16:31:05', 'logout'),
(148, 4, '2024-08-06 16:33:34', 'login'),
(149, 4, '2024-08-06 16:36:43', 'logout'),
(150, 4, '2024-08-06 16:40:21', 'login'),
(151, 4, '2024-08-11 13:45:18', 'login'),
(152, 4, '2024-08-11 13:46:33', 'logout'),
(153, 4, '2024-08-11 13:55:03', 'login'),
(154, 4, '2024-08-11 13:55:37', 'logout'),
(155, 7, '2024-08-11 13:55:55', 'login'),
(156, 7, '2024-08-11 13:56:35', 'logout'),
(157, 4, '2024-08-11 13:57:36', 'login'),
(158, 4, '2024-08-11 14:02:00', 'logout'),
(159, 15, '2024-08-11 14:02:16', 'login'),
(160, 15, '2024-08-11 14:04:07', 'logout'),
(161, 4, '2024-08-11 14:04:11', 'login'),
(162, 4, '2024-08-11 14:05:41', 'login'),
(163, 4, '2024-08-11 14:06:20', 'login'),
(164, 4, '2024-08-11 14:07:30', 'logout'),
(165, 4, '2024-08-11 14:10:32', 'logout'),
(166, 16, '2024-08-11 14:10:40', 'login'),
(167, 16, '2024-08-11 14:11:21', 'logout'),
(168, 4, '2024-08-11 14:11:48', 'login'),
(169, 4, '2024-08-11 14:13:37', 'logout'),
(170, 15, '2024-08-11 14:13:45', 'login'),
(171, 15, '2024-08-11 14:15:05', 'logout'),
(172, 4, '2024-08-11 14:15:07', 'login'),
(173, 4, '2024-08-11 14:16:25', 'logout'),
(174, 15, '2024-08-11 14:16:35', 'login'),
(175, 15, '2024-08-11 14:16:50', 'logout'),
(176, 4, '2024-08-11 14:16:52', 'login'),
(177, 4, '2024-08-11 14:18:54', 'login'),
(178, 4, '2024-08-11 14:22:25', 'logout'),
(179, 15, '2024-08-11 14:22:35', 'login'),
(180, 15, '2024-08-11 14:22:58', 'logout'),
(181, 4, '2024-08-11 14:23:01', 'login'),
(182, 4, '2024-08-11 14:24:05', 'logout'),
(183, 15, '2024-08-11 14:24:12', 'login'),
(184, 15, '2024-08-11 14:24:19', 'logout'),
(185, 4, '2024-08-11 14:24:22', 'login'),
(186, 4, '2024-08-11 14:24:36', 'logout'),
(187, 15, '2024-08-11 14:24:42', 'login'),
(188, 4, '2024-08-11 14:35:36', 'logout'),
(189, 15, '2024-08-11 14:35:39', 'login'),
(190, 15, '2024-08-11 14:36:43', 'logout'),
(191, 4, '2024-08-11 14:36:46', 'login'),
(192, 4, '2024-08-14 11:22:15', 'login'),
(193, 4, '2024-08-14 11:29:09', 'logout'),
(194, 17, '2024-08-14 11:36:30', 'login'),
(195, 17, '2024-08-14 11:40:46', 'login'),
(196, 17, '2024-08-14 14:57:09', 'login'),
(197, 17, '2024-08-14 15:19:31', 'login'),
(198, 17, '2024-08-14 16:52:22', 'login'),
(199, 4, '2024-08-15 11:37:13', 'login'),
(200, 4, '2024-08-15 13:28:45', 'logout'),
(201, 17, '2024-08-16 12:10:07', 'login'),
(202, 4, '2024-08-16 12:27:51', 'login'),
(203, 4, '2024-08-20 09:46:00', 'login'),
(204, 4, '2024-08-20 09:55:46', 'login'),
(205, 17, '2024-08-27 10:04:41', 'login'),
(206, 17, '2024-08-28 11:14:21', 'login'),
(207, 17, '2024-08-29 10:50:06', 'login'),
(208, 17, '2024-08-29 11:24:47', 'login'),
(209, 4, '2024-08-29 11:35:00', 'login'),
(210, 17, '2024-08-30 10:36:28', 'login'),
(211, 4, '2024-09-01 10:53:31', 'login'),
(212, 17, '2024-09-02 10:12:53', 'login');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `userid` int(11) NOT NULL,
  `employee_id` varchar(255) DEFAULT NULL,
  `user_initials` varchar(3) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `user_group` int(11) DEFAULT NULL,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `branch_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `added_date` date NOT NULL,
  `added_by` int(11) NOT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `symbol_no` varchar(255) NOT NULL,
  `designation` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `office_join_date` varchar(25) NOT NULL,
  `for_use` varchar(255) DEFAULT NULL,
  `software_name` varchar(255) DEFAULT NULL,
  `software_description` text DEFAULT NULL,
  `access_level` varchar(255) DEFAULT NULL,
  `provience` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `gapa_napa` int(11) NOT NULL,
  `ward` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `employee_id`, `user_initials`, `first_name`, `last_name`, `name`, `email`, `phone`, `user_group`, `user_name`, `password`, `branch_name`, `added_date`, `added_by`, `modified_date`, `modified_by`, `status`, `symbol_no`, `designation`, `office_join_date`, `for_use`, `software_name`, `software_description`, `access_level`, `provience`, `district`, `gapa_napa`, `ward`) VALUES
(4, '-', 'SA', 'Galchhi Rural Municipality', NULL, 'bms', '-', '-', 1, 'galchhi', 'ac2920669e37acfdcadee51f01273217', 'Galchhi', '2080-01-15', 2, NULL, NULL, 1, '-', '-', '2080-01-15', '', '', '', '', 0, 0, 2596, 0),
(7, '235397', NULL, NULL, NULL, 'Purna Prasad Tiwari', 'dcsi.galchhimun@gmail.com', '9849226094', 6, 'purnaskt', '6a954a4d389a960284813957fbba3671', 'उद्योग शाखा', '2081-04-27', 4, NULL, NULL, 1, '235397', 'अधिकृत छैठौं', '2081-04-15', '', '', '', '', 0, 0, 2557, 6),
(15, '269456', NULL, NULL, NULL, 'Kiran Giri', 'agro.galchhimun@gmail.com', '9865417813', 4, 'kirangiri', 'edaf27cfbf9683f7959cf067c2957df2', 'कृषि विकास शाखा', '2081-04-27', 4, NULL, NULL, 1, '269456', 'प्राविधिक शाखा', '2079-01-26', '', '', '', '', 0, 0, 2557, 6),
(16, '421672', NULL, NULL, NULL, 'कमला पौडेल', 'coop.galchhimun@gmail.com', '??????????', 5, 'kamalap', '8cc7b95f97e738d40e43ede6efd57057', 'सहकारी शाखा', '2081-04-27', 4, NULL, NULL, 1, '421672', 'Officer 6th', '2075-04-27', '', '', '', '', 0, 0, 2557, 6),
(17, '533655', NULL, NULL, NULL, 'रुपा तुलाधर', 'dsci.galchhimun@gmail.com', '9861533655', 6, 'rupatuladhar', '33bf54d7deca16ed6fe484160d72eb0e', 'उद्योग शाखा', '2081-04-30', 4, NULL, NULL, 1, '533655', 'उद्यम सहजकर्ता', '2081-04-30', '', '', '', '', 0, 0, 2557, 6);

-- --------------------------------------------------------

--
-- Table structure for table `user_actions`
--

CREATE TABLE IF NOT EXISTS `user_actions` (
  `user_action_id` int(11) NOT NULL,
  `user_action_name` varchar(15) NOT NULL,
  `user_action_code` varchar(15) NOT NULL,
  `addded_by` int(11) DEFAULT NULL,
  `added_date` datetime DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_actions`
--

INSERT INTO `user_actions` (`user_action_id`, `user_action_name`, `user_action_code`, `addded_by`, `added_date`, `modified_by`, `modified_date`) VALUES
(1, 'ADD', 'ADD', 1, '2014-02-20 00:00:00', NULL, NULL),
(2, 'MODIFY', 'EDIT', 1, '2014-02-20 00:00:00', NULL, NULL),
(3, 'DELETE', 'DELETE', 1, '2014-02-20 00:00:00', NULL, NULL),
(4, 'VIEW', 'VIEW', 1, '2014-02-20 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_permission`
--

CREATE TABLE IF NOT EXISTS `user_permission` (
  `ID` int(11) NOT NULL,
  `userid` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_permission`
--

INSERT INTO `user_permission` (`ID`, `userid`) VALUES
(1, 100);

-- --------------------------------------------------------

--
-- Table structure for table `user_permission_access_demad_form`
--

CREATE TABLE IF NOT EXISTS `user_permission_access_demad_form` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `menu` text NOT NULL,
  `reason_for_access` text NOT NULL,
  `refer_by` int(11) NOT NULL,
  `added_date` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `wardwise_address`
--

CREATE TABLE IF NOT EXISTS `wardwise_address` (
  `id` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `address` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`menuid`);

--
-- Indexes for table `affiliation`
--
ALTER TABLE `affiliation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bms_nagadi_setting`
--
ALTER TABLE `bms_nagadi_setting`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bms_system_register`
--
ALTER TABLE `bms_system_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_letter_settings`
--
ALTER TABLE `business_letter_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `business_register`
--
ALTER TABLE `business_register`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `commitment`
--
ALTER TABLE `commitment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `darta`
--
ALTER TABLE `darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `darta_migration`
--
ALTER TABLE `darta_migration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `darta_suchikrit`
--
ALTER TABLE `darta_suchikrit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `device_details`
--
ALTER TABLE `device_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `firm_transaction`
--
ALTER TABLE `firm_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_year_end_date`
--
ALTER TABLE `fiscal_year_end_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `group`
--
ALTER TABLE `group`
  ADD PRIMARY KEY (`groupid`);

--
-- Indexes for table `ijajat_patra`
--
ALTER TABLE `ijajat_patra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jala_sorot`
--
ALTER TABLE `jala_sorot`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `karya_bidi`
--
ALTER TABLE `karya_bidi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `keys`
--
ALTER TABLE `keys`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khanepani`
--
ALTER TABLE `khanepani`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khanepani_darta_members`
--
ALTER TABLE `khanepani_darta_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khane_pani_sewa`
--
ALTER TABLE `khane_pani_sewa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `krishi_samuha_darta`
--
ALTER TABLE `krishi_samuha_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `krishi_samuha_members`
--
ALTER TABLE `krishi_samuha_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `land_owner_profile_basic`
--
ALTER TABLE `land_owner_profile_basic`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `file_no` (`file_no`);

--
-- Indexes for table `main_topic`
--
ALTER TABLE `main_topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mel_milap`
--
ALTER TABLE `mel_milap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_per_group`
--
ALTER TABLE `permissions_per_group`
  ADD PRIMARY KEY (`permission_per_group_id`);

--
-- Indexes for table `permissions_per_user`
--
ALTER TABLE `permissions_per_user`
  ADD PRIMARY KEY (`permission_per_user_id`);

--
-- Indexes for table `permission_letter`
--
ALTER TABLE `permission_letter`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prakar`
--
ALTER TABLE `prakar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `previouis_work_details`
--
ALTER TABLE `previouis_work_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `rasayenik_maal`
--
ALTER TABLE `rasayenik_maal`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `renew`
--
ALTER TABLE `renew`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sahakari_darta`
--
ALTER TABLE `sahakari_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha`
--
ALTER TABLE `sanstha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha_members`
--
ALTER TABLE `sanstha_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha_suchikrit_nibedan`
--
ALTER TABLE `sanstha_suchikrit_nibedan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sarkar_yain`
--
ALTER TABLE `sarkar_yain`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scan_photo`
--
ALTER TABLE `scan_photo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_district`
--
ALTER TABLE `settings_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_vdc_municipality`
--
ALTER TABLE `settings_vdc_municipality`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_ward`
--
ALTER TABLE `settings_ward`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_year`
--
ALTER TABLE `settings_year`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_up`
--
ALTER TABLE `set_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trans_log`
--
ALTER TABLE `trans_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`logid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- Indexes for table `user_actions`
--
ALTER TABLE `user_actions`
  ADD PRIMARY KEY (`user_action_id`);

--
-- Indexes for table `user_permission`
--
ALTER TABLE `user_permission`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user_permission_access_demad_form`
--
ALTER TABLE `user_permission_access_demad_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wardwise_address`
--
ALTER TABLE `wardwise_address`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `menuid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `affiliation`
--
ALTER TABLE `affiliation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bms_nagadi_setting`
--
ALTER TABLE `bms_nagadi_setting`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bms_system_register`
--
ALTER TABLE `bms_system_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `business_letter_settings`
--
ALTER TABLE `business_letter_settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `business_register`
--
ALTER TABLE `business_register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `commitment`
--
ALTER TABLE `commitment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `darta`
--
ALTER TABLE `darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `darta_migration`
--
ALTER TABLE `darta_migration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `darta_suchikrit`
--
ALTER TABLE `darta_suchikrit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `device_details`
--
ALTER TABLE `device_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `firm_transaction`
--
ALTER TABLE `firm_transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fiscal_year`
--
ALTER TABLE `fiscal_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `fiscal_year_end_date`
--
ALTER TABLE `fiscal_year_end_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `group`
--
ALTER TABLE `group`
  MODIFY `groupid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `ijajat_patra`
--
ALTER TABLE `ijajat_patra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jala_sorot`
--
ALTER TABLE `jala_sorot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `karya_bidi`
--
ALTER TABLE `karya_bidi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `keys`
--
ALTER TABLE `keys`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `khanepani`
--
ALTER TABLE `khanepani`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `khanepani_darta_members`
--
ALTER TABLE `khanepani_darta_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `khane_pani_sewa`
--
ALTER TABLE `khane_pani_sewa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `krishi_samuha_darta`
--
ALTER TABLE `krishi_samuha_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `krishi_samuha_members`
--
ALTER TABLE `krishi_samuha_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `land_owner_profile_basic`
--
ALTER TABLE `land_owner_profile_basic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `main_topic`
--
ALTER TABLE `main_topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `mel_milap`
--
ALTER TABLE `mel_milap`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions_per_group`
--
ALTER TABLE `permissions_per_group`
  MODIFY `permission_per_group_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1389;
--
-- AUTO_INCREMENT for table `permissions_per_user`
--
ALTER TABLE `permissions_per_user`
  MODIFY `permission_per_user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=32;
--
-- AUTO_INCREMENT for table `permission_letter`
--
ALTER TABLE `permission_letter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prakar`
--
ALTER TABLE `prakar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=76;
--
-- AUTO_INCREMENT for table `previouis_work_details`
--
ALTER TABLE `previouis_work_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `rasayenik_maal`
--
ALTER TABLE `rasayenik_maal`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `renew`
--
ALTER TABLE `renew`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sahakari_darta`
--
ALTER TABLE `sahakari_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha`
--
ALTER TABLE `sanstha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha_members`
--
ALTER TABLE `sanstha_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha_suchikrit_nibedan`
--
ALTER TABLE `sanstha_suchikrit_nibedan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sarkar_yain`
--
ALTER TABLE `sarkar_yain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scan_photo`
--
ALTER TABLE `scan_photo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings_district`
--
ALTER TABLE `settings_district`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=558;
--
-- AUTO_INCREMENT for table `settings_vdc_municipality`
--
ALTER TABLE `settings_vdc_municipality`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2945;
--
-- AUTO_INCREMENT for table `settings_ward`
--
ALTER TABLE `settings_ward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `settings_year`
--
ALTER TABLE `settings_year`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `set_up`
--
ALTER TABLE `set_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=499;
--
-- AUTO_INCREMENT for table `trans_log`
--
ALTER TABLE `trans_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `logid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=213;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `user_actions`
--
ALTER TABLE `user_actions`
  MODIFY `user_action_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `user_permission`
--
ALTER TABLE `user_permission`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user_permission_access_demad_form`
--
ALTER TABLE `user_permission_access_demad_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `wardwise_address`
--
ALTER TABLE `wardwise_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
