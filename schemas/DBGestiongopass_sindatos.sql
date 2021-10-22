-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.1.38-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win64
-- HeidiSQL Versión:             11.2.0.6213
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para gestiongopass
CREATE DATABASE IF NOT EXISTS `gestiongopass` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `gestiongopass`;

-- Volcando estructura para tabla gestiongopass.barrio
CREATE TABLE IF NOT EXISTS `barrio` (
  `barrioId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `localidadId` int(11) NOT NULL,
  PRIMARY KEY (`barrioId`),
  KEY `localidadId` (`localidadId`),
  CONSTRAINT `barrio_ibfk_1` FOREIGN KEY (`localidadId`) REFERENCES `localidad` (`localidadId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.campana
CREATE TABLE IF NOT EXISTS `campana` (
  `campanaId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`campanaId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.campana_rol
CREATE TABLE IF NOT EXISTS `campana_rol` (
  `rolId` int(11) NOT NULL,
  `campanaId` int(11) NOT NULL,
  PRIMARY KEY (`campanaId`,`rolId`),
  KEY `rolId` (`rolId`),
  CONSTRAINT `campana_rol_ibfk_1` FOREIGN KEY (`rolId`) REFERENCES `rol` (`rolId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campana_rol_ibfk_2` FOREIGN KEY (`campanaId`) REFERENCES `campana` (`campanaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.campana_tipificacion
CREATE TABLE IF NOT EXISTS `campana_tipificacion` (
  `tipificacionId` int(11) NOT NULL,
  `campanaId` int(11) NOT NULL,
  PRIMARY KEY (`tipificacionId`,`campanaId`),
  KEY `campanaId` (`campanaId`),
  CONSTRAINT `campana_tipificacion_ibfk_1` FOREIGN KEY (`tipificacionId`) REFERENCES `tipificacion` (`tipificacionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `campana_tipificacion_ibfk_2` FOREIGN KEY (`campanaId`) REFERENCES `campana` (`campanaId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.ciudad
CREATE TABLE IF NOT EXISTS `ciudad` (
  `ciudadId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `departamentoId` int(11) NOT NULL,
  PRIMARY KEY (`ciudadId`),
  KEY `departamentoId` (`departamentoId`),
  CONSTRAINT `ciudad_ibfk_1` FOREIGN KEY (`departamentoId`) REFERENCES `departamento` (`departamentoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.convenio
CREATE TABLE IF NOT EXISTS `convenio` (
  `convenioId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`convenioId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `convenio_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.departamento
CREATE TABLE IF NOT EXISTS `departamento` (
  `departamentoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`departamentoId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.gestiongopass
CREATE TABLE IF NOT EXISTS `gestiongopass` (
  `gestionId` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(6) NOT NULL,
  `fechaGestion` datetime NOT NULL,
  `fechaReagendamiento` datetime DEFAULT NULL,
  `fechaVolverLlamar` datetime DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `numTags` int(11) DEFAULT NULL,
  `ip` varchar(45) NOT NULL,
  `conoceMembresias` tinyint(1) DEFAULT NULL,
  `tipificacionId` int(11) DEFAULT NULL,
  `convenioId` int(11) DEFAULT NULL,
  `barrioId` int(11) DEFAULT NULL,
  `franjaHoraria` tinyint(1) DEFAULT NULL,
  `cedulaPersona` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `presentacionPersonal` int(11) DEFAULT NULL,
  `direccionCasa` varchar(45) DEFAULT NULL,
  `direccionEntrega` varchar(45) DEFAULT NULL,
  `tipoBonoId` int(11) DEFAULT '1',
  `tipoMembresiaId` int(11) DEFAULT '1',
  `campanaId` int(11) NOT NULL,
  `calificacionPresentacionPersonal` int(11) DEFAULT NULL,
  `calificacionInfoClara` int(11) DEFAULT NULL,
  `calificacionAcompanamiento` int(11) DEFAULT NULL,
  `calificacionTiempoEspera` int(11) DEFAULT NULL,
  `calificacionComportamiento` int(11) DEFAULT NULL,
  `calificacionAmabilidad` int(11) DEFAULT NULL,
  `motivoNoContacto` varchar(45) DEFAULT NULL,
  `tagAsociado` int(11) NOT NULL,
  `fechaActivacion` date DEFAULT NULL,
  `redimeBono` tinyint(1) DEFAULT NULL,
  `fechaRedimeBono` date DEFAULT NULL,
  `adquiereMembresia` tinyint(1) DEFAULT NULL,
  `puntoActivacionId` int(11) DEFAULT NULL,
  `existeContacto` int(11) DEFAULT NULL,
  `infoBono` int(11) DEFAULT NULL,
  PRIMARY KEY (`gestionId`),
  UNIQUE KEY `placa_UNIQUE` (`placa`),
  KEY `tipificacionId` (`tipificacionId`),
  KEY `convenioId` (`convenioId`),
  KEY `barrioId` (`barrioId`),
  KEY `cedulaPersona` (`cedulaPersona`),
  KEY `usuarioId` (`usuarioId`),
  KEY `campanaId` (`campanaId`),
  KEY `tagAsociado` (`tagAsociado`),
  KEY `gestiongopass_ibfk_6` (`tipoBonoId`),
  KEY `gestiongopass_ibfk_7` (`tipoMembresiaId`),
  KEY `gestiongopass_ibfk_9` (`puntoActivacionId`),
  CONSTRAINT `gestiongopass_ibfk_1` FOREIGN KEY (`tipificacionId`) REFERENCES `tipificacion` (`tipificacionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_10` FOREIGN KEY (`tagAsociado`) REFERENCES `ventatag` (`tagAsociado`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_2` FOREIGN KEY (`convenioId`) REFERENCES `convenio` (`convenioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_3` FOREIGN KEY (`barrioId`) REFERENCES `barrio` (`barrioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_4` FOREIGN KEY (`cedulaPersona`) REFERENCES `persona` (`cedulaPersona`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_5` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_6` FOREIGN KEY (`tipoBonoId`) REFERENCES `tipobono` (`tipoBonoId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_7` FOREIGN KEY (`tipoMembresiaId`) REFERENCES `tipomembresia` (`tipoMembresiaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_8` FOREIGN KEY (`campanaId`) REFERENCES `campana` (`campanaId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `gestiongopass_ibfk_9` FOREIGN KEY (`puntoActivacionId`) REFERENCES `puntoactivacion` (`puntoActivacionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.historico_convenio
CREATE TABLE IF NOT EXISTS `historico_convenio` (
  `historicoConvenioId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaInsert` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  `convenioId` int(11) NOT NULL,
  `fechaUpdate` datetime DEFAULT NULL,
  `usuarioId` int(11) NOT NULL,
  `fechaDelete` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`historicoConvenioId`),
  KEY `convenioId` (`convenioId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `historico_convenio_ibfk_1` FOREIGN KEY (`convenioId`) REFERENCES `convenio` (`convenioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_convenio_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.historico_gestiongopass
CREATE TABLE IF NOT EXISTS `historico_gestiongopass` (
  `historicoGestionGopassId` int(11) NOT NULL AUTO_INCREMENT,
  `placa` varchar(6) NOT NULL,
  `fechaGestion` datetime NOT NULL,
  `fechaReagendamiento` datetime DEFAULT NULL,
  `fechaVolverLlamar` datetime DEFAULT NULL,
  `fechaEntrega` datetime DEFAULT NULL,
  `observacion` varchar(45) DEFAULT NULL,
  `numTags` int(11) DEFAULT NULL,
  `ip` varchar(45) NOT NULL,
  `conoceMembresias` tinyint(1) DEFAULT NULL,
  `tipificacionId` int(11) DEFAULT NULL,
  `convenioId` int(11) DEFAULT NULL,
  `barrioId` int(11) DEFAULT NULL,
  `franjaHoraria` tinyint(1) DEFAULT NULL,
  `cedulaPersona` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `presentacionPersonal` int(11) DEFAULT NULL,
  `direccionCasa` varchar(45) DEFAULT NULL,
  `direccionEntrega` varchar(45) DEFAULT NULL,
  `tipoBonoId` int(11) DEFAULT NULL,
  `tipoMembresiaId` int(11) DEFAULT NULL,
  `campanaId` int(11) NOT NULL,
  `calificacionPresentacionPersonal` int(11) DEFAULT NULL,
  `calificacionInfoClara` int(11) DEFAULT NULL,
  `calificacionAcompanamiento` int(11) DEFAULT NULL,
  `calificacionTiempoEspera` int(11) DEFAULT NULL,
  `calificacionComportamiento` int(11) DEFAULT NULL,
  `calificacionAmabilidad` int(11) DEFAULT NULL,
  `motivoNoContacto` varchar(45) DEFAULT NULL,
  `tagAsociado` int(11) NOT NULL,
  `fechaActivacion` datetime DEFAULT NULL,
  `redimeBono` tinyint(1) DEFAULT NULL,
  `fechaRedimeBono` datetime DEFAULT NULL,
  `adquiereMembresia` tinyint(1) DEFAULT NULL,
  `puntoActivacionId` int(11) DEFAULT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `fechaUpdate` datetime DEFAULT NULL,
  `fechaDelete` datetime DEFAULT NULL,
  `gestionId` int(11) NOT NULL,
  `existeContacto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`historicoGestionGopassId`),
  KEY `gestionId` (`gestionId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `historico_gestiongopass_ibfk_1` FOREIGN KEY (`gestionId`) REFERENCES `gestiongopass` (`gestionId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_gestiongopass_ibfk_2` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=202 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.historico_persona
CREATE TABLE IF NOT EXISTS `historico_persona` (
  `historicoPersonaId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celularLlamadas` int(11) DEFAULT NULL,
  `tipoId` int(11) NOT NULL,
  `celularWhatsapp` int(11) DEFAULT NULL,
  `cedulaPersona` int(11) NOT NULL,
  `fechaCreate` datetime NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `fechaUpdate` datetime DEFAULT NULL,
  `fechaDelete` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`historicoPersonaId`),
  KEY `cedulaPersona` (`cedulaPersona`),
  CONSTRAINT `historico_persona_ibfk_1` FOREIGN KEY (`cedulaPersona`) REFERENCES `persona` (`cedulaPersona`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.historico_puntoactivacion
CREATE TABLE IF NOT EXISTS `historico_puntoactivacion` (
  `historicopuntoActivacionId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `ciudadId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `fechaCambio` datetime NOT NULL,
  `puntoActivacionId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `fechaDelete` datetime DEFAULT NULL,
  PRIMARY KEY (`historicopuntoActivacionId`),
  KEY `usuarioId` (`usuarioId`),
  KEY `puntoActivacionId` (`puntoActivacionId`),
  CONSTRAINT `historico_puntoactivacion_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `historico_puntoactivacion_ibfk_2` FOREIGN KEY (`puntoActivacionId`) REFERENCES `puntoactivacion` (`puntoActivacionId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.historico_usuario
CREATE TABLE IF NOT EXISTS `historico_usuario` (
  `historicoId` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `cambioPassword` int(1) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `rolId` int(11) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  `fechaUpdate` datetime DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `usuarioModifico` int(11) DEFAULT NULL,
  PRIMARY KEY (`historicoId`),
  KEY `usuarioId` (`usuarioId`),
  CONSTRAINT `historico_usuario_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.localidad
CREATE TABLE IF NOT EXISTS `localidad` (
  `localidadId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `ciudadId` int(11) NOT NULL,
  PRIMARY KEY (`localidadId`),
  KEY `ciudadId` (`ciudadId`),
  CONSTRAINT `localidad_ibfk_1` FOREIGN KEY (`ciudadId`) REFERENCES `ciudad` (`ciudadId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.persona
CREATE TABLE IF NOT EXISTS `persona` (
  `cedulaPersona` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `telefono` int(11) DEFAULT NULL,
  `celularLlamadas` int(11) DEFAULT NULL,
  `tipoId` int(11) NOT NULL,
  `celularWhatsapp` int(11) DEFAULT NULL,
  `usuarioId` int(11) DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`cedulaPersona`),
  KEY `tipoId` (`tipoId`),
  CONSTRAINT `persona_ibfk_1` FOREIGN KEY (`tipoId`) REFERENCES `tipoidentificacion` (`tipoId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.puntoactivacion
CREATE TABLE IF NOT EXISTS `puntoactivacion` (
  `puntoActivacionId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `ciudadId` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`puntoActivacionId`),
  KEY `usuarioId` (`usuarioId`),
  KEY `ciudadId` (`ciudadId`),
  CONSTRAINT `puntoactivacion_ibfk_1` FOREIGN KEY (`usuarioId`) REFERENCES `usuario` (`usuarioId`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `puntoactivacion_ibfk_2` FOREIGN KEY (`ciudadId`) REFERENCES `localidad` (`ciudadId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.rol
CREATE TABLE IF NOT EXISTS `rol` (
  `rolId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`rolId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.tipificacion
CREATE TABLE IF NOT EXISTS `tipificacion` (
  `tipificacionId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `fechaCreacion` datetime DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`tipificacionId`)
) ENGINE=InnoDB AUTO_INCREMENT=220 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.tipobono
CREATE TABLE IF NOT EXISTS `tipobono` (
  `tipoBonoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tipoBonoId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.tipoidentificacion
CREATE TABLE IF NOT EXISTS `tipoidentificacion` (
  `tipoId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`tipoId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.tipomembresia
CREATE TABLE IF NOT EXISTS `tipomembresia` (
  `tipoMembresiaId` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`tipoMembresiaId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `usuarioId` int(11) NOT NULL AUTO_INCREMENT,
  `cedula` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `rolId` int(11) NOT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `dateAction` datetime DEFAULT NULL,
  `usuarioModifico` int(11) DEFAULT NULL,
  `cambioPassword` int(1) DEFAULT NULL,
  PRIMARY KEY (`usuarioId`),
  KEY `rolId` (`rolId`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`rolId`) REFERENCES `rol` (`rolId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para tabla gestiongopass.ventatag
CREATE TABLE IF NOT EXISTS `ventatag` (
  `tagAsociado` int(11) NOT NULL,
  PRIMARY KEY (`tagAsociado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- La exportación de datos fue deseleccionada.

-- Volcando estructura para disparador gestiongopass.convenio_AFTER_DELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`convenio_AFTER_DELETE` AFTER DELETE ON `convenio` FOR EACH ROW
BEGIN
insert into historico_convenio(nombre, fechaDelete, estado, convenioId, usuarioId, ip, fechaUpdate, fechaInsert)
values(old.nombre, now(), old.estado, old.convenioId, old.usuarioId, old.ip, null, null);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.convenio_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`convenio_AFTER_INSERT` AFTER INSERT ON `convenio` FOR EACH ROW
BEGIN
insert into historico_convenio(nombre, fechaInsert, estado, convenioId, usuarioId, ip, fechaUpdate, fechaDelete)
values(new.nombre, now(), new.estado, new.convenioId, new.usuarioId, new.ip, null, null);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.convenio_AFTER_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`convenio_AFTER_UPDATE` AFTER UPDATE ON `convenio` FOR EACH ROW
BEGIN
insert into historico_convenio(nombre, fechaUpdate, estado, convenioId, usuarioId, ip, fechaDelete, fechaInsert)
values(new.nombre, now(), new.estado, new.convenioId, new.usuarioId, new.ip, null, null);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.gestiongopass_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`gestiongopass_AFTER_INSERT` AFTER INSERT ON `gestiongopass` FOR EACH ROW
BEGIN
insert into historico_gestiongopass(placa, fechaGestion, fechaReagendamiento, fechaVolverLlamar, fechaEntrega, observacion, 
	numTags, ip, conoceMembresias, tipificacionId, convenioId, barrioId, franjaHoraria, cedulaPersona, usuarioId, presentacionPersonal, 
	direccionCasa, direccionEntrega, tipoBonoId, tipoMembresiaId, campanaId, calificacionPresentacionPersonal, calificacionInfoClara, 
	calificacionAcompanamiento, calificacionTiempoEspera, calificacionComportamiento, calificacionAmabilidad, motivoNoContacto, 
	tagAsociado, fechaActivacion, redimeBono, fechaRedimeBono, adquiereMembresia, puntoActivacionId, fechaCreacion, fechaUpdate, 
	fechaDelete, gestionId, existeContacto)
	values(new.placa, new.fechaGestion, new.fechaReagendamiento, new.fechaVolverLlamar, new.fechaEntrega, new.observacion, 
	new.numTags, new.ip, new.conoceMembresias, new.tipificacionId, new.convenioId, new.barrioId, new.franjaHoraria, new.cedulaPersona, new.usuarioId, 
	new.presentacionPersonal, new.direccionCasa, new.direccionEntrega, new.tipoBonoId, new.tipoMembresiaId, new.campanaId, 
	new.calificacionPresentacionPersonal, new.calificacionInfoClara, new.calificacionAcompanamiento, new.calificacionTiempoEspera, 
	new.calificacionComportamiento, new.calificacionAmabilidad, new.motivoNoContacto, new.tagAsociado, new.fechaActivacion, 
	new.redimeBono, new.fechaRedimeBono, new.adquiereMembresia, new.puntoActivacionId, now(), null, null, new.gestionId, new.existeContacto);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.gestiongopass_AFTER_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`gestiongopass_AFTER_UPDATE` AFTER UPDATE ON `gestiongopass` FOR EACH ROW
BEGIN
insert into historico_gestiongopass(placa, fechaGestion, fechaReagendamiento, fechaVolverLlamar, fechaEntrega, observacion, 
	numTags, ip, conoceMembresias, tipificacionId, convenioId, barrioId, franjaHoraria, cedulaPersona, usuarioId, presentacionPersonal, 
	direccionCasa, direccionEntrega, tipoBonoId, tipoMembresiaId, campanaId, calificacionPresentacionPersonal, calificacionInfoClara, 
	calificacionAcompanamiento, calificacionTiempoEspera, calificacionComportamiento, calificacionAmabilidad, motivoNoContacto, 
	tagAsociado, fechaActivacion, redimeBono, fechaRedimeBono, adquiereMembresia, puntoActivacionId, fechaCreacion, fechaUpdate, 
	fechaDelete, gestionId, existeContacto)
	values(new.placa, new.fechaGestion, new.fechaReagendamiento, new.fechaVolverLlamar, new.fechaEntrega, new.observacion, 
	new.numTags, new.ip, new.conoceMembresias, new.tipificacionId, new.convenioId, new.barrioId, new.franjaHoraria, new.cedulaPersona, new.usuarioId, 
	new.presentacionPersonal, new.direccionCasa, new.direccionEntrega, new.tipoBonoId, new.tipoMembresiaId, new.campanaId, 
	new.calificacionPresentacionPersonal, new.calificacionInfoClara, new.calificacionAcompanamiento, new.calificacionTiempoEspera, 
	new.calificacionComportamiento, new.calificacionAmabilidad, new.motivoNoContacto, new.tagAsociado, new.fechaActivacion, 
	new.redimeBono, new.fechaRedimeBono, new.adquiereMembresia, new.puntoActivacionId, null, now(), null, new.gestionId, new.existeContacto);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.persona_AFTER_DELETE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`persona_AFTER_DELETE` AFTER DELETE ON `persona` FOR EACH ROW
BEGIN
insert into historico_persona(nombre, apellido, telefono, celularLlamadas, tipoId, celularWhatsapp, cedulaPersona, fechaDelete, usuarioId, ip)
values(old.nombre, old.apellido, old.telefono, old.celularLlamadas, old.tipoId, old.celularWhatsapp, old.cedulaPersona, now(), old.usuarioId, old.ip);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.persona_AFTER_INSERT
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`persona_AFTER_INSERT` AFTER INSERT ON `persona` FOR EACH ROW
BEGIN
insert into historico_persona(nombre, apellido, telefono, celularLlamadas, tipoId, celularWhatsapp, cedulaPersona, fechaCreate, usuarioId, ip)
values(new.nombre, new.apellido, new.telefono, new.celularLlamadas, new.tipoId, new.celularWhatsapp, new.cedulaPersona, now(), new.usuarioId, new.ip);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

-- Volcando estructura para disparador gestiongopass.persona_AFTER_UPDATE
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `gestiongopass`.`persona_AFTER_UPDATE` AFTER UPDATE ON `persona` FOR EACH ROW
BEGIN
insert into historico_persona(nombre, apellido, telefono, celularLlamadas, tipoId, celularWhatsapp, cedulaPersona, fechaUpdate, usuarioId, ip)
values(new.nombre, new.apellido, new.telefono, new.celularLlamadas, new.tipoId, new.celularWhatsapp, new.cedulaPersona, now(), new.usuarioId, new.ip);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
