-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 15, 2022 at 11:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `newtempo`
--

-- --------------------------------------------------------

--
-- Table structure for table `active_sessions`
--

CREATE TABLE `active_sessions` (
  `id` int(11) NOT NULL,
  `ip` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `session` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `active_sessions`
--

INSERT INTO `active_sessions` (`id`, `ip`, `session`, `date`) VALUES
(0, '::1', '6uak4k75vr34fjgj22a8q76ah7d4u3d3', '2022-12-09 09:01:56');

-- --------------------------------------------------------

--
-- Table structure for table `db_cahoc`
--

CREATE TABLE `db_cahoc` (
  `id` int(11) NOT NULL,
  `monId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `startTime` time NOT NULL,
  `endTime` time NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_cahoc`
--

INSERT INTO `db_cahoc` (`id`, `monId`, `name`, `startTime`, `endTime`, `created_at`, `updated_at`, `trash`, `status`) VALUES
(1, 1, 'Ca 3 - 5', '19:00:00', '20:30:00', '2022-12-15 10:48:19', '2022-12-15 14:43:30', 1, 1),
(2, 1, 'Ca 3 - 5 (2)', '17:30:00', '19:00:00', '2022-12-15 11:04:14', '2022-12-15 14:43:16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_category`
--

CREATE TABLE `db_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  `level` int(2) NOT NULL,
  `parentid` int(11) NOT NULL,
  `orders` varchar(5) CHARACTER SET utf8 DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_category`
--

INSERT INTO `db_category` (`id`, `name`, `link`, `level`, `parentid`, `orders`, `created_at`, `created_by`, `updated_at`, `updated_by`, `trash`, `status`) VALUES
(1, 'Piano', 'piano', 1, 0, '0', '2022-04-22 16:15:39', '4', '2022-04-22 22:37:23', '1', 1, 1),
(2, 'Guitar', 'guitar', 1, 0, '0', '2022-06-03 14:18:11', '1', '2022-06-03 14:18:11', '1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_chinhsach`
--

CREATE TABLE `db_chinhsach` (
  `id` int(11) NOT NULL,
  `sohieu` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `loaivanban` int(11) NOT NULL,
  `coquanbanhanh` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `linhvuc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `trichyeu` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `file` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `ngaybanhanh` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `updated_at` datetime NOT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `loaivanban_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_chinhsach`
--

INSERT INTO `db_chinhsach` (`id`, `sohieu`, `loaivanban`, `coquanbanhanh`, `linhvuc`, `trichyeu`, `file`, `ngaybanhanh`, `created_at`, `created_by`, `updated_at`, `updated_by`, `trash`, `status`, `name`, `loaivanban_name`) VALUES
(1, '01/QD-BCDTW', 3, 'BCĐ Trung ương	', 'OCOP', 'Ban Chỉ đạo Trung ương các Chương trình Mục tiêu quốc gia ban hành Quyết định số 01/QĐ-BCĐTW ngày 22/8/2018 về Kế hoạch triển khai Chương trình Mỗi xã một sản phẩm giai đoạn 2018 - 2020.', '_FilesUpload_01-QD-BCDTW432159552316.pdf', '2022-05-17 11:42:04', '2022-05-17 11:42:04', 'mtp', '2022-05-18 17:05:52', '1', 1, 1, 'Văn bản chỉ đạo 001', 'Nghị quyết'),
(4, 'xxxx', 1, '', 'bán muối', '', '46aeea23a7125dcec0e8e210867bba69.pdf', '0000-00-00 00:00:00', '2022-05-25 15:51:25', '1', '2022-05-25 15:52:37', '1', 1, 1, 'văn bản 2', '');

-- --------------------------------------------------------

--
-- Table structure for table `db_config`
--

CREATE TABLE `db_config` (
  `id` int(11) NOT NULL,
  `mail_smtp` varchar(68) CHARACTER SET utf8 NOT NULL,
  `mail_smtp_password` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Password mail shop',
  `mail_noreply` varchar(68) CHARACTER SET utf8 NOT NULL,
  `priceShip` mediumtext CHARACTER SET utf8 NOT NULL,
  `title` varchar(100) CHARACTER SET utf8 NOT NULL,
  `description` text CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_config`
--

INSERT INTO `db_config` (`id`, `mail_smtp`, `mail_smtp_password`, `mail_noreply`, `priceShip`, `title`, `description`) VALUES
(1, 'ocopchupuhgl@gmail.com', 'tutanbcasaqjhxql', 'thanhwilshere96@gmail.com', '0', 'OCOP CHUPUH', 'chupuh12345');

-- --------------------------------------------------------

--
-- Table structure for table `db_contact`
--

CREATE TABLE `db_contact` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` text COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT 0,
  `trash` int(11) NOT NULL DEFAULT 1,
  `fullname` varchar(80) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_contact`
--

INSERT INTO `db_contact` (`id`, `title`, `phone`, `email`, `content`, `created_at`, `status`, `trash`, `fullname`) VALUES
(1, 'Hay', '981643651', 'daigiadaklak@gmail.com', 'Hay', '2019/6/2', 1, 1, 'Ngô Văn Hiệp'),
(2, 'Shop', '981643651', 'vanhiepp19988@gmail.com', 'Shop 12 21', '2019/6/2', 1, 1, 'Ngô Văn Hiệp'),
(4, 'Câu hỏi', '090305078', 'luong@gmail.com', 'Thời giàn giao hang trong Quận 12 là bào nhiêu', '2019/6/2', 1, 1, 'Lương'),
(11, 'Ngu như heo', '09123123123', 'tuananh@gmail.com', 'hahahaha', '2022/5/13', 1, 1, 'Tuấn Anh'),
(12, 'Tôi muốn làm thành viên', '0129391239', 'boile@gmail.com', 'Tôi muốn làm thành viên', '2022/6/27', 1, 1, 'Lê Bội'),
(13, 'Tôi muốn làm thành viên', '0129391239', 'boile@gmail.com', 'Tôi muốn làm thành viên', '2022/6/27', 0, 1, 'Lê Bội');

-- --------------------------------------------------------

--
-- Table structure for table `db_content`
--

CREATE TABLE `db_content` (
  `id` int(11) NOT NULL,
  `title` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `introtext` mediumtext CHARACTER SET utf8 NOT NULL,
  `fulltext` mediumtext CHARACTER SET utf8 NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 NOT NULL,
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_content`
--

INSERT INTO `db_content` (`id`, `title`, `alias`, `introtext`, `fulltext`, `img`, `created`, `created_by`, `modified`, `modified_by`, `trash`, `status`) VALUES
(4, 'Từ năm 2021, tỉnh Gia Lai phấn đấu mỗi năm có thêm 50 sản phẩm đạt chuẩn OCOP 3 đến 4 sao cấp tỉnh', 'tu-nam-2021-tinh-gia-lai-phan-dau-moi-nam-co-them-50-san-pham-dat-chuan-ocop-3-den-4-sao-cap-tinh', '', '<h2><span style=\"font-size:12px\">&nbsp; Thực tế cho thấy, thấy được lợi &iacute;ch của Chương tr&igrave;nh OCOP n&ecirc;n thời gian qua, c&aacute;c doanh nghiệp, hợp t&aacute;c x&atilde;, tổ hợp t&aacute;c v&agrave; cơ sở sản xuất kinh doanh tr&ecirc;n địa b&agrave;n tỉnh đ&atilde; t&iacute;ch cực tham gia; c&aacute;c sản phẩm tham gia Chương tr&igrave;nh OCOP ở c&aacute;c huyện, thị x&atilde;, th&agrave;nh phố c&oacute; chiều hướng tăng l&ecirc;n. Với mục ti&ecirc;u đặt ra, trước mắt trong năm 2021 n&agrave;y, c&aacute;c huyện, thị x&atilde;, th&agrave;nh phố trong tỉnh đăng k&yacute; 148 sản phẩm phấn đấu đạt chuẩn OCOP. Trong đ&oacute;, n&acirc;ng cấp sao (từ 3 sao l&ecirc;n 4 sao v&agrave; từ 4 sao l&ecirc;n 5 sao) đối với 7 sản phẩm; v&agrave; x&acirc;y dựng, ph&aacute;t triển mới 141 sản phẩm. Dự kiến kinh ph&iacute; đề xuất vốn để thực hiện chương tr&igrave;nh n&agrave;y trong năm 2021 l&agrave; hơn 22,2 tỷ đồng. Tr&ecirc;n cơ sở những sản phẩm đạt chuẩn OCOP cấp huyện sẽ tiếp tục đăng k&yacute; để thẩm định đ&aacute;nh gi&aacute; xếp hạng đạt chuẩn OCOP cấp tỉnh./.</span></h2>\r\n\r\n<p>&nbsp;</p>\r\n', '837de6db3cbdcde394ac.jpg', '2019-05-26 23:18:02', '1', '2022-04-26 14:13:09', '10', 1, 1),
(7, 'Anh Chương trúng vé số trị giá 20.000.000 vnđ', 'anh-chuong-trung-ve-so-tri-gia-20-000-000-vnd', '', '<p>V&eacute; số truyền thống với mệnh gi&aacute; 10.000 đ c&oacute; tất cả 18 l&ocirc; tr&uacute;ng: 9 giải thưởng, 9 giải phụ đặc biệt, 45 giải khuyến kh&iacute;ch trong đ&oacute;:</p>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td><strong>Giải thưởng&nbsp;</strong></td>\r\n			<td><strong>Số lượng giải</strong></td>\r\n			<td><strong>Số lần quay</strong></td>\r\n			<td><strong>Số</strong></td>\r\n			<td><strong>Gi&aacute; trị giải thưởng</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải ĐB</td>\r\n			<td>1</td>\r\n			<td>1</td>\r\n			<td>6 số</td>\r\n			<td><strong>2.000.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải nhất</td>\r\n			<td>10</td>\r\n			<td>1</td>\r\n			<td>5 số</td>\r\n			<td><strong>30.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải nh&igrave;</td>\r\n			<td>10</td>\r\n			<td>1</td>\r\n			<td>5 số</td>\r\n			<td><strong>15.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải ba</td>\r\n			<td>20</td>\r\n			<td>2</td>\r\n			<td>5 số</td>\r\n			<td><strong>10.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải tư</td>\r\n			<td>70</td>\r\n			<td>7</td>\r\n			<td>5 số</td>\r\n			<td><strong>3.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải năm</td>\r\n			<td>100</td>\r\n			<td>1</td>\r\n			<td>4 số</td>\r\n			<td><strong>1.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải s&aacute;u</td>\r\n			<td>300</td>\r\n			<td>3</td>\r\n			<td>4 số</td>\r\n			<td><strong>400.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải bảy</td>\r\n			<td>1.000</td>\r\n			<td>1</td>\r\n			<td>3 số</td>\r\n			<td><strong>200.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải t&aacute;m</td>\r\n			<td>10.000</td>\r\n			<td>1</td>\r\n			<td>2 số</td>\r\n			<td><strong>100.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải phụ ĐB</td>\r\n			<td>9</td>\r\n			<td>&nbsp;</td>\r\n			<td>5 số</td>\r\n			<td><strong>50.000.000đ</strong></td>\r\n		</tr>\r\n		<tr>\r\n			<td>Giải khuyến kh&iacute;ch</td>\r\n			<td>45</td>\r\n			<td>&nbsp;</td>\r\n			<td>5 số</td>\r\n			<td><strong>6.000.000đ</strong></td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<p>&ndash;&nbsp;<strong>Giải phụ đặc biệt</strong>: cho những v&eacute; tr&uacute;ng 5 chữ số cuối c&ugrave;ng li&ecirc;n tiếp theo h&agrave;ng thứ tự của giải đặc biệt.<br />\r\nVD: Giải ĐB l&agrave;&nbsp;<strong>467828</strong>, số của bạn l&agrave;&nbsp;<strong><u>3</u></strong><strong>67828</strong>&nbsp;th&igrave; tr&uacute;ng giải phụ đặc biệt trị gi&aacute; l&agrave;&nbsp;<strong>50.000.000đ&nbsp;</strong>mỗi giải.<br />\r\n&ndash;&nbsp;<strong>Giải khuyến kh&iacute;ch</strong>: cho những v&eacute; chỉ sai một số bất kỳ h&agrave;ng n&agrave;o so với giải đặc biệt 6 số (ngoại trừ sai số ở h&agrave;ng trăm ng&agrave;n).<br />\r\nVD: Giải ĐB l&agrave;&nbsp;<strong>467828</strong>, số của bạn l&agrave;&nbsp;<strong>46782<u>9</u></strong>&nbsp;hay&nbsp;<strong>4678<u>3</u>8</strong>&nbsp;th&igrave; tr&uacute;ng giải khuyến kh&iacute;ch trị gi&aacute;&nbsp;<strong>6.000.000đ</strong>&nbsp;mỗi giải.</p>\r\n', '119870856_173895514272166_4397835810628693118_n.jpg', '2022-05-10 15:23:05', '1', '2022-05-10 15:23:05', '1', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_cosodanhgia`
--

CREATE TABLE `db_cosodanhgia` (
  `id` int(10) NOT NULL,
  `producer_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_time` datetime NOT NULL,
  `star` int(11) NOT NULL DEFAULT 4,
  `trash` int(11) DEFAULT 1,
  `content` varchar(250) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_cosodanhgia`
--

INSERT INTO `db_cosodanhgia` (`id`, `producer_id`, `user_name`, `sdt`, `comment_time`, `star`, `trash`, `content`) VALUES
(26, 18, 'thanh1996', '0969124469', '2022-06-09 10:00:11', 2, 1, 'xem lại cách hành xử !'),
(27, 18, 'thanh1996', '0969124469', '2022-06-09 10:00:31', 2, 1, 'xem lại cách hành xử !'),
(28, 18, 'thanh1996', '0969124469', '2022-06-09 10:01:19', 3, 1, 'quá chán'),
(29, 18, 'thanh1996', '0969124469', '2022-06-09 10:02:51', 2, 1, 'xem lại cách hành xử'),
(30, 18, 'thanh1996', '0969124469', '2022-06-09 10:02:58', 2, 1, 'xem lại cách hành xử'),
(31, 18, 'thanh1996', '0969124469', '2022-06-09 10:07:33', 1, 1, 'Kém'),
(32, 12, 'thanh1996', '0969124469', '2022-06-09 10:09:28', 1, 1, 'gà');

-- --------------------------------------------------------

--
-- Table structure for table `db_customer`
--

CREATE TABLE `db_customer` (
  `id` int(11) NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 NOT NULL,
  `password` varchar(32) CHARACTER SET utf8 NOT NULL,
  `address` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(13) CHARACTER SET utf8 NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_customer`
--

INSERT INTO `db_customer` (`id`, `fullname`, `username`, `password`, `address`, `phone`, `email`, `created`, `trash`, `status`) VALUES
(1, 'Thành', 'thanh1996', 'e10adc3949ba59abbe56e057f20f883e', '', '0969124469', 'thanhwilshere961@gmail.com', '2021-04-24 22:10:08', 1, 1),
(76, 'Tuấn Anh', 'tuananh', 'e10adc3949ba59abbe56e057f20f883e', '', '092831231', '14520851@gm.uit.edu.vn', '2022-05-23 00:00:00', 1, 1),
(77, 'khách hàng test', 'demouser', 'e10adc3949ba59abbe56e057f20f883e', '', '09878123121', 'nibaha5077@syswift.com', '2022-06-27 00:00:00', 1, 1),
(78, 'Khách hàng nè', 'khachhang', 'e10adc3949ba59abbe56e057f20f883e', '', '123456', 'thanhwilshere962@gmail.com', '2022-06-27 00:00:00', 1, 1),
(79, 'chương', 'chuongchau', 'e10adc3949ba59abbe56e057f20f883e', '', '0123912241', 'thanhwilshere96@gmail.com', '2022-06-27 00:00:00', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_discount`
--

CREATE TABLE `db_discount` (
  `id` int(11) NOT NULL COMMENT 'ID',
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mã giảm giá',
  `discount` int(11) NOT NULL COMMENT 'Số tiền',
  `limit_number` int(11) NOT NULL COMMENT 'giới hạn lượt mua',
  `number_used` int(11) NOT NULL COMMENT 'Số lượng đã nhập',
  `expiration_date` date NOT NULL COMMENT 'Ngày hết hạn',
  `payment_limit` int(11) NOT NULL COMMENT 'giới hạn đơn hàng tối thiểu',
  `description` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Mô tả',
  `created` date NOT NULL,
  `orders` int(11) NOT NULL,
  `trash` int(1) NOT NULL,
  `status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_discount`
--

INSERT INTO `db_discount` (`id`, `code`, `discount`, `limit_number`, `number_used`, `expiration_date`, `payment_limit`, `description`, `created`, `orders`, `trash`, `status`) VALUES
(1, 'MAHETLUOT', 100000, 30, 30, '2019-09-29', 500000, 'Giam 100000', '2019-06-10', 1, 1, 1),
(2, 'VANHIEP', 200000, 20, 3, '2019-06-12', 500000, 'Giam 200k', '2019-06-10', 1, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_district`
--

CREATE TABLE `db_district` (
  `id` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL,
  `provinceid` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_district`
--

INSERT INTO `db_district` (`id`, `name`, `type`, `provinceid`) VALUES
(1, 'Quận Ba Đình', 'Quận', 1),
(2, 'Quận Hoàn Kiếm', 'Quận', 1),
(3, 'Quận Tây Hồ', 'Quận', 1),
(4, 'Quận Long Biên', 'Quận', 1),
(5, 'Quận Cầu Giấy', 'Quận', 1),
(6, 'Quận Đống Đa', 'Quận', 1),
(7, 'Quận Hai Bà Trưng', 'Quận', 1),
(8, 'Quận Hoàng Mai', 'Quận', 1),
(9, 'Quận Thanh Xuân', 'Quận', 1),
(10, 'Huyện Sóc Sơn', 'Huyện', 1),
(11, 'Huyện Đông Anh', 'Huyện', 1),
(18, 'Huyện Gia Lâm', 'Huyện', 1),
(19, 'Quận Nam Từ Liêm', 'Quận', 1),
(20, 'Huyện Thanh Trì', 'Huyện', 1),
(21, 'Quận Bắc Từ Liêm', 'Quận', 1),
(24, 'Thành phố Hà Giang', 'Thành phố', 2),
(26, 'Huyện Đồng Văn', 'Huyện', 2),
(27, 'Huyện Mèo Vạc', 'Huyện', 2),
(28, 'Huyện Yên Minh', 'Huyện', 2),
(29, 'Huyện Quản Bạ', 'Huyện', 2),
(30, 'Huyện Vị Xuyên', 'Huyện', 2),
(31, 'Huyện Bắc Mê', 'Huyện', 2),
(32, 'Huyện Hoàng Su Phì', 'Huyện', 2),
(33, 'Huyện Xín Mần', 'Huyện', 2),
(34, 'Huyện Bắc Quang', 'Huyện', 2),
(35, 'Huyện Quang Bình', 'Huyện', 2),
(40, 'Thành phố Cao Bằng', 'Thành phố', 4),
(42, 'Huyện Bảo Lâm', 'Huyện', 4),
(43, 'Huyện Bảo Lạc', 'Huyện', 4),
(44, 'Huyện Thông Nông', 'Huyện', 4),
(45, 'Huyện Hà Quảng', 'Huyện', 4),
(46, 'Huyện Trà Lĩnh', 'Huyện', 4),
(47, 'Huyện Trùng Khánh', 'Huyện', 4),
(48, 'Huyện Hạ Lang', 'Huyện', 4),
(49, 'Huyện Quảng Uyên', 'Huyện', 4),
(50, 'Huyện Phục Hoà', 'Huyện', 4),
(51, 'Huyện Hoà An', 'Huyện', 4),
(52, 'Huyện Nguyên Bình', 'Huyện', 4),
(53, 'Huyện Thạch An', 'Huyện', 4),
(58, 'Thành Phố Bắc Kạn', 'Thành phố', 6),
(60, 'Huyện Pác Nặm', 'Huyện', 6),
(61, 'Huyện Ba Bể', 'Huyện', 6),
(62, 'Huyện Ngân Sơn', 'Huyện', 6),
(63, 'Huyện Bạch Thông', 'Huyện', 6),
(64, 'Huyện Chợ Đồn', 'Huyện', 6),
(65, 'Huyện Chợ Mới', 'Huyện', 6),
(66, 'Huyện Na Rì', 'Huyện', 6),
(70, 'Thành phố Tuyên Quang', 'Thành phố', 8),
(71, 'Huyện Lâm Bình', 'Huyện', 8),
(72, 'Huyện Nà Hang', 'Huyện', 8),
(73, 'Huyện Chiêm Hóa', 'Huyện', 8),
(74, 'Huyện Hàm Yên', 'Huyện', 8),
(75, 'Huyện Yên Sơn', 'Huyện', 8),
(76, 'Huyện Sơn Dương', 'Huyện', 8),
(80, 'Thành phố Lào Cai', 'Thành phố', 10),
(82, 'Huyện Bát Xát', 'Huyện', 10),
(83, 'Huyện Mường Khương', 'Huyện', 10),
(84, 'Huyện Si Ma Cai', 'Huyện', 10),
(85, 'Huyện Bắc Hà', 'Huyện', 10),
(86, 'Huyện Bảo Thắng', 'Huyện', 10),
(87, 'Huyện Bảo Yên', 'Huyện', 10),
(88, 'Huyện Sa Pa', 'Huyện', 10),
(89, 'Huyện Văn Bàn', 'Huyện', 10),
(94, 'Thành phố Điện Biên Phủ', 'Thành phố', 11),
(95, 'Thị Xã Mường Lay', 'Thị xã', 11),
(96, 'Huyện Mường Nhé', 'Huyện', 11),
(97, 'Huyện Mường Chà', 'Huyện', 11),
(98, 'Huyện Tủa Chùa', 'Huyện', 11),
(99, 'Huyện Tuần Giáo', 'Huyện', 11),
(100, 'Huyện Điện Biên', 'Huyện', 11),
(101, 'Huyện Điện Biên Đông', 'Huyện', 11),
(102, 'Huyện Mường Ảng', 'Huyện', 11),
(103, 'Huyện Nậm Pồ', 'Huyện', 11),
(105, 'Thành phố Lai Châu', 'Thành phố', 12),
(106, 'Huyện Tam Đường', 'Huyện', 12),
(107, 'Huyện Mường Tè', 'Huyện', 12),
(108, 'Huyện Sìn Hồ', 'Huyện', 12),
(109, 'Huyện Phong Thổ', 'Huyện', 12),
(110, 'Huyện Than Uyên', 'Huyện', 12),
(111, 'Huyện Tân Uyên', 'Huyện', 12),
(112, 'Huyện Nậm Nhùn', 'Huyện', 12),
(116, 'Thành phố Sơn La', 'Thành phố', 14),
(118, 'Huyện Quỳnh Nhai', 'Huyện', 14),
(119, 'Huyện Thuận Châu', 'Huyện', 14),
(120, 'Huyện Mường La', 'Huyện', 14),
(121, 'Huyện Bắc Yên', 'Huyện', 14),
(122, 'Huyện Phù Yên', 'Huyện', 14),
(123, 'Huyện Mộc Châu', 'Huyện', 14),
(124, 'Huyện Yên Châu', 'Huyện', 14),
(125, 'Huyện Mai Sơn', 'Huyện', 14),
(126, 'Huyện Sông Mã', 'Huyện', 14),
(127, 'Huyện Sốp Cộp', 'Huyện', 14),
(128, 'Huyện Vân Hồ', 'Huyện', 14),
(132, 'Thành phố Yên Bái', 'Thành phố', 15),
(133, 'Thị xã Nghĩa Lộ', 'Thị xã', 15),
(135, 'Huyện Lục Yên', 'Huyện', 15),
(136, 'Huyện Văn Yên', 'Huyện', 15),
(137, 'Huyện Mù Căng Chải', 'Huyện', 15),
(138, 'Huyện Trấn Yên', 'Huyện', 15),
(139, 'Huyện Trạm Tấu', 'Huyện', 15),
(140, 'Huyện Văn Chấn', 'Huyện', 15),
(141, 'Huyện Yên Bình', 'Huyện', 15),
(148, 'Thành phố Hòa Bình', 'Thành phố', 17),
(150, 'Huyện Đà Bắc', 'Huyện', 17),
(151, 'Huyện Kỳ Sơn', 'Huyện', 17),
(152, 'Huyện Lương Sơn', 'Huyện', 17),
(153, 'Huyện Kim Bôi', 'Huyện', 17),
(154, 'Huyện Cao Phong', 'Huyện', 17),
(155, 'Huyện Tân Lạc', 'Huyện', 17),
(156, 'Huyện Mai Châu', 'Huyện', 17),
(157, 'Huyện Lạc Sơn', 'Huyện', 17),
(158, 'Huyện Yên Thủy', 'Huyện', 17),
(159, 'Huyện Lạc Thủy', 'Huyện', 17),
(164, 'Thành phố Thái Nguyên', 'Thành phố', 19),
(165, 'Thành phố Sông Công', 'Thành phố', 19),
(167, 'Huyện Định Hóa', 'Huyện', 19),
(168, 'Huyện Phú Lương', 'Huyện', 19),
(169, 'Huyện Đồng Hỷ', 'Huyện', 19),
(170, 'Huyện Võ Nhai', 'Huyện', 19),
(171, 'Huyện Đại Từ', 'Huyện', 19),
(172, 'Thị xã Phổ Yên', 'Thị xã', 19),
(173, 'Huyện Phú Bình', 'Huyện', 19),
(178, 'Thành phố Lạng Sơn', 'Thành phố', 20),
(180, 'Huyện Tràng Định', 'Huyện', 20),
(181, 'Huyện Bình Gia', 'Huyện', 20),
(182, 'Huyện Văn Lãng', 'Huyện', 20),
(183, 'Huyện Cao Lộc', 'Huyện', 20),
(184, 'Huyện Văn Quan', 'Huyện', 20),
(185, 'Huyện Bắc Sơn', 'Huyện', 20),
(186, 'Huyện Hữu Lũng', 'Huyện', 20),
(187, 'Huyện Chi Lăng', 'Huyện', 20),
(188, 'Huyện Lộc Bình', 'Huyện', 20),
(189, 'Huyện Đình Lập', 'Huyện', 20),
(193, 'Thành phố Hạ Long', 'Thành phố', 22),
(194, 'Thành phố Móng Cái', 'Thành phố', 22),
(195, 'Thành phố Cẩm Phả', 'Thành phố', 22),
(196, 'Thành phố Uông Bí', 'Thành phố', 22),
(198, 'Huyện Bình Liêu', 'Huyện', 22),
(199, 'Huyện Tiên Yên', 'Huyện', 22),
(200, 'Huyện Đầm Hà', 'Huyện', 22),
(201, 'Huyện Hải Hà', 'Huyện', 22),
(202, 'Huyện Ba Chẽ', 'Huyện', 22),
(203, 'Huyện Vân Đồn', 'Huyện', 22),
(204, 'Huyện Hoành Bồ', 'Huyện', 22),
(205, 'Thị xã Đông Triều', 'Thị xã', 22),
(206, 'Thị xã Quảng Yên', 'Thị xã', 22),
(207, 'Huyện Cô Tô', 'Huyện', 22),
(213, 'Thành phố Bắc Giang', 'Thành phố', 24),
(215, 'Huyện Yên Thế', 'Huyện', 24),
(216, 'Huyện Tân Yên', 'Huyện', 24),
(217, 'Huyện Lạng Giang', 'Huyện', 24),
(218, 'Huyện Lục Nam', 'Huyện', 24),
(219, 'Huyện Lục Ngạn', 'Huyện', 24),
(220, 'Huyện Sơn Động', 'Huyện', 24),
(221, 'Huyện Yên Dũng', 'Huyện', 24),
(222, 'Huyện Việt Yên', 'Huyện', 24),
(223, 'Huyện Hiệp Hòa', 'Huyện', 24),
(227, 'Thành phố Việt Trì', 'Thành phố', 25),
(228, 'Thị xã Phú Thọ', 'Thị xã', 25),
(230, 'Huyện Đoan Hùng', 'Huyện', 25),
(231, 'Huyện Hạ Hoà', 'Huyện', 25),
(232, 'Huyện Thanh Ba', 'Huyện', 25),
(233, 'Huyện Phù Ninh', 'Huyện', 25),
(234, 'Huyện Yên Lập', 'Huyện', 25),
(235, 'Huyện Cẩm Khê', 'Huyện', 25),
(236, 'Huyện Tam Nông', 'Huyện', 25),
(237, 'Huyện Lâm Thao', 'Huyện', 25),
(238, 'Huyện Thanh Sơn', 'Huyện', 25),
(239, 'Huyện Thanh Thuỷ', 'Huyện', 25),
(240, 'Huyện Tân Sơn', 'Huyện', 25),
(243, 'Thành phố Vĩnh Yên', 'Thành phố', 26),
(244, 'Thị xã Phúc Yên', 'Thị xã', 26),
(246, 'Huyện Lập Thạch', 'Huyện', 26),
(247, 'Huyện Tam Dương', 'Huyện', 26),
(248, 'Huyện Tam Đảo', 'Huyện', 26),
(249, 'Huyện Bình Xuyên', 'Huyện', 26),
(250, 'Huyện Mê Linh', 'Huyện', 1),
(251, 'Huyện Yên Lạc', 'Huyện', 26),
(252, 'Huyện Vĩnh Tường', 'Huyện', 26),
(253, 'Huyện Sông Lô', 'Huyện', 26),
(256, 'Thành phố Bắc Ninh', 'Thành phố', 27),
(258, 'Huyện Yên Phong', 'Huyện', 27),
(259, 'Huyện Quế Võ', 'Huyện', 27),
(260, 'Huyện Tiên Du', 'Huyện', 27),
(261, 'Thị xã Từ Sơn', 'Thị xã', 27),
(262, 'Huyện Thuận Thành', 'Huyện', 27),
(263, 'Huyện Gia Bình', 'Huyện', 27),
(264, 'Huyện Lương Tài', 'Huyện', 27),
(268, 'Quận Hà Đông', 'Quận', 1),
(269, 'Thị xã Sơn Tây', 'Thị xã', 1),
(271, 'Huyện Ba Vì', 'Huyện', 1),
(272, 'Huyện Phúc Thọ', 'Huyện', 1),
(273, 'Huyện Đan Phượng', 'Huyện', 1),
(274, 'Huyện Hoài Đức', 'Huyện', 1),
(275, 'Huyện Quốc Oai', 'Huyện', 1),
(276, 'Huyện Thạch Thất', 'Huyện', 1),
(277, 'Huyện Chương Mỹ', 'Huyện', 1),
(278, 'Huyện Thanh Oai', 'Huyện', 1),
(279, 'Huyện Thường Tín', 'Huyện', 1),
(280, 'Huyện Phú Xuyên', 'Huyện', 1),
(281, 'Huyện Ứng Hòa', 'Huyện', 1),
(282, 'Huyện Mỹ Đức', 'Huyện', 1),
(288, 'Thành phố Hải Dương', 'Thành phố', 30),
(290, 'Thị xã Chí Linh', 'Thị xã', 30),
(291, 'Huyện Nam Sách', 'Huyện', 30),
(292, 'Huyện Kinh Môn', 'Huyện', 30),
(293, 'Huyện Kim Thành', 'Huyện', 30),
(294, 'Huyện Thanh Hà', 'Huyện', 30),
(295, 'Huyện Cẩm Giàng', 'Huyện', 30),
(296, 'Huyện Bình Giang', 'Huyện', 30),
(297, 'Huyện Gia Lộc', 'Huyện', 30),
(298, 'Huyện Tứ Kỳ', 'Huyện', 30),
(299, 'Huyện Ninh Giang', 'Huyện', 30),
(300, 'Huyện Thanh Miện', 'Huyện', 30),
(303, 'Quận Hồng Bàng', 'Quận', 31),
(304, 'Quận Ngô Quyền', 'Quận', 31),
(305, 'Quận Lê Chân', 'Quận', 31),
(306, 'Quận Hải An', 'Quận', 31),
(307, 'Quận Kiến An', 'Quận', 31),
(308, 'Quận Đồ Sơn', 'Quận', 31),
(309, 'Quận Dương Kinh', 'Quận', 31),
(311, 'Huyện Thuỷ Nguyên', 'Huyện', 31),
(312, 'Huyện An Dương', 'Huyện', 31),
(313, 'Huyện An Lão', 'Huyện', 31),
(314, 'Huyện Kiến Thuỵ', 'Huyện', 31),
(315, 'Huyện Tiên Lãng', 'Huyện', 31),
(316, 'Huyện Vĩnh Bảo', 'Huyện', 31),
(317, 'Huyện Cát Hải', 'Huyện', 31),
(318, 'Huyện Bạch Long Vĩ', 'Huyện', 31),
(323, 'Thành phố Hưng Yên', 'Thành phố', 33),
(325, 'Huyện Văn Lâm', 'Huyện', 33),
(326, 'Huyện Văn Giang', 'Huyện', 33),
(327, 'Huyện Yên Mỹ', 'Huyện', 33),
(328, 'Huyện Mỹ Hào', 'Huyện', 33),
(329, 'Huyện Ân Thi', 'Huyện', 33),
(330, 'Huyện Khoái Châu', 'Huyện', 33),
(331, 'Huyện Kim Động', 'Huyện', 33),
(332, 'Huyện Tiên Lữ', 'Huyện', 33),
(333, 'Huyện Phù Cừ', 'Huyện', 33),
(336, 'Thành phố Thái Bình', 'Thành phố', 34),
(338, 'Huyện Quỳnh Phụ', 'Huyện', 34),
(339, 'Huyện Hưng Hà', 'Huyện', 34),
(340, 'Huyện Đông Hưng', 'Huyện', 34),
(341, 'Huyện Thái Thụy', 'Huyện', 34),
(342, 'Huyện Tiền Hải', 'Huyện', 34),
(343, 'Huyện Kiến Xương', 'Huyện', 34),
(344, 'Huyện Vũ Thư', 'Huyện', 34),
(347, 'Thành phố Phủ Lý', 'Thành phố', 35),
(349, 'Huyện Duy Tiên', 'Huyện', 35),
(350, 'Huyện Kim Bảng', 'Huyện', 35),
(351, 'Huyện Thanh Liêm', 'Huyện', 35),
(352, 'Huyện Bình Lục', 'Huyện', 35),
(353, 'Huyện Lý Nhân', 'Huyện', 35),
(356, 'Thành phố Nam Định', 'Thành phố', 36),
(358, 'Huyện Mỹ Lộc', 'Huyện', 36),
(359, 'Huyện Vụ Bản', 'Huyện', 36),
(360, 'Huyện Ý Yên', 'Huyện', 36),
(361, 'Huyện Nghĩa Hưng', 'Huyện', 36),
(362, 'Huyện Nam Trực', 'Huyện', 36),
(363, 'Huyện Trực Ninh', 'Huyện', 36),
(364, 'Huyện Xuân Trường', 'Huyện', 36),
(365, 'Huyện Giao Thủy', 'Huyện', 36),
(366, 'Huyện Hải Hậu', 'Huyện', 36),
(369, 'Thành phố Ninh Bình', 'Thành phố', 37),
(370, 'Thành phố Tam Điệp', 'Thành phố', 37),
(372, 'Huyện Nho Quan', 'Huyện', 37),
(373, 'Huyện Gia Viễn', 'Huyện', 37),
(374, 'Huyện Hoa Lư', 'Huyện', 37),
(375, 'Huyện Yên Khánh', 'Huyện', 37),
(376, 'Huyện Kim Sơn', 'Huyện', 37),
(377, 'Huyện Yên Mô', 'Huyện', 37),
(380, 'Thành phố Thanh Hóa', 'Thành phố', 38),
(381, 'Thị xã Bỉm Sơn', 'Thị xã', 38),
(382, 'Thị xã Sầm Sơn', 'Thị xã', 38),
(384, 'Huyện Mường Lát', 'Huyện', 38),
(385, 'Huyện Quan Hóa', 'Huyện', 38),
(386, 'Huyện Bá Thước', 'Huyện', 38),
(387, 'Huyện Quan Sơn', 'Huyện', 38),
(388, 'Huyện Lang Chánh', 'Huyện', 38),
(389, 'Huyện Ngọc Lặc', 'Huyện', 38),
(390, 'Huyện Cẩm Thủy', 'Huyện', 38),
(391, 'Huyện Thạch Thành', 'Huyện', 38),
(392, 'Huyện Hà Trung', 'Huyện', 38),
(393, 'Huyện Vĩnh Lộc', 'Huyện', 38),
(394, 'Huyện Yên Định', 'Huyện', 38),
(395, 'Huyện Thọ Xuân', 'Huyện', 38),
(396, 'Huyện Thường Xuân', 'Huyện', 38),
(397, 'Huyện Triệu Sơn', 'Huyện', 38),
(398, 'Huyện Thiệu Hóa', 'Huyện', 38),
(399, 'Huyện Hoằng Hóa', 'Huyện', 38),
(400, 'Huyện Hậu Lộc', 'Huyện', 38),
(401, 'Huyện Nga Sơn', 'Huyện', 38),
(402, 'Huyện Như Xuân', 'Huyện', 38),
(403, 'Huyện Như Thanh', 'Huyện', 38),
(404, 'Huyện Nông Cống', 'Huyện', 38),
(405, 'Huyện Đông Sơn', 'Huyện', 38),
(406, 'Huyện Quảng Xương', 'Huyện', 38),
(407, 'Huyện Tĩnh Gia', 'Huyện', 38),
(412, 'Thành phố Vinh', 'Thành phố', 40),
(413, 'Thị xã Cửa Lò', 'Thị xã', 40),
(414, 'Thị xã Thái Hoà', 'Thị xã', 40),
(415, 'Huyện Quế Phong', 'Huyện', 40),
(416, 'Huyện Quỳ Châu', 'Huyện', 40),
(417, 'Huyện Kỳ Sơn', 'Huyện', 40),
(418, 'Huyện Tương Dương', 'Huyện', 40),
(419, 'Huyện Nghĩa Đàn', 'Huyện', 40),
(420, 'Huyện Quỳ Hợp', 'Huyện', 40),
(421, 'Huyện Quỳnh Lưu', 'Huyện', 40),
(422, 'Huyện Con Cuông', 'Huyện', 40),
(423, 'Huyện Tân Kỳ', 'Huyện', 40),
(424, 'Huyện Anh Sơn', 'Huyện', 40),
(425, 'Huyện Diễn Châu', 'Huyện', 40),
(426, 'Huyện Yên Thành', 'Huyện', 40),
(427, 'Huyện Đô Lương', 'Huyện', 40),
(428, 'Huyện Thanh Chương', 'Huyện', 40),
(429, 'Huyện Nghi Lộc', 'Huyện', 40),
(430, 'Huyện Nam Đàn', 'Huyện', 40),
(431, 'Huyện Hưng Nguyên', 'Huyện', 40),
(432, 'Thị xã Hoàng Mai', 'Thị xã', 40),
(436, 'Thành phố Hà Tĩnh', 'Thành phố', 42),
(437, 'Thị xã Hồng Lĩnh', 'Thị xã', 42),
(439, 'Huyện Hương Sơn', 'Huyện', 42),
(440, 'Huyện Đức Thọ', 'Huyện', 42),
(441, 'Huyện Vũ Quang', 'Huyện', 42),
(442, 'Huyện Nghi Xuân', 'Huyện', 42),
(443, 'Huyện Can Lộc', 'Huyện', 42),
(444, 'Huyện Hương Khê', 'Huyện', 42),
(445, 'Huyện Thạch Hà', 'Huyện', 42),
(446, 'Huyện Cẩm Xuyên', 'Huyện', 42),
(447, 'Huyện Kỳ Anh', 'Huyện', 42),
(448, 'Huyện Lộc Hà', 'Huyện', 42),
(449, 'Thị xã Kỳ Anh', 'Thị xã', 42),
(450, 'Thành Phố Đồng Hới', 'Thành phố', 44),
(452, 'Huyện Minh Hóa', 'Huyện', 44),
(453, 'Huyện Tuyên Hóa', 'Huyện', 44),
(454, 'Huyện Quảng Trạch', 'Thị xã', 44),
(455, 'Huyện Bố Trạch', 'Huyện', 44),
(456, 'Huyện Quảng Ninh', 'Huyện', 44),
(457, 'Huyện Lệ Thủy', 'Huyện', 44),
(458, 'Thị xã Ba Đồn', 'Huyện', 44),
(461, 'Thành phố Đông Hà', 'Thành phố', 45),
(462, 'Thị xã Quảng Trị', 'Thị xã', 45),
(464, 'Huyện Vĩnh Linh', 'Huyện', 45),
(465, 'Huyện Hướng Hóa', 'Huyện', 45),
(466, 'Huyện Gio Linh', 'Huyện', 45),
(467, 'Huyện Đa Krông', 'Huyện', 45),
(468, 'Huyện Cam Lộ', 'Huyện', 45),
(469, 'Huyện Triệu Phong', 'Huyện', 45),
(470, 'Huyện Hải Lăng', 'Huyện', 45),
(471, 'Huyện Cồn Cỏ', 'Huyện', 45),
(474, 'Thành phố Huế', 'Thành phố', 46),
(476, 'Huyện Phong Điền', 'Huyện', 46),
(477, 'Huyện Quảng Điền', 'Huyện', 46),
(478, 'Huyện Phú Vang', 'Huyện', 46),
(479, 'Thị xã Hương Thủy', 'Thị xã', 46),
(480, 'Thị xã Hương Trà', 'Thị xã', 46),
(481, 'Huyện A Lưới', 'Huyện', 46),
(482, 'Huyện Phú Lộc', 'Huyện', 46),
(483, 'Huyện Nam Đông', 'Huyện', 46),
(490, 'Quận Liên Chiểu', 'Quận', 48),
(491, 'Quận Thanh Khê', 'Quận', 48),
(492, 'Quận Hải Châu', 'Quận', 48),
(493, 'Quận Sơn Trà', 'Quận', 48),
(494, 'Quận Ngũ Hành Sơn', 'Quận', 48),
(495, 'Quận Cẩm Lệ', 'Quận', 48),
(497, 'Huyện Hòa Vang', 'Huyện', 48),
(498, 'Huyện Hoàng Sa', 'Huyện', 48),
(502, 'Thành phố Tam Kỳ', 'Thành phố', 49),
(503, 'Thành phố Hội An', 'Thành phố', 49),
(504, 'Huyện Tây Giang', 'Huyện', 49),
(505, 'Huyện Đông Giang', 'Huyện', 49),
(506, 'Huyện Đại Lộc', 'Huyện', 49),
(507, 'Thị xã Điện Bàn', 'Thị xã', 49),
(508, 'Huyện Duy Xuyên', 'Huyện', 49),
(509, 'Huyện Quế Sơn', 'Huyện', 49),
(510, 'Huyện Nam Giang', 'Huyện', 49),
(511, 'Huyện Phước Sơn', 'Huyện', 49),
(512, 'Huyện Hiệp Đức', 'Huyện', 49),
(513, 'Huyện Thăng Bình', 'Huyện', 49),
(514, 'Huyện Tiên Phước', 'Huyện', 49),
(515, 'Huyện Bắc Trà My', 'Huyện', 49),
(516, 'Huyện Nam Trà My', 'Huyện', 49),
(517, 'Huyện Núi Thành', 'Huyện', 49),
(518, 'Huyện Phú Ninh', 'Huyện', 49),
(519, 'Huyện Nông Sơn', 'Huyện', 49),
(522, 'Thành phố Quảng Ngãi', 'Thành phố', 51),
(524, 'Huyện Bình Sơn', 'Huyện', 51),
(525, 'Huyện Trà Bồng', 'Huyện', 51),
(526, 'Huyện Tây Trà', 'Huyện', 51),
(527, 'Huyện Sơn Tịnh', 'Huyện', 51),
(528, 'Huyện Tư Nghĩa', 'Huyện', 51),
(529, 'Huyện Sơn Hà', 'Huyện', 51),
(530, 'Huyện Sơn Tây', 'Huyện', 51),
(531, 'Huyện Minh Long', 'Huyện', 51),
(532, 'Huyện Nghĩa Hành', 'Huyện', 51),
(533, 'Huyện Mộ Đức', 'Huyện', 51),
(534, 'Huyện Đức Phổ', 'Huyện', 51),
(535, 'Huyện Ba Tơ', 'Huyện', 51),
(536, 'Huyện Lý Sơn', 'Huyện', 51),
(540, 'Thành phố Qui Nhơn', 'Thành phố', 52),
(542, 'Huyện An Lão', 'Huyện', 52),
(543, 'Huyện Hoài Nhơn', 'Huyện', 52),
(544, 'Huyện Hoài Ân', 'Huyện', 52),
(545, 'Huyện Phù Mỹ', 'Huyện', 52),
(546, 'Huyện Vĩnh Thạnh', 'Huyện', 52),
(547, 'Huyện Tây Sơn', 'Huyện', 52),
(548, 'Huyện Phù Cát', 'Huyện', 52),
(549, 'Thị xã An Nhơn', 'Thị xã', 52),
(550, 'Huyện Tuy Phước', 'Huyện', 52),
(551, 'Huyện Vân Canh', 'Huyện', 52),
(555, 'Thành phố Tuy Hoà', 'Thành phố', 54),
(557, 'Thị xã Sông Cầu', 'Thị xã', 54),
(558, 'Huyện Đồng Xuân', 'Huyện', 54),
(559, 'Huyện Tuy An', 'Huyện', 54),
(560, 'Huyện Sơn Hòa', 'Huyện', 54),
(561, 'Huyện Sông Hinh', 'Huyện', 54),
(562, 'Huyện Tây Hoà', 'Huyện', 54),
(563, 'Huyện Phú Hoà', 'Huyện', 54),
(564, 'Huyện Đông Hòa', 'Huyện', 54),
(568, 'Thành phố Nha Trang', 'Thành phố', 56),
(569, 'Thành phố Cam Ranh', 'Thành phố', 56),
(570, 'Huyện Cam Lâm', 'Huyện', 56),
(571, 'Huyện Vạn Ninh', 'Huyện', 56),
(572, 'Thị xã Ninh Hòa', 'Thị xã', 56),
(573, 'Huyện Khánh Vĩnh', 'Huyện', 56),
(574, 'Huyện Diên Khánh', 'Huyện', 56),
(575, 'Huyện Khánh Sơn', 'Huyện', 56),
(576, 'Huyện Trường Sa', 'Huyện', 56),
(582, 'Thành phố Phan Rang-Tháp Chàm', 'Thành phố', 58),
(584, 'Huyện Bác Ái', 'Huyện', 58),
(585, 'Huyện Ninh Sơn', 'Huyện', 58),
(586, 'Huyện Ninh Hải', 'Huyện', 58),
(587, 'Huyện Ninh Phước', 'Huyện', 58),
(588, 'Huyện Thuận Bắc', 'Huyện', 58),
(589, 'Huyện Thuận Nam', 'Huyện', 58),
(593, 'Thành phố Phan Thiết', 'Thành phố', 60),
(594, 'Thị xã La Gi', 'Thị xã', 60),
(595, 'Huyện Tuy Phong', 'Huyện', 60),
(596, 'Huyện Bắc Bình', 'Huyện', 60),
(597, 'Huyện Hàm Thuận Bắc', 'Huyện', 60),
(598, 'Huyện Hàm Thuận Nam', 'Huyện', 60),
(599, 'Huyện Tánh Linh', 'Huyện', 60),
(600, 'Huyện Đức Linh', 'Huyện', 60),
(601, 'Huyện Hàm Tân', 'Huyện', 60),
(602, 'Huyện Phú Quí', 'Huyện', 60),
(608, 'Thành phố Kon Tum', 'Thành phố', 62),
(610, 'Huyện Đắk Glei', 'Huyện', 62),
(611, 'Huyện Ngọc Hồi', 'Huyện', 62),
(612, 'Huyện Đắk Tô', 'Huyện', 62),
(613, 'Huyện Kon Plông', 'Huyện', 62),
(614, 'Huyện Kon Rẫy', 'Huyện', 62),
(615, 'Huyện Đắk Hà', 'Huyện', 62),
(616, 'Huyện Sa Thầy', 'Huyện', 62),
(617, 'Huyện Tu Mơ Rông', 'Huyện', 62),
(618, 'Huyện Ia H\' Drai', 'Huyện', 62),
(622, 'Thành phố Pleiku', 'Thành phố', 64),
(623, 'Thị xã An Khê', 'Thị xã', 64),
(624, 'Thị xã Ayun Pa', 'Thị xã', 64),
(625, 'Huyện KBang', 'Huyện', 64),
(626, 'Huyện Đăk Đoa', 'Huyện', 64),
(627, 'Huyện Chư Păh', 'Huyện', 64),
(628, 'Huyện Ia Grai', 'Huyện', 64),
(629, 'Huyện Mang Yang', 'Huyện', 64),
(630, 'Huyện Kông Chro', 'Huyện', 64),
(631, 'Huyện Đức Cơ', 'Huyện', 64),
(632, 'Huyện Chư Prông', 'Huyện', 64),
(633, 'Huyện Chư Sê', 'Huyện', 64),
(634, 'Huyện Đăk Pơ', 'Huyện', 64),
(635, 'Huyện Ia Pa', 'Huyện', 64),
(637, 'Huyện Krông Pa', 'Huyện', 64),
(638, 'Huyện Phú Thiện', 'Huyện', 64),
(639, 'Huyện Chư Pưh', 'Huyện', 64),
(643, 'Thành phố Buôn Ma Thuột', 'Thành phố', 66),
(644, 'Thị Xã Buôn Hồ', 'Thị xã', 66),
(645, 'Huyện Ea H\'leo', 'Huyện', 66),
(646, 'Huyện Ea Súp', 'Huyện', 66),
(647, 'Huyện Buôn Đôn', 'Huyện', 66),
(648, 'Huyện Cư M\'gar', 'Huyện', 66),
(649, 'Huyện Krông Búk', 'Huyện', 66),
(650, 'Huyện Krông Năng', 'Huyện', 66),
(651, 'Huyện Ea Kar', 'Huyện', 66),
(652, 'Huyện M\'Đrắk', 'Huyện', 66),
(653, 'Huyện Krông Bông', 'Huyện', 66),
(654, 'Huyện Krông Pắc', 'Huyện', 66),
(655, 'Huyện Krông A Na', 'Huyện', 66),
(656, 'Huyện Lắk', 'Huyện', 66),
(657, 'Huyện Cư Kuin', 'Huyện', 66),
(660, 'Thị xã Gia Nghĩa', 'Thị xã', 67),
(661, 'Huyện Đăk Glong', 'Huyện', 67),
(662, 'Huyện Cư Jút', 'Huyện', 67),
(663, 'Huyện Đắk Mil', 'Huyện', 67),
(664, 'Huyện Krông Nô', 'Huyện', 67),
(665, 'Huyện Đắk Song', 'Huyện', 67),
(666, 'Huyện Đắk R Lấp', 'Huyện', 67),
(667, 'Huyện Tuy Đức', 'Huyện', 67),
(672, 'Thành phố Đà Lạt', 'Thành phố', 68),
(673, 'Thành phố Bảo Lộc', 'Thành phố', 68),
(674, 'Huyện Đam Rông', 'Huyện', 68),
(675, 'Huyện Lạc Dương', 'Huyện', 68),
(676, 'Huyện Lâm Hà', 'Huyện', 68),
(677, 'Huyện Đơn Dương', 'Huyện', 68),
(678, 'Huyện Đức Trọng', 'Huyện', 68),
(679, 'Huyện Di Linh', 'Huyện', 68),
(680, 'Huyện Bảo Lâm', 'Huyện', 68),
(681, 'Huyện Đạ Huoai', 'Huyện', 68),
(682, 'Huyện Đạ Tẻh', 'Huyện', 68),
(683, 'Huyện Cát Tiên', 'Huyện', 68),
(688, 'Thị xã Phước Long', 'Thị xã', 70),
(689, 'Thị xã Đồng Xoài', 'Thị xã', 70),
(690, 'Thị xã Bình Long', 'Thị xã', 70),
(691, 'Huyện Bù Gia Mập', 'Huyện', 70),
(692, 'Huyện Lộc Ninh', 'Huyện', 70),
(693, 'Huyện Bù Đốp', 'Huyện', 70),
(694, 'Huyện Hớn Quản', 'Huyện', 70),
(695, 'Huyện Đồng Phú', 'Huyện', 70),
(696, 'Huyện Bù Đăng', 'Huyện', 70),
(697, 'Huyện Chơn Thành', 'Huyện', 70),
(698, 'Huyện Phú Riềng', 'Huyện', 70),
(703, 'Thành phố Tây Ninh', 'Thành phố', 72),
(705, 'Huyện Tân Biên', 'Huyện', 72),
(706, 'Huyện Tân Châu', 'Huyện', 72),
(707, 'Huyện Dương Minh Châu', 'Huyện', 72),
(708, 'Huyện Châu Thành', 'Huyện', 72),
(709, 'Huyện Hòa Thành', 'Huyện', 72),
(710, 'Huyện Gò Dầu', 'Huyện', 72),
(711, 'Huyện Bến Cầu', 'Huyện', 72),
(712, 'Huyện Trảng Bàng', 'Huyện', 72),
(718, 'Thành phố Thủ Dầu Một', 'Thành phố', 74),
(719, 'Huyện Bàu Bàng', 'Huyện', 74),
(720, 'Huyện Dầu Tiếng', 'Huyện', 74),
(721, 'Thị xã Bến Cát', 'Thị xã', 74),
(722, 'Huyện Phú Giáo', 'Huyện', 74),
(723, 'Thị xã Tân Uyên', 'Thị xã', 74),
(724, 'Thị xã Dĩ An', 'Thị xã', 74),
(725, 'Thị xã Thuận An', 'Thị xã', 74),
(726, 'Huyện Bắc Tân Uyên', 'Huyện', 74),
(731, 'Thành phố Biên Hòa', 'Thành phố', 75),
(732, 'Thị xã Long Khánh', 'Thị xã', 75),
(734, 'Huyện Tân Phú', 'Huyện', 75),
(735, 'Huyện Vĩnh Cửu', 'Huyện', 75),
(736, 'Huyện Định Quán', 'Huyện', 75),
(737, 'Huyện Trảng Bom', 'Huyện', 75),
(738, 'Huyện Thống Nhất', 'Huyện', 75),
(739, 'Huyện Cẩm Mỹ', 'Huyện', 75),
(740, 'Huyện Long Thành', 'Huyện', 75),
(741, 'Huyện Xuân Lộc', 'Huyện', 75),
(742, 'Huyện Nhơn Trạch', 'Huyện', 75),
(747, 'Thành phố Vũng Tàu', 'Thành phố', 77),
(748, 'Thành phố Bà Rịa', 'Thành phố', 77),
(750, 'Huyện Châu Đức', 'Huyện', 77),
(751, 'Huyện Xuyên Mộc', 'Huyện', 77),
(752, 'Huyện Long Điền', 'Huyện', 77),
(753, 'Huyện Đất Đỏ', 'Huyện', 77),
(754, 'Huyện Tân Thành', 'Huyện', 77),
(755, 'Huyện Côn Đảo', 'Huyện', 77),
(760, 'Quận 1', 'Quận', 79),
(761, 'Quận 12', 'Quận', 79),
(762, 'Quận Thủ Đức', 'Quận', 79),
(763, 'Quận 9', 'Quận', 79),
(764, 'Quận Gò Vấp', 'Quận', 79),
(765, 'Quận Bình Thạnh', 'Quận', 79),
(766, 'Quận Tân Bình', 'Quận', 79),
(767, 'Quận Tân Phú', 'Quận', 79),
(768, 'Quận Phú Nhuận', 'Quận', 79),
(769, 'Quận 2', 'Quận', 79),
(770, 'Quận 3', 'Quận', 79),
(771, 'Quận 10', 'Quận', 79),
(772, 'Quận 11', 'Quận', 79),
(773, 'Quận 4', 'Quận', 79),
(774, 'Quận 5', 'Quận', 79),
(775, 'Quận 6', 'Quận', 79),
(776, 'Quận 8', 'Quận', 79),
(777, 'Quận Bình Tân', 'Quận', 79),
(778, 'Quận 7', 'Quận', 79),
(783, 'Huyện Củ Chi', 'Huyện', 79),
(784, 'Huyện Hóc Môn', 'Huyện', 79),
(785, 'Huyện Bình Chánh', 'Huyện', 79),
(786, 'Huyện Nhà Bè', 'Huyện', 79),
(787, 'Huyện Cần Giờ', 'Huyện', 79),
(794, 'Thành phố Tân An', 'Thành phố', 80),
(795, 'Thị xã Kiến Tường', 'Thị xã', 80),
(796, 'Huyện Tân Hưng', 'Huyện', 80),
(797, 'Huyện Vĩnh Hưng', 'Huyện', 80),
(798, 'Huyện Mộc Hóa', 'Huyện', 80),
(799, 'Huyện Tân Thạnh', 'Huyện', 80),
(800, 'Huyện Thạnh Hóa', 'Huyện', 80),
(801, 'Huyện Đức Huệ', 'Huyện', 80),
(802, 'Huyện Đức Hòa', 'Huyện', 80),
(803, 'Huyện Bến Lức', 'Huyện', 80),
(804, 'Huyện Thủ Thừa', 'Huyện', 80),
(805, 'Huyện Tân Trụ', 'Huyện', 80),
(806, 'Huyện Cần Đước', 'Huyện', 80),
(807, 'Huyện Cần Giuộc', 'Huyện', 80),
(808, 'Huyện Châu Thành', 'Huyện', 80),
(815, 'Thành phố Mỹ Tho', 'Thành phố', 82),
(816, 'Thị xã Gò Công', 'Thị xã', 82),
(817, 'Thị xã Cai Lậy', 'Huyện', 82),
(818, 'Huyện Tân Phước', 'Huyện', 82),
(819, 'Huyện Cái Bè', 'Huyện', 82),
(820, 'Huyện Cai Lậy', 'Thị xã', 82),
(821, 'Huyện Châu Thành', 'Huyện', 82),
(822, 'Huyện Chợ Gạo', 'Huyện', 82),
(823, 'Huyện Gò Công Tây', 'Huyện', 82),
(824, 'Huyện Gò Công Đông', 'Huyện', 82),
(825, 'Huyện Tân Phú Đông', 'Huyện', 82),
(829, 'Thành phố Bến Tre', 'Thành phố', 83),
(831, 'Huyện Châu Thành', 'Huyện', 83),
(832, 'Huyện Chợ Lách', 'Huyện', 83),
(833, 'Huyện Mỏ Cày Nam', 'Huyện', 83),
(834, 'Huyện Giồng Trôm', 'Huyện', 83),
(835, 'Huyện Bình Đại', 'Huyện', 83),
(836, 'Huyện Ba Tri', 'Huyện', 83),
(837, 'Huyện Thạnh Phú', 'Huyện', 83),
(838, 'Huyện Mỏ Cày Bắc', 'Huyện', 83),
(842, 'Thành phố Trà Vinh', 'Thành phố', 84),
(844, 'Huyện Càng Long', 'Huyện', 84),
(845, 'Huyện Cầu Kè', 'Huyện', 84),
(846, 'Huyện Tiểu Cần', 'Huyện', 84),
(847, 'Huyện Châu Thành', 'Huyện', 84),
(848, 'Huyện Cầu Ngang', 'Huyện', 84),
(849, 'Huyện Trà Cú', 'Huyện', 84),
(850, 'Huyện Duyên Hải', 'Huyện', 84),
(851, 'Thị xã Duyên Hải', 'Thị xã', 84),
(855, 'Thành phố Vĩnh Long', 'Thành phố', 86),
(857, 'Huyện Long Hồ', 'Huyện', 86),
(858, 'Huyện Mang Thít', 'Huyện', 86),
(859, 'Huyện  Vũng Liêm', 'Huyện', 86),
(860, 'Huyện Tam Bình', 'Huyện', 86),
(861, 'Thị xã Bình Minh', 'Thị xã', 86),
(862, 'Huyện Trà Ôn', 'Huyện', 86),
(863, 'Huyện Bình Tân', 'Huyện', 86),
(866, 'Thành phố Cao Lãnh', 'Thành phố', 87),
(867, 'Thành phố Sa Đéc', 'Thành phố', 87),
(868, 'Thị xã Hồng Ngự', 'Thị xã', 87),
(869, 'Huyện Tân Hồng', 'Huyện', 87),
(870, 'Huyện Hồng Ngự', 'Huyện', 87),
(871, 'Huyện Tam Nông', 'Huyện', 87),
(872, 'Huyện Tháp Mười', 'Huyện', 87),
(873, 'Huyện Cao Lãnh', 'Huyện', 87),
(874, 'Huyện Thanh Bình', 'Huyện', 87),
(875, 'Huyện Lấp Vò', 'Huyện', 87),
(876, 'Huyện Lai Vung', 'Huyện', 87),
(877, 'Huyện Châu Thành', 'Huyện', 87),
(883, 'Thành phố Long Xuyên', 'Thành phố', 89),
(884, 'Thành phố Châu Đốc', 'Thành phố', 89),
(886, 'Huyện An Phú', 'Huyện', 89),
(887, 'Thị xã Tân Châu', 'Thị xã', 89),
(888, 'Huyện Phú Tân', 'Huyện', 89),
(889, 'Huyện Châu Phú', 'Huyện', 89),
(890, 'Huyện Tịnh Biên', 'Huyện', 89),
(891, 'Huyện Tri Tôn', 'Huyện', 89),
(892, 'Huyện Châu Thành', 'Huyện', 89),
(893, 'Huyện Chợ Mới', 'Huyện', 89),
(894, 'Huyện Thoại Sơn', 'Huyện', 89),
(899, 'Thành phố Rạch Giá', 'Thành phố', 91),
(900, 'Thị xã Hà Tiên', 'Thị xã', 91),
(902, 'Huyện Kiên Lương', 'Huyện', 91),
(903, 'Huyện Hòn Đất', 'Huyện', 91),
(904, 'Huyện Tân Hiệp', 'Huyện', 91),
(905, 'Huyện Châu Thành', 'Huyện', 91),
(906, 'Huyện Giồng Riềng', 'Huyện', 91),
(907, 'Huyện Gò Quao', 'Huyện', 91),
(908, 'Huyện An Biên', 'Huyện', 91),
(909, 'Huyện An Minh', 'Huyện', 91),
(910, 'Huyện Vĩnh Thuận', 'Huyện', 91),
(911, 'Huyện Phú Quốc', 'Huyện', 91),
(912, 'Huyện Kiên Hải', 'Huyện', 91),
(913, 'Huyện U Minh Thượng', 'Huyện', 91),
(914, 'Huyện Giang Thành', 'Huyện', 91),
(916, 'Quận Ninh Kiều', 'Quận', 92),
(917, 'Quận Ô Môn', 'Quận', 92),
(918, 'Quận Bình Thuỷ', 'Quận', 92),
(919, 'Quận Cái Răng', 'Quận', 92),
(923, 'Quận Thốt Nốt', 'Quận', 92),
(924, 'Huyện Vĩnh Thạnh', 'Huyện', 92),
(925, 'Huyện Cờ Đỏ', 'Huyện', 92),
(926, 'Huyện Phong Điền', 'Huyện', 92),
(927, 'Huyện Thới Lai', 'Huyện', 92),
(930, 'Thành phố Vị Thanh', 'Thành phố', 93),
(931, 'Thị xã Ngã Bảy', 'Thị xã', 93),
(932, 'Huyện Châu Thành A', 'Huyện', 93),
(933, 'Huyện Châu Thành', 'Huyện', 93),
(934, 'Huyện Phụng Hiệp', 'Huyện', 93),
(935, 'Huyện Vị Thuỷ', 'Huyện', 93),
(936, 'Huyện Long Mỹ', 'Huyện', 93),
(937, 'Thị xã Long Mỹ', 'Thị xã', 93),
(941, 'Thành phố Sóc Trăng', 'Thành phố', 94),
(942, 'Huyện Châu Thành', 'Huyện', 94),
(943, 'Huyện Kế Sách', 'Huyện', 94),
(944, 'Huyện Mỹ Tú', 'Huyện', 94),
(945, 'Huyện Cù Lao Dung', 'Huyện', 94),
(946, 'Huyện Long Phú', 'Huyện', 94),
(947, 'Huyện Mỹ Xuyên', 'Huyện', 94),
(948, 'Thị xã Ngã Năm', 'Thị xã', 94),
(949, 'Huyện Thạnh Trị', 'Huyện', 94),
(950, 'Thị xã Vĩnh Châu', 'Thị xã', 94),
(951, 'Huyện Trần Đề', 'Huyện', 94),
(954, 'Thành phố Bạc Liêu', 'Thành phố', 95),
(956, 'Huyện Hồng Dân', 'Huyện', 95),
(957, 'Huyện Phước Long', 'Huyện', 95),
(958, 'Huyện Vĩnh Lợi', 'Huyện', 95),
(959, 'Thị xã Giá Rai', 'Thị xã', 95),
(960, 'Huyện Đông Hải', 'Huyện', 95),
(961, 'Huyện Hoà Bình', 'Huyện', 95),
(964, 'Thành phố Cà Mau', 'Thành phố', 96),
(966, 'Huyện U Minh', 'Huyện', 96),
(967, 'Huyện Thới Bình', 'Huyện', 96),
(968, 'Huyện Trần Văn Thời', 'Huyện', 96),
(969, 'Huyện Cái Nước', 'Huyện', 96),
(970, 'Huyện Đầm Dơi', 'Huyện', 96),
(971, 'Huyện Năm Căn', 'Huyện', 96),
(972, 'Huyện Phú Tân', 'Huyện', 96),
(973, 'Huyện Ngọc Hiển', 'Huyện', 96);

-- --------------------------------------------------------

--
-- Table structure for table `db_evaluate`
--

CREATE TABLE `db_evaluate` (
  `id` int(10) NOT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sdt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comment_time` datetime NOT NULL,
  `comment_by` int(11) DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 4,
  `trash` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_evaluate`
--

INSERT INTO `db_evaluate` (`id`, `content`, `product_id`, `user_name`, `sdt`, `comment_time`, `comment_by`, `star`, `trash`) VALUES
(21, 'hết nước chấm', 60, 'tiến', '09897869435', '2022-05-27 10:39:17', NULL, 5, 1),
(23, 'ăn ngon đó', 62, 'hi', '123123', '2022-05-27 14:38:48', NULL, 2, 1),
(25, 'Rất là ngon !!', 55, 'Rất là ngon !!', '123123', '2022-05-27 15:47:58', NULL, 4, 1),
(26, 'tuyệt', 59, 'thanh1996', '0969124469', '2022-06-10 09:51:02', NULL, 4, 1),
(27, 'Sản phẩm tốt đấy', 63, 'chuongchau', '0123912241', '2022-06-27 09:18:35', NULL, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_hocvien`
--

CREATE TABLE `db_hocvien` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ngaysinh` date NOT NULL,
  `gioitinh` tinyint(1) NOT NULL DEFAULT 1,
  `phone` varchar(255) NOT NULL,
  `diachi` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `monId` int(11) NOT NULL,
  `cahocId` int(11) NOT NULL,
  `trash` int(1) NOT NULL,
  `status` int(1) NOT NULL,
  `created` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `db_hoidapcoso`
--

CREATE TABLE `db_hoidapcoso` (
  `id` int(10) NOT NULL,
  `question` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `answer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `producer_id` int(11) NOT NULL,
  `question_by` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `question_time` datetime NOT NULL,
  `answer_time` datetime DEFAULT NULL,
  `answer_by` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 4,
  `trash` int(11) DEFAULT 1,
  `status` int(11) DEFAULT 1,
  `type` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_hoidapcoso`
--

INSERT INTO `db_hoidapcoso` (`id`, `question`, `answer`, `producer_id`, `question_by`, `question_time`, `answer_time`, `answer_by`, `star`, `trash`, `status`, `type`) VALUES
(1, 'Cơ sở có bán chanh dây ko ? ', NULL, 18, 'thanh1996', '2022-06-08 15:03:13', NULL, NULL, 4, 1, 1, 1),
(2, 'Cơ sở có bán bánh dây ko ?', 'Có ạ.', 18, 'thanh1996', '2022-06-08 15:22:46', '2022-06-08 16:25:34', 'Còn gì nữa đâu', 4, 1, 1, 1),
(3, 'Cơ sở có bán dầu gió không ?', 'tÔI CÓ BÁN', 18, 'thanh1996', '2022-06-08 15:23:54', '2022-06-08 16:25:22', 'Còn gì nữa đâu', 4, 1, 1, 1),
(4, 'Cơ sở có bán ăn gió không ?\n\nNhà sản xuất chưa trả lời', 'asdasdasdasd', 18, 'thanh1996', '2022-06-08 15:24:07', '2022-06-08 16:23:10', 'Còn gì nữa đâu', 4, 1, 1, 1),
(5, 'Cơ sở có bán dầu phật linh không ?', NULL, 18, 'thanh1996', '2022-06-08 15:24:34', NULL, NULL, 4, 1, 1, 1),
(6, 'Cơ sở có cung cấp bánh bao không ? \n', NULL, 10, 'thanh1996', '2022-06-09 08:54:00', NULL, NULL, 4, 1, 1, 1),
(7, 'Cho hỏi là ...', NULL, 10, 'thanh1996', '2022-06-09 09:20:02', NULL, NULL, 4, 1, 1, 1),
(8, 'Sản phẩm có bán lẻ không ? \n', NULL, 61, 'thanh1996', '2022-06-09 14:26:00', NULL, NULL, 4, 1, 1, 2),
(9, 'Tôi muốn mua số lượng lớn .', 'Bạn để lại sdt cho mình nhé !!! hì', 61, 'thanh1996', '2022-06-09 15:35:51', '2022-06-10 09:20:36', 'Trịnh Tấn Thành', 4, 1, 1, 2),
(10, 'Sản phẩm có ship xa không ?', NULL, 62, 'thanh1996', '2022-06-10 09:42:24', NULL, NULL, 4, 1, 1, 2),
(11, 'Sản phẩm có bán lẻ không nhỉ ?', 'Có nhé bạn.', 59, 'thanh1996', '2022-06-10 09:47:23', '2022-06-10 09:47:43', 'Công ty giải trí cây đa', 4, 1, 1, 2),
(12, 'Gà', 'im mẹ mồm', 59, 'thanh1996', '2022-06-10 09:51:59', '2022-06-10 09:52:13', 'Công ty giải trí cây đa', 4, 1, 1, 2),
(13, 'Có bán lẻ không ạ ? ', 'Không', 63, 'thanh1996', '2022-06-27 10:02:38', '2022-06-27 10:02:50', 'Trịnh Tấn Thành', 4, 1, 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `db_ketnoicungcau`
--

CREATE TABLE `db_ketnoicungcau` (
  `id` int(11) NOT NULL,
  `nguoidang` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `tieude` varchar(255) CHARACTER SET utf8 NOT NULL,
  `detail` text CHARACTER SET utf8 NOT NULL,
  `catid` int(11) DEFAULT NULL,
  `ngaydang` datetime NOT NULL,
  `luotxem` int(11) NOT NULL,
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `price` varchar(255) CHARACTER SET utf8 NOT NULL,
  `hinhanh` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `type` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_ketnoicungcau`
--

INSERT INTO `db_ketnoicungcau` (`id`, `nguoidang`, `phone`, `address`, `tieude`, `detail`, `catid`, `ngaydang`, `luotxem`, `trash`, `status`, `price`, `hinhanh`, `type`) VALUES
(1, 'Chương', '0969123456', '39 Trần Hưng Đạo,Chư pưh', 'Cần mua dầu gió', 'Cần mua dầu gió', 1, '2022-06-02 11:04:48', 27, 1, 1, 'dưới 25000', '1.jpeg', 1),
(2, 'Chương', '0969123456', '39 Trần Hưng Đạo,Chư pưh', 'Cần mua dưa hấu', 'Cần mua dưa hấu', 1, '2022-06-02 11:04:48', 11, 1, 1, 'dưới 25000', '1.jpeg', 1),
(3, 'Thành', '0969123452', '39 Võ Văn Mến,Chư pưh', 'Cần mua dầu dưa gang', 'Cần mua dưa gang', 1, '2022-06-02 11:04:48', 11, 1, 1, 'dưới 25000', '2.jpeg', 2),
(4, 'Thành', '0969123459', '39 Trần Bá Đạo,Chư pưh', 'Cần mua cafe', 'Cần mua cafe', 1, '2022-06-02 11:04:48', 6, 1, 1, 'dưới 50000', '2.jpeg', 3),
(20, 'Thành', '0969124469', '39 Đào Duy Từ', 'Cần người hợp tác làm thuốc', 'Cần người hợp tác làm thuốc', 2, '2022-06-06 10:51:53', 2, 1, 1, '', 'default.png', 3),
(21, 'Thành', '0969124469', '38 đào duy từ', 'Cần mua thịt số lượng lớn', 'Cần mua thịt số lượng lớn', 3, '2022-06-06 10:56:47', 9, 1, 1, '', 'buy.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_monhoc`
--

CREATE TABLE `db_monhoc` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `db_monhoc`
--

INSERT INTO `db_monhoc` (`id`, `name`, `trash`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Piano', 1, 1, '2022-12-15 10:09:35', '2022-12-15 10:10:58'),
(2, 'Guitar', 1, 1, '2022-12-15 10:55:08', '0000-00-00 00:00:00'),
(3, 'Vẽ', 1, 1, '2022-12-15 10:55:14', '0000-00-00 00:00:00'),
(4, 'Bơi', 1, 0, '2022-12-15 10:55:35', '0000-00-00 00:00:00'),
(5, 'Đá bóng', 1, 0, '2022-12-15 10:55:44', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `db_order`
--

CREATE TABLE `db_order` (
  `id` int(11) NOT NULL,
  `orderCode` varchar(8) CHARACTER SET utf8 NOT NULL,
  `customerid` int(11) NOT NULL,
  `orderdate` datetime NOT NULL,
  `fullname` varchar(100) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(100) CHARACTER SET utf8 NOT NULL,
  `money` int(12) NOT NULL,
  `price_ship` int(11) NOT NULL,
  `coupon` int(11) NOT NULL,
  `province` int(5) NOT NULL,
  `district` int(5) NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 NOT NULL,
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `orderDes` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `productid` int(11) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_orderdetail`
--

CREATE TABLE `db_orderdetail` (
  `id` int(11) NOT NULL,
  `orderid` int(11) NOT NULL,
  `productid` int(11) NOT NULL,
  `count` int(10) NOT NULL,
  `price` int(11) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `db_producer`
--

CREATE TABLE `db_producer` (
  `id` int(10) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `code` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `trash` int(11) NOT NULL DEFAULT 1,
  `detail` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `iframe` varchar(2000) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_producer`
--

INSERT INTO `db_producer` (`id`, `name`, `code`, `img`, `created_at`, `created_by`, `modified`, `modified_by`, `status`, `trash`, `detail`, `iframe`) VALUES
(1, 'Yamaha', 'yamaha', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:37:39', 1, 1, 1, '<p><strong>Chư Đang Ya</strong>&nbsp;(c&ograve;n được viết l&agrave;&nbsp;<strong>Chư Đăng Ya</strong>) l&agrave; một&nbsp;<a href=\"https://vi.wikipedia.org/wiki/X%C3%A3_(Vi%E1%BB%87t_Nam)\">x&atilde;</a>&nbsp;thuộc huyện&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Ch%C6%B0_P%C4%83h\">Chư Păh</a>, tỉnh&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Gia_Lai\">Gia Lai</a>,&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Vi%E1%BB%87t_Nam\">Việt Nam</a>.</p>\r\n\r\n<h2>Địa l&yacute;</h2>\r\n\r\n<p>X&atilde; Chư Đang Ya nằm ở ph&iacute;a nam huyện&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Ch%C6%B0_P%C4%83h\">Chư Păh</a>, c&oacute; vị tr&iacute; địa l&yacute;:</p>\r\n\r\n<ul>\r\n	<li>Ph&iacute;a đ&ocirc;ng gi&aacute;p huyện&nbsp;<a href=\"https://vi.wikipedia.org/wiki/%C4%90ak_%C4%90oa\">Đak Đoa</a></li>\r\n	<li>Ph&iacute;a t&acirc;y gi&aacute;p x&atilde;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Ngh%C4%A9a_H%C6%B0ng,_Ch%C6%B0_P%C4%83h\">Nghĩa Hưng</a></li>\r\n	<li>Ph&iacute;a nam gi&aacute;p th&agrave;nh phố&nbsp;<a href=\"https://vi.wikipedia.org/wiki/Pleiku\">Pleiku</a>&nbsp;v&agrave; huyện Đak Đoa</li>\r\n	<li>Ph&iacute;a bắc gi&aacute;p x&atilde;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/%C4%90%C4%83k_T%C6%A1_Ver\">Đăk Tơ Ver</a>&nbsp;v&agrave; x&atilde;&nbsp;<a href=\"https://vi.wikipedia.org/wiki/H%C3%B2a_Ph%C3%BA,_Ch%C6%B0_P%C4%83h\">H&ograve;a Ph&uacute;</a>.</li>\r\n</ul>\r\n\r\n<p>X&atilde; Chư Đang Ya c&oacute; diện t&iacute;ch 54,19&nbsp;km&sup2;, d&acirc;n số năm 2019 l&agrave; 3.578 người, mật độ d&acirc;n số đạt 66 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124125.99329901286!2d108.01171741537772!3d13.53943835605775!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7ee3efa9a14f%3A0x7c4aa5937bd75168!2zTmjGoW4gSMOyYSwgaC4gQ2jGsCBTw6osIEdpYSBMYWk!5e0!3m2!1svi!2s!4v1652773679453!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(2, 'Roland', 'roland', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:38:01', 1, 1, 1, '<p>Chư Don l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Chư Don c&oacute; diện t&iacute;ch 38,90 km&sup2;, d&acirc;n số năm 2008 l&agrave; 1.840 người,mật độ d&acirc;n số đạt 47 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62062.996086594045!2d108.01981290774307!3d13.539440514109055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7f5c31acd279%3A0xf19887a8d522f3c2!2zQ2jGsCBEb24sIENoxrAgUMawaCwgR2lhIExhaQ!5e0!3m2!1svi!2s!4v1652773919303!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(3, 'Casio', 'casio', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:38:39', 1, 1, 1, '<p>X&atilde; Ia Dreng c&oacute; vị tr&iacute; địa l&yacute;: Ph&iacute;a Đ&ocirc;ng gi&aacute;p x&atilde; Ia Hr&uacute; Ph&iacute;a T&acirc;y gi&aacute;p x&atilde; Ia HLốp v&agrave; x&atilde; Ia Ko Ph&iacute;a Nam gi&aacute;p thị trấn Nhơn H&ograve;a Ph&iacute;a Bắc gi&aacute;p x&atilde; Ia Blang v&agrave; x&atilde; Ia HLốp. X&atilde; Ia Dreng c&oacute; diện t&iacute;ch 23,52 km&sup2;, d&acirc;n số năm 2000 l&agrave; 2.486 người,mật độ d&acirc;n số đạt 106 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62047.64012781074!2d108.03864518194037!3d13.598185981068074!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7fdd3c387103%3A0xe08f16cdbe575100!2zSWEgRHJlbmcsIENoxrAgUMawaCwgR2lhIExhaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1652774014862!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(4, 'Kawai', 'kawai', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:38:52', 1, 1, 1, '<p>Ia Hla l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Hla c&oacute; diện t&iacute;ch 124,47 km&sup2;, d&acirc;n số năm 2005 l&agrave; 2.283 người, mật độ d&acirc;n số đạt 18 người/km&sup2;</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124122.67837580746!2d107.91307426154799!3d13.54579114608469!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316dd438d3f6817f%3A0xd2ab814d43541333!2zSWEgSGxhLCBDaMawIFDGsGgsIEdpYSBMYWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1652774064449!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(5, 'Taylor', 'taylor', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:39:16', 1, 1, 1, '<p>Ia Hr&uacute; l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Hr&uacute; c&oacute; diện t&iacute;ch 39,51 km&sup2;, d&acirc;n số năm 1999 l&agrave; 7.199 người, mật độ d&acirc;n số đạt 182 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124097.79923402368!2d108.06338686206651!3d13.593377080990042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7e2e12abc327%3A0xfc69c4d8fdd3f498!2zSWEgSHLDuiwgQ2jGsCBQxrBoLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774114129!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(6, 'Fender', 'fender', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:39:21', 1, 1, 1, '<p>Ia Le l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Le c&oacute; diện t&iacute;ch 124,57 km&sup2;, d&acirc;n số năm 2006 l&agrave; 7.195 người, mật độ d&acirc;n số đạt 58 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d248353.20351929936!2d107.93340751550471!3d13.442085379598138!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e784bee46f5db%3A0x9a12d80d2d59d100!2zSWEgTGUsIGguIENoxrAgU8OqLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774154781!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(7, 'Takamine', 'takamine', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:39:34', 1, 1, 1, '<p>Ia Phang l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Phang c&oacute; diện t&iacute;ch 127,11 km&sup2;, d&acirc;n số năm 2000 l&agrave; 5.214 người,mật độ d&acirc;n số đạt 41 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124144.75575540008!2d108.07812826108834!3d13.503426303962975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7bfca516a9f9%3A0xae02bbf9d8311a8f!2zSWEgUGhhbmcsIGguIENoxrAgU8OqLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774196597!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(8, 'Suzuki', 'suzuki', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:39:40', 1, 1, 1, '<p>Ia Rong l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Rong c&oacute; diện t&iacute;ch 23,11 km&sup2;, d&acirc;n số năm 1999 l&agrave; 4.518 người, mật độ d&acirc;n số đạt 195 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7755.312880263414!2d108.10740537442625!3d13.617782811736904!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e809095534abd%3A0x247ba1ae497e629c!2zSWEgUm9uZywgSWEgSHLDuiwgQ2jGsCBQxrBoLCBHaWEgTGFp!5e0!3m2!1svi!2s!4v1652772954399!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(9, 'Boston', 'boston', '1.png', '2022-04-22 16:08:31', 4, '2022-12-09 10:39:54', 1, 1, 1, '<p>Ia BLứ l&agrave; một x&atilde; thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam. X&atilde; Ia Blứ c&oacute; diện t&iacute;ch 191,15 km&sup2;, d&acirc;n số năm 2006 l&agrave; 4.688 người,mật độ d&acirc;n số đạt 25 người/km&sup2;.</p>\r\n', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124170.66848639994!2d107.98653855820312!3d13.453534700000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e780cd487fb61%3A0x3b76a5074e67c882!2zVeG7tyBCYW4gTmjDom4gRMOibiBJYSBCIEzhu6k!5e0!3m2!1svi!2s!4v1652774243964!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(11, 'Korc', 'korc', '1.png', '2022-12-09 16:36:49', 1, '2022-12-09 16:36:49', 1, 1, 1, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `db_product`
--

CREATE TABLE `db_product` (
  `id` int(11) NOT NULL,
  `catid` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL,
  `sortDesc` text CHARACTER SET utf8 NOT NULL,
  `detail` text CHARACTER SET utf8 NOT NULL,
  `producer` int(11) NOT NULL,
  `number` int(11) NOT NULL,
  `number_buy` int(11) NOT NULL,
  `sale` int(3) DEFAULT NULL,
  `price` int(11) NOT NULL,
  `price_sale` int(11) NOT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT 'HDL',
  `modified` datetime NOT NULL,
  `modified_by` varchar(100) CHARACTER SET utf8 NOT NULL DEFAULT 'HDL',
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `userId` int(11) DEFAULT NULL,
  `img2` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img3` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `img4` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `is_hot` int(11) NOT NULL DEFAULT 0,
  `star` double NOT NULL DEFAULT 4
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_product`
--

INSERT INTO `db_product` (`id`, `catid`, `name`, `alias`, `avatar`, `img`, `sortDesc`, `detail`, `producer`, `number`, `number_buy`, `sale`, `price`, `price_sale`, `created`, `created_by`, `modified`, `modified_by`, `trash`, `status`, `userId`, `img2`, `img3`, `img4`, `is_hot`, `star`) VALUES
(64, 1, 'Yamaha YDP 141', 'yamaha-ydp-141', '1af6a9533345ae5c60116a207e167d3f.png', 'fb02e42968dbe9cb94394c7922d09d5f.png', 'Yamaha YDP 141', '<h1><strong>GIỚI THIỆU Đ&Agrave;N PIANO YAMAHA YDP141</strong></h1>\r\n\r\n<p><strong>Đ&agrave;n piano điện Yamaha YDP 141</strong>&nbsp;sở hữu c&ocirc;ng nghệ Tối ưu h&oacute;a &acirc;m thanh (PureCF Sound Engine )l&agrave; một c&ocirc;ng nghệ mới, độc đ&aacute;o của Yamaha. Đ&agrave;n Piano điện Yamaha YDP141 l&agrave; model cao cấp của Yamaha được ra mắt năm 2010, sử dụng một thiết kế đặc biệt c&ugrave;ng với vị tr&iacute; nằm trong nhạc cụ, gi&uacute;p kiểm so&aacute;t được &acirc;m thanh v&agrave; l&agrave;m phong ph&uacute; hỡn nữa. N&oacute; sẽ mang lại hiệu quả đ&aacute;ng kinh ngạc.</p>\r\n\r\n<p><img alt=\"Yamaha ydp141 st music\" src=\"https://bizweb.dktcdn.net/thumb/grande/100/442/439/files/yamaha-ydp140-stmusic.png?v=1643018795585\" /></p>\r\n\r\n<p><strong>Đ&agrave;n piano điện Yamaha YDP-141</strong>&nbsp;thế hệ mới mang đến cho bạn sự trải nghiệm &acirc;m thanh ch&acirc;n thực như một chiếc piano acoutic. Thiết kế gọn g&agrave;ng năng động kh&ocirc;ng k&eacute;m phần sang trọng chắc chắn sẽ l&agrave;m cho kh&ocirc;ng gian nh&agrave; bạn th&ecirc;m điểm nhấn đẹp.&nbsp;<a href=\"https://stmusic.vn/piano-yamaha-ydp-141\">Yamaha YDP 141</a>&nbsp;mang đến cho người chơi một cảm gi&aacute;c th&uacute; vị với b&agrave;n ph&iacute;m GHS biểu cảm, với &acirc;m thanh 6 loại nhạc cụ kh&aacute;c nhau, chức năng chơi 2 loại nhạc cụ kh&aacute;c nhau trong c&ugrave;ng một l&uacute;c. Đ&acirc;y l&agrave; chiếc đ&agrave;n piano điện ho&agrave;n hảo cho cả sinh vi&ecirc;n mới học piano v&agrave; người gi&agrave;u kinh nghiệm chơi piano.</p>\r\n\r\n<p><img alt=\"piano điện Yamaha YDP 141\" src=\"https://bizweb.dktcdn.net/thumb/grande/100/442/439/files/yamaha-ydp141-st-music-1.jpg?v=1653374354792\" /></p>\r\n\r\n<p>B&agrave;n ph&iacute;m thế hệ mới GHS (Graded Hammer Standard). &nbsp;x&acirc;y dựng tr&ecirc;n kỹ thuật ng&oacute;n bấm hợp l&yacute; cho sự chuyển tiếp dễ d&agrave;ng, c&oacute; thể nặng hơn ở những nốt trầm v&agrave; nhẹ hơn ở những nốt cao. Ngo&agrave;i ra n&oacute; c&ograve;n c&oacute; 3 mức độ nậng nhẹ t&ugrave;y v&agrave;o c&aacute;ch chơi của mỗi người.</p>\r\n\r\n<p><img alt=\"piano điện Yamaha YDP 141\" src=\"https://bizweb.dktcdn.net/thumb/grande/100/442/439/files/yamaha-ydp141-st-music-4.jpg?v=1653374373700\" /></p>\r\n\r\n<p>Nh&igrave;n chung, đ&acirc;y l&agrave; c&acirc;y đ&agrave;n piano điện c&oacute; thiết kế đẹp ph&ugrave; hợp với bất kỳ đồ trang tr&iacute; nh&agrave; n&agrave;o,&nbsp;<a href=\"https://stmusic.vn/piano-yamaha-ydp-141\"><strong>Yamaha YDP 141</strong>&nbsp;</a>l&agrave; một lựa chọn tuyệt vời ph&ugrave; hợp với mọi kh&ocirc;ng gian.</p>\r\n\r\n<p><strong>Th&ocirc;ng số kỹ thuật:</strong></p>\r\n\r\n<ul>\r\n	<li>\r\n	<p>K&iacute;ch thước: D&agrave;i: 135.7cm, Cao: 82.2cm, Ngang: 42.0cm</p>\r\n	</li>\r\n	<li>\r\n	<p>Trọng lượng: 37kg</p>\r\n	</li>\r\n	<li>\r\n	<p>Số lượng ph&iacute;m: 88</p>\r\n	</li>\r\n	<li>\r\n	<p>Loại ph&iacute;m: (GHS) Keyboard</p>\r\n	</li>\r\n	<li>\r\n	<p>Chế độ ph&iacute;m: Hard/Medium/Soft/Fixed</p>\r\n	</li>\r\n	<li>\r\n	<p>Số pedal: 3</p>\r\n	</li>\r\n	<li>\r\n	<p>Số lượng tiếng: 6</p>\r\n	</li>\r\n	<li>\r\n	<p>B&agrave;i h&aacute;t: 50</p>\r\n	</li>\r\n	<li>\r\n	<p>Bản ghi &acirc;m: 2</p>\r\n	</li>\r\n	<li>\r\n	<p>Chức năng ghi &acirc;m.</p>\r\n	</li>\r\n	<li>\r\n	<p>Metronome: M&aacute;y g&otilde; nhịp</p>\r\n	</li>\r\n	<li>\r\n	<p>Tempo: Tốc độ (32 &ndash; 280)</p>\r\n	</li>\r\n	<li>\r\n	<p>Chỉnh Tone: (-6 to 0, 0 to +6)</p>\r\n	</li>\r\n	<li>\r\n	<p>Tai nghe: 2 cổng 6 li</p>\r\n	</li>\r\n	<li>\r\n	<p>MIDI: In/Out</p>\r\n	</li>\r\n	<li>\r\n	<p>C&ocirc;ng suất loa: 6W x 2</p>\r\n	</li>\r\n	<li>\r\n	<p>Loa: (12cm x 6cm) x 2</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><strong>VIDEO DEMO &Acirc;M THANH PIANO YAMAHA YDP141</strong></h2>\r\n\r\n<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/JTaT4T157Ws\" title=\"YouTube video player\" width=\"560\"></iframe></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href=\"https://stmusic.vn/piano-dien-yamaha\">Xem th&ecirc;m c&aacute;c mẫu đ&agrave;n Piano Điện Yamaha tại đ&acirc;y!&nbsp;</a></p>\r\n\r\n<p><strong>Vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để được tư vấn cụ thể theo nhu cầu của qu&yacute; kh&aacute;ch</strong>!&nbsp;</p>\r\n\r\n<p><strong>Website</strong>:&nbsp;<a href=\"https://stmusic.vn/?fbclid=IwAR2qy1UFwco4gHTu1PCpQV2CijVxQNA-pQqXPPjQ5QsSru4P42gCq7m3B1U\" target=\"_blank\">https://stmusic.vn/</a></p>\r\n\r\n<p><strong>Page facebook:</strong>&nbsp;&nbsp;<a href=\"https://www.facebook.com/PianoSTMusic/\">https://www.facebook.com/PianoSTMusic/</a></p>\r\n\r\n<p><strong>Hotline/Zalo</strong>&nbsp;:&nbsp;0972 176 841 (Trần Sỹ)</p>\r\n\r\n<p><strong>&nbsp;Khiếu nại - Bảo h&agrave;nh</strong>:&nbsp;0972 176 841</p>\r\n\r\n<p>&nbsp;<strong>Gmail</strong>:&nbsp;tranpiano2206@gmail.com</p>\r\n\r\n<p><strong>Thời gian phục vụ</strong>:&nbsp;8h-22h</p>\r\n', 1, 1, 0, 0, 13000000, 13000000, '2022-12-09 15:25:05', '1', '2022-12-09 15:25:05', '1', 1, 1, 20, 'a0ba2a41b8cec276cfd6c7ef44e65f47.png', '7d1532b2e1e95bf2e17cc4dcccd690e8.png', '', 0, 4),
(65, 1, 'YAMAHA YDP 163R', 'yamaha-ydp-163r', 'ae1d1ea52bccdd7cf25a1c4cc1f1063d.png', 'f2ed3c15beeaa363eef3b0dbbdfe40b8.png', 'Yamaha YDP 163 là một cây Piano điện có khả năng sao chép cảm ứng và âm thanh của một cây Piano thực, trong khi Keyboard tạo ra được dùng để mô phỏng âm thanh. Đàn Piano điện Yamaha YDP 163 với công nghệ phân loại phím hiện đại từ Yamaha và 88 phím ngà thấm mồ hôi rất tốt', '<p>Th&ocirc;ng tin chi tiết</p>\r\n\r\n<p><a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Đ&Agrave;N PIANO YAMAHA YDP 163</a></p>\r\n\r\n<p>=========================</p>\r\n\r\n<p><a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Yamaha YDP 163R&nbsp;</a>l&agrave; một c&acirc;y Piano điện c&oacute; khả năng&nbsp;sao ch&eacute;p cảm ứng v&agrave; &acirc;m thanh của một c&acirc;y Piano thực, trong khi Keyboard tạo ra được d&ugrave;ng để m&ocirc; phỏng &acirc;m thanh. Đ&agrave;n Piano điện Yamaha YDP 163 với c&ocirc;ng nghệ ph&acirc;n loại ph&iacute;m hiện đại từ Yamaha v&agrave;&nbsp;88 ph&iacute;m ng&agrave; thấm mồ h&ocirc;i rất tốt</p>\r\n\r\n<p>M&ocirc; tả đ&agrave;n piano điện&nbsp;<a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Yamaha YDP 163R</a>:&nbsp;</p>\r\n\r\n<p>&nbsp;-L&agrave; một trong 2 model&nbsp;đ&agrave;n Piano điện Arius&nbsp;mới nhất của&nbsp;<a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Yamaha&nbsp;YDP 163R</a>&nbsp;với c&ocirc;ng nghệ ph&acirc;n loại b&agrave;n ph&iacute;m GH3, 88 ph&iacute;m ng&agrave; c&oacute; khả năng thấm mồ h&ocirc;i tốt, t&iacute;nh năng nổi bật hơn YDP 162 &gt;&gt;&nbsp;<a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">&nbsp;Yamaha YDP 163R</a>&nbsp;đang l&agrave; t&acirc;m điểm ch&uacute; &yacute; của nhiều người v&agrave; cho người chơi cảm gi&aacute;c như đang được chơi tr&ecirc;n c&acirc;y đ&agrave;n piano tốt nhất trong lịch sử. Ngo&agrave;i YDP 163, &nbsp;YDP-143&nbsp;cũng l&agrave; c&acirc;y đ&agrave;n Piano điện mới được Yamaha tung ra lần n&agrave;y.&nbsp;</p>\r\n\r\n<p>Với chiều cao 849mm, chiều rộng 1,3m v&agrave; chiều s&acirc;u 422mm, Piano điện&nbsp;<a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Yamaha YDP 163R</a>&nbsp;l&agrave; c&acirc;y đ&agrave;n c&oacute; thiết kế cao hơn so với những model Piano điện Arius trước đ&acirc;y. Kh&ocirc;ng chỉ c&oacute; k&iacute;ch thước lớn hơn, YDP163 c&ograve;n cho bạn một c&aacute;i nh&igrave;n tổng quan giống với Piano cơ (upright Piano) &nbsp;nhiều hơn, hơn cả đ&agrave;n YDP-162.</p>\r\n\r\n<p>a<img alt=\"YAMAHA YDP 163 R\" src=\"https://danpianohoangphuc.com/images/uploads/yamaha-ydp-163%20(1).jpg\" /></p>\r\n\r\n<h2><strong>Th&ocirc;ng Tin Kỹ Thuật&nbsp;<a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">Đ&agrave;n Yamaha YDP 163R</a></strong></h2>\r\n\r\n<table border=\"1\" cellpadding=\"1\" cellspacing=\"1\">\r\n	<tbody>\r\n		<tr>\r\n			<td>H&atilde;ng sản xuất</td>\r\n			<td>Yamaha</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Model</td>\r\n			<td><a href=\"https://danpianohoangphuc.com/yamaha-ydp-163-r.html\">YDP 163</a></td>\r\n		</tr>\r\n		<tr>\r\n			<td>k&iacute;ch thước</td>\r\n			<td>1357 x 422 x 849(mm)</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Trọng lượng</td>\r\n			<td>42kg</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Pedal</td>\r\n			<td>3 pedal</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số tiếng</td>\r\n			<td>10 tiếng</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Xuất sứ</td>\r\n			<td>Japan</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Amply</td>\r\n			<td>20W x 2</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Số lượng b&agrave;i h&aacute;t c&agrave;i sẵn</td>\r\n			<td>10 b&agrave;i demo, 50 b&agrave;i piano&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>Điện thế</td>\r\n			<td>220V</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n\r\n<h2><strong>Ch&iacute;nh s&aacute;ch Mua đ&agrave;n tại Piano Ho&agrave;ng ph&uacute;c</strong></h2>\r\n\r\n<ol>\r\n	<li>\r\n	<h3><strong>Bảo h&agrave;nh Sản phẩm</strong></h3>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Đ&agrave;n Được bảo h&agrave;nh 12 th&aacute;ng</li>\r\n</ul>\r\n\r\n<ol start=\"2\">\r\n	<li>\r\n	<h3><strong>Vận Chuyển</strong></h3>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Miễn ph&iacute; Vận Chuyển Nội Th&agrave;nh HCM</li>\r\n	<li>Ship ngoại th&agrave;nh(Tư Vấn )</li>\r\n</ul>\r\n\r\n<ol start=\"3\">\r\n	<li>\r\n	<h3><strong>Tặng K&egrave;m</strong></h3>\r\n	</li>\r\n</ol>\r\n\r\n<ul>\r\n	<li>Ghế zin Nhật</li>\r\n	<li>Khăn Phủ Ph&iacute;m.</li>\r\n	<li>Voucher Spa &nbsp;Piano miễn ph&iacute; 1 lần.</li>\r\n</ul>\r\n\r\n<h2><strong>Video Review Đ&agrave;n&nbsp;Yamaha YDP 163</strong></h2>\r\n\r\n<p><iframe frameborder=\"0\" height=\"360\" src=\"https://www.youtube.com/embed/UmE5YCknYqU\" width=\"640\"></iframe></p>\r\n\r\n<h2><strong>ĐỊA CHỈ MUA Đ&Agrave;N UY T&Iacute;N, CHẤT LƯỢNG.</strong></h2>\r\n\r\n<p>Tempo Academy chuy&ecirc;n cung cấp Nhạc cụ Uy T&iacute;n, Chất Lượng.</p>\r\n\r\n<p>- Hotline: 097 919 03 03</p>\r\n\r\n<p>- Fanpage:&nbsp;<a href=\"https://www.facebook.com/nhacuhoangphuc\">https://www.facebook.com/tempogialai</a><br />\r\n- Địa chỉ: Pleiku, Gia Lai</p>\r\n', 1, 1, 0, 0, 20000000, 20000000, '2022-12-09 15:34:40', '1', '2022-12-09 15:34:40', '1', 1, 1, 20, '5fb1beb22043e7754033573e7f88ea68.png', '', NULL, 0, 4),
(66, 1, 'Yamaha CLP 545WA', 'yamaha-clp-545wa', '41464207dac32a0a1a53483b35f236f7.png', '', 'THÔNG TIN SƠ LƯỢC\r\nKích thước: 146 x 93 x 46 (cm)\r\nTrọng lượng: 61 Kg\r\nMàu sắc: WA ( trắng ngà)\r\nBàn phím: 88 - công nghệ: GH3X\r\nPedal: 3\r\nNăm SX: 2014\r\nXuất xứ: Japan\r\nHỗ trợ trả góp\r\nBảo hành: 2 năm, miễn phí vận chuyển.\r\nKích thước: 146 x 93 x 46 (cm)\r\nTrọng lượng: 61 Kg\r\nMàu sắc: WA ( trắng ngà)\r\nBàn phím: 88 - công nghệ: GH3X\r\nPedal: 3\r\nNăm SX: 2014\r\nXuất xứ: Japan\r\nHỗ trợ trả góp\r\nBảo hành: 2 năm, miễn phí vận chuyển.', '<p><em><strong>Đ&agrave;n piano điện YAMAHA CLP 545&nbsp;l&agrave; sự lựa chọn ho&agrave;n hảo d&agrave;nh cho bạn khi trang bị nhiều t&iacute;nh năng cao cấp v&agrave; cải tiến về &acirc;m thanh cũng như mang lại trải nghiệm chơi tuyệt vời. Clavinova CLP 545 c&oacute; thiết kế cứng c&aacute;p, sang trọng sẽ l&agrave; một m&oacute;n đồ trang tr&iacute; tuyệt đẹp trong căn ph&ograve;ng của bạn. Lớp sơn ho&agrave;n thiện c&ugrave;ng loại được sử dụng tr&ecirc;n những c&acirc;y đ&agrave;n Grand piano c&oacute; khả năng chống trầy xước cũng như ảnh hưởng từ m&ocirc;i trường xung quanh.</strong></em></p>\r\n\r\n<p><em><strong>Nếu bạn đang t&igrave;m kiếm một c&acirc;y&nbsp;đ&agrave;n piano kỹ thuật số h&agrave;ng đầu, Yamaha Clavinova CLP 545 l&agrave; sự lựa chọn ho&agrave;n hảo.</strong></em></p>\r\n\r\n<p><img src=\"https://bizweb.dktcdn.net/100/305/263/files/piano-dien-yamaha-clp545wa-tphcm.jpg?v=1637999991831\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<h2><strong>&Acirc;m thanh v&agrave; trải nghiệm tuyệt vời</strong></h2>\r\n\r\n<p>C&aacute;c c&acirc;y đ&agrave;n Yamaha Clavinova đều được trang bị c&ocirc;ng nghệ Real Grand Expression ti&ecirc;n tiến nhất của Yamaha. Việc t&iacute;ch hợp ho&agrave;n hảo cả &acirc;m thanh, b&agrave;n ph&iacute;m, b&agrave;n đạp để tạo cảm gi&aacute;c ch&acirc;n thực tuyệt đỉnh như một c&acirc;y đ&agrave;n đại dương cầm thực thụ. Yamaha đ&atilde; thực sự tỉ mỉ khi lấy &acirc;m thanh mẫu của Clavinova CLP-545 từ những c&acirc;y đ&agrave;n Grand tốt nhất thế giới.</p>\r\n\r\n<p><img alt=\"Âm thanh Real Grand Expression\" src=\"https://file.hstatic.net/1000342432/file/yamaha-real-grand-expression_53899eb8c9574627a05575228895eca9_grande.jpg\" /></p>\r\n\r\n<h2><strong>Khả năng chơi ch&acirc;n thực của Piano Yamaha CLP 545WA</strong></h2>\r\n\r\n<p>Yamaha CLP-545 sử dụng b&agrave;n ph&iacute;m NWX (Natural Wood X) với c&aacute;c ph&iacute;m ng&agrave; tổng hợp, bạn cảm nhận được khả năng chơi ch&acirc;n thực vượt trội giống như bạn đang chơi tr&ecirc;n những c&acirc;y đ&agrave;n Grand piano Yamaha CFX v&agrave; B&ouml;sendorfer Imperial. Yamaha đ&atilde; hiệu chỉnh phần khung của CLP 545 để tạo ra sự cộng hưởng ho&agrave;n hảo, nhờ đ&oacute; &acirc;m thanh v&ocirc; c&ugrave;ng tự nhi&ecirc;n d&ugrave; ở bất kỳ &acirc;m lượng n&agrave;o. B&agrave;n ph&iacute;m Natural Wood X ti&ecirc;n tiến nhất của Yamaha t&aacute;i tạo một c&aacute;ch trung thực cảm ứng b&agrave;n ph&iacute;m của đ&agrave;n piano acoustic từ cảm gi&aacute;c ph&iacute;m nặng ở &acirc;m vực trầm đến cảm gi&aacute;c ph&iacute;m nhẹ ở &acirc;m vực cao hơn. CLP 545 c&ograve;n trang bị một hệ thống ba cảm biến độc đ&aacute;o, gi&uacute;p cảm nhận v&agrave; diễn tả &acirc;m thanh ch&iacute;nh x&aacute;c m&agrave; người chơi mong muốn.</p>\r\n\r\n<h2><strong>B&agrave;n ph&iacute;m cao cấp</strong></h2>\r\n\r\n<p>B&agrave;n ph&iacute;m ng&agrave; của Clavinova CLP 545 c&oacute; bề mặt mềm, hơi rỗng tạo cho ph&iacute;m th&ecirc;m b&aacute;m chặt v&agrave; ma s&aacute;t tự nhi&ecirc;n để mang lại cảm gi&aacute;c dễ chơi, đặc biệt l&agrave; trong c&aacute;c phần thể hiện d&agrave;i hay c&aacute;c b&agrave;i chơi thực h&agrave;nh. Kết cấu mịn v&agrave; tinh tế của ph&iacute;m cho cảm gi&aacute;c sang trọng v&agrave; dễ lau ch&ugrave;i.</p>\r\n\r\n<p><img src=\"https://bizweb.dktcdn.net/100/305/263/products/piano-yamaha-clp545wa-chinh-hang-nhap-khau.jpg?v=1625987659987\" style=\"height:375px; width:500px\" /></p>\r\n\r\n<h2><strong>Chức năng ghi &acirc;m v&agrave; kết nối USB</strong></h2>\r\n\r\n<p>Yamaha CLP 545 t&iacute;ch hợp t&iacute;nh năng ghi &acirc;m, cho ph&eacute;p bạn ghi v&agrave; ph&aacute;t lại m&agrave;n tr&igrave;nh diễn của m&igrave;nh. Với kết nối MIDI-USB bạn c&oacute; thể sao c&aacute;c ch&eacute;p bản ghi v&agrave;o m&aacute;y t&iacute;nh để ph&aacute;t lại hoặc thậm ch&iacute; đồng bộ tr&ecirc;n c&aacute;c thiết bị nghe nhạc di động kh&aacute;c nữa.</p>\r\n\r\n<p>CLP545 được sản xuất năm 2014, l&agrave; model được &aacute;p dụng nhiều c&ocirc;ng nghệ hiện đại nhất hiện nay. Nếu qu&yacute; kh&aacute;ch h&agrave;ng đang c&oacute; nhu cầu sở hữu một c&acirc;y&nbsp;đ&agrave;n piano điện&nbsp;với ưu việt về chất lượng &acirc;m thanh v&agrave; kiểu d&aacute;ng thiết kế th&igrave; Yamaha CLP 545 l&agrave; một trong những sản phẩm rất đ&aacute;ng quan t&acirc;m v&agrave; lựa chọn.</p>\r\n\r\n<h2><strong>Th&ocirc;ng số kỹ thuật</strong></h2>\r\n\r\n<ul>\r\n	<li>M&atilde; sản phẩm:&nbsp;CLP 545 WA</li>\r\n	<li>T&igrave;nh trạng:&nbsp;Used</li>\r\n	<li>Kho:&nbsp;C&ograve;n h&agrave;ng</li>\r\n	<li>Thương hiệu:&nbsp;Yamaha</li>\r\n	<li>&Acirc;m thanh:&nbsp;Piano CFX v&agrave; B&ouml;sendorfer</li>\r\n	<li>Touch:&nbsp;Hard 2, Hard 1, Medium, Soft 1, Soft 2, Fixed</li>\r\n	<li>B&agrave;n ph&iacute;m:&nbsp;Graded Hammer 3X (GH3X) - Lực ph&iacute;m grand piano</li>\r\n	<li>Chất liệu ph&iacute;m:&nbsp;Natural Wood X (NWX), ph&iacute;m gỗ cao cấp.</li>\r\n	<li>K&iacute;ch thước:&nbsp;Rộng x Cao x S&acirc;u &quot; 146 x 93 x 46 (cm)</li>\r\n	<li>Trọng lượng:&nbsp;61.5kg</li>\r\n	<li>Pedal:&nbsp;3 Effect, Sostenuto, Soft với độ nhạy 2 tầng tương đương piano cơ</li>\r\n	<li>M&agrave;u:&nbsp;Đen b&oacute;ng, Đen nh&aacute;m, Đỏ đ&ocirc;, V&agrave;ng Cam, Trắng.</li>\r\n	<li>Polyphony:&nbsp;256-note ( độ ph&acirc;n giải cao)</li>\r\n	<li>Acoustic Optiomizer:C&ocirc;ng nghệ lấy mẫu từng nốt piano cơ theo từng bậc mạnh nhẹ, độc quyền YamahaYamaha</li>\r\n	<li>Key-Off samples:&nbsp;&acirc;m thanh nhất ph&iacute;m piano cơ</li>\r\n	<li>Intelligent Acoustic Control (IAC):&nbsp;t&iacute;nh năng gi&uacute;p &acirc;m thanh bass trebb vẫn r&otilde; r&agrave;ng khi nghe &acirc;m lượng rất nhỏ</li>\r\n	<li>&Acirc;m thanh Model CLP 545 lấy mẫu từ 2 model đ&agrave;n Piano Grand Yamaha CFX, B&ouml;sendorfer Imperial l&agrave; d&ograve;ng Grand Piano Concert cao cấp nhất thế giới hiện nay.</li>\r\n	<li>Hệ ph&iacute;m gỗ với lực tương đương Piano Cơ, kết hợp c&ugrave;ng Pedal độ nhạy 2 tầng gi&uacute;p tối ưu c&ugrave;ng hệ tiếng Grand Piano cho cảm gi&aacute;c biểu diễn ch&acirc;n thật nhất.</li>\r\n</ul>\r\n\r\n<h2><strong>&nbsp;Review&nbsp;Yamaha CLP545 WA</strong></h2>\r\n\r\n<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/qTPsnVE96UU\" title=\"YouTube video player\" width=\"560\"></iframe></p>\r\n', 1, 1, 0, 0, 28000000, 28000000, '2022-12-09 15:53:01', '1', '2022-12-09 15:54:12', '1', 1, 1, 20, '67603d55f534ff1abb787dea2df93215.png', 'cd438506acefeffe04c72842130b6093.png', '8000031316da60a484c8042b5f1637fb.png', 0, 4),
(67, 1, 'Yamaha DGP1', 'yamaha-dgp1', '37876fc6e53757955a96eac981f8ac5a.png', '5ab7d8483c14864215fa5ee607cfc5f2.png', 'Mã sản phẩm : Yamaha DGP1\r\nThương hiệu: Nhật Bản\r\nTình trạng : 95%\r\nBảo hành : 12 tháng\r\nQuà tặng:\r\n- Ghế piano bọc da\r\n- Khăn phủ phím Piano\r\n- Giáo trình Piano cơ bản\r\n- Vận chuyển miễn phí nội thành Pleiku', '<h1><strong>GIỚI THIỆU Đ&Agrave;N PIANO YAMAHA DGP1</strong></h1>\r\n\r\n<p>Piano điện&nbsp;<a href=\"https://stmusic.vn/piano-yamaha-dgp1\" target=\"_blank\">Yamaha DGP1</a>&nbsp;l&agrave; đ&agrave;n piano điện tử c&oacute; thiết kế 3 ch&acirc;n m&ocirc; phỏng theo đ&agrave;n Grand Piano sang trọng, v&agrave; ch&iacute;nh v&igrave; điều đ&oacute;, điểm đặc biệt của n&oacute; l&agrave; c&oacute; cấu tạo giống hệt c&acirc;y&nbsp;piano acoustic, cũng c&oacute; b&uacute;a v&agrave; b&agrave;n ph&iacute;m l&agrave;m bằng gỗ, n&ecirc;n người chơi sẽ c&oacute; cảm gi&aacute;c giống như đang chơi ở c&acirc;y đ&agrave;n piano cơ thứ thiệt.</p>\r\n\r\n<p>Tuy nhi&ecirc;n &acirc;m thanh kh&ocirc;ng ph&aacute;t ra từ d&acirc;y đ&agrave;n m&agrave; ph&aacute;t ra từ một bộ phận điện tử. N&ecirc;n ch&uacute;ng ta c&oacute; thể gọi DPG1 l&agrave;&nbsp;<a href=\"https://stmusic.vn/piano-dien-gia-co\">đ&agrave;n piano giả cơ</a>.</p>\r\n\r\n<p><strong><img alt=\"Đàn Piano Yamaha DGP1\" src=\"https://bizweb.dktcdn.net/thumb/grande/100/442/439/files/z3355362959794-8c3bf0be9b3c3c9bb2d440b3b0279bf1.jpg?v=1650510357228\" /></strong></p>\r\n\r\n<h2><strong>Đặc điểm nổi bật của Đ&agrave;n Piano Yamaha DGP1</strong></h2>\r\n\r\n<ul>\r\n	<li>\r\n	<p>&ldquo;&Acirc;m thanh v&agrave; cảm ứng&rdquo; của một c&acirc;y đại dương cầm, ti&ecirc;u chuẩn của d&ograve;ng DGP.</p>\r\n	</li>\r\n	<li>\r\n	<p>Một &acirc;m thanh mới được tạo một c&aacute;ch cẩn thận từ một chiếc đại dương cầm h&ograve;a nhạc đầy đủ.</p>\r\n	</li>\r\n	<li>\r\n	<p>Hai cảm biến bắt ch&iacute;nh x&aacute;c chuyển động của b&agrave;n ph&iacute;m.</p>\r\n	</li>\r\n	<li>\r\n	<p>B&agrave;n ph&iacute;m gỗ v&agrave; action của đại dương cầm.</p>\r\n	</li>\r\n	<li>\r\n	<p>Nguồn &acirc;m thanh l&agrave; &acirc;m thanh phong ph&uacute; của s&acirc;n khấu h&ograve;a nhạc.</p>\r\n	</li>\r\n	<li>\r\n	<p>Kết nối với m&aacute;y t&iacute;nh của bạn v&agrave; bước v&agrave;o thế giới &acirc;m nhạc mới.</p>\r\n	</li>\r\n</ul>\r\n\r\n<h2><strong>Sử dụng b&agrave;n ph&iacute;m gỗ d&agrave;nh ri&ecirc;ng cho đại dương cầm</strong></h2>\r\n\r\n<p><img alt=\"phím đàn piano Đàn Piano Yamaha DGP1 st music\" src=\"https://musiccity.vn/wp-content/uploads/2021/03/01-AMoreHumanPerformance.jpg\" style=\"height:240px; width:600px\" title=\"Hình ảnh Đàn Piano Yamaha DGP1 tại Music City\" /></p>\r\n\r\n<p>Một ti&ecirc;u chuẩn quan trọng khi n&oacute;i về đ&agrave;n piano l&agrave; cảm ứng v&agrave; phản hồi tinh tế.</p>\r\n\r\n<p><a href=\"https://stmusic.vn/piano-yamaha-dgp1\"><strong>Yamaha DGP1</strong></a>&nbsp;được trang bị cơ chế hoạt động chuy&ecirc;n dụng của đại dương cầm, giống như cơ chế hoạt động của đại dương cầm, sử dụng b&iacute; quyết được trau dồi qua nhiều năm chế tạo piano.</p>\r\n\r\n<p>Cảm gi&aacute;c chạm v&agrave;o sẽ nhận ra ch&iacute;nh c&acirc;y đ&agrave;n piano lớn, một cảm gi&aacute;c chơi mượt m&agrave; v&agrave; nhạy b&eacute;n. B&agrave;n ph&iacute;m l&agrave; b&agrave;n ph&iacute;m gỗ giống như một c&acirc;y đại dương cầm.</p>\r\n\r\n<h2><strong>&Acirc;m thanh của c&acirc;y đại dương cầm nổi tiếng thế giới</strong></h2>\r\n\r\n<p><img alt=\"Đàn Piano Yamaha DGP1\" src=\"https://musiccity.vn/wp-content/uploads/2021/01/08-CFX-.jpg\" title=\"Hình ảnh Đàn Piano Yamaha DGP1 tại Music City\" /></p>\r\n\r\n<p>Yamaha Concert Grand Piano CFIIIS đ&atilde; biểu diễn tr&ecirc;n c&aacute;c s&acirc;n khấu tr&ecirc;n khắp thế giới, bao gồm cả Cuộc thi Tchaikovsky.</p>\r\n\r\n<p>C&aacute;i tốt nhất để lấy mẫu được chọn từ một số lượng lớn CFIIIS, v&agrave; bộ chỉnh h&ograve;a tấu sẽ điều chỉnh cẩn thận từng nốt.</p>\r\n\r\n<h2><strong>Nhỏ gọn với h&igrave;nh thức sắc n&eacute;t, DGP-1</strong></h2>\r\n\r\n<p><img alt=\"Đàn Piano Yamaha DGP1\" src=\"https://musiccity.vn/wp-content/uploads/2020/01/yamaha-dgp1-musiccity-2.jpg\" style=\"height:600px; width:600px\" /></p>\r\n\r\n<p>H&igrave;nh thức của một c&acirc;y đ&agrave;n grand piano được v&iacute; như một ch&uacute; chim sải c&aacute;nh l&agrave; niềm ao ước của tất cả những ai chơi đ&agrave;n. Bằng c&aacute;ch loại bỏ nắp b&agrave;n ph&iacute;m,<a href=\"https://stmusic.vn/piano-yamaha-dgp1\"><strong>&nbsp;Yamaha&nbsp;DGP-1</strong></a>&nbsp;đ&atilde; đạt được sự tự do hơn trong thiết kế. Vẻ đẹp ban đầu của c&acirc;y đ&agrave;n piano c&oacute; thể được nh&igrave;n thấy trong n&oacute; m&agrave; kh&ocirc;ng cần trang tr&iacute;. Sự ch&uacute; &yacute; đến từng chi tiết sống động trong sự đơn giản quyết liệt.</p>\r\n\r\n<h2><strong>Hai cảm biến bắt ch&iacute;nh x&aacute;c chuyển động của b&agrave;n ph&iacute;m.</strong></h2>\r\n\r\n<p><img alt=\"Đàn Piano Yamaha DGP1\" src=\"https://musiccity.vn/wp-content/uploads/2021/03/section03_img01_398e9268f4e9f10b.jpg\" style=\"height:300px; width:600px\" /></p>\r\n\r\n<p>Ngo&agrave;i cảm biến ph&iacute;m loại sợi quang kh&ocirc;ng tiếp x&uacute;c kh&ocirc;ng ảnh hưởng đến chuyển động của b&agrave;n ph&iacute;m, cảm biến b&uacute;a cũng được sử dụng.</p>\r\n\r\n<p>N&oacute; nắm bắt c&aacute;c chuyển động của b&agrave;n ph&iacute;m v&agrave; b&uacute;a một c&aacute;ch chi tiết, nắm bắt ch&iacute;nh x&aacute;c c&aacute;c sắc th&aacute;i tinh tế li&ecirc;n quan đến biểu hiện hiệu suất như độ mạnh v&agrave; điểm yếu của c&aacute;c lần nhấn ph&iacute;m, thời gian v&agrave; phản ứng với nguồn &acirc;m thanh.</p>\r\n\r\n<h2><strong>Kết nối với m&aacute;y t&iacute;nh của bạn v&agrave; bước v&agrave;o thế giới &acirc;m nhạc mới.</strong></h2>\r\n\r\n<p><img alt=\"Đàn Piano Yamaha DGP1\" src=\"https://musiccity.vn/wp-content/uploads/2021/03/Other-Feature_NU1X-N3X_420x238_0.jpg\" /></p>\r\n\r\n<p><a href=\"https://stmusic.vn/piano-yamaha-dgp1\"><strong>DGP-1</strong></a>&nbsp;được trang bị đầu cuối USB v&agrave; đầu cuối MIDI. Hiệu suất tự động với dữ liệu &acirc;m nhạc được tải xuống tr&ecirc;n Internet. Mang c&aacute;c b&agrave;i h&aacute;t gốc của bạn đến với thế giới th&ocirc;ng qua internet. Giấc mơ &acirc;m nhạc ng&agrave;y c&agrave;ng lan rộng.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2><strong>VIDEO DEMO &Acirc;M THANH PIANO YAMAHA DGP 1</strong></h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><iframe frameborder=\"0\" height=\"315\" src=\"https://www.youtube.com/embed/0sz8VDFRKEI\" width=\"560\"></iframe></p>\r\n\r\n<p><a href=\"https://stmusic.vn/piano-dien-yamaha\">Xem th&ecirc;m c&aacute;c mẫu đ&agrave;n Piano Điện Yamaha tại đ&acirc;y!&nbsp;</a></p>\r\n\r\n<p><strong>Vui l&ograve;ng li&ecirc;n hệ với ch&uacute;ng t&ocirc;i để được tư vấn cụ thể theo nhu cầu của qu&yacute; kh&aacute;ch</strong>!&nbsp;</p>\r\n\r\n<p><strong>Website</strong>:&nbsp;<a href=\"https://stmusic.vn/?fbclid=IwAR2qy1UFwco4gHTu1PCpQV2CijVxQNA-pQqXPPjQ5QsSru4P42gCq7m3B1U\" target=\"_blank\">https://tempoacademy.vn/</a></p>\r\n\r\n<p><strong>Page facebook:</strong>&nbsp;<a href=\"https://www.facebook.com/PianoSTMusic/\">https://www.facebook.com/tempomusic/</a></p>\r\n\r\n<p><strong>Hotline/Zalo</strong>&nbsp;:&nbsp;0972 176 841&nbsp;</p>\r\n', 1, 1, 0, 0, 23500000, 23500000, '2022-12-09 16:01:51', '1', '2022-12-09 16:01:51', '1', 1, 1, 20, 'fb87be35661b37efc4918298353a0563.png', '', NULL, 0, 4),
(68, 1, 'ROLAND HP-107', 'roland-hp-107', '1ff491c4084a5fae0df304805552ebcd.png', 'a98ca65859e1561bc41a1c3e0a4774c1.png', 'Đàn Piano điện Roland HP 107 là dòng đàn tầm trung tỏng phân khúc HP seri của Roland. Với hệ thống loa công suất lớn đến đến âm thanh truung thực.', '<h1><strong>Đ&agrave;n Piano Roland HP 107</strong></h1>\r\n\r\n<p><img alt=\"đàn piano điện roland 107\" src=\"https://pianotanbinh.com/wp-content/uploads/2022/05/da%CC%80n-piano-die%CC%A3%CC%82n-roland-hp-107-2-640x480.jpg\" style=\"height:480px; width:640px\" /></p>\r\n\r\n<p>Tất cả sức mạnh biểu đạt của một c&acirc;y đại dương cầm acoustic, với c&aacute;c t&iacute;nh năng biểu diễn kỹ thuật số th&uacute; vị m&agrave; bạn mong đợi từ chiếc paino h&agrave;ng đầu của HP-Series. HP107 chỉ đơn giản l&agrave; tuyệt vời! C&aacute;c &acirc;m piano được lấy mẫu &acirc;m thanh nổi tuyệt vời v&agrave; c&aacute;c t&iacute;nh năng &acirc;m thanh ti&ecirc;n tiến của n&oacute; mang đến &acirc;m thanh phong ph&uacute; v&agrave; ch&acirc;n thực đến kinh ngạc như một c&acirc;y đại dương cầm d&agrave;nh cho buổi h&ograve;a nhạc.</p>\r\n\r\n<p>B&agrave;n ph&iacute;m Progressive Hammer-Action với Escapement mang lại cảm gi&aacute;c ch&acirc;n thực, tự nhi&ecirc;n của một c&acirc;y đ&agrave;n acoustic. Đ&acirc;y l&agrave; c&acirc;y đ&agrave;n piano tuyệt vời cho mọi ng&ocirc;i nh&agrave;. V&agrave; n&oacute; được trang bị c&aacute;c t&iacute;nh năng kỹ thuật số cao cấp để hỗ trợ việc biểu diễn v&agrave; luyện tập. Từ khả năng chơi bằng nửa b&agrave;n đạp đến thiết kế th&ugrave;ng loa mới thanh lịch với c&aacute;c cạnh được bo tr&ograve;n cẩn thận v&agrave; nắp đầy b&agrave;n ph&iacute;m, cũng như nhiều b&agrave;i h&aacute;t b&ecirc;n trong, HP107 thật tuyệt vời khi chơi, đẹp mắt v&agrave; th&iacute;ch th&uacute; khi nghe.</p>\r\n\r\n<p>Đ&agrave;n Piano điện Roland HP 107 l&agrave; d&ograve;ng đ&agrave;n tầm trung tỏng ph&acirc;n kh&uacute;c HP seri của Roland. Với hệ thống loa c&ocirc;ng suất lớn đến đến &acirc;m thanh truung thực.</p>\r\n\r\n<ul>\r\n	<li>B&agrave;n ph&iacute;m 88 ph&iacute;m nặng chuẩn với c&ocirc;ng nghẹ Escapment đem đến cảm gi&aacute;c ph&iacute;m trung thự hơn bao giờ hết</li>\r\n	<li>40 mẫu ti&ecirc;ng cao cấp với c&aacute;c hiệu ứng&nbsp; &ldquo;Key-Off,&rdquo; &ldquo;String,&rdquo; v&agrave;&nbsp; &ldquo;Damper&rdquo; Resonance, 128-voice polyphony</li>\r\n	<li>New &ldquo;Grand Space&rdquo; and &ldquo;Dynamic Emphasis&rdquo; effects</li>\r\n	<li>Chức năng thu &acirc;m 2 track kết hợp với m&aacute;y đ&aacute;nh nhịp Metronome</li>\r\n	<li>Cổng kết nối USB-Midi</li>\r\n</ul>\r\n\r\n<h3>Video test &acirc;m thanh Roland HP 107 thực tế</h3>\r\n\r\n<p><iframe frameborder=\"0\" height=\"374\" scrolling=\"no\" src=\"https://www.youtube.com/embed/Qlw4WpCU4Fg?feature=oembed\" title=\"Đàn Piano Roland HP 107 âm thanh hay|Piano Tân Bình- Blessed Music\" width=\"600\"></iframe></p>\r\n\r\n<p>Xuất Xứ: Nhật Bản</p>\r\n\r\n<p>M&agrave;u : Đen</p>\r\n\r\n<p>Bảo H&agrave;nh: 1&nbsp;năm</p>\r\n\r\n<p>Miễn ph&iacute; vận chuyển TP Pleiku</p>\r\n\r\n<p>Ship COD to&agrave;n quốc</p>\r\n', 2, 1, 0, 0, 15000000, 15000000, '2022-12-09 16:25:43', '1', '2022-12-09 16:25:43', '1', 1, 1, 20, '', NULL, NULL, 0, 4),
(69, 1, 'Korg C320', 'korg-c320', 'd46f9aa27022df56353f4e2b99175460.png', '3f5ce59dd8b2da2e39e66e4c4f011b85.png', 'Đàn Piano điện Korg C320 có thiết kế nhỏ gọn hiện đại và sang trọng phù hợp cho mọi lứa tuổi. Đặc biệt, đàn có âm sắc khá thật, nhất là các tiếng rhose piano, dùng để chơi smooth hoặc funky khá hay.', '<h2><span style=\"font-family:Comic Sans MS,cursive\"><strong>Đ&Agrave;N PIANO ĐIỆN KORG C320</strong></span></h2>\r\n\r\n<h2><span style=\"font-family:Comic Sans MS,cursive\"><a href=\"http://pianohanoi.com/da-n-piano-dien.html\">Đ&agrave;n piano điện&nbsp;</a>Korg C320, c&oacute; thiết kế mang n&eacute;t hiện đại, k&iacute;ch thước&nbsp;vừa phải, kh&ocirc;ng nhỏ cũng kh&ocirc;ng qu&aacute; to. C320 c&oacute; &acirc;m sắc piano kh&aacute; thật, đặc biệt với c&aacute;c tiếng rhose piano, d&ugrave;ng để chơi smooth hoặc funky kh&aacute; hay.&nbsp;</span></h2>\r\n\r\n<p><br />\r\n<span style=\"font-family:Comic Sans MS,cursive\">&Acirc;m thanh của c&aacute;c thương hiệu lớn như Roland, Korg, Yamaha... đều c&oacute; đặc trưng ri&ecirc;ng, c&oacute; người th&iacute;ch tiếng&nbsp;<a href=\"http://pianofingers.vn/danh-muc/piano-co-1.html\"><strong>đ&agrave;n piano</strong></a>&nbsp;bay bổng th&igrave; chọn Roland, c&oacute; người th&iacute;ch mộc mạc th&igrave; chọn Yamaha, ai th&iacute;ch cả hai th&igrave; chọn Korg... Vậy bạn c&ograve;n chờ g&igrave; nữa?!</span></p>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\"><img src=\"https://product.hstatic.net/200000359259/product/piano-krog-c320_6406d72d025245409134d88f33e34c27_grande.jpg\" style=\"height:600px; width:600px\" /></span></p>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\"><img src=\"https://product.hstatic.net/200000359259/product/piano-krog-c320-1_2bfd2ccf266b4ce187e4c6ad32bcbc2f_grande.jpg\" style=\"height:600px; width:600px\" /></span></p>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\"><img src=\"https://product.hstatic.net/200000359259/product/piano-krog-c320-2_f1ca47b9503c4bf78cc0231690b71fe7_grande.jpg\" style=\"height:600px; width:600px\" /></span></p>\r\n\r\n<p><span style=\"font-family:Comic Sans MS,cursive\"><img src=\"https://product.hstatic.net/200000359259/product/piano-krog-c320-3_9b08f1bed315417ca3aa3f157b652e4a_grande.jpg\" style=\"height:600px; width:600px\" /></span></p>\r\n', 11, 1, 0, 0, 11000000, 11000000, '2022-12-09 16:38:50', '1', '2022-12-09 16:38:50', '1', 1, 1, 20, '149b27ba60b2ad61d8807539ba69f314.png', '395ffac34635d1731110a977cd15591d.png', '', 0, 4),
(70, 1, 'Piano Cơ Yamaha', 'piano-co-yamaha', '96ea4a965c42047e0773c3f31c669c6b.png', '', '', '<h2><strong>THIẾT KẾ&nbsp;</strong><strong>M&Agrave;U ĐEN B&Oacute;NG SANG TRỌNG</strong></h2>\r\n\r\n<p>Đ&agrave;n Piano&nbsp;cơ Yamaha : Sở hữu một c&acirc;y đ&agrave;n piano m&agrave;u đen b&oacute;ng sang trọng cho gia đ&igrave;nh thật l&agrave; một sự lựa chọn l&yacute; tưởng. M&agrave;u đen b&oacute;ng của c&acirc;y đ&agrave;n&nbsp;gi&uacute;p t&ocirc;n l&ecirc;n vẻ đẹp cho ng&ocirc;i nh&agrave; của bạn, mang lại sự trang trọng qu&yacute; ph&aacute;i.</p>\r\n\r\n<p>C&ugrave;ng với thiết kế đẹp mắt của lớp phủ b&oacute;ng b&ecirc;n ngo&agrave;i cho bạn cảm gi&aacute;c tự nhi&ecirc;n v&agrave; hấp dẫn nhất, t&ocirc;n l&ecirc;n mọi vẻ đẹp của căn ph&ograve;ng bạn.</p>\r\n\r\n<p><img alt=\"\" src=\"https://thegioinhaccu.com.vn/uploads/dan-piano-co-yamaha-u-2f_1646122102.png\" style=\"width:600px\" /></p>\r\n\r\n<p><strong>HỆ THỐNG 3 PEDAL CHUY&Ecirc;N NGHIỆP</strong></p>\r\n\r\n<p><strong>Đ&agrave;n piano cơ</strong>&nbsp;<strong>Yamaha U2F&nbsp;</strong>c&oacute; hệ thống 3 pedal Soft Pedal, Mute Pedal, Damper Pedal chất lượng cao. Damper Pedal l&agrave; pedal vang &acirc;m, nằm ở ph&iacute;a b&ecirc;n phải, gi&uacute;p cho &acirc;m thanh được ng&acirc;n vang khi bạn sử dụng. Soft Pedal l&agrave; pedal giảm &acirc;m, nằm ở ngo&agrave;i c&ugrave;ng ph&iacute;a b&ecirc;n tr&aacute;i, khi sử dụng pedal sẽ gi&uacute;p cho &acirc;m thanh ph&aacute;t ra được giảm nhỏ hơn, mang lại cảm x&uacute;c cho người chơi.</p>\r\n\r\n<p>Cuối c&ugrave;ng l&agrave; Mute Pedal, khi sử dụng, pedal n&agrave;y sẽ l&agrave;m cho &acirc;m thanh bị im lặng ho&agrave;n to&agrave;n, chức năng n&agrave;y cho ph&eacute;p bạn sử dụng tai nghe khi chơi để l&agrave;m giảm tiếng ồn cho kh&ocirc;ng gian b&ecirc;n ngo&agrave;i.</p>\r\n\r\n<p><img alt=\"\" src=\"https://thegioinhaccu.com.vn/uploads/dan-piano-co-yamaha-u-2f-1_1646122102.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><strong>BỀ MẶT PH&Iacute;M ACRYLIC RESIN CHO CẢM NHẬN &Acirc;M THANH CH&Acirc;N THẬT</strong></p>\r\n\r\n<p>Bề mặt ph&iacute;m được bao phủ bởi lớp&nbsp;<strong>Acrylic Resin</strong>&nbsp;hay c&ograve;n gọi l&agrave; nhựa Acrylic gi&uacute;p b&agrave;n ph&iacute;m b&oacute;ng v&agrave; đẹp hơn. Ngo&agrave;i ra Acrylic Resin c&ograve;n c&oacute; độ bền cao ngay cả dưới t&aacute;c dụng của h&oacute;a chất. C&aacute;c ph&iacute;m đen được bao phủ bởi lớp<strong>&nbsp;Phenolic resin</strong>&nbsp;c&oacute; khả năng chịu được nhiệt độ cao, chống m&agrave;i m&ograve;n. V&igrave; thế đ&agrave;n&nbsp;<strong>Piano Cơ Yamaha U</strong><strong>2F</strong>&nbsp;l&agrave; sự lựa chọn tốt nhất cho gia đ&igrave;nh th&acirc;n y&ecirc;u của bạn.</p>\r\n\r\n<p><br />\r\n<br />\r\n&nbsp;<img alt=\"\" src=\"https://thegioinhaccu.com.vn/uploads/dan-piano-co-yamaha-u-2f-2_1646122102.jpg\" style=\"width:600px\" /></p>\r\n\r\n<p><strong>BẢNG CỘNG HƯỞNG BẰNG GỖ V&Acirc;N SAM CHẮC CHẮN</strong></p>\r\n\r\n<p>Piano Cơ Yamaha U2F với bảng cộng hưởng được l&agrave;m bằng gỗ v&acirc;n sam mịn nhất, được c&aacute;c nghệ nh&acirc;n Yamaha chọn v&agrave; sấy kh&ocirc; gỗ đến việc chế tạo c&aacute;ch tỉ mĩ. Bảng cộng hưởng c&oacute; vai tr&ograve; rất quan trọng trong việc cấu th&agrave;nh &acirc;m thanh n&ecirc;n đ&atilde; được ch&uacute; trọng xử l&yacute; rất chi tiết.<br />\r\n&nbsp;</p>\r\n\r\n<p><img alt=\"\" src=\"https://thegioinhaccu.com.vn/uploads/dan-piano-co-yamaha-u-2f-3_1646122102.png\" style=\"width:600px\" /></p>\r\n', 1, 1, 0, 5, 34000000, 32300000, '2022-12-09 16:48:56', '1', '2022-12-09 16:53:02', '1', 1, 1, 20, '', NULL, NULL, 0, 4);

-- --------------------------------------------------------

--
-- Table structure for table `db_province`
--

CREATE TABLE `db_province` (
  `id` int(5) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 NOT NULL,
  `type` varchar(30) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `db_province`
--

INSERT INTO `db_province` (`id`, `name`, `type`) VALUES
(1, 'Thành phố Hà Nội', 'Thành phố Trung ương'),
(2, 'Tỉnh Hà Giang', 'Tỉnh'),
(4, 'Tỉnh Cao Bằng', 'Tỉnh'),
(6, 'Tỉnh Bắc Kạn', 'Tỉnh'),
(8, 'Tỉnh Tuyên Quang', 'Tỉnh'),
(10, 'Tỉnh Lào Cai', 'Tỉnh'),
(11, 'Tỉnh Điện Biên', 'Tỉnh'),
(12, 'Tỉnh Lai Châu', 'Tỉnh'),
(14, 'Tỉnh Sơn La', 'Tỉnh'),
(15, 'Tỉnh Yên Bái', 'Tỉnh'),
(17, 'Tỉnh Hoà Bình', 'Tỉnh'),
(19, 'Tỉnh Thái Nguyên', 'Tỉnh'),
(20, 'Tỉnh Lạng Sơn', 'Tỉnh'),
(22, 'Tỉnh Quảng Ninh', 'Tỉnh'),
(24, 'Tỉnh Bắc Giang', 'Tỉnh'),
(25, 'Tỉnh Phú Thọ', 'Tỉnh'),
(26, 'Tỉnh Vĩnh Phúc', 'Tỉnh'),
(27, 'Tỉnh Bắc Ninh', 'Tỉnh'),
(30, 'Tỉnh Hải Dương', 'Tỉnh'),
(31, 'Thành phố Hải Phòng', 'Thành phố Trung ương'),
(33, 'Tỉnh Hưng Yên', 'Tỉnh'),
(34, 'Tỉnh Thái Bình', 'Tỉnh'),
(35, 'Tỉnh Hà Nam', 'Tỉnh'),
(36, 'Tỉnh Nam Định', 'Tỉnh'),
(37, 'Tỉnh Ninh Bình', 'Tỉnh'),
(38, 'Tỉnh Thanh Hóa', 'Tỉnh'),
(40, 'Tỉnh Nghệ An', 'Tỉnh'),
(42, 'Tỉnh Hà Tĩnh', 'Tỉnh'),
(44, 'Tỉnh Quảng Bình', 'Tỉnh'),
(45, 'Tỉnh Quảng Trị', 'Tỉnh'),
(46, 'Tỉnh Thừa Thiên Huế', 'Tỉnh'),
(48, 'Thành phố Đà Nẵng', 'Thành phố Trung ương'),
(49, 'Tỉnh Quảng Nam', 'Tỉnh'),
(51, 'Tỉnh Quảng Ngãi', 'Tỉnh'),
(52, 'Tỉnh Bình Định', 'Tỉnh'),
(54, 'Tỉnh Phú Yên', 'Tỉnh'),
(56, 'Tỉnh Khánh Hòa', 'Tỉnh'),
(58, 'Tỉnh Ninh Thuận', 'Tỉnh'),
(60, 'Tỉnh Bình Thuận', 'Tỉnh'),
(62, 'Tỉnh Kon Tum', 'Tỉnh'),
(64, 'Tỉnh Gia Lai', 'Tỉnh'),
(66, 'Tỉnh Đắk Lắk', 'Tỉnh'),
(67, 'Tỉnh Đắk Nông', 'Tỉnh'),
(68, 'Tỉnh Lâm Đồng', 'Tỉnh'),
(70, 'Tỉnh Bình Phước', 'Tỉnh'),
(72, 'Tỉnh Tây Ninh', 'Tỉnh'),
(74, 'Tỉnh Bình Dương', 'Tỉnh'),
(75, 'Tỉnh Đồng Nai', 'Tỉnh'),
(77, 'Tỉnh Bà Rịa - Vũng Tàu', 'Tỉnh'),
(79, 'Thành phố Hồ Chí Minh', 'Thành phố Trung ương'),
(80, 'Tỉnh Long An', 'Tỉnh'),
(82, 'Tỉnh Tiền Giang', 'Tỉnh'),
(83, 'Tỉnh Bến Tre', 'Tỉnh'),
(84, 'Tỉnh Trà Vinh', 'Tỉnh'),
(86, 'Tỉnh Vĩnh Long', 'Tỉnh'),
(87, 'Tỉnh Đồng Tháp', 'Tỉnh'),
(89, 'Tỉnh An Giang', 'Tỉnh'),
(91, 'Tỉnh Kiên Giang', 'Tỉnh'),
(92, 'Thành phố Cần Thơ', 'Thành phố Trung ương'),
(93, 'Tỉnh Hậu Giang', 'Tỉnh'),
(94, 'Tỉnh Sóc Trăng', 'Tỉnh'),
(95, 'Tỉnh Bạc Liêu', 'Tỉnh'),
(96, 'Tỉnh Cà Mau', 'Tỉnh');

-- --------------------------------------------------------

--
-- Table structure for table `db_slider`
--

CREATE TABLE `db_slider` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `link` varchar(255) CHARACTER SET utf8 NOT NULL,
  `img` varchar(100) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `created_by` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'Supper Admin',
  `modified` datetime NOT NULL,
  `modified_by` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT 'Supper Admin',
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_slider`
--

INSERT INTO `db_slider` (`id`, `name`, `link`, `img`, `created`, `created_by`, `modified`, `modified_by`, `trash`, `status`) VALUES
(1, 'Banner1', 'banner-1', '2.jpg', '2019-06-13 21:27:24', '1', '2019-06-13 23:42:42', '', 0, 1),
(2, 'Banner 2', 'Banner-2', 'default.png', '2019-06-13 23:45:04', '1', '2019-06-13 23:45:44', '', 0, 1),
(3, 'trang chu 1', 'trang-chu', 'slider-1.png', '2019-07-03 17:05:52', '1', '2022-04-26 11:04:48', '', 1, 1),
(4, 'slider trang chu 2', 'slider-trang-chu-2', 'slider-2.jpg', '2019-07-03 17:06:38', '1', '2022-04-26 11:04:37', '', 1, 1),
(5, 'slider trang chu 3', 'slider-trang-chu-3', 'slider-3.jpg', '2019-07-03 17:06:58', '1', '2022-04-26 11:04:22', '', 1, 1),
(6, 'ss', 'ss', 'icon_142e7.png', '2019-07-03 17:08:07', '1', '2019-07-03 17:08:07', '1', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `db_user`
--

CREATE TABLE `db_user` (
  `id` int(11) NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8 NOT NULL,
  `username` varchar(225) CHARACTER SET utf8 NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 NOT NULL,
  `role` int(11) NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 NOT NULL,
  `gender` int(1) NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8 NOT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `trash` int(1) NOT NULL DEFAULT 1,
  `status` int(1) NOT NULL DEFAULT 1,
  `detail` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `star` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_user`
--

INSERT INTO `db_user` (`id`, `fullname`, `username`, `password`, `role`, `email`, `gender`, `phone`, `address`, `img`, `created`, `trash`, `status`, `detail`, `star`) VALUES
(1, 'Trịnh Tấn Thành', 'thanh1996', '7c4a8d09ca3762af61e59520943dc26494f8941b', 1, 'thanhwilshere91@gmail.com', 0, '981643651', 'Gò vấp', '78f46c5088cfa63ed79beb403a3b1d99.png', '2022-04-13 22:30:03', 1, 1, '<p>Cơ sở sản xuất b&aacute;nh gai đạt chất lượng, ti&ecirc;u chuẩn, thơm ngon: ?Nem chua : - Loại 1 : 5000₫/c&aacute;i - Loại 2 : 3000₫/c&aacute;i - Loại 3 : 2500₫/c&aacute;i - Loại 4 : 2000₫/c&aacute;i ?? Ngo&agrave;i ra b&ecirc;n m&igrave;nh c&ograve;n chuy&ecirc;n sản xuất Gi&ograve; Hấp uy t&iacute;n , chất lượng. Với c&ocirc;ng nghệ chế biến Gi&ograve; Hấp h&agrave;ng trăm năm của cơ sở , k&egrave;m theo một ch&uacute;t đổi mới của c&aacute;c chuy&ecirc;n gia đ&atilde; tạo th&ecirc;m cho Gi&ograve; Hấp một hương vị đặc trưng thơm ngon hấp dẫn qu&yacute; kh&aacute;ch , với mẫu m&atilde; đẹp nhất , ch&uacute;ng t&ocirc;i đảm bảo mang đến cho người ti&ecirc;u d&ugrave;ng chất lượng gi&ograve; tốt nhất m&agrave; gi&aacute; cả lại hợp l&yacute;... ? Gi&ograve; B&ograve; ( Me ) : - Loại 1kg: 200.000₫ - Loại 0,5kg: 100.000₫ ?Gi&ograve; Đ&agrave; điểu : - Loại 1kg: 240.000₫ - Loại 0,5kg:120.000₫ ??C&ograve;n chần chờ g&igrave; nữa , h&atilde;y nhấc m&aacute;y l&ecirc;n v&agrave; đặt H&agrave;ng đi n&agrave;o.... ⛔️ ĐẶC BIỆT SI&Ecirc;U KHUYẾN M&Atilde;I CHO KH&Aacute;CH H&Agrave;NH NHANH TAY COMMENT V&Agrave; ĐẶT H&Agrave;NG VỚI SỐ LƯỢNG LỚN.... ??&zwj;♀️ Free ship to&agrave;n quốc. ☎️ Sỉ v&agrave; lẻ li&ecirc;n hệ: 0961415896 ☎️ Zalo, Viber: 01663403496</p>\r\n', 1),
(2, 'Công ty giải trí cây đa', 'thanh19961', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'thanhwilshere92@gmail.com', 0, '0989555555', 'Lê đức thọ 2', '3f957d853517ae45fd7669746a386073.jpg', '2022-04-13 22:59:14', 1, 1, '<p>Cơ sở sản xuất b&aacute;nh gai đạt chất lượng, ti&ecirc;u chuẩn, thơm ngon: ?Nem chua : - Loại 1 : 5000₫/c&aacute;i - Loại 2 : 3000₫/c&aacute;i - Loại 3 : 2500₫/c&aacute;i - Loại 4 : 2000₫/c&aacute;i ?? Ngo&agrave;i ra b&ecirc;n m&igrave;nh c&ograve;n chuy&ecirc;n sản xuất Gi&ograve; Hấp uy t&iacute;n , chất lượng. Với c&ocirc;ng nghệ chế biến Gi&ograve; Hấp h&agrave;ng trăm năm của cơ sở , k&egrave;m theo một ch&uacute;t đổi mới của c&aacute;c chuy&ecirc;n gia đ&atilde; tạo th&ecirc;m cho Gi&ograve; Hấp một hương vị đặc trưng thơm ngon hấp dẫn qu&yacute; kh&aacute;ch , với mẫu m&atilde; đẹp nhất , ch&uacute;ng t&ocirc;i đảm bảo mang đến cho người ti&ecirc;u d&ugrave;ng chất lượng gi&ograve; tốt nhất m&agrave; gi&aacute; cả lại hợp l&yacute;... ? Gi&ograve; B&ograve; ( Me ) : - Loại 1kg: 200.000₫ - Loại 0,5kg: 100.000₫ ?Gi&ograve; Đ&agrave; điểu : - Loại 1kg: 240.000₫ - Loại 0,5kg:120.000₫ ??C&ograve;n chần chờ g&igrave; nữa , h&atilde;y nhấc m&aacute;y l&ecirc;n v&agrave; đặt H&agrave;ng đi n&agrave;o.... ⛔️ ĐẶC BIỆT SI&Ecirc;U KHUYẾN M&Atilde;I CHO KH&Aacute;CH H&Agrave;NH NHANH TAY COMMENT V&Agrave; ĐẶT H&Agrave;NG VỚI SỐ LƯỢNG LỚN.... ??&zwj;♀️ Free ship to&agrave;n quốc. ☎️ Sỉ v&agrave; lẻ li&ecirc;n hệ: 0961415896 ☎️ Zalo, Viber: 01663403496</p>\r\n', 1),
(10, 'Công ty TNHH Tấn Thành MTP', 'mtp1996', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'mtp@gmail.com', 0, '0958569633', '876 Lý Thường Kiệt, Chupuh, Gia Lai', '07403ad8be5947f1e93fc6e6f9b086db.jpg', '2022-04-26 13:55:36', 1, 1, 'Cơ sở sản xuất bánh gai đạt chất lượng, tiêu chuẩn, thơm ngon:\n\n?Nem chua :\n- Loại 1 : 5000₫/cái\n- Loại 2 : 3000₫/cái\n- Loại 3 : 2500₫/cái\n- Loại 4 : 2000₫/cái\n\n?? Ngoài ra bên mình còn chuyên sản xuất Giò Hấp uy tín , chất lượng. Với công nghệ chế biến Giò Hấp hàng trăm năm của cơ sở , kèm theo một chút đổi mới của các chuyên gia đã tạo thêm cho Giò Hấp một hương vị đặc trưng thơm ngon hấp dẫn quý khách , với mẫu mã đẹp nhất , chúng tôi đảm bảo mang đến cho người tiêu dùng chất lượng giò tốt nhất mà giá cả lại hợp lý...\n\n? Giò Bò ( Me ) :\n- Loại 1kg: 200.000₫\n- Loại 0,5kg: 100.000₫\n\n?Giò Đà điểu :\n\n- Loại 1kg: 240.000₫\n- Loại 0,5kg:120.000₫\n\n??Còn chần chờ gì nữa , hãy nhấc máy lên và đặt Hàng đi nào....\n\n⛔️ ĐẶC BIỆT SIÊU KHUYẾN MÃI CHO KHÁCH HÀNH NHANH TAY COMMENT VÀ ĐẶT HÀNG VỚI SỐ LƯỢNG LỚN....\n\n??‍♀️ Free ship toàn quốc.\n\n☎️ Sỉ và lẻ liên hệ: 0961415896\n☎️ Zalo, Viber: 01663403496', 1),
(12, 'Lê Văn Tiến', 'tien9x', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, '14520851@gm.uit.edu.vn', 0, '0969878909', '90 nguyễn văn trối ', '3d3eca0774297c335d48676e8fa04a58.jpg', '2022-05-04 08:02:15', 1, 1, '<p>Cơ sở sản xuất b&aacute;nh gai đạt chất lượng, ti&ecirc;u chuẩn, thơm ngon: ?Nem chua : - Loại 1 : 5000₫/c&aacute;i - Loại 2 : 3000₫/c&aacute;i - Loại 3 : 2500₫/c&aacute;i - Loại 4 : 2000₫/c&aacute;i ?? Ngo&agrave;i ra b&ecirc;n m&igrave;nh c&ograve;n chuy&ecirc;n sản xuất Gi&ograve; Hấp uy t&iacute;n , chất lượng. Với c&ocirc;ng nghệ chế biến Gi&ograve; Hấp h&agrave;ng trăm năm của cơ sở , k&egrave;m theo một ch&uacute;t đổi mới của c&aacute;c chuy&ecirc;n gia đ&atilde; tạo th&ecirc;m cho Gi&ograve; Hấp một hương vị đặc trưng thơm ngon hấp dẫn qu&yacute; kh&aacute;ch , với mẫu m&atilde; đẹp nhất , ch&uacute;ng t&ocirc;i đảm bảo mang đến cho người ti&ecirc;u d&ugrave;ng chất lượng gi&ograve; tốt nhất m&agrave; gi&aacute; cả lại hợp l&yacute;... ? Gi&ograve; B&ograve; ( Me ) : - Loại 1kg: 200.000₫ - Loại 0,5kg: 100.000₫ ?Gi&ograve; Đ&agrave; điểu : - Loại 1kg: 240.000₫ - Loại 0,5kg:120.000₫ ??C&ograve;n chần chờ g&igrave; nữa , h&atilde;y nhấc m&aacute;y l&ecirc;n v&agrave; đặt H&agrave;ng đi n&agrave;o.... ⛔️ ĐẶC BIỆT SI&Ecirc;U KHUYẾN M&Atilde;I CHO KH&Aacute;CH H&Agrave;NH NHANH TAY COMMENT V&Agrave; ĐẶT H&Agrave;NG VỚI SỐ LƯỢNG LỚN.... ??&zwj;♀️ Free ship to&agrave;n quốc. ☎️ Sỉ v&agrave; lẻ li&ecirc;n hệ: 0961415896 ☎️ Zalo, Viber: 01663403496</p>\r\n', 1),
(18, 'Còn gì nữa đâu', 'shopmoi', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'thanhwilshere98@gmail.com', 1, '0969124469', 'ở nhà tao', '5629e2c8e2a10b64be578c3dac0450f7.jpg', '2022-05-23 09:22:39', 1, 1, '<p>Chuy&ecirc;n b&aacute;n b&aacute;nh bao v&agrave; c&aacute;c sản phẩm l&agrave; từ chuối</p>\r\n\r\n<p>Cam kết h&agrave;ng ngon</p>\r\n\r\n<p>Kh&ocirc;ng sử dụng chất bảo quản</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><span style=\"color:#c0392b\"><em><strong>Supper number 11111</strong></em></span></p>\r\n\r\n<ul>\r\n	<li>&agrave; h&aacute;</li>\r\n	<li>ờ hớ</li>\r\n</ul>\r\n', 2),
(19, 'shopmoi9x', 'shopmoi9x', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'thanhwilshere99@gmail.com', 0, '098978998', '90 hùng vương', '624d690ceb28b7eea97d0910116e5dbc.png', '2022-05-23 09:33:14', 1, 1, '<p><strong>Shop test</strong></p>\r\n', 4),
(20, 'Công ty TNHH 1 thành viên Chương Mập 1', 'chuonngchau', '7c4a8d09ca3762af61e59520943dc26494f8941b', 2, 'thanhwilshre96@gmail.com', 0, '0978123912', '38 Võ Bình Minh', 'ada60ca6e252805bed4d9d47c70e055b.png', '2022-06-27 09:16:32', 1, 1, '<p>C&ocirc;ng ty TNHH 1 th&agrave;nh vi&ecirc;n Chương Mập</p>\r\n', 5);

-- --------------------------------------------------------

--
-- Table structure for table `db_usergroup`
--

CREATE TABLE `db_usergroup` (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL,
  `trash` tinyint(1) NOT NULL DEFAULT 1,
  `access` tinyint(1) NOT NULL DEFAULT 1,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `db_usergroup`
--

INSERT INTO `db_usergroup` (`id`, `name`, `created`, `created_by`, `modified`, `modified_by`, `trash`, `access`, `status`) VALUES
(1, 'Toàn quyền', '2021-05-14 23:29:15', 1, '2021-05-14 23:29:15', 4, 1, 1, 1),
(2, 'Người bán hàng', '2021-05-14 23:29:21', 1, '2021-05-14 23:29:21', 4, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `google_users`
--

CREATE TABLE `google_users` (
  `id` decimal(21,0) NOT NULL,
  `google_name` varchar(60) NOT NULL,
  `google_email` varchar(60) NOT NULL,
  `google_link` varchar(60) NOT NULL,
  `google_picture_link` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `db_cahoc`
--
ALTER TABLE `db_cahoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_category`
--
ALTER TABLE `db_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_chinhsach`
--
ALTER TABLE `db_chinhsach`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_config`
--
ALTER TABLE `db_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_contact`
--
ALTER TABLE `db_contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_content`
--
ALTER TABLE `db_content`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_cosodanhgia`
--
ALTER TABLE `db_cosodanhgia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_customer`
--
ALTER TABLE `db_customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_discount`
--
ALTER TABLE `db_discount`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_district`
--
ALTER TABLE `db_district`
  ADD PRIMARY KEY (`id`),
  ADD KEY `matp` (`provinceid`);

--
-- Indexes for table `db_evaluate`
--
ALTER TABLE `db_evaluate`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_hocvien`
--
ALTER TABLE `db_hocvien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_hoidapcoso`
--
ALTER TABLE `db_hoidapcoso`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_ketnoicungcau`
--
ALTER TABLE `db_ketnoicungcau`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_monhoc`
--
ALTER TABLE `db_monhoc`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_order`
--
ALTER TABLE `db_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customerid` (`customerid`),
  ADD KEY `province` (`province`),
  ADD KEY `district` (`district`),
  ADD KEY `province_2` (`province`),
  ADD KEY `district_2` (`district`),
  ADD KEY `province_3` (`province`),
  ADD KEY `district_3` (`district`);

--
-- Indexes for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productid` (`productid`),
  ADD KEY `orderid` (`orderid`);

--
-- Indexes for table `db_producer`
--
ALTER TABLE `db_producer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_product`
--
ALTER TABLE `db_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `producer` (`producer`),
  ADD KEY `catid` (`catid`);

--
-- Indexes for table `db_province`
--
ALTER TABLE `db_province`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_slider`
--
ALTER TABLE `db_slider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `db_user`
--
ALTER TABLE `db_user`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `db_usergroup`
--
ALTER TABLE `db_usergroup`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `google_users`
--
ALTER TABLE `google_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `db_cahoc`
--
ALTER TABLE `db_cahoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_category`
--
ALTER TABLE `db_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `db_chinhsach`
--
ALTER TABLE `db_chinhsach`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `db_config`
--
ALTER TABLE `db_config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `db_contact`
--
ALTER TABLE `db_contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_content`
--
ALTER TABLE `db_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `db_cosodanhgia`
--
ALTER TABLE `db_cosodanhgia`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `db_customer`
--
ALTER TABLE `db_customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `db_discount`
--
ALTER TABLE `db_discount`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID', AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `db_evaluate`
--
ALTER TABLE `db_evaluate`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `db_hocvien`
--
ALTER TABLE `db_hocvien`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `db_hoidapcoso`
--
ALTER TABLE `db_hoidapcoso`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `db_ketnoicungcau`
--
ALTER TABLE `db_ketnoicungcau`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `db_monhoc`
--
ALTER TABLE `db_monhoc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `db_order`
--
ALTER TABLE `db_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=143;

--
-- AUTO_INCREMENT for table `db_orderdetail`
--
ALTER TABLE `db_orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=186;

--
-- AUTO_INCREMENT for table `db_producer`
--
ALTER TABLE `db_producer`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `db_slider`
--
ALTER TABLE `db_slider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `db_user`
--
ALTER TABLE `db_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `db_usergroup`
--
ALTER TABLE `db_usergroup`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `db_district`
--
ALTER TABLE `db_district`
  ADD CONSTRAINT `db_district_ibfk_1` FOREIGN KEY (`provinceid`) REFERENCES `db_province` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `db_order`
--
ALTER TABLE `db_order`
  ADD CONSTRAINT `db_order_ibfk_2` FOREIGN KEY (`province`) REFERENCES `db_province` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `db_order_ibfk_3` FOREIGN KEY (`district`) REFERENCES `db_district` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `db_order_ibfk_4` FOREIGN KEY (`customerid`) REFERENCES `db_customer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
