-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 19-06-2018 a las 19:56:42
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_evaluations`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignatura`
--

CREATE TABLE `asignatura` (
  `codigo` varchar(7) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `id_programa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`id`, `nombre`) VALUES
(1, 'Ingeniería de Sistemas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docente`
--

CREATE TABLE `docente` (
  `codigo` varchar(5) NOT NULL,
  `id_persona` varchar(11) NOT NULL,
  `id_tipo_docente` int(11) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `docente`
--

INSERT INTO `docente` (`codigo`, `id_persona`, `id_tipo_docente`, `id_departamento`) VALUES
('01080', '1093783417', 1, 1),
('01995', '1093783416', 2, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiante`
--

CREATE TABLE `estudiante` (
  `codigo` varchar(7) NOT NULL,
  `id_persona` varchar(11) NOT NULL,
  `id_programa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `estudiante`
--

INSERT INTO `estudiante` (`codigo`, `id_persona`, `id_programa`) VALUES
('1151177', '1093783415', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EstudianteAsignatura`
--

CREATE TABLE `EstudianteAsignatura` (
  `id_estudiante` varchar(7) NOT NULL,
  `id_grupo` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion`
--

CREATE TABLE `evaluacion` (
  `id` int(11) NOT NULL,
  `resultado` decimal(2,0) NOT NULL,
  `descripcion` varchar(500) NOT NULL,
  `id_tipo_evaluacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EvaluacionDocente`
--

CREATE TABLE `EvaluacionDocente` (
  `codigo_docente` varchar(5) NOT NULL,
  `id_evaluacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `EvaluacionEstudiante`
--

CREATE TABLE `EvaluacionEstudiante` (
  `id` int(11) NOT NULL,
  `codigo_estudiante` varchar(7) NOT NULL,
  `id_grupo` char(1) NOT NULL,
  `id_evaluacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `grupo`
--

CREATE TABLE `grupo` (
  `id` char(1) NOT NULL,
  `codigo_asignatura` varchar(7) NOT NULL,
  `id_docente` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `dni` varchar(10) NOT NULL,
  `nombres` varchar(45) NOT NULL,
  `apellidos` varchar(45) NOT NULL,
  `celular` varchar(10) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`dni`, `nombres`, `apellidos`, `celular`, `direccion`, `correo`) VALUES
('1093783415', 'Lizeth', 'Rios Epalza', '3006741974', 'Mz 3 Lote 97 BR. Valles de Giron', 'lizethre@ufps.edu.co'),
('1093783416', 'Judith del Pilar', 'Rodriguez Tenjo', '3006741975', 'Av 0 Cll 0 # 0-0 BR.', 'judithdelpilarrt@ufps.edu.co'),
('1093783417', 'Oscar Alberto', 'Gallardo Perez', '3', 'Mz 5 Lote 97 BR. Valles de Giron', 'oscargallardo@ufps.edu.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pregunta`
--

CREATE TABLE `pregunta` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `id_evaluacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programa`
--

CREATE TABLE `programa` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `id_departamento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `programa`
--

INSERT INTO `programa` (`id`, `nombre`, `id_departamento`) VALUES
(1, 'Ingeniería de Sistemas', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestaDocente`
--

CREATE TABLE `respuestaDocente` (
  `id` int(11) NOT NULL,
  `codigo_docente` varchar(5) NOT NULL,
  `id_evaluacion` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestaEstudiante`
--

CREATE TABLE `respuestaEstudiante` (
  `id_Evaluacion_Estudiante` int(11) NOT NULL,
  `respuesta` int(11) NOT NULL,
  `id_pregunta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoDocente`
--

CREATE TABLE `tipoDocente` (
  `id` int(11) NOT NULL,
  `nombre` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `tipoDocente`
--

INSERT INTO `tipoDocente` (`id`, `nombre`) VALUES
(1, 'Director'),
(2, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipoEvaluacion`
--

CREATE TABLE `tipoEvaluacion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `usuario` varchar(7) NOT NULL,
  `clave` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`usuario`, `clave`) VALUES
('01080', 'oscar'),
('01995', 'pilar'),
('1151177', 'lizeth');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `docente`
--
ALTER TABLE `docente`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_tipo_docente` (`id_tipo_docente`),
  ADD KEY `id_departamento` (`id_departamento`);

--
-- Indices de la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD PRIMARY KEY (`codigo`),
  ADD KEY `id_persona` (`id_persona`),
  ADD KEY `id_carrera` (`id_programa`),
  ADD KEY `id_programa` (`id_programa`);

--
-- Indices de la tabla `EstudianteAsignatura`
--
ALTER TABLE `EstudianteAsignatura`
  ADD PRIMARY KEY (`id_estudiante`,`id_grupo`),
  ADD KEY `id_grupo` (`id_grupo`);

--
-- Indices de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_tipo_evaluacion` (`id_tipo_evaluacion`);

--
-- Indices de la tabla `EvaluacionDocente`
--
ALTER TABLE `EvaluacionDocente`
  ADD PRIMARY KEY (`codigo_docente`,`id_evaluacion`),
  ADD KEY `id_evaluacion` (`id_evaluacion`);

--
-- Indices de la tabla `EvaluacionEstudiante`
--
ALTER TABLE `EvaluacionEstudiante`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_estudiante` (`codigo_estudiante`),
  ADD KEY `id_grupo` (`id_grupo`),
  ADD KEY `id_evaluacion` (`id_evaluacion`);

--
-- Indices de la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_asignatura` (`codigo_asignatura`),
  ADD KEY `id_docente` (`id_docente`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`dni`);

--
-- Indices de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_evaluacion` (`id_evaluacion`);

--
-- Indices de la tabla `programa`
--
ALTER TABLE `programa`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `respuestaDocente`
--
ALTER TABLE `respuestaDocente`
  ADD PRIMARY KEY (`id`),
  ADD KEY `codigo_docente` (`codigo_docente`),
  ADD KEY `id_evaluacion` (`id_evaluacion`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `respuestaEstudiante`
--
ALTER TABLE `respuestaEstudiante`
  ADD PRIMARY KEY (`id_Evaluacion_Estudiante`,`id_pregunta`),
  ADD KEY `id_pregunta` (`id_pregunta`);

--
-- Indices de la tabla `tipoDocente`
--
ALTER TABLE `tipoDocente`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tipoEvaluacion`
--
ALTER TABLE `tipoEvaluacion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamento`
--
ALTER TABLE `departamento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `EvaluacionEstudiante`
--
ALTER TABLE `EvaluacionEstudiante`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pregunta`
--
ALTER TABLE `pregunta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `programa`
--
ALTER TABLE `programa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `respuestaDocente`
--
ALTER TABLE `respuestaDocente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipoDocente`
--
ALTER TABLE `tipoDocente`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tipoEvaluacion`
--
ALTER TABLE `tipoEvaluacion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignatura`
--
ALTER TABLE `asignatura`
  ADD CONSTRAINT `asignatura_ibfk_1` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `docente`
--
ALTER TABLE `docente`
  ADD CONSTRAINT `docente_ibfk_2` FOREIGN KEY (`id_tipo_docente`) REFERENCES `tipoDocente` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docente_ibfk_3` FOREIGN KEY (`id_departamento`) REFERENCES `departamento` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docente_ibfk_4` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `docente_ibfk_5` FOREIGN KEY (`codigo`) REFERENCES `usuario` (`usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `estudiante`
--
ALTER TABLE `estudiante`
  ADD CONSTRAINT `estudiante_ibfk_2` FOREIGN KEY (`id_programa`) REFERENCES `programa` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_3` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`dni`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiante_ibfk_4` FOREIGN KEY (`codigo`) REFERENCES `usuario` (`usuario`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `EstudianteAsignatura`
--
ALTER TABLE `EstudianteAsignatura`
  ADD CONSTRAINT `EstudianteAsignatura_ibfk_1` FOREIGN KEY (`id_estudiante`) REFERENCES `estudiante` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `EstudianteAsignatura_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `grupo` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `evaluacion`
--
ALTER TABLE `evaluacion`
  ADD CONSTRAINT `evaluacion_ibfk_1` FOREIGN KEY (`id_tipo_evaluacion`) REFERENCES `tipoEvaluacion` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `EvaluacionDocente`
--
ALTER TABLE `EvaluacionDocente`
  ADD CONSTRAINT `EvaluacionDocente_ibfk_1` FOREIGN KEY (`codigo_docente`) REFERENCES `docente` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `EvaluacionDocente_ibfk_2` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluacion` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `EvaluacionEstudiante`
--
ALTER TABLE `EvaluacionEstudiante`
  ADD CONSTRAINT `EvaluacionEstudiante_ibfk_1` FOREIGN KEY (`codigo_estudiante`) REFERENCES `EstudianteAsignatura` (`id_estudiante`) ON UPDATE CASCADE,
  ADD CONSTRAINT `EvaluacionEstudiante_ibfk_2` FOREIGN KEY (`id_grupo`) REFERENCES `EstudianteAsignatura` (`id_grupo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `EvaluacionEstudiante_ibfk_3` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluacion` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `grupo`
--
ALTER TABLE `grupo`
  ADD CONSTRAINT `grupo_ibfk_1` FOREIGN KEY (`codigo_asignatura`) REFERENCES `asignatura` (`codigo`) ON UPDATE CASCADE,
  ADD CONSTRAINT `grupo_ibfk_2` FOREIGN KEY (`id_docente`) REFERENCES `docente` (`codigo`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pregunta`
--
ALTER TABLE `pregunta`
  ADD CONSTRAINT `pregunta_ibfk_1` FOREIGN KEY (`id_evaluacion`) REFERENCES `evaluacion` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestaDocente`
--
ALTER TABLE `respuestaDocente`
  ADD CONSTRAINT `respuestaDocente_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestaDocente_ibfk_2` FOREIGN KEY (`codigo_docente`) REFERENCES `EvaluacionDocente` (`codigo_docente`) ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestaDocente_ibfk_3` FOREIGN KEY (`id_evaluacion`) REFERENCES `EvaluacionDocente` (`id_evaluacion`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `respuestaEstudiante`
--
ALTER TABLE `respuestaEstudiante`
  ADD CONSTRAINT `respuestaEstudiante_ibfk_1` FOREIGN KEY (`id_pregunta`) REFERENCES `pregunta` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `respuestaEstudiante_ibfk_2` FOREIGN KEY (`id_Evaluacion_Estudiante`) REFERENCES `EvaluacionEstudiante` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
