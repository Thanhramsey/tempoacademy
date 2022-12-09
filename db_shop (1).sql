-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 28, 2022 at 05:55 AM
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
-- Database: `db_shop`
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
(0, '::1', '1bmv86fdj2orgscda2inarkohu6at7gj', '2022-06-28 09:00:05');

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
(1, 'Đồ uống', 'douong', 1, 0, '0', '2022-04-22 16:15:39', '4', '2022-04-22 22:37:23', '1', 1, 1),
(2, 'Thảo dược', 'thaoduoc', 1, 0, '0', '2022-04-22 16:13:24', '4', '2022-04-22 22:37:28', '1', 1, 1),
(3, 'Thực phẩm', 'thucpham', 1, 0, '0', '2022-04-22 16:09:41', '4', '2022-04-22 16:09:41', '1', 1, 1),
(4, 'Vải may mặc', 'vaimaymac', 1, 0, '0', '2022-04-23 21:33:25', '1', '2022-04-23 21:33:25', '1', 1, 1),
(5, 'Thủ công mỹ nghệ', 'ttmynghe', 1, 0, '0', '2022-04-23 21:33:41', '1', '2022-04-23 21:33:41', '1', 1, 1),
(6, 'Du lịch', 'dulich', 1, 0, '0', '2022-04-03 21:38:28', '1', '2022-04-03 21:38:28', '1', 1, 1),
(13, 'Thuốc', 'thuoc', 1, 0, '1', '2022-05-25 14:25:02', '1', '2022-05-25 14:25:02', '1', 1, 1),
(14, 'Khác', 'khac', 1, 0, '0', '2022-06-03 14:18:11', '1', '2022-06-03 14:18:11', '1', 1, 1);

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
(2, 'VANHIEP', 200000, 20, 3, '2019-06-12', 500000, 'Giam 200k', '2019-06-10', 1, 0, 1),
(22, 'JZOOVFGMDCSJ', 30000, 1, 0, '2022-07-27', 0, 'Mã giảm giá 30.000 đ tự động khi đăng ký thành công', '2022-06-27', 0, 1, 1),
(23, 'UWN7BI8QTTZX', 30000, 1, 0, '2022-07-27', 0, 'Mã giảm giá 30.000 đ tự động khi đăng ký thành công', '2022-06-27', 0, 1, 1);

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

--
-- Dumping data for table `db_order`
--

INSERT INTO `db_order` (`id`, `orderCode`, `customerid`, `orderdate`, `fullname`, `phone`, `money`, `price_ship`, `coupon`, `province`, `district`, `address`, `trash`, `status`, `orderDes`, `productid`, `count`, `price`) VALUES
(131, 'zwcKx9XO', 1, '2022-05-19 15:16:09', 'Thành', '0969124469', 180180, 0, 0, 64, 623, '90 lý thái tổ', 1, 0, '1202251915169', 61, 2, 90090),
(132, 'zNQxYswc', 1, '2022-05-19 15:16:09', 'Thành', '0969124469', 243000, 0, 0, 64, 623, '90 lý thái tổ', 1, 0, '1202251915169', 57, 3, 81000),
(133, 'dGrLQk0t', 1, '2022-05-19 15:19:30', 'Thành', '0969124469', 243000, 0, 0, 64, 622, '38 võ văn kiệt', 1, 1, '12022519151930', 60, 3, 81000),
(134, 'H8aFuJlI', 1, '2022-05-19 15:19:30', 'Thành', '0969124469', 180000, 0, 0, 64, 622, '38 võ văn kiệt', 1, 2, '12022519151930', 51, 2, 90000),
(135, '7qxCUrBg', 1, '2022-05-19 15:21:22', 'Thành', '0969124469', 150000, 0, 0, 64, 632, '90 tôn thất thuyết', 1, 1, '12022519152122', 56, 3, 50000),
(136, 'ZnAEkvfK', 1, '2022-05-19 15:21:22', 'Thành', '0969124469', 180000, 0, 0, 64, 632, '90 tôn thất thuyết', 1, 3, '12022519152122', 51, 2, 90000),
(137, 'NZgDoQlA', 1, '2022-05-23 09:31:45', 'Thành', '0969124469', 50000, 0, 0, 64, 622, '90 hùng vương', 1, 0, '1202252393145', 56, 1, 50000),
(138, 'ZXMVDdCv', 76, '2022-05-23 14:47:16', 'Tuấn Anh', '092831231', 400000, 0, 0, 64, 639, '90 lê thánh tôn', 1, 2, '762022523144716', 62, 2, 200000),
(139, 'Abq9Y2v0', 76, '2022-05-23 15:03:33', 'Tuấn Anh', '092831231', 100000, 0, 100000, 64, 622, '90 lý thai tổ', 1, 2, '76202252315333', 62, 1, 200000),
(140, 'FfrilSe5', 1, '2022-06-09 10:34:36', 'Thành', '0969124469', 200000, 0, 0, 64, 622, '39 đình chiến', 1, 0, '1202269103436', 62, 1, 200000),
(141, 'f5Y2J3RH', 79, '2022-06-27 09:07:56', 'chương', '0123912241', 51000, 0, 30000, 64, 622, '38 võ bình minh', 1, 2, '7920226279756', 57, 1, 81000),
(142, 'DgznE5ml', 79, '2022-06-27 09:07:56', 'chương', '0123912241', 300000, 0, 0, 64, 622, '38 võ bình minh', 1, 2, '7920226279756', 55, 2, 150000);

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

--
-- Dumping data for table `db_orderdetail`
--

INSERT INTO `db_orderdetail` (`id`, `orderid`, `productid`, `count`, `price`, `trash`, `status`) VALUES
(174, 131, 61, 2, 90090, 1, 1),
(175, 132, 57, 3, 81000, 1, 1),
(176, 133, 60, 3, 81000, 1, 1),
(177, 134, 51, 2, 90000, 1, 1),
(178, 135, 56, 3, 50000, 1, 1),
(179, 136, 51, 2, 90000, 1, 1),
(180, 137, 56, 1, 50000, 1, 1),
(181, 138, 62, 2, 200000, 1, 1),
(182, 139, 62, 1, 200000, 1, 1),
(183, 140, 62, 1, 200000, 1, 1),
(184, 141, 57, 1, 81000, 1, 1),
(185, 142, 55, 2, 150000, 1, 1);

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
(1, 'TT Nhơn Hòa', 'TTNH', '1.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Nhơn Hòa là một thị trấn thuộc. huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\nThị trấn Nhơn Hòa có vị trí địa lý:\n\nPhía đông giáp xã Ia Hrú\nPhía tây giáp xã Chư Don\nPhía nam giáp xã Ia Phang\nPhía bắc giáp xã Ia Hrú.\nThị trấn Nhơn Hòa có diện tích 21 km², dân số năm 2008 là 10.500 người,[2] mật độ dân số đạt 500 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124125.99329901286!2d108.01171741537772!3d13.53943835605775!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7ee3efa9a14f%3A0x7c4aa5937bd75168!2zTmjGoW4gSMOyYSwgaC4gQ2jGsCBTw6osIEdpYSBMYWk!5e0!3m2!1svi!2s!4v1652773679453!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(2, 'Chư Don', 'CD', '2.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Chư Don là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Chư Don có diện tích 38,90 km², dân số năm 2008 là 1.840 người,mật độ dân số đạt 47 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62062.996086594045!2d108.01981290774307!3d13.539440514109055!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7f5c31acd279%3A0xf19887a8d522f3c2!2zQ2jGsCBEb24sIENoxrAgUMawaCwgR2lhIExhaQ!5e0!3m2!1svi!2s!4v1652773919303!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(3, 'Ia Dreng', 'IAD', '3.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Xã Ia Dreng có vị trí địa lý:\n\nPhía Đông giáp xã Ia Hrú\nPhía Tây giáp xã Ia HLốp và xã Ia Ko\nPhía Nam giáp thị trấn Nhơn Hòa\nPhía Bắc giáp xã Ia Blang và xã Ia HLốp.\nXã Ia Dreng có diện tích 23,52 km², dân số năm 2000 là 2.486 người,mật độ dân số đạt 106 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d62047.64012781074!2d108.03864518194037!3d13.598185981068074!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7fdd3c387103%3A0xe08f16cdbe575100!2zSWEgRHJlbmcsIENoxrAgUMawaCwgR2lhIExhaSwgVmnhu4d0IE5hbQ!5e0!3m2!1svi!2s!4v1652774014862!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(4, 'Ia Hla', 'IAH', '4.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia Hla là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Hla có diện tích 124,47 km², dân số năm 2005 là 2.283 người, mật độ dân số đạt 18 người/km²', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124122.67837580746!2d107.91307426154799!3d13.54579114608469!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316dd438d3f6817f%3A0xd2ab814d43541333!2zSWEgSGxhLCBDaMawIFDGsGgsIEdpYSBMYWksIFZp4buHdCBOYW0!5e0!3m2!1svi!2s!4v1652774064449!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(5, 'Ia Hrú', 'IAHR', '5.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia Hrú là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Hrú có diện tích 39,51 km², dân số năm 1999 là 7.199 người, mật độ dân số đạt 182 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124097.79923402368!2d108.06338686206651!3d13.593377080990042!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7e2e12abc327%3A0xfc69c4d8fdd3f498!2zSWEgSHLDuiwgQ2jGsCBQxrBoLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774114129!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(6, 'Ia Le', 'IAL', '1.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia Le là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Le có diện tích 124,57 km², dân số năm 2006 là 7.195 người, mật độ dân số đạt 58 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d248353.20351929936!2d107.93340751550471!3d13.442085379598138!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e784bee46f5db%3A0x9a12d80d2d59d100!2zSWEgTGUsIGguIENoxrAgU8OqLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774154781!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(7, 'Ia Phang', 'IAP', '2.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia Phang là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Phang có diện tích 127,11 km², dân số năm 2000 là 5.214 người,mật độ dân số đạt 41 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124144.75575540008!2d108.07812826108834!3d13.503426303962975!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e7bfca516a9f9%3A0xae02bbf9d8311a8f!2zSWEgUGhhbmcsIGguIENoxrAgU8OqLCBHaWEgTGFpLCBWaeG7h3QgTmFt!5e0!3m2!1svi!2s!4v1652774196597!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(8, 'Ia Rong', 'IAR', '3.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia Rong là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Rong có diện tích 23,11 km², dân số năm 1999 là 4.518 người, mật độ dân số đạt 195 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7755.312880263414!2d108.10740537442625!3d13.617782811736904!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e809095534abd%3A0x247ba1ae497e629c!2zSWEgUm9uZywgSWEgSHLDuiwgQ2jGsCBQxrBoLCBHaWEgTGFp!5e0!3m2!1svi!2s!4v1652772954399!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>'),
(9, 'Ia Blứ', 'IAB', '4.png', '2022-04-22 16:08:31', 4, '2022-04-22 16:08:31', 1, 1, 1, 'Ia BLứ là một xã thuộc huyện Chư Pưh, tỉnh Gia Lai, Việt Nam.\n\nXã Ia Blứ có diện tích 191,15 km², dân số năm 2006 là 4.688 người,mật độ dân số đạt 25 người/km².', '<iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d124170.66848639994!2d107.98653855820312!3d13.453534700000006!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x316e780cd487fb61%3A0x3b76a5074e67c882!2zVeG7tyBCYW4gTmjDom4gRMOibiBJYSBCIEzhu6k!5e0!3m2!1svi!2s!4v1652774243964!5m2!1svi!2s\" width=\"600\" height=\"450\" style=\"border:0;\" allowfullscreen=\"\" loading=\"lazy\" referrerpolicy=\"no-referrer-when-downgrade\"></iframe>');

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
(51, 5, 'Sản phẩm 1', 'san-pham-1', 'bc926045aab0fc91074d0c87b58df46b.jpg', '2ae45fb26b459012a87b42e838e002ac.jpg', 'Sản phẩm 1', '<p><strong>Sản phẩm 1</strong></p>\r\n', 1, 100, 2, 10, 100000, 90000, '2022-05-19 14:57:10', '10', '2022-05-19 14:57:10', '10', 1, 1, 10, 'a98f6cc1444ad47c7f083545d3d15049.jpg', '', NULL, 0, 4),
(52, 3, 'Sản phẩm 2', 'san-pham-2', '27a7cb8f15d8d3f047c529784db9e66a.jpg', '1eb6b28c97f2eef64641eddc28f25ac2.jpg', 'Sản phẩm 2', '<p>Sản phẩm 2</p>\r\n', 2, 100, 0, 0, 90000, 90000, '2022-05-19 14:57:44', '10', '2022-05-19 14:57:44', '10', 1, 1, 10, '', NULL, NULL, 0, 4),
(53, 2, 'Sản phẩm 3', 'san-pham-3', '8d717e0c21e253e8c1a93817533aa03d.jpg', 'b3dc11f0bccf33373c0fcf82d9195727.jpeg', 'Sản phẩm 3', '<p>Sản phẩm 3</p>\r\n', 3, 12, 0, 0, 150000, 150000, '2022-05-19 14:58:18', '10', '2022-05-19 14:58:18', '10', 1, 1, 10, '', NULL, NULL, 0, 4),
(54, 2, 'Sản phẩm 4', 'san-pham-4', '4debc0822586dd82cc9c010b0e07be3e.jpg', '0e4f2d2dffda41dfedc4cca9b24fc612.jpg', 'Sản phẩm 4', '<p>Sản phẩm 4</p>\r\n', 2, 134, 0, 0, 10000, 10000, '2022-05-19 14:58:48', '10', '2022-05-19 14:58:48', '10', 1, 1, 10, '', NULL, NULL, 0, 4),
(55, 3, 'Sản phẩm 5', 'san-pham-5', '6f3a604689031039e370d803bbd1b75d.jpg', 'bdf4cf04170a919156138513d16997b5.jpeg', 'Sản phẩm 5', '<p>Sản phẩm 5</p>\r\n', 2, 100, 2, 0, 150000, 150000, '2022-05-19 15:00:10', '10', '2022-05-19 15:00:10', '10', 1, 1, 10, '', NULL, NULL, 0, 4),
(56, 3, 'Sản phảm 6', 'san-pham-6', 'c803aea5b15c71c8eea49b8277d30b5e.jpg', 'ca9dd35fa81bf66bf72000b94a379900.jpg', 'thanh19961', '<ul>\r\n	<li>Phần thịt được sử dụng chỉ l&agrave; thịt thăn v&agrave; đ&ugrave;i v&igrave; ở v&ugrave;ng đ&oacute; mới c&oacute; được những miếng thịt to v&agrave; chắc. Sau đ&oacute; l&agrave; tới c&ocirc;ng đoạn l&agrave;m sạch, b&ograve; phải được rửa bằng rượu v&agrave; cắt l&aacute;t ra th&agrave;nh từng miếng nhỏ c&oacute; độ d&agrave;y từ 1 &ndash; 1,5cm. Thịt được tẩm ướp c&ugrave;ng với sả, ớt, rượu vang v&agrave; gia vị đặc trưng ri&ecirc;ng của v&ugrave;ng. Kế đến l&agrave; mang thịt ra phơi nắng từ 1 &ndash; 2g, sau đ&oacute; cho v&agrave;o l&ograve; sấy kh&ocirc; để loại bỏ lượng nước trong thịt. -C&oacute; đầy đủ Giấy tờ bảo đảm ATVSTP - Hạn sử dụng: 06 th&aacute;ng kể từ ng&agrave;y sản xuất (ng&agrave;y sản xuất c&oacute; in tr&ecirc;n bao b&igrave;) - Xuất xứ: Gia Lai Gi&aacute; sản phẩm: 600.000 VND/Kg Bảo quản: Ngăn đ&ocirc;ng của tủ lạnh C&aacute;ch chế biến: -&gt; Cho thịt l&ecirc;n vỉ v&agrave; nướng tr&ecirc;n bếp than hồng (hoặc d&ugrave;ng l&ograve; nướng). Thịt nướng ch&iacute;n r&aacute;m v&agrave;ng hai cạnh c&ugrave;ng m&ugrave;i thơm tỏa ra rất quyến rũ. Khi nướng nhớ trở đều tay để thịt ch&iacute;n đều v&agrave; kh&ocirc;ng bị ch&aacute;y, thịt vẫn giữ được độ ngọt, dai v&agrave; kh&ocirc;ng bị kh&ocirc;. -&gt; Sau khi nướng ch&iacute;n, x&eacute; hoặc cắt th&agrave;nh từng miếng nhỏ. B&ograve; một nắng được ăn k&egrave;m với dưa leo, chuối ch&aacute;t, c&aacute;c loại rau thơm v&agrave; đặc biệt l&agrave; muối ớt kiến v&agrave;ng - loại thức chấm rất lạ miệng, c&oacute; vị chua chua của con kiến v&agrave;ng.</li>\r\n	<li>Ph&ugrave; hợp: L&agrave;m m&oacute;n nhậu, qu&agrave; tặng người th&acirc;n, bạn b&egrave;.</li>\r\n</ul>\r\n', 9, 90, 0, 0, 50000, 50000, '2022-05-19 15:02:05', '2', '2022-05-19 15:02:05', '2', 1, 1, 2, 'f45b9b67e287dba54b9dfac9f263aaaf.jpg', '', NULL, 0, 4),
(57, 4, 'Sản phẩm 7', 'san-pham-7', 'cc81b54d240b12bed2319b6412bcb593.jpg', '05dd1be9219dfe3bff7cb523658a3fd3.jpg', 'Sản phẩm 7', '<ul dir=\"ltr\">\r\n	<li>Sản phẩm B&ograve; Kh&ocirc; Huy Vũ được kh&aacute;ch h&agrave;ng biết đến với hương vị thơm ngon, đặc trưng mang đậm n&eacute;t truyền thống, với nghề gia truyền từ năm 1995 sử dụng nguy&ecirc;n liệu b&ograve; tươi l&agrave; b&ograve; đồng b&agrave;o thả r&ocirc;ng l&agrave; giống b&ograve; địa phương của người đồng b&agrave;o ở Gia Lai. Sản phẩm đạt chứng nhận OCOP 4 sao, đạt chứng nhận sản phẩm C&ocirc;ng Nghiệp N&ocirc;ng Th&ocirc;n Ti&ecirc;u Biểu Cấp Khu Vực Miền Trung</li>\r\n</ul>\r\n', 2, 100, 1, 10, 90000, 81000, '2022-05-19 15:02:57', '2', '2022-05-19 15:02:57', '2', 1, 1, 2, '186b0d80da3c2bc9f6cc0be32dbcfb32.jpg', '', NULL, 0, 4),
(58, 3, 'Sản phẩm 8', 'san-pham-8', '238a187c11f6dd71c5b0a0d921e0ffcd.jpg', 'f9576fa3277b30aa487e3058a70ff3c0.jpg', 'Sản phẩm 8', '<p>Sản phẩm 8</p>\r\n', 2, 1, 0, 0, 900000, 900000, '2022-05-19 15:04:07', '2', '2022-05-19 15:04:07', '2', 1, 1, 2, '2c08e004dd3bf6b97d7c0b98591cb325.jpg', '', NULL, 0, 4),
(59, 5, 'Sản phẩm 9', 'san-pham-9', '755e15d68385b7db4a9c73455a0aea4f.jpg', '892b4d723de04e5f87c10b0d0bdec27a.png', 'Sản phẩm 9', '<p>Sản phẩm 9</p>\r\n', 1, 50, 0, 0, 890012, 890012, '2022-05-19 15:04:52', '2', '2022-05-19 15:04:52', '2', 1, 1, 2, '617781a407dee3ae6ac065e4517d6daa.jpg', 'ff1511b4cf9bf133ea8d3c4934b20d55.jpg', NULL, 0, 4),
(60, 3, 'Sản phẩm 10', 'san-pham-10', '5aa6b402d55ebc8ef3b560d2f6bb5b87.jpeg', '', 'Sản phẩm 10', '<ul dir=\"ltr\">\r\n	<li>Sản phẩm thịt B&ograve; Kh&ocirc; Huy Vũ l&agrave; sản phẩm đặc trưng của Huyện Đak Đoa;</li>\r\n	<li>Tất cả sản phẩm b&ograve; kh&ocirc; đều kh&ocirc;ng sử dụng chất bảo quản cũng như phẩm m&agrave;u;</li>\r\n	<li>Bạn sẽ thấy m&agrave;u sắc kh&ocirc;ng được bắt mắt nhưng khi ăn mới cảm nhận được vị ngọt đậm đ&agrave; của thịt b&ograve;, thịt dai mềm;</li>\r\n	<li>Ch&uacute;ng t&ocirc;i lu&ocirc;n lắng nghe v&agrave; thay đổi kh&ocirc;ng ngừng qua từng ng&agrave;y, để mang đến cho kh&aacute;ch h&agrave;ng một sản phẩm tốt nhất, chất lượng nhất.</li>\r\n</ul>\r\n', 3, 10, 0, 10, 90000, 81000, '2022-05-19 15:11:35', '2', '2022-05-27 14:19:59', '1', 1, 1, 2, '316ef7a90ab34a72a6794255a9e6759e.jpg', 'd89f94b5e10b2ac04774c6cf436a376a.jpg', NULL, 0, 5),
(61, 1, 'Sản phẩm 11', 'san-pham-11', 'bf6ac842ee40b8e9992e91f5821e2f4a.jpg', '', 'Sản phẩm 11', '<p>Sản phẩm 11</p>\r\n', 2, 19, 0, 0, 90000, 90000, '2022-05-19 15:12:35', '2', '2022-06-27 09:36:00', '1', 1, 0, 2, 'd2659003e9d40d68c6506e92d57c68df.jpg', 'f20fb23421685fbab94cd62a294daeef.jpeg', NULL, 0, 4),
(62, 3, 'Bò khô huy vũ', 'bo-kho-huy-vu', '3f2b44c010eaaaeeea813bbe3af89622.jpg', '', 'Bò khô Huy Vũ', '<p><span style=\"color:#e74c3c\"><strong>B&Ograve; HUY VŨ</strong></span> được lựa chọn từ những miếng thịt nhiều đạm, ướp đẫm gia vị thơm ngon, sấy kh&ocirc; bằng than c&ugrave;ng vị sả thơm phức &amp; ớt tươi . Ăn v&agrave;o sẽ c&oacute; vị mằn mặn, ngọt thanh quyện với cay nồng, rất th&iacute;ch hợp cho những ph&uacute;t gi&acirc;y b&ecirc;n gia đ&igrave;nh trong những ng&agrave;y khủng hoảng v&igrave; dịch bệnh l&uacute;c n&agrave;y <strong>H&Atilde;Y THỬ NGAY, BẠN C&Ograve;N CHẦN CHỪ G&Igrave; NỮA!</strong></p>\r\n', 3, 100, 3, 0, 200000, 200000, '2022-05-23 14:45:14', '18', '2022-05-27 14:25:02', '1', 1, 1, 18, '', NULL, NULL, 1, 2),
(63, 3, 'Bánh mì chương mập', 'banh-mi-chuong-map', 'd7992aa1eebb2c272ed43d22fdb8120c.jpg', '', 'Bánh mì chương mập', '<p><span style=\"color:#e74c3c\">B&aacute;nh m&igrave; chương mập</span></p>\r\n', 1, 100, 0, 0, 5000, 5000, '2022-06-27 09:17:51', '20', '2022-06-27 09:35:21', '1', 1, 1, 20, '', NULL, NULL, 0, 4);

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
(3, 'trang chu 1', 'trang-chu', 'san-pham-chu-luc1.jpg', '2019-07-03 17:05:52', '1', '2022-04-26 11:04:48', '', 1, 1),
(4, 'slider trang chu 2', 'slider-trang-chu-2', 'ocop1.jpg', '2019-07-03 17:06:38', '1', '2022-04-26 11:04:37', '', 1, 1),
(5, 'slider trang chu 3', 'slider-trang-chu-3', '17683f26daf72fa976e61.jpg', '2019-07-03 17:06:58', '1', '2022-04-26 11:04:22', '', 1, 1),
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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `db_product`
--
ALTER TABLE `db_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

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
