-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.6.7-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 company.tb_login_log 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_login_log` (
  `seq` int(11) DEFAULT 0 COMMENT '유저키값',
  `name` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '이름',
  `ip` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '아이피',
  `date` datetime DEFAULT NULL COMMENT '로그인날자'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='로그인 로그';

-- 테이블 데이터 company.tb_login_log:~17 rows (대략적) 내보내기
INSERT INTO `tb_login_log` (`seq`, `name`, `ip`, `date`) VALUES
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 12:12:59'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 14:26:28'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 14:51:04'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 14:53:32'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 14:54:37'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 15:16:51'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 15:18:57'),
	(0, NULL, '0:0:0:0:0:0:0:1', '2022-05-23 15:26:49'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-05-23 15:33:03'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-05-24 09:36:51'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-05-25 09:16:55'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-05-30 11:22:33'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-05-30 16:43:16'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-06-07 12:33:10'),
	(7, '김미약', '0:0:0:0:0:0:0:1', '2022-06-07 14:46:06'),
	(1, 'asdsad', '0:0:0:0:0:0:0:1', '2022-06-07 15:11:50'),
	(1, 'asdsad', '0:0:0:0:0:0:0:1', '2022-06-07 15:12:01');

-- 테이블 company.tb_test 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_test` (
  `seq` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  `zzz` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`seq`),
  KEY `name` (`name`),
  KEY `ccc` (`zzz`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- 테이블 데이터 company.tb_test:~3 rows (대략적) 내보내기
INSERT INTO `tb_test` (`seq`, `name`, `zzz`) VALUES
	(1, 'one', 'bbb'),
	(2, 'two', 'aaaa'),
	(3, 'qqqq', 'cccc');

-- 테이블 company.tb_test2 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_test2` (
  `seq` int(11) DEFAULT NULL,
  `test_seq` int(11) DEFAULT NULL,
  `sort` varchar(50) DEFAULT '',
  `user_seq` int(11) DEFAULT NULL,
  `date2` varchar(50) DEFAULT '',
  KEY `인덱스 1` (`test_seq`),
  CONSTRAINT `test` FOREIGN KEY (`test_seq`) REFERENCES `tb_test` (`seq`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- 테이블 데이터 company.tb_test2:~4 rows (대략적) 내보내기
INSERT INTO `tb_test2` (`seq`, `test_seq`, `sort`, `user_seq`, `date2`) VALUES
	(2, 3, 'A', 255, '202204'),
	(3, 2, 'A', 255, '202205'),
	(4, 3, 'B', NULL, ''),
	(5, 3, '', NULL, '');

-- 테이블 company.tb_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_user` (
  `seq` int(11) NOT NULL AUTO_INCREMENT COMMENT '기본키',
  `name` varchar(50) COLLATE utf8mb3_unicode_ci DEFAULT '' COMMENT '이름',
  `id` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '' COMMENT '아이디',
  `pwd` varchar(200) COLLATE utf8mb3_unicode_ci DEFAULT '' COMMENT '패스워드',
  `phone` varchar(13) COLLATE utf8mb3_unicode_ci DEFAULT '' COMMENT '폰',
  `address` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '' COMMENT '주소',
  `email` varchar(100) COLLATE utf8mb3_unicode_ci DEFAULT '',
  `department` tinyint(4) NOT NULL DEFAULT 0 COMMENT '부서 9:대표,1:개발,2:운영,3:인사',
  `position` tinyint(4) NOT NULL DEFAULT 0 COMMENT '직급 1:인턴, 2:선임, 3:책임, 9:대표',
  `status` tinyint(4) NOT NULL DEFAULT 0 COMMENT '상태 1:유지 , 9:삭제',
  `memo` text COLLATE utf8mb3_unicode_ci DEFAULT NULL COMMENT '메모',
  `reg_date` datetime DEFAULT NULL COMMENT '등록일',
  `mod_date` datetime DEFAULT NULL COMMENT '수정일',
  PRIMARY KEY (`seq`)
) ENGINE=InnoDB AUTO_INCREMENT=1393 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci COMMENT='유저 테이블\r\n';

-- 테이블 데이터 company.tb_user:~7 rows (대략적) 내보내기
INSERT INTO `tb_user` (`seq`, `name`, `id`, `pwd`, `phone`, `address`, `email`, `department`, `position`, `status`, `memo`, `reg_date`, `mod_date`) VALUES
	(1, 'asdsad', 'asdsadas', '$2a$10$nNMzWzQU1al9kkVFUagime/ycK.S/eTvejrEYphThA1HkPpAwYR3C', '', '', '', 1, 1, 1, 'ㅁㄴㅇㅁㄴㅇ', '2022-05-23 17:02:43', NULL),
	(2, 'cxvxcv', '12121', '2121', '', '', '', 1, 1, 1, NULL, '2022-05-23 17:02:42', NULL),
	(3, 'qaqa', 'zczcz', '', '', '', '', 9, 1, 1, NULL, '2022-05-23 17:02:42', NULL),
	(4, 'qq', 'qq', '$2a$10$82k2Gk87MNztULu4d53avO4FJ4QW5d2XXLwf.TYsaw9lVhlK2iPIm', '123', '123', '', 9, 1, 1, NULL, '2022-05-23 17:02:42', NULL),
	(5, '김진수', 'rlawlstn', '$2a$10$BMbc5O4NPUqUtNlxv5j8GOK8aY.b.TTy3.RN2fDmoIpCslWI39.Si', '010-8779-5621', '서울 구로구 17-5', '', 1, 1, 1, NULL, '2022-05-23 17:02:41', NULL),
	(6, '김웅빈', 'rladndqls', '$2a$10$G01HhqweojxV1WxLkZX4UOgJn4k39lYYbvRN4QP2WTBWokCCTPtyK', '010-4878-7897', '구로구 14', '', 9, 9, 1, NULL, '2022-05-23 17:02:41', NULL),
	(7, '김미약', 'a', '$2a$10$OoHxZ7U2X9Y7zLGDghSaAOZKjIgMRGoCQHDarDnmAelS9qaabhSXa', '011-0878-9999', '동산', '', 1, 2, 1, NULL, '2022-05-23 12:10:17', NULL);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
