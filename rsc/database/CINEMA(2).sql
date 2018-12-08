/*
SQLyog Community v13.1.0 (64 bit)
MySQL - 8.0.13 : Database - cinema
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cinema` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */;

USE `cinema`;

/*Table structure for table `classify` */

DROP TABLE IF EXISTS `classify`;

CREATE TABLE `classify` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `NAME` char(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `classify` */

insert  into `classify`(`ID`,`NAME`) values 
(1,'喜剧'),
(2,'科幻'),
(3,'爱情'),
(4,'');

/*Table structure for table `order` */

DROP TABLE IF EXISTS `order`;

CREATE TABLE `order` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `LOGNAME` char(255) NOT NULL,
  `MESS` char(255) NOT NULL,
  `SUM` float NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `order` */

/*Table structure for table `ticket` */

DROP TABLE IF EXISTS `ticket`;

CREATE TABLE `ticket` (
  `NUMBER` char(255) NOT NULL,
  `FNAME` char(255) DEFAULT NULL,
  `DIRECTOR` char(255) DEFAULT NULL,
  `DATE` char(255) DEFAULT NULL,
  `PRICE` float DEFAULT NULL,
  `PIC` char(255) NOT NULL,
  `MESS` char(255) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`NUMBER`),
  KEY `ID` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `ticket` */

insert  into `ticket`(`NUMBER`,`FNAME`,`DIRECTOR`,`DATE`,`PRICE`,`PIC`,`MESS`,`ID`) values 
('001','泰囧','徐峥','2018-12-08',35,'1','史上最爆笑泰国旅游片',1),
('002','冰川时代2','沙尔丹哈','2018-12-08',55,'2','冰河时代结束动物何去何从',1),
('003','喜剧王','周星驰','2018-12-09',45,'3','中国最伟大的悲喜剧',1),
('004','功夫熊猫','马克奥斯本','2018-12-09',55,'4','大熊猫太可爱啦',1),
('005','西虹市首富','沈腾','2018-12-10',35,'5','你有办法一个月花掉三百亿吗',1),
('006','火星救援','雷德斯','2018-12-10',56,'6','一个人如何在火星生存',2),
('007','最佳玩家','斯皮尔伯格','2018-12-09',88,'7','这个电影里面有你数不完的彩蛋！',2),
('008','星球大战','卢卡斯','2018-12-08',55,'8','星战！最伟大的星战',2),
('009','未来警察','王晶','2018-12-07',66,'9','王晶出品，大部分都烂片',2),
('010','明日边缘','道格里曼','2018-12-07',45,'10','末世战争，全球无人幸免',2),
('011','夏有乔木','赵真奎','2018-12-11',32,'11','很不幸又是烂片',3),
('012','我们','刘一','2018-12-09',35,'12','匆匆那年我们还是...',3),
('013','我们的爱情故事','卢成','2018-12-07',40,'13','乡村爱情真香~',3),
('014','爱情公寓','韦正','2018-12-11',45,'14','挂羊头卖狗肉',3),
('015','非常完美','章子怡','2018-12-09',55,'15','很不幸，国产爱情大多烂片',3),
('016','绣春刀','陆阳','2018-12-10',28,'16','不错的武侠电影，一段江湖往事',4),
('017','天降雄狮','李仁港','2018-12-11',48,'17','成龙大哥宝刀未老',4),
('018','惊天魔盗团','路易斯','2018-12-10',69,'18','天才魔术师开展奇幻表演！',4),
('019','警察故事','唐季礼','2018-12-11',45,'19','没有第一部好看',4),
('020','绝命追凶','吕翼谋','2018-12-11',54,'20',NULL,5);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `LOGNAME` char(255) NOT NULL,
  `PASSWORD` char(255) NOT NULL,
  `PHONE` char(255) NOT NULL,
  `ADDRESS` char(255) NOT NULL,
  `REALNAME` char(255) NOT NULL,
  PRIMARY KEY (`LOGNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
