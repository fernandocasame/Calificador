-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-02-2020 a las 00:02:53
-- Versión del servidor: 10.4.8-MariaDB
-- Versión de PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `calificador`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getRegistro` (IN `id` INT, IN `fecha` DATE)  READS SQL DATA
    SQL SECURITY INVOKER
SELECT * FROM `persona_has_asistencia` WHERE fecha_registro = fecha AND persona_idpersona = id GROUP BY asistencia_id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencia`
--

CREATE TABLE `asistencia` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asistencia`
--

INSERT INTO `asistencia` (`id`, `nombre`, `detalle`) VALUES
(1, 'HORA ENTRADA', NULL),
(2, 'INICIO RECESO', NULL),
(3, 'FIN RECESO', NULL),
(4, 'HORA SALIDA', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `nota`
--

CREATE TABLE `nota` (
  `idnota` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `nota`
--

INSERT INTO `nota` (`idnota`, `nombre`, `detalle`) VALUES
(1, 'EXELENTE', NULL),
(2, 'BUENO', NULL),
(3, 'REGULAR', NULL),
(4, 'MALO', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `idpersona` int(11) NOT NULL,
  `cedula` varchar(45) DEFAULT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `rol_idrol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `cedula`, `nombre`, `apellido`, `email`, `telefono`, `rol_idrol`) VALUES
(1, '1719223016', 'Darwin Fernando', 'Casame Gualotuña', 'fernandocasame7@gmail.com', '0995279067', 2),
(2, '1719223017', 'Christian David', 'Anasi Gualotuña', 'crd@gmail.com', '0999999999', 1),
(3, '1719223018', 'Fernando', 'Casame', 'cdarfgvn@gmail.com', '0999999999', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_has_asistencia`
--

CREATE TABLE `persona_has_asistencia` (
  `id` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `asistencia_id` int(11) NOT NULL,
  `fecha_registro` date DEFAULT NULL,
  `hora_registro` time NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_has_asistencia`
--

INSERT INTO `persona_has_asistencia` (`id`, `persona_idpersona`, `asistencia_id`, `fecha_registro`, `hora_registro`, `updated_at`, `created_at`) VALUES
(11, 1, 4, '2020-01-28', '16:46:53', '2020-01-28 21:46:53', '2020-01-28 21:46:53'),
(12, 1, 1, '2020-01-28', '08:48:01', '2020-01-28 13:48:01', '2020-01-28 13:48:01'),
(13, 1, 4, '2020-01-28', '17:17:55', '2020-01-28 22:17:55', '2020-01-28 22:17:55'),
(14, 1, 4, '2020-01-28', '17:17:57', '2020-01-28 22:17:57', '2020-01-28 22:17:57'),
(15, 3, 1, '2020-01-28', '08:12:46', '2020-01-28 13:12:46', '2020-01-28 13:12:46'),
(16, 3, 1, '2020-01-28', '08:13:42', '2020-01-28 13:13:42', '2020-01-28 13:13:42'),
(17, 3, 3, '2020-01-28', '13:19:56', '2020-01-28 18:19:56', '2020-01-28 18:19:56'),
(18, 3, 3, '2020-01-28', '13:21:41', '2020-01-28 18:21:41', '2020-01-28 18:21:41'),
(19, 3, 3, '2020-01-29', '13:24:35', '2020-01-29 18:24:35', '2020-01-29 18:24:35'),
(20, 1, 3, '2020-01-29', '13:34:51', '2020-01-29 18:34:51', '2020-01-29 18:34:51'),
(21, 3, 2, '2020-01-29', '12:36:39', '2020-01-29 17:36:39', '2020-01-29 17:36:39'),
(22, 3, 1, '2020-01-29', '08:36:58', '2020-01-29 13:36:58', '2020-01-29 13:36:58'),
(23, 3, 4, '2020-01-29', '17:37:18', '2020-01-29 22:37:18', '2020-01-29 22:37:18'),
(24, 3, 4, '2020-01-30', '17:38:36', '2020-01-30 22:38:36', '2020-01-30 22:38:36'),
(25, 3, 4, '2020-01-31', '17:54:04', '2020-01-31 22:54:04', '2020-01-31 22:54:04'),
(26, 3, 4, '2020-02-01', '17:59:07', '2020-02-01 22:59:07', '2020-02-01 22:59:07');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_has_nota`
--

CREATE TABLE `persona_has_nota` (
  `id` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `nota_idnota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `idrol` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `detalle` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`idrol`, `nombre`, `detalle`) VALUES
(1, 'Administrado', 'Administrado'),
(2, 'Empleado', 'Empleado');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `nota`
--
ALTER TABLE `nota`
  ADD PRIMARY KEY (`idnota`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`idpersona`),
  ADD KEY `fk_persona_rol1_idx` (`rol_idrol`);

--
-- Indices de la tabla `persona_has_asistencia`
--
ALTER TABLE `persona_has_asistencia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_persona_has_asistencia_asistencia1_idx` (`asistencia_id`),
  ADD KEY `fk_persona_has_asistencia_persona1_idx` (`persona_idpersona`);

--
-- Indices de la tabla `persona_has_nota`
--
ALTER TABLE `persona_has_nota`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_persona_has_nota_nota1_idx` (`nota_idnota`),
  ADD KEY `fk_persona_has_nota_persona_idx` (`persona_idpersona`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`idrol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asistencia`
--
ALTER TABLE `asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `nota`
--
ALTER TABLE `nota`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `persona_has_asistencia`
--
ALTER TABLE `persona_has_asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `persona_has_nota`
--
ALTER TABLE `persona_has_nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `idrol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `fk_persona_rol1` FOREIGN KEY (`rol_idrol`) REFERENCES `rol` (`idrol`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona_has_asistencia`
--
ALTER TABLE `persona_has_asistencia`
  ADD CONSTRAINT `fk_persona_has_asistencia_asistencia1` FOREIGN KEY (`asistencia_id`) REFERENCES `asistencia` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_has_asistencia_persona1` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `persona_has_nota`
--
ALTER TABLE `persona_has_nota`
  ADD CONSTRAINT `fk_persona_has_nota_nota1` FOREIGN KEY (`nota_idnota`) REFERENCES `nota` (`idnota`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_persona_has_nota_persona` FOREIGN KEY (`persona_idpersona`) REFERENCES `persona` (`idpersona`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
