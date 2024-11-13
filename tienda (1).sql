-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-06-2024 a las 16:27:32
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `categoria` varchar(100) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `categoria`, `imagen`, `estado`) VALUES
(1, 'Telefonos ', 'assets/images/categorias/20220805093011.jpg', 1),
(2, 'Tables', 'assets/images/categorias/20220805093028.jpg', 0),
(3, 'FASHION', 'NO', 0),
(4, 'PRUEBA', '', 0),
(5, 'Computadoras', '', 1),
(6, 'prueba', '', 0),
(7, ' SAMSUNG ', '', 1),
(8, 'Televisores', '', 1),
(9, 'Cables', '', 1),
(10, 'Memorias', '', 1),
(11, 'Impresoras', '', 1),
(12, 'Computadoras de Escritorio', '', 1),
(13, 'Electronicos', '', 0),
(14, 'PHONE', '', 1),
(15, 'Adaptadores', '', 1),
(16, 'Conectividad', '', 1),
(17, 'Mauses', '', 1),
(18, 'Techados', '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(80) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(100) NOT NULL DEFAULT 'default.png',
  `token` varchar(100) DEFAULT NULL,
  `verify` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `nombre`, `correo`, `clave`, `perfil`, `token`, `verify`) VALUES
(3, 'David', 'telulealexis@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', '21a66551b83c814b108081b292dc65d2', 1),
(4, 'Alicia', 'doraaliciamendozamorales@gmail.com', '$2y$10$aFqMg0hAfmLz0vUQhPKcPuGQ57zO9bvYDEX83E2yIN5sdwEX/eH5q', 'default.png', NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedidos`
--

CREATE TABLE `detalle_pedidos` (
  `id` int(11) NOT NULL,
  `producto` varchar(255) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_pedidos`
--

INSERT INTO `detalle_pedidos` (`id`, `producto`, `precio`, `cantidad`, `id_pedido`, `id_producto`) VALUES
(1, 'CAMARA WEB', 200.00, 1, 1, 2),
(2, 'TELEVISOR LG', 1500.00, 1, 1, 3),
(3, 'NUEVO PRODUCTO', 5.00, 1, 2, 6),
(4, 'FASHION 2', 3.00, 1, 2, 8),
(5, 'FASHION1', 8.00, 1, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `id_transaccion` varchar(80) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `estado` varchar(30) NOT NULL,
  `fecha` datetime NOT NULL,
  `email` varchar(80) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `proceso` enum('1','2','3') NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `id_transaccion`, `monto`, `estado`, `fecha`, `email`, `nombre`, `apellido`, `direccion`, `ciudad`, `id_cliente`, `proceso`) VALUES
(1, '6PX22696F1040260E', 1700.00, 'COMPLETED', '2023-02-20 17:12:42', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 5, '2'),
(2, '1HJ95121A9582915R', 16.00, 'COMPLETED', '2023-07-10 22:37:24', 'sb-j6jdb7896999@personal.example.com', 'John', 'Doe', 'Free Trade Zone', 'Lima', 3, '2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` longtext NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `imagen` varchar(150) NOT NULL,
  `estado` int(11) NOT NULL DEFAULT 1,
  `id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `cantidad`, `imagen`, `estado`, `id_categoria`) VALUES
(1, 'Smarfone Samsung A24', 'Memoria\r\n4GB RAM + 128 GB ROM,\r\nBatería\r\n5000 mAh\r\nCámara\r\n50MP +5MP +2MP +13MP\r\n', 170.00, 10, 'assets/images/productos/20240603232455.jpg', 0, 1),
(2, 'MOTOROLA G14', 'Cámara\r\n50MP + 2MP + 8MP\r\nPantalla\r\n6.5\r\nBatería\r\n5000 mAh\r\nMemoria\r\n4GB + 128 GB', 120.00, 14, 'assets/images/productos/20240604012706.jpg', 1, 1),
(3, 'HUAWEI NOVA 11i', 'Procesador\r\nQualcomm Snapdragon 680,\r\nMemoria\r\n8 GB RAM + 128 GB ROM\r\nPantalla\r\n6.78\r\nCámara\r\n48MP+2MP+16MP', 229.00, 20, 'assets/images/productos/20240604000351.jpg', 1, 1),
(4, 'HONOR 90', '12 GB RAM + 512 GB ROM', 550.00, 10, 'assets/images/productos/20240604010927.jpg', 1, 1),
(5, 'HONOR X6A PLUS', '\r\nCámara\r\n50MP +2MP +2MP+5MP\r\n\r\nMemoria\r\n5200 mAh\r\n\r\n\r\nMemoria\r\n6 GB RAM + 128 GB ROM', 159.00, 12, 'assets/images/productos/20240604011411.jpg', 1, 1),
(6, 'NUEVO PRODUCTO', '<p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Incidunt, facere.</p><ol><li>Lorem ipsum, dolor sit amet <strong>consectetur</strong> adipisicing elit. Incidunt, facere.</li><li><a href=\"https://angelsifuentes.com/pos\">https://angelsifuentes.com/pos</a></li></ol>', 5.00, 16, 'assets/images/productos/20220806090232.jpg', 0, 2),
(7, 'FASHION1', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 8.00, 5, 'assets/images/productos/fashion1.png', 0, 3),
(8, 'FASHION 2', 'Lorem ipsum, dolor sit amet consectetur adipisicing elit. Consectetur aperiam accusamus incidunt cum laudantium laborum ipsum magni sequi expedita ad, rem esse rerum ea saepe provident! Temporibus corporis atque earum?', 3.00, 12, 'assets/images/productos/fashion2.png', 0, 3),
(10, 'pc portatil dell', 'si se puede', 355.00, 12, 'assets/images/productos/20230710235600.jpg', 1, 5),
(11, 'computadora', '', 450.00, 12, 'assets/images/productos/20240529032604.jpg', 1, 5),
(12, 'Lapto Dell', '', 355.00, 5, 'assets/images/productos/20240530183756.jpg', 1, 5),
(13, 'Lapto hp', '4 de ram', 395.00, 6, 'assets/images/productos/20240530182952.jpg', 1, 5),
(14, 'XIAOMI REDMI NT 11', 'Batería\r\n5000 mAh,\r\nCámara\r\n50mp + 8mp + 2mp + 2mp + 13mp\r\nProcesador\r\nSnapdragon® 680\r\nSistema operativo\r\nAndroid\r\nPantalla\r\n6.43\r\nMemoria\r\n4 GB RAM + 128 GB ROM', 275.00, 15, 'assets/images/productos/20240604012918.jpg', 1, 1),
(15, 'TCL 30 SE 64GB', 'Cámara\r\n50mp + 2mp + 2mp + 8mp\r\nMemoria\r\n4 GB RAM + 64 GB ROM\r\nPantalla\r\n6.52\r\nBatería\r\n5000 mAh', 95.99, 11, 'assets/images/productos/20240604014210.jpg', 1, 1),
(16, 'SAMSUNG GALAXY A15', '', 1500.00, 8, 'assets/images/productos/20240613062748.jpg', 1, 7),
(17, 'fg', '', 234.00, 2, 'assets/images/productos/20240613141416.jpg', 1, 7),
(18, 'pasteles', '', 1.50, 500, 'assets/images/productos/20240614182749.jpg', 0, 8),
(19, 'Televisor LG LED 32', 'Televisor LG LED 32  exportado', 275.00, 4, 'assets/images/productos/20240614165210.jpg', 1, 8),
(20, ' n ch x', '', 234.00, 4, 'assets/images/productos/20240616050646.jpg', 1, 5),
(21, 'televisor LG 42P', '', 663.00, 33, 'assets/images/productos/20240616050728.jpg', 1, 8),
(22, 'smartv 32p', '', 249.00, 23, 'assets/images/productos/20240616050758.jpg', 1, 8),
(23, 'Televiso LG', '', 450.00, 12, 'assets/images/productos/20240616050836.jpg', 1, 8),
(24, 'xmkl c', '', 456.00, 34, 'assets/images/productos/20240616053850.jpg', 0, 9),
(25, 'ndjdn', '', 321.00, 12, 'assets/images/productos/20240616184625.jpg', 0, 10),
(26, 'smar tv plus 32p', '', 325.00, 31, 'assets/images/productos/20240617015506.jpg', 1, 8),
(27, 'skhs', '', 543.00, 22, 'assets/images/productos/20240617052406.jpg', 1, 1),
(28, 'Infinix HOT30i', 'Infinix HOT30i', 135.00, 12, 'assets/images/productos/20240618181612.jpg', 1, 1),
(29, 'Samsung  A55', 'Celular Samsung 256GB 6.6\" Violeta A55\r\n', 515.00, 5, 'assets/images/productos/20240618181926.jpg', 1, 7),
(30, 'Samsung A15', 'Celular Samsung 128GB 6.5\" Negro A15', 170.00, 9, 'assets/images/productos/20240618182213.jpg', 1, 7),
(31, ' iPhone 15 Pro', '', 1600.00, 12, 'assets/images/productos/20240618184308.jpg', 1, 14),
(32, 'iPhone 15 Pro', 'Celular Apple iPhone 15 Pro 128 GB 6.1\" Titanio Negro', 1500.00, 12, 'assets/images/productos/20240618182535.jpg', 1, 14),
(33, 'Epson PT337EPS28  Wifi Negro', '', 400.00, 6, 'assets/images/productos/20240618184834.jpg', 1, 11),
(34, 'EPSON L3250 (WIFI)', '', 250.00, 6, 'assets/images/productos/20240618185629.jpg', 1, 11),
(35, 'EPSON L3250 (WIFI)', '', 285.00, 6, 'assets/images/productos/20240618185757.jpg', 1, 11),
(36, 'MULTIFUNCIONAL HP 720 (WIFI)', '', 285.00, 6, 'assets/images/productos/20240618185929.jpg', 1, 11),
(37, 'HP 3103FDW LASER', '', 415.00, 6, 'assets/images/productos/20240618190102.jpg', 1, 11),
(38, 'EPSON LX-350 (MATRIZ)', '', 350.00, 6, 'assets/images/productos/20240618190250.jpg', 1, 11),
(39, 'HP 7740 (INKJET WIFI FM ANCHO)', '', 415.00, 6, 'assets/images/productos/20240618190407.jpg', 1, 11),
(40, 'BROTHER DCP-T520W|WIFI', '', 475.00, 6, 'assets/images/productos/20240618190517.jpg', 1, 11),
(41, 'BROTHER DCP-T420W|WIFI', '', 215.00, 7, 'assets/images/productos/20240618190715.jpg', 1, 11),
(42, 'MONITOR ASUS VA249HE ', '', 260.00, 8, 'assets/images/productos/20240618195440.jpg', 1, 12),
(43, 'CANON G3170 WIFI', '', 240.00, 6, 'assets/images/productos/20240618190928.jpg', 1, 11),
(44, 'CANON G2170', '', 200.00, 6, 'assets/images/productos/20240618191123.jpg', 1, 11),
(45, ' EPSON L4260 (WIFI)', '', 310.00, 12, 'assets/images/productos/20240618191448.jpg', 1, 11),
(46, ' CANON G3170 WIFI', '', 240.00, 5, 'assets/images/productos/20240618191724.jpg', 1, 11),
(47, 'MONITOR 22 HP 2D9J9AA', '', 225.00, 12, 'assets/images/productos/20240618205438.jpg', 1, 12),
(48, 'MONITOR HP 27 2H1A4AA ', '', 285.00, 9, 'assets/images/productos/20240618205608.jpg', 1, 12),
(49, 'MONITOR HP 24 2W924AA', '', 285.00, 6, 'assets/images/productos/20240618205708.jpg', 1, 12),
(50, 'MONITOR DELL SE2422H', '', 165.00, 6, 'assets/images/productos/20240618205806.jpg', 1, 12),
(51, 'MONITOR ASUS GAMING VG27VH1B', '', 325.00, 6, 'assets/images/productos/20240618205920.jpg', 1, 12),
(52, 'MONITOR HP V22V G5 22', '', 165.00, 4, 'assets/images/productos/20240618210221.jpg', 1, 12),
(53, 'Cable VGA Argom ARG-CB-0077', '', 5.25, 25, 'assets/images/productos/20240618230730.jpg', 1, 9),
(54, 'Cable HDMI Argom ARG-CB-1878 ', '', 11.00, 25, 'assets/images/productos/20240618231746.jpg', 1, 9),
(55, 'Cable USB Belkin CAB001', '', 7.25, 26, 'assets/images/productos/20240618232229.jpg', 1, 9),
(56, ' Cable USB Genérico UniversalStile $15.19', '', 16.00, 24, 'assets/images/productos/20240618232319.jpg', 1, 9),
(57, 'Cable USB Argom ARG-CB-0041 ', '', 5.25, 32, 'assets/images/productos/20240618232403.jpg', 1, 9),
(58, 'Cable Estéreo Xtech XTC-315 ', '', 3.00, 15, 'assets/images/productos/20240618232443.jpg', 1, 9),
(59, 'Cable Xtech XTC-110 ', '', 3.25, 12, 'assets/images/productos/20240618232524.jpg', 1, 9),
(60, 'Cable HDMI Etouch 503040 ', '', 14.50, 9, 'assets/images/productos/20240618232600.jpg', 1, 9),
(61, 'Cable USB Belkin CAA001bt1MWH ', '', 14.00, 15, 'assets/images/productos/20240618232651.jpg', 1, 9),
(62, '    Cables  Cable USB Xtech XTC-530 ', '', 9.00, 6, 'assets/images/productos/20240618232731.jpg', 1, 9),
(63, 'Cable USB Xtech XTC365 ', '', 5.00, 7, 'assets/images/productos/20240618232804.jpg', 1, 9),
(64, ' Cable HDMI Xtech XTC-610 $6.99', '', 7.25, 8, 'assets/images/productos/20240618233020.jpg', 1, 9),
(65, 'Cable USB Xtech XTC-352 ', '', 5.75, 7, 'assets/images/productos/20240618233114.jpg', 1, 9),
(66, 'Cable USB Klip Xtreme KAC-210BK ', '', 15.25, 9, 'assets/images/productos/20240618233144.jpg', 1, 9),
(67, 'Cable USB Etouch 735050 ', '', 3.00, 9, 'assets/images/productos/20240618233321.jpg', 1, 9),
(68, ' USB Kingston DTX/128GB ', '', 9.00, 33, 'assets/images/productos/20240618234047.jpg', 1, 10),
(69, 'USB Kingston DTX/256GB', '', 19.25, 25, 'assets/images/productos/20240619011023.jpg', 1, 10),
(70, 'USB Kingston DTXM/64GB', '', 6.25, 15, 'assets/images/productos/20240619011310.jpg', 1, 10),
(71, 'USB Kingston DTKN/128GB', '', 16.25, 9, 'assets/images/productos/20240619011408.jpg', 1, 10),
(72, ' USB Kingston KC-U2L64-7LN Pink', '', 6.00, 8, 'assets/images/productos/20240619011527.jpg', 1, 10),
(73, 'Hub USB 2.0 Genérica USBC-7IN1', '', 42.00, 8, 'assets/images/productos/20240619011759.jpg', 1, 15),
(74, 'Memoria USB Sandisk', '', 15.50, 4, 'assets/images/productos/20240619011921.jpg', 1, 10),
(75, ' USB Kingston DT70/64GB', '', 5.00, 9, 'assets/images/productos/20240619012116.jpg', 1, 10),
(76, 'USB Kingston DTXON/128GB', '', 10.00, 12, 'assets/images/productos/20240619012205.jpg', 1, 10),
(77, 'Adaptador Etouch 600753', '', 3.25, 32, 'assets/images/productos/20240619012332.jpg', 1, 15),
(78, ' Maxell USB-CUBE 4 PORT USB', '', 12.25, 7, 'assets/images/productos/20240619012453.jpg', 1, 15),
(79, 'Xtech XTC-565', '', 16.25, 11, 'assets/images/productos/20240619012548.jpg', 1, 15),
(80, 'Adaptador Etouch 150390', '', 8.23, 5, 'assets/images/productos/20240619012632.jpg', 1, 15),
(81, 'Adaptador Steren USB-4705', '', 5.25, 7, 'assets/images/productos/20240619012724.jpg', 1, 15),
(82, 'Adaptador Steren BLI-USB-537-V11 JHL', '', 12.25, 9, 'assets/images/productos/20240619013057.jpg', 1, 15),
(83, 'Adaptador Xtech XTC-540', '', 14.50, 5, 'assets/images/productos/20240619014032.jpg', 1, 15),
(84, 'Adaptador Steren COM-476', '', 35.00, 4, 'assets/images/productos/20240619014118.jpg', 1, 15),
(85, 'Adaptador de Red USB Etouch 150325', '', 8.25, 7, 'assets/images/productos/20240619014221.jpg', 1, 15),
(86, 'Phone 15 pro', '', 1750.00, 5, 'assets/images/productos/20240619015124.jpg', 1, 14),
(87, 'iPhone 15 Pro', '', 1600.00, 9, 'assets/images/productos/20240619020158.jpg', 1, 14),
(88, 'iPhone 15 Pro', '', 1500.00, 4, 'assets/images/productos/20240619020514.jpg', 1, 14),
(89, 'Amplificador de Red Mercusys ME30', '', 28.00, 5, 'assets/images/productos/20240619023641.jpg', 1, 16),
(90, 'Router TP-Link TL-MR100 4G LTE', '', 65.00, 9, 'assets/images/productos/20240619023902.jpg', 1, 16),
(91, 'Router TP-Link Deco M5 AC1300', '', 220.00, 5, 'assets/images/productos/20240619024023.jpg', 1, 16),
(92, 'Switch TP-Link TL-SG1005D Ver 11.0', '', 22.00, 6, 'assets/images/productos/20240619024123.jpg', 1, 16),
(93, 'Switch TP-Link TL-SF1024 Ver. 9.0', '', 80.00, 5, 'assets/images/productos/20240619024202.jpg', 1, 16),
(94, 'Adaptador de Red USB Xtech XTC-375', '', 15.20, 3, 'assets/images/productos/20240619024701.jpg', 1, 15),
(95, 'Accesorios de Red Smays X001NNG29R', '', 9.00, 12, 'assets/images/productos/20240619024847.jpg', 1, 15),
(96, 'Router MikroTik RB5009UG+S+IN', '', 400.00, 3, 'assets/images/productos/20240619025337.jpg', 1, 16),
(97, 'HP 16GB SSD 512GB 15.6\"', '', 1050.00, 6, 'assets/images/productos/20240619152058.jpg', 1, 5),
(98, 'Gaming HP 32GB 2TB SSD 16\" Negro', '', 2700.00, 9, 'assets/images/productos/20240619152239.jpg', 1, 5),
(99, 'Apple 8GB SSD 256GB 13,3\" ', '', 1000.00, 12, 'assets/images/productos/20240619152413.jpg', 1, 5),
(100, ' Dell 8GB SSD 512 GB 15.6', '', 600.00, 9, 'assets/images/productos/20240619152951.jpg', 1, 5),
(101, 'HP 15-FC0026LA 16GB 15.6', '', 950.00, 12, 'assets/images/productos/20240619153159.jpg', 1, 5),
(102, 'HP 15FC0004LA 8 GB SSD 512 GB 15.6', '', 500.00, 7, 'assets/images/productos/20240619153330.jpg', 1, 5),
(103, 'HP 8GB 256 GB 14\" Plateado', '', 570.00, 12, 'assets/images/productos/20240619153847.jpg', 1, 5),
(104, 'HP 15-FC0026LA 16GB 15.6', '', 935.00, 8, 'assets/images/productos/20240619154009.jpg', 1, 5),
(105, 'Laptop Acer 8GB 14\" Gris A5155557L1', '', 500.00, 9, 'assets/images/productos/20240619154125.jpg', 1, 5),
(106, 'Laptop Lenovo 8GB SSD 512GB 15.6\"', '', 440.00, 12, 'assets/images/productos/20240619154253.jpg', 1, 5),
(107, 'Laptop Lenovo 8GB SSD 512GB 15.6\"', '', 600.00, 9, 'assets/images/productos/20240619154400.jpg', 1, 5),
(108, 'Acer 8GB SSD 512GB 15.6', '', 675.00, 14, 'assets/images/productos/20240619155346.jpg', 1, 5),
(109, 'Mouse Óptico RadioShack Negro ', '', 5.00, 15, 'assets/images/productos/20240619155904.jpg', 1, 17),
(110, 'Mouse Logitech M350 1000 DPI Rosa', '', 35.00, 9, 'assets/images/productos/20240619160207.jpg', 1, 17),
(111, 'Mouse Logitech M170 DPI Blue ', '', 17.00, 9, 'assets/images/productos/20240619160703.jpg', 1, 17),
(112, 'Mouse gamer RadioShack ', '', 16.00, 12, 'assets/images/productos/20240619160854.jpg', 1, 17),
(113, 'Teclado multimedia USB RadioShack', '', 8.00, 12, 'assets/images/productos/20240619161336.jpg', 1, 18),
(114, 'Teclado gaming RadioShack', '', 19.00, 4, 'assets/images/productos/20240619161455.jpg', 1, 18),
(115, 'T. inalámbrico RadioShack', '', 20.00, 9, 'assets/images/productos/20240619161630.jpg', 1, 18);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombres` varchar(100) NOT NULL,
  `apellidos` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(100) NOT NULL,
  `perfil` varchar(50) DEFAULT NULL,
  `estado` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombres`, `apellidos`, `correo`, `clave`, `perfil`, `estado`) VALUES
(1, 'Alexis', 'Telule', 'santostelule13@gmail.com', '$2y$10$XtV68JJ/fABHwWMARZotF.9BHbkwBpquycry2HYOlS.QaUGt/mls2', NULL, 1),
(2, 'Santos', 'Mendoza', 'telulealexis@gmail.com', '$2y$10$ZX9BeymxshOoe/I3pGoIp.6Ai5mrVxN1rdS4nrAQILsOjE9DPwdXW', NULL, 1),
(3, 'Admin', 'Admin', 'innovabross@gmail.com', '$2y$10$jdilSW32eWqW21tJyH1DE.xNmrcheCjEiaEPJs3QW9VWWOvgoclvO', NULL, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_categoria` (`id_categoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedidos`
--
ALTER TABLE `detalle_pedidos`
  ADD CONSTRAINT `detalle_pedidos_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedidos` (`id`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`id_categoria`) REFERENCES `categorias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
