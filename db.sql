/*
SQLyog Ultimate v11.3 (64 bit)
MySQL - 5.7.32-log : Database - yiyuanyaopinguanli
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`yiyuanyaopinguanli` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `yiyuanyaopinguanli`;

/*Table structure for table `config` */

DROP TABLE IF EXISTS `config`;

CREATE TABLE `config` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='配置文件';

/*Data for the table `config` */

/*Table structure for table `dictionary` */

DROP TABLE IF EXISTS `dictionary`;

CREATE TABLE `dictionary` (
  `id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int(11) DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int(11) DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='字典表';

/*Data for the table `dictionary` */

insert  into `dictionary`(`id`,`dic_code`,`dic_name`,`code_index`,`index_name`,`super_id`,`beizhu`,`create_time`) values (1,'danwei_types','药品单位',1,'药品单位1',NULL,NULL,'2022-03-29 15:18:34'),(2,'danwei_types','药品单位',2,'药品单位2',NULL,NULL,'2022-03-29 15:18:34'),(3,'danwei_types','药品单位',3,'药品单位3',NULL,NULL,'2022-03-29 15:18:34'),(4,'yaopin_types','药品类型',1,'药品类型1',NULL,NULL,'2022-03-29 15:18:34'),(5,'yaopin_types','药品类型',2,'药品类型2',NULL,NULL,'2022-03-29 15:18:34'),(6,'yaopin_types','药品类型',3,'药品类型3',NULL,NULL,'2022-03-29 15:18:34'),(7,'yaopin_churu_inout_types','出入库类型',1,'出库',NULL,NULL,'2022-03-29 15:18:34'),(8,'yaopin_churu_inout_types','出入库类型',2,'入库',NULL,NULL,'2022-03-29 15:18:34'),(9,'quyaojilu_types','类型',1,'取药',NULL,NULL,'2022-03-29 15:18:34'),(10,'quyaojilu_types','类型',2,'退药',NULL,NULL,'2022-03-29 15:18:34'),(11,'news_types','公告类型',1,'公告类型1',NULL,NULL,'2022-03-29 15:18:34'),(12,'news_types','公告类型',2,'公告类型2',NULL,NULL,'2022-03-29 15:18:34'),(13,'news_types','公告类型',3,'公告类型3',NULL,NULL,'2022-03-29 15:18:34'),(14,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-29 15:18:34'),(15,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-29 15:18:34'),(16,'sex_types','性别类型',1,'男',NULL,NULL,'2022-03-29 15:18:35'),(17,'sex_types','性别类型',2,'女',NULL,NULL,'2022-03-29 15:18:35');

/*Table structure for table `news` */

DROP TABLE IF EXISTS `news`;

CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `news_name` varchar(200) DEFAULT NULL COMMENT '公告标题  Search111 ',
  `news_types` int(11) DEFAULT NULL COMMENT '公告类型  Search111 ',
  `news_photo` varchar(200) DEFAULT NULL COMMENT '公告图片',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `news_content` text COMMENT '公告详情',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='公告信息';

/*Data for the table `news` */

insert  into `news`(`id`,`news_name`,`news_types`,`news_photo`,`insert_time`,`news_content`,`create_time`) values (1,'公告标题1',2,'http://localhost:8080/yiyuanyaopinguanli/upload/news1.jpg','2022-03-29 15:18:39','公告详情1','2022-03-29 15:18:39'),(2,'公告标题2',3,'http://localhost:8080/yiyuanyaopinguanli/upload/news2.jpg','2022-03-29 15:18:39','公告详情2','2022-03-29 15:18:39'),(3,'公告标题3',2,'http://localhost:8080/yiyuanyaopinguanli/upload/news3.jpg','2022-03-29 15:18:39','公告详情3','2022-03-29 15:18:39'),(4,'公告标题4',2,'http://localhost:8080/yiyuanyaopinguanli/upload/news4.jpg','2022-03-29 15:18:39','公告详情4','2022-03-29 15:18:39'),(5,'公告标题5',3,'http://localhost:8080/yiyuanyaopinguanli/upload/news5.jpg','2022-03-29 15:18:39','公告详情5','2022-03-29 15:18:39');

/*Table structure for table `quyaojilu` */

DROP TABLE IF EXISTS `quyaojilu`;

CREATE TABLE `quyaojilu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yaopin_id` int(11) DEFAULT NULL COMMENT '药品',
  `yonghu_id` int(11) DEFAULT NULL COMMENT '用户',
  `yuangong_id` int(11) DEFAULT NULL COMMENT '员工',
  `quyaojilu_number` int(11) DEFAULT NULL COMMENT '取药数量',
  `quyaojilu_types` int(11) DEFAULT NULL COMMENT '类型 Search111',
  `quyaojilu_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='取退记录';

/*Data for the table `quyaojilu` */

insert  into `quyaojilu`(`id`,`yaopin_id`,`yonghu_id`,`yuangong_id`,`quyaojilu_number`,`quyaojilu_types`,`quyaojilu_delete`,`create_time`) values (1,1,2,1,27,2,1,'2022-03-29 15:18:39'),(2,2,3,3,352,1,1,'2022-03-29 15:18:39'),(3,3,2,3,389,1,1,'2022-03-29 15:18:39'),(4,4,1,1,264,1,1,'2022-03-29 15:18:39'),(5,5,1,3,342,1,1,'2022-03-29 15:18:39');

/*Table structure for table `token` */

DROP TABLE IF EXISTS `token`;

CREATE TABLE `token` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='token表';

/*Data for the table `token` */

insert  into `token`(`id`,`userid`,`username`,`tablename`,`role`,`token`,`addtime`,`expiratedtime`) values (1,1,'admin','users','管理员','hf8msu0j3ilrvkoonfp7aa3fl3x5mjo0','2022-03-29 15:24:20','2022-03-29 16:37:44'),(2,1,'a1','yuangong','员工','zqlnbu7ofh8sfv39f858cs2amgpsaxph','2022-03-29 15:32:21','2022-03-29 16:32:22'),(3,1,'a1','yonghu','用户','w8r5gvvvb2rdexgfhqs2yys5lhv22cio','2022-03-29 15:34:15','2022-03-29 16:34:15');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户表';

/*Data for the table `users` */

insert  into `users`(`id`,`username`,`password`,`role`,`addtime`) values (1,'admin','admin','管理员','2022-05-01 00:00:00');

/*Table structure for table `yaopin` */

DROP TABLE IF EXISTS `yaopin`;

CREATE TABLE `yaopin` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yaopin_name` varchar(200) DEFAULT NULL COMMENT '药品名称 Search111',
  `yaopin_types` int(11) DEFAULT NULL COMMENT '药品类型 Search111',
  `yaopin_kucun_number` int(11) DEFAULT NULL COMMENT '药品库存',
  `danwei_types` int(11) DEFAULT NULL COMMENT '药品单位 Search111',
  `yaopin_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价',
  `yaopin_content` text COMMENT '详情',
  `yaopin_delete` int(11) DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='药品信息';

/*Data for the table `yaopin` */

insert  into `yaopin`(`id`,`yaopin_name`,`yaopin_types`,`yaopin_kucun_number`,`danwei_types`,`yaopin_new_money`,`yaopin_content`,`yaopin_delete`,`create_time`) values (1,'药品名称1',1,101,1,'496.48','详情1',1,'2022-03-29 15:18:39'),(2,'药品名称2',1,102,3,'385.69','详情2',1,'2022-03-29 15:18:39'),(3,'药品名称3',1,103,3,'189.91','详情3',1,'2022-03-29 15:18:39'),(4,'药品名称4',2,104,3,'322.50','详情4',1,'2022-03-29 15:18:39'),(5,'药品名称5',2,105,1,'350.24','详情5',1,'2022-03-29 15:18:39');

/*Table structure for table `yaopin_churu_inout` */

DROP TABLE IF EXISTS `yaopin_churu_inout`;

CREATE TABLE `yaopin_churu_inout` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yaopin_churu_inout_uuid_number` varchar(200) DEFAULT NULL COMMENT '出入库流水号',
  `yaopin_churu_inout_name` varchar(200) DEFAULT NULL COMMENT '出入库名称  Search111 ',
  `yaopin_churu_inout_types` int(11) DEFAULT NULL COMMENT '出入库类型',
  `yaopin_churu_inout_content` text COMMENT '备注',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='出入库';

/*Data for the table `yaopin_churu_inout` */

insert  into `yaopin_churu_inout`(`id`,`yaopin_churu_inout_uuid_number`,`yaopin_churu_inout_name`,`yaopin_churu_inout_types`,`yaopin_churu_inout_content`,`insert_time`,`create_time`) values (1,'16485383192855','出入库名称1',1,'备注1','2022-03-29 15:18:39','2022-03-29 15:18:39'),(2,'164853831928515','出入库名称2',1,'备注2','2022-03-29 15:18:39','2022-03-29 15:18:39'),(3,'16485383192857','出入库名称3',2,'备注3','2022-03-29 15:18:39','2022-03-29 15:18:39'),(4,'164853831928519','出入库名称4',1,'备注4','2022-03-29 15:18:39','2022-03-29 15:18:39'),(5,'164853831928514','出入库名称5',2,'备注5','2022-03-29 15:18:39','2022-03-29 15:18:39'),(6,'1648539113625','购买药品 1、2、3 各100份',2,'','2022-03-29 15:31:54','2022-03-29 15:31:54'),(7,'1648539189083','取 1、2、3 药品  100份',2,'','2022-03-29 15:33:09','2022-03-29 15:33:09'),(8,'1648539236869','取 1、2、3药品 200份',1,'','2022-03-29 15:33:57','2022-03-29 15:33:57');

/*Table structure for table `yaopin_churu_inout_list` */

DROP TABLE IF EXISTS `yaopin_churu_inout_list`;

CREATE TABLE `yaopin_churu_inout_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yaopin_churu_inout_id` int(11) DEFAULT NULL COMMENT '出入库',
  `yaopin_id` int(11) DEFAULT NULL COMMENT '药品',
  `yaopin_churu_inout_list_number` int(11) DEFAULT NULL COMMENT '操作数量',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '操作时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='出入库详情';

/*Data for the table `yaopin_churu_inout_list` */

insert  into `yaopin_churu_inout_list`(`id`,`yaopin_churu_inout_id`,`yaopin_id`,`yaopin_churu_inout_list_number`,`insert_time`,`create_time`) values (1,1,1,273,'2022-03-29 15:18:39','2022-03-29 15:18:39'),(2,2,2,357,'2022-03-29 15:18:39','2022-03-29 15:18:39'),(3,3,3,110,'2022-03-29 15:18:39','2022-03-29 15:18:39'),(4,4,4,275,'2022-03-29 15:18:39','2022-03-29 15:18:39'),(5,5,5,298,'2022-03-29 15:18:39','2022-03-29 15:18:39'),(6,6,1,100,'2022-03-29 15:31:54','2022-03-29 15:31:54'),(7,6,2,100,'2022-03-29 15:31:54','2022-03-29 15:31:54'),(8,6,3,100,'2022-03-29 15:31:54','2022-03-29 15:31:54'),(9,7,1,100,'2022-03-29 15:33:09','2022-03-29 15:33:09'),(10,7,2,100,'2022-03-29 15:33:09','2022-03-29 15:33:09'),(11,7,3,100,'2022-03-29 15:33:09','2022-03-29 15:33:09'),(12,8,1,200,'2022-03-29 15:33:57','2022-03-29 15:33:57'),(13,8,2,200,'2022-03-29 15:33:57','2022-03-29 15:33:57'),(14,8,3,200,'2022-03-29 15:33:57','2022-03-29 15:33:57');

/*Table structure for table `yonghu` */

DROP TABLE IF EXISTS `yonghu`;

CREATE TABLE `yonghu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_photo` varchar(255) DEFAULT NULL COMMENT '头像',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `yonghu_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户';

/*Data for the table `yonghu` */

insert  into `yonghu`(`id`,`username`,`password`,`yonghu_name`,`yonghu_photo`,`sex_types`,`yonghu_phone`,`yonghu_email`,`yonghu_delete`,`create_time`) values (1,'a1','123456','用户姓名1','http://localhost:8080/yiyuanyaopinguanli/upload/yonghu1.jpg',2,'17703786901','1@qq.com',1,'2022-03-29 15:18:39'),(2,'a2','123456','用户姓名2','http://localhost:8080/yiyuanyaopinguanli/upload/yonghu2.jpg',1,'17703786902','2@qq.com',1,'2022-03-29 15:18:39'),(3,'a3','123456','用户姓名3','http://localhost:8080/yiyuanyaopinguanli/upload/yonghu3.jpg',2,'17703786903','3@qq.com',1,'2022-03-29 15:18:39');

/*Table structure for table `yuangong` */

DROP TABLE IF EXISTS `yuangong`;

CREATE TABLE `yuangong` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yuangong_name` varchar(200) DEFAULT NULL COMMENT '员工姓名 Search111 ',
  `sex_types` int(11) DEFAULT NULL COMMENT '性别 Search111 ',
  `yuangong_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `yuangong_delete` int(11) DEFAULT '1' COMMENT '假删',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='员工';

/*Data for the table `yuangong` */

insert  into `yuangong`(`id`,`username`,`password`,`yuangong_name`,`sex_types`,`yuangong_phone`,`yuangong_delete`,`create_time`) values (1,'a1','123456','员工姓名1',1,'17703786901',1,'2022-03-29 15:18:39'),(2,'a2','123456','员工姓名2',2,'17703786902',1,'2022-03-29 15:18:39'),(3,'a3','123456','员工姓名3',2,'17703786903',1,'2022-03-29 15:18:39');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
