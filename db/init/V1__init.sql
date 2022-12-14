CREATE TABLE `tb_trip` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(66) NOT NULL,
  `email` varchar(100) NOT NULL,
  `flight_bgt` decimal(10,0) NOT NULL,
  `hotel_bgt` decimal(10,0) NOT NULL,
  `att_bgt` decimal(10,0) NOT NULL,
  `trsp_bgt` decimal(10,0) NOT NULL,
  `food_bgt` decimal(10,0) NOT NULL,
  `other_bgt` decimal(10,0) NOT NULL,
  `total_bgt` decimal(10,0) NOT NULL,
  `no_of_dest` int NOT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tb_dest_cd` (
  `id` int NOT NULL,
  `ctry` varchar(50) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE `tb_dest` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trip_id` int DEFAULT NULL,
  `ctry` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `days` int DEFAULT NULL,
  `created_by` varchar(20) NOT NULL,
  `created_dt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `FKnxdiy432nina5wlm3v6jftnji` FOREIGN KEY (`trip_id`) REFERENCES `tb_trip` (`id`)
);

CREATE TABLE `tb_usr` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usr_nam` varchar(20) NOT NULL,
  `pwd` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_no` varchar(30) NOT NULL,
  `del_ind` varchar(1) NOT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);

