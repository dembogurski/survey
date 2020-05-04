/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.7.26 : Database - survey
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`survey` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `survey`;

/*Table structure for table `disp_x_persona` */

DROP TABLE IF EXISTS `disp_x_persona`;

CREATE TABLE `disp_x_persona` (
  `id` int(11) NOT NULL,
  `cod_disp` varchar(10) NOT NULL,
  PRIMARY KEY (`id`,`cod_disp`),
  KEY `Ref14` (`id`),
  KEY `Ref25` (`cod_disp`),
  CONSTRAINT `Refdispositivos51` FOREIGN KEY (`cod_disp`) REFERENCES `dispositivos` (`cod_disp`),
  CONSTRAINT `Refencuestas41` FOREIGN KEY (`id`) REFERENCES `encuestas` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `disp_x_persona` */

LOCK TABLES `disp_x_persona` WRITE;

UNLOCK TABLES;

/*Table structure for table `dispositivos` */

DROP TABLE IF EXISTS `dispositivos`;

CREATE TABLE `dispositivos` (
  `cod_disp` varchar(10) NOT NULL,
  `descrip` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_disp`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `dispositivos` */

LOCK TABLES `dispositivos` WRITE;

insert  into `dispositivos`(`cod_disp`,`descrip`) values ('CM','Computadora de Mesa');
insert  into `dispositivos`(`cod_disp`,`descrip`) values ('NB','Notebook');
insert  into `dispositivos`(`cod_disp`,`descrip`) values ('SP','Telefono Smart Phone');
insert  into `dispositivos`(`cod_disp`,`descrip`) values ('TB','Tablet');

UNLOCK TABLES;

/*Table structure for table `encuestas` */

DROP TABLE IF EXISTS `encuestas`;

CREATE TABLE `encuestas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(200) NOT NULL,
  `doc` varchar(30) DEFAULT NULL,
  `fecha_nac` date DEFAULT NULL,
  `cod_estudio` varchar(10) NOT NULL,
  `acceso_internet` varchar(10) DEFAULT NULL,
  `fecha` date NOT NULL,
  `geoloc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Ref32` (`cod_estudio`),
  CONSTRAINT `Refniveles_estudios21` FOREIGN KEY (`cod_estudio`) REFERENCES `niveles_estudios` (`cod_estudio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `encuestas` */

LOCK TABLES `encuestas` WRITE;

UNLOCK TABLES;

/*Table structure for table `niveles_estudios` */

DROP TABLE IF EXISTS `niveles_estudios`;

CREATE TABLE `niveles_estudios` (
  `cod_estudio` varchar(30) NOT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`cod_estudio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `niveles_estudios` */

LOCK TABLES `niveles_estudios` WRITE;

insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('PrimariaC','Estudios Primarios Completos');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('PrimariaIC','Estudios Primarios Incompletos');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('SE','Sin estudios(Estudios Primarios)');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('SecundariaC','Estudios Secundarios Completos');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('SecundariaI','Estudios Secundarios Inconpletos');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('TerciarioC','Estudios Terciarios Completos (Postgrado,Masteriado o Doctorado, PHD)');
insert  into `niveles_estudios`(`cod_estudio`,`descripcion`) values ('TerciarioI','Estudios Terciarios Incompletos');

UNLOCK TABLES;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
