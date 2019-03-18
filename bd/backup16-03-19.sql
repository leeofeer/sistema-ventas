/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.5.5-10.1.36-MariaDB : Database - lomi
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`lomi` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `lomi`;

/*Table structure for table `aperturacierre` */

DROP TABLE IF EXISTS `aperturacierre`;

CREATE TABLE `aperturacierre` (
  `id` int(11) NOT NULL,
  `fechaapertura` date NOT NULL,
  `horaapertura` time NOT NULL,
  `montoapertura` int(11) NOT NULL,
  `fechacierre` date DEFAULT NULL,
  `horacierra` time DEFAULT NULL,
  `montocierre` int(11) DEFAULT NULL,
  `idcaja` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `caja_aperturacierre_fk` (`idcaja`),
  KEY `usuario_apercierre_fk` (`idusuario`),
  KEY `sucursal_apercierre_fk` (`idsucursal`),
  CONSTRAINT `caja_aperturacierre_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sucursal_apercierre_fk` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`),
  CONSTRAINT `usuario_apercierre_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `aperturacierre` */

insert  into `aperturacierre`(`id`,`fechaapertura`,`horaapertura`,`montoapertura`,`fechacierre`,`horacierra`,`montocierre`,`idcaja`,`idusuario`,`idsucursal`) values (1,'2018-08-29','13:09:00',100000,'2018-09-14','00:00:00',200000,1,1,NULL),(2,'2018-09-05','10:08:00',50000,'2018-09-14','15:13:22',277000,1,1,NULL),(3,'2018-09-14','15:36:58',20000,'2018-09-14','15:37:51',66000,1,1,NULL),(4,'2018-09-15','08:06:02',50000,'2018-09-19','23:18:46',297000,1,1,NULL),(5,'2018-09-19','23:19:02',50000,'2018-09-19','23:26:28',143000,1,1,NULL),(6,'2018-09-19','23:27:09',50000,'2018-09-19','23:28:22',50000,1,1,NULL),(7,'2018-09-19','23:28:32',50000,'2018-09-19','23:32:45',120000,1,2,NULL),(8,'2018-09-20','10:05:54',10000,'2018-09-25','11:07:59',10000,1,1,NULL),(9,'2018-09-25','11:45:12',10000,'2018-09-26','09:38:49',72000,1,2,NULL),(10,'2019-01-04','15:12:26',50000,'2019-01-04',NULL,NULL,3,2,1),(11,'2019-01-08','07:30:14',50000,'2019-01-08','14:06:27',125500,1,2,1),(12,'2019-01-08','14:55:46',50000,'2019-01-08','15:18:12',98000,3,1,1),(13,'2019-01-14','10:24:01',50000,'2019-01-14','20:35:41',50000,3,4,1),(14,'2019-01-14','20:50:22',50000,'2019-01-14','20:59:43',50000,4,4,1),(15,'2019-01-14','21:08:14',50000,'2019-01-14','21:11:21',86000,4,4,1),(16,'2019-01-14','21:12:27',50000,'2019-01-14','21:15:01',150000,4,4,1),(17,'2019-01-17','11:20:32',50000,'2019-01-17','11:24:42',70000,1,4,1),(18,'2019-01-17','18:10:24',20000,'2019-01-17','19:31:32',20000,4,4,1),(19,'2019-01-18','21:20:40',0,'2019-01-18','22:03:54',77000,1,4,1),(20,'2019-02-20','14:52:25',50000,'0000-00-00','00:00:00',NULL,1,2,1),(21,'2019-02-20','15:03:53',50000,'2019-02-20','15:16:09',88000,1,4,1);

/*Table structure for table `bancoemisor` */

DROP TABLE IF EXISTS `bancoemisor`;

CREATE TABLE `bancoemisor` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `bancoemisor` */

insert  into `bancoemisor`(`id`,`descripcion`) values (1,'Vision'),(2,'Itau');

/*Table structure for table `caja` */

DROP TABLE IF EXISTS `caja`;

CREATE TABLE `caja` (
  `id` int(11) NOT NULL,
  `nrocaja` int(11) NOT NULL,
  `estado` char(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `caja` */

insert  into `caja`(`id`,`nrocaja`,`estado`) values (1,1,'HABILITADO'),(2,3,'CERRADO'),(3,6,'HABILITADO'),(4,20,'HABILITADO'),(5,140,'HABILITADO');

/*Table structure for table `cargos` */

DROP TABLE IF EXISTS `cargos`;

CREATE TABLE `cargos` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cargos` */

insert  into `cargos`(`id`,`descripcion`) values (1,'Cocinero'),(2,'Cajero'),(3,'Desarrollador');

/*Table structure for table `categoria` */

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `categoria` */

insert  into `categoria`(`id`,`descripcion`) values (1,'BEBIDAS'),(2,'COMIDAS');

/*Table structure for table `cheque` */

DROP TABLE IF EXISTS `cheque`;

CREATE TABLE `cheque` (
  `id` int(11) NOT NULL,
  `nrocheque` int(11) NOT NULL,
  `vencimiento` date NOT NULL,
  `idtipocheque` int(11) NOT NULL,
  `idbancoemisor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tipocheque_cheque_fk` (`idtipocheque`),
  KEY `bancoemisor_cheque_fk` (`idbancoemisor`),
  CONSTRAINT `bancoemisor_cheque_fk` FOREIGN KEY (`idbancoemisor`) REFERENCES `bancoemisor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipocheque_cheque_fk` FOREIGN KEY (`idtipocheque`) REFERENCES `tipocheque` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cheque` */

/*Table structure for table `ciudades` */

DROP TABLE IF EXISTS `ciudades`;

CREATE TABLE `ciudades` (
  `id` int(11) NOT NULL,
  `descripcion` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ciudades` */

insert  into `ciudades`(`id`,`descripcion`) values (1,'Asuncion'),(2,'NANAWA'),(3,'luque'),(4,'san lorenzo'),(5,'lambare'),(6,'ABC'),(10,'lambare');

/*Table structure for table `clientes` */

DROP TABLE IF EXISTS `clientes`;

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `razonsocial` char(40) NOT NULL,
  `documento` varchar(15) NOT NULL,
  `direccion` varchar(50) DEFAULT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `idciudad` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `ciudades_clientes_fk` (`idciudad`),
  CONSTRAINT `ciudades_clientes_fk` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `clientes` */

insert  into `clientes`(`id`,`razonsocial`,`documento`,`direccion`,`telefono`,`idciudad`) values (2,'Sin nombre','0','--','--',1),(4,'WALTER diaz','233223','walberto moreno','2323',2),(5,'Maria Rodriguez','4675432','C.A Lopez 654','+595972154874',1),(7,'Rodrigo Lopez','1234567','Av. 453','+595072343212',1),(8,'Ivan Bogarin','1234321','Av. Fulgencio R. Moreno','+59599123432',1),(9,'SILVIA','123','AL LADO DE CASA','+595981213213',2);

/*Table structure for table `cobro_detalle` */

DROP TABLE IF EXISTS `cobro_detalle`;

CREATE TABLE `cobro_detalle` (
  `idfactura` int(11) NOT NULL,
  `idcobro` int(11) NOT NULL,
  `idtipocobro` int(11) DEFAULT NULL,
  `montoefectivo` int(11) NOT NULL,
  `montotarjeta` int(11) DEFAULT NULL,
  `montocheque` int(11) DEFAULT NULL,
  `iva10` int(11) DEFAULT NULL,
  `montototal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idfactura`,`idcobro`),
  KEY `tipocobro_cobro_detalle_fk` (`idtipocobro`),
  KEY `cobros_cobro_detalle_fk` (`idcobro`),
  CONSTRAINT `cobros_cobro_detalle_fk` FOREIGN KEY (`idcobro`) REFERENCES `cobros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facturaventa_cobro_detalle_fk` FOREIGN KEY (`idfactura`) REFERENCES `facturaventa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipocobro_cobro_detalle_fk` FOREIGN KEY (`idtipocobro`) REFERENCES `tipocobro` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobro_detalle` */

insert  into `cobro_detalle`(`idfactura`,`idcobro`,`idtipocobro`,`montoefectivo`,`montotarjeta`,`montocheque`,`iva10`,`montototal`) values (1,1,1,27000,NULL,NULL,2455,24545),(2,2,1,7000,NULL,NULL,636,6364),(3,5,1,46000,NULL,NULL,4182,41818),(4,7,1,94000,NULL,NULL,8545,85455),(5,9,1,40000,NULL,NULL,3636,36364),(6,3,1,73000,NULL,NULL,6636,66364),(7,4,1,120000,NULL,NULL,10909,109091),(8,6,1,97000,NULL,NULL,8818,88182),(9,8,1,16000,NULL,NULL,1455,14545),(10,10,1,0,NULL,NULL,0,0),(11,11,1,93000,NULL,NULL,8455,84545),(12,12,1,70000,NULL,NULL,6364,63636),(13,14,1,0,NULL,NULL,0,0),(14,13,1,62000,NULL,NULL,5636,56364),(15,16,1,54000,0,NULL,4909,49091),(19,15,1,21500,0,NULL,1955,19545),(20,17,1,48000,0,NULL,4364,43636),(21,18,1,36000,0,NULL,3273,32727),(22,19,1,100000,0,NULL,9091,90909),(23,20,1,20000,0,NULL,1818,18182),(24,21,1,21000,0,NULL,1909,19091),(25,22,1,14000,0,NULL,1273,12727),(26,23,1,10000,0,NULL,909,9091),(27,24,1,18000,0,NULL,1636,16364),(28,25,1,7000,0,NULL,636,6364),(29,26,1,7000,0,NULL,636,6364),(30,27,1,42000,0,NULL,3818,38182),(31,28,1,38000,0,NULL,3455,34545);

/*Table structure for table `cobros` */

DROP TABLE IF EXISTS `cobros`;

CREATE TABLE `cobros` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idcaja` int(11) NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `caja_cobros_fk` (`idcaja`),
  KEY `aperturacierre_cobros_fk` (`idaperturacierre`),
  CONSTRAINT `aperturacierre_cobros_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `caja_cobros_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `cobros` */

insert  into `cobros`(`id`,`fecha`,`idcaja`,`idaperturacierre`) values (1,'2018-09-11',1,3),(2,'2018-09-11',1,3),(3,'2018-09-13',1,3),(4,'2018-09-13',1,3),(5,'2018-09-14',1,3),(6,'2018-09-16',1,4),(7,'2018-09-17',1,4),(8,'2018-09-17',1,4),(9,'2018-09-19',1,4),(10,'2018-09-19',1,4),(11,'2018-09-19',1,5),(12,'2018-09-19',1,7),(13,'2018-09-25',1,9),(14,'2018-09-25',1,9),(15,'2019-01-07',1,11),(16,'2019-01-08',1,11),(17,'2019-01-08',3,12),(18,'2019-01-14',4,15),(19,'2019-01-14',4,16),(20,'2019-01-17',1,17),(21,'2019-01-18',1,19),(22,'2019-01-18',1,19),(23,'2019-01-18',1,19),(24,'2019-01-18',1,19),(25,'2019-01-18',1,19),(26,'2019-01-18',1,19),(27,'2019-02-20',1,20),(28,'2019-02-20',1,21);

/*Table structure for table `compras` */

DROP TABLE IF EXISTS `compras`;

CREATE TABLE `compras` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `fechaemision` date NOT NULL,
  `nrofactura` varchar(15) NOT NULL,
  `cuota` int(11) NOT NULL,
  `idtipofactura` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  `idordencompra` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_compras_fk` (`idsucursal`),
  KEY `usuarios_compras_fk` (`idusuario`),
  KEY `ordencompra_compras_fk` (`idordencompra`),
  KEY `tipofactura_facturaventa_compras_fk` (`idtipofactura`),
  CONSTRAINT `ordencompra_compras_fk` FOREIGN KEY (`idordencompra`) REFERENCES `ordencompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sucursal_compras_fk` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipofactura_facturaventa_compras_fk` FOREIGN KEY (`idtipofactura`) REFERENCES `tipofactura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_compras_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `compras` */

/*Table structure for table `deposito` */

DROP TABLE IF EXISTS `deposito`;

CREATE TABLE `deposito` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sucursal_deposito_fk` (`idsucursal`),
  CONSTRAINT `sucursal_deposito_fk` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `deposito` */

insert  into `deposito`(`id`,`descripcion`,`idsucursal`) values (1,'principal',1);

/*Table structure for table `detallecompra` */

DROP TABLE IF EXISTS `detallecompra`;

CREATE TABLE `detallecompra` (
  `idcompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idcompra`,`idinsumo`),
  KEY `insumos_detallecompra_compra_fk` (`idinsumo`),
  CONSTRAINT `compras_detallecompra_compra_fk` FOREIGN KEY (`idcompra`) REFERENCES `compras` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insumos_detallecompra_compra_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallecompra` */

/*Table structure for table `detallefacturaventa` */

DROP TABLE IF EXISTS `detallefacturaventa`;

CREATE TABLE `detallefacturaventa` (
  `idfactura` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  `iva10` int(11) NOT NULL,
  PRIMARY KEY (`idfactura`,`idpedido`),
  KEY `ped_detalleventa_fk` (`idpedido`),
  CONSTRAINT `facturaventa_detallefacturaventa_fk` FOREIGN KEY (`idfactura`) REFERENCES `facturaventa` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ped_detalleventa_fk` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `detallefacturaventa` */

insert  into `detallefacturaventa`(`idfactura`,`idpedido`,`precio`,`iva10`) values (1,1,24545,2455),(2,2,6364,636),(3,3,6364,636),(3,4,0,0),(3,5,0,0),(4,6,7273,727),(4,7,49091,4909),(5,8,36364,3636),(6,9,66364,6636),(7,10,109091,10909),(8,13,88182,8818),(9,14,14545,1455),(11,15,25455,2545),(11,16,59091,5909),(12,17,63636,6364),(14,18,44545,4455),(14,19,11818,1182),(15,20,44545,4455),(18,30,1139091,113909),(19,31,19546,1954),(20,32,43637,4363),(21,33,32727,3273),(22,34,90909,9091),(23,35,18181,1819),(24,36,19091,1909),(25,37,12727,1273),(26,38,9091,909),(27,39,16364,1636),(28,40,6364,636),(29,41,6364,636),(30,42,38181,3819),(31,43,34545,3455),(32,44,1254545,125455);

/*Table structure for table `empleados` */

DROP TABLE IF EXISTS `empleados`;

CREATE TABLE `empleados` (
  `id` int(11) NOT NULL,
  `nombres` char(30) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `telefono` varchar(20) DEFAULT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `idciudad` int(11) NOT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `idcargo` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cargos_empleados_fk` (`idcargo`),
  KEY `usuarios_empleados_fk` (`idusuario`),
  KEY `ciudades_empleados_fk` (`idciudad`),
  CONSTRAINT `cargos_empleados_fk` FOREIGN KEY (`idcargo`) REFERENCES `cargos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ciudades_empleados_fk` FOREIGN KEY (`idciudad`) REFERENCES `ciudades` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_empleados_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `empleados` */

insert  into `empleados`(`id`,`nombres`,`documento`,`telefono`,`direccion`,`idciudad`,`idusuario`,`idcargo`) values (1,'Lucas Garcia','12','0972134234','calle sin nombre',1,1,2),(2,'Leo Fernandez','321',NULL,NULL,1,2,3),(3,'Marta Diaz','5555',NULL,NULL,2,4,2),(4,'MARCOS JARA','321','01234','WALBERTO MORENO 543',1,3,1),(6,'MATEO HERNANDEZ','22192','1222','WALBERTO MORENO',2,NULL,2);

/*Table structure for table `existencias` */

DROP TABLE IF EXISTS `existencias`;

CREATE TABLE `existencias` (
  `iddeposito` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`iddeposito`,`idinsumo`),
  KEY `insumos_existencias_fk` (`idinsumo`),
  CONSTRAINT `deposito_existencias_fk` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `insumos_existencias_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `existencias` */

/*Table structure for table `facturaventa` */

DROP TABLE IF EXISTS `facturaventa`;

CREATE TABLE `facturaventa` (
  `id` int(11) NOT NULL,
  `fechaemision` date NOT NULL,
  `nrofactura` int(11) NOT NULL,
  `hora` time NOT NULL,
  `estado` varchar(20) DEFAULT NULL,
  `cuota` int(11) NOT NULL,
  `idtipodocumento` int(11) NOT NULL,
  `idtipofactura` int(11) NOT NULL,
  `idtimbrado` int(11) NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  `idcaja` int(11) DEFAULT NULL,
  `idempleados` int(11) NOT NULL,
  `idcliente` int(11) NOT NULL,
  `idsucursal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nrofactura` (`nrofactura`),
  KEY `timbrado_facturaventa_fk` (`idtimbrado`),
  KEY `caja_facturaventa_fk` (`idcaja`),
  KEY `aperturacierre_facturaventa_fk` (`idaperturacierre`),
  KEY `tipodocumento_facturaventa_fk` (`idtipodocumento`),
  KEY `clientes_facturaventa_fk` (`idcliente`),
  KEY `empleados_facturaventa_fk` (`idempleados`),
  KEY `tipofactura_facturaventa_facturaventa_fk` (`idtipofactura`),
  KEY `idsucursal` (`idsucursal`),
  CONSTRAINT `aperturacierre_facturaventa_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `caja_facturaventa_fk` FOREIGN KEY (`idcaja`) REFERENCES `caja` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `clientes_facturaventa_fk` FOREIGN KEY (`idcliente`) REFERENCES `clientes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `empleados_facturaventa_fk` FOREIGN KEY (`idempleados`) REFERENCES `empleados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `facturaventa_ibfk_1` FOREIGN KEY (`idsucursal`) REFERENCES `sucursal` (`id`),
  CONSTRAINT `timbrado_facturaventa_fk` FOREIGN KEY (`idtimbrado`) REFERENCES `timbrado` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipodocumento_facturaventa_fk` FOREIGN KEY (`idtipodocumento`) REFERENCES `tipodocumento` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipofactura_facturaventa_facturaventa_fk` FOREIGN KEY (`idtipofactura`) REFERENCES `tipofactura` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `facturaventa` */

insert  into `facturaventa`(`id`,`fechaemision`,`nrofactura`,`hora`,`estado`,`cuota`,`idtipodocumento`,`idtipofactura`,`idtimbrado`,`idaperturacierre`,`idcaja`,`idempleados`,`idcliente`,`idsucursal`) values (1,'2018-09-06',1,'07:35:38','COBRADO',1,1,1,2,2,1,1,2,1),(2,'2018-09-06',2,'07:36:19','COBRADO',1,1,1,2,2,1,1,2,1),(3,'2018-09-06',3,'07:38:34','COBRADO',1,1,1,2,2,1,1,2,1),(4,'2018-09-07',4,'10:35:03','COBRADO',1,1,1,2,2,1,1,2,1),(5,'2018-09-10',5,'10:01:57','COBRADO',1,1,1,2,2,1,1,2,1),(6,'2018-09-13',6,'19:53:21','COBRADO',1,1,1,2,2,1,1,2,1),(7,'2018-09-13',7,'19:59:55','COBRADO',1,1,1,2,2,1,1,2,1),(8,'2018-09-16',8,'20:19:59','COBRADO',1,1,1,2,4,1,1,2,1),(9,'2018-09-17',9,'10:15:07','COBRADO',1,1,1,2,4,1,1,2,1),(10,'2018-09-19',10,'23:07:09','COBRADO',1,1,1,2,4,1,1,2,1),(11,'2018-09-19',11,'23:25:23','COBRADO',1,1,1,2,5,1,1,2,1),(12,'2018-09-19',12,'23:29:47','COBRADO',1,1,1,2,7,1,2,2,1),(13,'2018-09-20',13,'10:20:41','COBRADO',1,1,1,2,8,1,1,2,1),(14,'2018-09-25',14,'11:45:53','COBRADO',1,1,1,2,9,1,2,2,1),(15,'2018-09-25',15,'11:53:24','COBRADO',1,1,1,2,9,1,2,2,1),(16,'2018-09-26',16,'06:38:19','ANULADO',1,1,1,2,9,1,2,2,1),(17,'2018-09-26',17,'06:40:54','ANULADO',1,1,2,2,9,1,2,2,1),(18,'2019-01-04',18,'17:00:11','PENDIENTE',1,1,1,3,10,3,2,2,1),(19,'2019-01-04',19,'17:33:25','COBRADO',1,1,1,3,11,1,2,8,1),(20,'2019-01-08',20,'15:15:56','COBRADO',1,1,1,3,12,3,1,2,1),(21,'2019-01-14',21,'21:09:42','COBRADO',1,1,1,0,15,4,4,2,1),(22,'2019-01-14',22,'21:12:59','COBRADO',1,1,1,0,16,4,4,2,1),(23,'2019-01-17',23,'11:23:47','COBRADO',1,1,1,3,17,1,4,2,1),(24,'2019-01-18',24,'21:26:01','COBRADO',1,1,1,3,19,1,4,2,1),(25,'2019-01-18',25,'21:31:37','COBRADO',1,1,1,3,19,1,4,9,1),(26,'2019-01-18',26,'21:33:43','COBRADO',1,1,1,3,19,1,4,2,1),(27,'2019-01-18',27,'21:33:49','COBRADO',1,1,1,3,19,1,4,2,1),(28,'2019-01-18',28,'21:33:55','COBRADO',1,1,1,3,19,1,4,2,1),(29,'2019-01-18',29,'21:34:01','COBRADO',1,1,1,3,19,1,4,2,1),(30,'2019-02-20',30,'14:57:44','COBRADO',1,1,1,3,20,1,2,2,1),(31,'2019-02-20',31,'15:06:50','COBRADO',1,1,1,3,21,1,4,2,1),(32,'2019-02-20',32,'15:10:26','PENDIENTE',1,1,1,3,21,1,4,2,1);

/*Table structure for table `impuesto` */

DROP TABLE IF EXISTS `impuesto`;

CREATE TABLE `impuesto` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `impuesto` */

insert  into `impuesto`(`id`,`descripcion`) values (1,'iva10'),(2,'iva5');

/*Table structure for table `insumos` */

DROP TABLE IF EXISTS `insumos`;

CREATE TABLE `insumos` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  `idimpuesto` int(11) NOT NULL,
  `idmarca` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_insumos_fk` (`idproveedor`),
  KEY `marca_insumos_fk` (`idmarca`),
  KEY `impuesto_insumos_fk` (`idimpuesto`),
  CONSTRAINT `impuesto_insumos_fk` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marca_insumos_fk` FOREIGN KEY (`idmarca`) REFERENCES `marca` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_insumos_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `insumos` */

insert  into `insumos`(`id`,`descripcion`,`idimpuesto`,`idmarca`,`idproveedor`) values (1,'Harina',1,2,2),(3,'RODAJA TOMATE',2,3,2),(4,'QUESO',2,4,2),(5,'MEDALLON CARNE',2,7,2),(6,'LECHUGA',2,3,2),(7,'PAN',2,9,2),(8,'JAMON',2,4,2),(9,'FILETE LOMITO',2,3,2),(10,'MEDALLON POLLO',2,6,2),(11,'MASA PIZZA REGULAR',2,8,2),(12,'MASA PIZZA ESPECIAL',2,8,1),(13,'MASA PIZZA ESTANDAR',1,9,1),(14,'FILETE LOMITO CERDO',2,3,2);

/*Table structure for table `marca` */

DROP TABLE IF EXISTS `marca`;

CREATE TABLE `marca` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marca` */

insert  into `marca`(`id`,`descripcion`) values (1,'coca cola'),(2,'ersa'),(3,'origen natural'),(4,'lactolanda'),(6,'Guarani'),(7,'Heterei'),(8,'El Bunker'),(9,'San Jorge'),(10,''),(11,''),(12,''),(13,''),(14,''),(15,'');

/*Table structure for table `marcatarjeta` */

DROP TABLE IF EXISTS `marcatarjeta`;

CREATE TABLE `marcatarjeta` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `marcatarjeta` */

insert  into `marcatarjeta`(`id`,`descripcion`) values (1,'visa'),(2,'mastercard');

/*Table structure for table `medida` */

DROP TABLE IF EXISTS `medida`;

CREATE TABLE `medida` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `medida` */

insert  into `medida`(`id`,`descripcion`) values (1,'litro'),(2,'gramos'),(3,'unidad');

/*Table structure for table `nivel` */

DROP TABLE IF EXISTS `nivel`;

CREATE TABLE `nivel` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nivel` */

insert  into `nivel`(`id`,`descripcion`) values (1,'ADMINISTRADOR'),(2,'CAJERO'),(3,'VENDEDOR'),(5,'COCINERO'),(6,'JEFE COMPRAS'),(7,'DESARROLLADOR'),(8,'ENCARGADO COMPRA'),(9,'JEFE PRODUCCION');

/*Table structure for table `ordencompra` */

DROP TABLE IF EXISTS `ordencompra`;

CREATE TABLE `ordencompra` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `estado` varchar(10) NOT NULL,
  `idpedidocompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_ordencompra_fk` (`idproveedor`),
  KEY `usuarios_ordencompra_fk` (`idusuario`),
  KEY `pedidocompradetalle_ordencompra_fk` (`idpedidocompra`,`idinsumo`),
  CONSTRAINT `pedidocompradetalle_ordencompra_fk` FOREIGN KEY (`idpedidocompra`, `idinsumo`) REFERENCES `pedidocompradetalle` (`idpedidocompra`, `idinsumo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_ordencompra_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_ordencompra_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordencompra` */

/*Table structure for table `ordencompradetalle` */

DROP TABLE IF EXISTS `ordencompradetalle`;

CREATE TABLE `ordencompradetalle` (
  `idordencompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idordencompra`,`idinsumo`),
  KEY `insumos_ordencompradetalle_fk` (`idinsumo`),
  CONSTRAINT `insumos_ordencompradetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `ordencompra_ordencompradetalle_fk` FOREIGN KEY (`idordencompra`) REFERENCES `ordencompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordencompradetalle` */

/*Table structure for table `ordenproduccion` */

DROP TABLE IF EXISTS `ordenproduccion`;

CREATE TABLE `ordenproduccion` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `idusuario` int(11) DEFAULT NULL,
  `cliente` char(30) DEFAULT NULL,
  `estado` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordenproduccion` */

insert  into `ordenproduccion`(`id`,`fecha`,`hora`,`numero`,`idusuario`,`cliente`,`estado`) values (1,'2019-03-12','12:20:11',1,2,'Maria','PENDIENTE'),(2,'2019-03-12','12:23:05',2,2,'Estela','PENDIENTE');

/*Table structure for table `ordenproducciondetalle` */

DROP TABLE IF EXISTS `ordenproducciondetalle`;

CREATE TABLE `ordenproducciondetalle` (
  `idorden` int(11) NOT NULL,
  `idpedido` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idorden`,`idpedido`),
  KEY `fk_ordenproduccion_pedidos` (`idpedido`),
  CONSTRAINT `fk_ordenproduccion_detalle` FOREIGN KEY (`idorden`) REFERENCES `ordenproduccion` (`id`),
  CONSTRAINT `fk_ordenproduccion_pedidos` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ordenproducciondetalle` */

insert  into `ordenproducciondetalle`(`idorden`,`idpedido`,`cantidad`) values (1,43,1),(2,44,1);

/*Table structure for table `pedidocompra` */

DROP TABLE IF EXISTS `pedidocompra`;

CREATE TABLE `pedidocompra` (
  `id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `iddeposito` int(11) NOT NULL,
  `idusuario` int(11) NOT NULL,
  `idproveedor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedores_pedidocompra_fk` (`idproveedor`),
  KEY `deposito_pedidocompra_fk` (`iddeposito`),
  KEY `usuarios_pedidocompra_fk` (`idusuario`),
  CONSTRAINT `deposito_pedidocompra_fk` FOREIGN KEY (`iddeposito`) REFERENCES `deposito` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `proveedores_pedidocompra_fk` FOREIGN KEY (`idproveedor`) REFERENCES `proveedores` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `usuarios_pedidocompra_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidocompra` */

/*Table structure for table `pedidocompradetalle` */

DROP TABLE IF EXISTS `pedidocompradetalle`;

CREATE TABLE `pedidocompradetalle` (
  `idpedidocompra` int(11) NOT NULL,
  `idinsumo` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  PRIMARY KEY (`idpedidocompra`,`idinsumo`),
  KEY `insumos_pedidocompradetalle_fk` (`idinsumo`),
  CONSTRAINT `insumos_pedidocompradetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `pedidocompra_pedidocompradetalle_fk` FOREIGN KEY (`idpedidocompra`) REFERENCES `pedidocompra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidocompradetalle` */

/*Table structure for table `pedidodetalle` */

DROP TABLE IF EXISTS `pedidodetalle`;

CREATE TABLE `pedidodetalle` (
  `idpedido` int(11) NOT NULL,
  `idproducto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` int(11) NOT NULL,
  PRIMARY KEY (`idpedido`,`idproducto`),
  KEY `productos_pedido_detalle_fk` (`idproducto`),
  CONSTRAINT `pedidos_pedido_detalle_fk` FOREIGN KEY (`idpedido`) REFERENCES `pedidos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `productos_pedido_detalle_fk` FOREIGN KEY (`idproducto`) REFERENCES `productos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidodetalle` */

insert  into `pedidodetalle`(`idpedido`,`idproducto`,`cantidad`,`precio`) values (1,1,1,7000),(1,2,1,13000),(1,3,1,7000),(2,1,1,7000),(3,1,1,7000),(4,2,3,13000),(6,3,5,8000),(7,1,4,7000),(7,2,2,13000),(8,3,5,8000),(9,1,7,7000),(9,3,3,8000),(10,1,8,7000),(10,3,8,8000),(12,2,4,13000),(13,2,5,13000),(13,3,4,8000),(14,3,2,8000),(15,1,4,7000),(16,2,5,13000),(17,1,10,7000),(18,1,7,7000),(19,2,1,13000),(20,1,7,7000),(20,2,2,2500),(21,1,1,7000),(22,1,5,2500),(22,2,5,2500),(23,1,10,2500),(23,3,5,3000),(24,1,10,2500),(24,2,4,2500),(25,2,2,2500),(25,3,2,3000),(29,1,12,2500),(30,1,500,2500),(30,3,1,3000),(31,1,5,2500),(31,3,3,3000),(32,1,12,2500),(32,3,6,3000),(33,1,6,2500),(33,4,6,3500),(34,1,40,2500),(35,1,2,2500),(35,3,5,3000),(36,5,3,7000),(37,5,2,7000),(38,7,2,5000),(39,6,3,6000),(40,5,1,7000),(41,5,1,7000),(42,1,5,2500),(42,2,2,2500),(42,4,3,3500),(42,5,2,7000),(43,2,2,2500),(43,3,1,3000),(43,6,5,6000),(44,4,80,3500),(44,6,100,6000),(44,7,100,5000);

/*Table structure for table `pedidos` */

DROP TABLE IF EXISTS `pedidos`;

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `nropedido` int(11) NOT NULL,
  `fechapedido` date NOT NULL,
  `estado` varchar(20) NOT NULL,
  `cliente` int(11) DEFAULT NULL,
  `nombrecli` char(20) DEFAULT NULL,
  `idusuario` int(11) NOT NULL,
  `control` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `usuarios_pedidos_fk` (`idusuario`),
  KEY `cliente` (`cliente`),
  CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`),
  CONSTRAINT `usuarios_pedidos_fk` FOREIGN KEY (`idusuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pedidos` */

insert  into `pedidos`(`id`,`nropedido`,`fechapedido`,`estado`,`cliente`,`nombrecli`,`idusuario`,`control`) values (1,12,'2018-08-21','FACTURADO',2,'raul',1,NULL),(2,13,'2018-08-30','FACTURADO',2,'luis',1,NULL),(3,14,'2018-09-06','FACTURADO',NULL,'lucas',1,NULL),(4,15,'2018-09-06','FACTURADO',NULL,'lucas',1,NULL),(5,16,'2018-09-06','FACTURADO',NULL,'raul',1,NULL),(6,17,'2018-09-06','FACTURADO',NULL,NULL,1,NULL),(7,18,'2018-09-07','FACTURADO',NULL,NULL,1,NULL),(8,19,'2018-09-10','FACTURADO',NULL,'martin',1,NULL),(9,20,'2018-09-13','FACTURADO',NULL,'fulano',1,NULL),(10,21,'2018-09-13','FACTURADO',NULL,NULL,1,NULL),(11,22,'2018-09-13','FACTURADO',NULL,NULL,1,NULL),(12,23,'2018-09-15','FACTURADO',NULL,'alfredo',1,NULL),(13,24,'2018-09-16','FACTURADO',NULL,NULL,1,NULL),(14,25,'2018-09-17','FACTURADO',NULL,'ivan',1,NULL),(15,26,'2018-09-19','FACTURADO',NULL,NULL,1,NULL),(16,27,'2018-09-19','FACTURADO',NULL,NULL,1,NULL),(17,28,'2018-09-19','FACTURADO',NULL,NULL,2,NULL),(18,29,'2018-09-20','FACTURADO',NULL,NULL,1,NULL),(19,30,'2018-09-25','FACTURADO',NULL,'ivan',2,NULL),(20,31,'2018-09-25','FACTURADO',NULL,NULL,1,NULL),(21,32,'2018-09-26','COMPLETADO',NULL,NULL,1,NULL),(22,33,'2018-12-14','PENDIENTE',NULL,'fulano',2,NULL),(23,34,'2018-12-14','PENDIENTE',NULL,'martin',2,NULL),(24,35,'2018-12-18','PENDIENTE',NULL,'JoyeriaSan',2,NULL),(25,36,'2018-12-20','PENDIENTE',NULL,'gfdfg',2,NULL),(29,40,'2018-12-22','PENDIENTE',NULL,'asd',2,NULL),(30,41,'2018-12-22','FACTURADO',NULL,'martin plaga',2,NULL),(31,42,'2019-01-04','FACTURADO',NULL,'Ivan',2,NULL),(32,43,'2019-01-08','FACTURADO',NULL,'raul',1,NULL),(33,44,'2019-01-14','FACTURADO',NULL,'ruben',3,NULL),(34,45,'2019-01-14','FACTURADO',NULL,'juan',3,NULL),(35,46,'2019-01-17','FACTURADO',NULL,'Bruno',3,NULL),(36,47,'2019-01-18','FACTURADO',NULL,'SILVIA',3,NULL),(37,48,'2019-01-18','FACTURADO',NULL,'VECINA',3,NULL),(38,49,'2019-01-18','FACTURADO',NULL,'KARI',3,NULL),(39,50,'2019-01-18','FACTURADO',NULL,'SILVIA',3,'PENDIENTE'),(40,51,'2019-01-18','FACTURADO',NULL,'CATY',3,'PENDIENTE'),(41,52,'2019-01-18','FACTURADO',NULL,'MILE',3,'PENDIENTE'),(42,53,'2019-02-20','FACTURADO',NULL,'Ramon Fernandez',2,'ORDENADO'),(43,54,'2019-03-12','FACTURADO',NULL,'Carolina Fernandez',3,'ORDENADO'),(44,55,'2019-03-12','FACTURADO',NULL,'Carol',3,'ORDENADO');

/*Table structure for table `produccion` */

DROP TABLE IF EXISTS `produccion`;

CREATE TABLE `produccion` (
  `id` int(11) NOT NULL,
  `fecha` date DEFAULT NULL,
  `hora` time DEFAULT NULL,
  `idresponsable` int(11) DEFAULT NULL,
  `numero` int(11) DEFAULT NULL,
  `estado` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_produccion` (`numero`),
  KEY `fk_produccion_responsable` (`idresponsable`),
  CONSTRAINT `fk_produccion_responsable` FOREIGN KEY (`idresponsable`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `produccion` */

insert  into `produccion`(`id`,`fecha`,`hora`,`idresponsable`,`numero`,`estado`) values (1,'2019-03-12','13:08:55',2,1,'PENDIENTE'),(2,'2019-03-12','13:09:25',2,2,'PENDIENTE');

/*Table structure for table `producciondetalle` */

DROP TABLE IF EXISTS `producciondetalle`;

CREATE TABLE `producciondetalle` (
  `idproduccion` int(11) NOT NULL,
  `idordenproduccion` int(11) NOT NULL,
  `cantidad` int(11) DEFAULT NULL,
  PRIMARY KEY (`idproduccion`,`idordenproduccion`),
  KEY `fk_production_ordenproduccion` (`idordenproduccion`),
  CONSTRAINT `fk_production_ordenproduccion` FOREIGN KEY (`idordenproduccion`) REFERENCES `ordenproduccion` (`id`),
  CONSTRAINT `fk_production_production_detail` FOREIGN KEY (`idproduccion`) REFERENCES `produccion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `producciondetalle` */

insert  into `producciondetalle`(`idproduccion`,`idordenproduccion`,`cantidad`) values (1,1,1),(2,2,1);

/*Table structure for table `productos` */

DROP TABLE IF EXISTS `productos`;

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `descripcion` char(30) NOT NULL,
  `precio` int(11) NOT NULL,
  `idtipo` int(11) NOT NULL,
  `idtamano` int(11) NOT NULL,
  `idreceta` int(11) DEFAULT NULL,
  `idimpuesto` int(11) DEFAULT NULL,
  `idcategoria` int(11) DEFAULT NULL,
  `estado` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tipo_productos_fk` (`idtipo`),
  KEY `tamano_productos_fk` (`idtamano`),
  KEY `fk_re_pro` (`idreceta`),
  KEY `fk_pro_imp` (`idimpuesto`),
  KEY `categoria_productos_fk` (`idcategoria`),
  CONSTRAINT `categoria_productos_fk` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`id`),
  CONSTRAINT `fk_pro_imp` FOREIGN KEY (`idimpuesto`) REFERENCES `impuesto` (`id`),
  CONSTRAINT `fk_re_pro` FOREIGN KEY (`idreceta`) REFERENCES `receta` (`id`),
  CONSTRAINT `tamano_productos_fk` FOREIGN KEY (`idtamano`) REFERENCES `tamano` (`idtamano`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipo_productos_fk` FOREIGN KEY (`idtipo`) REFERENCES `tipo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `productos` */

insert  into `productos`(`id`,`descripcion`,`precio`,`idtipo`,`idtamano`,`idreceta`,`idimpuesto`,`idcategoria`,`estado`) values (1,'EMPANADA CARNE',2500,5,1,1,1,2,'HABILITADO'),(2,'EMPANADA POLLO',2500,5,1,2,NULL,2,'HABILITADO'),(3,'EMPANADA JAMON QUESO',3000,5,1,3,1,2,'HABILITADO'),(4,'EMPANADA 4 QUESOS',3500,5,1,4,1,2,'HABILITADO'),(5,'HAMBURGUESA COMPLETA',7000,2,1,3,1,2,'HABILITADO'),(6,'HAMBURGUESA NORMAL',6000,2,1,3,1,2,'HABILITADO'),(7,'HAMBURGUESA SIMPLE',5000,2,1,3,1,2,'HABILITADO');

/*Table structure for table `proveedores` */

DROP TABLE IF EXISTS `proveedores`;

CREATE TABLE `proveedores` (
  `id` int(11) NOT NULL,
  `razonsocial` varchar(40) NOT NULL,
  `documento` varchar(20) NOT NULL,
  `direccion` varchar(40) DEFAULT NULL,
  `telefono` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `proveedores` */

insert  into `proveedores`(`id`,`razonsocial`,`documento`,`direccion`,`telefono`) values (1,'Coca Cola Co.','1235213','calle sin nombre','1234556'),(2,'Comercial Abastecimientos S.A','324123','calle sin nombre','234324');

/*Table structure for table `recaudaciones` */

DROP TABLE IF EXISTS `recaudaciones`;

CREATE TABLE `recaudaciones` (
  `id` int(11) NOT NULL,
  `efectivo` int(11) NOT NULL,
  `cheque` int(11) NOT NULL,
  `tarjeta` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `idaperturacierre` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `aperturacierre_recaudaciones_fk` (`idaperturacierre`),
  CONSTRAINT `aperturacierre_recaudaciones_fk` FOREIGN KEY (`idaperturacierre`) REFERENCES `aperturacierre` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recaudaciones` */

/*Table structure for table `receta` */

DROP TABLE IF EXISTS `receta`;

CREATE TABLE `receta` (
  `id` int(11) NOT NULL,
  `nombre` char(100) NOT NULL,
  `idtipococcion` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_receta_tipococcion` (`idtipococcion`),
  CONSTRAINT `fk_receta_tipococcion` FOREIGN KEY (`idtipococcion`) REFERENCES `tipococcion` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `receta` */

insert  into `receta`(`id`,`nombre`,`idtipococcion`) values (1,'HAMBURGUESA EL BUNKER',NULL),(2,'LOMITO VACUNO ESPECIAL',NULL),(3,'HAMBURGUESA REGULAR',NULL),(4,'Pizza especial',NULL);

/*Table structure for table `recetadetalle` */

DROP TABLE IF EXISTS `recetadetalle`;

CREATE TABLE `recetadetalle` (
  `idinsumo` int(11) NOT NULL,
  `idreceta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `idmedida` int(11) NOT NULL,
  PRIMARY KEY (`idinsumo`,`idreceta`),
  KEY `medida_recetadetalle_fk` (`idmedida`),
  KEY `receta_recetadetalle_fk` (`idreceta`),
  CONSTRAINT `insumos_recetadetalle_fk` FOREIGN KEY (`idinsumo`) REFERENCES `insumos` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `medida_recetadetalle_fk` FOREIGN KEY (`idmedida`) REFERENCES `medida` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `receta_recetadetalle_fk` FOREIGN KEY (`idreceta`) REFERENCES `receta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `recetadetalle` */

insert  into `recetadetalle`(`idinsumo`,`idreceta`,`cantidad`,`idmedida`) values (3,2,1,3),(3,3,2,3),(4,1,1,3),(4,2,1,3),(4,3,1,3),(5,1,2,3),(6,1,1,3),(6,3,2,3),(7,1,1,3),(7,2,1,3),(7,3,1,3),(8,1,1,3),(8,2,1,3);

/*Table structure for table `sucursal` */

DROP TABLE IF EXISTS `sucursal`;

CREATE TABLE `sucursal` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(20) NOT NULL,
  `estado` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `sucursal` */

insert  into `sucursal`(`id`,`descripcion`,`estado`) values (1,'Central','HABILITADO');

/*Table structure for table `tamano` */

DROP TABLE IF EXISTS `tamano`;

CREATE TABLE `tamano` (
  `idtamano` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`idtamano`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tamano` */

insert  into `tamano`(`idtamano`,`descripcion`) values (1,'regular'),(2,'especial'),(3,'1 Litro'),(4,'500 Ml.');

/*Table structure for table `tarjeta` */

DROP TABLE IF EXISTS `tarjeta`;

CREATE TABLE `tarjeta` (
  `id` int(11) NOT NULL,
  `nrotarjeta` varchar(20) NOT NULL,
  `vencimiento` varchar(10) NOT NULL,
  `idtipotarjeta` int(11) NOT NULL,
  `idmarcatarjeta` int(11) NOT NULL,
  `idbancoemisor` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `bancoemisor_tarjeta_fk` (`idbancoemisor`),
  KEY `marcatarjeta_tarjeta_fk` (`idmarcatarjeta`),
  KEY `tipotarjeta_tarjeta_fk` (`idtipotarjeta`),
  CONSTRAINT `bancoemisor_tarjeta_fk` FOREIGN KEY (`idbancoemisor`) REFERENCES `bancoemisor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `marcatarjeta_tarjeta_fk` FOREIGN KEY (`idmarcatarjeta`) REFERENCES `marcatarjeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tipotarjeta_tarjeta_fk` FOREIGN KEY (`idtipotarjeta`) REFERENCES `tipotarjeta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tarjeta` */

/*Table structure for table `test` */

DROP TABLE IF EXISTS `test`;

CREATE TABLE `test` (
  `idfactura` int(11) DEFAULT NULL,
  `idpedido` int(11) DEFAULT NULL,
  `precio` int(11) DEFAULT NULL,
  `iva10` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `test` */

insert  into `test`(`idfactura`,`idpedido`,`precio`,`iva10`) values (1,1,1,NULL),(1,2,1,NULL),(1,3,1,NULL),(2,1,1,NULL);

/*Table structure for table `timbrado` */

DROP TABLE IF EXISTS `timbrado`;

CREATE TABLE `timbrado` (
  `id` int(11) NOT NULL,
  `nrotimbrado` int(11) NOT NULL,
  `fechaemision` date NOT NULL,
  `fechavencimiento` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `timbrado` */

insert  into `timbrado`(`id`,`nrotimbrado`,`fechaemision`,`fechavencimiento`) values (0,0,'0000-00-00','0000-00-00'),(1,16543,'2018-07-10','2018-08-10'),(2,22342,'2018-09-03','2018-09-20'),(3,12345678,'2019-01-02','2020-02-10');

/*Table structure for table `tipo` */

DROP TABLE IF EXISTS `tipo`;

CREATE TABLE `tipo` (
  `id` int(11) NOT NULL,
  `descripcion` char(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipo` */

insert  into `tipo`(`id`,`descripcion`) values (1,'Bebidas'),(2,'Hamburguesa'),(3,'Pizzas'),(4,'Lomitos'),(5,'EMPANADAS'),(6,'Especiales'),(7,'Sandwiches');

/*Table structure for table `tipocheque` */

DROP TABLE IF EXISTS `tipocheque`;

CREATE TABLE `tipocheque` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipocheque` */

/*Table structure for table `tipocobro` */

DROP TABLE IF EXISTS `tipocobro`;

CREATE TABLE `tipocobro` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipocobro` */

insert  into `tipocobro`(`id`,`descripcion`) values (1,'EFECTIVO'),(2,'TARJETA'),(3,'CHEQUE');

/*Table structure for table `tipococcion` */

DROP TABLE IF EXISTS `tipococcion`;

CREATE TABLE `tipococcion` (
  `id` int(11) NOT NULL,
  `descripcion` char(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipococcion` */

/*Table structure for table `tipodocumento` */

DROP TABLE IF EXISTS `tipodocumento`;

CREATE TABLE `tipodocumento` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipodocumento` */

insert  into `tipodocumento`(`id`,`descripcion`) values (1,'factura venta');

/*Table structure for table `tipofactura` */

DROP TABLE IF EXISTS `tipofactura`;

CREATE TABLE `tipofactura` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipofactura` */

insert  into `tipofactura`(`id`,`descripcion`) values (1,'contado'),(2,'credito');

/*Table structure for table `tipotarjeta` */

DROP TABLE IF EXISTS `tipotarjeta`;

CREATE TABLE `tipotarjeta` (
  `id` int(11) NOT NULL,
  `descripcion` char(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tipotarjeta` */

/*Table structure for table `usuarios` */

DROP TABLE IF EXISTS `usuarios`;

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `idnivel` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nivel_usuarios_fk` (`idnivel`),
  CONSTRAINT `nivel_usuarios_fk` FOREIGN KEY (`idnivel`) REFERENCES `nivel` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `usuarios` */

insert  into `usuarios`(`id`,`usuario`,`password`,`idnivel`) values (1,'lucgarcia','123',6),(2,'admin','admin',7),(3,'vendedor','321',3),(4,'cajero','1234',2);

/*Table structure for table `vsapercierre` */

DROP TABLE IF EXISTS `vsapercierre`;

/*!50001 DROP VIEW IF EXISTS `vsapercierre` */;
/*!50001 DROP TABLE IF EXISTS `vsapercierre` */;

/*!50001 CREATE TABLE  `vsapercierre`(
 `id` int(11) ,
 `fechaapertura` date ,
 `horaapertura` time ,
 `montoapertura` int(11) ,
 `fechacierre` date ,
 `horacierra` time ,
 `montocierre` int(11) ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idusuario` int(11) ,
 `idsucursal` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vsapertura` */

DROP TABLE IF EXISTS `vsapertura`;

/*!50001 DROP VIEW IF EXISTS `vsapertura` */;
/*!50001 DROP TABLE IF EXISTS `vsapertura` */;

/*!50001 CREATE TABLE  `vsapertura`(
 `id` int(11) ,
 `fechaapertura` date ,
 `horaapertura` time ,
 `montoapertura` int(11) ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vsclientes` */

DROP TABLE IF EXISTS `vsclientes`;

/*!50001 DROP VIEW IF EXISTS `vsclientes` */;
/*!50001 DROP TABLE IF EXISTS `vsclientes` */;

/*!50001 CREATE TABLE  `vsclientes`(
 `id` int(11) ,
 `razonsocial` char(40) ,
 `documento` varchar(15) ,
 `telefono` varchar(20) ,
 `direccion` varchar(50) ,
 `idciudad` int(11) ,
 `descripcion` char(30) 
)*/;

/*Table structure for table `vscobrodetalle` */

DROP TABLE IF EXISTS `vscobrodetalle`;

/*!50001 DROP VIEW IF EXISTS `vscobrodetalle` */;
/*!50001 DROP TABLE IF EXISTS `vscobrodetalle` */;

/*!50001 CREATE TABLE  `vscobrodetalle`(
 `idfactura` int(11) ,
 `nrofactura` int(11) ,
 `idcobro` int(11) ,
 `fecha` date ,
 `idtipocobro` int(11) ,
 `tipocobro` varchar(10) ,
 `montoefectivo` int(11) ,
 `montotarjeta` int(11) ,
 `montocheque` int(11) ,
 `iva10` int(11) ,
 `gravada` int(11) ,
 `total` bigint(12) ,
 `idaperturacierre` int(11) 
)*/;

/*Table structure for table `vscobros` */

DROP TABLE IF EXISTS `vscobros`;

/*!50001 DROP VIEW IF EXISTS `vscobros` */;
/*!50001 DROP TABLE IF EXISTS `vscobros` */;

/*!50001 CREATE TABLE  `vscobros`(
 `id` int(11) ,
 `fecha` date ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idaperturacierre` int(11) ,
 `nroapertura` int(11) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) 
)*/;

/*Table structure for table `vscobrosbyapertura` */

DROP TABLE IF EXISTS `vscobrosbyapertura`;

/*!50001 DROP VIEW IF EXISTS `vscobrosbyapertura` */;
/*!50001 DROP TABLE IF EXISTS `vscobrosbyapertura` */;

/*!50001 CREATE TABLE  `vscobrosbyapertura`(
 `idfactura` int(11) ,
 `idcobro` int(11) ,
 `montoefectivo` int(11) ,
 `montotarjeta` int(11) ,
 `total` bigint(12) ,
 `idaperturacierre` int(11) 
)*/;

/*Table structure for table `vsdetallepedido` */

DROP TABLE IF EXISTS `vsdetallepedido`;

/*!50001 DROP VIEW IF EXISTS `vsdetallepedido` */;
/*!50001 DROP TABLE IF EXISTS `vsdetallepedido` */;

/*!50001 CREATE TABLE  `vsdetallepedido`(
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `idproducto` int(11) ,
 `descripcion` char(30) ,
 `precio` int(11) ,
 `cantidad` int(11) 
)*/;

/*Table structure for table `vsdetallepedidobyid` */

DROP TABLE IF EXISTS `vsdetallepedidobyid`;

/*!50001 DROP VIEW IF EXISTS `vsdetallepedidobyid` */;
/*!50001 DROP TABLE IF EXISTS `vsdetallepedidobyid` */;

/*!50001 CREATE TABLE  `vsdetallepedidobyid`(
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `codigoproducto` int(11) ,
 `descripcion` char(30) ,
 `cantidad` int(11) ,
 `precio` int(11) ,
 `subtotal` bigint(21) ,
 `iva10` decimal(21,0) 
)*/;

/*Table structure for table `vsdetallereceta` */

DROP TABLE IF EXISTS `vsdetallereceta`;

/*!50001 DROP VIEW IF EXISTS `vsdetallereceta` */;
/*!50001 DROP TABLE IF EXISTS `vsdetallereceta` */;

/*!50001 CREATE TABLE  `vsdetallereceta`(
 `idreceta` int(11) ,
 `nombre` char(100) ,
 `idinsumo` int(11) ,
 `insumo` char(20) ,
 `cantidad` int(11) ,
 `medida` char(20) ,
 `idmedida` int(11) 
)*/;

/*Table structure for table `vsdetalleventa` */

DROP TABLE IF EXISTS `vsdetalleventa`;

/*!50001 DROP VIEW IF EXISTS `vsdetalleventa` */;
/*!50001 DROP TABLE IF EXISTS `vsdetalleventa` */;

/*!50001 CREATE TABLE  `vsdetalleventa`(
 `idfactura` int(11) ,
 `nrofactura` int(11) ,
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `precio` int(11) ,
 `iva10` int(11) 
)*/;

/*Table structure for table `vsempleados` */

DROP TABLE IF EXISTS `vsempleados`;

/*!50001 DROP VIEW IF EXISTS `vsempleados` */;
/*!50001 DROP TABLE IF EXISTS `vsempleados` */;

/*!50001 CREATE TABLE  `vsempleados`(
 `id` int(11) ,
 `nombres` char(30) ,
 `documento` varchar(20) ,
 `telefono` varchar(20) ,
 `direccion` varchar(40) ,
 `idciudad` int(11) ,
 `idusuario` int(11) ,
 `idcargo` int(11) 
)*/;

/*Table structure for table `vsinsumos` */

DROP TABLE IF EXISTS `vsinsumos`;

/*!50001 DROP VIEW IF EXISTS `vsinsumos` */;
/*!50001 DROP TABLE IF EXISTS `vsinsumos` */;

/*!50001 CREATE TABLE  `vsinsumos`(
 `id` int(11) ,
 `descripcion` char(20) ,
 `idimpuesto` int(11) ,
 `impuesto` char(20) ,
 `idmarca` int(11) ,
 `marca` char(20) ,
 `idproveedor` int(11) ,
 `proveedor` varchar(40) 
)*/;

/*Table structure for table `vsordenproduccion` */

DROP TABLE IF EXISTS `vsordenproduccion`;

/*!50001 DROP VIEW IF EXISTS `vsordenproduccion` */;
/*!50001 DROP TABLE IF EXISTS `vsordenproduccion` */;

/*!50001 CREATE TABLE  `vsordenproduccion`(
 `id` int(11) ,
 `fecha` date ,
 `hora` time ,
 `numero` int(11) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) ,
 `estado` char(20) 
)*/;

/*Table structure for table `vsordenproducciondetalle` */

DROP TABLE IF EXISTS `vsordenproducciondetalle`;

/*!50001 DROP VIEW IF EXISTS `vsordenproducciondetalle` */;
/*!50001 DROP TABLE IF EXISTS `vsordenproducciondetalle` */;

/*!50001 CREATE TABLE  `vsordenproducciondetalle`(
 `idorden` int(11) ,
 `numero` int(11) ,
 `fecha` date ,
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `cliente` int(11) ,
 `idproducto` int(11) ,
 `producto` char(30) ,
 `cantidad` int(11) ,
 `control` char(20) 
)*/;

/*Table structure for table `vspedidos` */

DROP TABLE IF EXISTS `vspedidos`;

/*!50001 DROP VIEW IF EXISTS `vspedidos` */;
/*!50001 DROP TABLE IF EXISTS `vspedidos` */;

/*!50001 CREATE TABLE  `vspedidos`(
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `fechapedido` date ,
 `estado` varchar(20) ,
 `cliente` int(11) ,
 `razonsocial` char(40) ,
 `nombrecli` char(20) ,
 `idusuario` int(11) ,
 `usuario` varchar(20) ,
 `control` char(20) 
)*/;

/*Table structure for table `vsproducciondetalle` */

DROP TABLE IF EXISTS `vsproducciondetalle`;

/*!50001 DROP VIEW IF EXISTS `vsproducciondetalle` */;
/*!50001 DROP TABLE IF EXISTS `vsproducciondetalle` */;

/*!50001 CREATE TABLE  `vsproducciondetalle`(
 `idproduccion` int(11) ,
 `numeroproduccion` int(11) ,
 `idordenproduccion` int(11) ,
 `numeroorden` int(11) ,
 `idpedido` int(11) ,
 `nropedido` int(11) ,
 `idproducto` int(11) ,
 `producto` char(30) ,
 `cantidad` int(11) ,
 `idreceta` int(11) ,
 `estado` char(20) 
)*/;

/*Table structure for table `vsproductos` */

DROP TABLE IF EXISTS `vsproductos`;

/*!50001 DROP VIEW IF EXISTS `vsproductos` */;
/*!50001 DROP TABLE IF EXISTS `vsproductos` */;

/*!50001 CREATE TABLE  `vsproductos`(
 `id` int(11) ,
 `descripcion` char(30) ,
 `precio` int(11) ,
 `idtipo` int(11) ,
 `tipo` char(25) ,
 `idtamano` int(11) ,
 `tamano` char(20) ,
 `idreceta` int(11) ,
 `receta` char(100) ,
 `idimpuesto` int(11) ,
 `idcategoria` int(11) ,
 `categoria` char(40) ,
 `impuesto` char(20) ,
 `estado` char(20) 
)*/;

/*Table structure for table `vsreceta` */

DROP TABLE IF EXISTS `vsreceta`;

/*!50001 DROP VIEW IF EXISTS `vsreceta` */;
/*!50001 DROP TABLE IF EXISTS `vsreceta` */;

/*!50001 CREATE TABLE  `vsreceta`(
 `id` int(11) ,
 `receta` char(100) ,
 `producto` char(30) ,
 `idproducto` int(11) 
)*/;

/*Table structure for table `vsusuario` */

DROP TABLE IF EXISTS `vsusuario`;

/*!50001 DROP VIEW IF EXISTS `vsusuario` */;
/*!50001 DROP TABLE IF EXISTS `vsusuario` */;

/*!50001 CREATE TABLE  `vsusuario`(
 `idempleado` int(11) ,
 `nombres` char(30) ,
 `idusuario` int(11) ,
 `id` int(11) ,
 `usuario` varchar(20) ,
 `passwrd` varchar(20) ,
 `idnivel` int(11) ,
 `nivel` char(20) 
)*/;

/*Table structure for table `vsventa` */

DROP TABLE IF EXISTS `vsventa`;

/*!50001 DROP VIEW IF EXISTS `vsventa` */;
/*!50001 DROP TABLE IF EXISTS `vsventa` */;

/*!50001 CREATE TABLE  `vsventa`(
 `id` int(11) ,
 `fechaemision` date ,
 `nrofactura` int(11) ,
 `idcaja` int(11) ,
 `nrocaja` int(11) ,
 `idsucursal` int(11) ,
 `sucursal` varchar(20) ,
 `hora` time ,
 `estado` varchar(20) ,
 `cuota` int(11) ,
 `idtipodocumento` int(11) ,
 `Documento` char(20) ,
 `idtipofactura` int(11) ,
 `Factura` char(20) ,
 `idtimbrado` int(11) ,
 `nrotimbrado` int(11) ,
 `fechavencimiento` date ,
 `idaperturacierre` int(11) ,
 `idcliente` int(11) ,
 `razonsocial` char(40) ,
 `idempleados` int(11) ,
 `usuario` char(30) 
)*/;

/*View structure for view vsapercierre */

/*!50001 DROP TABLE IF EXISTS `vsapercierre` */;
/*!50001 DROP VIEW IF EXISTS `vsapercierre` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsapercierre` AS select `ap`.`id` AS `id`,`ap`.`fechaapertura` AS `fechaapertura`,`ap`.`horaapertura` AS `horaapertura`,`ap`.`montoapertura` AS `montoapertura`,`ap`.`fechacierre` AS `fechacierre`,`ap`.`horacierra` AS `horacierra`,`ap`.`montocierre` AS `montocierre`,`ap`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`ap`.`idusuario` AS `idusuario`,`ap`.`idsucursal` AS `idsucursal`,`usuarios`.`usuario` AS `usuario` from ((`aperturacierre` `ap` left join `caja` on((`caja`.`id` = `ap`.`idcaja`))) left join `usuarios` on((`usuarios`.`id` = `ap`.`idusuario`))) */;

/*View structure for view vsapertura */

/*!50001 DROP TABLE IF EXISTS `vsapertura` */;
/*!50001 DROP VIEW IF EXISTS `vsapertura` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsapertura` AS select `ap`.`id` AS `id`,`ap`.`fechaapertura` AS `fechaapertura`,`ap`.`horaapertura` AS `horaapertura`,`ap`.`montoapertura` AS `montoapertura`,`ap`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`ap`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario` from ((`aperturacierre` `ap` join `caja`) join `usuarios`) where ((`ap`.`idcaja` = `caja`.`id`) and (`ap`.`idusuario` = `usuarios`.`id`) and isnull(`ap`.`fechacierre`)) */;

/*View structure for view vsclientes */

/*!50001 DROP TABLE IF EXISTS `vsclientes` */;
/*!50001 DROP VIEW IF EXISTS `vsclientes` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsclientes` AS select `clientes`.`id` AS `id`,`clientes`.`razonsocial` AS `razonsocial`,`clientes`.`documento` AS `documento`,`clientes`.`telefono` AS `telefono`,`clientes`.`direccion` AS `direccion`,`clientes`.`idciudad` AS `idciudad`,`ciudades`.`descripcion` AS `descripcion` from (`clientes` left join `ciudades` on((`clientes`.`idciudad` = `ciudades`.`id`))) */;

/*View structure for view vscobrodetalle */

/*!50001 DROP TABLE IF EXISTS `vscobrodetalle` */;
/*!50001 DROP VIEW IF EXISTS `vscobrodetalle` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscobrodetalle` AS select `cd`.`idfactura` AS `idfactura`,`facturaventa`.`nrofactura` AS `nrofactura`,`cd`.`idcobro` AS `idcobro`,`cobros`.`fecha` AS `fecha`,`cd`.`idtipocobro` AS `idtipocobro`,`tipocobro`.`descripcion` AS `tipocobro`,`cd`.`montoefectivo` AS `montoefectivo`,`cd`.`montotarjeta` AS `montotarjeta`,`cd`.`montocheque` AS `montocheque`,`cd`.`iva10` AS `iva10`,`cd`.`montototal` AS `gravada`,(`cd`.`iva10` + `cd`.`montototal`) AS `total`,`cobros`.`idaperturacierre` AS `idaperturacierre` from (((`cobro_detalle` `cd` left join `facturaventa` on((`facturaventa`.`id` = `cd`.`idfactura`))) left join `cobros` on((`cobros`.`id` = `cd`.`idcobro`))) left join `tipocobro` on((`cd`.`idtipocobro` = `tipocobro`.`id`))) */;

/*View structure for view vscobros */

/*!50001 DROP TABLE IF EXISTS `vscobros` */;
/*!50001 DROP VIEW IF EXISTS `vscobros` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscobros` AS select `cobros`.`id` AS `id`,`cobros`.`fecha` AS `fecha`,`cobros`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`cobros`.`idaperturacierre` AS `idaperturacierre`,`cobros`.`idaperturacierre` AS `nroapertura`,`aperturacierre`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario` from (((`cobros` left join `caja` on((`cobros`.`idcaja` = `caja`.`id`))) left join `aperturacierre` on((`cobros`.`idaperturacierre` = `aperturacierre`.`id`))) left join `usuarios` on((`aperturacierre`.`idusuario` = `usuarios`.`id`))) */;

/*View structure for view vscobrosbyapertura */

/*!50001 DROP TABLE IF EXISTS `vscobrosbyapertura` */;
/*!50001 DROP VIEW IF EXISTS `vscobrosbyapertura` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vscobrosbyapertura` AS select `cobro_detalle`.`idfactura` AS `idfactura`,`cobro_detalle`.`idcobro` AS `idcobro`,`cobro_detalle`.`montoefectivo` AS `montoefectivo`,`cobro_detalle`.`montotarjeta` AS `montotarjeta`,(`cobro_detalle`.`iva10` + `cobro_detalle`.`montototal`) AS `total`,`cobros`.`idaperturacierre` AS `idaperturacierre` from (`cobro_detalle` left join `cobros` on((`cobros`.`id` = `cobro_detalle`.`idcobro`))) */;

/*View structure for view vsdetallepedido */

/*!50001 DROP TABLE IF EXISTS `vsdetallepedido` */;
/*!50001 DROP VIEW IF EXISTS `vsdetallepedido` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetallepedido` AS select `pd`.`idpedido` AS `idpedido`,`pedidos`.`nropedido` AS `nropedido`,`pd`.`idproducto` AS `idproducto`,`productos`.`descripcion` AS `descripcion`,`pd`.`precio` AS `precio`,`pd`.`cantidad` AS `cantidad` from ((`pedidodetalle` `pd` left join `pedidos` on((`pedidos`.`id` = `pd`.`idpedido`))) left join `productos` on((`productos`.`id` = `pd`.`idproducto`))) */;

/*View structure for view vsdetallepedidobyid */

/*!50001 DROP TABLE IF EXISTS `vsdetallepedidobyid` */;
/*!50001 DROP VIEW IF EXISTS `vsdetallepedidobyid` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetallepedidobyid` AS select `vsdetallepedido`.`idpedido` AS `idpedido`,`vsdetallepedido`.`nropedido` AS `nropedido`,`vsdetallepedido`.`idproducto` AS `codigoproducto`,`vsdetallepedido`.`descripcion` AS `descripcion`,`vsdetallepedido`.`cantidad` AS `cantidad`,`vsdetallepedido`.`precio` AS `precio`,(`vsdetallepedido`.`cantidad` * `vsdetallepedido`.`precio`) AS `subtotal`,round(((`vsdetallepedido`.`cantidad` * `vsdetallepedido`.`precio`) / 11),0) AS `iva10` from `vsdetallepedido` */;

/*View structure for view vsdetallereceta */

/*!50001 DROP TABLE IF EXISTS `vsdetallereceta` */;
/*!50001 DROP VIEW IF EXISTS `vsdetallereceta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetallereceta` AS select `rd`.`idreceta` AS `idreceta`,`r`.`nombre` AS `nombre`,`rd`.`idinsumo` AS `idinsumo`,`i`.`descripcion` AS `insumo`,`rd`.`cantidad` AS `cantidad`,`m`.`descripcion` AS `medida`,`rd`.`idmedida` AS `idmedida` from (((`recetadetalle` `rd` left join `insumos` `i` on((`rd`.`idinsumo` = `i`.`id`))) left join `receta` `r` on((`rd`.`idreceta` = `r`.`id`))) left join `medida` `m` on((`rd`.`idmedida` = `m`.`id`))) */;

/*View structure for view vsdetalleventa */

/*!50001 DROP TABLE IF EXISTS `vsdetalleventa` */;
/*!50001 DROP VIEW IF EXISTS `vsdetalleventa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsdetalleventa` AS select `dv`.`idfactura` AS `idfactura`,`fv`.`nrofactura` AS `nrofactura`,`dv`.`idpedido` AS `idpedido`,`pd`.`nropedido` AS `nropedido`,`dv`.`precio` AS `precio`,`dv`.`iva10` AS `iva10` from ((`detallefacturaventa` `dv` left join `facturaventa` `fv` on((`dv`.`idfactura` = `fv`.`id`))) left join `pedidos` `pd` on((`dv`.`idpedido` = `pd`.`id`))) */;

/*View structure for view vsempleados */

/*!50001 DROP TABLE IF EXISTS `vsempleados` */;
/*!50001 DROP VIEW IF EXISTS `vsempleados` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsempleados` AS select `empleados`.`id` AS `id`,`empleados`.`nombres` AS `nombres`,`empleados`.`documento` AS `documento`,`empleados`.`telefono` AS `telefono`,`empleados`.`direccion` AS `direccion`,`empleados`.`idciudad` AS `idciudad`,`empleados`.`idusuario` AS `idusuario`,`empleados`.`idcargo` AS `idcargo` from `empleados` */;

/*View structure for view vsinsumos */

/*!50001 DROP TABLE IF EXISTS `vsinsumos` */;
/*!50001 DROP VIEW IF EXISTS `vsinsumos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsinsumos` AS select `insumos`.`id` AS `id`,`insumos`.`descripcion` AS `descripcion`,`insumos`.`idimpuesto` AS `idimpuesto`,`impuesto`.`descripcion` AS `impuesto`,`insumos`.`idmarca` AS `idmarca`,`marca`.`descripcion` AS `marca`,`insumos`.`idproveedor` AS `idproveedor`,`proveedores`.`razonsocial` AS `proveedor` from (((`insumos` left join `impuesto` on((`insumos`.`idimpuesto` = `impuesto`.`id`))) left join `marca` on((`insumos`.`idmarca` = `marca`.`id`))) left join `proveedores` on((`insumos`.`idproveedor` = `proveedores`.`id`))) */;

/*View structure for view vsordenproduccion */

/*!50001 DROP TABLE IF EXISTS `vsordenproduccion` */;
/*!50001 DROP VIEW IF EXISTS `vsordenproduccion` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsordenproduccion` AS select `op`.`id` AS `id`,`op`.`fecha` AS `fecha`,`op`.`hora` AS `hora`,`op`.`numero` AS `numero`,`op`.`idusuario` AS `idusuario`,`u`.`usuario` AS `usuario`,`op`.`estado` AS `estado` from (`ordenproduccion` `op` left join `usuarios` `u` on((`op`.`idusuario` = `u`.`id`))) */;

/*View structure for view vsordenproducciondetalle */

/*!50001 DROP TABLE IF EXISTS `vsordenproducciondetalle` */;
/*!50001 DROP VIEW IF EXISTS `vsordenproducciondetalle` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsordenproducciondetalle` AS select `opd`.`idorden` AS `idorden`,`op`.`numero` AS `numero`,`op`.`fecha` AS `fecha`,`opd`.`idpedido` AS `idpedido`,`p`.`nropedido` AS `nropedido`,`p`.`cliente` AS `cliente`,`pd`.`idproducto` AS `idproducto`,`pro`.`descripcion` AS `producto`,`pd`.`cantidad` AS `cantidad`,`p`.`control` AS `control` from ((((`ordenproducciondetalle` `opd` left join `ordenproduccion` `op` on((`opd`.`idorden` = `op`.`id`))) left join `pedidos` `p` on((`opd`.`idpedido` = `p`.`id`))) left join `pedidodetalle` `pd` on((`pd`.`idpedido` = `p`.`id`))) left join `productos` `pro` on((`pd`.`idproducto` = `pro`.`id`))) */;

/*View structure for view vspedidos */

/*!50001 DROP TABLE IF EXISTS `vspedidos` */;
/*!50001 DROP VIEW IF EXISTS `vspedidos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vspedidos` AS select `p`.`id` AS `idpedido`,`p`.`nropedido` AS `nropedido`,`p`.`fechapedido` AS `fechapedido`,`p`.`estado` AS `estado`,`p`.`cliente` AS `cliente`,`clientes`.`razonsocial` AS `razonsocial`,`p`.`nombrecli` AS `nombrecli`,`p`.`idusuario` AS `idusuario`,`usuarios`.`usuario` AS `usuario`,`p`.`control` AS `control` from ((`pedidos` `p` left join `clientes` on((`clientes`.`id` = `p`.`cliente`))) left join `usuarios` on((`usuarios`.`id` = `p`.`idusuario`))) */;

/*View structure for view vsproducciondetalle */

/*!50001 DROP TABLE IF EXISTS `vsproducciondetalle` */;
/*!50001 DROP VIEW IF EXISTS `vsproducciondetalle` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsproducciondetalle` AS select `pd`.`idproduccion` AS `idproduccion`,`p`.`numero` AS `numeroproduccion`,`pd`.`idordenproduccion` AS `idordenproduccion`,`op`.`numero` AS `numeroorden`,`opd`.`idpedido` AS `idpedido`,`pe`.`nropedido` AS `nropedido`,`peddet`.`idproducto` AS `idproducto`,`pro`.`descripcion` AS `producto`,`peddet`.`cantidad` AS `cantidad`,`pro`.`idreceta` AS `idreceta`,`p`.`estado` AS `estado` from ((((((`producciondetalle` `pd` left join `produccion` `p` on((`pd`.`idproduccion` = `p`.`id`))) left join `ordenproduccion` `op` on((`pd`.`idordenproduccion` = `op`.`id`))) left join `ordenproducciondetalle` `opd` on((`op`.`id` = `opd`.`idorden`))) left join `pedidos` `pe` on((`opd`.`idpedido` = `pe`.`id`))) left join `pedidodetalle` `peddet` on((`peddet`.`idpedido` = `pe`.`id`))) left join `productos` `pro` on((`peddet`.`idproducto` = `pro`.`id`))) */;

/*View structure for view vsproductos */

/*!50001 DROP TABLE IF EXISTS `vsproductos` */;
/*!50001 DROP VIEW IF EXISTS `vsproductos` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsproductos` AS select `p`.`id` AS `id`,`p`.`descripcion` AS `descripcion`,`p`.`precio` AS `precio`,`p`.`idtipo` AS `idtipo`,`t`.`descripcion` AS `tipo`,`p`.`idtamano` AS `idtamano`,`ta`.`descripcion` AS `tamano`,`p`.`idreceta` AS `idreceta`,`r`.`nombre` AS `receta`,`p`.`idimpuesto` AS `idimpuesto`,`p`.`idcategoria` AS `idcategoria`,`cat`.`descripcion` AS `categoria`,`i`.`descripcion` AS `impuesto`,`p`.`estado` AS `estado` from (((((`productos` `p` left join `tipo` `t` on((`p`.`idtipo` = `t`.`id`))) left join `tamano` `ta` on((`p`.`idtamano` = `ta`.`idtamano`))) left join `receta` `r` on((`p`.`idreceta` = `r`.`id`))) left join `impuesto` `i` on((`p`.`idimpuesto` = `i`.`id`))) left join `categoria` `cat` on((`p`.`idcategoria` = `cat`.`id`))) */;

/*View structure for view vsreceta */

/*!50001 DROP TABLE IF EXISTS `vsreceta` */;
/*!50001 DROP VIEW IF EXISTS `vsreceta` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsreceta` AS select `r`.`id` AS `id`,`r`.`nombre` AS `receta`,`p`.`descripcion` AS `producto`,`p`.`id` AS `idproducto` from (`productos` `p` left join `receta` `r` on((`p`.`idreceta` = `r`.`id`))) */;

/*View structure for view vsusuario */

/*!50001 DROP TABLE IF EXISTS `vsusuario` */;
/*!50001 DROP VIEW IF EXISTS `vsusuario` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsusuario` AS select `e`.`id` AS `idempleado`,`e`.`nombres` AS `nombres`,`e`.`idusuario` AS `idusuario`,`u`.`id` AS `id`,`u`.`usuario` AS `usuario`,`u`.`password` AS `passwrd`,`u`.`idnivel` AS `idnivel`,`n`.`descripcion` AS `nivel` from ((`empleados` `e` left join `usuarios` `u` on((`e`.`idusuario` = `u`.`id`))) left join `nivel` `n` on((`u`.`idnivel` = `n`.`id`))) */;

/*View structure for view vsventa */

/*!50001 DROP TABLE IF EXISTS `vsventa` */;
/*!50001 DROP VIEW IF EXISTS `vsventa` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vsventa` AS select `fv`.`id` AS `id`,`fv`.`fechaemision` AS `fechaemision`,`fv`.`nrofactura` AS `nrofactura`,`fv`.`idcaja` AS `idcaja`,`caja`.`nrocaja` AS `nrocaja`,`fv`.`idsucursal` AS `idsucursal`,`sucursal`.`descripcion` AS `sucursal`,`fv`.`hora` AS `hora`,`fv`.`estado` AS `estado`,`fv`.`cuota` AS `cuota`,`fv`.`idtipodocumento` AS `idtipodocumento`,`tipodocumento`.`descripcion` AS `Documento`,`fv`.`idtipofactura` AS `idtipofactura`,`tipofactura`.`descripcion` AS `Factura`,`fv`.`idtimbrado` AS `idtimbrado`,`timbrado`.`nrotimbrado` AS `nrotimbrado`,`timbrado`.`fechavencimiento` AS `fechavencimiento`,`fv`.`idaperturacierre` AS `idaperturacierre`,`fv`.`idcliente` AS `idcliente`,`clientes`.`razonsocial` AS `razonsocial`,`fv`.`idempleados` AS `idempleados`,`empleados`.`nombres` AS `usuario` from ((((((((`facturaventa` `fv` left join `caja` on((`caja`.`id` = `fv`.`idcaja`))) left join `sucursal` on((`caja`.`id` = `fv`.`idcaja`))) left join `tipodocumento` on((`tipodocumento`.`id` = `fv`.`idtipodocumento`))) left join `tipofactura` on((`tipofactura`.`id` = `fv`.`idtipofactura`))) left join `timbrado` on((`timbrado`.`id` = `fv`.`idtimbrado`))) left join `aperturacierre` on((`aperturacierre`.`id` = `fv`.`idaperturacierre`))) left join `clientes` on((`clientes`.`id` = `fv`.`idcliente`))) left join `empleados` on((`empleados`.`id` = `fv`.`idempleados`))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
