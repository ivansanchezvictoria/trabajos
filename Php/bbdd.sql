-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-12-2015 a las 22:55:40
-- Versión del servidor: 5.6.24
-- Versión de PHP: 5.6.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `examen`
--

-- --------------------------------------------------------

--
-- Estructura de la tabla `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `cod_rol` int NOT NULL,
  `rol` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`cod_rol`);

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `roles` (`cod_rol`, `rol`) VALUES
(0, 'Limitado'), (1, 'Administrador'), (2, 'RRHH'), (3, 'Finanzas'), (4, 'Ventas');

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario` varchar(25) NOT NULL,
  `password` varchar(32) NOT NULL,
  `email` varchar(25) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellidos` varchar(70) NOT NULL,
  `rol` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usuario`),
  ADD FOREIGN KEY (`rol`) REFERENCES `roles`(`cod_rol`)
  ON UPDATE CASCADE 
  ON DELETE CASCADE;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usuario`, `password`, `email`, `nombre`, `apellidos`, `rol`) VALUES
('admin', 'admin', 'admin@admin.com', 'Boss', 'Super Boss', 1),
('jose', 'jose', 'jose@empresa.com', 'Ana', 'Jose Cruz', 2),
('ana', 'ana', 'ana@gmail.com', 'Ana', 'García González', 3);



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
