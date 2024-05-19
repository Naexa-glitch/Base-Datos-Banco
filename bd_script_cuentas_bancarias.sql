-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cuentas_bancarias
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cedula` varchar(9) NOT NULL,
  `tipo_cliente` varchar(15) NOT NULL,
  `primer_nombre` varchar(15) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `telefono_fijo` varchar(9) NOT NULL,
  `correo_electronico` varchar(35) NOT NULL,
  `provincia` varchar(15) NOT NULL,
  `canton` varchar(30) NOT NULL,
  `distrito` varchar(40) NOT NULL,
  `direccion_exacta` varchar(100) NOT NULL,
  `telefono_movil` varchar(9) NOT NULL,
  `nacionalidad` varchar(30) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_has_cuenta`
--

DROP TABLE IF EXISTS `cliente_has_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_has_cuenta` (
  `Cliente_cedula` varchar(9) NOT NULL,
  `Cuentas_numero_cuenta` varchar(25) NOT NULL,
  `calidad` varchar(30) NOT NULL,
  PRIMARY KEY (`Cliente_cedula`,`Cuentas_numero_cuenta`),
  KEY `fk_Cliente_has_Cuentas_Cuentas1_idx` (`Cuentas_numero_cuenta`),
  KEY `fk_Cliente_has_Cuentas_Cliente1_idx` (`Cliente_cedula`),
  CONSTRAINT `fk_Cliente_has_Cuentas_Cliente1` FOREIGN KEY (`Cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_Cliente_has_Cuentas_Cuentas1` FOREIGN KEY (`Cuentas_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_has_cuenta`
--

LOCK TABLES `cliente_has_cuenta` WRITE;
/*!40000 ALTER TABLE `cliente_has_cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_has_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta`
--

DROP TABLE IF EXISTS `cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta` (
  `numero_cuenta` varchar(25) NOT NULL,
  `tipo_moneda` varchar(15) NOT NULL,
  `tipo_cuenta` varchar(12) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `saldo` int NOT NULL,
  `negocio_afiliado_cedula_juridica` varchar(45) NOT NULL,
  PRIMARY KEY (`numero_cuenta`),
  KEY `fk_cuenta_negocio_afiliado1_idx` (`negocio_afiliado_cedula_juridica`),
  CONSTRAINT `fk_cuenta_negocio_afiliado1` FOREIGN KEY (`negocio_afiliado_cedula_juridica`) REFERENCES `negocio_afiliado` (`cedula_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta`
--

LOCK TABLES `cuenta` WRITE;
/*!40000 ALTER TABLE `cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuenta_crediticia`
--

DROP TABLE IF EXISTS `cuenta_crediticia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuenta_crediticia` (
  `numero_cuenta` int NOT NULL,
  `fecha_creacion` date NOT NULL,
  `fecha_corte` date NOT NULL,
  `limite_credito` int NOT NULL,
  `tasa_interes` int NOT NULL,
  `saldo_actual` int NOT NULL,
  `Cliente_cedula` varchar(9) NOT NULL,
  PRIMARY KEY (`numero_cuenta`),
  KEY `fk_Cuenta_crediticia_Cliente1_idx` (`Cliente_cedula`),
  CONSTRAINT `fk_Cuenta_crediticia_Cliente1` FOREIGN KEY (`Cliente_cedula`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuenta_crediticia`
--

LOCK TABLES `cuenta_crediticia` WRITE;
/*!40000 ALTER TABLE `cuenta_crediticia` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuenta_crediticia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deposito`
--

DROP TABLE IF EXISTS `deposito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `deposito` (
  `id` varchar(15) NOT NULL,
  `numero_transaccion` varchar(14) NOT NULL,
  `medio` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `detalle` varchar(15) NOT NULL,
  `monto` int NOT NULL,
  `cliente_cedula` varchar(9) NOT NULL,
  `empleado_cedula` varchar(9) NOT NULL,
  `cuenta_numero_cuenta` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_deposito_cliente1_idx` (`cliente_cedula`),
  KEY `fk_deposito_empleado1_idx` (`empleado_cedula`),
  KEY `fk_deposito_cuenta1_idx` (`cuenta_numero_cuenta`),
  CONSTRAINT `fk_deposito_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_deposito_cuenta1` FOREIGN KEY (`cuenta_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `fk_deposito_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deposito`
--

LOCK TABLES `deposito` WRITE;
/*!40000 ALTER TABLE `deposito` DISABLE KEYS */;
/*!40000 ALTER TABLE `deposito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `cedula` varchar(9) NOT NULL,
  `primer_nombre` varchar(15) NOT NULL,
  `primer_apellido` varchar(20) NOT NULL,
  `segundo_apellido` varchar(20) NOT NULL,
  `telefono_fijo` varchar(9) NOT NULL,
  `telefono_movil` varchar(9) NOT NULL,
  `correo_institucional` varchar(35) NOT NULL,
  `salario_base` int NOT NULL,
  `fecha_ingreso` date NOT NULL,
  `area_desempenada` varchar(35) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_has_cuenta`
--

DROP TABLE IF EXISTS `empleado_has_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_has_cuenta` (
  `Empleado_cedula` varchar(9) NOT NULL,
  `Cuenta_numero_cuenta` varchar(25) NOT NULL,
  PRIMARY KEY (`Empleado_cedula`,`Cuenta_numero_cuenta`),
  KEY `fk_Empleado_has_Cuenta_Cuenta1_idx` (`Cuenta_numero_cuenta`),
  KEY `fk_Empleado_has_Cuenta_Empleado1_idx` (`Empleado_cedula`),
  CONSTRAINT `fk_Empleado_has_Cuenta_Cuenta1` FOREIGN KEY (`Cuenta_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `fk_Empleado_has_Cuenta_Empleado1` FOREIGN KEY (`Empleado_cedula`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_has_cuenta`
--

LOCK TABLES `empleado_has_cuenta` WRITE;
/*!40000 ALTER TABLE `empleado_has_cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_has_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleado_has_usuario`
--

DROP TABLE IF EXISTS `empleado_has_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado_has_usuario` (
  `empleado_cedula` varchar(9) NOT NULL,
  `usuario_nombre_usuario` varchar(25) NOT NULL,
  PRIMARY KEY (`empleado_cedula`,`usuario_nombre_usuario`),
  KEY `fk_empleado_has_usuario_usuario1_idx` (`usuario_nombre_usuario`),
  KEY `fk_empleado_has_usuario_empleado1_idx` (`empleado_cedula`),
  CONSTRAINT `fk_empleado_has_usuario_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_empleado_has_usuario_usuario1` FOREIGN KEY (`usuario_nombre_usuario`) REFERENCES `usuario` (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado_has_usuario`
--

LOCK TABLES `empleado_has_usuario` WRITE;
/*!40000 ALTER TABLE `empleado_has_usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `empleado_has_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_cuenta`
--

DROP TABLE IF EXISTS `estado_cuenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_cuenta` (
  `codigo` int NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_limite` date NOT NULL,
  `monto_pago_minimo` int NOT NULL,
  `monto_pago_contado` int NOT NULL,
  `saldo_disponible` int NOT NULL,
  `monto_adeudado` int NOT NULL,
  `monto_intereses` int NOT NULL,
  `tarjeta_credito_numero` int NOT NULL,
  `pago_credito_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_estado_cuenta_tarjeta_credito1_idx` (`tarjeta_credito_numero`),
  KEY `fk_estado_cuenta_pago_credito1_idx` (`pago_credito_id`),
  CONSTRAINT `fk_estado_cuenta_pago_credito1` FOREIGN KEY (`pago_credito_id`) REFERENCES `pago_credito` (`id`),
  CONSTRAINT `fk_estado_cuenta_tarjeta_credito1` FOREIGN KEY (`tarjeta_credito_numero`) REFERENCES `tarjeta_credito` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_cuenta`
--

LOCK TABLES `estado_cuenta` WRITE;
/*!40000 ALTER TABLE `estado_cuenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_cuenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo`
--

DROP TABLE IF EXISTS `modulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo` (
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo`
--

LOCK TABLES `modulo` WRITE;
/*!40000 ALTER TABLE `modulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modulo_has_perfil`
--

DROP TABLE IF EXISTS `modulo_has_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modulo_has_perfil` (
  `modulo_codigo` varchar(30) NOT NULL,
  `perfil_codigo` varchar(30) NOT NULL,
  PRIMARY KEY (`modulo_codigo`,`perfil_codigo`),
  KEY `fk_modulo_has_perfil_perfil1_idx` (`perfil_codigo`),
  KEY `fk_modulo_has_perfil_modulo1_idx` (`modulo_codigo`),
  CONSTRAINT `fk_modulo_has_perfil_modulo1` FOREIGN KEY (`modulo_codigo`) REFERENCES `modulo` (`codigo`),
  CONSTRAINT `fk_modulo_has_perfil_perfil1` FOREIGN KEY (`perfil_codigo`) REFERENCES `perfil` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modulo_has_perfil`
--

LOCK TABLES `modulo_has_perfil` WRITE;
/*!40000 ALTER TABLE `modulo_has_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `modulo_has_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negocio_afiliado`
--

DROP TABLE IF EXISTS `negocio_afiliado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `negocio_afiliado` (
  `cedula_juridica` varchar(45) NOT NULL,
  `responsable` varchar(60) NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `telefono` varchar(9) NOT NULL,
  `fecha_registro` date NOT NULL,
  `provincia` varchar(15) NOT NULL,
  `canton` varchar(35) NOT NULL,
  `distrito` varchar(45) NOT NULL,
  `direccion_exacta` varchar(100) NOT NULL,
  PRIMARY KEY (`cedula_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negocio_afiliado`
--

LOCK TABLES `negocio_afiliado` WRITE;
/*!40000 ALTER TABLE `negocio_afiliado` DISABLE KEYS */;
/*!40000 ALTER TABLE `negocio_afiliado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id` varchar(15) NOT NULL,
  `numero_transaccion` varchar(14) NOT NULL,
  `medio` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `detalle` varchar(15) NOT NULL,
  `monto` int NOT NULL,
  `cliente_cedula` varchar(9) NOT NULL,
  `empleado_cedula` varchar(9) NOT NULL,
  `cuenta_numero_cuenta` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pago_cliente1_idx` (`cliente_cedula`),
  KEY `fk_pago_empleado1_idx` (`empleado_cedula`),
  KEY `fk_pago_cuenta1_idx` (`cuenta_numero_cuenta`),
  CONSTRAINT `fk_pago_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_pago_cuenta1` FOREIGN KEY (`cuenta_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `fk_pago_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_credito`
--

DROP TABLE IF EXISTS `pago_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago_credito` (
  `id` varchar(10) NOT NULL,
  `numero_pago` int NOT NULL,
  `tipo_pago` varchar(30) NOT NULL,
  `Cliente_cedula` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_pago_credito_Cliente1_idx` (`Cliente_cedula`),
  CONSTRAINT `fk_pago_credito_Cliente1` FOREIGN KEY (`Cliente_cedula`) REFERENCES `cliente` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_credito`
--

LOCK TABLES `pago_credito` WRITE;
/*!40000 ALTER TABLE `pago_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perfil` (
  `codigo` varchar(30) NOT NULL,
  `descripcion` varchar(45) NOT NULL,
  `tipo_usuario` varchar(25) NOT NULL,
  `usuario_nombre_usuario` varchar(25) NOT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_perfil_usuario1_idx` (`usuario_nombre_usuario`),
  CONSTRAINT `fk_perfil_usuario1` FOREIGN KEY (`usuario_nombre_usuario`) REFERENCES `usuario` (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `problema`
--

DROP TABLE IF EXISTS `problema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `problema` (
  `numero_ticket` varchar(10) NOT NULL,
  `titulo` varchar(25) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `nivel_prioridad` varchar(10) NOT NULL,
  `fecha_creacion` date NOT NULL,
  `estado` varchar(15) NOT NULL,
  `empleado_cedula` varchar(9) NOT NULL,
  `empleado_cedula1` varchar(9) NOT NULL,
  PRIMARY KEY (`numero_ticket`),
  KEY `fk_problema_empleado1_idx` (`empleado_cedula`),
  KEY `fk_problema_empleado2_idx` (`empleado_cedula1`),
  CONSTRAINT `fk_problema_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_problema_empleado2` FOREIGN KEY (`empleado_cedula1`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `problema`
--

LOCK TABLES `problema` WRITE;
/*!40000 ALTER TABLE `problema` DISABLE KEYS */;
/*!40000 ALTER TABLE `problema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `retiro`
--

DROP TABLE IF EXISTS `retiro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `retiro` (
  `id` varchar(15) NOT NULL,
  `numero_transaccion` varchar(14) NOT NULL,
  `medio` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `monto` int NOT NULL,
  `cliente_cedula` varchar(9) NOT NULL,
  `empleado_cedula` varchar(9) NOT NULL,
  `cuenta_numero_cuenta` varchar(25) NOT NULL,
  `negocio_afiliado_cedula_juridica` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_retiro_cliente1_idx` (`cliente_cedula`),
  KEY `fk_retiro_empleado1_idx` (`empleado_cedula`),
  KEY `fk_retiro_cuenta1_idx` (`cuenta_numero_cuenta`),
  KEY `fk_retiro_negocio_afiliado1_idx` (`negocio_afiliado_cedula_juridica`),
  CONSTRAINT `fk_retiro_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_retiro_cuenta1` FOREIGN KEY (`cuenta_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `fk_retiro_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`),
  CONSTRAINT `fk_retiro_negocio_afiliado1` FOREIGN KEY (`negocio_afiliado_cedula_juridica`) REFERENCES `negocio_afiliado` (`cedula_juridica`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `retiro`
--

LOCK TABLES `retiro` WRITE;
/*!40000 ALTER TABLE `retiro` DISABLE KEYS */;
/*!40000 ALTER TABLE `retiro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_credito`
--

DROP TABLE IF EXISTS `tarjeta_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_credito` (
  `numero` int NOT NULL,
  `fecha_emision` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `codigo_seguridad` varchar(8) NOT NULL,
  `convenio_internacional` varchar(20) NOT NULL,
  `pin` varchar(4) NOT NULL,
  `Cuenta_crediticia_numero_cuenta` int NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_tarjeta_credito_Cuenta_crediticia1_idx` (`Cuenta_crediticia_numero_cuenta`),
  CONSTRAINT `fk_tarjeta_credito_Cuenta_crediticia1` FOREIGN KEY (`Cuenta_crediticia_numero_cuenta`) REFERENCES `cuenta_crediticia` (`numero_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_credito`
--

LOCK TABLES `tarjeta_credito` WRITE;
/*!40000 ALTER TABLE `tarjeta_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tarjeta_debito`
--

DROP TABLE IF EXISTS `tarjeta_debito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tarjeta_debito` (
  `numero` varchar(12) NOT NULL,
  `codigo_seguridad` varchar(8) NOT NULL,
  `pin_seguridad` varchar(4) NOT NULL,
  `convenio_internacional` varchar(20) NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `fecha_emision` date NOT NULL,
  `Cuentas_numero_cuenta` varchar(25) NOT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_Tarjeta_debito_Cuentas_idx` (`Cuentas_numero_cuenta`),
  CONSTRAINT `fk_Tarjeta_debito_Cuentas` FOREIGN KEY (`Cuentas_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tarjeta_debito`
--

LOCK TABLES `tarjeta_debito` WRITE;
/*!40000 ALTER TABLE `tarjeta_debito` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarjeta_debito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tranferencia`
--

DROP TABLE IF EXISTS `tranferencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tranferencia` (
  `id` varchar(15) NOT NULL,
  `numero_transaccion` varchar(14) NOT NULL,
  `medio` varchar(20) NOT NULL,
  `fecha_hora` datetime NOT NULL,
  `detalle` varchar(15) NOT NULL,
  `monto` int NOT NULL,
  `cuenta_destino` varchar(25) NOT NULL,
  `cuenta_origen` varchar(25) NOT NULL,
  `cliente_cedula` varchar(9) NOT NULL,
  `empleado_cedula` varchar(9) NOT NULL,
  `cuenta_numero_cuenta` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tranferencia_cliente1_idx` (`cliente_cedula`),
  KEY `fk_tranferencia_empleado1_idx` (`empleado_cedula`),
  KEY `fk_tranferencia_cuenta1_idx` (`cuenta_numero_cuenta`),
  CONSTRAINT `fk_tranferencia_cliente1` FOREIGN KEY (`cliente_cedula`) REFERENCES `cliente` (`cedula`),
  CONSTRAINT `fk_tranferencia_cuenta1` FOREIGN KEY (`cuenta_numero_cuenta`) REFERENCES `cuenta` (`numero_cuenta`),
  CONSTRAINT `fk_tranferencia_empleado1` FOREIGN KEY (`empleado_cedula`) REFERENCES `empleado` (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tranferencia`
--

LOCK TABLES `tranferencia` WRITE;
/*!40000 ALTER TABLE `tranferencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `tranferencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trensaccion_credito`
--

DROP TABLE IF EXISTS `trensaccion_credito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trensaccion_credito` (
  `id` varchar(10) NOT NULL,
  `numero_transaccion` int NOT NULL,
  `fecha` date NOT NULL,
  `detalle` varchar(40) NOT NULL,
  `monto` int NOT NULL,
  `pais` varchar(25) NOT NULL,
  `interes` int NOT NULL,
  `tarjeta_credito_numero` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_trensaccion_credito_tarjeta_credito1_idx` (`tarjeta_credito_numero`),
  CONSTRAINT `fk_trensaccion_credito_tarjeta_credito1` FOREIGN KEY (`tarjeta_credito_numero`) REFERENCES `tarjeta_credito` (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trensaccion_credito`
--

LOCK TABLES `trensaccion_credito` WRITE;
/*!40000 ALTER TABLE `trensaccion_credito` DISABLE KEYS */;
/*!40000 ALTER TABLE `trensaccion_credito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `nombre_usuario` varchar(25) NOT NULL,
  `clave` varchar(14) NOT NULL,
  PRIMARY KEY (`nombre_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-16  0:09:10
