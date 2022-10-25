-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-10-2022 a las 02:56:52
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `escuela_imst`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `clave` varchar(4) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `horas_totales` tinyint(4) NOT NULL,
  `horas_semana` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignatura`
--

INSERT INTO `asignatura` (`clave`, `nombre`, `horas_totales`, `horas_semana`) VALUES
('1', 'Tutoría', 15, 1),
('111', 'Cálculo Integral', 75, 5),
('112', 'Inglés V', 75, 5),
('113', 'Física II', 60, 4),
('114', 'CTSV', 60, 4),
('142', 'Construye BD', 90, 6),
('143', 'Desarrolla Aplicaciones Web', 90, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrera`
--

CREATE TABLE `carrera` (
  `nombre` varchar(20) NOT NULL,
  `turno` varchar(15) NOT NULL,
  `lider_academia` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrera`
--

INSERT INTO `carrera` (`nombre`, `turno`, `lider_academia`) VALUES
('Contabilidad', 'Mixto', ' Gerardo Dorantes Coronilla'),
('Electricidad', 'Matutino', 'Francisco Aaron Escalante Guerrero'),
('Logistica', 'Mixto', 'Gloria  Aguilar Dorantes'),
('Mecanica', 'Matutino', 'Roberto Hernández González'),
('Programacion', 'Mixto', 'Ricardo Méndez Rojas'),
('Recursos Humanos', 'Mixto', 'Ma. Luisa Ortiz Segovia'),
('Soporte', 'Mixto', 'Palafox Vargas Silvestre');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `num_control` varchar(14) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(30) DEFAULT NULL,
  `edad` tinyint(4) NOT NULL,
  `domicilio` text NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `grupo` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`num_control`, `nombre`, `apellidos`, `edad`, `domicilio`, `telefono`, `grupo`) VALUES
('20311050750513', 'Dulce Alejandra', 'Nuñez Soria', 17, 'Río Ebro 221', '4181011781', '5PV'),
('20311050750515', 'Gloria Yazmin', 'Quevedo Mancilla', 17, 'Dolores 87', '4181324512', '5PV'),
('20311050750523', 'Karol Gabriela', 'Rodríguez Castañeda', 17, 'San Pedro 123A', '4181509840', '5PV'),
('20311050750527', 'Itzel Monserrat', 'Salazar Torres', 17, 'Insurgente Abasolo 215', '4181588448', '5PV');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante_asignatura`
--

CREATE TABLE `estudiante_asignatura` (
  `num_control` varchar(14) NOT NULL,
  `asignatura` varchar(4) NOT NULL,
  `fecha` date NOT NULL,
  `semestre` tinyint(4) NOT NULL,
  `calificacion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estudiante_asignatura`
--

INSERT INTO `estudiante_asignatura` (`num_control`, `asignatura`, `fecha`, `semestre`, `calificacion`) VALUES
('20311050750527', '142', '0000-00-00', 5, 10),
('20311050750527', '143', '0000-00-00', 5, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `nombre` varchar(4) NOT NULL,
  `turno` varchar(10) NOT NULL,
  `representante` varchar(30) DEFAULT NULL,
  `tutor` varchar(30) NOT NULL,
  `carrera` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `grupo`
--

INSERT INTO `grupo` (`nombre`, `turno`, `representante`, `tutor`, `carrera`) VALUES
('5AM', 'Matutino', 'Briana Iraís Juárez', 'Monserrat Banda Arteaga', 'Recursos Humanos'),
('5AV1', 'Vespertino', 'Evelyn Judith Méndez García', 'Gerardo Coronilla Dorantes', 'Recursos Humanos'),
('5AV2', 'Vespertino', 'Luz María Loredo Hernandez', 'Luis Godínez Almaguer', 'Recursos Humanos'),
('5CM', 'Matutino', 'Natalia Isabel Rangel Méndez', 'Jorge Alfonso Quesada Sánchez', 'Contabilidad'),
('5CV', 'Vespertino', 'Camila Arellano', 'Martín Antonio Vazquez Deanda', 'Contabilidad'),
('5E', 'Matutino', 'Azul Bañuelos', 'Francisco Aaron Escalante Guer', 'Electricidad'),
('5LV', 'Vespertino', '', 'José Isabel Arteaga Méndez', 'Logistica'),
('5M', 'Matutino', 'Kevin Rojas Torres', 'Roberto González Hernandez', 'Mecanica'),
('5PM', 'Matutino', 'Leonardo Betancourt', 'Ricardo Méndez Rojas', 'Programación'),
('5PV', 'Vespertino', 'Dulce Alejandra Nuñez Soria', 'Silvia Cecilia Carrillo Mastac', 'Programación'),
('5SM', 'Matutino', 'Pedro Jesús Mulato López', 'Cesar Gonzalez Luna', 'Soporte'),
('5SV', 'Vespertino', 'Juan René Briones Maldonado', 'Carolina Vargas González', 'Soporte');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`clave`);

--
-- Indices de la tabla `carrera`
--
ALTER TABLE `carrera`
  ADD PRIMARY KEY (`nombre`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`num_control`),
  ADD KEY `indice_grupo` (`grupo`);

--
-- Indices de la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD PRIMARY KEY (`num_control`,`asignatura`),
  ADD KEY `asignatura` (`asignatura`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`nombre`),
  ADD KEY `indice_carrera` (`carrera`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `grupo` FOREIGN KEY (`grupo`) REFERENCES `grupo` (`nombre`);

--
-- Filtros para la tabla `estudiante_asignatura`
--
ALTER TABLE `estudiante_asignatura`
  ADD CONSTRAINT `asignatura` FOREIGN KEY (`asignatura`) REFERENCES `asignatura` (`clave`),
  ADD CONSTRAINT `num_control` FOREIGN KEY (`num_control`) REFERENCES `estudiante` (`num_control`);

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `carrera` FOREIGN KEY (`carrera`) REFERENCES `carrera` (`nombre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
