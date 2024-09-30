

USE `health`;


CREATE TABLE `body` (
                        `id` int(255) NOT NULL AUTO_INCREMENT,
                        `name` varchar(255) DEFAULT NULL,
                        `age` int(11) DEFAULT NULL,
                        `gender` varchar(10) DEFAULT NULL,
                        `height` float DEFAULT NULL,
                        `weight` float DEFAULT NULL,
                        `bloodSugar` float DEFAULT NULL,
                        `bloodPressureH` varchar(10) DEFAULT NULL,
                        `bloodPressureL` varchar(10) DEFAULT NULL,
                        `bloodLipid` float DEFAULT NULL,
                        `heart_rate` decimal(10,0) DEFAULT NULL,
                        `vision` int(10) DEFAULT NULL,
                        `sleep_duration` decimal(10,0) DEFAULT NULL,
                        `sleep_quality` text,
                        `smoking` tinyint(1) DEFAULT NULL,
                        `drinking` tinyint(1) DEFAULT NULL,
                        `exercise` tinyint(1) DEFAULT NULL,
                        `food_types` text,
                        `water_consumption` decimal(10,0) DEFAULT NULL,
                        `Date` datetime DEFAULT CURRENT_TIMESTAMP,
                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


insert  into `body`(`id`,`name`,`age`,`gender`,`height`,`weight`,`bloodSugar`,`bloodPressureH`,`bloodPressureL`,`bloodLipid`,`heart_rate`,`vision`,`sleep_duration`,`sleep_quality`,`smoking`,`drinking`,`exercise`,`food_types`,`water_consumption`,`Date`) values
                                                                                                                                                                                                                                                                 (NULL,'gss',25,'男',1.8,80,20,'20','10',20,100,100,9,'好',0,0,0,'豆类',3000,'2024-06-13 06:01:06'),
                                                                                                                                                                                                                                                                 (NULL,'Alice',25,'男',1.8,80,20,'25','10',23,80,120,9,'好',0,0,0,'豆类',3000,'2024-06-13 06:01:52'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,10,'15','10',20,80,20,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:29'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,8,'13','10',20,120,50,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:31'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,15,'20','10',20,70,65,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:32'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,21,'18','10',20,80,75,10,'好',1,1,1,'鱼类',1500,'2024-05-29 17:36:34'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,15,'10','10',20,110,80,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:38'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,17,'16','10',20,75,120,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:40'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,8,'25','10',20,130,150,10,'好',1,1,1,'鱼类',1500,'2024-06-13 17:36:43'),
                                                                                                                                                                                                                                                                 (NULL,'admin',20,'男',1.7,56,11,'17','10',20,80,150,10,'好',0,0,0,'鱼类',1500,'2024-06-13 17:36:45'),
                                                                                                                                                                                                                                                                 (NULL,'test',18,'男',1.8,50,20,'20','10',15,80,50,7,'好',0,0,0,'水果',2000,'2024-06-13 18:04:57'),
                                                                                                                                                                                                                                                                 (NULL,'test',18,'男',1.8,50,20,'20','10',15,80,100,7,'好',0,0,0,'水果',2000,'2024-06-13 18:05:03'),
                                                                                                                                                                                                                                                                 (NULL,'test',18,'男',1.8,50,20,'20','10',15,80,150,7,'好',0,0,0,'水果',2000,'2024-06-13 18:05:05'),
                                                                                                                                                                                                                                                                 (NULL,'test',18,'男',1.8,50,20,'20','10',15,80,200,7,'好',0,0,0,'水果',2000,'2024-06-13 18:05:08'),
                                                                                                                                                                                                                                                                 (NULL,'Alice',25,'男',1.8,80,26,'21','10',23,90,140,9,'好',0,0,0,'豆类',3000,'2024-06-13 06:01:52'),
                                                                                                                                                                                                                                                                 (NULL,'Alice',25,'男',1.8,80,26,'16','10',18,79,160,9,'好',0,0,0,'豆类',3000,'2024-06-03 06:01:52'),
                                                                                                                                                                                                                                                                 (NULL,'Alice',18,'男',1.8,50,20,'24','10',15,65,200,8,'好',0,0,0,'水果',1500,'2024-05-19 15:15:17'),
                                                                                                                                                                                                                                                                 (NULL,'admin',18,'男',1.8,50,25,'16','10',25,80,220,8,'好',0,0,0,'蔬菜',1500,'2024-06-13 15:23:27');



CREATE TABLE `user` (
                        `id` int(11) NOT NULL AUTO_INCREMENT,
                        `username` varchar(50) NOT NULL,
                        `password` varchar(100) DEFAULT NULL,
                        `number` varchar(255) DEFAULT NULL,
                        `role` int DEFAULT NULL,
                        `email` varchar(50) DEFAULT NULL,
                        `avatar` varchar(200) DEFAULT NULL,
                        PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


insert  into `user`(`id`,`username`,`password`,`number`,`role`,`email`,`avatar`) values
                                                                                     (1,'gss','123456','13343243242',1,'super@aliyun.com',''),
                                                                                     (2,'zhangsan','123456',NULL,1,'zhangsan@gmail.com',''),
                                                                                     (3,'lisi','123456',NULL,1,'lisi@gmail.com',''),
                                                                                     (4,'wangwu','123456',NULL,0,'wangwu@gmail.com',''),
                                                                                     (5,'zhaoer','123456',NULL,0,'zhaoer@gmail.com',''),
                                                                                     (6,'songliu','123456','4322432434',0,'songliu@gmail.com',''),
                                                                                     (13,'Alice','123456','234532111',0,'alice@example.com',''),
                                                                                     (14,'Bob','123456','13564736363',0,'bob@example.com',''),
                                                                                     (15,'Charlie','123456','25323626',0,'charlie@example.com',''),
                                                                                     (16,'David1','123456','145256264',0,'david@example.com',''),
                                                                                     (17,'Emma','123456','152334445',0,'emma@example.com',''),
                                                                                     (18,'Frank','123456','1566543646',0,'frank@example.com',''),
                                                                                     (19,'Grace','123456','1435253535',0,'grace@example.com',''),
                                                                                     (20,'Henry','123456','15325363463',0,'henry@example.com',''),
                                                                                     (21,'Isabella','123456','15353435',0,'isabella@example.com',''),
                                                                                     (22,'Jacob','123456','114523424',0,'jacob@example.com',''),
                                                                                     (31,'test','123456',NULL,0,'','');
