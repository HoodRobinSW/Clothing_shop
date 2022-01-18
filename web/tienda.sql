-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2021 at 08:11 PM
-- Server version: 8.0.27-0ubuntu0.20.04.1
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tienda`
--

-- --------------------------------------------------------

--
-- Table structure for table `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL,
  `nombre` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'camisetas'),
(2, 'pantalones'),
(3, 'sudaderas'),
(4, 'chaquetas'),
(5, 'camisas');

-- --------------------------------------------------------

--
-- Table structure for table `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id_pedido` int DEFAULT NULL,
  `id_detalle` int NOT NULL,
  `cantidad` int DEFAULT NULL,
  `id_producto` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pedido`
--

CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL,
  `id_usuario` int NOT NULL,
  `fecha_pedido` date NOT NULL,
  `total_pedido` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producto`
--

CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(20) DEFAULT NULL,
  `precio` double DEFAULT NULL,
  `id_categoria` int NOT NULL,
  `foto` varchar(20) DEFAULT NULL,
  `descuento` double NOT NULL,
  `descripcion` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `producto`
--

INSERT INTO `producto` (`id_producto`, `nombre`, `precio`, `id_categoria`, `foto`, `descuento`, `descripcion`) VALUES
(1, 'Unity Stacked', 20, 1, '1.png', 0, 'Manga corta Tejido: Tejido en punto jersey peinado\r\nEstampado en parte delantera Corte: corte normal'),
(2, 'Surfreport', 30, 1, '2.png', 0, ' Tejido: Tejido de algodón [160 g / m2]\r\nCorte: Corte moderno, con la longitud más larga de un corte normal y una silueta más estilizada\r\nCuello: cuello redondo\r\nSerigrafía en parte delantera y la espalda'),
(3, 'Arch', 25, 1, '3.png', 0, 'Manga corta\r\nTejido de punto peinado [160 g/m2]\r\nEstampado en parte delantera'),
(4, 'Tucked', 25, 1, '4.png', 0, 'Tejido: Punto jersey de algodón peinado [160 g / m2]\r\nEstampado en parte delantera\r\nEtiqueta de tela en el lateral'),
(5, 'Bad Billy', 35, 1, '5.png', 0, 'Tela ligera teñida\r\nTela: algodón puro con hilado continuo de anillos\r\nDiseño con manga corta'),
(6, 'Die Cut Theme', 30, 1, '6.png', 0, 'Manga corta\r\nTela: tejido de punto jersey peinado\r\nEstampados delanteros y traseros\r\nCorte: corte normal'),
(7, 'Our World', 35, 1, '7.png', 0, 'Serigrafía con tacto suave\r\nEtiqueta sellada con calor en el cuello\r\nTejido: Tejido mezcla de poliéster reciclado y algodón orgánico'),
(8, 'Arch Fill', 30, 1, '8.png', 0, ' Tejido: Tejido de algodón [160 g / m2]\r\nCorte: Corte moderno, con la longitud más larga de un corte normal y una silueta más estilizada\r\nCuello: cuello redondo\r\nSerigrafía en parte delantera y la espalda'),
(9, 'Unity', 23, 1, '9.png', 0, 'Manga corta\r\nTejido de punto peinado [160 g/m2]\r\nEstampado en parte delantera'),
(10, 'Stretch', 38, 1, '10.png', 0.1, 'Mangas: manga corta\r\nTejido:Tejido mezcla de poliéster reciclado y algodón orgánico (160 g/m2)\r\nCorte: corte normal, clásico, cómodo\r\nCuello: cuello redondo\r\nDiseño con serigrafía en la parte delantera y la espalda'),
(11, 'Boundary', 90, 3, '11.png', 0, ' Corte: corte normal, clásico, cómodo\r\nCierre frontal con media cremallera\r\nBolsillo con cremallera en el pecho\r\nCintura con cierre de cincha elástica\r\nTejido Reciclado: Tejido de poliéster reciclado [300 g/m2]'),
(12, 'Badger', 100, 3, '12.png', 0, ' Corte: Corte normal\r\nCapucha y bolsillos acolchados\r\nCordones de tela con puntas recubiertas en plástico\r\nCintura con cierre de cincha elástica\r\nTejido Reciclado: Tejido de poliéster reciclado [300 g/m2]\r\nCierre frontal con media cremallera'),
(13, 'Canyon', 120, 3, '13.png', 0, 'Tejido Reciclado: Tejido de polar de poliéster de grafeno reciclado [240 g/m2]\r\nCorte: Corte normal\r\nRipstop de poliéster tonal en bolsillos del pecho\r\nCintura con cierre elástico'),
(14, 'Hudson', 70, 3, '14.png', 0, ' Corte: corte normal, clásico, cómodo\r\nCintura y puños en punto canalé\r\nSolapa Henley\r\nParche con logo de arco en cuero en el pecho\r\nTejido mezcla de algodón poliéster [330 g/m2]'),
(15, 'Heritage', 75, 3, '15.png', 0, ' tejido: tejido en mezcla de algodón y poliéster\r\nCorte: Corte normal\r\nTejido interior: Cepillado\r\nEstampado por delante y por detrás\r\nLook y sensación vintage por el lavado Wave Washed'),
(16, 'Denver', 65, 3, '16.png', 0.2, '\r\n\r\n    tejido: tejido en mezcla de algodón y poliéster\r\n    Corte: corte normal, clásico, cómodo\r\n    Estampado en parte frontal y posterior'),
(17, 'Walled', 60, 3, '17.png', 0.1, ' tejido: tejido en mezcla de algodón y poliéster\r\nCorte: corte normal, clásico, cómodo\r\nParches con marca ROXY en el pecho'),
(18, 'All Day', 55, 3, '18.png', 0, ' Corte: Corte normal\r\nTejido interior: Interior cepillado\r\nMarca en el pecho\r\nTejido Orgánico/reciclado: Tejido mezcla de algodón orgánico y poliéster reciclado (220 g/m2)'),
(19, 'Bonded Furnace', 100, 3, '19.png', 0, 'Tejido Reciclado: Tejido mezcla de poliéster reciclado y algodón\r\nCorte: Corte normal\r\nBolsillos para las manos con cremallera\r\nBajo ajustable con botón alto'),
(20, 'Rockies', 95, 3, '20.png', 0, ' Tejido: Tejido mezcla de poliéster y algodón\r\nCorte: corte normal, clásico, cómodo\r\nEstampado en parte frontal y posterior'),
(21, 'Wrangler 73 Hemp', 100, 2, '21.png', 0.3, 'Tejido orgánico: Tejido mezcla de algodón orgánico, cáñamo y elastane\r\nCorte: Corte recto ajustado\r\nBragueta: Cierre con cremallera\r\nAncho de pierna de 38,1 cm\r\nBolsillos\r\nParche de cuero en el bolsillo posterior'),
(22, 'Wrangler Bowie', 80, 2, '22.png', 0, ' Tejido: tejido de algodón\r\nCorte: Pierna recta\r\nCintura: Cintura elástica con cierre de cordón ajustable\r\nAncho de pierna de 38,1 cm\r\nBolsillos laterales'),
(23, '73', 70, 2, '23.png', 0, ' Tejido: Tejido de mezcla de algodón y elastano\r\nCorte: Corte recto ajustado\r\nAncho de pierna de 38,1 cm\r\nBolsillos\r\nParche de cuero en el bolsillo posterior'),
(24, '73 Jean', 75, 2, '24.png', 0, 'Corte ajustado, con corte estrecho pero no demasiado ceñido\r\nVaquero elástico con 5 bolsillos\r\nParche de cuero en el bolsillo posterior\r\nTejido vaquero de gramaje medio\r\nAncho de pierna de 38,1 cm\r\nCorte: Corte progresivamente más estrecho en las piernas\r\nLongitud: Longitud 81 cm'),
(25, 'Surftrek Plus', 80, 2, '25.png', 0, 'Tejido: Tejido elástico reciclado de nailon que expulsa la humedad\r\nCorte: Corte normal\r\nBragueta: Cierre con cremallera\r\nBolsillos laterales\r\nBolsillos de ojal trasero con cierre de cremallera y bolsillo lateral oculto con cremallera en la pierna derecha\r\nCintura elástica para mayor confort y elasticidad\r\nCordón lasso en la cintura que se puede ajustar por dentro y por fuera\r\nTransferencia Surftrek en el interior de la cinturilla'),
(26, '73 - Pantalon Chino', 70, 2, '26.png', 0.2, 'Corte ajustado, con corte estrecho pero no demasiado ceñido\r\nTela: sarga elástica y ligera\r\nEstilo chino\r\nAncho de pierna de 38,1 cm\r\nCorte: corte de pierna recta\r\nDiseño de largo completo'),
(27, 'Hudson - Chandal', 55, 2, '27.png', 0, ' tejido: tejido en mezcla de algodón y poliéster\r\nBragueta/cintura: __Cintura elástica\r\nPuños elásticos\r\nEtiqueta de cuero sintético con forma de rombo en el bolsillo trasero'),
(28, 'Furnace - Tracksuit', 60, 2, '28.png', 0.1, 'Furnace fleece\r\nElasticated waistband and cuff openings\r\nRear patch pocket with snap closure\r\nRecycled Fabric: Recycled polyester fabric [270 g/m2]'),
(29, 'Boundary Burkard', 90, 2, '29.png', 0, 'Peso del tejido\r\nTejido: Tejido de poliéster [300 g / m2]\r\nCintura: Cintura elástica\r\nCierre con cincha elástica en los puños\r\nParche de ripstop acolchado en las rodillas\r\nBolsillo con cremallera'),
(30, 'Simpsons Family', 65, 2, '30.png', 0, 'Fabric: Brushed, cotton polyester blend fabric [300 g/m2]\r\nCuffs: Elastic bungee cinch closure on cuffs\r\nPocket: Back patch pocket with zip closure\r\nAdventure Division'),
(31, 'Journey Puffer', 100, 4, '31.png', 0, 'Tejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\ntejido reciclado: tejido reciclado de nailon\r\nCorte: corte normal, clásico, cómodo\r\ncapucha: capucha ajustable\r\nTejido reciclado: Tejido cuadrado de tafetán reciclado\r\nAislante reciclado\r\nBolsillos: 2 bolsillos para manos, bolsillo con cremallera en el pecho\r\ncierre: cierre con cremallera\r\nBolsillo seguro en el interior\r\nPuños elásticos\r\nParche de silicona con marca en el pecho'),
(32, 'Broadpeak Po', 180, 4, '32.png', 0, 'Tejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\nTejido Reciclado: Tejido ripstop de nailon reciclado\r\nCorte: corte normal, clásico, cómodo\r\ncapucha: capucha ajustable\r\nAcolchado de plumón reciclado\r\nTejido interior en tafetán\r\nBolsillos: 2 bolsillos con cremallera, 1 bolsillo de parche\r\nDiseño de jersey\r\nChaqueta térmica ligera con volumen fabricada con plumón reciclado de prendas usadas\r\nCertificado Responsible Down Standard'),
(33, 'Transport Stretch', 170, 4, '33.png', 0, 'Impermeabilidad: Impermeabilidad 10K\r\nTejido Reciclado: Tejido de lona reciclada\r\nCorte: corte normal, clásico, cómodo\r\ncapucha: capucha ajustable\r\nTejido interior: tafetán acolchado\r\nBolsillos: 2 bolsillos con cremallera\r\ncierre: cierre con cremallera'),
(34, 'Journey Plus', 150, 4, '34.png', 0, 'Tejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\nCorte: corte normal, clásico, cómodo\r\nTejido interior: Tejido interior reciclado\r\nAislante: Aislante Primaloft reciclado\r\nBolsillos: 2 bolsillos para manos, 1 bolsillo con cremallera en el pecho\r\nCierre: cierre frontal con cremallera'),
(35, 'Bus Stop', 90, 4, '35.png', 0, 'Tejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\nTejido: tejido de poliéster\r\nCorte: corte normal, clásico, cómodo\r\nTejido interior: Tejido interior en cuadros de tafetán\r\nAcolchado Polyfill 120g\r\nBolsillos: 2 bolsillos\r\ncierre: cierre con cremallera'),
(36, 'BroadPeak Puffer', 230, 4, '36.png', 0.1, 'Tejido Reciclado: Tejido ripstop de nailon reciclado\r\nCorte: corte normal, clásico, cómodo\r\ncapucha: capucha ajustable\r\nAcolchado de plumón reciclado\r\nTejido interior en tafetán\r\nBolsillos: 2 bolsillos para manos, bolsillo con cremallera en el pecho\r\ncierre: cierre con cremallera'),
(37, 'Journey Coach', 100, 4, '37.png', 0.1, 'Tejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\ntejido reciclado: tejido reciclado de nailon\r\nCorte: corte normal, clásico, cómodo\r\nTejido interior: Tejido de tafetán reciclado\r\nAislante reciclado'),
(38, 'Alves', 160, 4, '38.png', 0, 'Tejido: Tejido de poliéster con tinte espacial\r\nTratamiento de 3000 mm y tratamiento resistente al agua duradero DWR\r\nTejido interior acolchado en quilt cuadrado\r\nTafetán y 120 g de aislante en el cuerpo y 100 g en las mangas\r\nCapucha y puños ajustables'),
(39, 'Switchback', 130, 4, '39.png', 0, 'RECYCLED FABRIC: RECYCLED POLYESTER ON SHELL SIDE WITH DURABLE WATER REPELLENT COATING TO KEEP YOU DRY AND PROTECTED FROM THE ELEMENTS\r\nBolsillos: Bolsillos para las manos con cierre de botón a presión\r\nBolsillo cuadrado con cierre de botón\r\nPuños elásticos\r\nParche de silicona en el pecho'),
(40, 'Wrangler Maverick', 140, 4, '40.png', 0, 'Tejido orgánico: Tejido orgánico de algodón\r\nCorte: corte normal, clásico, cómodo\r\nBolsillos: 2 bolsillos\r\ncierre: cierre con cremallera'),
(41, 'Wrangler West', 85, 5, '41.png', 0, 'Diseño elástico\r\nTejido orgánico: Tejido orgánico en sarga de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre: Cierre con botones\r\nDiseño con estampado total\r\nBolsillos dobles en el pecho\r\nPuños con botones'),
(42, 'Wrangler Bowwie', 85, 5, '42.png', 0, ' Mangas: Mangas largas\r\ntejido: tejido de pana de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre / Cuello: Cierre con botones\r\nBolsillo en el pecho\r\nPaneles estampados en el interior\r\nPuños con botones'),
(43, 'Wrangler Bowwie 2', 85, 5, '43.png', 0, ' Mangas: Mangas largas\r\ntejido: tejido de pana de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre / Cuello: Cierre con botones\r\nBolsillo en el pecho\r\nPaneles estampados en el interior\r\nPuños con botones'),
(44, 'Wrangler Morgan', 85, 5, '44.png', 0, 'Manga larga\r\nDiseño elástico\r\nTejido orgánico: Tejido orgánico de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre/cuello: cierre con botones\r\nDos bolsillos en el pecho con corchetes metálicos\r\nPanel interior estampado\r\nDetalle bordado en la parte trasera'),
(45, 'Eternal Flannel', 60, 5, '45.png', 0.1, ' Tejido: tejido de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre / Cuello: Cierre con botones\r\nPuños abotonados y bolsillo en el pecho'),
(46, 'Furnace Bonded', 95, 5, '46.png', 0, 'Tejido: Tejido mezcla de algodón orgánico reciclado y poliéster\r\nTejido en mezcla de algodón y poliéster [capucha]\r\nCorte: corte normal, clásico, cómodo\r\nCierre: Cierre con botones\r\nTejido con tratamiento duradero repelente al agua [DWR]. Te mantiene seco y protegido de los elementos.\r\nCapucha polar desmontable con interior sherpa y cordones ajustables'),
(47, 'Coastline', 70, 5, '47.png', 0, ' tejido: tejido en mezcla de algodón y poliéster\r\nDiseño elástico\r\nCorte: corte normal, clásico, cómodo\r\nCierre / Cuello: Cierre con botones\r\nBolsillo en el pecho\r\nPrenda lavada'),
(48, 'Wrangler Knox', 85, 5, '48.png', 0, ' Tejido: tejido jacquard de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre / Cuello: Cierre con botones\r\nBolsillo en el pecho\r\nPaneles estampados en el interior\r\nPuños con botones'),
(49, 'Sundays Floral', 55, 5, '49.png', 0, 'Manga corta\r\nTela: tela elástica y estampada\r\nDiseño con estampado\r\nBolsillo en el pecho\r\nMezcla de algodón y rayón (dependiendo del color)\r\nColores BOG, NVY y PKZ: algodón puro\r\nCorte: corte normal\r\nDiseño con manga corta'),
(50, 'Wrangler Other', 65, 5, '50.png', 0, ' Tejido: tejido de algodón\r\nCorte: corte normal, clásico, cómodo\r\nCierre: Cierre con botones\r\nBolsillos dobles en el pecho');

-- --------------------------------------------------------

--
-- Table structure for table `usuario`
--

CREATE TABLE `usuario` (
  `nick` varchar(20) NOT NULL,
  `pass` varchar(20) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `tipo` varchar(50) DEFAULT 'cliente',
  `codigo_postal` int NOT NULL,
  `telefono` int NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `id_usuario` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `usuario`
--

INSERT INTO `usuario` (`nick`, `pass`, `nombre`, `apellidos`, `tipo`, `codigo_postal`, `telefono`, `direccion`, `id_usuario`) VALUES
('alex', '1234', 'Alejandro', 'Ortega Guerra', 'cliente', 11405, 666666666, 'Algun lugar en Jerez', 1),
('admin', '1234', 'admin', 'admin', 'admin', 0, 0, 'Una direccion', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indexes for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id_detalle`),
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indexes for table `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id_pedido`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_usuario_2` (`id_usuario`);

--
-- Indexes for table `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`id_producto`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id_detalle` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id_pedido` int NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `producto`
--
ALTER TABLE `producto`
  MODIFY `id_producto` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`),
  ADD CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`);

--
-- Constraints for table `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Constraints for table `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
