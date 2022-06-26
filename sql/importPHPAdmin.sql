-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th1 24, 2022 lúc 02:44 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 7.3.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `furniture_database`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `categoryName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryId`, `categoryName`, `status`, `createAt`, `updateAt`) VALUES
('BR', 'Bedroom', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('CT', 'Collections', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('DC', 'Decor', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('KC', 'Kitchen', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('LV', 'Livingroom', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `contact`
--

CREATE TABLE `contact` (
  `contactId` int(11) NOT NULL,
  `fullName` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `subject` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `createAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `contact`
--

INSERT INTO `contact` (`contactId`, `fullName`, `email`, `subject`, `message`, `createAt`) VALUES
(2, '', '', '', 'Xin chào, tôi là người Việt Nam, tôi rất thích các sản phẩm của shop', '2022-01-05 13:48:39'),
(3, '', '', '', 'hello Việt Nam', '2022-01-17 19:44:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `image`
--

CREATE TABLE `image` (
  `imageId` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productId` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `image`
--

INSERT INTO `image` (`imageId`, `image`, `productId`) VALUES
(19, 'balmore1_4.jpg', 'BR01'),
(20, 'balmore1_2.jpg', 'BR01'),
(21, 'balmore1_3.jpg', 'BR01'),
(22, 'cory1_4.jpg', 'BR02'),
(23, 'cory1_2.jpg', 'BR02'),
(24, 'cory1_3.jpg', 'BR02'),
(25, 'roscoe1_4.jpg', 'BR03'),
(26, 'roscoe1_2.jpg', 'BR03'),
(27, 'roscoe1_3.jpg', 'BR03'),
(28, 'elona1_4.jpg', 'BR04'),
(29, 'elona1_2.jpg', 'BR04'),
(30, 'elona1_3.jpg', 'BR04'),
(31, 'besley1_4.jpg', 'BR05'),
(32, 'besley1_2.jpg', 'BR05'),
(33, 'besley1_3.jpg', 'BR05'),
(34, 'roscoe2_4.jpg', 'BR06'),
(35, 'roscoe2_2.jpg', 'BR06'),
(36, 'roscoe2_3.jpg', 'BR06'),
(37, 'kooper1_4.jpg', 'BR07'),
(38, 'kooper1_2.jpg', 'BR07'),
(39, 'kooper1_3.jpg', 'BR07'),
(40, 'besley2_4.jpg', 'BR08'),
(41, 'besley2_2.jpg', 'BR08'),
(42, 'besley2_3.jpg', 'BR08'),
(43, 'orsa1_4.jpg', 'BR09'),
(44, 'orsa1_2.jpg', 'BR09'),
(45, 'orsa1_3.jpg', 'BR09'),
(46, 'fenella1_4.jpg', 'BR10'),
(47, 'fenella1_2.jpg', 'BR10'),
(48, 'fenella1_3.jpg', 'BR10'),
(49, 'roscoe3_2.jpg', 'BR11'),
(50, 'roscoe3_3.jpg', 'BR11'),
(51, 'roscoe3_4.jpg', 'BR11'),
(52, 'selu1_4.jpg', 'BR12'),
(53, 'selu1_2.jpg', 'BR12'),
(54, 'selu1_3.jpg', 'BR12'),
(55, 'ogilvy1_4.jpg', 'BR13'),
(56, 'ogilvy1_2.jpg', 'BR13'),
(57, 'ogilvy1_3.jpg', 'BR13'),
(58, 'globe1_4.jpg', 'BR14'),
(59, 'globe1_2.jpg', 'BR14'),
(60, 'globe1_3.jpg', 'BR14'),
(61, 'llaria1_4.jpg', 'BR15'),
(62, 'llaria1_2.jpg', 'BR15'),
(63, 'llaria1_3.jpg', 'BR15'),
(64, 'oro1_4.jpg', 'BR16'),
(65, 'oro1_2.jpg', 'BR16'),
(66, 'oro1_3.jpg', 'BR16'),
(67, 'briz1_4.jpg', 'BR17'),
(68, 'briz1_2.jpg', 'BR17'),
(69, 'briz1_3.jpg', 'BR17'),
(70, 'orion1_4.jpg', 'BR18'),
(71, 'orion1_2.jpg', 'BR18'),
(72, 'orion1_3.jpg', 'BR18'),
(73, 'cheney1_4.jpg', 'BR19'),
(74, 'cheney1_2.jpg', 'BR19'),
(75, 'cheney1_3.jpg', 'BR19'),
(76, 'emmi1_4.jpg', 'BR20'),
(77, 'emmi1_2.jpg', 'BR20'),
(78, 'emmi1_3.jpg', 'BR20'),
(79, 'arles1_4.jpg', 'DC01'),
(80, 'arles1_2.jpg', 'DC01'),
(81, 'arles1_3.jpg', 'DC01'),
(82, 'arles2_4.jpg', 'DC02'),
(83, 'arles2_2.jpg', 'DC02'),
(84, 'arles2_3.jpg', 'DC02'),
(85, 'arles3_4.jpg', 'DC03'),
(86, 'arles3_2.jpg', 'DC03'),
(87, 'arles3_3.jpg', 'DC03'),
(88, 'kameli1_4.jpg', 'DC04'),
(89, 'kameli1_2.jpg', 'DC04'),
(90, 'kameli1_3.jpg', 'DC04'),
(91, 'lafant1_4.jpg', 'DC05'),
(92, 'lafant1_2.jpg', 'DC05'),
(93, 'lafant1_3.jpg', 'DC05'),
(94, 'maxine1_4.jpg', 'DC06'),
(95, 'maxine1_2.jpg', 'DC06'),
(96, 'maxine1_3.jpg', 'DC06'),
(97, 'freda1_4.jpg', 'DC07'),
(98, 'freda1_2.jpg', 'DC07'),
(99, 'freda1_3.jpg', 'DC07'),
(100, 'wilson1_4.jpg', 'DC08'),
(101, 'wilson1_2.jpg', 'DC08'),
(102, 'wilson1_3.jpg', 'DC08'),
(103, 'wilson6_4.jpg', 'DC09'),
(104, 'wilson6_2.jpg', 'DC09'),
(105, 'wilson6_3.jpg', 'DC09'),
(106, 'mala1_4.jpg', 'DC10'),
(107, 'mala1_2.jpg', 'DC10'),
(108, 'mala1_3.jpg', 'DC10'),
(109, 'burley1_4.jpg', 'DC11'),
(110, 'burley1_2.jpg', 'DC11'),
(111, 'burley1_3.jpg', 'DC11'),
(112, 'bran1_4.jpg', 'CT01'),
(113, 'bran1_2.jpg', 'CT01'),
(114, 'bran1_3.jpg', 'CT01'),
(115, 'selin1_4.jpg', 'CT02'),
(116, 'selin1_2.jpg', 'CT02'),
(117, 'selin1_3.jpg', 'CT02'),
(118, 'camden1_4.jpg', 'CT03'),
(119, 'camden1_2.jpg', 'CT03'),
(120, 'camden1_3.jpg', 'CT03'),
(121, 'sulta1_4.jpg', 'CT04'),
(122, 'sulta1_2.jpg', 'CT04'),
(123, 'sulta1_3.jpg', 'CT04'),
(124, 'colter1_4.jpg', 'CT05'),
(125, 'colter1_2.jpg', 'CT05'),
(126, 'colter1_3.jpg', 'CT05'),
(127, 'penn1_4.jpg', 'CT06'),
(128, 'penn1_2.jpg', 'CT06'),
(129, 'penn1_3.jpg', 'CT06'),
(130, 'lyra1_4.jpg', 'CT07'),
(131, 'lyra1_2.jpg', 'CT07'),
(132, 'lyra1_3.jpg', 'CT07'),
(133, 'lrving1_4.jpg', 'CT08'),
(134, 'lrving1_2.jpg', 'CT08'),
(135, 'lrving1_3.jpg', 'CT08'),
(136, 'daven1_4.jpg', 'CT09'),
(137, 'daven1_2.jpg', 'CT09'),
(138, 'daven1_3.jpg', 'CT09'),
(139, 'julius1_4.jpg', 'CT10'),
(140, 'julius1_2.jpg', 'CT10'),
(141, 'julius1_3.jpg', 'CT10'),
(142, 'aza1_4.jpg', 'CT11'),
(143, 'aza1_2.jpg', 'CT11'),
(144, 'aza1_3.jpg', 'CT11'),
(145, 'alana1_4.jpg', 'CT12'),
(146, 'alana1_2.jpg', 'CT12'),
(147, 'alana1_3.jpg', 'CT12'),
(148, 'scott2_4.jpg', 'CT13'),
(149, 'scott2_2.jpg', 'CT13'),
(150, 'scott2_3.jpg', 'CT13'),
(151, 'cher1_4.jpg', 'CT14'),
(152, 'cher1_2.jpg', 'CT14'),
(153, 'cher1_3.jpg', 'CT14'),
(154, 'ledger1_4.jpg', 'CT15'),
(155, 'ledger1_2.jpg', 'CT15'),
(156, 'ledger1_3.jpg', 'CT15'),
(157, 'kacee1_4.jpg', 'CT16'),
(158, 'kacee1_2.jpg', 'CT16'),
(159, 'kacee1_3.jpg', 'CT16'),
(160, 'ritchie1_4.jpg', 'CT17'),
(161, 'ritchie1_2.jpg', 'CT17'),
(162, 'ritchie1_3.jpg', 'CT17'),
(163, 'lostintokyo1_4.jpg', 'CT18'),
(164, 'lostintokyo1_2.jpg', 'CT18'),
(165, 'lostintokyo1_3.jpg', 'CT18'),
(166, 'chicago1_4.jpg', 'CT19'),
(167, 'chicago1_2.jpg', 'CT19'),
(168, 'chicago1_3.jpg', 'CT19'),
(169, 'hitomi1_4.jpg', 'LV01'),
(170, 'hitomi1_2.jpg', 'LV01'),
(171, 'hitomi1_3.jpg', 'LV01'),
(172, 'bessie1_4.jpg', 'LV02'),
(173, 'bessie1_2.jpg', 'LV02'),
(174, 'bessie1_3.jpg', 'LV02'),
(175, 'purcell1_4.jpg', 'LV03'),
(176, 'purcell1_2.jpg', 'LV03'),
(177, 'purcell1_3.jpg', 'LV03'),
(178, 'sete1_4.jpg ', 'LV04'),
(179, 'sete1_2.jpg ', 'LV04'),
(180, 'sete1_3.jpg ', 'LV04'),
(181, 'harlow1_4.jpg ', 'LV05'),
(182, 'harlow1_2.jpg ', 'LV05'),
(183, 'harlow1_3.jpg ', 'LV05'),
(184, 'scott1_4.jpg', 'LV06'),
(185, 'scott1_2.jpg', 'LV06'),
(186, 'scott1_3.jpg', 'LV06'),
(187, 'giselle1_4.jpg', 'LV07'),
(188, 'giselle1_2.jpg', 'LV07'),
(189, 'giselle1_3.jpg', 'LV07'),
(190, 'samona1_4.jpg', 'LV08'),
(191, 'samona1_2.jpg', 'LV08'),
(192, 'samona1_3.jpg', 'LV08'),
(193, 'orson1_4.jpg', 'LV09'),
(194, 'orson1_2.jpg', 'LV09'),
(195, 'orson1_3.jpg', 'LV09'),
(196, 'kahlo1_4.jpg', 'LV10'),
(197, 'kahlo1_2.jpg', 'LV10'),
(198, 'kahlo1_3.jpg', 'LV10'),
(199, 'hampton1_4.jpg', 'LV11'),
(200, 'hampton1_2.jpg', 'LV11'),
(201, 'hampton1_2.jpg', 'LV11'),
(202, 'russo1_4.jpg', 'LV12'),
(203, 'russo1_2.jpg', 'LV12'),
(204, 'russo1_3.jpg', 'LV12'),
(205, 'lottie1_4.jpg', 'LV13'),
(206, 'lottie1_2.jpg', 'LV13'),
(207, 'lottie1_3.jpg', 'LV13'),
(208, 'helma1_4.jpg', 'LV14'),
(209, 'helma1_2.jpg', 'LV14'),
(210, 'helma1_3.jpg', 'LV14'),
(211, 'moby1_4.jpg', 'LV15'),
(212, 'moby1_2.jpg', 'LV15'),
(213, 'moby1_3.jpg', 'LV15'),
(214, 'orson2_4.jpg', 'LV16'),
(215, 'orson2_2.jpg', 'LV16'),
(216, 'orson2_3.jpg', 'LV16'),
(217, 'rami1_4.jpg', 'LV17'),
(218, 'rami1_2.jpg', 'LV17'),
(219, 'rami1_3.jpg', 'LV17'),
(220, 'harlow2_4.jpg', 'LV18'),
(221, 'harlow2_2.jpg', 'LV18'),
(222, 'harlow2_3.jpg', 'LV18'),
(223, 'elvi1_4.jpg', 'LV19'),
(224, 'elvi1_2.jpg', 'LV19'),
(225, 'elvi1_3.jpg', 'LV19'),
(226, 'miro1_4.jpg', 'LV20'),
(227, 'miro1_2.jpg', 'LV20'),
(228, 'miro1_3.jpg', 'LV20'),
(229, 'bridget1_4.jpg', 'LV21'),
(230, 'bridget1_2.jpg', 'LV21'),
(231, 'bridget1_3.jpg', 'LV21'),
(232, 'linden1_4.jpg', 'LV22'),
(233, 'linden1_2.jpg', 'LV22'),
(234, 'linden1_3.jpg', 'LV22'),
(235, 'hetherington1_4.jpg', 'LV23'),
(236, 'hetherington1_2.jpg', 'LV23'),
(237, 'hetherington1_3.jpg', 'LV23'),
(238, 'blanca1_4.jpg', 'LV24'),
(239, 'blanca1_2.jpg', 'LV24'),
(240, 'blanca1_3.jpg', 'LV24'),
(241, 'zarina1_4.jpg', 'LV25'),
(242, 'zarina1_2.jpg', 'LV25'),
(243, 'zarina1_3.jpg', 'LV25'),
(244, 'halbert1_4.jpg', 'LV26'),
(245, 'halbert1_2.jpg', 'LV26'),
(246, 'halbert1_3.jpg', 'LV26'),
(247, 'andes1_4.jpg', 'LV27'),
(248, 'andes1_2.jpg', 'LV27'),
(249, 'andes1_3.jpg', 'LV27'),
(250, 'calisto1_4.jpg', 'LV28'),
(251, 'calisto1_2.jpg', 'LV28'),
(252, 'calisto1_3.jpg', 'LV28'),
(253, 'tayen1_4.jpg', 'LV29'),
(254, 'tayen1_2.jpg', 'LV29'),
(255, 'tayen1_3.jpg', 'LV29'),
(256, 'anderson1_4.jpg', 'LV30'),
(257, 'anderson1_2.jpg', 'LV30'),
(258, 'anderson1_3.jpg', 'LV30'),
(259, 'jenson1_2.jpg', 'KC01'),
(260, 'jenson1_3.jpg', 'KC01'),
(261, 'jenson1_4.jpg', 'KC01'),
(262, 'higgs1_2.jpg', 'KC02'),
(263, 'higgs1_3.jpg', 'KC02'),
(264, 'higgs1_4.jpg', 'KC02'),
(265, 'tacoma1_2.jpg', 'KC03'),
(266, 'tacoma1_3.jpg', 'KC03'),
(267, 'tacoma1_4.jpg', 'KC03'),
(268, 'swinton1_2.jpg', 'KC04'),
(269, 'swinton1_3.jpg', 'KC04'),
(270, 'swinton1_4.jpg', 'KC04'),
(271, 'lule1_2.jpg', 'KC05'),
(272, 'lule1_3.jpg', 'KC05'),
(273, 'lule1_4.jpg', 'KC05'),
(274, 'mirny1_2.jpg', 'KC06'),
(275, 'mirny1_3.jpg', 'KC06'),
(276, 'mirny1_4.jpg', 'KC06'),
(277, 'selky1_2.jpg', 'KC07'),
(278, 'selky1_3.jpg', 'KC07'),
(279, 'selky1_4.jpg', 'KC07'),
(280, 'lomond1_2.jpg', 'KC08'),
(281, 'lomond1_3.jpg', 'KC08'),
(282, 'lomond1_4.jpg', 'KC08'),
(283, 'boone1_2.jpg', 'KC09'),
(284, 'boone1_3.jpg', 'KC09'),
(285, 'boone1_4.jpg', 'KC09'),
(286, 'fjord1_2.jpg', 'KC10'),
(287, 'fjord1_3.jpg', 'KC10'),
(288, 'fjord1_4.jpg', 'KC10'),
(289, 'wingrove1_2.jpg', 'KC11'),
(290, 'wingrove1_3.jpg', 'KC11'),
(291, 'wingrove1_4.jpg', 'KC11'),
(292, 'tandil1_2.jpg', 'KC12'),
(293, 'tandil1_3.jpg', 'KC12'),
(294, 'tandil1_4.jpg', 'KC12'),
(295, 'monty1_2.jpg', 'KC13'),
(296, 'monty1_3.jpg', 'KC13'),
(297, 'monty1_4.jpg', 'KC13'),
(298, 'corinna1_2.jpg', 'KC14'),
(299, 'corinna1_3.jpg', 'KC14'),
(300, 'corinna1_4.jpg', 'KC14'),
(301, 'java1_2.jpg', 'KC15'),
(302, 'java1_3.jpg', 'KC15'),
(303, 'java1_4.jpg', 'KC15'),
(304, 'penny1_2.jpg', 'KC16'),
(305, 'penny1_3.jpg', 'KC16'),
(306, 'penny1_4.jpg', 'KC16'),
(307, 'mauno1_2.jpg', 'KC17'),
(308, 'mauno1_3.jpg', 'KC17'),
(309, 'mauno1_4.jpg', 'KC17'),
(310, 'moss1_2.jpg', 'KC18'),
(311, 'moss1_3.jpg', 'KC18'),
(312, 'moss1_4.jpg', 'KC18'),
(313, 'tomas1_2.jpg', 'KC19'),
(314, 'tomas1_3.jpg', 'KC19'),
(315, 'tomas1_4.jpg', 'KC19'),
(316, 'aveiro1_2.jpg', 'KC20'),
(317, 'aveiro1_3.jpg', 'KC20'),
(318, 'aveiro1_4.jpg', 'KC20'),
(319, 'mauno2_2.jpg', 'KC21'),
(320, 'mauno2_3.jpg', 'KC21'),
(321, 'mauno2_4.jpg', 'KC21'),
(322, 'annalie1_2.jpg', 'KC22'),
(323, 'annalie1_3.jpg', 'KC22'),
(324, 'annalie1_4.jpg', 'KC22'),
(325, 'marden1_2.jpg', 'KC23'),
(326, 'marden1_3.jpg', 'KC23'),
(327, 'marden1_4.jpg', 'KC23'),
(328, 'tomas2_2.jpg', 'KC24'),
(329, 'tomas2_3.jpg', 'KC24'),
(330, 'tomas2_4.jpg', 'KC24'),
(331, 'raleigh1_2.jpg', 'KC25'),
(332, 'raleigh1_3.jpg', 'KC25'),
(333, 'raleigh1_4.jpg', 'KC25'),
(334, 'deauville1_2.jpg', 'KC26'),
(335, 'deauville1_3.jpg', 'KC26'),
(336, 'deauville1_4.jpg', 'KC26'),
(337, 'amalyn1_2.jpg', 'KC27'),
(338, 'amalyn1_3.jpg', 'KC27'),
(339, 'amalyn1_4.jpg', 'KC27'),
(340, 'modica1_2.jpg', 'KC28'),
(341, 'modica1_3.jpg', 'KC28'),
(342, 'modica1_4.jpg', 'KC28'),
(343, 'braga1_2.jpg', 'KC29'),
(344, 'braga1_3.jpg', 'KC29'),
(345, 'braga1_4.jpg', 'KC29'),
(346, 'knox1_2.jpg', 'KC30'),
(347, 'knox1_3.jpg', 'KC30'),
(348, 'knox1_4.jpg', 'KC30');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `material`
--

CREATE TABLE `material` (
  `materialId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `materialName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `material`
--

INSERT INTO `material` (`materialId`, `materialName`, `status`, `createAt`, `updateAt`) VALUES
('BR', 'Brass', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('CO', 'Copper', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('FA', 'Fabric', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('GL', 'Glass', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('IR', 'Iron', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('ME', 'Metal', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('MI', 'Mirror', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('OA', 'Oak', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('RA', 'Rattan', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('ST', 'Stell', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('VE', 'Velvet', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('WO', 'Wood', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `orderId` int(11) NOT NULL,
  `payMethod` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `vat` decimal(10,0) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `note` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `userId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`orderId`, `payMethod`, `vat`, `price`, `note`, `status`, `createAt`, `updateAt`, `userId`) VALUES
(1, 'cash', '0', '635', NULL, 1, '2022-01-11 14:57:20', '2022-01-11 14:57:20', 2),
(2, 'Paypal', '0', '547', NULL, 1, '2022-01-11 16:17:56', '2022-01-11 16:17:56', 2),
(3, 'Paypal', '0', '1056', NULL, 1, '2022-01-13 08:54:43', '2022-01-13 08:54:43', 3),
(4, 'Paypal', '0', '5014', NULL, 1, '2022-01-17 19:36:17', '2022-01-17 19:36:17', 4),
(5, 'cash', '0', '2958', NULL, 1, '2022-01-17 19:37:49', '2022-01-17 19:37:49', 4),
(6, 'cash', '0', '1455', NULL, 1, '2022-01-17 21:56:13', '2022-01-17 21:56:13', 4),
(7, 'Paypal', '0', '2479', NULL, 1, NULL, NULL, 13);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orderdetail`
--

CREATE TABLE `orderdetail` (
  `orderId` int(11) NOT NULL,
  `productId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `orderdetail`
--

INSERT INTO `orderdetail` (`orderId`, `productId`, `quantity`, `price`) VALUES
(1, 'DC03', 1, '246.44'),
(1, 'LV02', 1, '331.02'),
(2, 'CT03', 1, '271.55'),
(2, 'CT09', 1, '88.38'),
(2, 'KC07', 4, '137.32'),
(3, 'BR05', 4, '959.84'),
(4, 'BR02', 1, '1096.53'),
(4, 'BR05', 2, '479.92'),
(4, 'BR09', 4, '2981.96'),
(5, 'BR01', 4, '2689.12'),
(6, 'BR07', 2, '1322.78'),
(7, 'BR01', 1, '683.59'),
(7, 'BR02', 1, '1030.62'),
(7, 'BR03', 1, '539.77');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `origin`
--

CREATE TABLE `origin` (
  `originId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `originName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `origin`
--

INSERT INTO `origin` (`originId`, `originName`, `status`, `createAt`, `updateAt`) VALUES
('JP', 'Japan', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('SI', 'Singapore', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('UK', 'United Kingdom', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('US', 'United Stated', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56'),
('VN', 'Việt Nam', b'1', '2022-01-04 19:27:56', '2022-01-04 19:27:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `productName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `salePrice` decimal(10,2) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `quantityStock` int(11) DEFAULT NULL,
  `quantityImport` int(11) DEFAULT NULL,
  `dateImport` datetime DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `categoryId` varchar(6) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productId`, `productName`, `image`, `price`, `salePrice`, `status`, `quantityStock`, `quantityImport`, `dateImport`, `createAt`, `updateAt`, `categoryId`) VALUES
('BR01', 'Balmore King Size Bed, Whitewash Boucle & Black', 'balmore1_1.jpg', '699', '633.05', b'1', 78, 245, '2021-11-29 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR02', 'Cory King Size Bed with Storage Drawers, Wolf Grey Wool', 'cory1_1.jpg', '1099', '1033.13', b'1', 98, 222, '2021-11-17 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR03', 'Roscoe King Size Bed, Olive Green & Dark Stain Oak Legs', 'roscoe1_1.jpg', '549', '531.12', b'1', 40, 110, '2021-11-21 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR04', 'Elona King Size Bed, Midnight Grey Velvet & Copper Legs', 'elona1_1.jpg', '329', '298.10', b'1', 78, 241, '2021-11-06 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR05', 'Besley Small Double Bed, Hail Grey', 'besley1_1.jpg', '249', '248.86', b'1', 61, 163, '2021-11-02 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR06', 'Roscoe Double Bed, Salcombe Beige & Dark Stain Oak Legs', 'roscoe2_1.jpg', '449', '431.81', b'1', 69, 177, '2021-10-06 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR07', 'Kooper Kingsize Bed with Storage Drawers, Royal Blue Velvet', 'kooper1_1.jpg', '699', '643.06', b'1', 81, 170, '2021-10-10 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR08', 'Besley Double Bed, Hail Grey', 'besley2_1.jpg', '249', '230.21', b'1', 77, 171, '2021-11-21 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR09', 'Orsa King Size Ottoman Storage Bed, Evening Blue Cotton & Linen Mix', 'orsa1_1.jpg', '799', '746.52', b'1', 61, 284, '2021-11-28 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR10', 'Fenella King Size Bed, Oatmeal Weave & Brass', 'fenella1_1.jpg', '399', '386.92', b'1', 71, 161, '2021-10-29 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR11', 'Kooper King Size Bed, Deep Black Velvet & Dark Stain Oak', 'roscoe3_1.jpg', '499', '451.33', b'1', 40, 255, '2021-11-24 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR12', 'Selu King Size Platform Bed, Brass', 'selu1_1.jpg', '399', '398.74', b'1', 44, 101, '2021-11-18 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR13', 'Ogilvy Light luxe Desk Light, Black', 'ogilvy1_1.jpg', '55', '51.48', b'1', 66, 181, '2021-11-07 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR14', 'Globe Greetings Flush Pendant, Large, Black Antique Brass & Light Smoked Glass', 'globe1_1.jpg', '119', '110.97', b'1', 52, 232, '2021-11-28 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR15', 'LLaria Floor Lamp Triple, Multicolour & Brass', 'llaria1_1.jpg', '229', '225.60', b'1', 83, 230, '2021-10-25 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR16', 'Oro Pendant Drum Lamp Shade, 45 cm, Grey & Brushed Brass', 'oro1_1.jpg', '35', '33.09', b'1', 61, 107, '2021-11-12 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR17', 'Briz Light up the love Wall Lamp, Antique Brass & Grey', 'briz1_1.jpg', '69', '64.46', b'1', 44, 258, '2021-10-01 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR18', 'Orion Set of 3 Side Tables, Dark Stain and Grey', 'orion1_1.jpg', '109', '102.88', b'1', 84, 140, '2021-11-13 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR19', 'Cheney Side Table, Glass & Brass', 'cheney1_1.jpg', '159', '152.93', b'1', 67, 221, '2021-10-06 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('BR20', 'Emmi Light & breezy Triple Wardrobe, Ocean Blue & Cane', 'emmi1_1.jpg', '799', '760.55', b'1', 99, 182, '2021-11-12 00:00:00', '2021-12-07 00:00:00', NULL, 'BR'),
('CT01', 'Bran Towel Ring & Toilet Roll Holder Set, Brass', 'bran1_1.jpg', '39', '36.83', b'1', 86, 287, '2021-10-09 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT02', 'Selin King Size Headboard, Oval, Natural Rattan', 'selin1_1.jpg', '129', '116.48', b'1', 86, 159, '2021-10-20 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT03', 'Camden Diamond Rug 160 x 230cm, Black and Off White', 'camden1_1.jpg', '279', '264.42', b'1', 42, 265, '2021-10-27 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT04', 'Sulta Oval Coffee Table, Brass & Black Ombre', 'sulta1_1.jpg', '429', '410.77', b'1', 83, 210, '2021-11-18 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT05', 'Colter Soft Close Double Recycling Pedal Bin, 2 x 30L, Matte Black', 'colter1_1.jpg', '99', '89.86', b'1', 60, 174, '2021-10-15 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT06', 'Penn Dressing Table, Oak', 'penn1_1.jpg', '299', '275.11', b'1', 40, 267, '2021-11-28 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT07', 'Lyra Garden Dining Chair Set, Charcoal Grey', 'lyra1_1.jpg', '179', '177.83', b'1', 50, 245, '2021-10-14 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT08', 'Irving Set of 2 Square Shelves, Mango Wood & Black', 'lrving1_1.jpg', '69', '62.72', b'1', 42, 160, '2021-11-10 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT09', '\nDaven Set of 2 Metal Storage Box Trunks, Teal & Grey', 'daven1_1.jpg', '89', '84.99', b'1', 70, 107, '2021-11-17 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT10', 'Pair of Curtains EyeletJulius Velvet Eyelet Lined Pair of Curtains Soft Pink, 168 x 228cm', 'julius1_1.jpg', '89', '81.50', b'1', 52, 245, '2021-11-07 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT11', 'Aza Metallic Cuckoo Clock, Brass', 'aza1_1.jpg', '79', '78.28', b'1', 87, 219, '2021-11-05 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT12', 'Alana Round Mirror 50cm, Brushed Brass', 'alana1_1.jpg', '129', '117.71', b'1', 88, 161, '2021-11-06 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT13', 'Scott Armchair, Gold Cotton Velvet', 'scott1_1.jpg', '599', '580.98', b'1', 41, 219, '2021-10-02 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT14', 'Cher Cluster Pendant Lamp, Textured Glass & Brass', 'cher1_1.jpg', '189', '185.14', b'1', 58, 175, '2021-10-17 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT15', 'Ledger Sliding Wardrobe, Dark Stain Ash', 'ledger1_1.jpg', '929', '887.21', b'1', 52, 202, '2021-11-30 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT16', 'Kacee Set of 2 100% Cotton Bath Sheets, 100 x 150cm, Dusty Pink', 'kacee1_1.jpg', '29', '26.92', b'1', 57, 195, '2021-11-02 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT17', 'Ritchie 2 Seater Sofa, Anthracite Grey with Rainbow Buttons Fabric', 'ritchie1_1.jpg', '499', '471.11', b'1', 64, 174, '2021-10-25 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT18', 'Lost In Tokyo Set of 3 Framed Prints', 'lostintokyo1_1.jpg', '159', '157.01', b'1', 90, 222, '2021-12-04 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('CT19', '\nChicago Tripod Floor Lamp, Antique Copper and Gold', 'chicago1_1.jpg', '199', '191.35', b'1', 60, 196, '2021-11-28 00:00:00', '2021-12-07 00:00:00', NULL, 'CT'),
('DC01', 'Arles Large Round Mirror 85cm, Brushed Brass', 'arles1_1.jpg', '179', '175.70', b'1', 51, 167, '2021-10-23 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC02', 'Arles Arch Dress Wall Mirror 40 x 120cm, Matt Black', 'arles2_1.jpg', '179', '172.44', b'1', 82, 135, '2021-11-04 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC03', 'Arles Freestanding Mirror 48 x 160cm, Matt Black', 'arles3_1.jpg', '259', '244.00', b'1', 44, 115, '2021-11-16 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC04', 'Kameli Rug High Pile Berber Style Rug, X Large 200 x 290cm', 'kameli1_1.jpg', '279', '272.97', b'1', 53, 226, '2021-10-19 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC05', 'Lafant Wool Throw, 125 x 170cm, Neutral', 'lafant1_1.jpg', '49', '47.06', b'1', 57, 253, '2021-11-05 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC06', 'Maxine Extra Large Storage Trunk, Mango Wood & Black', 'maxine1_1.jpg', '149', '146.65', b'1', 47, 141, '2021-11-16 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC07', 'Freda Extra Large Rug 200 x 290cm, Off White', 'freda1_1.jpg', '199', '193.47', b'1', 50, 185, '2021-10-19 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC08', 'Wilson Solid Wood Full Length Wall Mirror, 40 x 140cm, Oak', 'wilson1_1.jpg', '139', '133.69', b'1', 82, 107, '2021-11-25 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC09', 'Wilson Round Wall Mirror, Large 80cm, Oak', 'wilson6_1.jpg', '139', '136.68', b'1', 87, 282, '2021-10-01 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC10', 'Mala Pile Rug, 200x290cm, Off White', 'mala1_1.jpg', '200', '193.64', b'1', 71, 228, '2021-10-02 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('DC11', 'Burley Wool Throw, 125 x 170cm, Natural', 'burley1_1.jpg', '35', '32.02', b'1', 44, 185, '2021-10-08 00:00:00', '2021-12-07 00:00:00', NULL, 'DC'),
('KC01', 'Jenson Dining Bench, Yellow & Dark Stain Oak', 'jenson1_1.jpg', '249', '241.92', b'1', 92, 163, '2021-11-02 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC02', '\nHiggs Upholstered Bench, Pine Green Velvet', 'higgs1_1.jpg', '299', '295.76', b'1', 45, 212, '2021-10-16 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC03', '\nTacoma Dining Bench, Oak', 'tacoma1_1.jpg', '449', '433.70', b'1', 49, 153, '2021-10-02 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC04', 'Swinton Set of 2 Carver Dining Chairs, Darby Green & Walnut stain', 'swinton1_1.jpg', '229', '214.21', b'1', 74, 114, '2021-11-13 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC05', 'Lule Set of 2 Dining Chairs, Marl and Hail Grey', 'lule1_1.jpg', '249', '230.55', b'1', 79, 134, '2021-10-07 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC06', 'Mirny Set of 2 Boucle Seat Pads, 40 x 40 cm, Moss Green', 'mirny1_1.jpg', '29', '26.68', b'1', 89, 224, '2021-10-09 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC07', '\nSelky Set of 2 Corduroy Seat Pads, 40 x 40cm, Soft Taupe', 'selky1_1.jpg', '35', '31.79', b'1', 55, 289, '2021-10-04 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC08', 'Lomond Dining Table Set, Mango Wood & Black', 'lomond1_1.jpg', '599', '574.78', b'1', 82, 104, '2021-11-11 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC09', 'Boone Up to 4 Seat Dining Table and 4 Chair set, Concrete Resin Top', 'boone1_1.jpg', '899', '879.37', b'1', 96, 261, '2021-10-29 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC10', 'Fjord Dining Table and Bench Set, Oak & White', 'fjord1_1.jpg', '349', '344.68', b'1', 97, 292, '2021-11-15 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC11', 'Wingrove 8-10 Seat Extending Dining Table, Dark French Oak', 'wingrove1_1.jpg', '729', '719.24', b'1', 81, 181, '2021-10-03 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC12', '\nTandil 4-8 Seat Extending Dining Table, Grey', 'tandil1_1.jpg', '649', '632.67', b'1', 58, 149, '2021-12-05 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC13', 'Monty 2-4 Seat Extending Dining Table, Oak', 'monty1_1.jpg', '329', '300.85', b'1', 64, 260, '2021-10-26 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC14', 'Corinna 6 Seat Dining Table, Grey HPL & Black', 'corinna1_1.jpg', '549', '507.79', b'1', 78, 261, '2021-11-16 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC15', 'Java Lamp Shade, Large, Black Rattan', 'java1_1.jpg', '75', '74.63', b'1', 65, 264, '2021-11-23 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC16', 'Penny Large Wide Shade, Muted Grey', 'penny1_1.jpg', '109', '98.55', b'1', 78, 173, '2021-10-07 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC17', 'Mauno 5-Tier Wall-Mounted Shelf Unit, Extra Large, Black Perforated Metal', 'mauno1_1.jpg', '169', '166.23', b'1', 51, 124, '2021-11-12 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC18', 'Moss Wall-Mounted Storage Shelf, Extra Large, Black', 'moss1_1.jpg', '69', '67.60', b'1', 47, 134, '2021-10-12 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC19', 'Tomas 4-Tier Wall-Mounted Kitchen Storage Shelf, Extra Large, Black', 'tomas1_1.jpg', '129', '125.04', b'1', 85, 117, '2021-12-04 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC20', 'Aveiro Display Cabinet, Grey and Glass', 'aveiro1_1.jpg', '849', '822.44', b'1', 51, 106, '2021-10-23 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC21', '\nMauno 2-Tier Wall-Mounted Shelf with 3 Hooks, Black Perforated Metal', 'mauno2_1.jpg', '69', '67.37', b'1', 69, 125, '2021-12-02 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC22', 'Annalie 2-Tier Interchangeable Wall-Mounted Storage Unit with Acacia Wood Shelves, Black', 'annalie1_1.jpg', '79', '77.06', b'1', 81, 189, '2021-10-07 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC23', '\nMarden Cabinet, Charcoal Grey and Glass', 'marden1_1.jpg', '699', '632.73', b'1', 95, 106, '2021-11-08 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC24', 'Tomas Wall-Mounted Hanging Rack, Black', 'tomas2_1.jpg', '39', '37.98', b'1', 89, 106, '2021-10-05 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC25', 'Raleigh Set of 2 Dining chairs, Charcoal and Rattan', 'raleigh1_1.jpg', '249', '230.51', b'1', 63, 176, '2021-11-29 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC26', 'Deauville Set of 2 Dining Chairs, Oak & White', 'deauville1_1.jpg', '189', '182.03', b'1', 50, 202, '2021-11-14 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC27', 'Amalyn Set of 2 Dining Chairs, Walnut & Rosewood Corduroy Velvet', 'amalyn1_1.jpg', '249', '235.49', b'1', 86, 126, '2021-10-28 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC28', 'Modica Dining Chair, Rattan & Matte Black', 'modica1_1.jpg', '139', '128.61', b'1', 82, 231, '2021-10-05 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC29', 'Braga Set of 2 Dining Chairs, Hail Grey', 'braga1_1.jpg', '159', '143.56', b'1', 94, 230, '2021-11-08 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('KC30', 'Knox Dining Chair, Sky Blue Corduroy Velvet with Black Legs', 'knox1_1.jpg', '99', '97.07', b'1', 70, 168, '2021-10-20 00:00:00', '2021-12-07 00:00:00', NULL, 'KC'),
('LV01', 'Hitomi Platform Sofa Bed, Mountain Grey Fabric', 'hitomi1_1.jpg', '599', '581.64', b'1', 73, 123, '2021-12-01 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV02', 'Bessie Small Sofa Bed, Blush Pink Velvet', 'bessie1_1.jpg', '349', '324.95', b'1', 59, 204, '2021-11-19 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV03', 'Purcell Sofa Bed, Vintage Ochre Velvet', 'purcell1_1.jpg', '649', '613.24', b'1', 65, 289, '2021-12-04 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV04', 'Sete 2 Seater Sofa, Whitewash Boucle', 'sete1_1.jpg', '749', '687.94', b'1', 93, 294, '2021-11-23 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV05', 'Harlow Large 2 Seater Sofa, Hudson Grey', 'harlow1_1.jpg', '699', '638.14', b'1', 44, 133, '2021-11-09 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV06', 'Scott Large 2 Seater Sofa, Petrol Cotton Velvet', 'scott1_1.jpg', '999', '901.35', b'1', 50, 262, '2021-11-13 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV07', 'Giselle 2 Seater Sofa, Cinnamon Velvet', 'giselle1_1.jpg', '599', '543.82', b'1', 74, 133, '2021-10-24 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV08', 'Samona 2.5 Seater Sofa, Stone Grey Corduroy Velvet', 'samona1_1.jpg', '999', '959.63', b'1', 60, 165, '2021-11-28 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV09', 'Orson 2 Seater Sofa, Scatterback, Chic Grey', 'orson1_1.jpg', '779', '738.63', b'1', 75, 249, '2021-10-25 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV10', 'Kahlo Double Seat Sofa Bed, Teal Corduroy Velvet', 'kahlo1_1.jpg', '349', '320.15', b'1', 88, 293, '2021-11-12 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV11', 'Hampton Small Round Pouffe, Blossom Pink Velvet', 'hampton1_1.jpg', '139', '129.90', b'1', 94, 127, '2021-11-07 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV12', 'Russo 2 Seater Sofa, Moss Recycled Velvet', 'russo1_1.jpg', '1099', '1057.86', b'1', 70, 235, '2021-10-16 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV13', 'Lottie Armchair, Harbour Blue Fabric', 'lottie1_1.jpg', '299', '277.26', b'1', 56, 172, '2021-10-01 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV14', 'Helma Accent Armchair, Papaya Velvet', 'helma1_1.jpg', '249', '227.39', b'1', 69, 192, '2021-10-21 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV15', 'Moby Moby Accent Armchair, Yolk Yellow Weave', 'moby1_1.jpg', '349', '347.67', b'1', 92, 225, '2021-10-11 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV16', 'Orson Armchair, Chic Grey', 'orson2_1.jpg', '429', '403.00', b'1', 98, 268, '2021-11-13 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV17', 'Rami Accent Armchair, Faux Sheepskin & Natural Weave', 'rami1_1.jpg', '199', '191.15', b'1', 75, 169, '2021-11-04 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV18', 'Harlow Armchair, Hudson Grey', 'harlow2_1.jpg', '399', '367.66', b'1', 82, 246, '2021-10-23 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV19', 'Moby Accent Armchair & Footstool, Vintage Pink Velvet', 'elvi1_1.jpg', '349', '321.93', b'1', 83, 256, '2021-10-17 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV20', 'Miro Armchair, Oat Weave Fabric', 'miro1_1.jpg', '399', '374.25', b'1', 55, 256, '2021-11-27 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV21', 'Bridget Accent Armchair, Flavio Grey Weave', 'bridget1_1.jpg', '379', '364.61', b'1', 66, 295, '2021-11-17 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV22', 'Linden Accent Armchair, Stone Micro Corduroy Velvet', 'linden1_1.jpg', '429', '395.97', b'1', 67, 213, '2021-11-16 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV23', 'Hetherington Large Brass Base Pouffe, Blossom Pink Velvet', 'hetherington1_1.jpg', '999', '971.54', b'1', 75, 233, '2021-10-19 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV24', 'Blanca 2 Seater Sofa, Alaska Grey Velvet', 'blanca1_1.jpg', '699', '696.78', b'1', 58, 147, '2021-10-07 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV25', 'Zarina Large 2 Seater Sofa, Meadow Corduroy Velvet', 'zarina1_1.jpg', '879', '793.67', b'1', 75, 135, '2021-10-12 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV26', 'Halbert 2 Seater Sofa, Pistachio Green Velvet', 'halbert1_1.jpg', '329', '306.96', b'1', 68, 150, '2021-11-17 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV27', 'Andes Tall Lamp Shade, Amber Yellow Glass', 'andes1_1.jpg', '29', '27.03', b'1', 67, 181, '2021-11-24 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV28', 'Lamp Shade, 45 cm, Multi Leopard Jungle Print & Copper', 'calisto1_1.jpg', '39', '38.44', b'1', 72, 114, '2021-11-09 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV29', 'Tayen Square Coffee Table, Aged Bronze', 'tayen1_1.jpg', '329', '303.56', b'1', 82, 212, '2021-10-13 00:00:00', '2021-12-07 00:00:00', NULL, 'LV'),
('LV30', 'Anderson Set of 2 Nesting Tables, Mango Wood & Brass', 'anderson1_1.jpg', '159', '155.30', b'1', 82, 132, '2021-11-13 00:00:00', '2021-12-07 00:00:00', NULL, 'LV');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `productdetail`
--

CREATE TABLE `productdetail` (
  `productId` varchar(6) COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `depth` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `weight` varchar(11) COLLATE utf8_unicode_ci DEFAULT NULL,
  `materialId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `originId` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `productdetail`
--

INSERT INTO `productdetail` (`productId`, `width`, `height`, `depth`, `weight`, `materialId`, `originId`, `description`) VALUES
('BR01', '178', '94', '232', '68', 'ME', 'US', 'Premium dreams? Yes, please. Bedtime just got better with Balmore  just look at those smooth, rounded edges and soft boucle upholstery.\nThat contrasting black metal frame? So sophisticated. Theres no need to count sheep with this sleep setup.'),
('BR02', '165', '130', '219', '39', 'ME', 'UK', 'That boutique, vintage feel that all the best hotels aim for. Cory brings it to your bedroom. Wool upholstery offers a rich, premium feel. The padded rectangular headboard creates cosy corners, and underbed drawers give you stylish storage'),
('BR03', '173', '114', '215', '44', 'ME', 'JP', 'Roscoes perfect for breathing new life into your bedroom. Clean lines and walnut legs hint at Nordic charm, while the olive green fabric ups the luxe. We designed this bed with comfort and quality in mind. Thats why its fitted with a padded and upholstered headboard, with sprung birch slats.'),
('BR04', '165', '107', '219', '57', 'ME', 'US', 'Elonas a designled piece  check out the angular headboard and metallic accents. But compact in size, this grey upholstered bed wont dominate the room. Sleek and simple, Elona is silhouette complements any space. Those hairpin legs? So ontrend.'),
('BR05', '149', '96', '211', '44', 'ME', 'JP', 'When you find a bed that fits into any room and decor, you can rest easy. Especially when its as affordable as Besley. Simple? It doesnt have to mean boring. This beds clean lines and rounded edges make it a handsome addition to any bedroom.'),
('BR06', '173', '114', '215', '44', 'ME', 'VN', 'Roscoes perfect for breathing new life into your bedroom. Clean lines and walnut legs hint at Nordic charm, while the fresh fabric ups the luxe. We designed it with comfort and quality in mind  thats why its fitted with a padded and upholstered headboard, with sprung birch slats.'),
('BR07', '183', '99', '228', '48', 'ME', 'JP', 'Roscoes perfect for breathing new life into your bedroom. Clean lines and walnut legs hint at Nordic charm, while the aegean blue fabric ups the luxe. We designed this bed with comfort and quality in mind. Thats why its fitted with a padded and upholstered headboard, with storage drawers underneath.'),
('BR08', '149', '96', '211', '44', 'ME', 'JP', 'A good nights sleep is priceless. So when you find a bed that can fit into any room and decor, you can rest easy. Especially when its as affordable as Besley.'),
('BR09', '172', '98', '213', '84', 'ME', 'UK', 'Orsas cotton and linen mix fabric is light, airy and unbeatably soft  and did we mention its removable, too? So easy to clean. And something else youll love? That builtin ottoman storage underneath.'),
('BR10', '148', '105', '204', '36,5', 'ME', 'VN', 'Statement headboards? Right here. And we know youll love Fenellas wavy ways. Look a little closer at the soft woven fabric, contrast piping and refined brass legs  this is sleeping in style.'),
('BR11', '173', '114', '215', '44', 'ME', 'SI', 'Roscoes perfect for breathing new life into your bedroom. Clean lines and oak legs hint at Nordic charm, while the rich velvet fabric ups the luxe. We designed it with comfort and quality in mind  thats why its fitted with a padded and upholstered headboard, plus sprung birch slats.'),
('BR12', '142', '30', '195', '29,5', 'BR', 'UK', 'Love industrial design, but in small doses? Say hello to Selu. With its sturdy brass frame, this platform bed will work in both bold and understated interiors. And that price tag? Pretty nice, too.'),
('BR13', '73', '27', '22', '2,2', 'ME', 'SI', 'A chandelier thats in a world of its own  that sums up Globe. We love this decadent pendant lights structured antique brass frame and smoked glass globes. As the ultimate investment piece, it shouldnt take a back seat, so show yours off in the hallway or above the dining table, and greet visitors in style.'),
('BR14', '59,5', '20,5', '59,5', '1,7', 'GL', 'JP', 'A chandelier thats in a world of its own  that sums up Globe. We love this decadent pendant lights structured antique brass frame and smoked glass globes. As the ultimate investment piece, it shouldnt take a back seat, so show yours off in the hallway or above the dining table, and greet visitors in style.'),
('BR15', '34', '153', '34', '8,2', 'GL', 'JP', 'Ilarias glass shades add style to your space, even with the lights off. Designed inhouse and made from glass, this statement floor lamps multicoloured shades are smooth on the outside, with an optical finish interior  to create a gentle refraction when you switch on.'),
('BR16', '45', '20', '45', '0,64', 'CO', 'JP', 'Inspired by glamorous hotel lobbies, Oro gives your place an instant style update. Day or night, Oro looks super sleek, on or off. The reflective brass liner throws the light further and gives any room or hallway a warm glow. Staycations just got even better.'),
('BR17', '15', '41', '24', '0,8', 'GL', 'UK', 'Task lamps always look really cool and industrial in living spaces. So we’ve taken that style for the Ogilvy Collection. A sleek, practical addition to our Deco Luxe look.'),
('BR18', '50', '45', '50', '8', 'WO', 'VN', 'While its name is inspired by the stars, Orion is grounded in nature. Made using darkstained legs, these tables are contrasted with tops in tonal grey.'),
('BR19', '48', '46', '45', '10', 'ST', 'UK', 'Transform your living room with Aula. Think simple, geometric metallics  in the form of that circular shape and angled frame. This side table helps to create a calming flow in your space. Now all you need is that cup of tea.'),
('BR20', '135', '184', '55', '103', 'WO', 'JP', 'Strippedback but still striking. Thats Wilson. This extra large round mirror is all about the Scandi vibes  just look at that oak finish, and the deepset mirror. Its a classic look thatll never go out of style.'),
('CT01', '20', '28', '0', '0,635', 'IR', 'VN', 'Dont let your bathroom miss out on style. This towel ring and toilet roll holder is crafted from brass metal  durable and top quality. Sleek style throughout the home just got easy with Bran.'),
('CT02', '180', '70', '3', '5', 'RA', 'US', 'Loving the look of those trendy rattan beds, but dont want to splash out? Tapu helps you get the look. This lightweight, oval headboard fixes to the wall behind your existing platform bed  so easy. Zen vibes, zero effort.'),
('CT03', '300', '200', '0,7', '12', 'FA', 'US', 'A contemporary classic, our Camden rug is just what is required to revive a living room thanks to its bold diamond design.'),
('CT04', '120', '45', '60', '24,2', 'IR', 'JP', 'Artwork/coffee table hybrid? Sultas good looks make it worthy of both. That hourglass shape? Emphasising the cool brass ombre. And look at that price  unexpectedly good looking, too. You should expect compliments.'),
('CT05', '49', '67', '39', '8,7', 'ST', 'VN', 'Colters industrial tone lets you bring style to every corner of your kitchen. In matte black stainless steel, this 60L pedal bin contains X2 30L sections, ideal for splitting up your recycling. Doing your bit for the planet, and looking good too.'),
('CT06', '65', '144', '40', '20', 'WO', 'US', 'Penn is elegant and cool. Details are subtle but expressive and nothing has been overlooked. Crafted with clean lines, and solid oak tapered legs and posts.'),
('CT07', '54', '80', '58', '13', 'ST', 'UK', 'Make a real design statement with MADE.COMs latest outdoor range. This dining chair set will ensure that your garden is as beautiful as the rest of your home'),
('CT08', '50', '20', '0', '2,6', 'WO', 'UK', 'An industrial home never overlooks the details. Take Irving  mango wood, surrounded by matte black metal. Typically industrial, in an unexpected format. Store everything from mugs to trinkets on these square shelves.'),
('CT09', '52', '20', '20', '4', 'ME', 'JP', 'Have you noticed the trend for storage trunks? Have a look on Pinterest  trunks are gaining some serious traction right now. And with good reason  they’re the handiest things ever.'),
('CT10', '168', '228', '0', '5', 'FA', 'UK', 'They say privacy is priceless. But its super affordable with Julius. The fully lined curtains will help block out light while still leaving a glow to avoid any ‘what time is it’ confusion and keep your home life indoors.'),
('CT11', '21', '70', '12', '1', 'ME', 'US', 'Azas a contemporary take on traditional cuckoo clocks. Its got an allover brass finish, with black metal detailing and a sophisticated popout door. Nostalgic, yet modern.'),
('CT12', '50', '50', '8', '7', 'ME', 'SI', 'Alanas ideal for dressing rooms and bedrooms. The brushed brass finish complements all colour schemes and styles, while adding wowfactor to the room. You get a full length look, and an ontrend interior. So you can check your OOTD as you’re rushing out the door.'),
('CT13', '70', '91', '91', '23', 'FA', 'SI', 'Nothing says luxury quite like Scott. A sleek silhouette with pulled detail cushions, upholstered in plush velvet  it oozes sophistication. The clean lines nod to midcentury design, and there is plenty of room to snuggle up.'),
('CT14', '32', '99', '32', '4', 'ME', 'JP', 'Art Deco drama mixed with retro vibes  thats Cher. This pendant lamps textured glass will cast a dreamy glow in whatever room you place it in. Notice the curved brass up top  its all in the details.'),
('CT15', '150', '200', '57', '132', 'WO', 'UK', 'This collection is perfect for any bedroom. Match with other pieces like the dressing table, bedside table, chest of drawers and bed for a complete, contemporary look.'),
('CT16', '150', '100', '0', '1', 'FA', 'SI', 'Kacees woven from 100% cotton, making it ohso soft, absorbent and easy to care for. Note the waffle hems  you know youre getting quality, at a quality price. And with hand and bath towels in this set, itll meet all your daily needs.'),
('CT17', '148', '86', '85', '32', 'VE', 'UK', 'Contemporary and compact, this playful 2 seater sofa adds style to any room. Midcentury Danish design with a modern twist, check out Ritchies tapered solid wood legs and contrasting rainbow button detailing. The firm but comfy cushioning bounces back into shape, after even the laziest of Sundays.'),
('CT18', '52', '73', '8', '3', 'FA', 'UK', 'A gallery wall, without all the hassle of choosing prints? This set is the solution. The trick? Stick to a theme  this ones travel  and use different sized images for variety. We framed these for you, so all you have to do is grab the hammer and nails.'),
('CT19', '67', '164', '67', '8', 'ST', 'UK', 'Bring vintage Hollywood to your home with this studio set inspired floor lamp. Chicagos industrial antique copper shade brings this style into now, paired with a gold foil inner. The diffuser reflects the light back into the shade, creating a warm, illuminating effect. This is statement lighting that deserves centre stage.'),
('DC01', '85', '85', '4', '12', 'ME', 'US', 'Need a mirror but torn between simple or statement? Panic over. Arles’ seamless shape makes this an eyecatcher you won’t get tired of looking at  or in to. Grownup glamour? Yes, please. The brushed brass finish brings sophistication to getting ready.'),
('DC02', '65', '170', '4', '24', 'ME', 'JP', 'Need a mirror but torn between simple or statement? Panic over. Arles seamless shape makes this an eyecatcher you wont get tired of looking at  or in to. Grownup glamour? Yes, please. And that matte black finish brings sophistication to getting ready.'),
('DC03', '48', '160', '45', '19', 'ME', 'UK', 'Need a mirror but torn between simple or statement? Panic over. Arles’ seamless shape makes this an eyecatcher you won’t get tired of looking at  or in to. Grownup glamour? Yes, please. The matte black finish brings sophistication to getting ready.'),
('DC04', '290', '200', '0', '15', 'FA', 'VN', 'Take a look at Kamelis deep high pile and tufted texture. Nice, huh? The subtle diamond pattern and offwhite colour make it a versatile choice, too. And check out the fringed edges  so stylish.'),
('DC05', '170', '125', '0', '1', 'FA', 'UK', 'Abstract shapes against a muted background throws dont get much cooler (or cosier) than Lafant. Designed in collaboration with Berit MogensenLopez, its woven from a supersoft woolblend and trimmed with fringing.'),
('DC06', '80', '40', '42', '16', 'WO', 'JP', 'Maxines industrial all over. Mango wood and black metal add intrigue to this storage trunk  its strippedback yet striking. We love this in the bedroom to stash extra linens, throws, or any odds and ends.'),
('DC07', '230', '160', '2', '10', 'FA', 'SI', 'That bold, distinctive pattern? Thats Freda. Its both contemporary and timeless. The monochrome palette adds a focal point to any living space. This extra large rugs super soft, easy to clean, doesn’t shed and is hypoallergenic. It is super affordable, too.'),
('DC08', '40', '140', '5', '6', 'ME', 'SI', 'On the wall. Whos the fairest of them all? Wilsons classic good looks will never go out of favour in the lands.'),
('DC09', '80', '80', '6', '4', 'MI', 'VN', 'On the wall. Whos the fairest of them all? Wilsons classic good looks will never go out of favour in the lands.'),
('DC10', '290', '200', '2', '14.4', 'FA', 'UK', 'Looking for subtle flair? Mala is the one for you. Crafted in Belgium, the soft shades will uplift any living room. Plus, the shaggy texture is a real treat for the feet.'),
('DC11', '125', '170', '0', '1', 'MI', 'SI', 'Lightweight yet cosy, youll want to curl up with Burley. Made from a super soft woolblend in a chic natural shade.'),
('KC01', '48', '158', '35', '14,2', 'FA', 'JP', 'No need to play musical chairs  3 to 4 people can sit comfortably on one of these benches. The clean lines and boomerang legs will add a touch of sophistication to your dining or living room.'),
('KC02', '84', '133', '64', '15', 'FA', 'UK', 'Need a seat that packs a punch? Its Higgs. With a side profile so standout itll make an impact in your dining room  or hallway. This is revival style made modern with luxe, soft green velvet. And have you seen the piping detail around the edge?'),
('KC03', '78', '140', '56', '16', 'OA', 'UK', 'Tacomas an example of expert craftsmanship. Just look at the joint detailing and subtly curved shape. This oak dining bench is the key to realising your Scandi supper dreams.'),
('KC04', '76', '52', '59', '63', 'FA', 'JP', 'Swinton adds style to whatever youre serving. Note the curved back and arms, rounded legs and soft, padded seat  add deep green fabric and youve got one stylish supper.'),
('KC05', '83', '53', '61', '16', 'FA', 'JP', 'The perfect seat for dining, our Lule chairs offer contemporary style whether you’re enjoying a meal alone or with guests. Bon appétit'),
('KC06', '40', '40', 'null', '0,7', 'FA', 'US', 'Muted and stylish, but above all  comfy. It doesnt get better than Mirny. Check out that supersoft boucle and the contrasting brushed fabric on the reverse  so versatile. Thesell work in any room you like.'),
('KC07', '40', '30', 'null', '1,5', 'FA', 'VN', 'A little bit retro with a lot of comfort  thats Selky. This set of 2 corduroy seat pads will look right at home on your kitchen chairs. And that pulled detailing? Were into it.'),
('KC08', '76', '180', '90', '49', 'WO', 'VN', 'Lomond has a vintage, industrial feel, just like a carpenters workbench. This dining set provides spacious seating for up to 8 people, and when not in use, the benches slide neatly under the table. Its a durable piece that works hard  and looks good doing it.'),
('KC09', '76', '160', '80', '140', 'ST', 'SI', 'Gather round Boone and entertain in style. The epitome of contemporary design, this dining table and 4 chair set boasts clean lines and a contrasting concrete top  such a sophisticated finish. The black matte powdercoated metal legs amp up the industrial vibes.'),
('KC10', '75', '151', '81', '27', 'OA', 'JP', 'The understated design means this table works well in contemporary and traditional setups. The matching Fjord benches complete the look.'),
('KC11', '75', '210', '90', '58', 'OA', 'JP', 'Retro inspired, dark French oak  you know Wingroves something special. And those legs are a standout feature. This extendable dining table will seat up to 10 of your nearest and dearest.'),
('KC12', '70', '170', '90', '55', 'ME', 'UK', 'Glossy glass, matte grey frame. Thats Tandil. Check out the rounded, tapered legs. And it extends, so itll work for dinner parties and smaller suppers alike. Dining in style? Effortless.'),
('KC13', '76', '90', '90', '33,6', 'OA', 'UK', 'A versatile piece  an ideal kitchen or dining table for four, with the bonus of extra table space should you need it. Seats up to six.'),
('KC14', '75', '160', '100', '37', 'ST', 'UK', 'Make Corinna as simple or as statement as you like  this is made to order, after all. Oak and walnut keep it classic, or choose concrete and sleek brass for grownup industrial vibes. Into entertaining? This farmhousestyle dining table comes in lengths that seat from 6 up to 12.'),
('KC15', '53', '42', '42', '1', 'RA', 'US', 'Javas 70s style, with a modern feel. This lamp shade updates your space with a trendled finish. Just check out that black powdercoated natural rattan weave, and the simple curved silhouette. Were feeling so fresh with this one.'),
('KC16', '25', '57', '57', '1', 'FA', 'UK', 'Penny might be minimal, but its striking, too. The ribboneffect outer design diffuses the light, casting a dreamy warm glow. This wide shades larger proportions make it perfect in the living room.'),
('KC17', '160', '80', '29', '14,8', 'ME', 'UK', 'Ready to show off all your spices, oils and kitchen bits in style? Make it happen with Mauno. In sleek perforated metal with 5 tiers and plenty of space, its the perfect accessory for keeping your space organised.'),
('KC18', '80', '90', '13', '5,5', 'ME', 'UK', 'All your kitchen bits, stored in style. Moss is the designled option for organised cooks. Herbs, mugs and more  itll all look good next to that matte black frame.'),
('KC19', '126', '60', '22', '10', 'ME', 'UK', 'Who knew all your needs could be met so easily? Our Tomas shelf is designed to be mounted to the wall to keep all your kitchen essentials within reach.'),
('KC20', '178', '100', '42', '117', 'OA', 'VN', 'If you like a bit of Scandi with your storage, then you’ve come to the right place. Aveiro is a sophisticated piece with clean lines and a sleek, minimal look in a sleek grey finish.'),
('KC21', '50', '50', '27', '3,3', 'ME', 'UK', 'Ready to show off all your spices, oils and kitchen bits in style? Make it happen with Mauno. In sleek perforated metal with 2 tiers and 3 hooks, its the perfect accessory for keeping your space organised.'),
('KC22', '51', '52', '25', '4', 'ME', 'SI', 'The key to great storage? Something that works for you and adapts to your needs. Annalies sections are interchangeable, plus it has clever metal hooks and acacia wood shelves.'),
('KC23', '170', '90', '40', '85', 'ST', 'SI', 'Mardens big on the details. Brass handles and a charcoal matt finish nod to industrial stylings. This cabinets varying glass panels add a graphic, partlyhidden element  letting you store and display, however it suits you.'),
('KC24', '60', '45', '6', '4', 'ME', 'UK', 'Who knew all your needs could be met so easily? Our Tomas rack is designed to be mounted to the wall to keep all your kitchen essentials within reach.'),
('KC25', '86', '48', '56', '12', 'FA', 'UK', 'Raleighs a twist on traditional farmhouse designs. The cane back? So on trend. Grey fabric and a charcoal frame add a little edge. This set of 2 dining chairs have it all  comfort, style and substance. Go on, take a seat.'),
('KC26', '84', '46,5', '56,5', '11,6', 'OA', 'JP', 'Take the traditional Windsor design, give it a sleeker, more streamlined profile and there you have it: the Deauville Collection. Crafted by one of our most trusted manufacturers.'),
('KC27', '78', '47', '54', '12', 'FA', 'UK', 'Walnut, brass, corduroy velvet. The triple threat of trends  thats Amalyn. We love how the curved shape contrasts with the crossdetail metal legs. This is revival meets industrial, with a lot of luxe thrown in. Settle into a stylish supper.'),
('KC28', '89', '48', '57', '8', 'WO', 'VN', 'On board for rattans resurgence? Us, too. Take a look at Modica  matte black and rattan, with a gently angled back. Its a new take on boho. Perfect for adding a natural touch to your dining table.'),
('KC29', '90', '45', '57', '6', 'FA', 'VN', 'Dining room envy? Guaranteed with Braga. The minimalist silhouette is contemporary and chic, with hail grey fabric and shapely metal legs. This set of 2 dining chairs will be the talk of the evening  your foods got a lot to live up to.'),
('KC30', '80', '53', '58', '10', 'FA', 'VN', 'This is Knox  a sleek, sophisticated dining chair thatll bring a modernist aesthetic to your meals. Designed by our very own MADE Studio, its the perfect perch for settling into a good supper.'),
('LV01', '196', '78', '84', '59', 'FA', 'JP', 'The secret to staying guestready without forfeiting on style? Hitomi. The padded, foldover arms will give your visitors the dreamy nights sleep they deserve. Warning: getting them to leave might be difficult.'),
('LV02', '122', '81', '88', '39', 'VE', 'US', 'Sofa bed, made sophisticated. Check out Bessies velvet channelled detailing, brass legs and contemporary square frame. And the clickclack mechanism means its easy to switch from seat to snooze. Happy guests? You got it.'),
('LV03', '156', '80', '87', '56', 'VE', 'US', 'Stay guestready in style with Purcell. Its a nononsense design that turns from sofa to bed in minutes. Note the petalshaped arms, stylish velvet upholstery and bolster cushions. In love? Us too.'),
('LV04', '165', '79', '93', '41', 'VE', 'US', 'Bonnies revival vibes all over. The mood? Boudoir. Think luxury fabrics and petallike shapes  dreamy to look at, and even better for lounging thanks to the padded seat, arms and back. This sofa makes any living room the place to be.'),
('LV05', '187', '83', '90', '50', 'FA', 'VN', 'Looking for sleek modern style? Then Harlow should grab your attention. A combination of sophistication and laidback European style, this MADE Studio designed sofa is a musthave for contemporary living rooms.'),
('LV06', '185', '86', '100', '52', 'VE', 'JP', 'Nothing says luxury quite like Scott. A sleek silhouette with pulled detail cushions, upholstered in plush velvet  it oozes sophistication. The clean lines nod to midcentury design, and there is plenty of room to snuggle up.'),
('LV07', '200', '77', '97', '40', 'FA', 'SI', 'Giselle was designed by Charlotte Honcke, whose Nordic roots bring more than a touch of inspiration. The soft, shapely silhouette and slim wooden legs nod to Scandi style, all finished in rich velvet.'),
('LV08', '206', '80', '115', '70', 'FA', 'VN', 'Social seating, sorted. Samonas generous proportions and comfy cushions mean you can lounge how you like  no restrictions. That corduroy velvet? Samona keeps your guests happy stylewise, too.'),
('LV09', '158', '79', '97', '38', 'FA', 'VN', 'Our Orson range is inspired by traditional English design but with its simplified modern lines, every piece in the collection  from the luxe corner sofa to the cosy armchair  is a super chic addition to your home.'),
('LV10', '122', '81', '88', '31', 'FA', 'JP', 'Taking inspiration from modern European design, Kahlos compact and cool. Piped edges give this sofa bed a refined touch, combined with soft corners and luxe cord velvet. With an easy clickclack mechanism, Kahlo folds out in a flash. Youre guest ready.'),
('LV11', '60', '40', '60', '6', 'VE', 'VN', 'Sumptuous touchable velvet and rich colours is what the Hampton range is all about. This is a real statement piece that adds a pop of colour to your space.'),
('LV12', '176', '82', '94', '49', 'VE', 'JP', 'A curved silhouette and soft cushions you can really sink into  Andrin makes relaxing easy. And its pretty goodlooking too, thanks to the velvet upholstery and slim legs. But the best part? Its more sustainably MADE. Crafted from recycled polyester and responsiblysourced wood.'),
('LV13', '84', '75', '79', '19', 'FA', 'JP', 'Required: a sofa or armchair that is big on impact, but not size. In that case, you need Lottie. The compact design that steals the show, not the floor space. Perfect for living spaces, or even home offices.'),
('LV14', '81', '72', '78', '22', 'FA', 'VN', 'With its plush velvet upholstery, tufted backrest and polished black legs, Helma cuts a glamorous silhouette. Our inhouse design team came up with this one.'),
('LV15', '73', '87', '76', '13', 'FA', 'JP', 'In the battle of comfort vs. style  Moby is going for gold. Sink into the deep padded seat cushion and see for yourself. Oh, and touch the luxuriously smooth fabric, too.'),
('LV16', '99', '79', '97', '29', 'FA', 'VN', 'Trend forecasters say we’re entering a new design era  one that prioritises comfort. Bouncy, voluptuous comfort seating is back. This is where the Ariana collection, with it is beautiful sofas, armchairs and beds, really shines.'),
('LV17', '66', '70', '81', '10', 'FA', 'VN', 'With its cushioned faux sheepskin upholstery, gently angled back and natural frame, Rami is nailing that bohemian look. This accent armchair is perfect for sinking into, especially in that sunsoaked corner in your living space  you know the one were talking about.'),
('LV18', '96', '71', '89', '31', 'FA', 'VN', 'Perfect for lazy days, Harlows large proportions and plump cushions make relaxing ohso easy. Those slim black metal legs? The perfect contrast to that soft seating. Check out Harlows pulled detail, too. Seriously stylish, seriously comfortable.'),
('LV19', '61', '80', '21', '14', 'FA', 'JP', 'Comfort versus style? Mobys got both. Sink into the deep padded seat cushion and see for yourself. That matching footstool is maximising the relaxation vibes, too. Mobys an eyecatching accent chair inspired by retro design.'),
('LV20', '92', '69', '88', '26', 'FA', 'SI', 'Our inhouse design team know a thing or two about Scandinavian style. Miros slim, rounded arms, loose, pillowy back cushions and subtle metal legs are here to prove our point. Need we say more?'),
('LV21', '82', '98', '95', '25', 'FA', 'UK', 'This upholstered accent chairs a real showstopper. Sink into Bridgets angled, winglike back and thick, comfy cushion. Your afternoon nap just got stylish.'),
('LV22', '86', '95', '93', '26', 'FA', 'US', 'Quiets inspired by Japanese furniture and minimalism  thats why it feels so zen. Soft finishes, smooth rounded wood, stone cord velvet upholstery. All the ingredients you need to relax. This accent chair was designed by Renson Ludovic as part of TalentLAB, our crowdsourcing platform created to support upandcoming designers.'),
('LV23', '60', '40', '60', '10', 'VE', 'UK', 'Looking for that final piece to liven up your living space? Let our Hetherington pouffe take care of that. It is perfect for putting your feet up and doubles up as additional seating.'),
('LV24', '173', '78', '94', '45', 'FA', 'SI', 'Plump silhouette, sculpted back, luxe velvet upholstery: Blancas nailing those sleek Nordic vibes. All thats left to do is add some scatter cushions and get hygge with it.'),
('LV25', '176', '74', '91', '45', 'FA', 'US', 'Ready to sink in? Sure. Zarinas sleek silhouette doesnt compromise on comfort. Additional bolster cushions? Bring on the lounging. Refined leg detail? Relax in style. This sofa is everything your evenings hoped for.'),
('LV26', '120', '75', '76', '20', 'FA', 'SI', 'Pure retro? Thats Halbert. This sofas got a gentle recline, curved edges, wooden legs and a stylish buttoned back. Inspired by midcentury shapes and angles, itll easily become the best seat in the house.'),
('LV27', '21', '40', '21', '13', 'FA', 'VN', 'Ribbedeffect glass creates Andes diffused glow  and that amber yellow colours so ontrend, too. Dial up the highend vibes by styling this lamp shade with brass accessories. Ready for luxe? You are now.'),
('LV28', '45', '20', '45', '0,64', 'FA', 'SI', 'Get a little wild with Calisto. This jungleprint lamp shade lets you play with style, all the way up to your ceiling. The metallic interior reflects light around the room, resulting in a wonderfully warm glow.'),
('LV29', '80', '35', '80', '18', 'FA', 'SI', 'Aged bronze + industrial style = Tayen. And this is one were eager to take our coffee break with. Minimal and sleek, the square shape makes a statement without being too showy. Sticking the kettle on? Well join you.'),
('LV30', '50', '45', '45', '20', 'FA', 'JP', 'Earthy, industriallooking mango wood. These nesting tables were always going to be a looker. \nAdd the brass trend via subtle inlays and Anderson becomes a knockout furniture piece.');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subscribe`
--

CREATE TABLE `subscribe` (
  `subscribeId` int(11) NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `createAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `subscribe`
--

INSERT INTO `subscribe` (`subscribeId`, `email`, `createAt`) VALUES
(7, 'dtb751@gmail.com', '2022-01-05 14:47:21'),
(8, 'teo@gmail.com', '2022-01-17 19:44:33'),
(9, 'dothanhbinh.dev@gmail.com', '2022-01-17 19:45:02');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userId` int(11) NOT NULL,
  `userName` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` bit(1) DEFAULT NULL,
  `status` bit(1) DEFAULT NULL,
  `createAt` datetime DEFAULT NULL,
  `updateAt` datetime DEFAULT NULL,
  `code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userId`, `userName`, `password`, `email`, `phone`, `address`, `role`, `status`, `createAt`, `updateAt`, `code`) VALUES
(13, 'Bình ĐỖ', 'ef797c8118f02dfb649607dd5d3f8c7623048c9c063d532cc95c5ed7a898a64f', 'dtb751@gmail.com', '0387655461', 'dáaf', b'0', b'1', '2022-01-18 15:44:36', '2022-01-18 16:02:55', 'Sq4xoX');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryId`);

--
-- Chỉ mục cho bảng `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`contactId`);

--
-- Chỉ mục cho bảng `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`imageId`),
  ADD KEY `productId` (`productId`);

--
-- Chỉ mục cho bảng `material`
--
ALTER TABLE `material`
  ADD PRIMARY KEY (`materialId`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`orderId`);

--
-- Chỉ mục cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`orderId`,`productId`) USING BTREE;

--
-- Chỉ mục cho bảng `origin`
--
ALTER TABLE `origin`
  ADD PRIMARY KEY (`originId`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productId`);

--
-- Chỉ mục cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  ADD PRIMARY KEY (`productId`);

--
-- Chỉ mục cho bảng `subscribe`
--
ALTER TABLE `subscribe`
  ADD PRIMARY KEY (`subscribeId`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `contact`
--
ALTER TABLE `contact`
  MODIFY `contactId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `image`
--
ALTER TABLE `image`
  MODIFY `imageId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=349;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `orderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `subscribe`
--
ALTER TABLE `subscribe`
  MODIFY `subscribeId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `image`
--
ALTER TABLE `image`
  ADD CONSTRAINT `image_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `order` (`orderId`) ON DELETE CASCADE;

--
-- Các ràng buộc cho bảng `productdetail`
--
ALTER TABLE `productdetail`
  ADD CONSTRAINT `productdetail_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `product` (`productId`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
