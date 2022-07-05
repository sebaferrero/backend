-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 05-07-2022 a las 02:24:43
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
-- Base de datos: `mega_shop`
--
CREATE DATABASE IF NOT EXISTS `mega_shop` DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish2_ci;
USE `mega_shop`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) NOT NULL,
  `line1` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `line2` varchar(255) COLLATE utf8_spanish2_ci DEFAULT NULL,
  `city` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `state` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `country` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_spanish2_ci NOT NULL,
  `pincode` float(12,0) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_spanish2_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`id`, `title`) VALUES
(1, 'Zapatillas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `orders_details`
--

CREATE TABLE `orders_details` (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `images` text COLLATE utf8_spanish2_ci DEFAULT NULL,
  `description` text COLLATE utf8_spanish2_ci NOT NULL,
  `price` float(16,2) NOT NULL,
  `quantity` int(10) NOT NULL,
  `shot_desc` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `cat_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `image`, `images`, `description`, `price`, `quantity`, `shot_desc`, `cat_id`) VALUES
(1, 'Zapatillas Nike Air Max 200', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dwaa5211b9/products/NI_AT6175-100/NI_AT6175-100-1.JPG', NULL, 'asd', 21099.00, 0, '1', 1),
(4, 'Zapatillas Nike Air Force 1 07 Lv8', 'https://www.moov.com.ar/dw/image/v2/BDTF_PRD/on/demandware.static/-/Sites-dabra-catalog/default/dwbc424bee/products/NI_DH7568-002/NI_DH7568-002-1.JPG?sw=400&sh=400', NULL, 'Las zapatillas Nike Air Force 1 ´07 Lv8 forman parte del equipo ficticio de atletismo . Traen la inspiración de los 70 a los elementos básicos de la moda urbana. Están combinadas con la diversión del estilo retro del básquetbol ofreciendo un remaster de lo que ya conocés: superposiciones cosidas, colores llamativos, el logo Swoosh en grande y combinaciones en gamuza para dar mayor resalte y sensación de suavidad. El toque final se lo da el parche letterman del talón que suman un estilo universitario. Este es tu calzado favorito para dentro y fuera de la cancha sin dudas ¿no?', 27999.00, 100, '', 1),
(5, 'Zapatillas Nike Air Force 1 \'07 Essential', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw099bfb3d/products/NI_DH4406-101/NI_DH4406-101-1.JPG', NULL, 'Este modelo le da un toque fresco a las características más recordadas: revestimientos cosidos, colores audaces y la cantidad perfecta de estilo para que te destaques. Las Zapatillas Nike Air Force 1 \'07 Essential fueron diseñadas originalmente para el básquetbol de alto rendimiento ya que su amortiguación Nike Air agrega comodidad ligera durante todo el día. Además, la suela de goma de largo completo asegura tracción y durabilidad. Un calzado para que te muevas cómoda y eficazmente sin perder tu peculiar estilo.', 25999.00, 10, '', 1),
(6, 'Zapatillas Nike Air Force 1 \'07 Essential', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw4e08044c/products/NI_DH4406-102/NI_DH4406-102-1.JPG', NULL, 'Este modelo le da un toque fresco a las características más recordadas: revestimientos cosidos, colores audaces y la cantidad perfecta de estilo para que te destaques. Las Zapatillas Nike Air Force 1 \'07 Essential fueron diseñadas originalmente para el básquetbol de alto rendimiento ya que su amortiguación Nike Air agrega comodidad ligera durante todo el día. Además, la suela de goma de largo completo asegura tracción y durabilidad. Un calzado para que te muevas cómoda y eficazmente sin perder tu peculiar estilo.', 25999.00, 10, '', 1),
(7, 'Zapatillas Nike Air Force 1 Lv8', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw2196142f/products/NI_DH9597-003/NI_DH9597-003-1.JPG', NULL, 'Con un estilo de herencia, las Zapatillas Nike Air Force 1 Lv8 mueven multitudes. Los más jóvenes de la familia van a disfrutar de la comodidad que ofrece su sistema de amortiguación Air-Sole y el diseño urbano inspirado en el básquet. Una capellada de cuero y cuero sintético mejora su durabilidad y es fácil de limpiar, para acompañarlos junto con una suela de goma que optimiza la tracción, en todas sus aventuras.', 23999.00, 10, '', 1),
(8, 'Zapatillas Nike Air Force 1 Fontanka', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw2bd4700b/products/NI_DH1290-001/NI_DH1290-001-1.JPG', NULL, 'Las Zapatillas Nike Air Force 1 Fontanka cuentan con una plataforma elevada, detalles en gamuza y una capellada de cuero que aporta durabilidad y un estilo propio. La espuma en el talón mejora la amortiguación y el diseño inspirado en el básquet te permite lucirlas en donde quieras, ya que combina moda y deporte a la perfección. Su suela de goma aporta tracción y las perforaciones mejoran la ventilación para brindarte todos los beneficios que necesitas en tu rutina.', 31999.00, 10, '', 1),
(9, 'Zapatillas Nike Air Force 1 Fontanka', 'https://www.moov.com.ar/on/demandware.static/-/Sites-dabra-catalog/default/dw1106243e/products/NI_DA7024-101/NI_DA7024-101-1.JPG', NULL, 'Las Zapatillas Nike Air Force 1 Fontanka se inspiran en la escena underground rusa de los 90s para un diseño original y urbano. La parte superior en capas cuenta con perforaciones para favorecer la ventilación y la suela de goma suma tracción y durabilidad y brinda una sensación de confort en cada pisada. Luci un look único y moderno y combinalas con cualquiera de tus prendas sin perder la elegancia y el estilo que te caracterizan.', 27999.00, 10, '', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `username` varchar(80) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_spanish2_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `fname` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `lname` varchar(50) COLLATE utf8_spanish2_ci NOT NULL,
  `age` smallint(3) NOT NULL,
  `role` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `email`, `fname`, `lname`, `age`, `role`) VALUES
(1, 'Prueba', '1', 'prueba@gmail.com', 'Prueba', 'Ferrero', 20, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `userts` (`user_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users` (`user_id`);

--
-- Indices de la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `orders` (`order_id`),
  ADD KEY `products` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`cat_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `addresses`
--
ALTER TABLE `addresses`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `userts` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `orders_details`
--
ALTER TABLE `orders_details`
  ADD CONSTRAINT `orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `category` FOREIGN KEY (`cat_id`) REFERENCES `categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
