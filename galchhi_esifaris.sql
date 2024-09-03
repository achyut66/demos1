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
-- Database: `galchhi_esifaris`
--

-- --------------------------------------------------------

--
-- Table structure for table `abibhahit_pramanpatra`
--

CREATE TABLE IF NOT EXISTS `abibhahit_pramanpatra` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `child_name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address_verifiaction_en`
--

CREATE TABLE IF NOT EXISTS `address_verifiaction_en` (
  `id` int(11) NOT NULL,
  `date` date NOT NULL,
  `gender` int(11) NOT NULL,
  `form_id` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_dis` int(11) NOT NULL,
  `per_ganapa` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `old_name` varchar(255) NOT NULL,
  `old_ward` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `added_on` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `add_classroom`
--

CREATE TABLE IF NOT EXISTS `add_classroom` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `school_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `annual_income_en`
--

CREATE TABLE IF NOT EXISTS `annual_income_en` (
  `id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ganapa` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `created_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `antarik_basai_sarai`
--

CREATE TABLE IF NOT EXISTS `antarik_basai_sarai` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `father_name` varchar(125) NOT NULL,
  `mother_name` varchar(125) NOT NULL,
  `from_nepali_date` varchar(50) NOT NULL,
  `from_english_date` date NOT NULL,
  `old_state` int(11) NOT NULL,
  `old_district` int(11) NOT NULL,
  `old_local_body` int(11) NOT NULL,
  `old_ward` int(11) NOT NULL,
  `old_tole` text NOT NULL,
  `present_tole` text NOT NULL,
  `present_state` int(11) NOT NULL,
  `present_district` int(11) NOT NULL,
  `present_local_body` int(11) NOT NULL,
  `present_ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `antarik_basai_sarai_detail`
--

CREATE TABLE IF NOT EXISTS `antarik_basai_sarai_detail` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `relation` int(11) NOT NULL,
  `citizenship_no` varchar(15) NOT NULL,
  `ghar_no` int(11) NOT NULL,
  `road_name` text NOT NULL,
  `age` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `apanga_pramanpatra`
--

CREATE TABLE IF NOT EXISTS `apanga_pramanpatra` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `gender` tinyint(4) NOT NULL,
  `disable_type` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approval_tapasil`
--

CREATE TABLE IF NOT EXISTS `approval_tapasil` (
  `id` int(11) NOT NULL,
  `bida_wiwaran` varchar(255) NOT NULL,
  `jamma_din` varchar(255) NOT NULL,
  `kharcha` varchar(255) NOT NULL,
  `baki` varchar(255) NOT NULL,
  `remarks` varchar(255) NOT NULL,
  `wiwaran_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `approve_wiwaran`
--

CREATE TABLE IF NOT EXISTS `approve_wiwaran` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cit_no` varchar(255) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `ganapa` int(11) DEFAULT NULL,
  `ward` int(11) DEFAULT NULL,
  `sewa` varchar(255) NOT NULL,
  `samuha` varchar(255) NOT NULL,
  `taha` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `working_office` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `end_date` varchar(255) NOT NULL,
  `yain` varchar(255) NOT NULL,
  `retirement_type` varchar(255) NOT NULL,
  `other_details` varchar(255) NOT NULL,
  `bodartha` varchar(255) DEFAULT NULL,
  `docs` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `arthik_saheta`
--

CREATE TABLE IF NOT EXISTS `arthik_saheta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `culprit_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `ap_cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `asthai_basobas`
--

CREATE TABLE IF NOT EXISTS `asthai_basobas` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `owner_name` text NOT NULL,
  `citizenship_no` varchar(15) NOT NULL,
  `citizenship_district` int(11) NOT NULL,
  `nepali_citizenship_date` varchar(50) NOT NULL,
  `english_citizenship_date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `nepali_permission_date` varchar(50) NOT NULL,
  `english_permission_date` date NOT NULL,
  `tole` text NOT NULL,
  `road` text NOT NULL,
  `ghar_no` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `same` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bato_kayam`
--

CREATE TABLE IF NOT EXISTS `bato_kayam` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `land_owner_name` text NOT NULL,
  `kitta_no` varchar(50) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` text NOT NULL,
  `direction` text NOT NULL,
  `road_length` float NOT NULL,
  `road_width` float NOT NULL,
  `documents` text NOT NULL,
  `documents_type` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bebasaya_banda`
--

CREATE TABLE IF NOT EXISTS `bebasaya_banda` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `org_name` text NOT NULL,
  `owner_name` text NOT NULL,
  `darta_no` varchar(15) NOT NULL,
  `org_type` text NOT NULL,
  `org_size` text NOT NULL,
  `org_state` int(11) NOT NULL,
  `org_district` int(11) NOT NULL,
  `org_local_body` int(11) NOT NULL,
  `org_ward` int(11) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `new_place` varchar(80) NOT NULL,
  `tole` text NOT NULL,
  `road_name` text NOT NULL,
  `home_no` int(11) NOT NULL,
  `nepali_closed_date` varchar(80) NOT NULL,
  `english_closed_date` date NOT NULL,
  `nepali_observed_date` varchar(80) NOT NULL,
  `english_observed_date` date NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bebasaya_darta`
--

CREATE TABLE IF NOT EXISTS `bebasaya_darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `certificate_no` bigint(20) NOT NULL,
  `org_name` text NOT NULL,
  `owner_name` text NOT NULL,
  `org_type` text NOT NULL,
  `org_size` text NOT NULL,
  `org_state` int(11) NOT NULL,
  `org_district` int(11) NOT NULL,
  `org_local_body` int(11) NOT NULL,
  `org_ward` int(11) NOT NULL,
  `prop_state` int(11) NOT NULL,
  `prop_district` int(11) NOT NULL,
  `prop_local_body` int(11) NOT NULL,
  `prop_ward` int(11) NOT NULL,
  `citizenship_no` varchar(32) NOT NULL,
  `citizenship_district` int(11) NOT NULL,
  `citizenship_date` varchar(80) NOT NULL,
  `father_name` text NOT NULL,
  `lagat_pungi` double NOT NULL,
  `sign_board` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `tole` text NOT NULL,
  `road_name` text NOT NULL,
  `house_own_name` text NOT NULL,
  `home_no` bigint(20) NOT NULL,
  `org_email` varchar(80) NOT NULL,
  `org_contact_no` varchar(15) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bebasaya_sifaris`
--

CREATE TABLE IF NOT EXISTS `bebasaya_sifaris` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `org_name` text NOT NULL,
  `org_type` text NOT NULL,
  `org_state` int(11) NOT NULL,
  `org_district` int(11) NOT NULL,
  `org_local_body` int(11) NOT NULL,
  `org_ward` int(11) NOT NULL,
  `org_road_name` text NOT NULL,
  `org_home_no` varchar(8) NOT NULL,
  `org_phone` varchar(50) NOT NULL,
  `org_establish_nep_date` varchar(50) NOT NULL,
  `org_establish_eng_date` date NOT NULL,
  `org_punji` varchar(25) NOT NULL,
  `org_ownership` text NOT NULL,
  `home_owner` text NOT NULL,
  `home_owner_phone` varchar(50) NOT NULL,
  `home_fare` double NOT NULL,
  `kitta_no` varchar(25) NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `biggha` double NOT NULL,
  `kattha` double NOT NULL,
  `dhur` double NOT NULL,
  `paisa` double NOT NULL,
  `prop_name` text NOT NULL,
  `prop_phone` int(11) NOT NULL,
  `prop_road_name` text NOT NULL,
  `prop_home_no` int(11) NOT NULL,
  `prop_state` int(11) NOT NULL,
  `prop_district` int(11) NOT NULL,
  `prop_local_body` int(11) NOT NULL,
  `prop_ward` int(11) NOT NULL,
  `applicant_name` text NOT NULL,
  `applicant_phone` varchar(50) NOT NULL,
  `applicant_address` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `bebasaya_sifaris`
--

INSERT INTO `bebasaya_sifaris` (`id`, `form_id`, `session_id`, `ward_login`, `status`, `nepali_date`, `date`, `org_name`, `org_type`, `org_state`, `org_district`, `org_local_body`, `org_ward`, `org_road_name`, `org_home_no`, `org_phone`, `org_establish_nep_date`, `org_establish_eng_date`, `org_punji`, `org_ownership`, `home_owner`, `home_owner_phone`, `home_fare`, `kitta_no`, `land_type`, `biggha`, `kattha`, `dhur`, `paisa`, `prop_name`, `prop_phone`, `prop_road_name`, `prop_home_no`, `prop_state`, `prop_district`, `prop_local_body`, `prop_ward`, `applicant_name`, `applicant_phone`, `applicant_address`, `documents`, `documents_type`, `darta_documents`, `created_at`, `updated_at`, `cit_no`, `gender_spec`) VALUES
(1, 8160743925, 5, 7, 1, '2081-4-2', '2024-07-17', 'कविता खाजा ', 'व्यवसायिक', 3, 33, 367, 7, 'पृथ्वी राजमार्ग', '', '9808962715', '2081-03-01', '2024-06-15', '500000', 'एकल', 'राजकुमार थापा', '9851237861', 12000, '1151', 'hill', 0, 2, 0, 0, 'कविता कार्की', 2147483647, 'कच्ची सडक', 0, 3, 33, 367, 7, 'कविता कार्की', '9808962715', 'गल्छी 1 धादिङ', '', '', '', '2024-07-17 10:54:31', '2024-07-17 05:12:05', '26-01-74-01805', '---Select---');

-- --------------------------------------------------------

--
-- Table structure for table `bibaha_pramanit`
--

CREATE TABLE IF NOT EXISTS `bibaha_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `marriage_date` date NOT NULL,
  `marriage_date_nepali` varchar(50) NOT NULL,
  `marriage_type` int(11) NOT NULL,
  `g_name` text NOT NULL,
  `g_grand_father_name` text NOT NULL,
  `g_father_name` text NOT NULL,
  `g_mother_name` text NOT NULL,
  `g_state` int(11) NOT NULL,
  `g_district` int(11) NOT NULL,
  `g_local_body` int(11) NOT NULL,
  `g_ward` int(11) NOT NULL,
  `g_old_address` int(11) NOT NULL,
  `g_citizenship_no` varchar(125) NOT NULL,
  `b_citizenship_no` varchar(125) NOT NULL,
  `b_name` text NOT NULL,
  `b_grand_father_name` text NOT NULL,
  `b_father_name` text NOT NULL,
  `b_mother_name` text NOT NULL,
  `b_state` text NOT NULL,
  `b_district` text NOT NULL,
  `b_local_body` text NOT NULL,
  `b_ward` text NOT NULL,
  `b_old_address` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bidhut_jadan`
--

CREATE TABLE IF NOT EXISTS `bidhut_jadan` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `land_type` text NOT NULL,
  `name` text NOT NULL,
  `electricity_use_type` int(11) NOT NULL,
  `house_type` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward_no` varchar(50) NOT NULL,
  `old_address` int(11) NOT NULL,
  `ampere` varchar(50) NOT NULL,
  `kitta_no` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `ghar_sampann` varchar(255) DEFAULT NULL,
  `hal_sabik` varchar(255) DEFAULT NULL,
  `nepali_date_1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `birth_certificate_en`
--

CREATE TABLE IF NOT EXISTS `birth_certificate_en` (
  `id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `login_id` int(11) NOT NULL,
  `darta_no` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `gender` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `son_daughter` int(11) DEFAULT NULL,
  `gender_f` varchar(25) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `gender_m` varchar(25) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `birth_state` int(11) NOT NULL,
  `birth_district` int(11) NOT NULL,
  `birth_gapana` int(11) NOT NULL,
  `birth_ward` int(11) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_gapana` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `dob_np` varchar(255) NOT NULL,
  `dob_en` varchar(255) NOT NULL,
  `added_date` varchar(25) NOT NULL,
  `added_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `modified_at` varchar(255) DEFAULT NULL,
  `modified_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `chalani`
--

CREATE TABLE IF NOT EXISTS `chalani` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `is_muncipality` enum('0','1') NOT NULL,
  `type` int(11) NOT NULL,
  `chalani_type` enum('1','2','') NOT NULL DEFAULT '',
  `chalani_no` bigint(20) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `applicant_name` text NOT NULL,
  `nepali_chalani_miti` varchar(80) NOT NULL,
  `english_chalani_miti` date NOT NULL,
  `uri` varchar(80) NOT NULL,
  `letter_subject` text NOT NULL,
  `department` int(11) NOT NULL,
  `department_other` text NOT NULL,
  `office` int(11) NOT NULL,
  `patra_miti_nep` varchar(80) NOT NULL,
  `patra_miti_eng` date NOT NULL,
  `patra_wahak_naam` text NOT NULL,
  `patra_wahak_contact` bigint(20) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `czn_no` varchar(255) DEFAULT NULL,
  `chalani_documents` text NOT NULL,
  `ward` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `chalani`
--

INSERT INTO `chalani` (`id`, `form_id`, `session_id`, `darta_id`, `is_muncipality`, `type`, `chalani_type`, `chalani_no`, `ward_login`, `applicant_name`, `nepali_chalani_miti`, `english_chalani_miti`, `uri`, `letter_subject`, `department`, `department_other`, `office`, `patra_miti_nep`, `patra_miti_eng`, `patra_wahak_naam`, `patra_wahak_contact`, `description`, `user_id`, `czn_no`, `chalani_documents`, `ward`) VALUES
(1, 8160743925, 0, 1, '0', 4, '', 0, 0, '', '', '0000-00-00', '', '', 0, '', 0, '', '0000-00-00', '', 0, '', 0, NULL, '', NULL),
(2, 4621589730, 0, 1, '0', 6, '', 0, 0, '', '', '0000-00-00', '', '', 0, '', 0, '', '0000-00-00', '', 0, '', 0, NULL, '', NULL),
(3, 4852091763, 0, 2, '0', 6, '', 0, 0, '', '', '0000-00-00', '', '', 0, '', 0, '', '0000-00-00', '', 0, '', 0, NULL, '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charkilla_details`
--

CREATE TABLE IF NOT EXISTS `charkilla_details` (
  `id` int(11) NOT NULL,
  `killa_id` int(11) NOT NULL,
  `old_address` int(11) NOT NULL,
  `new_address` text NOT NULL,
  `map_sheet_no` varchar(50) NOT NULL,
  `kitta_no` varchar(50) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `road` float DEFAULT NULL,
  `road_type` float DEFAULT NULL,
  `east_piller` text NOT NULL,
  `west_piller` text NOT NULL,
  `north_piller` text NOT NULL,
  `south_piller` text NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `char_killa`
--

CREATE TABLE IF NOT EXISTS `char_killa` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `office` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `s_state` varchar(255) DEFAULT NULL,
  `district` int(11) NOT NULL,
  `s_district` varchar(255) DEFAULT NULL,
  `local_body` int(11) NOT NULL,
  `s_local_body` varchar(255) DEFAULT NULL,
  `ward` int(11) NOT NULL,
  `s_ward` int(11) DEFAULT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `documents` text NOT NULL,
  `documents_type` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citizenship_sifaris`
--

CREATE TABLE IF NOT EXISTS `citizenship_sifaris` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` text NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `relation` enum('son','daughter','wife') NOT NULL,
  `age` varchar(10) NOT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `janmamiti` varchar(255) DEFAULT NULL,
  `cit_no_1` varchar(255) DEFAULT NULL,
  `applicant_f_name` varchar(255) DEFAULT NULL,
  `applicant_m_name` varchar(255) DEFAULT NULL,
  `br_state` int(11) DEFAULT NULL,
  `br_district` int(11) DEFAULT NULL,
  `br_local_body` int(11) DEFAULT NULL,
  `br_ward` int(11) DEFAULT NULL,
  `app_state` int(11) DEFAULT NULL,
  `app_district` int(11) DEFAULT NULL,
  `app_local_body` int(11) DEFAULT NULL,
  `app_ward` int(11) DEFAULT NULL,
  `sasura_name` varchar(255) DEFAULT NULL,
  `mr_nepali_date` varchar(255) DEFAULT NULL,
  `marriage_type` int(11) DEFAULT NULL,
  `jaari_jilla` varchar(255) DEFAULT NULL,
  `jaari_date` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `citizenship_sifaris`
--

INSERT INTO `citizenship_sifaris` (`id`, `form_id`, `session_id`, `ward_login`, `status`, `nepali_date`, `date`, `applicant_name`, `state`, `district`, `local_body`, `ward`, `documents`, `documents_type`, `darta_documents`, `created_at`, `updated_at`, `name`, `gender`, `relation`, `age`, `gender_spec`, `con_no`, `janmamiti`, `cit_no_1`, `applicant_f_name`, `applicant_m_name`, `br_state`, `br_district`, `br_local_body`, `br_ward`, `app_state`, `app_district`, `app_local_body`, `app_ward`, `sasura_name`, `mr_nepali_date`, `marriage_type`, `jaari_jilla`, `jaari_date`) VALUES
(2, 4852091763, 5, 1, 2, '', '0000-00-00', 'सञ्‍जीव श्रेष्ठ', 3, 33, 367, 1, '', '', '', '2024-07-18 11:22:48', '2024-07-18 06:57:03', '', 0, 'son', '27', '1', NULL, '2054-11-18', '', 'रुद्र बहादुर श्रेष्ठ', 'निर्मला श्रेष्ठ', 3, 33, 367, 1, 3, 33, 367, 1, '', '', 0, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `citizen_certificate`
--

CREATE TABLE IF NOT EXISTS `citizen_certificate` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `office` text NOT NULL,
  `nep_first_name` text NOT NULL,
  `nep_middle_name` text NOT NULL,
  `nep_last_name` text NOT NULL,
  `eng_first_name` text NOT NULL,
  `eng_middle_name` text NOT NULL,
  `eng_last_name` text NOT NULL,
  `gender` text NOT NULL,
  `nep_dob` varchar(50) NOT NULL,
  `eng_dob` date NOT NULL,
  `b_state` int(11) NOT NULL,
  `b_district` int(11) NOT NULL,
  `b_local_body` int(11) NOT NULL,
  `b_ward` int(11) NOT NULL,
  `nep_bp_tole` text NOT NULL,
  `eng_bp_tole` text NOT NULL,
  `p_state` int(11) NOT NULL,
  `p_district` int(11) NOT NULL,
  `p_local_body` int(11) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `nep_tole` text NOT NULL,
  `eng_tole` text NOT NULL,
  `father_name` text NOT NULL,
  `f_citizenship_no` varchar(50) NOT NULL,
  `f_state` int(11) NOT NULL,
  `f_district` int(11) NOT NULL,
  `f_local_body` int(11) NOT NULL,
  `f_ward` int(11) NOT NULL,
  `f_tole` text NOT NULL,
  `mother_name` text NOT NULL,
  `m_citizenship_no` text NOT NULL,
  `m_state` int(11) NOT NULL,
  `m_district` int(11) NOT NULL,
  `m_local_body` int(11) NOT NULL,
  `m_ward` int(11) NOT NULL,
  `m_tole` text NOT NULL,
  `husband_wife_name` text NOT NULL,
  `hw_citizenship_no` text NOT NULL,
  `hw_state` int(11) NOT NULL,
  `hw_district` int(11) NOT NULL,
  `hw_local_body` int(11) NOT NULL,
  `hw_ward` int(11) NOT NULL,
  `hw_tole` text NOT NULL,
  `protector_name` text NOT NULL,
  `s_state` int(11) NOT NULL,
  `s_district` int(11) NOT NULL,
  `s_local_body` int(11) NOT NULL,
  `s_ward` int(11) NOT NULL,
  `p_tole` text NOT NULL,
  `b_eng_state` text NOT NULL,
  `b_eng_district` text NOT NULL,
  `b_eng_local_body` text NOT NULL,
  `b_eng_ward` text NOT NULL,
  `p_eng_state` text NOT NULL,
  `p_eng_district` text NOT NULL,
  `p_eng_local_body` text NOT NULL,
  `p_eng_ward` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_type` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_address` varchar(255) DEFAULT NULL,
  `country_name_eng` varchar(255) DEFAULT NULL,
  `country_address_eng` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `citizen_certificate_pratilipi`
--

CREATE TABLE IF NOT EXISTS `citizen_certificate_pratilipi` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `office` text NOT NULL,
  `nep_first_name` text NOT NULL,
  `nep_middle_name` text NOT NULL,
  `nep_last_name` text NOT NULL,
  `eng_first_name` text NOT NULL,
  `eng_middle_name` text NOT NULL,
  `eng_last_name` text NOT NULL,
  `gender` text NOT NULL,
  `nep_dob` varchar(50) NOT NULL,
  `eng_dob` date NOT NULL,
  `b_state` int(11) NOT NULL,
  `b_district` int(11) NOT NULL,
  `b_local_body` int(11) NOT NULL,
  `b_ward` int(11) NOT NULL,
  `nep_bp_tole` text NOT NULL,
  `eng_bp_tole` text NOT NULL,
  `p_state` int(11) NOT NULL,
  `p_district` int(11) NOT NULL,
  `p_local_body` int(11) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `nep_tole` text NOT NULL,
  `eng_tole` text NOT NULL,
  `father_name` text NOT NULL,
  `f_citizenship_no` varchar(50) NOT NULL,
  `f_state` int(11) NOT NULL,
  `f_district` int(11) NOT NULL,
  `f_local_body` int(11) NOT NULL,
  `f_ward` int(11) NOT NULL,
  `f_tole` text NOT NULL,
  `mother_name` text NOT NULL,
  `m_citizenship_no` text NOT NULL,
  `m_state` int(11) NOT NULL,
  `m_district` int(11) NOT NULL,
  `m_local_body` int(11) NOT NULL,
  `m_ward` int(11) NOT NULL,
  `m_tole` text NOT NULL,
  `husband_wife_name` text NOT NULL,
  `hw_citizenship_no` text NOT NULL,
  `hw_state` int(11) NOT NULL,
  `hw_district` int(11) NOT NULL,
  `hw_local_body` int(11) NOT NULL,
  `hw_ward` int(11) NOT NULL,
  `hw_tole` text NOT NULL,
  `protector_name` text NOT NULL,
  `s_state` int(11) NOT NULL,
  `s_district` int(11) NOT NULL,
  `s_local_body` int(11) NOT NULL,
  `s_ward` int(11) NOT NULL,
  `p_tole` text NOT NULL,
  `b_eng_state` text NOT NULL,
  `b_eng_district` text NOT NULL,
  `b_eng_local_body` text NOT NULL,
  `b_eng_ward` text NOT NULL,
  `p_eng_state` text NOT NULL,
  `p_eng_district` text NOT NULL,
  `p_eng_local_body` text NOT NULL,
  `p_eng_ward` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `citizenship_no` varchar(50) NOT NULL,
  `citizenship_reg_date` varchar(50) NOT NULL,
  `citizenship_type` int(11) NOT NULL,
  `citizenship_type_1` varchar(255) DEFAULT NULL,
  `country_name_eng` varchar(255) DEFAULT NULL,
  `country_address_eng` varchar(255) DEFAULT NULL,
  `country_name` varchar(255) DEFAULT NULL,
  `country_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `court_fee`
--

CREATE TABLE IF NOT EXISTS `court_fee` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `husband_wife_name` text NOT NULL,
  `court_name` int(11) NOT NULL,
  `case_type` text NOT NULL,
  `nepali_visit_date` varchar(50) NOT NULL,
  `english_visit_date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `darta`
--

CREATE TABLE IF NOT EXISTS `darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `is_muncipality` enum('0','1') NOT NULL,
  `darta_no` bigint(20) NOT NULL,
  `patra_chalani_no` int(11) NOT NULL,
  `is_complete` enum('0','1') NOT NULL DEFAULT '0',
  `ward_login` int(11) NOT NULL,
  `department` varchar(10) NOT NULL,
  `link` text NOT NULL,
  `nepali_darta_miti` varchar(50) NOT NULL,
  `english_darta_miti` date NOT NULL,
  `sifaris_id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `applicant_name` text NOT NULL,
  `uri` varchar(100) NOT NULL,
  `letter_subject` text NOT NULL,
  `letter_type` enum('important','most_important','deadlined') NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `description` text NOT NULL,
  `deadline_nep` varchar(80) NOT NULL,
  `deadline_eng` date NOT NULL,
  `transfer_date_nep` varchar(80) NOT NULL,
  `transfer_date_eng` date NOT NULL,
  `patra_miti_nep` varchar(80) NOT NULL,
  `patra_miti_eng` date NOT NULL,
  `karmachari_name` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `user_ward` int(11) DEFAULT NULL,
  `maujuda_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `darta`
--

INSERT INTO `darta` (`id`, `form_id`, `session_id`, `is_muncipality`, `darta_no`, `patra_chalani_no`, `is_complete`, `ward_login`, `department`, `link`, `nepali_darta_miti`, `english_darta_miti`, `sifaris_id`, `type`, `applicant_name`, `uri`, `letter_subject`, `letter_type`, `state`, `district`, `local_body`, `ward`, `darta_documents`, `description`, `deadline_nep`, `deadline_eng`, `transfer_date_nep`, `transfer_date_eng`, `patra_miti_nep`, `patra_miti_eng`, `karmachari_name`, `user_id`, `user_ward`, `maujuda_id`) VALUES
(1, 4852091763, 5, '0', 1, 0, '0', 1, '', '', '2081-4-3', '2024-07-18', 2, 1, 'सञ्‍जीव श्रेष्ठ', 'citizenship-sifaris', '', 'important', 0, 0, 0, 0, '', '', '', '0000-00-00', '', '0000-00-00', '', '0000-00-00', '', 7, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `farak_hijje`
--

CREATE TABLE IF NOT EXISTS `farak_hijje` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` text NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `wrong_spelling` varchar(512) NOT NULL,
  `right_spelling` varchar(512) NOT NULL,
  `wrong_document` text NOT NULL,
  `old_new_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farak_janma_miti`
--

CREATE TABLE IF NOT EXISTS `farak_janma_miti` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `name` text NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `wrong_birthdate` varchar(45) NOT NULL,
  `right_birthdate` varchar(45) NOT NULL,
  `wrong_document` text NOT NULL,
  `old_new_address` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `farak_nam_thar`
--

CREATE TABLE IF NOT EXISTS `farak_nam_thar` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `thik_bhayeko_document` text NOT NULL,
  `farak_name` text NOT NULL,
  `thik_naam` text NOT NULL,
  `farak_bhayeko_document` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `fiscal_year_end_date`
--

CREATE TABLE IF NOT EXISTS `fiscal_year_end_date` (
  `id` int(11) NOT NULL,
  `start_date` varchar(25) NOT NULL,
  `fiscal_year_end_date` varchar(25) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `fiscal_year_end_date`
--

INSERT INTO `fiscal_year_end_date` (`id`, `start_date`, `fiscal_year_end_date`) VALUES
(1, '2078-04-1', '2079-3-32');

-- --------------------------------------------------------

--
-- Table structure for table `ghar_jagga_hakdar`
--

CREATE TABLE IF NOT EXISTS `ghar_jagga_hakdar` (
  `id` int(11) NOT NULL,
  `hakdar_ko_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `hakdar_ko_nata` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `father_husband_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `citizenship_no` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `entry_id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ghar_jagga_namsari`
--

CREATE TABLE IF NOT EXISTS `ghar_jagga_namsari` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` text NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `applicant_relation` int(11) NOT NULL,
  `owner_name` text NOT NULL,
  `nepali_dod` text NOT NULL,
  `english_dod` date NOT NULL,
  `hakdar_ko_name` text DEFAULT NULL,
  `hakdar_ko_nata` int(11) DEFAULT NULL,
  `father_husband_name` text DEFAULT NULL,
  `citizenship_no` text DEFAULT NULL,
  `home_no` int(11) DEFAULT NULL,
  `kitta` int(11) DEFAULT NULL,
  `biggha` float DEFAULT NULL,
  `kattha` float DEFAULT NULL,
  `dhur` float DEFAULT NULL,
  `paisa` float DEFAULT NULL,
  `land_type` enum('hill','terai') DEFAULT NULL,
  `map_sheet_no` int(11) DEFAULT NULL,
  `kitta_no` int(11) DEFAULT NULL,
  `road_name` text DEFAULT NULL,
  `road_type` int(11) DEFAULT NULL,
  `ward` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `documents` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ghar_kayam`
--

CREATE TABLE IF NOT EXISTS `ghar_kayam` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `kitta_no` varchar(50) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `samyukta` int(11) NOT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ghar_patala`
--

CREATE TABLE IF NOT EXISTS `ghar_patala` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `kitta_no` varchar(15) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `daam` int(11) DEFAULT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hajiri_notice`
--

CREATE TABLE IF NOT EXISTS `hajiri_notice` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cit_no` varchar(255) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `ganapa` int(11) DEFAULT NULL,
  `ward` int(11) DEFAULT NULL,
  `sewa` varchar(255) NOT NULL,
  `samuha` varchar(255) NOT NULL,
  `taha` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `partachar_office` varchar(255) NOT NULL,
  `patrachar_date` varchar(255) NOT NULL,
  `yain` text NOT NULL,
  `ramana_office` varchar(255) NOT NULL,
  `ramana_office_address` varchar(255) NOT NULL,
  `working_position` varchar(255) NOT NULL,
  `ramana_chalani_no` varchar(255) NOT NULL,
  `ramana_miti` varchar(25) NOT NULL,
  `nirnaya_miti` varchar(25) NOT NULL,
  `lagu_miti` varchar(25) NOT NULL,
  `bodartha` varchar(255) NOT NULL,
  `docs` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hakdar_pramanit`
--

CREATE TABLE IF NOT EXISTS `hakdar_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `mritak_ko_name` text NOT NULL,
  `hakdar_ko_no` int(11) NOT NULL,
  `hakdar_ko_name` text NOT NULL,
  `citizenship_no` varchar(15) NOT NULL,
  `relation` int(11) NOT NULL,
  `father_husband_name` text NOT NULL,
  `ghar_no` varchar(15) NOT NULL,
  `kitta_no` varchar(15) NOT NULL,
  `home_type` int(11) NOT NULL,
  `nep_darta_date` varchar(50) NOT NULL,
  `eng_darta_date` date NOT NULL,
  `darta_no` bigint(20) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_recommend`
--

CREATE TABLE IF NOT EXISTS `home_recommend` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` text NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `office` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `map_sheet_no` varchar(11) NOT NULL,
  `kitta_no` varchar(11) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `land_type` enum('hill','terai','','') NOT NULL,
  `home_no` int(11) NOT NULL,
  `home_type` int(11) NOT NULL,
  `road_name` text NOT NULL,
  `home_created_year` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `con_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `home_road_certify`
--

CREATE TABLE IF NOT EXISTS `home_road_certify` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` text NOT NULL,
  `date` date NOT NULL,
  `office` int(11) NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `document` text NOT NULL,
  `document_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) NOT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `home_road_certify`
--

INSERT INTO `home_road_certify` (`id`, `form_id`, `session_id`, `ward_login`, `status`, `nepali_date`, `date`, `office`, `applicant_name`, `state`, `district`, `ward`, `local_body`, `land_type`, `document`, `document_type`, `darta_documents`, `created_at`, `updated_at`, `cit_no`, `con_no`, `gender_spec`) VALUES
(1, 3728590641, 5, 1, 3, '2081-03-18', '2024-07-02', 1, 'rachana pandit', 3, 33, 1, 367, 'hill', 'd91fff1df19a7370f4e028f0e15afb2a.jpg', '3', '', '2024-07-15 11:15:12', '2024-07-15 05:30:30', '1425', '9813891104', 'श्री');

-- --------------------------------------------------------

--
-- Table structure for table `home_road_certify_land`
--

CREATE TABLE IF NOT EXISTS `home_road_certify_land` (
  `id` int(11) NOT NULL,
  `darta_id` bigint(20) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `map_sheet_no` varchar(255) NOT NULL,
  `land_area_type` int(11) DEFAULT NULL,
  `kitta_no` int(11) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `home` int(11) DEFAULT NULL,
  `home_type` int(11) DEFAULT NULL,
  `estimated_cost` float DEFAULT NULL,
  `road` int(11) DEFAULT NULL,
  `road_type` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `home_road_certify_land`
--

INSERT INTO `home_road_certify_land` (`id`, `darta_id`, `old_new_address`, `map_sheet_no`, `land_area_type`, `kitta_no`, `biggha`, `kattha`, `dhur`, `paisa`, `home`, `home_type`, `estimated_cost`, `road`, `road_type`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '1', 1, 2, 0, 0, 0, 0, 1, 3, 0, 0, NULL, '', '2024-07-15 11:15:12', '2024-07-15 05:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `income_details_en`
--

CREATE TABLE IF NOT EXISTS `income_details_en` (
  `id` int(11) NOT NULL,
  `income_source` text NOT NULL,
  `fy_i` varchar(255) NOT NULL,
  `fy_ii` varchar(255) NOT NULL,
  `fy_iii` varchar(255) NOT NULL,
  `main_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_verification`
--

CREATE TABLE IF NOT EXISTS `income_verification` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `income_verification_detail`
--

CREATE TABLE IF NOT EXISTS `income_verification_detail` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `relation` int(11) NOT NULL,
  `parties_name` text NOT NULL,
  `annual_income` float NOT NULL,
  `remark` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `janma_miti_pramanit`
--

CREATE TABLE IF NOT EXISTS `janma_miti_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `child_name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `nepali_dob` varchar(50) NOT NULL,
  `english_dob` date NOT NULL,
  `birth_place` text NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `suchak_name` text NOT NULL,
  `father_citizenship_no` varchar(125) NOT NULL,
  `mother_citizenship_no` varchar(125) NOT NULL,
  `suchak_citizenship_no` varchar(125) NOT NULL,
  `date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jet_machine`
--

CREATE TABLE IF NOT EXISTS `jet_machine` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `machine_dine_tham` text NOT NULL,
  `road_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `work_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `karar_niyukti`
--

CREATE TABLE IF NOT EXISTS `karar_niyukti` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `position` varchar(255) NOT NULL,
  `reason_for` varchar(255) NOT NULL,
  `yain` varchar(255) NOT NULL,
  `responsbility` varchar(255) NOT NULL,
  `assigned_sakha` varchar(255) NOT NULL,
  `sakha_address` varchar(255) NOT NULL,
  `niyukta_miti` varchar(255) NOT NULL,
  `karar_period` varchar(255) NOT NULL,
  `bodartha` varchar(255) NOT NULL,
  `docs` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `khanepani_jadan`
--

CREATE TABLE IF NOT EXISTS `khanepani_jadan` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `nepali_permission_date` text NOT NULL,
  `permission_date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward_no` varchar(50) NOT NULL,
  `old_address` int(11) NOT NULL,
  `kitta_no` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `ghar_sampann` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kitta_kat_sifaris`
--

CREATE TABLE IF NOT EXISTS `kitta_kat_sifaris` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` text NOT NULL,
  `date` date NOT NULL,
  `owner_name` text NOT NULL,
  `kittakat_area` varchar(20) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `direction` int(11) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` int(11) NOT NULL,
  `dhur` int(11) NOT NULL,
  `paisa` float NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `map_sheet_no` int(11) NOT NULL,
  `kitta_no` int(11) NOT NULL,
  `ghar_area` text NOT NULL,
  `first_floor_home_area` text NOT NULL,
  `paune_far` text NOT NULL,
  `reason` text NOT NULL,
  `technician_name` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `con_no` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `kotha_khali_suchana`
--

CREATE TABLE IF NOT EXISTS `kotha_khali_suchana` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `lalpurja_pratilipi`
--

CREATE TABLE IF NOT EXISTS `lalpurja_pratilipi` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `nepali_date` varbinary(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `citizenship_no` varchar(50) NOT NULL,
  `nep_citizenship_date` varchar(50) NOT NULL,
  `eng_citizenship_date` date NOT NULL,
  `father_name` text NOT NULL,
  `grandfather_name` text NOT NULL,
  `a_state` int(11) NOT NULL,
  `a_district` int(11) NOT NULL,
  `a_local_body` int(11) NOT NULL,
  `a_ward` int(11) NOT NULL,
  `a_old_place` int(11) NOT NULL,
  `land_owner_name` text NOT NULL,
  `kitta_no` varchar(50) NOT NULL,
  `biggha` float NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `l_state` int(11) NOT NULL,
  `l_district` int(11) NOT NULL,
  `l_local_body` int(11) NOT NULL,
  `l_ward_no` int(11) NOT NULL,
  `l_old_place` text NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `lo_type` varchar(255) DEFAULT NULL,
  `copy_reason` varchar(255) DEFAULT NULL,
  `jari_jilla` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `land_category`
--

CREATE TABLE IF NOT EXISTS `land_category` (
  `id` int(11) NOT NULL,
  `category` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` varchar(15) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `land_category`
--

INSERT INTO `land_category` (`id`, `category`, `added_by`, `added_on`) VALUES
(1, 'अब्बल ', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `letter_head`
--

CREATE TABLE IF NOT EXISTS `letter_head` (
  `id` int(11) NOT NULL,
  `site_office` varchar(255) NOT NULL,
  `site_office_alignment` varchar(255) NOT NULL,
  `site_palika` varchar(255) NOT NULL,
  `site_palika_alignment` varchar(255) NOT NULL,
  `site_state` varchar(255) NOT NULL,
  `site_address` varchar(255) NOT NULL,
  `site_address_alignment` varchar(255) NOT NULL,
  `site_website` varchar(255) NOT NULL,
  `site_website_alignment` varchar(255) NOT NULL,
  `site_email` varchar(255) NOT NULL,
  `site_email_alignment` varchar(255) NOT NULL,
  `site_slogan` varchar(255) NOT NULL,
  `site_slogan_alignment` varchar(255) NOT NULL,
  `created_at` varchar(255) NOT NULL,
  `site_phone` int(11) DEFAULT NULL,
  `site_phone_alignment` varchar(255) DEFAULT NULL,
  `site_office_en` varchar(255) DEFAULT NULL,
  `site_palika_en` varchar(255) DEFAULT NULL,
  `site_website_en` varchar(255) DEFAULT NULL,
  `site_website_alignment_en` varchar(255) DEFAULT NULL,
  `site_email_en` varchar(255) DEFAULT NULL,
  `site_email_alignment_en` varchar(255) DEFAULT NULL,
  `site_slogan_en` varchar(255) DEFAULT NULL,
  `site_slogan_alignment_en` varchar(255) DEFAULT NULL,
  `site_phone_en` varchar(255) DEFAULT NULL,
  `site_phone_alignment_en` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `letter_head`
--

INSERT INTO `letter_head` (`id`, `site_office`, `site_office_alignment`, `site_palika`, `site_palika_alignment`, `site_state`, `site_address`, `site_address_alignment`, `site_website`, `site_website_alignment`, `site_email`, `site_email_alignment`, `site_slogan`, `site_slogan_alignment`, `created_at`, `site_phone`, `site_phone_alignment`, `site_office_en`, `site_palika_en`, `site_website_en`, `site_website_alignment_en`, `site_email_en`, `site_email_alignment_en`, `site_slogan_en`, `site_slogan_alignment_en`, `site_phone_en`, `site_phone_alignment_en`) VALUES
(1, '', '', '', '', '', '', '', '', '', '', '', '', '', '2024-05-27 01:49:28pm', 0, '', '', '', '', '', '', '', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `married_en`
--

CREATE TABLE IF NOT EXISTS `married_en` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `gender` int(11) DEFAULT NULL,
  `app_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `ctn_no` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ganapa` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `wife_name` varchar(255) NOT NULL,
  `wife_father_name` varchar(255) NOT NULL,
  `wife_mother_name` varchar(255) NOT NULL,
  `wife_state` int(11) NOT NULL,
  `wife_district` int(11) NOT NULL,
  `married_date_ad` varchar(255) NOT NULL,
  `married_date_bs` varchar(255) NOT NULL,
  `wife_ganapa` int(11) NOT NULL,
  `wife_ward` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maujuda_suchi`
--

CREATE TABLE IF NOT EXISTS `maujuda_suchi` (
  `id` int(11) NOT NULL,
  `contact_name` text NOT NULL,
  `contact_number` varchar(30) NOT NULL,
  `work_type` int(11) NOT NULL,
  `service_type` int(11) NOT NULL,
  `niwedan_darta_miti_eng` date NOT NULL,
  `niwedan_darta_miti_nep` varchar(50) NOT NULL,
  `sanstha_darta_no` bigint(20) NOT NULL,
  `darta_type` enum('pan','vat') NOT NULL,
  `pan_vat_no` bigint(20) NOT NULL,
  `is_renewed` enum('yes','no') NOT NULL,
  `karyanubhab` text NOT NULL,
  `lakshit_group` text NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mirtyu_darta`
--

CREATE TABLE IF NOT EXISTS `mirtyu_darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `gender` int(11) NOT NULL,
  `applicant_name` varchar(125) NOT NULL,
  `death_person_name` varchar(125) NOT NULL,
  `grandfather_name` varchar(125) NOT NULL,
  `nep_dod` varchar(100) NOT NULL,
  `eng_dod` date NOT NULL,
  `citizenship_no` varchar(50) NOT NULL,
  `citizenship_nep_date` varchar(100) NOT NULL,
  `citizenship_eng_date` date NOT NULL,
  `citizenship_district` int(11) NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `date` date NOT NULL,
  `age` int(11) NOT NULL,
  `death_state` int(11) NOT NULL,
  `death_district` int(11) NOT NULL,
  `death_local_body` int(11) NOT NULL,
  `death_ward` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `mohi_lagat`
--

CREATE TABLE IF NOT EXISTS `mohi_lagat` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `nepali_date` varbinary(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `land_owner_name` text NOT NULL,
  `kitta_no` varchar(50) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `mohi_name` text NOT NULL,
  `map_sheet_no` varchar(50) NOT NULL,
  `nepali_visit_date` varchar(50) NOT NULL,
  `english_visit_date` date NOT NULL,
  `local_body` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `old_place` text NOT NULL,
  `con_no` varchar(255) DEFAULT NULL,
  `con_no_1` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL,
  `cit_no_1` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL,
  `gender_spec_1` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `naamsari_jagga_wiwaran`
--

CREATE TABLE IF NOT EXISTS `naamsari_jagga_wiwaran` (
  `id` int(11) NOT NULL,
  `kitta` varchar(255) NOT NULL,
  `map_sheet_no` varchar(255) NOT NULL,
  `home_no` varchar(255) NOT NULL,
  `biggha` varchar(255) NOT NULL,
  `kattha` varchar(255) NOT NULL,
  `paisa` varchar(255) NOT NULL,
  `dhur` varchar(255) NOT NULL,
  `road_type` varchar(255) NOT NULL,
  `road_name` text NOT NULL,
  `ward` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `entry_id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nabalak_pramanit`
--

CREATE TABLE IF NOT EXISTS `nabalak_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `nep_first_name` text NOT NULL,
  `nep_middle_name` text NOT NULL,
  `nep_last_name` text NOT NULL,
  `eng_first_name` text NOT NULL,
  `eng_middle_name` text NOT NULL,
  `eng_last_name` text NOT NULL,
  `gender` text NOT NULL,
  `nep_dob` varchar(50) NOT NULL,
  `eng_dob` date NOT NULL,
  `p_state` int(11) NOT NULL,
  `p_district` int(11) NOT NULL,
  `p_local_body` int(11) NOT NULL,
  `p_ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `applicant_name` text NOT NULL,
  `relationship` text NOT NULL,
  `birthplace_nep` text NOT NULL,
  `birthplace_eng` text NOT NULL,
  `father_name_nep` text NOT NULL,
  `father_name_eng` text NOT NULL,
  `mother_name_nep` text NOT NULL,
  `mother_name_eng` text NOT NULL,
  `gurdians_name_nep` text NOT NULL,
  `gurdians_name_eng` text NOT NULL,
  `gurdians_address` text NOT NULL,
  `j_state` int(11) DEFAULT NULL,
  `j_district` int(11) DEFAULT NULL,
  `j_local_body` int(11) DEFAULT NULL,
  `j_ward` int(11) DEFAULT NULL,
  `others` varchar(255) DEFAULT NULL,
  `born_country_name` varchar(255) DEFAULT NULL,
  `country_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `name_verification_en`
--

CREATE TABLE IF NOT EXISTS `name_verification_en` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `darta_no` int(11) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `grand_father_name` varchar(255) NOT NULL,
  `diff_name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nata_pramanit`
--

CREATE TABLE IF NOT EXISTS `nata_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `gender_spec` varchar(255) DEFAULT NULL,
  `cit_no` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `nata_pramanit_detail`
--

CREATE TABLE IF NOT EXISTS `nata_pramanit_detail` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `relation` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `add_cit_no` varchar(255) DEFAULT NULL,
  `commen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE IF NOT EXISTS `notification` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `from_department` int(11) NOT NULL,
  `to_department` int(11) NOT NULL,
  `is_seen` enum('0','1') NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `prabhidik_mulyankan`
--

CREATE TABLE IF NOT EXISTS `prabhidik_mulyankan` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `nepali_chalani_date` varchar(50) NOT NULL,
  `english_chalani_date` date NOT NULL,
  `chalani_no` bigint(20) NOT NULL,
  `date` date NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `print_details`
--

CREATE TABLE IF NOT EXISTS `print_details` (
  `id` int(11) NOT NULL,
  `uri` varchar(125) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `worker_id` varchar(255) NOT NULL,
  `office_id` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `print_details`
--

INSERT INTO `print_details` (`id`, `uri`, `form_id`, `worker_id`, `office_id`, `created_at`, `updated_at`) VALUES
(1, 'citizenship-sifaris', 8764532910, '1', '3', '2024-07-15 12:38:21', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `property_detail_en`
--

CREATE TABLE IF NOT EXISTS `property_detail_en` (
  `id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `owner_name` varchar(255) NOT NULL,
  `descp` varchar(255) NOT NULL,
  `location` text NOT NULL,
  `plot_no` varchar(255) NOT NULL,
  `area` varchar(255) NOT NULL,
  `amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_valuation`
--

CREATE TABLE IF NOT EXISTS `property_valuation` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `land_type` enum('hill','terai') NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `update_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_valuation_detail`
--

CREATE TABLE IF NOT EXISTS `property_valuation_detail` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `owner` text NOT NULL,
  `plot_no` varchar(20) NOT NULL,
  `biggha` float NOT NULL,
  `kattha` float NOT NULL,
  `dhur` float NOT NULL,
  `paisa` float NOT NULL,
  `total_value` float NOT NULL,
  `remark` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `property_valuation_en`
--

CREATE TABLE IF NOT EXISTS `property_valuation_en` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `darta_no` int(11) DEFAULT NULL,
  `gender` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ganapa` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `created_by` int(11) NOT NULL,
  `created_at` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relation_members`
--

CREATE TABLE IF NOT EXISTS `relation_members` (
  `id` int(11) NOT NULL,
  `main_id` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `relation` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `relation_ship`
--

CREATE TABLE IF NOT EXISTS `relation_ship` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `date` varchar(25) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_gapana` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `rem_ward` int(11) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` varchar(25) NOT NULL,
  `added_ward` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sachiwalaya_darta`
--

CREATE TABLE IF NOT EXISTS `sachiwalaya_darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `is_muncipality` enum('0','1') NOT NULL,
  `darta_no` bigint(20) NOT NULL,
  `patra_chalani_no` int(11) NOT NULL,
  `is_complete` enum('0','1') NOT NULL DEFAULT '0',
  `ward_login` int(11) NOT NULL,
  `department` varchar(10) DEFAULT NULL,
  `link` text NOT NULL,
  `nepali_darta_miti` varchar(50) NOT NULL,
  `english_darta_miti` date NOT NULL,
  `applicant_name` text NOT NULL,
  `letter_subject` text NOT NULL,
  `letter_type` enum('important','most_important','deadlined') NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `description` text NOT NULL,
  `deadline_nep` varchar(80) NOT NULL,
  `deadline_eng` date NOT NULL,
  `transfer_date_nep` varchar(80) NOT NULL,
  `transfer_date_eng` date NOT NULL,
  `patra_miti_nep` varchar(80) NOT NULL,
  `patra_miti_eng` date NOT NULL,
  `karmachari_name` text DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sadak_khanne_swikriti`
--

CREATE TABLE IF NOT EXISTS `sadak_khanne_swikriti` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `gender` int(11) NOT NULL,
  `nep_applicated_date` varchar(50) NOT NULL,
  `eng_applicated_date` date NOT NULL,
  `completion_time` int(11) NOT NULL,
  `road_name` text NOT NULL,
  `road_quantity` float NOT NULL,
  `refundable_amount` float NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` varchar(255) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `applic` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `salary_approval`
--

CREATE TABLE IF NOT EXISTS `salary_approval` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cit_no` varchar(255) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `ganapa` int(11) DEFAULT NULL,
  `ward` int(11) DEFAULT NULL,
  `taha` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `basic_salary` varchar(255) NOT NULL,
  `grade` varchar(255) NOT NULL,
  `bhatta` varchar(255) NOT NULL,
  `local_bhatta` varchar(25) NOT NULL,
  `pf` varchar(255) NOT NULL,
  `bima` varchar(25) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha_darta`
--

CREATE TABLE IF NOT EXISTS `sanstha_darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `org_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tole_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha_darta_pramanpatra`
--

CREATE TABLE IF NOT EXISTS `sanstha_darta_pramanpatra` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `org_name` text NOT NULL,
  `subjected_area` text NOT NULL,
  `darta_no` varchar(15) NOT NULL,
  `nepali_darta_miti` varchar(50) NOT NULL,
  `english_darta_miti` date NOT NULL,
  `org_state` int(11) NOT NULL,
  `org_district` int(11) NOT NULL,
  `org_local_body` int(11) NOT NULL,
  `org_ward` int(11) NOT NULL,
  `org_email` varchar(80) NOT NULL,
  `org_contact_no` varchar(50) NOT NULL,
  `nationality` int(11) NOT NULL,
  `nepali_transact_date` varchar(80) NOT NULL,
  `english_transact_date` date NOT NULL,
  `owner_name` text NOT NULL,
  `own_email` varchar(80) NOT NULL,
  `own_state` int(11) NOT NULL,
  `own_district` int(11) NOT NULL,
  `own_local_body` int(11) NOT NULL,
  `own_ward` int(11) NOT NULL,
  `own_contact_no` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` text NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `cit_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sanstha_nabikaran`
--

CREATE TABLE IF NOT EXISTS `sanstha_nabikaran` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `org_name` text NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(50) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `nepali_date_1` varchar(255) DEFAULT NULL,
  `tole_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sawari_pass`
--

CREATE TABLE IF NOT EXISTS `sawari_pass` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `name` varchar(255) NOT NULL,
  `destination` varchar(255) NOT NULL,
  `vehicle_no` varchar(255) NOT NULL,
  `from_date` varchar(25) NOT NULL,
  `to_date` varchar(25) NOT NULL,
  `driver_name` varchar(255) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship`
--

CREATE TABLE IF NOT EXISTS `scholarship` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `father_name` text NOT NULL,
  `mother_name` text NOT NULL,
  `resident_type` varchar(10) NOT NULL,
  `finance_condition` varchar(4) NOT NULL,
  `date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `scholarship_detail`
--

CREATE TABLE IF NOT EXISTS `scholarship_detail` (
  `id` int(11) NOT NULL,
  `darta_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `relation` int(11) NOT NULL,
  `ghar_no` varchar(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings_bodartha`
--

CREATE TABLE IF NOT EXISTS `settings_bodartha` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_bodartha`
--

INSERT INTO `settings_bodartha` (`id`, `name`) VALUES
(1, 'बोद्यार्थ 1'),
(2, 'बोद्यार्थ 2');

-- --------------------------------------------------------

--
-- Table structure for table `settings_department`
--

CREATE TABLE IF NOT EXISTS `settings_department` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_department`
--

INSERT INTO `settings_department` (`id`, `name`) VALUES
(1, 'आर्थिक प्रशासन शाखा'),
(2, 'शिक्षा, युवा तथा खेलकुद शाखा'),
(3, 'कर्मचारी प्रशासन शाखा'),
(5, 'स्वास्थ्य शाखा'),
(6, 'योजना शाखा'),
(11, 'जिन्सी व्यवस्थापन शाखा'),
(12, 'दर्ता / चलानी तथा सोधपुछ शाखा'),
(13, 'सुचना प्रविधि शाखा'),
(14, 'सहकारी शाखा'),
(15, 'भौतिक पूर्वाधार तथा वातावरण व्यवस्थापन शाखा'),
(16, 'नगर प्रमुखको सचिवालय'),
(17, 'राजश्व शाखा'),
(19, 'महिला, बालबालिका तथा ज्येष्ठ नागरिक शाखा '),
(20, 'न्याय परामर्श शाखा'),
(21, 'कृषि विकास शाखा'),
(22, 'पशु सेवा शाखा'),
(25, 'राेजगार सेवा केन्द्र'),
(26, 'सचिबालय'),
(27, 'सामाजिक सुरक्षा तथा व्यक्तिगत घटना दर्ता शाखा'),
(29, 'उद्योग शाखा'),
(30, 'विपद् व्यवस्थापन शाखा'),
(33, 'यो जो-जससँग सम्बन्ध राख्दछ ।');

-- --------------------------------------------------------

--
-- Table structure for table `settings_direction`
--

CREATE TABLE IF NOT EXISTS `settings_direction` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_direction`
--

INSERT INTO `settings_direction` (`id`, `name`) VALUES
(1, 'पुर्व'),
(2, 'पश्चिम'),
(3, 'उत्तर'),
(4, 'दक्षिण');

-- --------------------------------------------------------

--
-- Table structure for table `settings_disable_type`
--

CREATE TABLE IF NOT EXISTS `settings_disable_type` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_disable_type`
--

INSERT INTO `settings_disable_type` (`id`, `name`) VALUES
(1, 'शारीरिक अपाङ्ग वा विकलाङ्ग'),
(2, 'दृष्टिविहिन र न्युन दृष्टिविहिन'),
(3, 'स्वर बोलाई वा बोल्न नसक्ने'),
(4, 'सुस्त श्रवण'),
(5, 'वौद्धिक अपाङ्ग वा सुस्त मनस्थिति'),
(6, 'श्रवण दृष्टिविहिन'),
(7, 'अटिजम'),
(8, 'होमोफेरिया'),
(9, 'मनो सामाजिक अपाङ्गता');

-- --------------------------------------------------------

--
-- Table structure for table `settings_district`
--

CREATE TABLE IF NOT EXISTS `settings_district` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `english_name` text NOT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings_district`
--

INSERT INTO `settings_district` (`id`, `name`, `english_name`, `state`) VALUES
(1, 'ताप्लेजुङ', 'Taplejung', 1),
(2, 'पाँचथर', 'Panchthar', 1),
(3, 'ईलाम', 'Ilam', 1),
(4, 'झापा', 'Jhapa', 1),
(5, 'मोरङ', 'Morang', 1),
(6, 'सुनसरी', 'Sunsari', 1),
(7, 'धनकुटा', 'Dhankuta', 1),
(8, 'तेह्रथुम', 'Terhathun', 1),
(9, 'संखुवासभा', 'Sankhuwasabha', 1),
(10, 'भोजपुर', 'Bhojpur', 1),
(11, 'सोलुखुम्बु', 'Solukhumbu', 1),
(12, 'ओखलढुंगा', 'Okhaldhunga', 1),
(13, 'खोटाङ', 'khotang', 1),
(14, 'उदयपुर', 'Udayapur', 1),
(15, 'सप्तरी', 'Saptari', 2),
(16, 'सिराहा', 'Siraha', 2),
(17, 'धनुषा', 'Dhunusha', 2),
(18, 'महोत्तरी', 'Mahottari', 2),
(19, 'सर्लाही', 'Sarlahi', 2),
(20, 'रौतहट', 'Rautahat', 2),
(21, 'वारा', 'Bara', 2),
(22, 'पर्सा', 'Parsa', 2),
(23, 'सिन्धुली', 'Sindhuli', 3),
(24, 'रामेछाप', 'Ramechhap', 3),
(25, 'दोलखा', 'Dolakha', 3),
(26, 'सिन्धुपाल्चोक', 'Sidhupalchok', 3),
(27, 'काभ्रेपलान्चोक', 'Kavrepalanchok', 3),
(28, 'ललितपुर', 'Lalitpur', 3),
(29, 'भक्तपुर', 'Bhaktapur', 3),
(30, 'काठमाण्डौ', 'Kathmandu', 3),
(31, 'नुवाकोट', 'Nuwakot', 3),
(32, 'रसुवा', 'Rasuwa', 3),
(33, 'धादिङ', 'Dhading', 3),
(34, 'मकवानपुर', 'Makawanpur', 3),
(35, 'चितवन', 'Chitwan', 3),
(36, 'गोरखा', 'Gorakha', 4),
(37, 'लमजुङ', 'Lamjung', 4),
(38, 'तनहुँ', 'Tanahun', 4),
(39, 'स्याङ्जा', 'Syangja', 4),
(40, 'कास्की', 'Kaski', 4),
(41, 'मनाङ', 'Manang', 4),
(42, 'मुस्ताङ', 'Mustang', 4),
(43, 'म्याग्दी', 'Myagdi', 4),
(44, 'पर्वत', 'Parbat', 4),
(45, 'वाग्लुङ', 'Baglung', 4),
(46, 'नवलपरासी (सुस्ता पुर्व)', 'Nawalparasi (Susta Purwa)', 4),
(47, 'गुल्मी', 'Gulmi', 5),
(48, 'पाल्पा', 'Palpa', 5),
(49, 'रुपन्देही', 'Rupandehi', 5),
(50, 'कपिलवस्तु', 'kapikwastu', 5),
(51, 'अर्घाखाँची', 'Arghakhanchi', 5),
(52, 'प्यूठान', 'Pyuthan', 5),
(53, 'रोल्पा', 'Rolpa', 5),
(54, 'रुकुम (पूर्वी भाग)', 'Rukum (Eastern)', 5),
(55, 'दाङ', 'Dang', 5),
(56, 'बाँके', 'Banke', 5),
(57, 'बर्दिया', 'Bardiya', 5),
(58, 'नवलपरासी (सुस्ता पश्चिम)', 'Nawalparasi (Susta Paschim)', 5),
(59, 'रुकुम (पश्चिम भाग)', 'Rukum (Westren) ', 6),
(60, 'सल्यान', 'Salyan', 6),
(61, 'सुर्खेत', 'Surkhet', 6),
(62, 'दैलेख', 'Dailekh', 6),
(63, 'जाजरकोट', 'Jajarkot', 6),
(64, 'डोल्पा', 'Dolpa', 6),
(65, 'जुम्ला', 'Jumla', 6),
(66, 'कालिकोट', 'Kalikot', 6),
(67, 'मुगु', 'Mugu', 6),
(68, 'हुम्ला', 'Humla', 6),
(69, 'बाजुरा', 'Bajura', 7),
(70, 'बझाङ', 'Bajhang', 7),
(71, 'अछाम', 'Achham', 7),
(72, 'डोटी', 'Doti', 7),
(73, 'कैलाली', 'Kailali', 7),
(74, 'कञ्चनपुर', 'Kanchanpur', 7),
(75, 'डडेलधुरा', 'Dadeldhura', 7),
(76, 'बैतडी', 'Baitadi', 7),
(77, 'दार्चुला', 'Darchula', 7);

-- --------------------------------------------------------

--
-- Table structure for table `settings_document`
--

CREATE TABLE IF NOT EXISTS `settings_document` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `patra_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_document`
--

INSERT INTO `settings_document` (`id`, `name`, `patra_id`) VALUES
(1, 'घर जग्गा नामसारी सम्बन्धी निवेदन', 3),
(2, 'नागरिकता प्रमाणपत्रको प्रतिलिपि', 3),
(3, 'निवेदन', 2),
(4, 'निवेदन', 21),
(5, 'जन्म/विवाह/बसाइसराइ/मृत्यु दर्ता प्रतिलिपी', 21),
(6, 'शैक्षिक याेग्यताकाे प्रमाण-पत्रकाे प्रतिलिपी', 21),
(7, 'बाबु/आमा/पति/पत्नीकाे नागरीकता प्रमाण-पत्रकाे प्रतिलिपी', 21),
(8, 'जग्गा धनि प्रमाणपत्रको प्रतिलिपि ', 2),
(9, 'निवेदन', 44),
(10, 'बाबु वा आमाको नागरिकताको प्रतिलिपि', 44),
(11, 'निवेदन	', 22),
(12, 'निवेदन	', 1),
(13, 'निवेदन	', 4),
(14, 'निवेदन	', 145),
(15, 'निबेदन ', 8);

-- --------------------------------------------------------

--
-- Table structure for table `settings_eutype`
--

CREATE TABLE IF NOT EXISTS `settings_eutype` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_eutype`
--

INSERT INTO `settings_eutype` (`id`, `name`) VALUES
(1, 'धरायसी '),
(2, 'ब्यापारिक'),
(3, 'उत्तर'),
(4, 'दक्षिण'),
(5, 'कृषि');

-- --------------------------------------------------------

--
-- Table structure for table `settings_home_type`
--

CREATE TABLE IF NOT EXISTS `settings_home_type` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_home_type`
--

INSERT INTO `settings_home_type` (`id`, `name`) VALUES
(1, 'अन्य फुसको कच्ची घर'),
(2, 'काठको फुसको कच्ची घर'),
(3, 'काठको भुइँतले कच्ची घर टिन वा टायलको छाना'),
(4, 'काठको टाँडे घर, टिन वा टायलको छाना'),
(5, 'पक्की ईटाको जोडाईमा टिनको छाना'),
(6, 'पक्की छतको ढलान'),
(7, 'माटोको कच्ची घर ');

-- --------------------------------------------------------

--
-- Table structure for table `settings_letter_subject`
--

CREATE TABLE IF NOT EXISTS `settings_letter_subject` (
  `id` int(11) NOT NULL,
  `letter_type` int(11) NOT NULL,
  `subject` text NOT NULL,
  `patra_id` int(11) DEFAULT NULL,
  `content` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_letter_subject`
--

INSERT INTO `settings_letter_subject` (`id`, `letter_type`, `subject`, `patra_id`, `content`, `created_at`, `updated_at`) VALUES
(1, 3, 'घर बेचर', 49, '<p>जनाववन</p>\r\n', '2021-07-27 07:36:34', '2021-07-27 18:21:34'),
(2, 7, 'बैंक पत्र', 59, '<p>fsagasdfasd</p>\r\n', '2021-04-12 07:28:55', '2021-04-12 18:13:55'),
(3, 7, 'कम्पनीको छाप (Stamp) परिवर्तन गरी पाउँ ।', 60, '', '2021-04-20 19:34:48', NULL),
(4, 11, 'tetst', 63, '<p>kldsjflkjkld</p>\r\n\r\n<p>lkfdsjlkjlk</p>\r\n\r\n<p>nlkfsjkld</p>\r\n', '2021-05-09 11:26:44', '2021-05-09 22:11:44'),
(5, 11, 'tetst', 64, '', '2021-05-09 22:08:38', NULL),
(6, 11, 'tetst', 65, '', '2021-05-09 22:08:39', NULL),
(7, 11, 'बैंक पत्र', 66, '', '2021-05-09 22:18:51', NULL),
(8, 11, 'बैंक पत्र', 67, '', '2021-05-09 22:18:52', NULL),
(9, 11, 'बैंक पत्र', 68, '', '2021-05-09 22:18:53', NULL),
(10, 11, 'बैंक पत्र', 69, '', '2021-05-09 22:18:58', NULL),
(11, 13, 'सिफारिस सम्बन्धमा ।', 71, '<p>प्रस्तुत विषयका सम्बन्धमा पर्वत जिल्ला जलजला गाउँपालिका वडा नं ०७ बस्ने श्री ज्ञानेश्वर आचार्य काे नेपाली नागरिकतामा जन्म मिती २०४८/०४/३१ निजकाे शैशिक प्रमाण पत्रमा जन्म मिती २०४८/०४/३२ भै जन्म मिती फरक फरक भएकाेले&nbsp; नेपाली नागरिकता अनुसार निजकाे जन्म मिती २०४८/०४/३१&nbsp;&nbsp;शैक्षिक प्रमाण पत्रमा सच्चाईउनकाे लागि आवश्यक प्रक्रिया अगाडी वढाई दिनुहुन&nbsp;&nbsp;सिफारिस साथ अनुरोध छ ।</p>\r\n', '2023-06-18 04:49:10', '2023-06-18 15:34:10'),
(12, 11, 'सिफारिस सम्बन्धमा ।', 72, '<p>प्रस्तुत विषयकाे सम्वन्धमा जिल्ला&nbsp;पर्वत जलजला गाउपालिका वडा नं ०७ मा रहेकाे&nbsp;लालाीगुरास युवाक्लव ले, भलिवल ग्राउण्ड निर्माण तथा वल नेट जाली ड्रेसकाे&nbsp;लागि यस&nbsp;जलजला गाउँपालिका वडा नं ०७ धाईरिङ मा&nbsp;&nbsp; सिफारिसका लागि&nbsp;रित पुर्वककाे निवेदन पेश हुन आएकाेले&nbsp;उक्त लालाीगुरास युवाक्लव लाई&nbsp;साेही वमाेजिमकाे लालाीगुरास युवाक्लव ले, भलिवल ग्राउण्ड निर्माण तथा वल नेट जाली ड्रेसकाे लागि&nbsp;सिफारिस गरिएकाे व्यहाेरा अनुरोध छ।&nbsp;&nbsp;</p>\r\n', '2023-04-13 05:13:45', '2023-04-13 15:58:45'),
(13, 11, 'सिफारिस सम्बन्दमा ', 73, '<p>&nbsp;प्रस्तुत विषयका सम्बन्धमा पर्वत जिल्ला जलजला गाउँपालिका वडा नं ०७ बस्ने श्री ईश्वरी पाठक&nbsp; को छोरा अमृत पाठक काे नाक सम्वन्धी राेगकाे कारण नाककाे उपचार गरिरहेकाे&nbsp;रहेको निजको घरको आर्थिक अवस्था निकै कमजोर भएको भएकोले निजलाई उपचारको लागि &nbsp;आर्थिक सहयोग उपलव्ध&nbsp;&nbsp;गरिदिनुहुन सिफास साथ अनुरोध छ ।&nbsp;</p>\r\n', '2023-03-23 06:37:24', '2023-03-23 17:22:24'),
(14, 13, 'व्याक्ति एउटै सम्बन्धमा', 74, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ वस्ने टिका राम&nbsp; जैसीकाे छाेरी विष्नु आचार्य&nbsp;जन्म दर्तामा जन्म मिति २०५९/१२/१०र निजकाे शैक्षिक प्रमाण पत्रमा निजकाे जन्म मिति २०६०/१२/१०भै फरक फरक जन्म मिति भएता पनि निज एउटै व्यक्ती भएकाे निजलाई शैक्षिक प्रमाण पत्रकाे आधारमा नेपाली नागरिकता वनाईदिएमा कुनै फरक नपर्ने व्यहाेर सिफारिस साथ अनुराेध छ ।</p>\r\n', '2023-03-03 07:26:33', '2023-03-03 19:11:33'),
(15, 13, 'यो जो जस संग सम्वन्ध राख्दछ ।', 75, '<p>प्स्तुत विषयकाे सम्वन्धमा प्रर्वत जिल्ला जलजला&nbsp; गाउपालिका वडा न०७&nbsp; साविक धाईरिङ ग.वि.स. ०७ वस्ने श्री&nbsp; डिल्लीराम सुनार काे श्रीमती सुन्तली&nbsp;वि.क सुनार . जलजला गाउपालिका वडा ०७ काे वासिन्दा भएकाे&nbsp;सिफारिस पाउ भनि यस कार्यालयमा दिएकाे निवेदन अनुसार निज सुन्तली वि.क सुनार&nbsp;जलजला गाउपलिका वडा न ०७काे स्थायी&nbsp;वासिन्दा भएकाे व्यहाेरा&nbsp; जनाकारीकाे लागी अनुराेध छ।</p>\r\n', '2021-09-26 06:42:11', '2021-09-26 17:27:11'),
(16, 13, 'सामाजिक सुरक्षा परिचयपत्र नविकरण गराउने सम्बन्धि अत्यन्त जरुरी सुचना ।।', 76, '', '2021-07-27 12:30:00', NULL),
(17, 13, 'सिफारिस सम्बन्धमा', 77, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ मा रहेकाे श्री अमर प्र.वी मा विधालय व्यवस्थापनमा जलजला गाउपालिका काे&nbsp; गाउ साभा वाट विनियाेजित रकम रु ५०००० काे व्यवस्थापन कार्य सम्पन्न भएकाे भुक्तानीकाे काे लागी सम्वन्धित निकायमा सिफारिस गरिपाउ भनि यस कार्यालयमा दिएकाे निवेदन अनुसार उक्त याेजनाकाे फरफारक गरि भुक्तानी काे प्रक्रिया अगाडी वढाई दिनु हुन&nbsp;सिफारिस साथ अनुराेध छ ।</p>\r\n', '2022-09-04 04:12:54', '2022-09-04 14:57:54'),
(18, 12, 'जानकारि सम्बन्धमा', 78, '<p>प्रस्तुत विषयाकाे&nbsp;सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ वस्ने प्रतिक्षा रिजाल ले दिएकाे निवेदन अनुसार निज प्रतिक्षा रिजाल काे नेपाली नागरिकता मा आमाकाे नामथर &nbsp;डिल शाेभा पाध्या&nbsp;भएकाे आमाकाे नेपाली नागरिकता प्नमाण पत्रमा डिल शाेभा पाध्या भई&nbsp; आमा छाेरीकाे थरहरु कतै रिजाल&nbsp;.&nbsp;पाध्या र उपाध्याय भएतापनी प्रतिक्षा रिजाल र डिल शाेभा&nbsp; उपाध्याय&nbsp;आमा छाेरी&nbsp;&nbsp;भएकाे व्यहाेरा&nbsp; निवेदककाे निवेदन अनुसार जानकारी काे लागी अनुराेध छ ।</p>\r\n', '2022-01-16 08:41:28', '2022-01-16 20:26:28'),
(19, 12, 'जानकारि सम्बन्धमा', 79, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजलागाउपालिका वडा नं ०७ मा तहा कार्यालयकाे च नं १६५०काे मिति २०७९/०३/१२काे प्राप्त&nbsp; पत्र अनुसार अ.सव ईन्जिनियर श्री झम्क नाथ पाैडेल ज्युले जलजला गाउपालिका वडा नं ०७ काे वडा&nbsp; कार्यालयमा हाजिरी भई काम काज सम्हालेकाे व्यहाेरा जानकारीकाे लागी अनुराेध छ ।</p>\r\n', '2022-07-25 06:47:47', '2022-07-25 17:32:47'),
(20, 5, 'प्रमाणित सम्बन्धमा', 80, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजलागाउपालिका वडा नं ०७ वस्ने अनिल आचार्यकाे स्थाई ठेगाना&nbsp; साविक धाईरिङ गा.वि.स वडा नं ०४ हाल मिति २०७३ काे राज्य पुन संरचना पछि जलजला गाउपालिका वडा नं ०७ भएकाे व्यहाेरा प्रमाणित गरिन्छ ।</p>\r\n', '2022-09-09 05:30:22', '2022-09-09 16:15:22'),
(21, 9, 'चालु खर्च निकाशा सम्बन्धमा', 81, '', '2021-09-24 13:22:56', NULL),
(22, 9, 'चालु खर्च निकाशा सम्बन्धमा', 82, '<p>हेल्लो आज यता&nbsp;</p>\r\n', '2024-06-28 08:30:31', '2024-06-28 08:30:31'),
(23, 9, 'चालु खर्च निकाशा सम्बन्धमा', 83, '', '2021-09-24 13:36:17', NULL),
(24, 13, 'सुचना टास गरिएकाे सम्बन्धमा ', 84, '<p>लिखितम् पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ वडा कार्यालयमा पर्वत जिल्ला मालपाेत &nbsp;कार्यालयकाे च नं ७०० मिति २०७८-०७-०२ काे पत्र अनुसार ३५दिने सुचना टास गर्न पत्र प्रप्त भए&nbsp;अनुसार यस कार्यलयकाे सुचना पाटीमा तपशिलका पदाधिकारी तथा व्यक्तीकाे राेहवरमा सुचना&nbsp;टासकाे मुचुल्का गरि सुचना टास गरिएकाे छ।&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; तपशिल</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; टुङ्गनाथ शर्मा&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; वडा अध्यक्ष</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; माेहदत्त पाैडेल&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;वडा सचिव</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;याेगेन्द्र उपाध्य पाैडेल&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; कार्यालय सहयाेगी</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>\r\n\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\r\n', '2021-10-20 07:05:08', '2021-10-20 17:50:08'),
(25, 12, 'जानकारि सम्बन्धमा', 85, '', '2021-10-26 15:21:36', NULL),
(26, 12, 'जानकारि सम्बन्धमा', 86, '', '2021-10-26 15:21:41', NULL),
(27, 12, 'जानकारि सम्बन्धमा', 87, '', '2021-10-26 15:21:46', NULL),
(28, 3, 'नामसारीको सिफारिस सम्बन्धमा । ', 88, '', '2021-10-28 20:47:22', NULL),
(29, 3, 'नामसारीको सिफारिस सम्बन्धमा । ', 89, '', '2021-10-28 20:47:27', NULL),
(30, 13, 'जानकारि सम्बन्धमा', 90, '', '2021-11-03 17:55:52', NULL),
(31, 6, 'जन्म प्रमाणित सम्वन्धमा ', 91, '', '2021-11-14 21:01:22', NULL),
(32, 13, ' जन्म मिति प्रमाणित सम्वन्धमा ।', 92, '', '2021-11-14 21:04:05', NULL),
(33, 13, 'याेजन सम्झाैता  सम्वन्धमा ।', 93, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७मा रहेकाे गण्डकी गाेपाल गाैशालमा&nbsp; गण्डकी प्रदेश सरकारकाे आ.व.०७९/०८०&nbsp;स्विकृत कार्यक्रम अनुसार गण्डकी गाेपाल गाैशाला भवन मर्मत शिर्षकमा विनियाेजित रकम रु ५०००००/-काे काम मर्मत गर्दा पनि पुरानाे भवन&nbsp;हुने अवस्थाकाे नभई सह्रै जिर्ण भवन भएकाे हुदा टस भवन वनाउनकाे&nbsp; लागी&nbsp;&nbsp;याेजना सम्झाैताकाे लागी सम्वन्धित निकायमा सिफारिस गरिपाउ भनि यस कार्यालयमा दिएकाे निवेदन अनुसार नियमानुसार स्टमेट गराई अध्यक्ष श्री टेक नारायण पाध्यकाे नाममा सम्झाैता&nbsp;गरिदिनु &nbsp;हुन सिफारिस साथ अनुराेध छ ।</p>\r\n', '2023-02-12 09:04:10', '2023-02-12 20:49:10'),
(34, 13, 'भुक्तानी सम्वन्धमा ', 94, '<p>&nbsp;&nbsp; प्रस्तुत विषयको सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा न ०७वस्ने राम प्रसाद सुवेदी&nbsp; &nbsp;जलजला गाउपालिकाको आ.व.०७९/०८०काे&nbsp;स्विकृत कार्यक्रम अर्न्तगत उक्त भैसी खरिद कार्य सम्पन्न भयो भनी यस कार्यालयमा दिएको निवेदन अनुसार उक्त निजलाई विल भरपाई अनुगमन प्रतिवेदन अनुसार भुक्तानीको प्रक्रिया अगाडी वढाईदिनु हुन &nbsp;सिफारिस साथ अनुरोध छ ।</p>\r\n', '2023-05-02 05:00:11', '2023-05-02 15:45:11'),
(35, 13, 'मृत्यु प्रमाणित सम्बन्धमा', 95, '', '2021-12-05 19:03:17', NULL),
(36, 13, 'व्याक्ति प्रमाणित सम्बन्धमा', 96, '', '2021-12-07 19:23:20', NULL),
(37, 13, 'अध्ययान अवलाेकन सम्वन्धमा ।', 97, '', '2021-12-14 21:56:11', NULL),
(38, 13, 'अध्ययान अवलाेकन सम्वन्धमा ।', 98, '', '2021-12-14 21:56:22', NULL),
(39, 13, 'अध्ययान अवलाेकन सम्वन्धमा ।', 99, '', '2021-12-14 21:56:27', NULL),
(40, 11, 'अध्ययान अवलाेकन सम्वन्धमा ।', 100, '', '2021-12-14 21:57:18', NULL),
(41, 13, 'पेश्की फर्च्छौयोट सम्बन्धमा', 101, '', '2022-01-16 18:24:45', NULL),
(42, 13, 'चालु खर्च निकाशा सम्बन्धमा', 102, '', '2022-01-16 20:45:19', NULL),
(43, 13, 'प्रगति प्रतिवेदन पेश सम्बन्धमा', 103, '', '2022-01-20 15:05:05', NULL),
(44, 13, 'विल भरपाई अनुसारको रकम भुक्तानि गरिदिने वारे', 104, '', '2022-02-04 17:30:32', NULL),
(45, 13, 'योजना सम्झौता सम्बन्धमा', 105, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७मा जलजला गाउपालिका&nbsp; वाट&nbsp;&nbsp;आ&zwj;. व. ०७९/०८०&nbsp;विनियाेजित लघु उद्धमी&nbsp;अन्तर्गत&nbsp; साझ सुविधा केन्द्र काेशेली घर&nbsp;निर्माण समिती का अध्यक्ष श्री रिता दर्जी&nbsp;लाई उक्त याेजना सम्झाैता गराई कार्य अगाडी वढाई दिनु हुन सिफारिस साथ अनुराेध छ ।</p>\r\n', '2022-12-14 04:52:40', '2022-12-14 16:37:40'),
(46, 13, 'अविवाहित प्रमाणित सम्वन्धमा ।', 106, '', '2022-03-09 15:56:01', NULL),
(47, 13, 'अविवाहित प्रमाणित सम्वन्धमा ।', 107, '', '2022-03-09 15:56:06', NULL),
(48, 13, 'अविवाहित प्रमाणित सम्वन्धमा ।', 108, '', '2022-03-09 15:56:10', NULL),
(49, 13, 'सिफारिस सम्बन्धमा', 109, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपलिका वडा नं ०७ वस्ने श्री डण्डपाणी पाध्याकाे&nbsp;छाेरा राजाराम रिजाल काे स्याङ्जा जिल्ला पुतलीवजार नगरपालिका वडा नं०६&nbsp;वस्ने श्री माेहन वहादुर पाैडैलकाे&nbsp; छाेरी दिपा पाैडेल संग मिति २०७६/११/२८ मा विवाह भएकाे&nbsp;&nbsp;मैले जिल्ला प्रशाशन कार्यालय स्याङ्जा&nbsp;&nbsp;वाट ४२१००१/२१५ काे&nbsp;नेपाली नागरिकताकाे प्रमाण पत्र उपलव्ध गरेकाे&nbsp;हल मलाई पतिकाे नामथर वतन कायम गरी सम्शाेधित&nbsp; नेपाली नागरिकताकाे प्रमाण पत्र आवश्कता परेकाेले सम्शाेधित नेपाली नागरिकताकाे प्रमाण पत्रकाे लागि सम्वन्धित निकायमा सिफारिस गरिपाउ भनि यस कार्यालयमा दिएकाे निवेदन अनुसार जलजला गाउपालिका वडा नं ०७ वस्ने राजाराम रिजालकाे&nbsp;श्रिमती दिपा पाैडेल लाई पतिकाे नामथर वतन कायम गरि सम्शाेधित&nbsp; नेपाली नागरिकताकाे प्रमाण पत्र&nbsp;&nbsp;उपलब्ध गराइदिनु हुन&nbsp; सिफारिस साथ अनुरोध छ ।&nbsp;</p>\r\n', '2022-11-22 10:29:00', '2022-11-22 22:14:00'),
(50, 13, 'अक्तियारि उपलव्ध गराउने सम्बन्धमा', 110, '', '2022-04-01 14:45:59', NULL),
(51, 13, 'सिफारिस सम्बन्धमा', 111, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ वस्ने कपिलमणी खत्री क्षेत्रीकाे श्रीमती सुस्मिता क्षेत्री शाररिक तथा मानसिक अपाङ्गता भएकाे अपाङ्ग परिचय पत्रकाे&nbsp;लागी सम्वन्धित निकायमा सिफारिस गरिपाउ भनि यस कार्यालयमा दिएकाे निवेदन अनुसार निज शाररिक तथा मानसिक अपाङ्ग भएकाेले निजलाई नियमानुसार अपाङ्गता परिचय पत्र उपलव्ध गराईदिनु हुन&nbsp;&nbsp;सिफारिस साथ अनुराेध छ</p>\r\n', '2022-10-20 10:55:50', '2022-10-20 21:40:50'),
(52, 13, 'सिफारिस सम्बन्धमा', 112, '<p>प्रस्तुत विषयमा पर्वत जिल्ला जलजला गाउपालिका वडा नं ०७ मा रहेकाे दाेविल्ला शिवालय&nbsp; दुलेपानी लामा वगर सिचाई कुलाे&nbsp; वर्षाकाे कारण &nbsp;दुलेपानी&nbsp;उखुवारीमा पहीराे गई कुलाे तथा वस्ती समेत जाेखिम भएकाे वस्ती तथा कुलाे&nbsp;संरक्षणकाे लागी&nbsp; ११०काे पाईप आवश्यकता परेकाे सम्वन्धित निकायमा सिफारिस गरिपाउ भनि यस कार्यालयमा दिनुभएकाे निवेदन अनुसार उक्त वस्ती तथा कुलाे संरक्षणकाे लागी ११० एम एम काे पाईप उपलव्ध गराईदिनु हुन सिफारिस साथ अनुराेध छ ।</p>\r\n', '2022-10-13 09:59:39', '2022-10-13 20:44:39'),
(53, 13, 'जानकारी सम्बन्धमा', 113, '', '2022-06-06 21:01:50', NULL),
(54, 13, 'विवाह प्रमाणित सम्वन्धमा।', 114, '<p>प्रस्तुत विषयकाे सम्वन्धमा पर्वत जिल्ला जलजला गाउपालिका वडा ०७ वस्ने श्री कलधर शर्मा काे छाेरा वलराम शर्मा संग वाग्लुङ जिल्ला ताराखाेला गाउपालिका वडा नं ०३ वस्ने रत्नलाल कडेलकाे छाेरी याम कुमारी शर्मा विच मिति २०४१/०१/२२ गते सामाजिक परम्परा&nbsp;अनुसार विवाह भएकाे व्यहाेरा प्रमाणित गरिन्छ ।</p>\r\n', '2022-06-13 11:09:40', '2022-06-13 21:54:40'),
(55, 13, 'सिफारिस सम्बन्धमा', 115, '', '2022-06-27 18:07:40', NULL),
(56, 13, 'सिफारिस सम्बन्धमा', 116, '', '2022-06-27 18:25:25', NULL),
(57, 13, 'भुक्तानि सम्बन्धमा', 117, '', '2022-07-07 17:06:51', NULL),
(58, 1, 'nagarikta', 161, '0', '2024-06-28 08:39:06', NULL),
(59, 12, 'निबेदन सम्बन्धमा ', 162, '0', '2024-07-02 05:39:06', NULL),
(60, 1, 'अन्य ', 163, '0', '2024-07-08 08:42:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings_local_body`
--

CREATE TABLE IF NOT EXISTS `settings_local_body` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `district_id` int(11) NOT NULL,
  `type` int(11) DEFAULT 1,
  `no_of_ward` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=754 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_local_body`
--

INSERT INTO `settings_local_body` (`id`, `name`, `english_name`, `district_id`, `type`, `no_of_ward`) VALUES
(1, 'फुङलिङ नगरपालिका', 'Phungling Municipality', 1, 1, 11),
(2, 'आठराई त्रिवेणी गाउँपालिका', 'Atharai Tribeni Rural Municipality', 1, 1, 5),
(3, 'सिदिङ्वा गाउँपालिका', 'Sidingwa Rural Municipality ', 1, 1, 7),
(4, 'फक्ताङलुङ गाउँपालिका', 'Phaktanglng Rural Municipality', 1, 1, 7),
(5, 'मिक्वाखोला गाउँपालिका', 'Mikkakhola Rural Municipality', 1, 1, 5),
(6, 'मेरिङदेन गाउँपालिका', 'Meringden Rural Municipality', 1, 1, 6),
(7, 'मैवाखोला गाउँपालिका', 'Mauwakhola Rural Municipality', 1, 1, 6),
(8, 'याङवरक गाउँपालिका', 'Yangwarak Rural Municipality', 1, 1, 6),
(9, 'सिरीजङ्घा गाउँपालिका', 'Sirijanghan Rural Municipality', 1, 1, 8),
(10, 'फिदिम नगरपालिका', 'Phidim Municipality', 2, 1, 14),
(11, 'फालेलुंग गाउँपालिका', 'Phalelung Rural Municipality', 2, 1, 8),
(12, 'फाल्गुनन्द गाउँपालिका', 'Phalgunanda Rural Municipality', 2, 1, 7),
(13, 'हिलिहाङ गाउँपालिका', 'Hilihang Rural Municipality', 2, 1, 7),
(14, 'कुम्मायक गाउँपालिका', 'Kummayak Rural Municipality', 2, 1, 5),
(15, 'मिक्लाजुङ गाउँपालिका', 'Miklajung Rural Municipality', 2, 1, 8),
(16, 'तुम्बेवा गाउँपालिका', 'Tumbewa Rural Municipality', 2, 1, 5),
(17, 'याङवरक गाउँपालिका', 'Yangwarak Rural Municipality', 2, 1, 6),
(18, 'ईलाम नगरपालिका', 'Ilam Municipality', 3, 1, 12),
(19, 'देउमाई नगरपालिका', 'Deumai Municipality', 3, 1, 9),
(20, 'माई नगरपालिका', 'Mai Municipality', 3, 1, 10),
(21, 'सूर्योदय नगरपालिका', 'Suryodaya Municipality', 3, 1, 14),
(22, 'फाकफोकथुम गाउँपालिका', 'Phakphokthum Municipality', 3, 1, 7),
(23, 'चुलाचुली गाउँपालिका', 'Chulachuli Rural Municipality', 3, 1, 6),
(24, 'माईजोगमाई गाउँपालिका', 'Maijongmai Rural Municipality', 3, 1, 6),
(25, 'माङसेबुङ गाउँपालिका', 'Mangsebung Rural Municipality', 3, 1, 6),
(26, 'रोङ गाउँपालिका', 'Rong Rural Municipality', 3, 1, 6),
(27, 'सन्दकपुर गाउँपालिका', 'Sandakpur Rural Municipality', 3, 1, 5),
(28, 'मेचीनगर नगरपालिका', 'Mechinagar Municipalty', 4, 1, 15),
(29, 'दमक नगरपालिका', 'Damak Municipality ', 4, 1, 10),
(30, 'कन्काई नगरपालिका', 'Kankai Municipality ', 4, 1, 9),
(31, 'भद्रपुर नगरपालिका', 'Bhadrapur Municipality', 4, 1, 10),
(32, 'अर्जुनधारा नगरपालिका', 'Arjundhara Municipality ', 4, 1, 11),
(33, 'शिवशताक्षी नगरपालिका', 'Shivashatakshyi Municipality', 4, 1, 11),
(34, 'गौरादह नगरपालिका', 'Gauradaha Municipality', 4, 1, 9),
(35, 'विर्तामोड नगरपालिका', 'Birtamod Municipality', 4, 1, 10),
(36, 'कमल गाउँपालिका', 'Kamal Rural Municipality', 4, 1, 7),
(37, 'गौरीगंज गाउँपालिका', 'Gaurigunj Rural Municipality', 4, 1, 6),
(38, 'बाह्रदशी गाउँपालिका', 'Barhadashi Rural Municipality', 4, 1, 7),
(39, 'झापा गाउँपालिका', 'Jhapa Rural Municipality', 4, 1, 7),
(40, 'बुद्धशान्ति गाउँपालिका', 'Buddhashanti Rural Municipality', 4, 1, 7),
(41, 'हल्दिवारी गाउँपालिका', 'Haldiwari Rural Municipality', 4, 1, 5),
(42, 'कचनकवल गाउँपालिका', 'Kachankawal Rural Municipality', 4, 1, 7),
(43, 'विराटनगर महानगरपालिका', 'Biratnagar Metropolitan', 5, 1, 19),
(44, 'बेलवारी नगरपालिका', 'Belbari Municipality', 5, 1, 19),
(45, 'लेटाङ नगरपालिका', 'Letang Municipality', 5, 1, 9),
(46, 'पथरी शनिश्चरे नगरपालिका', 'Pathari Shanishchare Municipality', 5, 1, 10),
(47, 'रंगेली नगरपालिका', 'Rangeli Municipality', 5, 1, 9),
(48, 'रतुवामाई नगरपालिका', 'Ratuwamai Municipality', 5, 1, 10),
(49, 'सुनवर्षि नगरपालिका', 'Sunwarshi Municipality', 5, 1, 9),
(50, 'उर्लावारी नगरपालिका', 'Urlabari Municipality', 5, 1, 9),
(51, 'सुन्दरहरैचा नगरपालिका', 'Sundarharaicha Municipality', 5, 1, 12),
(52, 'बुढीगंगा गाउँपालिका', 'Budhiganga Rural Municipality', 5, 1, 7),
(53, 'धनपालथान गाउँपालिका', 'Dhanpalthan Rural Municipality', 5, 1, 7),
(54, 'ग्रामथान गाउँपालिका', 'Gramthan Rural Municipality', 5, 1, 7),
(55, 'जहदा गाउँपालिका', 'Jahada Rural Municipality', 5, 1, 7),
(56, 'कानेपोखरी गाउँपालिका', 'Kanepokhari Rural Municipality', 5, 1, 7),
(57, 'कटहरी गाउँपालिका', 'Katahari Rural Municipality', 5, 1, 7),
(58, 'केरावारी गाउँपालिका', 'Kerabari Rural Municipality', 5, 1, 10),
(59, 'मिक्लाजुङ गाउँपालिका', 'Miklajung Rural Municipality', 5, 1, 9),
(60, 'ईटहरी उपमहानगरपालिका', 'Itahari Sub-Metropolitan City', 6, 1, 20),
(61, 'धरान उपमहानगरपालिका', 'Dharan Sub-Metropolitan City', 6, 1, 20),
(62, 'ईनरुवा नगरपालिका', 'Inaruwa Municipality', 6, 1, 10),
(63, 'दुहवी नगरपालिका', 'Duhabi Municipality', 6, 1, 12),
(64, 'रामधुनी नगरपालिका', 'Ramdhuni Municipality', 6, 1, 9),
(65, 'बराह नगरपालिका', 'Barah Municipality', 6, 1, 19),
(66, 'देवानगञ्ज गाउँपालिका', 'Dewangunj Rural Minicipality ', 6, 1, 7),
(67, 'कोशी गाउँपालिका', 'Koshi Rural Municipality ', 6, 1, 8),
(68, 'गढी गाउँपालिका', 'Gadhi Rural Municipality ', 6, 1, 6),
(69, 'बर्जु गाउँपालिका', 'Barju Rural Municipality ', 6, 1, 6),
(70, 'भोक्राहा गाउँपालिका', 'Bhokraha Rural Municipality', 6, 1, 8),
(71, 'हरिनगरा गाउँपालिका', 'Harinagara Rural Municipality ', 6, 1, 7),
(72, 'पाख्रिबास नगरपालिका', 'Pakhribas Municipality ', 7, 1, 10),
(73, 'धनकुटा नगरपालिका', 'Dhankuta Municipality ', 7, 1, 10),
(74, 'महालक्ष्मी नगरपालिका', 'Mahalaxmi Municipality ', 7, 1, 9),
(75, 'साँगुरीगढी गाउँपालिका', 'Sagurigadhi Rural Municipality ', 7, 1, 10),
(76, 'सहिदभूमि गाउँपालिका', 'Sahidbhumi Rural Municipality ', 7, 1, 7),
(77, 'छथर जोरपाटी गाउँपालिका', 'Chhapar Jorpati Rural Municipality', 7, 1, 6),
(78, 'चौविसे गाउँपालिका', 'Chaubise Rural Municipality ', 7, 1, 8),
(79, 'म्याङलुङ नगरपालिका', 'Myanglung Municipality', 8, 1, 10),
(80, 'लालीगुराँस नगरपालिका', 'Laligurans Municipality', 8, 1, 9),
(81, 'आठराई गाउँपालिका', 'Aathrai Rural Municipality', 8, 1, 7),
(82, 'छथर गाउँपालिका', 'Chhathar Rural Municipality', 8, 1, 6),
(83, 'फेदाप गाउँपालिका', 'Phedap Rural Municipality', 8, 1, 5),
(84, 'मेन्छयायेम गाउँपालिका', 'Menchhayem Rural Municipality ', 8, 1, 6),
(85, 'चैनपुर नगरपालिका', 'Chainpur Municipality', 9, 1, 11),
(86, 'धर्मदेवी नगरपालिका', 'Dharmadevi Municipality', 9, 1, 9),
(87, 'खाँदवारी नगरपालिका', 'Khandbari Municipality', 9, 1, 11),
(88, 'मादी नगरपालिका', 'Madi Municipality', 9, 1, 9),
(89, 'पाँचखपन नगरपालिका', 'Panchkhapan Municipality', 9, 1, 9),
(90, 'भोटखोला गाउँपालिका', 'Bhotkhola Rural Municipality', 9, 1, 5),
(91, 'चिचिला गाउँपालिका', 'Chichila Rural |Municipality', 9, 1, 5),
(92, 'मकालु गाउँपालिका', 'Makalu Rural Municipality', 9, 1, 6),
(93, 'सभापोखरी गाउँपालिका', 'Sabhapokhari Rural Municipality ', 9, 1, 6),
(94, 'सिलीचोङ गाउँपालिका', 'Silichong Rural Municipality', 9, 1, 5),
(95, 'भोजपुर नगरपालिका', 'Bhojpur Municipality ', 10, 1, 12),
(96, 'षडानन्द नगरपालिका', 'Shadanand Municipality', 10, 1, 14),
(97, 'ट्याम्केमैयुम गाउँपालिका', 'Tyamkemaiyum Rural Municipality', 10, 1, 9),
(98, 'रामप्रसाद राई गाउँपालिका', 'Ramprasad Rai Rural Municipality', 10, 1, 8),
(99, 'अरुण गाउँपालिका', 'Arun Rural Municipality', 10, 1, 7),
(100, 'पौवादुङमा गाउँपालिका', 'Pauwadungma Rural Municipality', 10, 1, 6),
(101, 'साल्पासिलिछो गाउँपालिका', 'Salpasilichho Rural Municiaplity', 10, 1, 6),
(102, 'आमचोक गाउँपालिका', 'Aamchowk Rural Municipality', 10, 1, 10),
(103, 'हतुवागढी गाउँपालिका', 'Hatuwagadhi Rural Municipality', 10, 1, 9),
(104, 'सोलुदुधकुण्ड नगरपालिका', 'Soludhudhkunda Municipality', 11, 1, 11),
(105, 'दुधकोसी गाउँपालिका', 'Dudhkkoshi Rural Municipality', 11, 1, 7),
(106, 'खुम्वु पासाङल्हमु गाउँपालिका', 'Khumbu Pasanglhamu Rural Municipality', 11, 1, 5),
(107, 'दुधकौशिका गाउँपालिका', 'Dudhkaushika Rural Municipality', 11, 1, 9),
(108, 'नेचासल्यान गाउँपालिका', 'Nechasalyan Rural Municipality', 11, 1, 5),
(109, 'माहाकुलुङ गाउँपालिका', 'Mahakulung Rural Municipality', 11, 1, 5),
(110, 'लिखु पिके गाउँपालिका', 'Likhu Pike Rural Municipality', 11, 1, 5),
(111, 'सोताङ गाउँपालिका', 'Sotang Rural Municipality', 11, 1, 5),
(112, 'सिद्दिचरण नगरपालिका', 'Siddhicharan Municipality', 12, 1, 12),
(113, 'खिजिदेम्बा गाउँपालिका', 'Khijidemba Rural Municipality ', 12, 1, 9),
(114, 'चम्पादेवी गाउँपालिका', 'Champadevi Rural Municipality', 12, 1, 10),
(115, 'चिशंखुगढी गाउँपालिका', 'Chishankhugadhi Rural Municipality', 12, 1, 8),
(116, 'मानेभञ्याङ गाउँपालिका', 'Manebhanjyang Rural Municipality', 12, 1, 9),
(117, 'मोलुङ गाउँपालिका', 'Molang Rural Municipality', 12, 1, 8),
(118, 'लिखु गाउँपालिका', 'Likhu Rural Municipality', 12, 1, 9),
(119, 'सुनकोशी गाउँपालिका', 'Sunkoshi Rural Municipality', 12, 1, 10),
(120, 'हलेसी तुवाचुङ नगरपालिका', 'Halesi Tuwachung Municipality', 13, 1, 11),
(121, 'रुपाकोट मझुवागढी नगरपालिका', 'Rupakot Majhuwagadhi Municipality', 13, 1, 15),
(122, 'ऐसेलुखर्क गाउँपालिका', 'Ainselukharka Rural Municipality', 13, 1, 7),
(123, 'लामीडाँडा गाउँपालिका', 'Lamidanda Rural Municipality', 13, 1, 6),
(124, 'जन्तेढुंगा गाउँपालिका', 'Jantedhunga Rural Municipality', 13, 1, 6),
(125, 'खोटेहाङ गाउँपालिका', 'Khotehang Rural Municipality', 13, 1, 9),
(126, 'केपिलासगढी गाउँपालिका', 'Kepilasagadhi Rural Municipality', 13, 1, 7),
(127, 'दिप्रुङ गाउँपालिका', 'Diprung Rural Municipality', 13, 1, 7),
(128, 'साकेला गाउँपालिका', 'Sakela Rural Municipality ', 13, 1, 5),
(129, 'वराहपोखरी गाउँपालिका', 'Barahpokhari Rural Municipality ', 13, 1, 6),
(130, 'कटारी नगरपालिका', 'Katari Municipality', 14, 1, 14),
(131, 'चौदण्डीगढी नगरपालिका', 'Chaudandigadhi Municipality', 14, 1, 10),
(132, 'त्रियुगा नगरपालिका', 'Triyuga Municipality', 14, 1, 16),
(133, 'वेलका नगरपालिका', 'Belaka Municipality ', 14, 1, 9),
(134, 'उदयपुरगढी गाउँपालिका', 'Udayapurgadhi Rural Municipality ', 14, 1, 8),
(135, 'ताप्ली गाउँपालिका', 'Tapli Rural Municipality ', 14, 1, 5),
(136, 'रौतामाई गाउँपालिका', 'Rautamai Rural Municipality', 14, 1, 8),
(137, 'सुनकोशी गाउँपालिका', 'Sunkoshi Rural Municipality', 14, 1, 5),
(138, 'राजविराज नगरपालिका', 'Rajbiraj Municipality', 15, 1, 16),
(139, 'कञ्चनरुप नगरपालिका', 'Kanchanrup Municipality', 15, 1, 12),
(140, 'डाक्नेश्वरी नगरपालिका', 'Dakneshwari Municipality', 15, 1, 10),
(141, 'बोदेबरसाईन नगरपालिका', 'Bodebarsaina Municipality', 15, 1, 10),
(142, 'खडक नगरपालिका', 'Khadak Municipality', 15, 1, 11),
(143, 'शम्भुनाथ नगरपालिका', 'Shambhunath Municipality', 15, 1, 12),
(144, 'सुरुङ्‍गा नगरपालिका', 'Surunga Municipality', 15, 1, 11),
(145, 'हनुमाननगर कङ्‌कालिनी नगरपालिका', 'Hanumanpur Kankalini Municipality', 15, 1, 14),
(146, 'सप्तकोशी नगरपालिका', 'Saptakoshi Municipality', 15, 1, 11),
(147, 'अग्निसाइर कृष्णासवरन गाउँपालिका', 'Agnisair Krishnasawaran Rural Municipality', 15, 1, 6),
(148, 'छिन्नमस्ता गाउँपालिका', 'Chhinnamasta Rural Municipality', 15, 1, 7),
(149, 'महादेवा गाउँपालिका', 'Mahadewa Rural Municipality', 15, 1, 6),
(150, 'तिरहुत गाउँपालिका', 'Tirhut Rural Municipality', 15, 1, 5),
(151, 'तिलाठी कोईलाडी गाउँपालिका', 'Tilathi Koiladi Rural Municipality', 15, 1, 8),
(152, 'रुपनी गाउँपालिका', 'Rupani Rural Municipality', 15, 1, 6),
(153, 'बेल्ही चपेना गाउँपालिका', 'Belhi Chapena Rural Municipality', 15, 1, 6),
(154, 'बिष्णुपुर गाउँपालिका', 'Bishnupur Rural Municipality', 15, 1, 7),
(155, 'बलान-बिहुल गाउँपालिका', 'Balan Bihul Rural Municipality', 15, 1, 6),
(156, 'लहान नगरपालिका', 'Lahan Municipality', 16, 1, 24),
(157, 'धनगढीमाई नगरपालिका', 'Dhangadhimai Municipality', 16, 1, 14),
(158, 'सिरहा नगरपालिका', 'Siraha Municipality', 16, 1, 22),
(159, 'गोलबजार नगरपालिका', 'Golbazar Municipality', 16, 1, 13),
(160, 'मिर्चैयाँ नगरपालिका', 'Mirchaiya Municipality', 16, 1, 12),
(161, 'कल्याणपुर नगरपालिका', 'Kalyanpur Municipality', 16, 1, 12),
(162, 'कर्जन्हा नगरपालिका', 'Karjanha Municipality', 16, 1, 11),
(163, 'सुखीपुर नगरपालिका', 'Sukhipur Municipality', 16, 1, 10),
(164, 'भगवानपुर गाउँपालिका', 'Bhagawanpur Municipality', 16, 1, 5),
(165, 'औरही गाउँपालिका', 'Aurahi Rual Municipality', 16, 1, 5),
(166, 'विष्णुपुर गाउँपालिका', 'Bishnupur Rural Municipality', 16, 1, 5),
(167, 'बरियारपट्टी गाउँपालिका', 'Bariyarpatti Rural Municipality', 16, 1, 5),
(168, 'लक्ष्मीपुर पतारी गाउँपालिका', 'Laxmi Patai Rural Municipality', 16, 1, 6),
(169, 'नरहा गाउँपालिका', 'Naraha Rural Municipality', 16, 1, 5),
(170, 'सखुवानान्कारकट्टी गाउँपालिका', 'Sakhuwanankarkatti Rural Municipality', 16, 1, 5),
(171, 'अर्नमा गाउँपालिका', 'Arnama Rural Municipality', 16, 1, 5),
(172, 'नवराजपुर गाउँपालिका', 'Nawarajpur Rural Municipality', 16, 1, 5),
(173, 'जनकपुर उपमहानगरपालिका', 'Janakpur Sub-Metropolitan City', 17, 1, 25),
(174, 'क्षिरेश्वरनाथ नगरपालिका', 'Kshyereshwarnath Municipality', 17, 1, 10),
(175, 'गणेशमान चारनाथ नगरपालिका', 'Ganeshman Charnath Municipality', 17, 1, 11),
(176, 'धनुषाधाम नगरपालिका', 'Dhanushadham Municipality', 17, 1, 9),
(177, 'नगराइन नगरपालिका', 'Nagarain Municipality', 17, 1, 9),
(178, 'विदेह नगरपालिका', 'Bideha Municipality', 17, 1, 9),
(179, 'मिथिला नगरपालिका', 'Mithila Municipality', 17, 1, 11),
(180, 'शहीदनगर नगरपालिका', 'Sahidnagar Municipality', 17, 1, 9),
(181, 'सबैला नगरपालिका', 'Sabaila Municipality', 17, 1, 13),
(182, 'कमला नगरपालिका', 'Kamala Municipality', 17, 1, 9),
(183, 'मिथिला बिहारी नगरपालिका', 'Mithila Bihari Municipality', 17, 1, 10),
(184, 'हंसपुर नगरपालिका', 'Hansapur Municipality', 17, 1, 9),
(185, 'जनकनन्दिनी गाउँपालिका', 'Janaknandini Rural Municipality', 17, 1, 6),
(186, 'बटेश्वर गाउँपालिका', 'Bateshwar Rural Municipality', 17, 1, 5),
(187, 'मुखियापट्टी मुसहरमिया गाउँपालिका', 'Mukhiyapatti Musaharmiya Rural Municipality', 17, 1, 6),
(188, 'लक्ष्मीनिया गाउँपालिका', 'Laxminiya Rural Municipality', 17, 1, 7),
(189, 'औरही गाउँपालिका', 'Aurahi Rual Municipality', 17, 1, 6),
(190, 'धनौजी गाउँपालिका', 'Dhanauji Rural Municipality', 17, 1, 5),
(191, 'जलेश्वर नगरपालिका', 'Jaleshwar Municipality', 18, 1, 12),
(192, 'बर्दिबास नगरपालिका', 'Bardibas Municipality', 18, 1, 14),
(193, 'गौशाला नगरपालिका', 'Gaushala Municipality', 18, 1, 12),
(194, 'लोहरपट्टी नगरपालिका', 'Loharpatti Municipality', 18, 1, 9),
(195, 'रामगोपालपुर नगरपालिका', 'Ramgopalpur Municipality', 18, 1, 9),
(196, 'मनरा शिसवा नगरपालिका', 'Manara Shisawa Municipality', 18, 1, 10),
(197, 'मटिहानी नगरपालिका', 'Matihani Municipality', 18, 1, 9),
(198, 'भँगाहा नगरपालिका', 'Bhangawa Municipality', 18, 1, 9),
(199, 'बलवा नगरपालिका', 'Balawa Municipality', 18, 1, 11),
(200, 'औरही नगरपालिका', 'Aurahi Rual Municipality', 18, 1, 9),
(201, 'एकडारा गाउँपालिका', 'Ekdanra Rural Municipality', 18, 1, 6),
(202, 'सोनमा गाउँपालिका', 'Sonama Rural Municipality', 18, 1, 8),
(203, 'साम्सी गाउँपालिका', 'Samsi Rural Municipality', 18, 1, 7),
(204, 'महोत्तरी गाउँपालिका', 'Mahottari Rural Municipality', 18, 1, 6),
(205, 'पिपरा गाउँपालिका', 'Pipara Rural Municipality', 18, 1, 7),
(206, 'ईश्वरपुर नगरपालिका', 'Ishwarpur Municipality', 19, 1, 15),
(207, 'मलंगवा नगरपालिका', 'Malangawa Municipality', 19, 1, 12),
(208, 'लालबन्दी नगरपालिका', 'Lalbandi Municipality', 19, 1, 17),
(209, 'हरिपुर नगरपालिका', 'Haripir Municipality', 19, 1, 9),
(210, 'हरिपुर्वा नगरपालिका', 'Haripurwa Municipality', 19, 1, 9),
(211, 'हरिवन नगरपालिका', 'Hariwan Municipality', 19, 1, 11),
(212, 'बरहथवा नगरपालिका', 'Barahathawa Municipality', 19, 1, 18),
(213, 'बलरा नगरपालिका', 'Balara Municipality', 19, 1, 11),
(214, 'गोडैटा नगरपालिका', 'Godaita Municipaliy', 19, 1, 12),
(215, 'बागमती नगरपालिका', 'Bagamati Municipality', 19, 1, 12),
(216, 'कविलासी नगरपालिका', 'Kawilasi Municipality', 19, 1, 10),
(217, 'चक्रघट्टा गाउँपालिका', 'Chakraghatta Rural Municipality', 19, 1, 9),
(218, 'चन्द्रनगर गाउँपालिका', 'Chandranagar Rural Municipality', 19, 1, 7),
(219, 'धनकौल गाउँपालिका', 'Dhankaul Rural Municipality', 19, 1, 7),
(220, 'ब्रह्मपुरी गाउँपालिका', 'Bramhapuri Rural Municipality', 19, 1, 7),
(221, 'रामनगर गाउँपालिका', 'Ramnagar Rural Municipality', 19, 1, 7),
(222, 'विष्णु गाउँपालिका', 'Bishnupur Rural Municipality', 19, 1, 8),
(223, 'कौडेना गाउँपालिका', 'Kaudena Rural Municipality', 19, 1, 7),
(224, 'पर्सा गाउँपालिका', 'Parsa Rural Municipality', 19, 1, 6),
(225, 'बसबरीया गाउँपालिका', 'Parsa Rural Municipality', 19, 1, 6),
(226, 'चन्द्रपुर नगरपालिका', 'Chandrapur Municipality', 20, 1, 10),
(227, 'गरुडा नगरपालिका', 'Garuda Municipality', 20, 1, 9),
(228, 'गौर नगरपालिका', 'Gaur Municipality', 20, 1, 9),
(229, 'बौधीमाई नगरपालिका', 'Baudhimai Municipality', 20, 1, 9),
(230, 'बृन्दावन नगरपालिका', 'Brindawan Municipality', 20, 1, 9),
(231, 'देवाही गोनाही नगरपालिका', 'Dewahi Gonahi Municipality', 20, 1, 9),
(232, 'गढीमाई नगरपालिका', 'Gadhimai Municipality', 20, 1, 9),
(233, 'गुजरा नगरपालिका', 'Gujara Municipality', 20, 1, 9),
(234, 'कटहरिया नगरपालिका', 'Katahariya Municipality', 20, 1, 9),
(235, 'माधव नारायण नगरपालिका', 'Madhab Narayan Municipality', 20, 1, 9),
(236, 'मौलापुर नगरपालिका', 'Maulapur Municipality', 20, 1, 9),
(237, 'फतुवाबिजयपुर नगरपालिका', 'Phatuwa Bijayapur Municipality', 20, 1, 11),
(238, 'ईशनाथ नगरपालिका', 'Ishanath Municipality', 20, 1, 9),
(239, 'परोहा नगरपालिका', 'Paroha Municipality', 20, 1, 9),
(240, 'राजपुर नगरपालिका', 'Rajpur Municipality', 20, 1, 9),
(241, 'राजदेवी नगरपालिका', 'Rajdevi Municipality', 20, 1, 9),
(242, 'दुर्गा भगवती गाउँपालिका', 'Durga Bhagawati Rural Municipality', 20, 1, 5),
(243, 'यमुनामाई गाउँपालिका', 'Yamunamai Rural Municipality', 20, 1, 5),
(244, 'कलैया उपमहानगरपालिका', 'Kalaiya Sub-Metropolitan City', 21, 1, 27),
(245, 'जीतपुरसिमरा उपमहानगरपालिका', 'Jitpursimara Sub-Metropolitan City', 21, 1, 24),
(246, 'कोल्हवी नगरपालिका', 'Kolhawi Municipality', 21, 1, 11),
(247, 'निजगढ नगरपालिका', 'Nijgadh Municipality', 21, 1, 12),
(248, 'महागढीमाई नगरपालिका', 'Mahagadhi Municipality', 21, 1, 11),
(249, 'सिम्रौनगढ नगरपालिका', 'Simraungadhi Municipality', 21, 1, 11),
(250, 'पचरौता नगरपालिका', 'Pacharauta Municipality', 21, 1, 9),
(251, 'आदर्श कोटवाल गाउँपालिका', 'Aadarsha Kotawal Rural Municipality', 21, 1, 8),
(252, 'करैयामाई गाउँपालिका', 'Karaiyamai Rural Municipality', 21, 1, 8),
(253, 'देवताल गाउँपालिका', 'Devtal Rural Municipality', 21, 1, 7),
(254, 'परवानीपुर गाउँपालिका', 'Parawanipur Rural Municipality', 21, 1, 5),
(255, 'प्रसौनी गाउँपालिका', 'Prasauni Rural Municipality', 21, 1, 7),
(256, 'फेटा गाउँपालिका', 'Pheta Rural Municipality', 21, 1, 7),
(257, 'बारागढीगाउँपालिका', 'Baragadhi Rural Municipality', 21, 1, 6),
(258, 'सुवर्ण गाउँपालिका', 'Subarna Rural Municipality', 21, 1, 8),
(259, 'विश्रामपुर गाउँपालिका', 'Bishrampur Rural Municipality', 21, 1, 5),
(260, 'बिरगंज महानगरपालिका', 'Birgunj Metropolitian City', 22, 1, 32),
(261, 'पोखरिया नगरपालिका', 'Pokhariya Municipality', 22, 1, 10),
(262, 'बहुदरमाई नगरपालिका', 'Bahudarmai Municipality', 22, 1, 9),
(263, 'पर्सागढी नगरपालिका', 'Parsagadhi Municipality', 22, 1, 9),
(264, 'ठोरी गाउँपालिका', 'Thori Rural Municipality', 22, 1, 5),
(265, 'जगरनाथपुर गाउँपालिका', 'Jagarnathpur Rural Municipality', 22, 1, 6),
(266, 'धोबीनी गाउँपालिका', 'Dhobini Rural Municipality', 22, 1, 5),
(267, 'छिपहरमाई गाउँपालिका', 'Chhipaharmai Rural Municipality', 22, 1, 5),
(268, 'पकाहा मैनपुर गाउँपालिका', 'Pakaha Mainapur Rural Municipality', 22, 1, 5),
(269, 'बिन्दबासिनी गाउँपालिका', 'Bindabasini Rural Municipality', 22, 1, 5),
(270, 'सखुवा प्रसौनी गाउँपालिका', 'Sakhuwa Prasauni Rural Municipality', 22, 1, 6),
(271, 'पटेर्वा सुगौली गाउँपालिका', 'Parterwa Sugauli Rural Municipality', 22, 1, 5),
(272, 'कालिकामाई गाउँपालिका', 'Kalimai Rural Municipality', 22, 1, 5),
(273, 'जिरा भवानी गाउँपालिका', 'Jira Bhawani Rural Municipality', 22, 1, 5),
(274, 'कमलामाई नगरपालिका', 'Kamalamai Municipality', 23, 1, 14),
(275, 'दुधौली नगरपालिका', 'Dudhauli Municiality', 23, 1, 14),
(276, 'गोलन्जर गाउँपालिका', 'Golanjar Rual Municipality', 23, 1, 7),
(277, 'घ्याङलेख गाउँपालिका', 'Ghyanglek Rural Municipality', 23, 1, 5),
(278, 'तीनपाटन गाउँपालिका', 'Tinpatan Rural Municipality', 23, 1, 11),
(279, 'फिक्कल गाउँपालिका', 'Phikkal Rural Municipality', 23, 1, 6),
(280, 'मरिण गाउँपालिका', 'Marina Rural Municipality', 23, 1, 7),
(281, 'सुनकोशी गाउँपालिका', 'Sunkoshi Rural Municipality', 23, 1, 7),
(282, 'हरिहरपुरगढी गाउँपालिका', 'Hariharpurgadhi Rural Municipality', 23, 1, 8),
(283, 'मन्थली नगरपालिका', 'Manthali Municiaplity', 24, 1, 14),
(284, 'रामेछाप नगरपालिका', 'Ramechhap Municipality', 24, 1, 9),
(285, 'उमाकुण्ड गाउँपालिका', 'Umakunda Rural Municipality', 24, 1, 7),
(286, 'खाँडादेवी गाउँपालिका', 'Khandadevi Rural Municipality', 24, 1, 9),
(287, 'गोकुलगङ्गा गाउँपालिका', 'Gokulganga Rural Municipality', 24, 1, 6),
(288, 'दोरम्बा गाउँपालिका', 'Doramba Rural Municipality', 24, 1, 7),
(289, 'लिखु गाउँपालिका', 'Likhu Rural Municipality', 24, 1, 7),
(290, 'सुनापती गाउँपालिका', 'Sunapati Rural municipality', 24, 1, 5),
(291, 'जिरी नगरपालिका', 'Jiri Municipality', 25, 1, 9),
(292, 'भिमेश्वर नगरपालिका', 'Bhimeshwar Municipality', 25, 1, 9),
(293, 'कालिन्चोक गाउँपालिका', 'Kalinchowk Rural Municipality', 25, 1, 9),
(294, 'गौरीशङ्कर गाउँपालिका', 'Gaurishankar Rural Municipality', 25, 1, 9),
(295, 'तामाकोशी गाउँपालिका', 'Tamakosho Rural Municipality', 25, 1, 7),
(296, 'मेलुङ्ग गाउँपालिका', 'Melung Rural Municipality', 25, 1, 7),
(297, 'विगु गाउँपालिका', 'Bigu Rural Municipality', 25, 1, 8),
(298, 'वैतेश्वर गाउँपालिका', 'Baiteshwar Rural Municipality', 25, 1, 8),
(299, 'शैलुङ्ग गाउँपालिका', 'Shailung Rural Municipality', 25, 1, 8),
(300, 'चौतारा साँगाचोकगढी नगरपालिका', 'Chautara Sangachowkgadhi Municipality', 26, 1, 14),
(301, 'बाह्रविसे नगरपालिका', 'Barhabise Municipality', 26, 1, 9),
(302, 'मेलम्ची नगरपालिका', 'Melamchi Municipality', 26, 1, 13),
(303, 'ईन्द्रावती गाउँपालिका', 'Indrawati Rural Municipality', 26, 1, 12),
(304, 'जुगल गाउँपालिका', 'Jugal Rural Municipality', 26, 1, 7),
(305, 'पाँचपोखरी थाङपाल गाउँपालिका', 'Panchpokhari Thangpal Rural Municipality', 26, 1, 8),
(306, 'बलेफी गाउँपालिका', 'Balephi Rural Municipality', 26, 1, 8),
(307, 'भोटेकोशी गाउँपालिका', 'Bhotekoshi Rural Municipality', 26, 1, 5),
(308, 'लिसङ्खु पाखर गाउँपालिका', 'Lishankhu Pakhar Rural Municipality', 26, 1, 7),
(309, 'सुनकोशी गाउँपालिका', 'Sunkoshi Rural Municipality', 26, 1, 7),
(310, 'हेलम्बु गाउँपालिका', 'Helambu Rural Municipality', 26, 1, 7),
(311, 'त्रिपुरासुन्दरी गाउँपालिका', 'Tripurasundari Rural Municipality', 26, 1, 6),
(312, 'धुलिखेल नगरपालिका', 'Dhulikhel Municipality', 27, 1, 12),
(313, 'बनेपा नगरपालिका', 'Banepa Municipality', 27, 1, 14),
(314, 'पनौती नगरपालिका', 'Panauti Municipality', 27, 1, 12),
(315, 'पाँचखाल नगरपालिका', 'Panchakhal Municipality', 27, 1, 13),
(316, 'नमोबुद्ध नगरपालिका', 'Namobuddha Municipality', 27, 1, 11),
(317, 'मण्डनदेउपुर नगरपालिका', 'Mandandeupur Municipality', 27, 1, 12),
(318, 'खानीखोला गाउँपालिका', 'Khanikhola Rural Municipality', 27, 1, 7),
(319, 'चौंरीदेउराली गाउँपालिका', 'Chaurideurali Rural Municipality', 27, 1, 9),
(320, 'तेमाल गाउँपालिका', 'Temal Rural Municipality', 27, 1, 9),
(321, 'बेथानचोक गाउँपालिका', 'Bethanchowk Rural Municipality', 27, 1, 6),
(322, 'भुम्लु गाउँपालिका', 'Bhumlu Rural Municipality', 27, 1, 10),
(323, 'महाभारत गाउँपालिका', 'Mahabharat Rural Municipality', 27, 1, 8),
(324, 'रोशी गाउँपालिका', 'Roshi Rural Municipality', 27, 1, 12),
(325, 'ललितपुर महानगरपालिका', 'Lalitpur Metropolitain City', 28, 1, 29),
(326, 'गोदावरी नगरपालिका', 'Godawari Municipality', 28, 1, 14),
(327, 'महालक्ष्मी नगरपालिका', 'Mahalaxmi Municipality ', 28, 1, 10),
(328, 'कोन्ज्योसोम गाउँपालिका', 'Konjyosom Rural Municipality', 28, 1, 5),
(329, 'बागमती गाउँपालिका', 'Bagamati Rural Municipality', 28, 1, 7),
(330, 'महाङ्काल गाउँपालिका', 'Mahankal Rural Municipality', 28, 1, 6),
(331, 'चाँगुनारायण नगरपालिका', 'Changunarayan Municipality', 29, 1, 9),
(332, 'भक्तपुर नगरपालिका', 'Bhaktapur Municipality', 29, 1, 10),
(333, 'मध्यपुर थिमी नगरपालिका', 'Madhyapur Thimi Municipality', 29, 1, 9),
(334, 'सूर्यविनायक नगरपालिका', 'Surya Binayak Municipality', 29, 1, 10),
(335, 'काठमाण्डौं महानगरपालिका', 'Kathmandu Metropolitain City', 30, 1, 32),
(336, 'कागेश्वरी मनोहरा नगरपालिका', 'Kageshwai Manohara Municipality', 30, 1, 9),
(337, 'कीर्तिपुर नगरपालिका', 'Kritipur Municipality', 30, 1, 10),
(338, 'गोकर्णेश्वर नगरपालिका', 'Gokarneshwar Municipalirt', 30, 1, 9),
(339, 'चन्द्रागिरी नगरपालिका', 'Chandragiri Municipality', 30, 1, 15),
(340, 'टोखा नगरपालिका', 'Tokha Municipality', 30, 1, 11),
(341, 'तारकेश्वर नगरपालिका', 'Tarkeshwar Municipality', 30, 1, 11),
(342, 'दक्षिणकाली नगरपालिका', 'Dakshyinkali Municipality', 30, 1, 9),
(343, 'नागार्जुन नगरपालिका', 'Nagarjun Municipality', 30, 1, 10),
(344, 'बुढानिलकण्ठ नगरपालिका', 'Budhanilkantha Municipality', 30, 1, 13),
(345, 'शङ्खरापुर नगरपालिका', 'Shankharapur Municipality', 30, 1, 9),
(346, 'विदुर नगरपालिका', 'Bidur Municipality', 31, 1, 13),
(347, 'बेलकोटगढी नगरपालिका', 'Belkotgadhi Municipality', 31, 1, 13),
(348, 'ककनी गाउँपालिका', 'Kakani Rural Municipality', 31, 1, 8),
(349, 'किस्पाङ गाउँपालिका', 'Kispang Rural Municipality', 31, 1, 5),
(350, 'तादी गाउँपालिका', 'Tadi Rural Municipality', 31, 1, 6),
(351, 'तारकेश्वर गाउँपालिका', 'Tarkeshwar Rural Municipality', 31, 1, 6),
(352, 'दुप्चेश्वर गाउँपालिका', 'Dupcheshwar Rural Municipality', 31, 1, 7),
(353, 'पञ्चकन्या गाउँपालिका', 'Panchakanya Rural Municipality', 31, 1, 5),
(354, 'लिखु गाउँपालिका', 'Likhu Rural Municipality', 31, 1, 6),
(355, 'मेघाङ गाउँपालिका', 'Meghang Rural Municipality', 31, 1, 6),
(356, 'शिवपुरी गाउँपालिका', 'Shivapuri Rural Municipality', 31, 1, 6),
(357, 'सुर्यगढी गाउँपालिका', 'Suryagadhi Rural Municipality', 31, 1, 5),
(358, 'उत्तरगया गाउँपालिका', 'Uttargay Rural Municipality', 32, 1, 5),
(359, 'कालिका गाउँपालिका', 'Kalika Rural Municipality', 32, 1, 5),
(360, 'गोसाईकुण्ड गाउँपालिका', 'Gosaikunda Rural Municipality', 32, 1, 6),
(361, 'नौकुण्ड गाउँपालिका', 'Naukunda Rural Municipality', 32, 1, 6),
(362, 'पार्वतीकुण्ड गाउँपालिका', 'Parbatikunda Rural Municipality', 32, 1, 5),
(363, 'धुनीबेंशी नगरपालिका', 'Dhunibeshi Municipality', 33, 1, 9),
(364, 'निलकण्ठ नगरपालिका', 'Nilkantha Municipality', 33, 1, 14),
(365, 'खनियाबास गाउँपालिका', 'Khaniyabas Rural Municipality', 33, 1, 5),
(366, 'गजुरी गाउँपालिका', 'Gajuri Rural Municipality', 33, 1, 8),
(367, 'गल्छी गाउँपालिका', 'Galchhi Rural Municipality', 33, 1, 8),
(368, 'गङ्गाजमुना गाउँपालिका', 'Gangajumuna Rural Municipality', 33, 1, 7),
(369, 'ज्वालामूखी गाउँपालिका', 'Jwalamukhi Rural Municipality', 33, 1, 7),
(370, 'थाक्रे गाउँपालिका', 'Thakre Rural Municipality', 33, 1, 11),
(371, 'नेत्रावती डबजोङ गाउँपालिका', 'Netrawati Dabajong Rural Municipality', 33, 1, 5),
(372, 'बेनीघाट रोराङ्ग गाउँपालिका', 'Benighat Rorang Rural Municipality', 33, 1, 10),
(373, 'रुवी भ्याली गाउँपालिका', 'Rubivalley Rural Municipality', 33, 1, 6),
(374, 'सिद्धलेक गाउँपालिका', 'Siddhalek Rural Municipality', 33, 1, 7),
(375, 'त्रिपुरासुन्दरी गाउँपालिका', 'Tripurasundari Rural Municipality', 33, 1, 7),
(376, 'हेटौडा उपमहानगरपालिका', 'Hetauda Sub-Metropolitan City', 34, 1, 19),
(377, 'थाहा नगरपालिका', 'Thaha Municipality', 34, 1, 12),
(378, 'इन्द्रसरोबर गाउँपालिका', 'Indrasarowar Rural Municipality', 34, 1, 5),
(379, 'कैलाश गाउँपालिका', 'Kailash Rural Municipality', 34, 1, 10),
(380, 'बकैया गाउँपालिका', 'Bakaiya Rural Municipality', 34, 1, 12),
(381, 'बाग्मति गाउँपालिका', 'Bagamati Rural Municipality', 34, 1, 9),
(382, 'भिमफेदी गाउँपालिका', 'Bhimaphedi Rural Municipality', 34, 1, 9),
(383, 'मकवानपुरगढी गाउँपालिका', 'Makawanpurgadhi Rural Municipality', 34, 1, 8),
(384, 'मनहरी गाउँपालिका', 'Manahari Rural Municipality', 34, 1, 9),
(385, 'राक्सिराङ्ग गाउँपालिका', 'Raksirang Rural Municipality', 34, 1, 9),
(386, 'भरतपुर महानगरपालिका', 'Bharatpur Metropolitan City', 35, 1, 29),
(387, 'कालिका नगरपालिका', 'Kalika Municipality', 35, 1, 11),
(388, 'खैरहनी नगरपालिका', 'Khairahani Municipality', 35, 1, 13),
(389, 'माडी नगरपालिका', 'Madi Municipality', 35, 1, 9),
(390, 'रत्ननगर नगरपालिका', 'Ratnanagar Municipality', 35, 1, 16),
(391, 'राप्ती नगरपालिका', 'Rapti Municipality', 35, 1, 13),
(392, 'इच्छाकामना गाउँपालिका', 'Ichchhakamana Rural Municipality', 35, 1, 7),
(393, 'गोरखा नगरपालिका', 'Gorkha Municipality', 36, 1, 14),
(394, 'पालुङटार नगरपालिका', 'Palungtar Municipality', 36, 1, 10),
(395, 'सुलीकोट गाउँपालिका', 'Silukot Rural Municipality', 36, 1, 8),
(396, 'सिरानचोक गाउँपालिका', 'Siranchowk Rural Municipality', 36, 1, 8),
(397, 'अजिरकोट गाउँपालिका', 'Ajirkot Rural Municipality', 36, 1, 5),
(398, 'आरूघाट गाउँपालिका', 'Aarughat Rural Municipality', 36, 1, 10),
(399, 'गण्डकी गाउँपालिका', 'Gandaki Rural Municipality', 36, 1, 8),
(400, 'चुमनुव्री गाउँपालिका', 'Chumnuwri Rural Municipality', 36, 1, 7),
(401, 'धार्चे गाउँपालिका', 'Dharche Rural Municipality', 36, 1, 7),
(402, 'भिमसेन गाउँपालिका', 'Bhimasen Rural Municipality', 36, 1, 8),
(403, 'शहिद लखन गाउँपालिका', 'Sahid Lakhan Rural Municipality', 36, 1, 9),
(404, 'बेसीशहर नगरपालिका', 'Beshishahar Municipality', 37, 1, 11),
(405, 'मध्यनेपाल नगरपालिका', 'Madhyanepal Municipality', 37, 1, 10),
(406, 'रार्इनास नगरपालिका', 'Rainas Municipality', 37, 1, 10),
(407, 'सुन्दरबजार नगरपालिका', 'Sundarbazar Municipailty', 37, 1, 11),
(408, 'क्व्होलासोथार गाउँपालिका', 'Kwholasothar Rural Municipality', 37, 1, 9),
(409, 'दूधपोखरी गाउँपालिका', 'Dudhpokhari Rural Municipality', 37, 1, 6),
(410, 'दोर्दी गाउँपालिका', 'Dordi Rural Municipality', 37, 1, 9),
(411, 'मर्स्याङदी गाउँपालिका', 'Marsyandi Rual Municipality', 37, 1, 9),
(412, 'भानु नगरपालिका', 'Bhanu Municipality', 38, 1, 13),
(413, 'भिमाद नगरपालिका', 'Bhimad Municipality', 38, 1, 9),
(414, 'व्यास नगरपालिका', 'Byas Municipality', 38, 1, 14),
(415, 'शुक्लागण्डकी नगरपालिका', 'Shuklagandaki Municipality', 38, 1, 12),
(416, 'आँबुखैरेनी गाउँपालिका', 'Aanbookhaireni Rural Municipality', 38, 1, 6),
(417, 'ऋषिङ्ग गाउँपालिका', 'Rhishing Rural Municipality', 38, 1, 8),
(418, 'घिरिङ गाउँपालिका', 'Gharing Rural Municipality', 38, 1, 5),
(419, 'देवघाट गाउँपालिका', 'Devghat Rural Municipality', 38, 1, 5),
(420, 'म्याग्दे गाउँपालिका', 'Myagde Rural Municipality', 38, 1, 7),
(421, 'वन्दिपुर गाउँपालिका', 'Bandipur Rural Municipality', 38, 1, 6),
(422, 'गल्याङ नगरपालिका', 'Galyang Municipality', 39, 1, 11),
(423, 'चापाकोट नगरपालिका', 'Chapakot Municipality', 39, 1, 10),
(424, 'पुतलीबजार नगरपालिका', 'Putalibazar Municipality', 39, 1, 14),
(425, 'भीरकोट नगरपालिका', 'Bhirkot Municipality', 39, 1, 9),
(426, 'वालिङ नगरपालिका', 'Waling Municipality', 39, 1, 14),
(427, 'अर्जुनचौपारी गाउँपालिका', 'Arjunchaupari Rural Municipality', 39, 1, 6),
(428, 'आँधिखोला गाउँपालिका', 'Aandhikhola Rural Municipality', 39, 1, 6),
(429, 'कालीगण्डकी गाउँपालिका', 'Kaligandaki Rural Municipality', 39, 1, 7),
(430, 'फेदीखोला गाउँपालिका', 'Phedikhola Rural Municipality', 39, 1, 5),
(431, 'बिरुवा गाउँपालिका', 'Biruwa Rural Municipality', 39, 1, 8),
(432, 'हरिनास गाउँपालिका', 'Harinas Rural Municipality', 39, 1, 7),
(433, 'पोखरा लेखनाथ महानगरपालिका', 'Pokhara Lekhanath Metropolitan City', 40, 1, 33),
(434, 'अन्नपूर्ण गाउँपालिका', 'Annapurna Rural Municipality', 40, 1, 11),
(435, 'माछापुच्छ्रे गाउँपालिका', 'Machhapuchchhre Rural Municipality', 40, 1, 9),
(436, 'मादी गाउँपालिका', 'Madi Rural Municipality', 40, 1, 12),
(437, 'रूपा गाउँपालिका', 'Rupa Rural Municipality', 40, 1, 7),
(438, 'चामे गाउँपालिका', 'Chame Rural Municipality', 41, 1, 5),
(439, 'नारफू गाउँपालिका', 'Narphu Rural Municipality', 41, 1, 5),
(440, 'नाशोङ गाउँपालिका', 'Nashong Rural Municipality', 41, 1, 9),
(441, 'नेस्याङ गाउँपालिका', 'Nesyang Rural Municipality', 41, 1, 9),
(442, 'घरपझोङ गाउँपालिका', 'Gharpajhong Rural Municipality', 42, 1, 5),
(443, 'थासाङ गाउँपालिका', 'Thasang Rural Municipality', 42, 1, 5),
(444, 'दालोमे गाउँपालिका', 'Dalome Rural Municipality', 42, 1, 5),
(445, 'लोमन्थाङ गाउँपालिका', 'Lomanthang Rural Municipality', 42, 1, 5),
(446, 'वाह्रगाउँ मुक्तिक्षेत्र गाउँपालिका', 'barhagaun Muktikshyetra Rural Municipality', 42, 1, 5),
(447, 'बेनी नगरपालिका', 'Beni Municipality', 43, 1, 10),
(448, 'अन्नपूर्ण गाउँपालिका', 'Annapurna Rural Municipality', 43, 1, 8),
(449, 'धवलागिरी गाउँपालिका', 'Dhaulagiri Rural Municipality', 43, 1, 7),
(450, 'मंगला गाउँपालिका', 'Mangala Rural Municipality', 43, 1, 5),
(451, 'मालिका गाउँपालिका', 'Malika Rural Municipality', 43, 1, 7),
(452, 'रघुगंगा गाउँपालिका', 'Raghuganga Rural Municipality', 43, 1, 8),
(453, 'कुश्मा नगरपालिका', 'Kushma Municipality', 44, 1, 14),
(454, 'फलेवास नगरपालिका', 'Phalebas Municipality', 44, 1, 11),
(455, 'जलजला गाउँपालिका', 'Jaljala Rural Municipality', 44, 1, 9),
(456, 'पैयूं गाउँपालिका', 'Painyu Rural Municipality', 44, 1, 7),
(457, 'महाशिला गाउँपालिका', 'Mahashila Rural Municipality', 44, 1, 6),
(458, 'मोदी गाउँपालिका', 'Modi Rural Municipality', 44, 1, 8),
(459, 'विहादी गाउँपालिका', 'Bihadi Rural Municipality', 44, 1, 6),
(460, 'बागलुङ नगरपालिका', 'Bagalung Municipality', 45, 1, 14),
(461, 'गल्कोट नगरपालिका', 'Galkot Municipality', 45, 1, 11),
(462, 'जैमूनी नगरपालिका', 'Jaimuni Municipality', 45, 1, 10),
(463, 'ढोरपाटन नगरपालिका', 'Dhorpatan Municipality', 45, 1, 9),
(464, 'वरेङ गाउँपालिका', 'Wareng Rural Municipality', 45, 1, 5),
(465, 'काठेखोला गाउँपालिका', 'Khathekhola Rural Municipality', 45, 1, 8),
(466, 'तमानखोला गाउँपालिका', 'Tamankhola Rural Municipality', 45, 1, 6),
(467, 'ताराखोला गाउँपालिका', 'Tarakhola Rural Municipality', 45, 1, 5),
(468, 'निसीखोला गाउँपालिका', 'Nisikhola Rural Municipality', 45, 1, 7),
(469, 'वडिगाड गाउँपालिका', 'Badigad Rural Municipality', 45, 1, 10),
(470, 'कावासोती नगरपालिका', 'Kawasoti Municipality', 46, 1, 17),
(471, 'गैडाकोट नगरपालिका', 'Gaindakot Municipality', 46, 1, 18),
(472, 'देवचुली नगरपालिका', 'Devchuli Municipality', 46, 1, 17),
(473, 'मध्यविन्दु नगरपालिका', 'Madhyabindu Municipality', 46, 1, 15),
(474, 'बुङ्दीकाली गाउँपालिका', 'Bungdikali Rural Municipality', 46, 1, 6),
(475, 'बुलिङटार गाउँपालिका', 'Bulingtar Rural Municipality', 46, 1, 6),
(476, 'विनयी त्रिवेणी गाउँपालिका', 'Binayitribeni Rural Municipality', 46, 1, 7),
(477, 'हुप्सेकोट गाउँपालिका', 'Hupsekot Rural Municipality', 46, 1, 6),
(478, 'मुसिकोट नगरपालिका', 'Musikot Municipality', 47, 1, 9),
(479, 'रेसुङ्गा नगरपालिका', 'Resunga Municipality', 47, 1, 14),
(480, 'ईस्मा गाउँपालिका', 'Isma Rural Municipality', 47, 1, 6),
(481, 'कालीगण्डकी गाउँपालिका', 'Kaligandaki Rural Municipality', 47, 1, 7),
(482, 'गुल्मी दरबार गाउँपालिका', 'Gulmi Darbar Rural Municipality', 47, 1, 7),
(483, 'सत्यवती गाउँपालिका', 'Satyawati Rural Municipality', 47, 1, 8),
(484, 'चन्द्रकोट गाउँपालिका', 'Chandrakot Rural Municipality', 47, 1, 8),
(485, 'रुरु गाउँपालिका', 'Ruru Rural Municipality', 47, 1, 6),
(486, 'छत्रकोट गाउँपालिका', 'Chhatrakot Rural Municipality', 47, 1, 6),
(487, 'धुर्कोट गाउँपालिका', 'Dhurkot Rural Municipality', 47, 1, 7),
(488, 'मदाने गाउँपालिका', 'Madane Rural Municipality', 47, 1, 7),
(489, 'मालिका गाउँपालिका', 'Malika Rural Municipality', 47, 1, 8),
(490, 'रामपुर नगरपालिका', 'Rampur Municipality', 48, 1, 10),
(491, 'तानसेन नगरपालिका', 'Tansen Municipality', 48, 1, 14),
(492, 'निस्दी गाउँपालिका', 'Nisdi Rural Municipality', 48, 1, 7),
(493, 'पूर्वखोला गाउँपालिका', 'Purbakhola Rural Municipality', 48, 1, 6),
(494, 'रम्भा गाउँपालिका', 'Rambha Rural Municipality', 48, 1, 5),
(495, 'माथागढी गाउँपालिका', 'Mathagadhi Rural Municipality', 48, 1, 8),
(496, 'तिनाउ गाउँपालिका', 'Tinau Rural Municipality', 48, 1, 6),
(497, 'बगनासकाली गाउँपालिका', 'Baganaskali Rural Municipality', 48, 1, 9),
(498, 'रिब्दिकोट गाउँपालिका', 'Ribdikot Rural Municipality', 48, 1, 8),
(499, 'रैनादेवी छहरा गाउँपालिका', 'Rainadevi Chhahara Rural Municipality', 48, 1, 8),
(500, 'बुटवल उपमहानगरपालिका', 'Butawal Sub-Metropolitan City', 49, 1, 19),
(501, 'देवदह नगरपालिका', 'Devdaha Municipality', 49, 1, 12),
(502, 'लुम्बिनी सांस्कृतिक नगरपालिका', 'Lumbini Cultural Municipality', 49, 1, 13),
(503, 'सैनामैना नगरपालिका', 'Sainamaina Municipality', 49, 1, 11),
(504, 'सिद्धार्थनगर नगरपालिका', 'Siddharthanagar Municipality', 49, 1, 13),
(505, 'तिलोत्तमा नगरपालिका', 'Tilottama Municipality', 49, 1, 17),
(506, 'गैडहवा गाउँपालिका', 'Gaidahawa Rural Municipality', 49, 1, 9),
(507, 'कन्चन गाउँपालिका', 'Kanchan Rural Municipality', 49, 1, 5),
(508, 'कोटहीमाई गाउँपालिका', 'Kotahimai Rural Municipality', 49, 1, 7),
(509, 'मर्चवारी गाउँपालिका', 'Marchawari Rural Municipality', 49, 1, 7),
(510, 'मायादेवी गाउँपालिका', 'Mayadevi Rural Municipality', 49, 1, 8),
(511, 'ओमसतिया गाउँपालिका', 'Omsatiya Rural Municipality', 49, 1, 6),
(512, 'रोहिणी गाउँपालिका', 'Rihini Rural Municipality', 49, 1, 7),
(513, 'सम्मरीमाई गाउँपालिका', 'Sammarimai Rural Municipality', 49, 1, 7),
(514, 'सियारी गाउँपालिका', 'Siyari Rural Municipality', 49, 1, 7),
(515, 'शुद्धोधन गाउँपालिका', 'Shuddodhan Rural Municipality', 49, 1, 7),
(516, 'कपिलवस्तु नगरपालिका', 'Kapilvastu Municipality', 50, 1, 12),
(517, 'बुद्धभूमी नगरपालिका', 'Buddhabhumi Municipality', 50, 1, 10),
(518, 'शिवराज नगरपालिका', 'Shivaraj Municipality', 50, 1, 11),
(519, 'महाराजगंज नगरपालिका', 'Maharajganj Municipality', 50, 1, 11),
(520, 'कृष्णनगर नगरपालिका', 'Krishnanagar Municipality', 50, 1, 12),
(521, 'बाणगंगा नगरपालिका', 'Banganga Municipality', 50, 1, 11),
(522, 'मायादेवी गाउँपालिका', 'Mayadevi Rural Municipality', 50, 1, 8),
(523, 'यसोधरा गाउँपालिका', 'Yasodhara Rural Municipality', 50, 1, 8),
(524, 'सुद्धोधन गाउँपालिका', 'Shuddodhan Rural Municipality', 50, 1, 6),
(525, 'विजयनगर गाउँपालिका', 'Bijayanagar Rural Municipality', 50, 1, 7),
(526, 'सन्धिखर्क नगरपालिका', 'Sandhikharka Municipality', 51, 1, 12),
(527, 'शितगंगा नगरपालिका', 'Shitganga Municipality', 51, 1, 14),
(528, 'भूमिकास्थान नगरपालिका', 'Bhumikasthan Municipality', 51, 1, 10),
(529, 'छत्रदेव गाउँपालिका', 'Chhatradev Rural Municipality', 51, 1, 8),
(530, 'पाणिनी गाउँपालिका', 'Panini Rural Municipality', 51, 1, 8),
(531, 'मालारानी गाउँपालिका', 'Malarani Rural Municipality', 51, 1, 9),
(532, 'प्यूठान नगरपालिका', 'Pyuthan Municipality', 52, 1, 10),
(533, 'स्वर्गद्वारी नगरपालिका', 'Swargadwari municipality', 52, 1, 9),
(534, 'गौमुखी गाउँपालिका', 'Gaumukhi Rural Municipality', 52, 1, 7),
(535, 'माण्डवी गाउँपालिका', 'Mandawi Rural Municipality', 52, 1, 5),
(536, 'सरुमारानी गाउँपालिका', 'Sarumarani Rural Municipality', 52, 1, 6),
(537, 'मल्लरानी गाउँपालिका', 'Mallarani Rural Municipality', 52, 1, 5),
(538, 'नौवहिनी गाउँपालिका', 'Nauwahini Rural Municipality', 52, 1, 8),
(539, 'झिमरुक गाउँपालिका', 'Jhimruk Rural Municipality', 52, 1, 8),
(540, 'ऐरावती गाउँपालिका', 'Erawati Rural Municipality', 52, 1, 6),
(541, 'रोल्पा नगरपालिका', 'Rolpa Municipality', 53, 1, 10),
(542, 'त्रिवेणी गाउँपालिका', 'Tribeni Rural Municipality', 53, 1, 7),
(543, 'दुईखोली गाउँपालिका', 'Duikholi Rural Municipality', 53, 1, 6),
(544, 'माडी गाउँपालिका', 'Madi Rural Municipality', 53, 1, 6),
(545, 'रुन्टीगढी गाउँपालिका', 'Runtigadhi Rural Municipality', 53, 1, 9),
(546, 'लुङग्री गाउँपालिका', 'Lingri Rural Municipality', 53, 1, 7),
(547, 'गंगादेव गाउँपालिका', 'Gangadev Rural Municipality', 53, 1, 7),
(548, 'सुनछहरी गाउँपालिका', 'Sunchhahari Rural Municipality', 53, 1, 7),
(549, 'सुनिल स्मृति गाउँपालिका', 'Sunilsmriti Rural Municipality', 53, 1, 8),
(550, 'थवाङ गाउँपालिका', 'Thawang Rural Municipality', 53, 1, 5),
(551, 'पुथा उत्तरगंगा गाउँपालिका', 'Putha Uttarganga Rural Municipality', 54, 1, 14),
(552, 'भूमे गाउँपालिका', 'Bhume Rural Municipality', 54, 1, 9),
(553, 'सिस्ने गाउँपालिका', 'Sisne Rural Municipality', 54, 1, 8),
(554, 'तुल्सीपुर उपमहानगरपालिका', 'Tulsipur Sub-Metropolitan City', 55, 1, 19),
(555, 'घोराही उपमहानगरपालिका', 'Ghorahi Sub-Metropolitan City', 55, 1, 19),
(556, 'लमही नगरपालिका', 'Lamahi Municipality', 55, 1, 9),
(557, 'बंगलाचुली गाउँपालिका', 'Bangalachuli Rural Municiplity', 55, 1, 8),
(558, 'दंगीशरण गाउँपालिका', 'Dangisharan Rural Municipality', 55, 1, 7),
(559, 'गढवा गाउँपालिका', 'Gadhawa Rural Municipality', 55, 1, 8),
(560, 'राजपुर गाउँपालिका', 'Rajpur Rural Municipality', 55, 1, 7),
(561, 'राप्ती गाउँपालिका', 'Rapti Rural Municipality', 55, 1, 9),
(562, 'शान्तिनगर गाउँपालिका', 'Shantinagar Rurla Municipality', 55, 1, 7),
(563, 'बबई गाउँपालिका', 'babai Rural Municipality', 55, 1, 7),
(564, 'नेपालगंज उपमहानगरपालिका', 'Nepalgunj Sub-Metropolitan City', 56, 1, 23),
(565, 'कोहलपुर नगरपालिका', 'Kohalpur Municipality', 56, 1, 15),
(566, 'नरैनापुर गाउँपालिका', 'Narainapur Rural Municipality', 56, 1, 6),
(567, 'राप्तीसोनारी गाउँपालिका', 'Raptisonari Rural Municipality', 56, 1, 9),
(568, 'बैजनाथ गाउँपालिका', 'Baijanath Rural Municipality', 56, 1, 8),
(569, 'खजुरा गाउँपालिका', 'Khajura Rural Municipality', 56, 1, 6),
(570, 'डुडुवा गाउँपालिका', 'duduwa Rural Municipality', 56, 1, 6),
(571, 'जानकी गाउँपालिका', 'Janaki Rural Municipality', 56, 1, 6),
(572, 'गुलरिया नगरपालिका', 'Gulariya Municipality', 57, 1, 12),
(573, 'मधुवन नगरपालिका', 'Madhuwan Municipality', 57, 1, 9),
(574, 'राजापुर नगरपालिका', 'Rajapur Municipality', 57, 1, 10),
(575, 'ठाकुरबाबा नगरपालिका', 'Thakurbaba Municipality', 57, 1, 9),
(576, 'बाँसगढी नगरपालिका', 'Basgadhi Municipality', 57, 1, 9),
(577, 'बारबर्दिया नगरपालिका', 'Barbardiya Municipality', 57, 1, 11),
(578, 'बढैयाताल गाउँपालिका', 'Badhaiyatal Rural municipali', 57, 1, 9),
(579, 'गेरुवा गाउँपालिका', 'Geruwa Rural Municipality', 57, 1, 6),
(580, 'बर्दघाट नगरपालिका', 'Bardaghat Municipalty', 58, 1, 16),
(581, 'रामग्राम नगरपालिका', 'Ramgram Municipaity', 58, 1, 18),
(582, 'सुनवल नगरपालिका', 'Sunawal Municipality', 58, 1, 13),
(583, 'सुस्ता गाउँपालिका', 'Susta Rural Municipality', 58, 1, 5),
(584, 'पाल्हीनन्दन गाउँपालिका', 'Palhinandan Rural Municipality', 58, 1, 6),
(585, 'प्रतापपुर गाउँपालिका', 'Pratappur Rural Municipality', 58, 1, 9),
(586, 'सरावल गाउँपालिका', 'Sarawal Rural Municipality', 58, 1, 7),
(587, 'मुसिकोट नगरपालिका', 'Musikot Municipality', 59, 1, 14),
(588, 'चौरजहारी नगरपालिका', 'Chaurjahari Municipality', 59, 1, 14),
(589, 'आठबिसकोट नगरपालिका', 'Aathabiskot Municipality', 59, 1, 14),
(590, 'बाँफिकोट गाउँपालिका', 'Baphikot Rural Municipality', 59, 1, 10),
(591, 'त्रिवेणी गाउँपालिका', 'Tribeni Rural Municipality', 59, 1, 10),
(592, 'सानी भेरी गाउँपालिका', 'Sani Bheri Rural Municipality', 59, 1, 11),
(593, 'शारदा नगरपालिका', 'Sharada Municipality', 60, 1, 15),
(594, 'बागचौर नगरपालिका', 'Bagachaur Municipality', 60, 1, 12),
(595, 'बनगाड कुपिण्डे नगरपालिका', 'bangad kupinde Municipality', 60, 1, 12),
(596, 'कालिमाटी गाउँपालिका', 'Kalimati Rural Municipality', 60, 1, 7),
(597, 'त्रिवेणी गाउँपालिका', 'Tribeni Rural Municipality', 60, 1, 6),
(598, 'कपुरकोट गाउँपालिका', 'Kapurkot Rural Municipality', 60, 1, 6),
(599, 'छत्रेश्वरी गाउँपालिका', 'Chhatreshwari Rural Municipality', 60, 1, 7),
(600, 'सिद्ध कुमाख गाउँपालिका', 'Siddhakumakh Rural Municipality', 60, 1, 5),
(601, 'कुमाख गाउँपालिका', 'Kumakh Rural Municipality', 60, 1, 7),
(602, 'दार्मा गाउँपालिका', 'Darma Rural Municipality', 60, 1, 6),
(603, 'बीरेन्द्रनगर नगरपालिका', 'Berendranagar Municipality', 61, 1, 16),
(604, 'भेरीगंगा नगरपालिका', 'Bheriganga Municipality', 61, 1, 13),
(605, 'गुर्भाकोट नगरपालिका', 'Gurbhakot Municipality', 61, 1, 14),
(606, 'पञ्चपुरी नगरपालिका', 'Panchapuri Municiaplity', 61, 1, 11),
(607, 'लेकवेशी नगरपालिका', 'lekbeshi Municipality', 61, 1, 10),
(608, 'चौकुने गाउँपालिका', 'Chaukune Rural Municipality', 61, 1, 10),
(609, 'बराहताल गाउँपालिका', 'Barahatal Rural Municipality', 61, 1, 10),
(610, 'चिङ्गाड गाउँपालिका', 'Chingad Rural Municipality', 61, 1, 6),
(611, 'सिम्ता गाउँपालिका', 'Simta Rural Municipality', 61, 1, 9),
(612, 'नारायण नगरपालिका', 'Narayan Municipaity', 62, 1, 11),
(613, 'दुल्लु नगरपालिका', 'Dullu Municipality', 62, 1, 13),
(614, 'चामुण्डा विन्द्रासैनी नगरपालिका', 'Chamunda Bindrasaini Municipality', 62, 1, 9),
(615, 'आठबीस नगरपालिका', 'Aathabis Municipality', 62, 1, 9),
(616, 'भगवतीमाई गाउँपालिका', 'Bhagawatimai Rural Municipality', 62, 1, 7),
(617, 'गुराँस गाउँपालिका', 'Gurans Rural Municipality', 62, 1, 8),
(618, 'डुंगेश्वर गाउँपालिका', 'Dungeshwar Rural Municipality', 62, 1, 6),
(619, 'नौमुले गाउँपालिका', 'Naumule Rural Municipality', 62, 1, 8),
(620, 'महावु गाउँपालिका', 'Mahabu Rural Municipality', 62, 1, 6),
(621, 'भैरवी गाउँपालिका', 'Bhairabi Rural Municipality', 62, 1, 7),
(622, 'ठाँटीकाँध गाउँपालिका', 'Thantikadh Rural Municipality', 62, 1, 6),
(623, 'भेरी नगरपालिका', 'Bheri Municipality', 63, 1, 13),
(624, 'छेडागाड नगरपालिका', 'Chhedagad Municipality', 63, 1, 13),
(625, 'त्रिवेणी नलगाड नगरपालिका', 'Tribeni Nalgad Municipality', 63, 1, 13),
(626, 'बारेकोट गाउँपालिका', 'Barekot Rural Municipality', 63, 1, 9),
(627, 'कुसे गाउँपालिका', 'Kuse Rural Municipality', 63, 1, 9),
(628, 'जुनीचाँदे गाउँपालिका', 'Junichande Rural Municipality', 63, 1, 11),
(629, 'शिवालय गाउँपालिका', 'Shivalaya Rural Municipality', 63, 1, 9),
(630, 'ठुली भेरी नगरपालिका', 'Thuli Bheri Municipality', 64, 1, 11),
(631, 'त्रिपुरासुन्दरी नगरपालिका', 'Tripurasundari Municipality', 64, 1, 11),
(632, 'डोल्पो बुद्ध गाउँपालिका', 'Dolpo Buddha Rural Municipality', 64, 1, 6),
(633, 'शे फोक्सुन्डो गाउँपालिका', 'She-phoksunde Rural Municipality', 64, 1, 9),
(634, 'जगदुल्ला गाउँपालिका', 'Jagdulla Rural Municipality', 64, 1, 6),
(635, 'मुड्केचुला गाउँपालिका', 'Mudkechulla Rural Municipality', 64, 1, 9),
(636, 'काईके गाउँपालिका', 'Kaike Rural Municipality', 64, 1, 7),
(637, 'छार्का ताङसोङ गाउँपालिका', 'Chharka Tangsong Rural Municipality', 64, 1, 6),
(638, 'चन्दननाथ नगरपालिका', 'Chandannath Municipality', 65, 1, 10),
(639, 'कनकासुन्दरी गाउँपालिका', 'Kankasundari Rural Municipality', 65, 1, 8),
(640, 'सिंजा गाउँपालिका', 'Sinja Rural Municiplality', 65, 1, 6),
(641, 'हिमा गाउँपालिका', 'Hima Rural Municipality', 65, 1, 7),
(642, 'तिला गाउँपालिका', 'Tila Rural Municipality', 65, 1, 9),
(643, 'गुठिचौर गाउँपालिका', 'Guthichaur Ruram Municipality', 65, 1, 5),
(644, 'तातोपानी गाउँपालिका', 'Tatopani Rural Municipality', 65, 1, 8),
(645, 'पातारासी गाउँपालिका', 'Patarasi Rural Municipality', 65, 1, 7),
(646, 'खाँडाचक्र नगरपालिका', 'Khandachakra Municipality', 66, 1, 11),
(647, 'रास्कोट नगरपालिका', 'Raskot Municipality', 66, 1, 9),
(648, 'तिलागुफा नगरपालिका', 'Tilagupha Municipality', 66, 1, 11),
(649, 'पचालझरना गाउँपालिका', 'Pachaljharna Rural Municipality', 66, 1, 9),
(650, 'सान्नी त्रिवेणी गाउँपालिका', 'Sanni Tribeni Rural Municipality', 66, 1, 9),
(651, 'नरहरिनाथ गाउँपालिका', 'Naraharinath Rural Municipality', 66, 1, 9),
(652, 'कालिका गाउँपालिका', 'Kalika Rural Municipality', 66, 1, 8),
(653, 'महावै गाउँपालिका', 'Mahawai Rural Municipality', 66, 1, 7),
(654, 'पलाता गाउँपालिका', 'Patala Rural Municipality', 66, 1, 9),
(655, 'छायाँनाथ रारा नगरपालिका', 'Chhayanath Rara Municipality', 67, 1, 14),
(656, 'मुगुम कार्मारोंग गाउँपालिका', 'Mugum Karmarong Rural Municipality', 67, 1, 9),
(657, 'सोरु गाउँपालिका', 'Soru Rural Municipality', 67, 1, 11),
(658, 'खत्याड गाउँपालिका', 'Khalyad Rural Municipality', 67, 1, 11),
(659, 'सिमकोट गाउँपालिका', 'Simkot Rural Municipality', 68, 1, 8),
(660, 'नाम्खा गाउँपालिका', 'Namkha Rural Municipality', 68, 1, 6),
(661, 'खार्पुनाथ गाउँपालिका', 'Kharpunath Rural Municipality', 68, 1, 5),
(662, 'सर्केगाड गाउँपालिका', 'Sarkegad Rural Municipality', 68, 1, 8),
(663, 'चंखेली गाउँपालिका', 'Chankheli Rural Municipality', 68, 1, 6),
(664, 'अदानचुली गाउँपालिका', 'Adanchuli Rural Municipality', 68, 1, 6),
(665, 'ताँजाकोट गाउँपालिका', 'Tajakot Rural Municipality', 68, 1, 5),
(666, 'बडीमालिका नगरपालिका', 'Badi Malika Municiaplity', 69, 1, 9),
(667, 'त्रिवेणी नगरपालिका', 'Tribeni Municipality', 69, 1, 9),
(668, 'बुढीगंगा नगरपालिका', 'Budhiganga Municipality', 69, 1, 10),
(669, 'बुढीनन्दा नगरपालिका', 'Budhinanda Municipality', 69, 1, 10),
(670, 'गौमुल गाउँपालिका', 'Gaumul Rural Municipality', 69, 1, 6),
(671, 'जगन्नाथ गाउँपालिका', 'Jagannath Rural Municipality', 69, 1, 6),
(672, 'स्वामीकार्तिक गाउँपालिका', 'Swamikartik Rural Municipality', 69, 1, 5),
(673, 'खप्तड छेडेदह गाउँपालिका', 'Khaptad Chhededaha Rural Municipality', 69, 1, 7),
(674, 'हिमाली गाउँपालिका', 'Himali Rural Municipality', 69, 1, 7),
(675, 'जयपृथ्वी नगरपालिका', 'Jayaprithbi Municipality', 70, 1, 11),
(676, 'बुंगल नगरपालिका', 'Bungal Municipality', 70, 1, 11),
(677, 'तलकोट गाउँपालिका', 'Talakot Rural Municipality', 70, 1, 7),
(678, 'मष्टा गाउँपालिका', 'Masta Rural Municipality', 70, 1, 7),
(679, 'खप्तडछान्ना गाउँपालिका', 'Khaptadchhanna Rural Municipality', 70, 1, 7),
(680, 'थलारा गाउँपालिका', 'Thalara Rural Municipality', 70, 1, 9),
(681, 'वित्थडचिर गाउँपालिका', 'Bitthadchir Rural Municipality', 70, 1, 9),
(682, 'सूर्मा गाउँपालिका', 'Surma Rural Municipality', 70, 1, 5),
(683, 'छबिसपाथिभेरा गाउँपालिका', 'Chhabispathibhera Rural Municipality', 70, 1, 7),
(684, 'दुर्गाथली गाउँपालिका', 'Durgathali Rural Municipality', 70, 1, 7),
(685, 'केदारस्युँ गाउँपालिका', 'Kedarsnyu Rural Municipality', 70, 1, 9),
(686, 'काँडा गाउँपालिका', 'Kada Rural Municipality', 70, 1, 5),
(687, 'मंगलसेन नगरपालिका', 'Mangalsen Municipality', 71, 1, 14),
(688, 'कमलबजार नगरपालिका', 'Kamalbazar Municipality', 71, 1, 10),
(689, 'साँफेबगर नगरपालिका', 'Sanpheebagar Municipality', 71, 1, 14),
(690, 'पन्चदेवल विनायक नगरपालिका', 'Panchadewal Binayak Municipality', 71, 1, 9),
(691, 'चौरपाटी गाउँपालिका', 'Chaurpati Rural Municiality ', 71, 1, 7),
(692, 'मेल्लेख गाउँपालिका', 'Mellekh Rural Municipality', 71, 1, 8),
(693, 'बान्निगढी जयगढ गाउँपालिका', 'Bannigadhi Rural Municipality', 71, 1, 6),
(694, 'रामारोशन गाउँपालिका', 'Ramaroshan Rural Municipality', 71, 1, 7),
(695, 'ढकारी गाउँपालिका', 'Dhakari Rural municipality', 71, 1, 8),
(696, 'तुर्माखाँद गाउँपालिका', 'Turmakhanda Rural Municipality', 71, 1, 8),
(697, 'दिपायल सिलगढी नगरपालिका', 'Dipayal Silgadhi Municipality', 72, 1, 9),
(698, 'शिखर नगरपालिका', 'Shikhar Municipality', 72, 1, 11),
(699, 'पूर्वीचौकी गाउँपालिका', 'Purbichauki Rural Municipality', 72, 1, 7),
(700, 'बडीकेदार गाउँपालिका', 'Badikedar Rural Municipality', 72, 1, 5),
(701, 'जोरायल गाउँपालिका', 'Jorayal Rural Municipality', 72, 1, 6),
(702, 'सायल गाउँपालिका', 'Sayal Rural Municipality', 72, 1, 6),
(703, 'आदर्श गाउँपालिका', 'Aadarsha Rural Municipality', 72, 1, 7),
(704, 'के.आई.सिं. गाउँपालिका', 'KI sigh Rural Municipality ', 72, 1, 7),
(705, 'बोगटान फुड्सिल गाउँपालिका', 'Bogatan Phudsil Rural Municipality', 72, 1, 7),
(706, 'धनगढी उपमहानगरपालिका', 'Dhangadhi Sub-Metropolitan City', 73, 1, 19),
(707, 'टिकापुर नगरपालिका', 'Tikapur Municipality', 73, 1, 9),
(708, 'घोडाघोडी नगरपालिका', 'Ghodaghodi Municipality', 73, 1, 12),
(709, 'लम्कीचुहा नगरपालिका', 'Lamkichuha Municipality', 73, 1, 10),
(710, 'भजनी नगरपालिका', 'Bhajani Municipality', 73, 1, 9),
(711, 'गोदावरी नगरपालिका', 'Godawari Municipality', 73, 1, 12),
(712, 'गौरीगंगा नगरपालिका', 'Gauriganga Municipality', 73, 1, 11),
(713, 'जानकी गाउँपालिका', 'Janaki Rural Municipality', 73, 1, 9),
(714, 'बर्दगोरिया गाउँपालिका', 'Bardagoriya Rural Municipality', 73, 1, 6),
(715, 'मोहन्याल गाउँपालिका', 'Mohanyal Rural Municipality', 73, 1, 7),
(716, 'कैलारी गाउँपालिका', 'Kailari Rural Municipality ', 73, 1, 9),
(717, 'जोशीपुर गाउँपालिका', 'Joshipur Rural Municipality', 73, 1, 7),
(718, 'चुरे गाउँपालिका', 'Chure Rural Municipality', 73, 1, 6),
(719, 'भीमदत्त नगरपालिका', 'Bhimdatta Municipality', 74, 1, 19),
(720, 'पुर्नवास नगरपालिका', 'Purnabas Municiaplity', 74, 1, 11),
(721, 'वेदकोट नगरपालिका', 'Bedkot Municiaplity', 74, 1, 10),
(722, 'महाकाली नगरपालिका', 'mahakali Municipality', 74, 1, 10),
(723, 'शुक्लाफाँटा नगरपालिका', 'Shuklaphata Municipality', 74, 1, 12),
(724, 'बेलौरी नगरपालिका', 'Belauri Municipality', 74, 1, 10),
(725, 'कृष्णपुर नगरपालिका', 'Krishnapur Municipality', 74, 1, 9),
(726, 'बेलडाडी गाउँपालिका', 'Beldadi Rural Municipality', 74, 1, 5),
(727, 'लालझाडी गाउँपालिका', 'Laljhadi Rural Municipality', 74, 1, 6),
(728, 'अमरगढी नगरपालिका', 'Amargadhi Municipality', 75, 1, 11),
(729, 'परशुराम नगरपालिका', 'Parashuram Municipality', 75, 1, 12),
(730, 'आलिताल गाउँपालिका', 'Aalital Rural Municipality', 75, 1, 8),
(731, 'भागेश्वर गाउँपालिका', 'Bhageshwar Rural Municipality', 75, 1, 5),
(732, 'नवदुर्गा गाउँपालिका', 'Nawadurga Rural Municipality ', 75, 1, 5),
(733, 'अजयमेरु गाउँपालिका', 'Ajayameru Rural Municipality', 75, 1, 6),
(734, 'गन्यापधुरा गाउँपालिका', 'Ganyapdhura Rural Municipality', 75, 1, 5),
(735, 'दशरथचन्द नगरपालिका', 'Dasharathchand Municipality', 76, 1, 11),
(736, 'पाटन नगरपालिका', 'Patan Municipality', 76, 1, 10),
(737, 'मेलौली नगरपालिका', 'Melauli Municipality', 76, 1, 9),
(738, 'पुर्चौडी नगरपालिका', 'Puchaudi Municipality', 76, 1, 10),
(739, 'सुर्नया गाउँपालिका', 'Surnaya Rural Municipality', 76, 1, 8),
(740, 'सिगास गाउँपालिका', 'Sigas Rural Municipality', 76, 1, 9);
INSERT INTO `settings_local_body` (`id`, `name`, `english_name`, `district_id`, `type`, `no_of_ward`) VALUES
(741, 'शिवनाथ गाउँपालिका', 'Shivanath Rural Municipality', 76, 1, 6),
(742, 'पञ्चेश्वर गाउँपालिका', 'Pancheshwar Rural Municipality', 76, 1, 6),
(743, 'दोगडाकेदार गाउँपालिका', 'Dohadakedar Rural Municipality', 76, 1, 8),
(744, 'डीलासैनी गाउँपालिका', 'Dilasaini Rural Municiapality', 76, 1, 7),
(745, 'महाकाली नगरपालिका', 'mahakali Municipality', 77, 1, 9),
(746, 'शैल्यशिखर नगरपालिका', 'Shailyashikhar Municipality', 77, 1, 9),
(747, 'मालिकार्जुन गाउँपालिका', 'Malikarjun Rural Municipality', 77, 1, 8),
(748, 'अपिहिमाल गाउँपालिका', 'Apihimal Rural Municipality', 77, 1, 6),
(749, 'दुहुँ गाउँपालिका', 'Duhu Rural Municipality', 77, 1, 5),
(750, 'नौगाड गाउँपालिका', 'Naugad Rural Municipality', 77, 1, 6),
(751, 'मार्मा गाउँपालिका', 'Marma Rural Municipality', 77, 1, 6),
(752, 'लेकम गाउँपालिका', 'Lekam Rural Municipality', 77, 1, 6),
(753, 'ब्याँस गाउँपालिका', 'Byas Rural Municipality', 77, 1, 6);

-- --------------------------------------------------------

--
-- Table structure for table `settings_marriage_types`
--

CREATE TABLE IF NOT EXISTS `settings_marriage_types` (
  `id` int(11) NOT NULL,
  `name` varchar(125) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_marriage_types`
--

INSERT INTO `settings_marriage_types` (`id`, `name`) VALUES
(3, 'सामाजिक परम्परा'),
(4, 'कानुनी विवाह'),
(5, 'प्रेम / भागी विवाह');

-- --------------------------------------------------------

--
-- Table structure for table `settings_office`
--

CREATE TABLE IF NOT EXISTS `settings_office` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `sambodhan` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_office`
--

INSERT INTO `settings_office` (`id`, `name`, `address`, `sambodhan`) VALUES
(1, 'जिल्ला प्रशासन कार्यालय ', 'गल्छी ', 'जो जस सँग सबन्धित छ '),
(2, 'गल्छी गाउँ कार्यपालिकाकाो कार्यालय', 'बैरेनी धादिङ ।', 'श्री प्रमुख प्रशासकीय अधिकृज्यू ।'),
(3, 'गल्छी गाउँ कार्यपालिकाकाो कार्यालय', 'बैरेनी धादिङ ।', 'श्री प्रमुख प्रशासकीय अधिकृज्यू ।'),
(4, 'गल्छी गाउँपालिका', 'बैरेनी धादिङ', 'श्री प्रमुख प्रशासकीय अधिकृत');

-- --------------------------------------------------------

--
-- Table structure for table `settings_oldnew_address`
--

CREATE TABLE IF NOT EXISTS `settings_oldnew_address` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `new_name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_oldnew_address`
--

INSERT INTO `settings_oldnew_address` (`id`, `name`, `new_name`) VALUES
(1, 'कल्लेरी 1', 'गल्छी गाउँपालिका वडा नं. 1'),
(2, 'कल्लेरी 2', 'गल्छी गाउँपालिका वडा नं. 1'),
(3, 'कल्लेरी', 'गल्छी गाउँपालिका वडा नं. 3');

-- --------------------------------------------------------

--
-- Table structure for table `settings_patra_category`
--

CREATE TABLE IF NOT EXISTS `settings_patra_category` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `sifaris_order` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_patra_category`
--

INSERT INTO `settings_patra_category` (`id`, `name`, `sifaris_order`) VALUES
(1, 'नागरीकता सम्बन्धी', 1),
(2, 'घर सम्बन्धी', 1),
(3, 'जग्गा सम्बन्धी', 1),
(4, 'संस्था / व्यवसाय सम्बन्धी', 1),
(5, 'बसोवास सम्बन्धी', 1),
(6, 'पारिवारीक / सामाजिक सिफारीस', 1),
(7, 'भौतिक पूर्वाधार निर्माण', 1),
(8, 'शिक्षा', 1),
(9, 'आर्थिक', 1),
(10, 'अंग्रेजी (English)', 1),
(11, 'अन्य', 1),
(12, 'खुल्ला ढाँचा', 1),
(13, 'प्रसाशन सम्बन्धी', 2);

-- --------------------------------------------------------

--
-- Table structure for table `settings_patra_item`
--

CREATE TABLE IF NOT EXISTS `settings_patra_item` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` text NOT NULL,
  `uri` varchar(100) NOT NULL,
  `model` varchar(125) NOT NULL,
  `image_link` text NOT NULL,
  `flag` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=227 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_patra_item`
--

INSERT INTO `settings_patra_item` (`id`, `category_id`, `name`, `uri`, `model`, `image_link`, `flag`) VALUES
(1, 2, 'घर कायमको सिफारिस', 'home-recommend', 'Mdl_home_recommend', 'home/home_recommend/', 1),
(2, 2, 'घर बाटो प्रमाणित', 'home-road-certify', 'Mdl_home_road_certify', 'home/road/', 1),
(3, 2, 'घर जग्गा नामसारी', 'ghar-jagga-namsari', 'Mdl_ghar_jagga_namsari', 'home/ghar_jagga_namsari/', 1),
(4, 2, 'कित्ताकाट सिफारिस', 'kitta-kat-sifaris', 'Mdl_kitta_kat_sifaris', 'home/kitta_kat_sifaris/', 1),
(5, 4, 'गैर नाफामुलक संस्था दर्ता प्रमाणपत्र', 'sanstha-darta-pramanpatra', 'Mdl_sanstha_darta_pramanpatra', 'business/sanstha_darta_pramanpatra/', 1),
(6, 4, 'व्यवसाय दर्ता प्रमाणपत्र', 'bebasaya-darta', 'Mdl_bebasaya_darta', 'business/bebasaya_darta/', 1),
(7, 4, 'व्यवसाय बन्द बारे', 'bebasaya-banda', 'Mdl_bebasaya_banda', 'business/bebasaya_banda/', 1),
(8, 4, 'संस्था दर्ता सिफारिस', 'sanstha-darta', 'Mdl_sanstha_darta', 'business/sanstha_darta/', 1),
(9, 4, 'संस्था नविकरण सिफारिस', 'sanstha-nabikaran', 'Mdl_sanstha_nabikaran', 'business/sanstha_nabikaran/', 1),
(10, 3, 'वार्षिक आय प्रमाणीकरण', 'income-verification', 'Mdl_income_verification', 'property/income_verification/', 1),
(11, 3, 'सम्पत्ति मूल्यांकन', 'property-valuation', 'Mdl_property_valuation', 'property/property_valuation/', 1),
(12, 3, 'कर सावधानी प्रमाणपत्र', 'tax-clearance', 'Mdl_tax_clearance', 'property/tax_clearance/', 1),
(13, 3, 'जग्गाधनी लाल पुर्जा प्रतिलिपि', 'lalpurja-pratilipi', 'Mdl_lalpurja_pratilipi', 'land/lalpurja/', 1),
(14, 3, 'बाटो कायम', 'bato-kayam', 'Mdl_batokayam', 'land/bato/', 1),
(15, 3, 'जग्गाधनी पुर्जामा घर कायम', 'purjama-ghar-kayam', 'Mdl_purjamagharkayam', 'land/ghar/', 1),
(16, 3, 'चार किल्ला सम्बन्धमा', 'char-killa', 'Mdl_charkilla', 'land/char_killa/', 1),
(17, 3, 'मोही लागत कट्टा', 'mohi-lagat-katta', 'Mdl_mohi_lagat_katta', 'land/mohi/', 1),
(18, 5, 'स्थायी बसोबास', 'sthai-basobas', 'Mdl_sthai_basobas', 'settlement/sthai_basobas/', 1),
(19, 5, 'अस्थायी बसोबास', 'asthai-basobas', 'Mdl_asthai_basobas', 'settlement/asthai_basobas/', 1),
(20, 5, 'अन्तरिक बसाई सराई', 'antarik-basai-sarai', 'Mdl_antarik_basai_sarai', 'settlement/antarik_basaisarai/', 1),
(21, 1, 'नागरिकता प्रमाणपत्र', 'citizenship-certificate', 'Mdl_certificate', 'land/citcertificate/', 1),
(22, 1, 'नागरिकता प्रमाणपत्र प्रतिलिपि', 'citizenship-certificate-pratilipi', 'Mdl_certificate_pratilipi', 'certificate/citcertificate_pratilipi/', 1),
(23, 6, ' विवाह प्रमाणित', 'bibaha-pramanit', 'Mdl_bibaha_pramanit', 'others/bibaha_pramanit/', 1),
(24, 7, 'खानेपानी जडान', 'khanepani-jadan', 'Mdl_khanepani_jadan', 'others/khanepani_jadan/', 1),
(25, 7, 'बिद्युत जडान', 'biduth-jadan', 'Mdl_biduth_jadan', 'others/biduth_jadan/', 1),
(26, 6, 'अविवाहित प्रमाणपत्र', 'abibhahit-pramanpatra', 'Mdl_abibhahit_pramanpatra', 'others/abibhahit_pramanpatra/', 1),
(27, 6, 'जन्म मिति प्रमाणित', 'janma-miti-pramanit', 'Mdl_janma_miti_pramanit', 'others/janma_miti_pramanit/', 1),
(28, 7, 'जेट मेशिन', 'jet-machine', 'Mdl_jet_machine', 'others/jet_machine/', 1),
(29, 6, 'फरक नाम थर सिफारिस', 'farak-nam-thar', 'Mdl_farak_nam_thar', 'others/farak_nam_thar/', 1),
(30, 7, 'सडक खन्ने स्वीकृति', 'sadak-khanne-swikriti', 'Mdl_sadak_khanne_swikriti', 'others/sadak_khanne_swikriti/', 1),
(31, 6, 'हकदार प्रमाणित', 'hakdar-pramanit', 'Mdl_hakdar_pramanit', 'others/hakdar_pramanit/', 1),
(32, 6, 'नाबालक परिचयपत्र', 'nabalak-pramanit', 'Mdl_nabalak_pramanit', 'others/nabalak_pramanit/', 1),
(33, 7, 'अदालत शुल्क मिनाह', 'court-fee', 'Mdl_court_fee', 'others/court_fee/', 1),
(34, 11, 'कोठा खाली सूचना', 'kotha-khali-suchana', 'Mdl_kotha_khali_suchana', 'others/kotha_khali_suchana/', 1),
(35, 6, 'नाता प्रमाणित', 'nata-pramanit', 'Mdl_nata_pramanit', 'others/nata_pramanit/', 1),
(36, 8, 'छात्रवृति मुल्यांकन', 'scholarship', 'Mdl_scholarship', 'others/scholarship/', 1),
(37, 11, ' प्राविधिक मुल्यांकन', 'prabhidik-mulyankan', 'Mdl_prabhidik_mulyankan', 'others/prabhidik_mulyankan/', 1),
(38, 9, 'आर्थिक सहायता', 'arthik-saheta', 'Mdl_arthik_saheta', 'others/arthik_saheta/', 1),
(39, 7, 'घर पाताल भएको', 'ghar-patala', 'Mdl_ghar_patala', 'others/ghar_patala/', 1),
(40, 8, 'कक्षा कोठा थप', 'add-classroom', 'Mdl_add_classroom', 'others/add_classroom/', 1),
(41, 7, 'अपाङ्ग प्रमाणपत्र', 'apanga-pramanpatra', 'Mdl_apanga_pramanpatra', 'others/apanga_pramanpatra/', 1),
(42, 6, 'मृत्यु दर्ता', 'mirtyu-darta', 'Mdl_mirtyu_darta', 'others/mirtyu_darta/', 1),
(43, 4, 'व्यवसाय दर्ता सिफारिस', 'bebasaya-sifaris', 'Mdl_bebasaya_sifaris', 'business/bebasaya_sifaris/', 1),
(44, 1, 'नागरिकता सिफारिस\r\n', 'citizenship-sifaris', 'Mdl_certificate_pratilipi', 'certificate/create_citizenship_sifaris/', 1),
(50, 10, 'Birth Certificate', 'birth-certificate', 'Mdl_birth-certificate', 'birth-certificate', 1),
(51, 10, 'Relationship', 'relationship', 'Mdl_relationship', 'relationship', 1),
(52, 10, 'Address Verification English', 'address-verification-en', 'Mdl_address_verification', 'address-verification-en', 1),
(53, 10, 'Tax Clearence', 'tax-clearance-en', 'Mdl_tax-clearance-en', 'tax-clearance-en', 1),
(54, 10, 'Annual Income Verification', 'annual-income-en', 'Mdl_annual-income-en', 'annual-income-en', 1),
(55, 10, 'Property Verification', 'annual-income-enproperty-valuation-en', 'Mdl_property-valuation-en', 'property-valuation-en', 1),
(56, 10, 'Name Verification', 'name-verification-en', 'Mdl_name-verification-en', 'name-verification-en', 1),
(57, 10, 'Unmarried Verification', 'unmarried-en', 'Mdl_unmarried-en', 'unmarried-en', 1),
(58, 10, 'Married Verification', 'married-en', 'Mdl_married-en', 'married-en', 1),
(61, 12, 'नेपाली', 'letter-form', 'Mdl_letter_form', 'letter-form', 1),
(62, 12, 'English', 'letter-form-eng', 'Mdl_letter_form-eng', 'letter-form-eng', 1),
(63, 13, 'स्थायी नियुक्ति पत्र', 'sthai-niyukti', 'Mdl_sthai_niyukti', 'sthai_niyukti', 1),
(64, 13, 'सवारी पास', 'sawari-pass', 'Mdl_sawari_pass', 'sawari_pass', 1),
(65, 13, 'आयश्रोत प्रमाणित गरिएको', 'salary-verify', 'Mdl_salary_verify', 'salary_verify', 1),
(66, 13, 'स्तर वृद्धि सम्वन्धमा', 'upgrade-position', 'Mdl_upgrade_position', 'upgrade_position', 1),
(67, 13, 'पदस्थापन तथा हाजिर', 'hajiri', 'Mdl_hajiri', 'hajiri', 1),
(68, 13, 'कामकाज गर्न खटाईएको', 'kaam-kaz', 'Mdl_kaam_kaz', 'kaam_kaz', 1),
(69, 13, 'सेवा करार नियुक्ति', 'karar-niyukti', 'Mdl_karar_niyukti', 'karar-niyukti', 1),
(70, 13, 'विवरण प्रमाणित', 'approve-wiwaran', 'Mdl_approve_wiwaran', 'approve-wiwaran/', 1),
(71, 13, 'सिफारिस सम्बन्धमा ।', 'uri-0194268375', '', '', 1),
(72, 11, 'सिफारिस सम्बन्धमा ।', 'uri-9821534670', '', '', 1),
(73, 12, 'सिफारिस सम्बन्धमा।', 'uri-0846329517', '', '', 1),
(74, 11, 'कर चुक्ता सम्बन्धमा।', 'uri-4128593670', '', '', 1),
(75, 5, 'सिफारिस', 'uri-6348915720', '', '', 1),
(76, 9, 'कर दाखिला सम्बन्धमा', 'uri-0528374916', '', '', 1),
(77, 3, 'चार किल्ला प्रमाणित', 'uri-4830912675', '', '', 1),
(78, 3, 'घरबाटो प्रमाणित।', 'uri-7581326049', '', '', 1),
(79, 11, 'कर दाखिला सम्बन्धमा', 'uri-2137058964', '', '', 1),
(80, 10, 'Occupation', 'uri-2048195763', '', '', 1),
(81, 12, 'सिफारीस गरीएकाे सम्वन्धमा', 'uri-6894523701', '', '', 1),
(82, 12, 'नविकरण सम्बन्धमा ।', 'uri-8901534726', '', '', 1),
(83, 12, 'नविकरण सम्बन्धमा ।', 'uri-0824931567', '', '', 1),
(84, 12, 'नविकरण सम्बन्धमा ।', 'uri-9516348027', '', '', 1),
(85, 11, 'आम्दानी प्रमाणित सम्बन्धमा ।', 'uri-2346907518', '', '', 1),
(86, 11, 'आम्दानी प्रमाणित सम्बन्धमा ।', 'uri-0671589342', '', '', 1),
(87, 3, 'घरबाटो सिफारिस।', 'uri-4920783165', '', '', 1),
(88, 11, 'सम्पति मूल्याङ्कन सिफारिस ।', 'uri-4296817503', '', '', 1),
(89, 12, 'आन्तरिक आम्दानी वैङ्क दाखिला गरिएको बारेमा ।', 'uri-9618730452', '', '', 1),
(90, 11, 'घटना दर्ता टिप्पणी सिफारिस', 'uri-9453162087', '', '', 1),
(91, 12, 'आम्दानी प्रमाणित सम्बन्धमा', 'uri-1256409873', '', '', 1),
(92, 12, 'आम्दानी प्रमाणित सम्बन्धमा', 'uri-7215096384', '', '', 1),
(93, 3, 'घरबाटो सिफारिस सम्बन्धमा ।', 'uri-3908527461', '', '', 1),
(94, 11, 'नाता प्रमाणित', 'uri-8763195042', '', '', 1),
(95, 11, 'नाता प्रमाणित', 'uri-8047163259', '', '', 1),
(96, 11, 'चार किल्ला प्रमाणित सम्बन्धमा', 'uri-4507231896', '', '', 1),
(97, 11, 'घर बाटो प्रमाणीत', 'uri-7591260348', '', '', 1),
(98, 3, 'स्थानिय मुल्याङन सिफारिस सम्बन्धमा', 'uri-3096217854', '', '', 1),
(99, 11, 'जन्ममिति प्रमाणित', 'uri-0713842659', '', '', 1),
(100, 11, 'कृषि समूह नविकरण', 'uri-1026473895', '', '', 1),
(101, 11, 'व्यवसाय नविकरण सम्बन्धमा', 'uri-2068954371', '', '', 1),
(102, 11, 'Birth Certificate', 'uri-8341679205', '', '', 1),
(103, 11, 'Aanual income ', 'uri-5103728469', '', '', 1),
(104, 4, 'उद्योग दर्ता सिफारिस', 'uri-9406352187', '', '', 1),
(105, 11, 'व्यवसाय दर्ता सम्बन्धमा', 'uri-1409827653', '', '', 1),
(106, 11, 'फरक फरक थर प्रमाणित', 'uri-8649702135', '', '', 1),
(107, 11, 'जनजाति प्रमाणित सिफारिस', 'uri-3054172869', '', '', 1),
(108, 11, 'जग्गा नामसारी सम्बन्धि सिफारिस', 'uri-0761359842', '', '', 1),
(109, 11, 'अविवाहित प्रमाणित सिफारिस', 'uri-7129346508', '', '', 1),
(110, 11, 'मोही लगत कट्टा सिफारिस', 'uri-9631054287', '', '', 1),
(111, 12, 'सिफारिस सम्बन्धमा', 'uri-2095164738', '', '', 1),
(112, 2, 'घर नक्सा पास सम्बन्धमा ।', 'uri-9657210438', '', '', 1),
(113, 12, 'योजना सम्झौता बारे ।', 'uri-2174809536', '', '', 1),
(114, 12, 'योजना सम्झौता बारे ।', 'uri-2059143678', '', '', 1),
(115, 12, 'योजना सम्झौता बारे ।', 'uri-4379215860', '', '', 1),
(116, 12, 'योजना सम्झौता बारे ।', 'uri-8134579260', '', '', 1),
(117, 7, 'योजना सम्झौता बारे ।', 'uri-9867024513', '', '', 1),
(118, 11, 'फरक नाम प्रमाणित', 'uri-4310785629', '', '', 1),
(119, 12, 'फरक फरक नाम थर प्रमाणित', 'uri-5184729306', '', '', 1),
(120, 12, 'Verification of National Coat of Arms', 'uri-2347609851', '', '', 1),
(121, 12, 'जनजाती प्रमाणित सिफारिस ', 'uri-3719608542', '', '', 1),
(122, 13, 'सिफारिस सम्बन्धमा ।', 'uri-7893051246', '', '', 1),
(123, 12, 'जग्गा एकिकृत जग्गा', 'uri-2016973854', '', '', 1),
(124, 12, 'जग्गा धनी प्रतिलिपी', 'uri-2968540317', '', '', 1),
(125, 9, 'आम्दानी प्रमाणित सम्बन्धमा।', 'uri-4723098615', '', '', 1),
(126, 11, 'आन्तरिक आम्दानी बैंक दाखिल गरिएको बारे', 'uri-9851724360', '', '', 1),
(127, 12, 'फरक फरक जन्म मिति प्रमाणित ', 'uri-0743582196', '', '', 1),
(128, 3, 'जग्गा नामसारी सम्बन्धि सिफारिस', 'uri-3197286540', '', '', 1),
(129, 10, 'About keeping the phone number for contact', 'uri-7431268095', '', '', 1),
(130, 12, 'सिफारिस सम्बन्धमा ।', 'uri-9126437508', '', '', 1),
(131, 11, 'विद्युत महसुल भुक्तानी माग सम्बन्धमा ।', 'uri-8190364275', '', '', 1),
(132, 12, 'सिफारिस सम्बन्धान', 'uri-4190762538', '', '', 1),
(133, 7, 'योजना सम्झौता बारे ।', 'uri-1065289374', '', '', 1),
(134, 13, 'जनजाती सिफारिस सम्बन्धमा।', 'uri-5071932684', '', '', 1),
(135, 13, 'जनजाती सिफारिस सम्बन्धमा।', 'uri-4136290578', '', '', 1),
(136, 12, 'पारिवारिक विवरण', 'uri-1056938247', '', '', 1),
(137, 12, 'सिफारिस सम्बन्धमा ।', 'uri-1602483957', '', '', 1),
(138, 12, 'योजना माग सिफारिस', 'uri-5409318726', '', '', 1),
(139, 11, 'भुकम्प किस्ता सिफारिस सम्बन्धमा । ', 'uri-1724986530', '', '', 1),
(140, 3, 'जग्गाधनी लालपूर्जा प्रतिलिपि', 'uri-3821067945', '', '', 1),
(141, 12, 'सिफारिस सम्बन्धमा ।', 'uri-9613528704', '', '', 1),
(142, 12, 'योजना सम्झौता सम्बन्धमा ।', 'uri-3972016854', '', '', 1),
(143, 13, 'पसल दर्ता सिफारिस सम्बन्धमा ।', 'uri-3645170289', '', '', 1),
(144, 11, 'डिपीआर तयार गर्ने सम्बन्धमा', 'uri-9137605482', '', '', 1),
(145, 12, 'आर्थिक सहायता सम्बन्धमा ।', 'uri-5296340781', '', '', 1),
(146, 4, 'पसल नवीकरण सम्बन्धमा', 'uri-6379014285', '', '', 1),
(147, 12, 'सिफारिस सम्बन्धमा ।', 'uri-9150273648', '', '', 1),
(148, 12, 'शेयर रकम नामसारी गरिदिने बारे', 'uri-6792430518', '', '', 1),
(149, 12, 'शेयर रकम नामसारी गरिदिने बारे', 'uri-5031927486', '', '', 1),
(150, 12, 'शेयर रकम नामसारी गरिदिने बारे', 'uri-9315842076', '', '', 1),
(151, 4, 'कृषक समूह नवीकरण सम्बन्धमा', 'uri-7135409682', '', '', 1),
(152, 9, 'शिर्षकगत आवधिक आय संकलन विवरण पेश सम्बन्धमा।', 'uri-2049568371', '', '', 1),
(153, 9, 'शिर्षकगत आवधिक आय संकलन विवरण पेश सम्बन्धमा।', 'uri-7621384590', '', '', 1),
(154, 12, 'मुहान दर्ता सिफारिस सम्बन्धमा ।', 'uri-0835274196', '', '', 1),
(155, 11, 'जन्म प्रमाणित सम्बन्धमा', 'uri-2194375608', '', '', 1),
(156, 12, 'श्री कृष्ण साना किसान सहकारी संस्था लि।       अम्बोटे धादिङ ।', 'uri-1425378069', '', '', 1),
(157, 11, 'विद्युत मिटर जडान सिफारिस', 'uri-5801972643', '', '', 1),
(158, 4, 'कृषि/व्यवसाय नवीकरण सम्बन्धमा ।', 'uri-0915628473', '', '', 1),
(159, 12, 'पारिवारिक विवरण', 'uri-9637541280', '', '', 1),
(160, 12, 'योजना फरफारक सम्बन्धमा ', 'uri-0578324691', '', '', 1),
(161, 9, 'बैठक भत्ता निकासा सम्बन्धमा ।', 'uri-6589714203', '', '', 1),
(162, 3, 'जग्गा नामसारी सिफारिस', 'uri-6578249310', '', '', 1),
(163, 3, 'जग्गा नामसारी सिफारिस', 'uri-6529138407', '', '', 1),
(164, 3, 'स्थानिय जग्गा मुल्याङ्कन सम्बन्धमा।', 'uri-6932740185', '', '', 1),
(165, 3, 'जग्गा मुल्याङकन सम्बन्धमा ।', 'uri-3781946025', '', '', 1),
(166, 3, 'जग्गा मुल्याङकन सम्बन्धमा ।', 'uri-4096217385', '', '', 1),
(167, 3, 'जग्गा मुल्याङ्कन सम्बन्धमा ।', 'uri-3769185042', '', '', 1),
(168, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-6392154870', '', '', 1),
(169, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-1059734826', '', '', 1),
(170, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-0581426793', '', '', 1),
(171, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-9473521806', '', '', 1),
(172, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-7195423806', '', '', 1),
(173, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-7025693814', '', '', 1),
(174, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-1902358764', '', '', 1),
(175, 12, 'छात्रवृत्ति सम्बन्धमा ।', 'uri-6038157492', '', '', 1),
(176, 10, 'Digital Documents', 'uri-2136754809', '', '', 1),
(177, 10, 'VERIFICATION OF NO TAX FILING REQUIREMENT', 'uri-7312580946', '', '', 1),
(178, 10, 'Verification Of Fiscal Year', 'uri-2539871064', '', '', 1),
(179, 10, 'Emblem Clarification', 'uri-4173085629', '', '', 1),
(180, 10, 'Caste Verification certificate', 'uri-9368051274', '', '', 1),
(181, 9, 'विद्युत महसुल बुझाईएको सम्बन्धमा ', 'uri-8917326045', '', '', 1),
(182, 11, 'विद्युत महसुल बुझाईएको सम्बन्धमा ', 'uri-8473926105', '', '', 1),
(183, 6, 'जनजाति प्रमाणित सिफारिस', 'uri-6127935408', '', '', 1),
(184, 4, 'रासायनिक मल बिक्रेता प्रमाण-*पत्र नवीकरण सिफारिस', 'uri-1496357280', '', '', 1),
(185, 4, 'कृषक समूह नवीकरण सम्बन्धमा', 'uri-9415602837', '', '', 1),
(186, 4, 'कृषि फर्म नवीकरण सम्बन्धमा', 'uri-9841503267', '', '', 1),
(187, 7, 'योजना माग सम्बन्धमा', 'uri-1790835426', '', '', 1),
(188, 6, 'जनजाति प्रमाणित सिफारिस', 'uri-2659718340', '', '', 1),
(189, 10, 'Character Certificate', 'uri-3217658904', '', '', 1),
(190, 10, 'justification of email address', 'uri-6270139584', '', '', 1),
(191, 11, 'उपचार गर्ने सिफारिस', 'uri-7015984623', '', '', 1),
(192, 11, 'कृषक समूह नविकरण गर्ने सिफारिस', 'uri-8039742165', '', '', 1),
(193, 4, 'सिफारिस सम्बन्धमा', 'uri-2734685901', '', '', 1),
(194, 10, 'Verification of agriculture', 'uri-1807439526', '', '', 1),
(195, 10, 'Job verification', 'uri-8642709135', '', '', 1),
(196, 6, 'नाता प्रमाणित सम्बन्धमा ।', 'uri-8267135409', '', '', 1),
(197, 13, 'बैंक खाता सञ्‍चालन सिफारिस ', 'uri-7695124803', '', '', 1),
(198, 7, 'योजना सम्झौता सिफारिस सम्बन्धमा', 'uri-5192640378', '', '', 1),
(199, 13, 'बैंक खाता सञ्‍चालन सिफारिस ', 'uri-3128965470', '', '', 1),
(200, 11, 'सुचना', 'uri-3250847691', '', '', 1),
(201, 11, 'सूचना', 'uri-9517024863', '', '', 1),
(202, 11, 'योजना माग सम्बन्धमा ।', 'uri-0536821794', '', '', 1),
(203, 12, 'सा', 'uri-0421689735', '', '', 1),
(204, 12, 'सा', 'uri-2908745631', '', '', 1),
(205, 6, 'परिवारीक सिफारिस सम्वन्धमा', 'uri-7195823460', '', '', 1),
(206, 7, 'रकम भुक्तानी गरीदिने सम्वन्धमा।', 'uri-9268014357', '', '', 1),
(207, 9, 'रकम भुक्तानी गरीदिने सम्वन्धमा।', 'uri-4390581267', '', '', 1),
(208, 6, 'दलित सिफारिस सम्बन्धमा', 'uri-3052718469', '', '', 1),
(209, 6, 'अपाङ्ग परिचय पत्र उपलब्ध गराईदिने सम्वन्धमा।', 'uri-7840952136', '', '', 1),
(210, 13, 'जिम्मेवारी सम्वन्धमा।', 'uri-8495073612', '', '', 1),
(211, 13, 'जानकारी सम्वन्धमा।', 'uri-0635841972', '', '', 1),
(212, 4, 'विद्युत मिटर जडान सिफारिस', 'uri-3614897250', '', '', 1),
(213, 12, 'आबश्यक सिफारिस उपलब्ध गराईदिने सम्बन्धमा।', 'uri-0965873124', '', '', 1),
(214, 3, 'घरबाटो प्रमाणित सिफारिस', 'uri-9201473658', '', '', 1),
(215, 3, 'घरबाटो प्रमाणित सिफारिस', 'uri-2610387945', '', '', 1),
(216, 4, 'योजना नबिकरण गरिदिने सम्वन्धमा।', 'uri-2941560837', '', '', 1),
(217, 9, 'सामाजिक सुरक्षा भत्ता रकम भुक्तानी गरिदिने सम्वन्धमा।', 'uri-0647185932', '', '', 1),
(218, 6, 'आर्थिक अवस्था कमजोर सिफारिस', 'uri-9068147325', '', '', 1),
(219, 4, 'कार्यक्रम उपलब्ध गराईदिने सम्वन्धमा।', 'uri-6709452831', '', '', 1),
(220, 11, 'दर भाउ उपलब्ध गराउने सम्बन्धमा।', 'uri-2739658401', '', '', 1),
(221, 12, 'जन्म मिति प्रमाणित सम्बन्धमा', 'uri-0915762438', '', '', 1),
(222, 3, 'जग्गा दर्ता सम्वन्धमा।', 'uri-0269731485', '', '', 1),
(223, 4, 'नयाँ व्यवसाय दर्ता सिफारिस', 'uri-9810726354', '', '', 1),
(224, 7, 'बैंक खाता सञ्‍चालन सिफारिस ', 'uri-9713846250', '', '', 1),
(225, 11, 'जानकारी सम्वन्धमा ।', 'uri-1980264735', '', '', 1),
(226, 13, 'हाजिरी बिवरण पठाईएको सम्वन्धमा।', 'uri-2507489316', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings_post`
--

CREATE TABLE IF NOT EXISTS `settings_post` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL,
  `designation` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_post`
--

INSERT INTO `settings_post` (`id`, `name`, `designation`) VALUES
(1, 'अध्यक्ष', 'Chairman'),
(2, 'उपाध्यक्ष', 'Asst. Chairman'),
(3, 'वडा अध्यक्ष', 'Ward Chairman'),
(4, 'सचिव', 'Ward Secretary'),
(5, 'शाखा अधिकृत', 'Section Officer'),
(6, 'सूचना तथा संचार प्रविधि अधिकृत', 'IT Officer'),
(7, 'सहायक कम्प्युटर अपरेटर ', 'Asst. computer Operator ');

-- --------------------------------------------------------

--
-- Table structure for table `settings_relation`
--

CREATE TABLE IF NOT EXISTS `settings_relation` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `english_name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_relation`
--

INSERT INTO `settings_relation` (`id`, `name`, `english_name`) VALUES
(1, 'छोरा', 'Son'),
(2, 'छोरी', 'Daughter'),
(3, 'पत्नी', 'Wife'),
(4, 'बुवा', 'Father'),
(5, 'दाजु', 'Brother'),
(6, 'आमा', 'Mother'),
(8, 'भाई', 'Brother'),
(9, 'बाजे', 'Grandfather'),
(10, 'नाती', 'Grandson'),
(11, 'बहिनी', 'Sister'),
(12, 'काका ', 'Uncle'),
(13, 'भतिजा', 'Nephew'),
(14, 'पति', 'Husband'),
(15, 'दिदी', 'Sister'),
(17, 'श्रीमान्', 'Husband'),
(18, 'श्रीमती', 'Wife'),
(19, 'काकी', 'Aunt'),
(20, 'भतिजी', 'Niece'),
(21, 'नातिनी', 'Granddaughter'),
(22, 'बुहारी', 'Daughter in law'),
(26, 'भाउजु', 'Sister in law'),
(28, 'आफै‍ं', 'Self'),
(29, 'ज्वाई', 'Son in law'),
(30, 'भेनाजु', 'Brother in law'),
(31, 'ससुरा', 'Father-in-law'),
(32, 'सासु', 'mother-in-law');

-- --------------------------------------------------------

--
-- Table structure for table `settings_road_type`
--

CREATE TABLE IF NOT EXISTS `settings_road_type` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_road_type`
--

INSERT INTO `settings_road_type` (`id`, `name`) VALUES
(1, 'कालो पत्रे सडक'),
(2, 'कच्ची सडक'),
(3, 'ग्राभेल सडक'),
(4, 'कच्ची तथा ग्राभेल सडक'),
(5, 'गोरेटो बाटो');

-- --------------------------------------------------------

--
-- Table structure for table `settings_service`
--

CREATE TABLE IF NOT EXISTS `settings_service` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_service`
--

INSERT INTO `settings_service` (`id`, `name`) VALUES
(1, 'निर्माण सम्बन्धि'),
(2, 'कम्पुटर सफ्टवेयर'),
(3, 'कम्प्युटर, प्रिन्टर, यु.पि.एस. सामानहरू'),
(4, 'कम्प्युटर, इलेकट्रोनिक्स सामानहरू'),
(5, 'कम्युनिकेशन एण्ड डिजाइन'),
(6, 'कम्प्युटर मर्मत सम्बन्धी कार्य'),
(7, 'हार्डवेयर तथा सफ्टवेयर सम्बन्धी कार्य'),
(8, 'टेलिभिजन कार्यक्रम निर्माण तथा प्रसारण'),
(9, 'श्रव्य दृश्य सामाग्री निर्माण तया प्रसारण'),
(10, 'छपाइ सम्बन्धी कार्य'),
(11, 'डोजरको पार्टपूर्र');

-- --------------------------------------------------------

--
-- Table structure for table `settings_session`
--

CREATE TABLE IF NOT EXISTS `settings_session` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `is_current` tinyint(1) NOT NULL,
  `department` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_session`
--

INSERT INTO `settings_session` (`id`, `name`, `is_current`, `department`) VALUES
(3, '2078/79', 0, NULL),
(4, '2079/80', 0, NULL),
(5, '२०८०/०८१', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `settings_state`
--

CREATE TABLE IF NOT EXISTS `settings_state` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `english_name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_state`
--

INSERT INTO `settings_state` (`id`, `name`, `english_name`) VALUES
(1, 'कोशी प्रदेश', 'Koshi Province'),
(2, 'मधेश प्रदेश', 'Madhesh Province'),
(3, 'बागमती प्रदेश', 'Bagmati Province'),
(4, 'गण्डकी प्रदेश', 'Gandaki Province'),
(5, 'लुम्बिनी प्रदेश', 'Lumibini Province'),
(6, 'कर्णाली प्रदेश', 'Karnali Province'),
(7, 'सुदुरपश्चिम प्रदेश', 'Sudurpashchim Province');

-- --------------------------------------------------------

--
-- Table structure for table `settings_vdc_municipality`
--

CREATE TABLE IF NOT EXISTS `settings_vdc_municipality` (
  `id` int(11) NOT NULL,
  `name` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `district_id` int(11) NOT NULL,
  `type` text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `settings_vdc_municipality`
--

INSERT INTO `settings_vdc_municipality` (`id`, `name`, `district_id`, `type`) VALUES
(2191, 'फुङलिङ नगरपालिका', 481, 'नगरपालिका'),
(2192, 'आठराई त्रिवेणी गाउँपालिका', 481, 'गाउँपालिका'),
(2193, 'सिदिङ्वा गाउँपालिका', 481, 'गाउँपालिका'),
(2194, 'फक्ताङलुङ गाउँपालिका', 481, 'गाउँपालिका'),
(2195, 'मिक्वाखोला गाउँपालिका', 481, 'गाउँपालिका'),
(2196, 'मेरिङदेन गाउँपालिका', 481, 'गाउँपालिका'),
(2197, 'मैवाखोला गाउँपालिका', 481, 'गाउँपालिका'),
(2198, 'याङवरक गाउँपालिका', 481, 'गाउँपालिका'),
(2199, 'सिरीजङ्घा गाउँपालिका', 481, 'गाउँपालिका'),
(2200, 'फिदिम नगरपालिका', 482, 'नगरपालिका'),
(2201, 'फालेलुंग गाउँपालिका', 482, 'गाउँपालिका'),
(2202, 'फाल्गुनन्द गाउँपालिका', 482, 'गाउँपालिका'),
(2203, 'हिलिहाङ गाउँपालिका', 482, 'गाउँपालिका'),
(2204, 'कुम्मायक गाउँपालिका', 482, 'गाउँपालिका'),
(2205, 'मिक्लाजुङ गाउँपालिका', 482, 'गाउँपालिका'),
(2206, 'तुम्बेवा गाउँपालिका', 482, 'गाउँपालिका'),
(2207, 'याङवरक गाउँपालिका', 482, 'गाउँपालिका'),
(2208, 'ईलाम नगरपालिका', 483, 'नगरपालिका'),
(2209, 'देउमाई नगरपालिका', 483, 'नगरपालिका'),
(2210, 'माई नगरपालिका', 483, 'नगरपालिका'),
(2211, 'सूर्योदय नगरपालिका', 483, 'नगरपालिका'),
(2212, 'फाकफोकथुम गाउँपालिका', 483, 'गाउँपालिका'),
(2213, 'चुलाचुली गाउँपालिका', 483, 'गाउँपालिका'),
(2214, 'माईजोगमाई गाउँपालिका', 483, 'गाउँपालिका'),
(2215, 'माङसेबुङ गाउँपालिका', 483, 'गाउँपालिका'),
(2216, 'रोङ गाउँपालिका', 483, 'गाउँपालिका'),
(2217, 'सन्दकपुर गाउँपालिका', 483, 'गाउँपालिका'),
(2218, 'मेचीनगर नगरपालिका', 484, 'नगरपालिका'),
(2219, 'दमक नगरपालिका', 484, 'नगरपालिका'),
(2220, 'कन्काई नगरपालिका', 484, 'नगरपालिका'),
(2221, 'भद्रपुर नगरपालिका', 484, 'नगरपालिका'),
(2222, 'अर्जुनधारा नगरपालिका', 484, 'नगरपालिका'),
(2223, 'शिवशताक्षी नगरपालिका', 484, 'नगरपालिका'),
(2224, 'गौरादह नगरपालिका', 484, 'नगरपालिका'),
(2225, 'विर्तामोड नगरपालिका', 484, 'नगरपालिका'),
(2226, 'कमल गाउँपालिका', 484, 'गाउँपालिका'),
(2227, 'गौरीगंज गाउँपालिका', 484, 'गाउँपालिका'),
(2228, 'बाह्रदशी गाउँपालिका', 484, 'गाउँपालिका'),
(2229, 'झापा गाउँपालिका', 484, 'गाउँपालिका'),
(2230, 'बुद्धशान्ति गाउँपालिका', 484, 'गाउँपालिका'),
(2231, 'हल्दिवारी गाउँपालिका', 484, 'गाउँपालिका'),
(2232, 'कचनकवल गाउँपालिका', 484, 'गाउँपालिका'),
(2233, 'विराटनगर महानगरपालिका', 485, 'महानगरपालिका'),
(2234, 'बेलवारी नगरपालिका', 485, 'नगरपालिका'),
(2235, 'लेटाङ नगरपालिका', 485, 'नगरपालिका'),
(2236, 'पथरी शनिश्चरे नगरपालिका', 485, 'नगरपालिका'),
(2237, 'रंगेली नगरपालिका', 485, 'नगरपालिका'),
(2238, 'रतुवामाई नगरपालिका', 485, 'नगरपालिका'),
(2239, 'सुनवर्षि नगरपालिका', 485, 'नगरपालिका'),
(2240, 'उर्लावारी नगरपालिका', 485, 'नगरपालिका'),
(2241, 'सुन्दरहरैचा नगरपालिका', 485, 'नगरपालिका'),
(2242, 'बुढीगंगा गाउँपालिका', 485, 'गाउँपालिका'),
(2243, 'धनपालथान गाउँपालिका', 485, 'गाउँपालिका'),
(2244, 'ग्रामथान गाउँपालिका', 485, 'गाउँपालिका'),
(2245, 'जहदा गाउँपालिका', 485, 'गाउँपालिका'),
(2246, 'कानेपोखरी गाउँपालिका', 485, 'गाउँपालिका'),
(2247, 'कटहरी गाउँपालिका', 485, 'गाउँपालिका'),
(2248, 'केरावारी गाउँपालिका', 485, 'गाउँपालिका'),
(2249, 'मिक्लाजुङ गाउँपालिका', 485, 'गाउँपालिका'),
(2250, 'ईटहरी उपमहानगरपालिका', 486, 'उपमहानगरपालिका'),
(2251, 'धरान उपमहानगरपालिका', 486, 'उपमहानगरपालिका'),
(2252, 'ईनरुवा नगरपालिका', 486, 'नगरपालिका'),
(2253, 'दुहवी नगरपालिका', 486, 'नगरपालिका'),
(2254, 'रामधुनी नगरपालिका', 486, 'नगरपालिका'),
(2255, 'बराह नगरपालिका', 486, 'नगरपालिका'),
(2256, 'देवानगञ्ज गाउँपालिका', 486, 'गाउँपालिका'),
(2257, 'कोशी गाउँपालिका', 486, 'गाउँपालिका'),
(2258, 'गढी गाउँपालिका', 486, 'गाउँपालिका'),
(2259, 'बर्जु गाउँपालिका', 486, 'गाउँपालिका'),
(2260, 'भोक्राहा गाउँपालिका', 486, 'गाउँपालिका'),
(2261, 'हरिनगरा गाउँपालिका', 486, 'गाउँपालिका'),
(2262, 'पाख्रिबास नगरपालिका', 487, 'नगरपालिका'),
(2263, 'धनकुटा नगरपालिका', 487, 'नगरपालिका'),
(2264, 'महालक्ष्मी नगरपालिका', 487, 'नगरपालिका'),
(2265, 'साँगुरीगढी गाउँपालिका', 487, 'गाउँपालिका'),
(2266, 'खाल्सा छिन्ताङ सहिदभूमि गाउँपालिका', 487, 'गाउँपालिका'),
(2267, 'छथर जोरपाटी गाउँपालिका', 487, 'गाउँपालिका'),
(2268, 'चौविसे गाउँपालिका', 487, 'गाउँपालिका'),
(2269, 'म्याङलुङ नगरपालिका', 488, 'नगरपालिका'),
(2270, 'लालीगुराँस नगरपालिका', 488, 'नगरपालिका'),
(2271, 'आठराई गाउँपालिका', 488, 'गाउँपालिका'),
(2272, 'छथर गाउँपालिका', 488, 'गाउँपालिका'),
(2273, 'फेदाप गाउँपालिका', 488, 'गाउँपालिका'),
(2274, 'मेन्छयायेम गाउँपालिका', 488, 'गाउँपालिका'),
(2275, 'चैनपुर नगरपालिका', 489, 'नगरपालिका'),
(2276, 'धर्मदेवी नगरपालिका', 489, 'नगरपालिका'),
(2277, 'खाँदवारी नगरपालिका', 489, 'नगरपालिका'),
(2278, 'मादी नगरपालिका', 489, 'नगरपालिका'),
(2279, 'पाँचखपन नगरपालिका', 489, 'नगरपालिका'),
(2280, 'भोटखोला गाउँपालिका', 489, 'गाउँपालिका'),
(2281, 'चिचिला गाउँपालिका', 489, 'गाउँपालिका'),
(2282, 'मकालु गाउँपालिका', 489, 'गाउँपालिका'),
(2283, 'सभापोखरी गाउँपालिका', 489, 'गाउँपालिका'),
(2284, 'सिलीचोङ गाउँपालिका', 489, 'गाउँपालिका'),
(2285, 'भोजपुर नगरपालिका', 490, 'नगरपालिका'),
(2286, 'षडानन्द नगरपालिका', 490, 'नगरपालिका'),
(2287, 'ट्याम्केमैयुम गाउँपालिका', 490, 'गाउँपालिका'),
(2288, 'रामप्रसाद राई गाउँपालिका', 490, 'गाउँपालिका'),
(2289, 'अरुण गाउँपालिका', 490, 'गाउँपालिका'),
(2290, 'पौवादुङमा गाउँपालिका', 490, 'गाउँपालिका'),
(2291, 'साल्पासिलिछो गाउँपालिका', 490, 'गाउँपालिका'),
(2292, 'आमचोक गाउँपालिका', 490, 'गाउँपालिका'),
(2293, 'हतुवागढी गाउँपालिका', 490, 'गाउँपालिका'),
(2294, 'सोलुदुधकुण्ड नगरपालिका', 491, 'नगरपालिका'),
(2295, 'दुधकोसी गाउँपालिका', 491, 'गाउँपालिका'),
(2296, 'खुम्वु पासाङल्हमु गाउँपालिका', 491, 'गाउँपालिका'),
(2297, 'दुधकौशिका गाउँपालिका', 491, 'गाउँपालिका'),
(2298, 'नेचासल्यान गाउँपालिका', 491, 'गाउँपालिका'),
(2299, 'माहाकुलुङ गाउँपालिका', 491, 'गाउँपालिका'),
(2300, 'लिखु पिके गाउँपालिका', 491, 'गाउँपालिका'),
(2301, 'सोताङ गाउँपालिका', 491, 'गाउँपालिका'),
(2302, 'सिद्दिचरण नगरपालिका', 492, 'नगरपालिका'),
(2303, 'खिजिदेम्बा गाउँपालिका', 492, 'गाउँपालिका'),
(2304, 'चम्पादेवी गाउँपालिका', 492, 'गाउँपालिका'),
(2305, 'चिशंखुगढी गाउँपालिका', 492, 'गाउँपालिका'),
(2306, 'मानेभञ्याङ गाउँपालिका', 492, 'गाउँपालिका'),
(2307, 'मोलुङ गाउँपालिका', 492, 'गाउँपालिका'),
(2308, 'लिखु गाउँपालिका', 492, 'गाउँपालिका'),
(2309, 'सुनकोशी गाउँपालिका', 492, 'गाउँपालिका'),
(2310, 'हलेसी तुवाचुङ नगरपालिका', 493, 'नगरपालिका'),
(2311, 'रुपाकोट मझुवागढी नगरपालिका', 493, 'नगरपालिका'),
(2312, 'ऐसेलुखर्क गाउँपालिका', 493, 'गाउँपालिका'),
(2313, 'लामीडाँडा गाउँपालिका', 493, 'गाउँपालिका'),
(2314, 'जन्तेढुंगा गाउँपालिका', 493, 'गाउँपालिका'),
(2315, 'खोटेहाङ गाउँपालिका', 493, 'गाउँपालिका'),
(2316, 'केपिलासगढी गाउँपालिका', 493, 'गाउँपालिका'),
(2317, 'दिप्रुङ गाउँपालिका', 493, 'गाउँपालिका'),
(2318, 'साकेला गाउँपालिका', 493, 'गाउँपालिका'),
(2319, 'वराहपोखरी गाउँपालिका', 493, 'गाउँपालिका'),
(2320, 'कटारी नगरपालिका', 494, 'नगरपालिका'),
(2321, 'चौदण्डीगढी नगरपालिका', 494, 'नगरपालिका'),
(2322, 'त्रियुगा नगरपालिका', 494, 'नगरपालिका'),
(2323, 'वेलका नगरपालिका', 494, 'नगरपालिका'),
(2324, 'उदयपुरगढी गाउँपालिका', 494, 'गाउँपालिका'),
(2325, 'ताप्ली गाउँपालिका', 494, 'गाउँपालिका'),
(2326, 'रौतामाई गाउँपालिका', 494, 'गाउँपालिका'),
(2327, 'सुनकोशी गाउँपालिका', 494, 'गाउँपालिका'),
(2328, 'राजविराज नगरपालिका', 496, 'नगरपालिका'),
(2329, 'कञ्चनरुप नगरपालिका', 496, 'नगरपालिका'),
(2330, 'डाक्नेश्वरी नगरपालिका', 496, 'नगरपालिका'),
(2331, 'बोदेबरसाईन नगरपालिका', 496, 'नगरपालिका'),
(2332, 'खडक नगरपालिका', 496, 'नगरपालिका'),
(2333, 'शम्भुनाथ नगरपालिका', 496, 'नगरपालिका'),
(2334, 'सुरुङ्‍गा नगरपालिका', 496, 'नगरपालिका'),
(2335, 'हनुमाननगर कङ्‌कालिनी नगरपालिका', 496, 'नगरपालिका'),
(2336, 'सप्तकोशी नगरपालिका', 496, 'नगरपालिका'),
(2337, 'अग्निसाइर कृष्णासवरन गाउँपालिका', 496, 'गाउँपालिका'),
(2338, 'छिन्नमस्ता गाउँपालिका', 496, 'गाउँपालिका'),
(2339, 'महादेवा गाउँपालिका', 496, 'गाउँपालिका'),
(2340, 'तिरहुत गाउँपालिका', 496, 'गाउँपालिका'),
(2341, 'तिलाठी कोईलाडी गाउँपालिका', 496, 'गाउँपालिका'),
(2342, 'रुपनी गाउँपालिका', 496, 'गाउँपालिका'),
(2343, 'बेल्ही चपेना गाउँपालिका', 496, 'गाउँपालिका'),
(2344, 'बिष्णुपुर गाउँपालिका', 496, 'गाउँपालिका'),
(2345, 'बलान-बिहुल गाउँपालिका', 496, 'गाउँपालिका'),
(2346, 'लहान नगरपालिका', 497, 'नगरपालिका'),
(2347, 'धनगढीमाई नगरपालिका', 497, 'नगरपालिका'),
(2348, 'सिरहा नगरपालिका', 497, 'नगरपालिका'),
(2349, 'गोलबजार नगरपालिका', 497, 'नगरपालिका'),
(2350, 'मिर्चैयाँ नगरपालिका', 497, 'नगरपालिका'),
(2351, 'कल्याणपुर नगरपालिका', 497, 'नगरपालिका'),
(2352, 'कर्जन्हा नगरपालिका', 497, 'नगरपालिका'),
(2353, 'सुखीपुर नगरपालिका', 497, 'नगरपालिका'),
(2354, 'भगवानपुर गाउँपालिका', 497, 'गाउँपालिका'),
(2355, 'औरही गाउँपालिका', 497, 'गाउँपालिका'),
(2356, 'विष्णुपुर गाउँपालिका', 497, 'गाउँपालिका'),
(2357, 'बरियारपट्टी गाउँपालिका', 497, 'गाउँपालिका'),
(2358, 'लक्ष्मीपुर पतारी गाउँपालिका', 497, 'गाउँपालिका'),
(2359, 'नरहा गाउँपालिका', 497, 'गाउँपालिका'),
(2360, 'सखुवानान्कारकट्टी गाउँपालिका', 497, 'गाउँपालिका'),
(2361, 'अर्नमा गाउँपालिका', 497, 'गाउँपालिका'),
(2362, 'नवराजपुर गाउँपालिका', 497, 'गाउँपालिका'),
(2363, 'जनकपुर उपमहानगरपालिका', 498, 'उपमहानगरपालिका'),
(2364, 'क्षिरेश्वरनाथ नगरपालिका', 498, 'नगरपालिका'),
(2365, 'गणेशमान चारनाथ नगरपालिका', 498, 'नगरपालिका'),
(2366, 'धनुषाधाम नगरपालिका', 498, 'नगरपालिका'),
(2367, 'नगराइन नगरपालिका', 498, 'नगरपालिका'),
(2368, 'विदेह नगरपालिका', 498, 'नगरपालिका'),
(2369, 'मिथिला नगरपालिका', 498, 'नगरपालिका'),
(2370, 'शहीदनगर नगरपालिका', 498, 'नगरपालिका'),
(2371, 'सबैला नगरपालिका', 498, 'नगरपालिका'),
(2372, 'कमला नगरपालिका', 498, 'नगरपालिका'),
(2373, 'मिथिला बिहारी नगरपालिका', 498, 'नगरपालिका'),
(2374, 'हंसपुर नगरपालिका', 498, 'नगरपालिका'),
(2375, 'जनकनन्दिनी गाउँपालिका', 498, 'गाउँपालिका'),
(2376, 'बटेश्वर गाउँपालिका', 498, 'गाउँपालिका'),
(2377, 'मुखियापट्टी मुसहरमिया गाउँपालिका', 498, 'गाउँपालिका'),
(2378, 'लक्ष्मीनिया गाउँपालिका', 498, 'गाउँपालिका'),
(2379, 'औरही गाउँपालिका', 498, 'गाउँपालिका'),
(2380, 'धनौजी गाउँपालिका', 498, 'गाउँपालिका'),
(2381, 'जलेश्वर नगरपालिका', 499, 'नगरपालिका'),
(2382, 'बर्दिबास नगरपालिका', 499, 'नगरपालिका'),
(2383, 'गौशाला नगरपालिका', 499, 'नगरपालिका'),
(2384, 'लोहरपट्टी नगरपालिका', 499, 'नगरपालिका'),
(2385, 'रामगोपालपुर नगरपालिका', 499, 'नगरपालिका'),
(2386, 'मनरा शिसवा नगरपालिका', 499, 'नगरपालिका'),
(2387, 'मटिहानी नगरपालिका', 499, 'नगरपालिका'),
(2388, 'भँगाहा नगरपालिका', 499, 'नगरपालिका'),
(2389, 'बलवा नगरपालिका', 499, 'नगरपालिका'),
(2390, 'औरही नगरपालिका', 499, 'नगरपालिका'),
(2391, 'एकडारा गाउँपालिका', 499, 'गाउँपालिका'),
(2392, 'सोनमा गाउँपालिका', 499, 'गाउँपालिका'),
(2393, 'साम्सी गाउँपालिका', 499, 'गाउँपालिका'),
(2394, 'महोत्तरी गाउँपालिका', 499, 'गाउँपालिका'),
(2395, 'पिपरा गाउँपालिका', 499, 'गाउँपालिका'),
(2396, 'ईश्वरपुर नगरपालिका', 500, 'नगरपालिका'),
(2397, 'मलंगवा नगरपालिका', 500, 'नगरपालिका'),
(2398, 'लालबन्दी नगरपालिका', 500, 'नगरपालिका'),
(2399, 'हरिपुर नगरपालिका', 500, 'नगरपालिका'),
(2400, 'हरिपुर्वा नगरपालिका', 500, 'नगरपालिका'),
(2401, 'हरिवन नगरपालिका', 500, 'नगरपालिका'),
(2402, 'बरहथवा नगरपालिका', 500, 'नगरपालिका'),
(2403, 'बलरा नगरपालिका', 500, 'नगरपालिका'),
(2404, 'गोडैटा नगरपालिका', 500, 'नगरपालिका'),
(2405, 'बागमती नगरपालिका', 500, 'नगरपालिका'),
(2406, 'कविलासी नगरपालिका', 500, 'नगरपालिका'),
(2407, 'चक्रघट्टा गाउँपालिका', 500, 'गाउँपालिका'),
(2408, 'चन्द्रनगर गाउँपालिका', 500, 'गाउँपालिका'),
(2409, 'धनकौल गाउँपालिका', 500, 'गाउँपालिका'),
(2410, 'ब्रह्मपुरी गाउँपालिका', 500, 'गाउँपालिका'),
(2411, 'रामनगर गाउँपालिका', 500, 'गाउँपालिका'),
(2412, 'विष्णु गाउँपालिका', 500, 'गाउँपालिका'),
(2413, 'कौडेना गाउँपालिका', 500, 'गाउँपालिका'),
(2414, 'पर्सा गाउँपालिका', 500, 'गाउँपालिका'),
(2415, 'बसबरीया गाउँपालिका', 500, 'गाउँपालिका'),
(2416, 'चन्द्रपुर नगरपालिका', 501, 'नगरपालिका'),
(2417, 'गरुडा नगरपालिका', 501, 'नगरपालिका'),
(2418, 'गौर नगरपालिका', 501, 'नगरपालिका'),
(2419, 'बौधीमाई नगरपालिका', 501, 'नगरपालिका'),
(2420, 'बृन्दावन नगरपालिका', 501, 'नगरपालिका'),
(2421, 'देवाही गोनाही नगरपालिका', 501, 'नगरपालिका'),
(2422, 'गढीमाई नगरपालिका', 501, 'नगरपालिका'),
(2423, 'गुजरा नगरपालिका', 501, 'नगरपालिका'),
(2424, 'कटहरिया नगरपालिका', 501, 'नगरपालिका'),
(2425, 'माधव नारायण नगरपालिका', 501, 'नगरपालिका'),
(2426, 'मौलापुर नगरपालिका', 501, 'नगरपालिका'),
(2427, 'फतुवाबिजयपुर नगरपालिका', 501, 'नगरपालिका'),
(2428, 'ईशनाथ नगरपालिका', 501, 'नगरपालिका'),
(2429, 'परोहा नगरपालिका', 501, 'नगरपालिका'),
(2430, 'राजपुर नगरपालिका', 501, 'नगरपालिका'),
(2431, 'राजदेवी नगरपालिका', 501, 'नगरपालिका'),
(2432, 'दुर्गा भगवती गाउँपालिका', 501, 'गाउँपालिका'),
(2433, 'यमुनामाई गाउँपालिका', 501, 'गाउँपालिका'),
(2434, 'कलैया उपमहानगरपालिका', 502, 'उपमहानगरपालिका'),
(2435, 'जीतपुर सिमरा उपमहानगरपालिका', 502, 'उपमहानगरपालिका'),
(2436, 'कोल्हवी नगरपालिका', 502, 'नगरपालिका'),
(2437, 'निजगढ नगरपालिका', 502, 'नगरपालिका'),
(2438, 'महागढीमाई नगरपालिका', 502, 'नगरपालिका'),
(2439, 'सिम्रौनगढ नगरपालिका', 502, 'नगरपालिका'),
(2440, 'पचरौता नगरपालिका', 502, 'नगरपालिका'),
(2441, 'आदर्श कोटवाल गाउँपालिका', 502, 'गाउँपालिका'),
(2442, 'करैयामाई गाउँपालिका', 502, 'गाउँपालिका'),
(2443, 'देवताल गाउँपालिका', 502, 'गाउँपालिका'),
(2444, 'परवानीपुर गाउँपालिका', 502, 'गाउँपालिका'),
(2445, 'प्रसौनी गाउँपालिका', 502, 'गाउँपालिका'),
(2446, 'फेटा गाउँपालिका', 502, 'गाउँपालिका'),
(2447, 'बारागढीगाउँपालिका', 502, 'गाउँपालिका'),
(2448, 'सुवर्ण गाउँपालिका', 502, 'गाउँपालिका'),
(2449, 'विश्रामपुर गाउँपालिका', 502, 'गाउँपालिका'),
(2450, 'बिरगंज महानगरपालिका', 503, 'महानगरपालिका'),
(2451, 'पोखरिया नगरपालिका', 503, 'नगरपालिका'),
(2452, 'बहुदरमाई नगरपालिका', 503, 'नगरपालिका'),
(2453, 'पर्सागढी नगरपालिका', 503, 'नगरपालिका'),
(2454, 'ठोरी गाउँपालिका', 503, 'गाउँपालिका'),
(2455, 'जगरनाथपुर गाउँपालिका', 503, 'गाउँपालिका'),
(2456, 'धोबीनी गाउँपालिका', 503, 'गाउँपालिका'),
(2457, 'छिपहरमाई गाउँपालिका', 503, 'गाउँपालिका'),
(2458, 'पकाहा मैनपुर गाउँपालिका', 503, 'गाउँपालिका'),
(2459, 'बिन्दबासिनी गाउँपालिका', 503, 'गाउँपालिका'),
(2460, 'सखुवा प्रसौनी गाउँपालिका', 503, 'गाउँपालिका'),
(2461, 'पटेर्वा सुगौली गाउँपालिका', 503, 'गाउँपालिका'),
(2462, 'कालिकामाई गाउँपालिका', 503, 'गाउँपालिका'),
(2463, 'जिरा भवानी गाउँपालिका', 503, 'गाउँपालिका'),
(2464, 'कमलामाई नगरपालिका', 504, 'नगरपालिका'),
(2465, 'दुधौली नगरपालिका', 504, 'नगरपालिका'),
(2466, 'गोलन्जर गाउँपालिका', 504, 'गाउँपालिका'),
(2467, 'घ्याङलेख गाउँपालिका', 504, 'गाउँपालिका'),
(2468, 'तीनपाटन गाउँपालिका', 504, 'गाउँपालिका'),
(2469, 'फिक्कल गाउँपालिका', 504, 'गाउँपालिका'),
(2470, 'मरिण गाउँपालिका', 504, 'गाउँपालिका'),
(2471, 'सुनकोशी गाउँपालिका', 504, 'गाउँपालिका'),
(2472, 'हरिहरपुरगढी गाउँपालिका', 504, 'गाउँपालिका'),
(2473, 'मन्थली नगरपालिका', 505, 'नगरपालिका'),
(2474, 'रामेछाप नगरपालिका', 505, 'नगरपालिका'),
(2475, 'उमाकुण्ड गाउँपालिका', 505, 'गाउँपालिका'),
(2476, 'खाँडादेवी गाउँपालिका', 505, 'गाउँपालिका'),
(2477, 'गोकुलगङ्गा गाउँपालिका', 505, 'गाउँपालिका'),
(2478, 'दोरम्बा गाउँपालिका', 505, 'गाउँपालिका'),
(2479, 'लिखु गाउँपालिका', 505, 'गाउँपालिका'),
(2480, 'सुनापती गाउँपालिका', 505, 'गाउँपालिका'),
(2481, 'जिरी नगरपालिका', 506, 'नगरपालिका'),
(2482, 'भिमेश्वर नगरपालिका', 506, 'नगरपालिका'),
(2483, 'कालिन्चोक गाउँपालिका', 506, 'गाउँपालिका'),
(2484, 'गौरीशङ्कर गाउँपालिका', 506, 'गाउँपालिका'),
(2485, 'तामाकोशी गाउँपालिका', 506, 'गाउँपालिका'),
(2486, 'मेलुङ्ग गाउँपालिका', 506, 'गाउँपालिका'),
(2487, 'विगु गाउँपालिका', 506, 'गाउँपालिका'),
(2488, 'वैतेश्वर गाउँपालिका', 506, 'गाउँपालिका'),
(2489, 'शैलुङ्ग गाउँपालिका', 506, 'गाउँपालिका'),
(2490, 'चौतारा साँगाचोकगढी नगरपालिका', 507, 'नगरपालिका'),
(2491, 'बाह्रविसे नगरपालिका', 507, 'नगरपालिका'),
(2492, 'मेलम्ची नगरपालिका', 507, 'नगरपालिका'),
(2493, 'ईन्द्रावती गाउँपालिका', 507, 'गाउँपालिका'),
(2494, 'जुगल गाउँपालिका', 507, 'गाउँपालिका'),
(2495, 'पाँचपोखरी थाङपाल गाउँपालिका', 507, 'गाउँपालिका'),
(2496, 'बलेफी गाउँपालिका', 507, 'गाउँपालिका'),
(2497, 'भोटेकोशी गाउँपालिका', 507, 'गाउँपालिका'),
(2498, 'लिसङ्खु पाखर गाउँपालिका', 507, 'गाउँपालिका'),
(2499, 'सुनकोशी गाउँपालिका', 507, 'गाउँपालिका'),
(2500, 'हेलम्बु गाउँपालिका', 507, 'गाउँपालिका'),
(2501, 'त्रिपुरासुन्दरी गाउँपालिका', 507, 'गाउँपालिका'),
(2502, 'धुलिखेल नगरपालिका', 508, 'नगरपालिका'),
(2503, 'बनेपा नगरपालिका', 508, 'नगरपालिका'),
(2504, 'पनौती नगरपालिका', 508, 'नगरपालिका'),
(2505, 'पाँचखाल नगरपालिका', 508, 'नगरपालिका'),
(2506, 'नमोबुद्ध नगरपालिका', 508, 'नगरपालिका'),
(2507, 'मण्डनदेउपुर नगरपालिका', 508, 'नगरपालिका'),
(2508, 'खानीखोला गाउँपालिका', 508, 'गाउँपालिका'),
(2509, 'चौंरीदेउराली गाउँपालिका', 508, 'गाउँपालिका'),
(2510, 'तेमाल गाउँपालिका', 508, 'गाउँपालिका'),
(2511, 'बेथानचोक गाउँपालिका', 508, 'गाउँपालिका'),
(2512, 'भुम्लु गाउँपालिका', 508, 'गाउँपालिका'),
(2513, 'महाभारत गाउँपालिका', 508, 'गाउँपालिका'),
(2514, 'रोशी गाउँपालिका', 508, 'गाउँपालिका'),
(2515, 'ललितपुर महानगरपालिका', 509, 'महानगरपालिका'),
(2516, 'गोदावरी नगरपालिका', 509, 'नगरपालिका'),
(2517, 'महालक्ष्मी नगरपालिका', 509, 'नगरपालिका'),
(2518, 'कोन्ज्योसोम गाउँपालिका', 509, 'गाउँपालिका'),
(2519, 'बागमती गाउँपालिका', 509, 'गाउँपालिका'),
(2520, 'महाङ्काल गाउँपालिका', 509, 'गाउँपालिका'),
(2521, 'चाँगुनारायण नगरपालिका', 510, 'नगरपालिका'),
(2522, 'भक्तपुर नगरपालिका', 510, 'नगरपालिका'),
(2523, 'मध्यपुर थिमी नगरपालिका', 510, 'नगरपालिका'),
(2524, 'सूर्यविनायक नगरपालिका', 510, 'नगरपालिका'),
(2525, 'काठमाण्डौं महानगरपालिका', 511, 'महानगरपालिका'),
(2526, 'कागेश्वरी मनोहरा नगरपालिका', 511, 'नगरपालिका'),
(2527, 'कीर्तिपुर नगरपालिका', 511, 'नगरपालिका'),
(2528, 'गोकर्णेश्वर नगरपालिका', 511, 'नगरपालिका'),
(2529, 'चन्द्रागिरी नगरपालिका', 511, 'नगरपालिका'),
(2530, 'टोखा नगरपालिका', 511, 'नगरपालिका'),
(2531, 'तारकेश्वर नगरपालिका', 511, 'नगरपालिका'),
(2532, 'दक्षिणकाली नगरपालिका', 511, 'नगरपालिका'),
(2533, 'नागार्जुन नगरपालिका', 511, 'नगरपालिका'),
(2534, 'बुढानिलकण्ठ नगरपालिका', 511, 'नगरपालिका'),
(2535, 'शङ्खरापुर नगरपालिका', 511, 'नगरपालिका'),
(2536, 'विदुर नगरपालिका', 512, 'नगरपालिका'),
(2537, 'बेलकोटगढी नगरपालिका', 512, 'नगरपालिका'),
(2538, 'ककनी गाउँपालिका', 512, 'गाउँपालिका'),
(2539, 'किस्पाङ गाउँपालिका', 512, 'गाउँपालिका'),
(2540, 'तादी गाउँपालिका', 512, 'गाउँपालिका'),
(2541, 'तारकेश्वर गाउँपालिका', 512, 'गाउँपालिका'),
(2542, 'दुप्चेश्वर गाउँपालिका', 512, 'गाउँपालिका'),
(2543, 'पञ्चकन्या गाउँपालिका', 512, 'गाउँपालिका'),
(2544, 'लिखु गाउँपालिका', 512, 'गाउँपालिका'),
(2545, 'मेघाङ गाउँपालिका', 512, 'गाउँपालिका'),
(2546, 'शिवपुरी गाउँपालिका', 512, 'गाउँपालिका'),
(2547, 'सुर्यगढी गाउँपालिका', 512, 'गाउँपालिका'),
(2548, 'उत्तरगया गाउँपालिका', 513, 'गाउँपालिका'),
(2549, 'कालिका गाउँपालिका', 513, 'गाउँपालिका'),
(2550, 'गोसाईकुण्ड गाउँपालिका', 513, 'गाउँपालिका'),
(2551, 'नौकुण्ड गाउँपालिका', 513, 'गाउँपालिका'),
(2552, 'पार्वतीकुण्ड गाउँपालिका', 513, 'गाउँपालिका'),
(2553, 'धुनीबेंशी नगरपालिका', 514, 'नगरपालिका'),
(2554, 'निलकण्ठ नगरपालिका', 514, 'नगरपालिका'),
(2555, 'खनियाबास गाउँपालिका', 514, 'गाउँपालिका'),
(2556, 'गजुरी गाउँपालिका', 514, 'गाउँपालिका'),
(2557, 'गल्छी गाउँपालिका', 514, 'गाउँपालिका'),
(2558, 'गङ्गाजमुना गाउँपालिका', 514, 'गाउँपालिका'),
(2559, 'ज्वालामूखी गाउँपालिका', 514, 'गाउँपालिका'),
(2560, 'थाक्रे गाउँपालिका', 514, 'गाउँपालिका'),
(2561, 'नेत्रावति गाउँपालिका', 514, 'गाउँपालिका'),
(2562, 'बेनीघाट रोराङ गाउँपालिका', 514, 'गाउँपालिका'),
(2563, 'रुवी भ्याली गाउँपालिका', 514, 'गाउँपालिका'),
(2564, 'सिद्धलेक गाउँपालिका', 514, 'गाउँपालिका'),
(2565, 'त्रिपुरासुन्दरी गाउँपालिका', 514, 'गाउँपालिका'),
(2566, 'हेटौडा उपमहानगरपालिका', 515, 'उपमहानगरपालिका'),
(2567, 'थाहा नगरपालिका', 515, 'नगरपालिका'),
(2568, 'इन्द्रसरोबर गाउँपालिका', 515, 'गाउँपालिका'),
(2569, 'कैलाश गाउँपालिका', 515, 'गाउँपालिका'),
(2570, 'बकैया गाउँपालिका', 515, 'गाउँपालिका'),
(2571, 'बाग्मति गाउँपालिका', 515, 'गाउँपालिका'),
(2572, 'भिमफेदी गाउँपालिका', 515, 'गाउँपालिका'),
(2573, 'मकवानपुरगढी गाउँपालिका', 515, 'गाउँपालिका'),
(2574, 'मनहरी गाउँपालिका', 515, 'गाउँपालिका'),
(2575, 'राक्सिराङ्ग गाउँपालिका', 515, 'गाउँपालिका'),
(2576, 'भरतपुर महानगरपालिका', 516, 'महानगरपालिका'),
(2577, 'कालिका नगरपालिका', 516, 'नगरपालिका'),
(2578, 'खैरहनी नगरपालिका', 516, 'नगरपालिका'),
(2579, 'माडी नगरपालिका', 516, 'नगरपालिका'),
(2580, 'रत्ननगर नगरपालिका', 516, 'नगरपालिका'),
(2581, 'राप्ती नगरपालिका', 516, 'नगरपालिका'),
(2582, 'इच्छाकामना गाउँपालिका', 516, 'गाउँपालिका'),
(2583, 'गोरखा नगरपालिका', 517, 'नगरपालिका'),
(2584, 'पालुङटार नगरपालिका', 517, 'नगरपालिका'),
(2585, 'सुलीकोट गाउँपालिका', 517, 'गाउँपालिका'),
(2586, 'सिरानचोक गाउँपालिका', 517, 'गाउँपालिका'),
(2587, 'अजिरकोट गाउँपालिका', 517, 'गाउँपालिका'),
(2588, 'आरूघाट गाउँपालिका', 517, 'गाउँपालिका'),
(2589, 'गण्डकी गाउँपालिका', 517, 'गाउँपालिका'),
(2590, 'चुमनुव्री गाउँपालिका', 517, 'गाउँपालिका'),
(2591, 'धार्चे गाउँपालिका', 517, 'गाउँपालिका'),
(2592, 'भिमसेन गाउँपालिका', 517, 'गाउँपालिका'),
(2593, 'शहिद लखन गाउँपालिका', 517, 'गाउँपालिका'),
(2594, 'बेसीशहर नगरपालिका', 518, 'नगरपालिका'),
(2595, 'मध्यनेपाल नगरपालिका', 518, 'नगरपालिका'),
(2596, 'रार्इनास नगरपालिका', 518, 'नगरपालिका'),
(2597, 'सुन्दरबजार नगरपालिका', 518, 'नगरपालिका'),
(2598, 'क्व्होलासोथार गाउँपालिका', 518, 'गाउँपालिका'),
(2599, 'दूधपोखरी गाउँपालिका', 518, 'गाउँपालिका'),
(2600, 'दोर्दी गाउँपालिका', 518, 'गाउँपालिका'),
(2601, 'मर्स्याङदी गाउँपालिका', 518, 'गाउँपालिका'),
(2602, 'भानु नगरपालिका', 519, 'नगरपालिका'),
(2603, 'भिमाद नगरपालिका', 519, 'नगरपालिका'),
(2604, 'व्यास नगरपालिका', 519, 'नगरपालिका'),
(2605, 'शुक्लागण्डकी नगरपालिका', 519, 'नगरपालिका'),
(2606, 'आँबुखैरेनी गाउँपालिका', 519, 'गाउँपालिका'),
(2607, 'ऋषिङ्ग गाउँपालिका', 519, 'गाउँपालिका'),
(2608, 'घिरिङ गाउँपालिका', 519, 'गाउँपालिका'),
(2609, 'देवघाट गाउँपालिका', 519, 'गाउँपालिका'),
(2610, 'म्याग्दे गाउँपालिका', 519, 'गाउँपालिका'),
(2611, 'वन्दिपुर गाउँपालिका', 519, 'गाउँपालिका'),
(2612, 'गल्याङ नगरपालिका', 520, 'नगरपालिका'),
(2613, 'चापाकोट नगरपालिका', 520, 'नगरपालिका'),
(2614, 'पुतलीबजार नगरपालिका', 520, 'नगरपालिका'),
(2615, 'भीरकोट नगरपालिका', 520, 'नगरपालिका'),
(2616, 'वालिङ नगरपालिका', 520, 'नगरपालिका'),
(2617, 'अर्जुनचौपारी गाउँपालिका', 520, 'गाउँपालिका'),
(2618, 'आँधिखोला गाउँपालिका', 520, 'गाउँपालिका'),
(2619, 'कालीगण्डकी गाउँपालिका', 520, 'गाउँपालिका'),
(2620, 'फेदीखोला गाउँपालिका', 520, 'गाउँपालिका'),
(2621, 'बिरुवा गाउँपालिका', 520, 'गाउँपालिका'),
(2622, 'हरिनास गाउँपालिका', 520, 'गाउँपालिका'),
(2623, 'पोखरा लेखनाथ महानगरपालिका', 521, 'महानगरपालिका'),
(2624, 'अन्नपूर्ण गाउँपालिका', 521, 'गाउँपालिका'),
(2625, 'माछापुच्छ्रे गाउँपालिका', 521, 'गाउँपालिका'),
(2626, 'मादी गाउँपालिका', 521, 'गाउँपालिका'),
(2627, 'रूपा गाउँपालिका', 521, 'गाउँपालिका'),
(2628, 'चामे गाउँपालिका', 0, 'गाउँपालिका'),
(2629, 'नारफू गाउँपालिका', 0, 'गाउँपालिका'),
(2630, 'नाशोङ गाउँपालिका', 0, 'गाउँपालिका'),
(2631, 'नेस्याङ गाउँपालिका', 0, 'गाउँपालिका'),
(2632, 'घरपझोङ गाउँपालिका', 522, 'गाउँपालिका'),
(2633, 'थासाङ गाउँपालिका', 522, 'गाउँपालिका'),
(2634, 'दालोमे गाउँपालिका', 522, 'गाउँपालिका'),
(2635, 'लोमन्थाङ गाउँपालिका', 522, 'गाउँपालिका'),
(2636, 'वाह्रगाउँ मुक्तिक्षेत्र गाउँपालिका', 522, 'गाउँपालिका'),
(2637, 'बेनी नगरपालिका', 523, 'नगरपालिका'),
(2638, 'अन्नपूर्ण गाउँपालिका', 523, 'गाउँपालिका'),
(2639, 'धवलागिरी गाउँपालिका', 523, 'गाउँपालिका'),
(2640, 'मंगला गाउँपालिका', 523, 'गाउँपालिका'),
(2641, 'मालिका गाउँपालिका', 523, 'गाउँपालिका'),
(2642, 'रघुगंगा गाउँपालिका', 523, 'गाउँपालिका'),
(2643, 'कुश्मा नगरपालिका', 524, 'नगरपालिका'),
(2644, 'फलेवास नगरपालिका', 524, 'नगरपालिका'),
(2645, 'जलजला गाउँपालिका', 524, 'गाउँपालिका'),
(2646, 'पैयूं गाउँपालिका', 524, 'गाउँपालिका'),
(2647, 'महाशिला गाउँपालिका', 524, 'गाउँपालिका'),
(2648, 'मोदी गाउँपालिका', 524, 'गाउँपालिका'),
(2649, 'विहादी गाउँपालिका', 524, 'गाउँपालिका'),
(2650, 'बागलुङ नगरपालिका', 525, 'नगरपालिका'),
(2651, 'गल्कोट नगरपालिका', 525, 'नगरपालिका'),
(2652, 'जैमूनी नगरपालिका', 525, 'नगरपालिका'),
(2653, 'ढोरपाटन नगरपालिका', 525, 'नगरपालिका'),
(2654, 'वरेङ गाउँपालिका', 525, 'गाउँपालिका'),
(2655, 'काठेखोला गाउँपालिका', 525, 'गाउँपालिका'),
(2656, 'तमानखोला गाउँपालिका', 525, 'गाउँपालिका'),
(2657, 'ताराखोला गाउँपालिका', 525, 'गाउँपालिका'),
(2658, 'निसीखोला गाउँपालिका', 525, 'गाउँपालिका'),
(2659, 'वडिगाड गाउँपालिका', 525, 'गाउँपालिका'),
(2660, 'कावासोती नगरपालिका', 526, 'नगरपालिका'),
(2661, 'गैडाकोट नगरपालिका', 526, 'नगरपालिका'),
(2662, 'देवचुली नगरपालिका', 526, 'नगरपालिका'),
(2663, 'मध्यविन्दु नगरपालिका', 526, 'नगरपालिका'),
(2664, 'बुङ्दीकाली गाउँपालिका', 526, 'गाउँपालिका'),
(2665, 'बुलिङटार गाउँपालिका', 526, 'गाउँपालिका'),
(2666, 'विनयी त्रिवेणी गाउँपालिका', 526, 'गाउँपालिका'),
(2667, 'हुप्सेकोट गाउँपालिका', 526, 'गाउँपालिका'),
(2668, 'मुसिकोट नगरपालिका', 527, 'नगरपालिका'),
(2669, 'रेसुङ्गा नगरपालिका', 527, 'नगरपालिका'),
(2670, 'ईस्मा गाउँपालिका', 527, 'गाउँपालिका'),
(2671, 'कालीगण्डकी गाउँपालिका', 527, 'गाउँपालिका'),
(2672, 'गुल्मी दरबार गाउँपालिका', 527, 'गाउँपालिका'),
(2673, 'सत्यवती गाउँपालिका', 527, 'गाउँपालिका'),
(2674, 'चन्द्रकोट गाउँपालिका', 527, 'गाउँपालिका'),
(2675, 'रुरु गाउँपालिका', 527, 'गाउँपालिका'),
(2676, 'छत्रकोट गाउँपालिका', 527, 'गाउँपालिका'),
(2677, 'धुर्कोट गाउँपालिका', 527, 'गाउँपालिका'),
(2678, 'मदाने गाउँपालिका', 527, 'गाउँपालिका'),
(2679, 'मालिका गाउँपालिका', 527, 'गाउँपालिका'),
(2680, 'रामपुर नगरपालिका', 528, 'नगरपालिका'),
(2681, 'तानसेन नगरपालिका', 528, 'नगरपालिका'),
(2682, 'निस्दी गाउँपालिका', 528, 'गाउँपालिका'),
(2683, 'पूर्वखोला गाउँपालिका', 528, 'गाउँपालिका'),
(2684, 'रम्भा गाउँपालिका', 528, 'गाउँपालिका'),
(2685, 'माथागढी गाउँपालिका', 528, 'गाउँपालिका'),
(2686, 'तिनाउ गाउँपालिका', 528, 'गाउँपालिका'),
(2687, 'बगनासकाली गाउँपालिका', 528, 'गाउँपालिका'),
(2688, 'रिब्दिकोट गाउँपालिका', 528, 'गाउँपालिका'),
(2689, 'रैनादेवी छहरा गाउँपालिका', 528, 'गाउँपालिका'),
(2690, 'बुटवल उपमहानगरपालिका', 529, 'उपमहानगरपालिका'),
(2691, 'देवदह नगरपालिका', 529, 'नगरपालिका'),
(2692, 'लुम्बिनी सांस्कृतिक नगरपालिका', 529, 'नगरपालिका'),
(2693, 'सैनामैना नगरपालिका', 529, 'नगरपालिका'),
(2694, 'सिद्धार्थनगर नगरपालिका', 529, 'नगरपालिका'),
(2695, 'तिलोत्तमा नगरपालिका', 529, 'नगरपालिका'),
(2696, 'गैडहवा गाउँपालिका', 529, 'गाउँपालिका'),
(2697, 'कन्चन गाउँपालिका', 529, 'गाउँपालिका'),
(2698, 'कोटहीमाई गाउँपालिका', 529, 'गाउँपालिका'),
(2699, 'मर्चवारी गाउँपालिका', 529, 'गाउँपालिका'),
(2700, 'मायादेवी गाउँपालिका', 529, 'गाउँपालिका'),
(2701, 'ओमसतिया गाउँपालिका', 529, 'गाउँपालिका'),
(2702, 'रोहिणी गाउँपालिका', 529, 'गाउँपालिका'),
(2703, 'सम्मरीमाई गाउँपालिका', 529, 'गाउँपालिका'),
(2704, 'सियारी गाउँपालिका', 529, 'गाउँपालिका'),
(2705, 'शुद्धोधन गाउँपालिका', 529, 'गाउँपालिका'),
(2706, 'कपिलवस्तु नगरपालिका', 530, 'नगरपालिका'),
(2707, 'बुद्धभूमी नगरपालिका', 530, 'नगरपालिका'),
(2708, 'शिवराज नगरपालिका', 530, 'नगरपालिका'),
(2709, 'महाराजगंज नगरपालिका', 530, 'नगरपालिका'),
(2710, 'कृष्णनगर नगरपालिका', 530, 'नगरपालिका'),
(2711, 'बाणगंगा नगरपालिका', 530, 'नगरपालिका'),
(2712, 'मायादेवी गाउँपालिका', 530, 'गाउँपालिका'),
(2713, 'यसोधरा गाउँपालिका', 530, 'गाउँपालिका'),
(2714, 'सुद्धोधन गाउँपालिका', 530, 'गाउँपालिका'),
(2715, 'विजयनगर गाउँपालिका', 530, 'गाउँपालिका'),
(2716, 'सन्धिखर्क नगरपालिका', 531, 'नगरपालिका'),
(2717, 'शितगंगा नगरपालिका', 531, 'नगरपालिका'),
(2718, 'भूमिकास्थान नगरपालिका', 531, 'नगरपालिका'),
(2719, 'छत्रदेव गाउँपालिका', 531, 'गाउँपालिका'),
(2720, 'पाणिनी गाउँपालिका', 531, 'गाउँपालिका'),
(2721, 'मालारानी गाउँपालिका', 531, 'गाउँपालिका'),
(2722, 'प्यूठान नगरपालिका', 532, 'नगरपालिका'),
(2723, 'स्वर्गद्वारी नगरपालिका', 532, 'नगरपालिका'),
(2724, 'गौमुखी गाउँपालिका', 532, 'गाउँपालिका'),
(2725, 'माण्डवी गाउँपालिका', 532, 'गाउँपालिका'),
(2726, 'सरुमारानी गाउँपालिका', 532, 'गाउँपालिका'),
(2727, 'मल्लरानी गाउँपालिका', 532, 'गाउँपालिका'),
(2728, 'नौवहिनी गाउँपालिका', 532, 'गाउँपालिका'),
(2729, 'झिमरुक गाउँपालिका', 532, 'गाउँपालिका'),
(2730, 'ऐरावती गाउँपालिका', 532, 'गाउँपालिका'),
(2731, 'रोल्पा नगरपालिका', 533, 'नगरपालिका'),
(2732, 'त्रिवेणी गाउँपालिका', 533, 'गाउँपालिका'),
(2733, 'दुईखोली गाउँपालिका', 533, 'गाउँपालिका'),
(2734, 'माडी गाउँपालिका', 533, 'गाउँपालिका'),
(2735, 'रुन्टीगढी गाउँपालिका', 533, 'गाउँपालिका'),
(2736, 'लुङग्री गाउँपालिका', 533, 'गाउँपालिका'),
(2737, 'सुकिदह गाउँपालिका', 533, 'गाउँपालिका'),
(2738, 'सुनछहरी गाउँपालिका', 533, 'गाउँपालिका'),
(2739, 'सुवर्णावती गाउँपालिका', 533, 'गाउँपालिका'),
(2740, 'थवाङ गाउँपालिका', 533, 'गाउँपालिका'),
(2741, 'पुथा उत्तरगंगा गाउँपालिका', 534, 'गाउँपालिका'),
(2742, 'भूमे गाउँपालिका', 534, 'गाउँपालिका'),
(2743, 'सिस्ने गाउँपालिका', 534, 'गाउँपालिका'),
(2744, 'तुल्सीपुर उपमहानगरपालिका', 535, 'उपमहानगरपालिका'),
(2745, 'घोराही उपमहानगरपालिका', 535, 'उपमहानगरपालिका'),
(2746, 'लमही नगरपालिका', 535, 'नगरपालिका'),
(2747, 'बंगलाचुली गाउँपालिका', 535, 'गाउँपालिका'),
(2748, 'दंगीशरण गाउँपालिका', 535, 'गाउँपालिका'),
(2749, 'गढवा गाउँपालिका', 535, 'गाउँपालिका'),
(2750, 'राजपुर गाउँपालिका', 535, 'गाउँपालिका'),
(2751, 'राप्ती गाउँपालिका', 535, 'गाउँपालिका'),
(2752, 'शान्तिनगर गाउँपालिका', 535, 'गाउँपालिका'),
(2753, 'बबई गाउँपालिका', 535, 'गाउँपालिका'),
(2754, 'नेपालगंज उपमहानगरपालिका', 536, 'उपमहानगरपालिका'),
(2755, 'कोहलपुर नगरपालिका', 536, 'नगरपालिका'),
(2756, 'नरैनापुर गाउँपालिका', 536, 'गाउँपालिका'),
(2757, 'राप्तीसोनारी गाउँपालिका', 536, 'गाउँपालिका'),
(2758, 'बैजनाथ गाउँपालिका', 536, 'गाउँपालिका'),
(2759, 'खजुरा गाउँपालिका', 536, 'गाउँपालिका'),
(2760, 'डुडुवा गाउँपालिका', 536, 'गाउँपालिका'),
(2761, 'जानकी गाउँपालिका', 536, 'गाउँपालिका'),
(2762, 'गुलरिया नगरपालिका', 537, 'नगरपालिका'),
(2763, 'मधुवन नगरपालिका', 537, 'नगरपालिका'),
(2764, 'राजापुर नगरपालिका', 537, 'नगरपालिका'),
(2765, 'ठाकुरबाबा नगरपालिका', 537, 'नगरपालिका'),
(2766, 'बाँसगढी नगरपालिका', 537, 'नगरपालिका'),
(2767, 'बारबर्दिया नगरपालिका', 537, 'नगरपालिका'),
(2768, 'बढैयाताल गाउँपालिका', 537, 'गाउँपालिका'),
(2769, 'गेरुवा गाउँपालिका', 537, 'गाउँपालिका'),
(2770, 'बर्दघाट नगरपालिका', 538, 'नगरपालिका'),
(2771, 'रामग्राम नगरपालिका', 538, 'नगरपालिका'),
(2772, 'सुनवल नगरपालिका', 538, 'नगरपालिका'),
(2773, 'सुस्ता गाउँपालिका', 538, 'गाउँपालिका'),
(2774, 'पाल्हीनन्दन गाउँपालिका', 538, 'गाउँपालिका'),
(2775, 'प्रतापपुर गाउँपालिका', 538, 'गाउँपालिका'),
(2776, 'सरावल गाउँपालिका', 538, 'गाउँपालिका'),
(2777, 'मुसिकोट नगरपालिका', 539, 'नगरपालिका'),
(2778, 'चौरजहारी नगरपालिका', 539, 'नगरपालिका'),
(2779, 'आठबिसकोट नगरपालिका', 539, 'नगरपालिका'),
(2780, 'बाँफिकोट गाउँपालिका', 539, 'गाउँपालिका'),
(2781, 'त्रिवेणी गाउँपालिका', 539, 'गाउँपालिका'),
(2782, 'सानी भेरी गाउँपालिका', 539, 'गाउँपालिका'),
(2783, 'शारदा नगरपालिका', 540, 'नगरपालिका'),
(2784, 'बागचौर नगरपालिका', 540, 'नगरपालिका'),
(2785, 'बनगाड कुपिण्डे नगरपालिका', 540, 'नगरपालिका'),
(2786, 'कालिमाटी गाउँपालिका', 540, 'गाउँपालिका'),
(2787, 'त्रिवेणी गाउँपालिका', 540, 'गाउँपालिका'),
(2788, 'कपुरकोट गाउँपालिका', 540, 'गाउँपालिका'),
(2789, 'छत्रेश्वरी गाउँपालिका', 540, 'गाउँपालिका'),
(2790, 'ढोरचौर गाउँपालिका', 540, 'गाउँपालिका'),
(2791, 'कुमाखमालिका गाउँपालिका', 540, 'गाउँपालिका'),
(2792, 'दार्मा गाउँपालिका', 540, 'गाउँपालिका'),
(2793, 'बीरेन्द्रनगर नगरपालिका', 541, 'नगरपालिका'),
(2794, 'भेरीगंगा नगरपालिका', 541, 'नगरपालिका'),
(2795, 'गुर्भाकोट नगरपालिका', 541, 'नगरपालिका'),
(2796, 'पञ्चपुरी नगरपालिका', 541, 'नगरपालिका'),
(2797, 'लेकवेशी नगरपालिका', 541, 'नगरपालिका'),
(2798, 'चौकुने गाउँपालिका', 541, 'गाउँपालिका'),
(2799, 'बराहताल गाउँपालिका', 541, 'गाउँपालिका'),
(2800, 'चिङ्गाड गाउँपालिका', 541, 'गाउँपालिका'),
(2801, 'सिम्ता गाउँपालिका', 541, 'गाउँपालिका'),
(2802, 'नारायण नगरपालिका', 542, 'नगरपालिका'),
(2803, 'दुल्लु नगरपालिका', 542, 'नगरपालिका'),
(2804, 'चामुण्डा विन्द्रासैनी नगरपालिका', 542, 'नगरपालिका'),
(2805, 'आठबीस नगरपालिका', 542, 'नगरपालिका'),
(2806, 'भगवतीमाई गाउँपालिका', 542, 'गाउँपालिका'),
(2807, 'गुराँस गाउँपालिका', 542, 'गाउँपालिका'),
(2808, 'डुंगेश्वर गाउँपालिका', 542, 'गाउँपालिका'),
(2809, 'नौमुले गाउँपालिका', 542, 'गाउँपालिका'),
(2810, 'महावु गाउँपालिका', 542, 'गाउँपालिका'),
(2811, 'भैरवी गाउँपालिका', 542, 'गाउँपालिका'),
(2812, 'ठाँटीकाँध गाउँपालिका', 542, 'गाउँपालिका'),
(2813, 'भेरी नगरपालिका', 543, 'नगरपालिका'),
(2814, 'छेडागाड नगरपालिका', 543, 'नगरपालिका'),
(2815, 'त्रिवेणी नलगाड नगरपालिका', 543, 'नगरपालिका'),
(2816, 'बारेकोट गाउँपालिका', 543, 'गाउँपालिका'),
(2817, 'कुसे गाउँपालिका', 543, 'गाउँपालिका'),
(2818, 'जुनीचाँदे गाउँपालिका', 543, 'गाउँपालिका'),
(2819, 'शिवालय गाउँपालिका', 543, 'गाउँपालिका'),
(2820, 'ठुली भेरी नगरपालिका', 544, 'नगरपालिका'),
(2821, 'त्रिपुरासुन्दरी नगरपालिका', 544, 'नगरपालिका'),
(2822, 'डोल्पो बुद्ध गाउँपालिका', 544, 'गाउँपालिका'),
(2823, 'शे फोक्सुन्डो गाउँपालिका', 544, 'गाउँपालिका'),
(2824, 'जगदुल्ला गाउँपालिका', 544, 'गाउँपालिका'),
(2825, 'मुड्केचुला गाउँपालिका', 544, 'गाउँपालिका'),
(2826, 'काईके गाउँपालिका', 544, 'गाउँपालिका'),
(2827, 'छार्का ताङसोङ गाउँपालिका', 544, 'गाउँपालिका'),
(2828, 'चन्दननाथ नगरपालिका', 545, 'नगरपालिका'),
(2829, 'कनकासुन्दरी गाउँपालिका', 545, 'गाउँपालिका'),
(2830, 'सिंजा गाउँपालिका', 545, 'गाउँपालिका'),
(2831, 'हिमा गाउँपालिका', 545, 'गाउँपालिका'),
(2832, 'तिला गाउँपालिका', 545, 'गाउँपालिका'),
(2833, 'गुठिचौर गाउँपालिका', 545, 'गाउँपालिका'),
(2834, 'तातोपानी गाउँपालिका', 545, 'गाउँपालिका'),
(2835, 'पातारासी गाउँपालिका', 545, 'गाउँपालिका'),
(2836, 'खाँडाचक्र नगरपालिका', 546, 'नगरपालिका'),
(2837, 'रास्कोट नगरपालिका', 546, 'नगरपालिका'),
(2838, 'तिलागुफा नगरपालिका', 546, 'नगरपालिका'),
(2839, 'पचालझरना गाउँपालिका', 546, 'गाउँपालिका'),
(2840, 'सान्नी त्रिवेणी गाउँपालिका', 546, 'गाउँपालिका'),
(2841, 'नरहरिनाथ गाउँपालिका', 546, 'गाउँपालिका'),
(2842, 'कालिका गाउँपालिका', 546, 'गाउँपालिका'),
(2843, 'महावै गाउँपालिका', 546, 'गाउँपालिका'),
(2844, 'पलाता गाउँपालिका', 546, 'गाउँपालिका'),
(2845, 'छायाँनाथ रारा नगरपालिका', 547, 'नगरपालिका'),
(2846, 'मुगुम कार्मारोंग गाउँपालिका', 547, 'गाउँपालिका'),
(2847, 'सोरु गाउँपालिका', 547, 'गाउँपालिका'),
(2848, 'खत्याड गाउँपालिका', 547, 'गाउँपालिका'),
(2849, 'सिमकोट गाउँपालिका', 548, 'गाउँपालिका'),
(2850, 'नाम्खा गाउँपालिका', 548, 'गाउँपालिका'),
(2851, 'खार्पुनाथ गाउँपालिका', 548, 'गाउँपालिका'),
(2852, 'सर्केगाड गाउँपालिका', 548, 'गाउँपालिका'),
(2853, 'चंखेली गाउँपालिका', 548, 'गाउँपालिका'),
(2854, 'अदानचुली गाउँपालिका', 548, 'गाउँपालिका'),
(2855, 'ताँजाकोट गाउँपालिका', 548, 'गाउँपालिका'),
(2856, 'बडीमालिका नगरपालिका', 549, 'नगरपालिका'),
(2857, 'त्रिवेणी नगरपालिका', 549, 'नगरपालिका'),
(2858, 'बुढीगंगा नगरपालिका', 549, 'नगरपालिका'),
(2859, 'बुढीनन्दा नगरपालिका', 549, 'नगरपालिका'),
(2860, 'गौमुल गाउँपालिका', 549, 'गाउँपालिका'),
(2861, 'पाण्डव गुफा गाउँपालिका', 549, 'गाउँपालिका'),
(2862, 'स्वामीकार्तिक गाउँपालिका', 549, 'गाउँपालिका'),
(2863, 'छेडेदह गाउँपालिका', 549, 'गाउँपालिका'),
(2864, 'हिमाली गाउँपालिका', 549, 'गाउँपालिका'),
(2865, 'जयपृथ्वी नगरपालिका', 550, 'नगरपालिका'),
(2866, 'बुंगल नगरपालिका', 550, 'नगरपालिका'),
(2867, 'तलकोट गाउँपालिका', 550, 'गाउँपालिका'),
(2868, 'मष्टा गाउँपालिका', 550, 'गाउँपालिका'),
(2869, 'खप्तडछान्ना गाउँपालिका', 550, 'गाउँपालिका'),
(2870, 'थलारा गाउँपालिका', 550, 'गाउँपालिका'),
(2871, 'वित्थडचिर गाउँपालिका', 550, 'गाउँपालिका'),
(2872, 'सूर्मा गाउँपालिका', 550, 'गाउँपालिका'),
(2873, 'छबिसपाथिभेरा गाउँपालिका', 550, 'गाउँपालिका'),
(2874, 'दुर्गाथली गाउँपालिका', 550, 'गाउँपालिका'),
(2875, 'केदारस्युँ गाउँपालिका', 550, 'गाउँपालिका'),
(2876, 'काँडा गाउँपालिका', 550, 'गाउँपालिका'),
(2877, 'मंगलसेन नगरपालिका', 551, 'नगरपालिका'),
(2878, 'कमलबजार नगरपालिका', 551, 'नगरपालिका'),
(2879, 'साँफेबगर नगरपालिका', 551, 'नगरपालिका'),
(2880, 'पन्चदेवल विनायक नगरपालिका', 551, 'नगरपालिका'),
(2881, 'चौरपाटी गाउँपालिका', 551, 'गाउँपालिका'),
(2882, 'मेल्लेख गाउँपालिका', 551, 'गाउँपालिका'),
(2883, 'बान्निगढी जयगढ गाउँपालिका', 551, 'गाउँपालिका'),
(2884, 'रामारोशन गाउँपालिका', 551, 'गाउँपालिका'),
(2885, 'ढकारी गाउँपालिका', 551, 'गाउँपालिका'),
(2886, 'तुर्माखाँद गाउँपालिका', 551, 'गाउँपालिका'),
(2887, 'दिपायल सिलगढी नगरपालिका', 552, 'नगरपालिका'),
(2888, 'शिखर नगरपालिका', 552, 'नगरपालिका'),
(2889, 'पूर्वीचौकी गाउँपालिका', 552, 'गाउँपालिका'),
(2890, 'बडीकेदार गाउँपालिका', 552, 'गाउँपालिका'),
(2891, 'जोरायल गाउँपालिका', 552, 'गाउँपालिका'),
(2892, 'सायल गाउँपालिका', 552, 'गाउँपालिका'),
(2893, 'आदर्श गाउँपालिका', 552, 'गाउँपालिका'),
(2894, 'के.आई.सिं. गाउँपालिका', 552, 'गाउँपालिका'),
(2895, 'बोगटान गाउँपालिका', 552, 'गाउँपालिका'),
(2896, 'धनगढी उपमहानगरपालिका', 553, 'उपमहानगरपालिका'),
(2897, 'टिकापुर नगरपालिका', 553, 'नगरपालिका'),
(2898, 'घोडाघोडी नगरपालिका', 553, 'नगरपालिका'),
(2899, 'लम्कीचुहा नगरपालिका', 553, 'नगरपालिका'),
(2900, 'भजनी नगरपालिका', 553, 'नगरपालिका'),
(2901, 'गोदावरी नगरपालिका', 553, 'नगरपालिका'),
(2902, 'गौरीगंगा नगरपालिका', 553, 'नगरपालिका'),
(2903, 'जानकी गाउँपालिका', 553, 'गाउँपालिका'),
(2904, 'बर्दगोरिया गाउँपालिका', 553, 'गाउँपालिका'),
(2905, 'मोहन्याल गाउँपालिका', 553, 'गाउँपालिका'),
(2906, 'कैलारी गाउँपालिका', 553, 'गाउँपालिका'),
(2907, 'जोशीपुर गाउँपालिका', 553, 'गाउँपालिका'),
(2908, 'चुरे गाउँपालिका', 553, 'गाउँपालिका'),
(2909, 'भीमदत्त नगरपालिका', 554, 'नगरपालिका'),
(2910, 'पुर्नवास नगरपालिका', 554, 'नगरपालिका'),
(2911, 'वेदकोट नगरपालिका', 554, 'नगरपालिका'),
(2912, 'महाकाली नगरपालिका', 554, 'नगरपालिका'),
(2913, 'शुक्लाफाँटा नगरपालिका', 554, 'नगरपालिका'),
(2914, 'बेलौरी नगरपालिका', 554, 'नगरपालिका'),
(2915, 'कृष्णपुर नगरपालिका', 554, 'नगरपालिका'),
(2916, 'बेलडाडी गाउँपालिका', 554, 'गाउँपालिका'),
(2917, 'लालझाडी गाउँपालिका', 554, 'गाउँपालिका'),
(2918, 'अमरगढी नगरपालिका', 555, 'नगरपालिका'),
(2919, 'परशुराम नगरपालिका', 555, 'नगरपालिका'),
(2920, 'आलिताल गाउँपालिका', 555, 'गाउँपालिका'),
(2921, 'भागेश्वर गाउँपालिका', 555, 'गाउँपालिका'),
(2922, 'नवदुर्गा गाउँपालिका', 555, 'गाउँपालिका'),
(2923, 'अजयमेरु गाउँपालिका', 555, 'गाउँपालिका'),
(2924, 'गन्यापधुरा गाउँपालिका', 555, 'गाउँपालिका'),
(2925, 'दशरथचन्द नगरपालिका', 556, 'नगरपालिका'),
(2926, 'पाटन नगरपालिका', 556, 'नगरपालिका'),
(2927, 'मेलौली नगरपालिका', 556, 'नगरपालिका'),
(2928, 'पुर्चौडी नगरपालिका', 556, 'नगरपालिका'),
(2929, 'सुर्नया गाउँपालिका', 556, 'गाउँपालिका'),
(2930, 'सिगास गाउँपालिका', 556, 'गाउँपालिका'),
(2931, 'शिवनाथ गाउँपालिका', 556, 'गाउँपालिका'),
(2932, 'पञ्चेश्वर गाउँपालिका', 556, 'गाउँपालिका'),
(2933, 'दोगडाकेदार गाउँपालिका', 556, 'गाउँपालिका'),
(2934, 'डीलासैनी गाउँपालिका', 556, 'गाउँपालिका'),
(2935, 'महाकाली नगरपालिका', 557, 'नगरपालिका'),
(2936, 'शैल्यशिखर नगरपालिका', 557, 'नगरपालिका'),
(2937, 'मालिकार्जुन गाउँपालिका', 557, 'गाउँपालिका'),
(2938, 'अपिहिमाल गाउँपालिका', 557, 'गाउँपालिका'),
(2939, 'दुहुँ गाउँपालिका', 557, 'गाउँपालिका'),
(2940, 'नौगाड गाउँपालिका', 557, 'गाउँपालिका'),
(2941, 'मार्मा गाउँपालिका', 557, 'गाउँपालिका'),
(2942, 'लेकम गाउँपालिका', 557, 'गाउँपालिका'),
(2943, 'ब्याँस गाउँपालिका', 557, 'गाउँपालिका');

-- --------------------------------------------------------

--
-- Table structure for table `settings_ward`
--

CREATE TABLE IF NOT EXISTS `settings_ward` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` varchar(512) NOT NULL,
  `address_eng` varchar(512) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone_no` int(11) DEFAULT NULL,
  `nara` varchar(255) DEFAULT NULL,
  `slogan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_ward`
--

INSERT INTO `settings_ward` (`id`, `name`, `address`, `address_eng`, `email`, `phone_no`, `nara`, `slogan`) VALUES
(1, '1', 'डुम्रिचौर ', 'Dumrichaur', 'galchhigapaward1@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(2, '2', 'वर भञ्‍ज्याङ', 'Bar Bhanjyang', 'galchhigapaward2@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"'),
(3, '3', 'आमडाँडाँ', 'Aamdanda', 'galchhigapaward3@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(4, '4', 'अदुवाबारी', 'Aduwabari', 'galchhigapaward4@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(5, '5', 'थालचौर', 'Thalchaur', 'galchhigapaward5@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(6, '६', 'बैरेनी', 'Baireni', 'galchhigapaward6@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(7, '7', 'भल्टार', 'Bhaltar', 'galchhigapaward7@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	'),
(8, '8', 'गोगनपानी', 'Goganpani', 'galchhigapaward8@gmail.com', 2147483647, '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	', '"त्रिदेशीय व्यापारिक नगर : सम्वृद्ध गल्छी शहर"	');

-- --------------------------------------------------------

--
-- Table structure for table `settings_ward_worker`
--

CREATE TABLE IF NOT EXISTS `settings_ward_worker` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `ward` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `is_signature` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_ward_worker`
--

INSERT INTO `settings_ward_worker` (`id`, `name`, `english_name`, `ward`, `post_id`, `is_signature`) VALUES
(1, 'नर बहादुर बिश्वकर्मा ', 'Nar Bahadur Bishwokarma', 1, 5, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings_work`
--

CREATE TABLE IF NOT EXISTS `settings_work` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_work`
--

INSERT INTO `settings_work` (`id`, `name`) VALUES
(1, 'निर्माण सम्बन्धी'),
(2, 'परामर्श सेवा'),
(3, 'डोजरको पार्टपूर्जा'),
(4, 'सेवा सम्बन्धी');

-- --------------------------------------------------------

--
-- Table structure for table `settings_worker`
--

CREATE TABLE IF NOT EXISTS `settings_worker` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `english_name` varchar(255) DEFAULT NULL,
  `department_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `settings_worker`
--

INSERT INTO `settings_worker` (`id`, `name`, `english_name`, `department_id`, `post_id`) VALUES
(1, 'नर बहादुर विश्वकर्मा	', 'Nar Bahadur Bishwokarma', 1, 5);

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

INSERT INTO `set_up` (`id`, `palika_name`, `palika_name_en`, `karay_palika_np`, `karay_palika_en`, `state_np`, `state_en`, `district_np`, `district_en`, `sarkar_logo`, `palika_logo`, `palika_slogan`, `palika_slogan_en`, `website`, `phone_no`, `email`, `facebook`, `created_at`) VALUES
(1, 'गल्छी गाउँपालिका', 'Galchhi Rural Municipality', 'गाउँ कार्यपालिकाको कार्यालय', 'Office of Rural Municipality Executive', 'बागमती प्रदेश', 'Bagmati Province', 'धादिङ', 'Dhading', 'logo.png', 'GalchhiLogo.png', 'त्रिदेशिय व्यापारिक नगर : समृद्ध गल्छी शहर', 'त्रिदेशिय व्यापारिक नगर : समृद्ध गल्छी शहर', 'https://galchhimun.gov.np ', 10403192, 'info@galchhimun.gov.np', 'facebook.com/galchhirm', '2024-07-14 02:11:58pm');

-- --------------------------------------------------------

--
-- Table structure for table `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `id` int(11) NOT NULL,
  `site_name` varchar(100) DEFAULT NULL,
  `site_slogan` varchar(250) NOT NULL,
  `site_status` enum('1','2','3') NOT NULL DEFAULT '1' COMMENT '1=online, 2=offline, 3=maintainance',
  `maintainance_key` varchar(250) NOT NULL,
  `currency_sign` varchar(5) DEFAULT NULL,
  `currency_code` varchar(10) DEFAULT NULL,
  `img_size` varchar(5000) NOT NULL,
  `google_map_code` tinytext DEFAULT NULL,
  `default_time_zone` varchar(100) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_email` varchar(100) DEFAULT NULL,
  `address_line1` varchar(100) DEFAULT NULL,
  `address_line2` varchar(100) DEFAULT NULL,
  `poboxno` varchar(50) DEFAULT NULL,
  `fax` varchar(50) DEFAULT NULL,
  `mobileno` varchar(50) DEFAULT NULL,
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `linkedin` varchar(150) NOT NULL,
  `googleplus` varchar(150) NOT NULL,
  `facebook_embeded` varchar(1500) NOT NULL,
  `logo_img` varchar(200) DEFAULT NULL,
  `log_admin_activity` enum('N','Y') NOT NULL,
  `log_admin_invalid_login` enum('N','Y') NOT NULL,
  `google_analytics_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sthai_basobas`
--

CREATE TABLE IF NOT EXISTS `sthai_basobas` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `resident_name` text NOT NULL,
  `citizenship_no` varchar(15) NOT NULL,
  `citizenship_district` int(11) NOT NULL,
  `nepali_citizenship_date` varchar(50) NOT NULL,
  `english_citizenship_date` date NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_place` int(11) NOT NULL,
  `nepali_permission_date` varchar(50) NOT NULL,
  `english_permission_date` date NOT NULL,
  `tole` text NOT NULL,
  `road` text NOT NULL,
  `ghar_no` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `con_no` varchar(255) DEFAULT NULL,
  `gender_spec` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sthai_niyukti`
--

CREATE TABLE IF NOT EXISTS `sthai_niyukti` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cit_no` varchar(255) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `ganapa` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `loksewa_office` varchar(255) NOT NULL,
  `loksewaoffice_address` varchar(255) NOT NULL,
  `add_no` varchar(255) NOT NULL,
  `add_date` varchar(25) NOT NULL,
  `office_chalani_no` varchar(255) NOT NULL,
  `office_chalani_date` varchar(25) NOT NULL,
  `yain` text NOT NULL,
  `gapa_miti` varchar(25) NOT NULL,
  `lagu_miti` varchar(25) NOT NULL,
  `sewa` varchar(255) NOT NULL,
  `samuha` varchar(255) NOT NULL,
  `taha` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `bodartha` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suchi_darta`
--

CREATE TABLE IF NOT EXISTS `suchi_darta` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `maujuda_id` int(11) NOT NULL,
  `is_muncipality` enum('0','1') NOT NULL,
  `darta_no` bigint(20) NOT NULL,
  `patra_chalani_no` int(11) NOT NULL,
  `is_complete` enum('0','1') NOT NULL DEFAULT '0',
  `ward_login` int(11) NOT NULL,
  `department` varchar(10) NOT NULL,
  `link` text NOT NULL,
  `nepali_darta_miti` varchar(50) NOT NULL,
  `english_darta_miti` date NOT NULL,
  `applicant_name` text NOT NULL,
  `letter_subject` text NOT NULL,
  `letter_type` enum('important','most_important','deadlined') NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `darta_documents` text NOT NULL,
  `description` text NOT NULL,
  `deadline_nep` varchar(80) NOT NULL,
  `deadline_eng` date NOT NULL,
  `transfer_date_nep` varchar(80) NOT NULL,
  `transfer_date_eng` date NOT NULL,
  `patra_miti_nep` varchar(80) NOT NULL,
  `patra_miti_eng` date NOT NULL,
  `karmachari_name` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_clear`
--

CREATE TABLE IF NOT EXISTS `tax_clear` (
  `id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_gapana` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `rem_ward` int(11) NOT NULL,
  `relation` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `added_by` int(11) NOT NULL,
  `added_on` varchar(25) NOT NULL,
  `added_ward` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_no` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_clearance`
--

CREATE TABLE IF NOT EXISTS `tax_clearance` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `plot_no` varchar(15) NOT NULL,
  `property_tax` float NOT NULL,
  `property_ward` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(20) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `template_form`
--

CREATE TABLE IF NOT EXISTS `template_form` (
  `id` int(11) NOT NULL,
  `applicant_name` text NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) DEFAULT NULL,
  `status` enum('1','2','3') NOT NULL,
  `nepali_date` varchar(80) NOT NULL,
  `date` date NOT NULL,
  `documents` text DEFAULT NULL,
  `darta_documents` text DEFAULT NULL,
  `letter_subject` text NOT NULL,
  `letter_type` int(11) NOT NULL,
  `content` longtext DEFAULT NULL,
  `content_sub` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tin_pusta_pramanit`
--

CREATE TABLE IF NOT EXISTS `tin_pusta_pramanit` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `nepali_date` text NOT NULL,
  `date` date NOT NULL,
  `applicant_name` text NOT NULL,
  `name` text NOT NULL,
  `gender` tinyint(1) NOT NULL,
  `name_1` text NOT NULL,
  `relation_1` varchar(255) NOT NULL,
  `citizenship_no_1` varchar(25) NOT NULL,
  `citizenship_date_1` varchar(35) NOT NULL,
  `citizenship_district_1` int(11) NOT NULL,
  `name_2` text NOT NULL,
  `relation_2` varchar(255) NOT NULL,
  `citizenship_no_2` varchar(25) NOT NULL,
  `citizenship_date_2` varchar(35) NOT NULL,
  `citizenship_district_2` int(11) NOT NULL,
  `name_3` text NOT NULL,
  `relation_3` varchar(255) NOT NULL,
  `citizenship_no_3` varchar(25) NOT NULL,
  `citizenship_date_3` varchar(35) NOT NULL,
  `citizenship_district_3` int(11) NOT NULL,
  `state` int(11) NOT NULL,
  `district` int(11) NOT NULL,
  `local_body` int(11) NOT NULL,
  `ward` int(11) NOT NULL,
  `old_new_address` int(11) NOT NULL,
  `land_type` enum('hill','terai','','') NOT NULL,
  `documents` text NOT NULL,
  `documents_type` varchar(30) NOT NULL,
  `darta_documents` text NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tin_pusta_pramanit_detail`
--

CREATE TABLE IF NOT EXISTS `tin_pusta_pramanit_detail` (
  `id` int(11) NOT NULL,
  `detail_id` int(11) NOT NULL,
  `kitta_no` varchar(15) NOT NULL,
  `sheet_no` varchar(15) NOT NULL,
  `biggha` double NOT NULL,
  `kattha` double NOT NULL,
  `dhur` double NOT NULL,
  `paisa` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unmarried_en`
--

CREATE TABLE IF NOT EXISTS `unmarried_en` (
  `id` int(11) NOT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `darta_no` int(11) NOT NULL,
  `date` varchar(255) NOT NULL,
  `gender` int(11) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  `father_name` varchar(255) NOT NULL,
  `mother_name` varchar(255) NOT NULL,
  `ctn_no` varchar(255) NOT NULL,
  `per_state` int(11) NOT NULL,
  `per_district` int(11) NOT NULL,
  `per_ganapa` int(11) NOT NULL,
  `per_ward` int(11) NOT NULL,
  `former_vdc` varchar(255) NOT NULL,
  `former_ward` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `upgrade_postion`
--

CREATE TABLE IF NOT EXISTS `upgrade_postion` (
  `id` int(11) NOT NULL,
  `date` varchar(25) DEFAULT NULL,
  `form_id` bigint(20) NOT NULL,
  `session_id` int(11) NOT NULL,
  `ward_login` int(11) NOT NULL,
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  `gender` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cit_no` varchar(255) NOT NULL,
  `state` int(11) DEFAULT NULL,
  `district` int(11) DEFAULT NULL,
  `ganapa` int(11) DEFAULT NULL,
  `ward` int(11) DEFAULT NULL,
  `taha` varchar(255) NOT NULL,
  `position` varchar(255) NOT NULL,
  `working_office` varchar(255) NOT NULL,
  `from_date` varchar(255) NOT NULL,
  `start_date` varchar(255) NOT NULL,
  `period` varchar(25) NOT NULL,
  `period_date` varchar(255) NOT NULL,
  `upgrade_taha` varchar(255) NOT NULL,
  `upgrade_position` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `phone` varchar(30) NOT NULL,
  `email` varchar(125) NOT NULL,
  `ward` int(11) NOT NULL,
  `mode` varchar(15) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` text NOT NULL,
  `is_muncipality` enum('0','1') NOT NULL,
  `department` int(11) NOT NULL,
  `is_sachib` enum('0','1') NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `name`, `address`, `phone`, `email`, `ward`, `mode`, `username`, `password`, `is_muncipality`, `department`, `is_sachib`, `created_at`) VALUES
(1, 'BMS', '', '9851117526', 'sgrlamsal@gmail.com', 0, 'administrator', 'galchhi', '$2y$10$7rXjpe3stuUr21G4Af9vb.Ay8hM00TSB7a4oEPC39wMgccfCFhZVW', '1', 1, '0', '2019-09-08 12:08:24'),
(7, '१ नं वडा कार्यालय', '', '9851342981', 'galchhigapaward1@gmail.com', 1, 'user', 'ward1', '$2y$10$xfo0ShHyxWFsA7saYrxRquABMb1IvTofBDd/eQgwT67ojK5N7ofpO', '0', 0, '0', '2024-05-27 14:17:14'),
(8, 'गल्छी गाउँपालिका ', '', '०१०४०३१९२', 'info@galchhimun.gov.np', 0, 'superadmin', 'ito.galchhi', '$2y$10$rfpaoV1xc/kusQfEyO38xuyxLVxM7rszA.7m4ryhgXXhybH0UDiuC', '1', 13, '0', '2024-07-15 07:49:56'),
(9, '२ नं वडा कार्यालय', '', '9851342982', 'galchhigapaward2@gmail.com', 2, 'user', 'ward2', '$2y$10$3zX0.ZhkousSIe3dO0vxQOL/qCxxLWG24j5qiI/xcYMufWYBtYKnW', '0', 0, '0', '2024-07-15 08:44:53'),
(10, '३ नं वडा कार्यालय', '', '9851342983', 'galchhigapaward3@gmail.com', 3, 'user', 'ward3', '$2y$10$N9OQnwoJbFvJEGdhtEou0eXbq//qjnQaJJHJF51w929vNyk7vrJn2', '0', 0, '0', '2024-07-15 08:47:56'),
(11, '४ नं वडा कार्यालय', '', '9851342984', 'galchhigapaward4@gmail.com', 4, 'user', 'ward4', '$2y$10$IY1HOCNraBa9Iy70uzHBROH/ydIWKfgPRWZ5BpLSFHRcxfgLqrUPe', '0', 0, '0', '2024-07-15 08:48:47'),
(12, '५ नं वडा कार्यालय', '', '9851342985', 'galchhigapaward5@gmail.com', 5, 'user', 'ward5', '$2y$10$9.NMk.Hxbq3nCQb/0NUCGuRdz00p8lfd75Td5X.5ehowP8KW6VdYe', '0', 0, '0', '2024-07-15 08:49:35'),
(13, ' ६ नं वडा कार्यालय', '', '9851342986', 'galchhigapaward6@gmail.com', 6, 'user', 'ward6', '$2y$10$LAGt43AdGHHp.P4ticES1.5p2nFnpWEyVNnUi.aQdrq5K.YbK4kTy', '0', 0, '0', '2024-07-15 08:50:37'),
(14, '७ नं वडा कार्यालय', '', '9851342987', 'galchhigapaward7@gmail.com', 7, 'user', 'ward7', '$2y$10$UyaN3iuS3LBD8PPbmwuSyuLEM0VKG5YTBf94poUVnAbyVBbqlv6Iu', '0', 0, '0', '2024-07-15 08:51:49'),
(15, '८ नं वडा कार्यालय', '', '9851342988', 'galchhigapaward8@gmail.com', 8, 'user', 'ward8', '$2y$10$L5cHL/vWIV/hpxCYb1qFmeLqtl7uoejRP8RcpaQtBiVgiwsHGZWJK', '0', 0, '0', '2024-07-15 08:52:36');

-- --------------------------------------------------------

--
-- Table structure for table `yain`
--

CREATE TABLE IF NOT EXISTS `yain` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `yain`
--

INSERT INTO `yain` (`id`, `name`) VALUES
(1, 'कर्मचारी समायोजन ऐन, २०७५ को दफा १२ को उपदफा ३'),
(2, 'कर्मचारी समायोजन ऐन, २०७५ को दफा १२ को उपदफा 24');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abibhahit_pramanpatra`
--
ALTER TABLE `abibhahit_pramanpatra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address_verifiaction_en`
--
ALTER TABLE `address_verifiaction_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `add_classroom`
--
ALTER TABLE `add_classroom`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `annual_income_en`
--
ALTER TABLE `annual_income_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `antarik_basai_sarai`
--
ALTER TABLE `antarik_basai_sarai`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `antarik_basai_sarai_detail`
--
ALTER TABLE `antarik_basai_sarai_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `apanga_pramanpatra`
--
ALTER TABLE `apanga_pramanpatra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `arthik_saheta`
--
ALTER TABLE `arthik_saheta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `asthai_basobas`
--
ALTER TABLE `asthai_basobas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bato_kayam`
--
ALTER TABLE `bato_kayam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bebasaya_banda`
--
ALTER TABLE `bebasaya_banda`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bebasaya_darta`
--
ALTER TABLE `bebasaya_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bebasaya_sifaris`
--
ALTER TABLE `bebasaya_sifaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bibaha_pramanit`
--
ALTER TABLE `bibaha_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidhut_jadan`
--
ALTER TABLE `bidhut_jadan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `birth_certificate_en`
--
ALTER TABLE `birth_certificate_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `chalani`
--
ALTER TABLE `chalani`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `charkilla_details`
--
ALTER TABLE `charkilla_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `char_killa`
--
ALTER TABLE `char_killa`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizenship_sifaris`
--
ALTER TABLE `citizenship_sifaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizen_certificate`
--
ALTER TABLE `citizen_certificate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `citizen_certificate_pratilipi`
--
ALTER TABLE `citizen_certificate_pratilipi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `court_fee`
--
ALTER TABLE `court_fee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `darta`
--
ALTER TABLE `darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farak_hijje`
--
ALTER TABLE `farak_hijje`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farak_janma_miti`
--
ALTER TABLE `farak_janma_miti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `farak_nam_thar`
--
ALTER TABLE `farak_nam_thar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `fiscal_year_end_date`
--
ALTER TABLE `fiscal_year_end_date`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ghar_jagga_hakdar`
--
ALTER TABLE `ghar_jagga_hakdar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ghar_jagga_namsari`
--
ALTER TABLE `ghar_jagga_namsari`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ghar_kayam`
--
ALTER TABLE `ghar_kayam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ghar_patala`
--
ALTER TABLE `ghar_patala`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hakdar_pramanit`
--
ALTER TABLE `hakdar_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_recommend`
--
ALTER TABLE `home_recommend`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_road_certify`
--
ALTER TABLE `home_road_certify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_road_certify_land`
--
ALTER TABLE `home_road_certify_land`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_details_en`
--
ALTER TABLE `income_details_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_verification`
--
ALTER TABLE `income_verification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `income_verification_detail`
--
ALTER TABLE `income_verification_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `janma_miti_pramanit`
--
ALTER TABLE `janma_miti_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jet_machine`
--
ALTER TABLE `jet_machine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `khanepani_jadan`
--
ALTER TABLE `khanepani_jadan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kitta_kat_sifaris`
--
ALTER TABLE `kitta_kat_sifaris`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kotha_khali_suchana`
--
ALTER TABLE `kotha_khali_suchana`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `lalpurja_pratilipi`
--
ALTER TABLE `lalpurja_pratilipi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `land_category`
--
ALTER TABLE `land_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `letter_head`
--
ALTER TABLE `letter_head`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `married_en`
--
ALTER TABLE `married_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `maujuda_suchi`
--
ALTER TABLE `maujuda_suchi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mirtyu_darta`
--
ALTER TABLE `mirtyu_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mohi_lagat`
--
ALTER TABLE `mohi_lagat`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `naamsari_jagga_wiwaran`
--
ALTER TABLE `naamsari_jagga_wiwaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nabalak_pramanit`
--
ALTER TABLE `nabalak_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `name_verification_en`
--
ALTER TABLE `name_verification_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nata_pramanit`
--
ALTER TABLE `nata_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nata_pramanit_detail`
--
ALTER TABLE `nata_pramanit_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `prabhidik_mulyankan`
--
ALTER TABLE `prabhidik_mulyankan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `print_details`
--
ALTER TABLE `print_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_detail_en`
--
ALTER TABLE `property_detail_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_valuation`
--
ALTER TABLE `property_valuation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_valuation_detail`
--
ALTER TABLE `property_valuation_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `property_valuation_en`
--
ALTER TABLE `property_valuation_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relation_members`
--
ALTER TABLE `relation_members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `relation_ship`
--
ALTER TABLE `relation_ship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sachiwalaya_darta`
--
ALTER TABLE `sachiwalaya_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sadak_khanne_swikriti`
--
ALTER TABLE `sadak_khanne_swikriti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `salary_approval`
--
ALTER TABLE `salary_approval`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha_darta`
--
ALTER TABLE `sanstha_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha_darta_pramanpatra`
--
ALTER TABLE `sanstha_darta_pramanpatra`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sanstha_nabikaran`
--
ALTER TABLE `sanstha_nabikaran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sawari_pass`
--
ALTER TABLE `sawari_pass`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scholarship`
--
ALTER TABLE `scholarship`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `scholarship_detail`
--
ALTER TABLE `scholarship_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_bodartha`
--
ALTER TABLE `settings_bodartha`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_department`
--
ALTER TABLE `settings_department`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_direction`
--
ALTER TABLE `settings_direction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_disable_type`
--
ALTER TABLE `settings_disable_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_district`
--
ALTER TABLE `settings_district`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_document`
--
ALTER TABLE `settings_document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_eutype`
--
ALTER TABLE `settings_eutype`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_home_type`
--
ALTER TABLE `settings_home_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_letter_subject`
--
ALTER TABLE `settings_letter_subject`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_local_body`
--
ALTER TABLE `settings_local_body`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_marriage_types`
--
ALTER TABLE `settings_marriage_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_office`
--
ALTER TABLE `settings_office`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_oldnew_address`
--
ALTER TABLE `settings_oldnew_address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_patra_category`
--
ALTER TABLE `settings_patra_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_patra_item`
--
ALTER TABLE `settings_patra_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_post`
--
ALTER TABLE `settings_post`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_relation`
--
ALTER TABLE `settings_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_road_type`
--
ALTER TABLE `settings_road_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_service`
--
ALTER TABLE `settings_service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_session`
--
ALTER TABLE `settings_session`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_state`
--
ALTER TABLE `settings_state`
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
-- Indexes for table `settings_ward_worker`
--
ALTER TABLE `settings_ward_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_work`
--
ALTER TABLE `settings_work`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings_worker`
--
ALTER TABLE `settings_worker`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `set_up`
--
ALTER TABLE `set_up`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_settings`
--
ALTER TABLE `site_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sthai_basobas`
--
ALTER TABLE `sthai_basobas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sthai_niyukti`
--
ALTER TABLE `sthai_niyukti`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suchi_darta`
--
ALTER TABLE `suchi_darta`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_clear`
--
ALTER TABLE `tax_clear`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tax_clearance`
--
ALTER TABLE `tax_clearance`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `template_form`
--
ALTER TABLE `template_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tin_pusta_pramanit`
--
ALTER TABLE `tin_pusta_pramanit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tin_pusta_pramanit_detail`
--
ALTER TABLE `tin_pusta_pramanit_detail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `unmarried_en`
--
ALTER TABLE `unmarried_en`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `upgrade_postion`
--
ALTER TABLE `upgrade_postion`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `yain`
--
ALTER TABLE `yain`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abibhahit_pramanpatra`
--
ALTER TABLE `abibhahit_pramanpatra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `address_verifiaction_en`
--
ALTER TABLE `address_verifiaction_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `add_classroom`
--
ALTER TABLE `add_classroom`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `annual_income_en`
--
ALTER TABLE `annual_income_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `antarik_basai_sarai`
--
ALTER TABLE `antarik_basai_sarai`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `antarik_basai_sarai_detail`
--
ALTER TABLE `antarik_basai_sarai_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `apanga_pramanpatra`
--
ALTER TABLE `apanga_pramanpatra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `arthik_saheta`
--
ALTER TABLE `arthik_saheta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `asthai_basobas`
--
ALTER TABLE `asthai_basobas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bato_kayam`
--
ALTER TABLE `bato_kayam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bebasaya_banda`
--
ALTER TABLE `bebasaya_banda`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bebasaya_darta`
--
ALTER TABLE `bebasaya_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bebasaya_sifaris`
--
ALTER TABLE `bebasaya_sifaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `bibaha_pramanit`
--
ALTER TABLE `bibaha_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bidhut_jadan`
--
ALTER TABLE `bidhut_jadan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `birth_certificate_en`
--
ALTER TABLE `birth_certificate_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `chalani`
--
ALTER TABLE `chalani`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `charkilla_details`
--
ALTER TABLE `charkilla_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `char_killa`
--
ALTER TABLE `char_killa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `citizenship_sifaris`
--
ALTER TABLE `citizenship_sifaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `citizen_certificate`
--
ALTER TABLE `citizen_certificate`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `citizen_certificate_pratilipi`
--
ALTER TABLE `citizen_certificate_pratilipi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `court_fee`
--
ALTER TABLE `court_fee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `darta`
--
ALTER TABLE `darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `farak_hijje`
--
ALTER TABLE `farak_hijje`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `farak_janma_miti`
--
ALTER TABLE `farak_janma_miti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `farak_nam_thar`
--
ALTER TABLE `farak_nam_thar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `fiscal_year_end_date`
--
ALTER TABLE `fiscal_year_end_date`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `ghar_jagga_hakdar`
--
ALTER TABLE `ghar_jagga_hakdar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ghar_jagga_namsari`
--
ALTER TABLE `ghar_jagga_namsari`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ghar_kayam`
--
ALTER TABLE `ghar_kayam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ghar_patala`
--
ALTER TABLE `ghar_patala`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `hakdar_pramanit`
--
ALTER TABLE `hakdar_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `home_recommend`
--
ALTER TABLE `home_recommend`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `home_road_certify`
--
ALTER TABLE `home_road_certify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `home_road_certify_land`
--
ALTER TABLE `home_road_certify_land`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `income_details_en`
--
ALTER TABLE `income_details_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_verification`
--
ALTER TABLE `income_verification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `income_verification_detail`
--
ALTER TABLE `income_verification_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `janma_miti_pramanit`
--
ALTER TABLE `janma_miti_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jet_machine`
--
ALTER TABLE `jet_machine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `khanepani_jadan`
--
ALTER TABLE `khanepani_jadan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kitta_kat_sifaris`
--
ALTER TABLE `kitta_kat_sifaris`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `kotha_khali_suchana`
--
ALTER TABLE `kotha_khali_suchana`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `lalpurja_pratilipi`
--
ALTER TABLE `lalpurja_pratilipi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `land_category`
--
ALTER TABLE `land_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `letter_head`
--
ALTER TABLE `letter_head`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `married_en`
--
ALTER TABLE `married_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `maujuda_suchi`
--
ALTER TABLE `maujuda_suchi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mirtyu_darta`
--
ALTER TABLE `mirtyu_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `mohi_lagat`
--
ALTER TABLE `mohi_lagat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `naamsari_jagga_wiwaran`
--
ALTER TABLE `naamsari_jagga_wiwaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nabalak_pramanit`
--
ALTER TABLE `nabalak_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `name_verification_en`
--
ALTER TABLE `name_verification_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nata_pramanit`
--
ALTER TABLE `nata_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `nata_pramanit_detail`
--
ALTER TABLE `nata_pramanit_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `prabhidik_mulyankan`
--
ALTER TABLE `prabhidik_mulyankan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `print_details`
--
ALTER TABLE `print_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `property_detail_en`
--
ALTER TABLE `property_detail_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `property_valuation`
--
ALTER TABLE `property_valuation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `property_valuation_detail`
--
ALTER TABLE `property_valuation_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `property_valuation_en`
--
ALTER TABLE `property_valuation_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relation_members`
--
ALTER TABLE `relation_members`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `relation_ship`
--
ALTER TABLE `relation_ship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sachiwalaya_darta`
--
ALTER TABLE `sachiwalaya_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sadak_khanne_swikriti`
--
ALTER TABLE `sadak_khanne_swikriti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `salary_approval`
--
ALTER TABLE `salary_approval`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha_darta`
--
ALTER TABLE `sanstha_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha_darta_pramanpatra`
--
ALTER TABLE `sanstha_darta_pramanpatra`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sanstha_nabikaran`
--
ALTER TABLE `sanstha_nabikaran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sawari_pass`
--
ALTER TABLE `sawari_pass`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scholarship`
--
ALTER TABLE `scholarship`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `scholarship_detail`
--
ALTER TABLE `scholarship_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `settings_bodartha`
--
ALTER TABLE `settings_bodartha`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `settings_department`
--
ALTER TABLE `settings_department`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=34;
--
-- AUTO_INCREMENT for table `settings_direction`
--
ALTER TABLE `settings_direction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings_disable_type`
--
ALTER TABLE `settings_disable_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `settings_document`
--
ALTER TABLE `settings_document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `settings_eutype`
--
ALTER TABLE `settings_eutype`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_home_type`
--
ALTER TABLE `settings_home_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `settings_letter_subject`
--
ALTER TABLE `settings_letter_subject`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=61;
--
-- AUTO_INCREMENT for table `settings_local_body`
--
ALTER TABLE `settings_local_body`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=754;
--
-- AUTO_INCREMENT for table `settings_marriage_types`
--
ALTER TABLE `settings_marriage_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_office`
--
ALTER TABLE `settings_office`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_oldnew_address`
--
ALTER TABLE `settings_oldnew_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `settings_patra_category`
--
ALTER TABLE `settings_patra_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `settings_patra_item`
--
ALTER TABLE `settings_patra_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=227;
--
-- AUTO_INCREMENT for table `settings_post`
--
ALTER TABLE `settings_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `settings_relation`
--
ALTER TABLE `settings_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `settings_road_type`
--
ALTER TABLE `settings_road_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_service`
--
ALTER TABLE `settings_service`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `settings_session`
--
ALTER TABLE `settings_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `settings_state`
--
ALTER TABLE `settings_state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `settings_ward`
--
ALTER TABLE `settings_ward`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `settings_ward_worker`
--
ALTER TABLE `settings_ward_worker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings_work`
--
ALTER TABLE `settings_work`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `settings_worker`
--
ALTER TABLE `settings_worker`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `set_up`
--
ALTER TABLE `set_up`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sthai_basobas`
--
ALTER TABLE `sthai_basobas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `sthai_niyukti`
--
ALTER TABLE `sthai_niyukti`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suchi_darta`
--
ALTER TABLE `suchi_darta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tax_clear`
--
ALTER TABLE `tax_clear`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tax_clearance`
--
ALTER TABLE `tax_clearance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `template_form`
--
ALTER TABLE `template_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tin_pusta_pramanit`
--
ALTER TABLE `tin_pusta_pramanit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tin_pusta_pramanit_detail`
--
ALTER TABLE `tin_pusta_pramanit_detail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `unmarried_en`
--
ALTER TABLE `unmarried_en`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `upgrade_postion`
--
ALTER TABLE `upgrade_postion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `yain`
--
ALTER TABLE `yain`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
