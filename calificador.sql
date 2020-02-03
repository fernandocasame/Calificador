-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-02-2020 a las 18:44:25
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.1

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

CREATE DEFINER=`root`@`localhost` PROCEDURE `nota_total` ()  READS SQL DATA
    SQL SECURITY INVOKER
SELECT nota_idnota as id ,nota.nombre,COUNT(*) as total FROM persona_has_nota join nota on nota.idnota = nota_idnota GROUP BY nota_idnota$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `nota_usuario` (IN `idpersona` INT)  READS SQL DATA
    SQL SECURITY INVOKER
SELECT nota_idnota as id ,nota.nombre,COUNT(*) as total FROM persona_has_nota join nota on nota.idnota = nota_idnota WHERE persona_has_nota.persona_idpersona = idpersona GROUP BY nota_idnota$$

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
  `rol_idrol` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`idpersona`, `cedula`, `nombre`, `apellido`, `email`, `telefono`, `rol_idrol`, `updated_at`, `created_at`) VALUES
(1, '1719223016', 'Darwin Fernando', 'Casame Gualotuña', 'fernandocasame7@gmail.com', '0995279067', 2, NULL, NULL),
(2, '1719223017', 'Christian David', 'Anasi Gualotuña', 'crd@gmail.com', '0999999999', 1, NULL, NULL),
(3, '1719223018', 'Fernando', 'Casame', 'cdarfgvn@gmail.com', '0999999999', 2, NULL, NULL);

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
(15, 1, 2, '2020-01-30', '12:07:13', '2020-01-30 17:07:13', '2020-01-30 17:07:13'),
(16, 1, 1, '2020-02-02', '08:09:59', '2020-02-02 13:09:59', '2020-02-02 13:09:59'),
(17, 1, 2, '2020-02-03', '12:40:15', '2020-02-03 17:40:15', '2020-02-03 17:40:15');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona_has_nota`
--

CREATE TABLE `persona_has_nota` (
  `id` int(11) NOT NULL,
  `persona_idpersona` int(11) NOT NULL,
  `nota_idnota` int(11) NOT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `persona_has_nota`
--

INSERT INTO `persona_has_nota` (`id`, `persona_idpersona`, `nota_idnota`, `updated_at`, `created_at`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 1, NULL, NULL),
(3, 1, 2, NULL, NULL),
(4, 2, 4, NULL, NULL),
(8, 1, 2, NULL, NULL),
(9, 3, 2, NULL, NULL),
(10, 1, 3, NULL, NULL),
(11, 3, 2, NULL, NULL),
(12, 3, 2, NULL, NULL),
(13, 2, 2, NULL, NULL),
(14, 2, 1, NULL, NULL),
(15, 1, 3, NULL, NULL),
(16, 3, 2, NULL, NULL),
(17, 3, 2, NULL, NULL),
(18, 1, 1, '2020-02-02 16:19:16', '2020-02-02 16:19:16'),
(19, 1, 1, '2020-02-03 00:02:39', '2020-02-03 00:02:39'),
(20, 1, 1, '2020-02-03 00:09:18', '2020-02-03 00:09:18'),
(21, 1, 1, '2020-02-03 00:24:01', '2020-02-03 00:24:01'),
(22, 1, 1, '2020-02-03 00:25:31', '2020-02-03 00:25:31'),
(23, 1, 1, '2020-02-03 00:28:14', '2020-02-03 00:28:14'),
(24, 1, 1, '2020-02-03 00:29:37', '2020-02-03 00:29:37'),
(25, 1, 2, '2020-02-03 00:29:54', '2020-02-03 00:29:54'),
(26, 1, 1, '2020-02-03 00:30:09', '2020-02-03 00:30:09'),
(27, 1, 4, '2020-02-03 00:30:36', '2020-02-03 00:30:36'),
(28, 1, 3, '2020-02-03 00:30:41', '2020-02-03 00:30:41'),
(29, 1, 2, '2020-02-03 00:30:41', '2020-02-03 00:30:41'),
(30, 1, 1, '2020-02-03 00:30:42', '2020-02-03 00:30:42'),
(31, 1, 1, '2020-02-03 00:48:28', '2020-02-03 00:48:28'),
(32, 1, 1, '2020-02-03 00:48:50', '2020-02-03 00:48:50'),
(33, 1, 1, '2020-02-03 00:49:02', '2020-02-03 00:49:02'),
(34, 1, 1, '2020-02-03 00:50:00', '2020-02-03 00:50:00'),
(35, 1, 2, '2020-02-03 00:55:29', '2020-02-03 00:55:29'),
(36, 1, 1, '2020-02-03 01:00:15', '2020-02-03 01:00:15'),
(37, 1, 2, '2020-02-03 01:03:05', '2020-02-03 01:03:05'),
(38, 1, 1, '2020-02-03 14:28:21', '2020-02-03 14:28:21');

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
  MODIFY `idpersona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `persona_has_asistencia`
--
ALTER TABLE `persona_has_asistencia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `persona_has_nota`
--
ALTER TABLE `persona_has_nota`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

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
