-- Host: 127.0.0.1    Database: lianshunet

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
-- Table structure for table `avatar`
--
CREATE TABLE `avatar` (
  `id` smallint(6) NOT NULL,
  `avatar_txt` varchar(20) DEFAULT NULL,
  `avatar_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `avatar`
-- 以下数据需要在项目启动前添加到数据库中
--
INSERT INTO `avatar` VALUES 
(1,'040601','resources/images/avatars/040601.jpg'),
(2,'040602','resources/images/avatars/040602.jpg'),
(3,'040603','resources/images/avatars/040603.jpg'),
(4,'040604','resources/images/avatars/040604.jpg'),
(5,'040605','resources/images/avatars/040605.jpg'),
(6,'040606','resources/images/avatars/040606.jpg'),
(7,'040607','resources/images/avatars/040607.jpg'),
(8,'040608','resources/images/avatars/040608.jpg'),
(9,'040609','resources/images/avatars/040609.jpg'),
(10,'040610','resources/images/avatars/040610.jpg');

--
-- Table structure for table `book`
--
CREATE TABLE `book` (
  `id` bigint(20) NOT NULL,
  `book_title` varchar(50) NOT NULL,
  `book_author` varchar(30) NOT NULL,
  `book_summary` text,
  `type_id` int(11) DEFAULT NULL,
  `download_times` int(11) DEFAULT NULL,
  `book_pubYear` date DEFAULT NULL,
  `book_file` varchar(100) DEFAULT NULL,
  `book_cover` varchar(100) DEFAULT NULL,
  `book_format` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book`,
-- 以下数据仅用于参考，无需手动添加
--
INSERT INTO `book` VALUES 
(12010601180407991,'三国演义','罗贯中','这是一本三国演义。。。',12,0,'2001-06-01','F:/lianshu/ebooks/经典文学/古典文学/三国演义.txt','F:/lianshu/bookCovers/经典文学/古典文学/三国演义.jpg','txt'),
(12950801180403252,'资治通鉴','司马光','这是一本资治通鉴',12,3,'1995-08-01','F:/lianshu/ebooks/经典文学/古典文学/资治通鉴.txt','F:/lianshu/bookCovers/经典文学/古典文学/资治通鉴.jpg','txt');

--
-- Table structure for table `book_type`
--
CREATE TABLE `book_type` (
  `id` int(11) NOT NULL,
  `book_large_type` int(11) NOT NULL,
  `book_small_type` int(11) NOT NULL,
  `large_type_name` varchar(20) NOT NULL,
  `small_type_name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `book_type`
-- 以下数据需要在项目启动前添加到数据库中
--
INSERT INTO `book_type` VALUES 
(11,1,1,'经典文学','现代文学'),(12,1,2,'经典文学','古典文学'),(13,1,3,'经典文学','国外文学'),
(14,1,4,'经典文学','纪实文学'),(15,1,5,'经典文学','诗词歌赋'),
(21,2,1,'通俗小说','武侠玄幻'),(22,2,2,'通俗小说','青春言情'),(23,2,3,'通俗小说','悬疑推理'),
(24,2,4,'通俗小说','历史军事'),(25,2,5,'通俗小说','职场生活'),
(31,3,1,'计算机类','编程语言'),(32,3,2,'计算机类','数据库'),(33,3,3,'计算机类','人工智能'),
(34,3,4,'计算机类','移动开发'),(35,3,5,'计算机类','图形图像'),
(41,4,1,'杂志期刊','科学技术'),(42,4,2,'杂志期刊','人文艺术'),(43,4,3,'杂志期刊','政治军事'),
(44,4,4,'杂志期刊','经济管理'),(45,4,5,'杂志期刊','娱乐休闲');

--
-- Table structure for table `contribution`
--
CREATE TABLE `contribution` (
  `id` smallint(6) NOT NULL,
  `level_txt` varchar(10) DEFAULT NULL,
  `lowerLimit` int(11) DEFAULT NULL,
  `upperLimit` int(11) DEFAULT NULL,
  `level_img` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contribution`
-- 以下数据需要在项目启动前添加到数据库中
--
INSERT INTO `contribution` VALUES 
(1,'普通会员',0,20,'/resources/images/level/level1.jpg'),
(2,'白银会员',21,50,'/resources/images/level/level2.jpg'),
(3,'黄金会员',51,100,'/resources/images/level/level3.jpg'),
(4,'铂金会员',101,200,'/resources/images/level/level4.jpg'),
(5,'钻石会员',201,999999,'/resources/images/level/level5.jpg');

--
-- Table structure for table `feedback`
--
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `loginedUser` bigint(20) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `suggestion` varchar(500) DEFAULT NULL,
  `status` int(2) NOT NULL,
  `postTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `feedback`
-- 以下数据仅用于参考，无需手动添加
--
INSERT INTO `feedback` VALUES (1,1,'782996468','正在测试中。。。',1,'2018-04-07 11:03:40');


--
-- Table structure for table `upload`
--
CREATE TABLE `upload` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uploader` bigint(20) NOT NULL,
  `uploadedBook` bigint(11) NOT NULL,
  `uploadedDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `upload`
-- 以下数据仅用于参考，无需手动添加
--
INSERT INTO `upload` VALUES (1,1,12950801180403252,'2018-04-03'),(2,1,12010601180407991,'2018-04-07');

--
-- Table structure for table `user`
--
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userCode` varchar(20) NOT NULL,
  `userPassword` varchar(20) NOT NULL,
  `userName` varchar(20) NOT NULL,
  `email` varchar(30) DEFAULT NULL,
  `avatarNum` smallint(11) DEFAULT NULL,
  `contribution` int(11) DEFAULT NULL,
  `creationDate` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
-- 以下数据仅用于参考，建议使用注册功能添加用户
--
INSERT INTO `user` VALUES (1,'admin','abc123','管理员','',8,6,'2018-04-03');

