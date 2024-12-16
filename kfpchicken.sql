-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2024 lúc 10:50 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `kfpchicken`
--
CREATE DATABASE IF NOT EXISTS `kfpchicken` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `kfpchicken`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `anh`
--

DROP TABLE IF EXISTS `anh`;
CREATE TABLE `anh` (
  `maAnh` int(10) NOT NULL,
  `maSP` int(10) DEFAULT NULL,
  `duongDan` varchar(255) DEFAULT NULL,
  `chuThich` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `anh`
--

INSERT INTO `anh` (`maAnh`, `maSP`, `duongDan`, `chuThich`) VALUES
(1, 1, './assets/img/product/product-1.png', 'ảnh thực đơn'),
(2, 2, './assets/img/product/product-2.png', 'ảnh thực đơn'),
(3, 3, './assets/img/product/product-3.png', 'ảnh thực đơn'),
(4, 4, './assets/img/product/product-4.png', 'ảnh thực đơn'),
(5, 5, './assets/img/product/product-5.png', 'ảnh thực đơn'),
(6, 6, './assets/img/product/product-6.png', 'ảnh thực đơn'),
(7, 7, './assets/img/product/product-7.png', 'ảnh thực đơn'),
(8, 8, './assets/img/product/product-8.jpg', 'ảnh thực đơn'),
(9, 9, './assets/img/product/product-9.png', 'ảnh thực đơn'),
(10, 10, './assets/img/product/product-10.png', 'ảnh thực đơn'),
(11, 11, './assets/img/product/product-11.png', 'ảnh thực đơn'),
(12, 12, './assets/img/product/product-12.png', 'ảnh thực đơn'),
(13, 13, './assets/img/product/product-13.png', 'ảnh thực đơn'),
(14, 14, './assets/img/product/product-14.png', 'ảnh thực đơn'),
(15, 15, './assets/img/product/product-15.png', 'ảnh thực đơn'),
(16, 16, './assets/img/product/product-16.png', 'ảnh thực đơn'),
(17, 17, './assets/img/product/product-17.png', 'ảnh thực đơn'),
(18, 18, './assets/img/product/product-18.png', 'ảnh thực đơn'),
(19, 19, './assets/img/product/product-19.png', 'ảnh thực đơn'),
(20, 20, './assets/img/product/product-20.png', 'ảnh thực đơn'),
(21, 21, './assets/img/product/product-21.png', 'ảnh thực đơn'),
(22, 22, './assets/img/product/product-22.png', 'ảnh thực đơn'),
(23, 23, './assets/img/product/product-23.png', 'ảnh thực đơn'),
(24, 24, './assets/img/product/product-24.png', 'ảnh thực đơn'),
(25, 25, './assets/img/product/product-25.png', 'ảnh thực đơn'),
(26, 26, './assets/img/product/product-26.png', 'ảnh thực đơn'),
(27, 27, './assets/img/product/product-27.png', 'ảnh thực đơn'),
(28, 28, './assets/img/product/product-28.png', 'ảnh thực đơn'),
(29, 29, './assets/img/product/product-29.png', 'ảnh thực đơn'),
(30, 30, './assets/img/product/product-30.png', 'ảnh thực đơn'),
(31, 31, './assets/img/product/product-31.png', 'ảnh thực đơn'),
(32, 32, './assets/img/product/product-32.png', 'ảnh thực đơn'),
(33, 33, './assets/img/product/product-33.png', 'ảnh thực đơn'),
(34, 34, './assets/img/product/product-34.png', 'ảnh thực đơn'),
(35, 35, './assets/img/product/product-35.png', 'ảnh thực đơn'),
(36, 36, './assets/img/product/product-36.png', 'ảnh thực đơn'),
(37, 37, './assets/img/product/product-37.png', 'ảnh thực đơn'),
(38, 38, './assets/img/product/product-38.png', 'ảnh thực đơn'),
(39, 39, './assets/img/product/product-39.png', 'ảnh thực đơn'),
(40, 40, './assets/img/product/product-40.png', 'ảnh thực đơn'),
(41, 41, './assets/img/product/product-41.png', 'ảnh thực đơn'),
(42, 42, './assets/img/product/product-42.png', 'ảnh thực đơn'),
(43, 43, './assets/img/product/product-43.png', 'ảnh thực đơn'),
(44, 45, './assets/img/product/product-44.png', 'ảnh thực đơn'),
(45, 46, './assets/img/product/product-45.png', 'ảnh thực đơn'),
(46, 46, './assets/img/product/product-46.png', 'ảnh thực đơn'),
(47, 47, './assets/img/product/product-47.png', 'ảnh thực đơn'),
(48, 48, './assets/img/product/product-48.png', 'ảnh thực đơn'),
(49, NULL, './assets/img/product/448903605_853908533461654_6641663514184545336_n.jpg', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `chitiet_donhang`
--

DROP TABLE IF EXISTS `chitiet_donhang`;
CREATE TABLE `chitiet_donhang` (
  `maDH` int(10) DEFAULT NULL,
  `maSP` int(10) NOT NULL,
  `soLuongDatHang` int(10) DEFAULT NULL,
  `thueVAT` double NOT NULL DEFAULT 0.1,
  `tongTien` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `chitiet_donhang`
--

INSERT INTO `chitiet_donhang` (`maDH`, `maSP`, `soLuongDatHang`, `thueVAT`, `tongTien`) VALUES
(39845, 3, 2, 0.1, 107800),
(39845, 5, 2, 0.1, 437800),
(39845, 6, 3, 0.1, 161700),
(77223, 4, 1, 0.1, 130900),
(89129, 16, 1, 0.1, 306900),
(89129, 14, 1, 0.1, 174900),
(49556, 16, 1, 0.1, 306900),
(49556, 11, 1, 0.1, 104500),
(9300, 3, 1, 0.1, 53900),
(80206, 5, 1, 0.1, 218900),
(75318, 6, 1, 0.1, 53900),
(54268, 3, 1, 0.1, 53900),
(71496, 6, 1, 0.1, 53900),
(93321, 7, 1, 0.1, 196900),
(2855, 28, 1, 0.1, 361900);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `donhang`
--

DROP TABLE IF EXISTS `donhang`;
CREATE TABLE `donhang` (
  `maDH` int(10) NOT NULL,
  `maKH` int(10) DEFAULT NULL,
  `diaChiNhanHang` varchar(255) DEFAULT NULL,
  `soDienThoai` varchar(50) DEFAULT NULL,
  `ngayDatHang` timestamp NULL DEFAULT current_timestamp(),
  `ngayNhanHang` timestamp NULL DEFAULT NULL,
  `trangThai` varchar(50) DEFAULT 'Chưa giao',
  `thanhToan` varchar(50) DEFAULT NULL,
  `phiVanChuyen` double DEFAULT NULL,
  `signature` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `donhang`
--

INSERT INTO `donhang` (`maDH`, `maKH`, `diaChiNhanHang`, `soDienThoai`, `ngayDatHang`, `ngayNhanHang`, `trangThai`, `thanhToan`, `phiVanChuyen`, `signature`) VALUES
(2855, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 21:47:55', '2024-12-14 23:47:55', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(9300, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 18:17:57', '2024-12-14 20:17:57', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(39845, 7, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '944126980', '2024-07-14 06:39:23', '2024-07-14 08:39:23', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(49556, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 18:17:12', '2024-12-14 20:17:12', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(54268, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 21:15:55', '2024-12-14 23:15:55', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(71496, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 21:40:39', '2024-12-14 23:40:39', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(75318, 9, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 18:56:30', '2024-12-14 20:56:30', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(77223, 8, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 16:47:44', '2024-12-14 18:47:44', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(80206, 9, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 18:54:11', '2024-12-14 20:54:11', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL),
(89129, 8, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 16:51:23', '2024-12-14 18:51:23', 'Đang Giao', 'Chưa Thanh Toán', 51503, NULL),
(93321, 11, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '342761815', '2024-12-14 21:43:28', '2024-12-14 23:43:28', 'Chưa Giao', 'Chưa thanh toán', 51503, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
CREATE TABLE `khachhang` (
  `maKH` int(10) NOT NULL,
  `tenKH` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `matkhau` varchar(5000) DEFAULT NULL,
  `soDT` int(11) DEFAULT NULL,
  `gioiTinh` varchar(5) DEFAULT NULL,
  `ngaySinh` date DEFAULT '2000-01-01',
  `diaChi` varchar(100) DEFAULT NULL,
  `maTC` int(10) DEFAULT 0,
  `code` varchar(50) DEFAULT NULL,
  `picture` varchar(5000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `khachhang`
--

INSERT INTO `khachhang` (`maKH`, `tenKH`, `email`, `matkhau`, `soDT`, `gioiTinh`, `ngaySinh`, `diaChi`, `maTC`, `code`, `picture`) VALUES
(9, 'locadmin', 'tuitenlocbikhung@gmail.com', '$2a$10$658giiuzqmrE57DWfh5onOYlwOa3nLIkDSf06jtlmkGibXTMrEmp2', 342761815, 'Nam', '2024-12-17', 'tp.hcm ', 2, '289418', NULL),
(11, 'loc hehe', 'tranlocmom@gmail.com', '$2a$10$u7/pDNDUCau7hm1bhNMOn.M.r0vmzuUNs0Y4f3CuQDBfMNnvjgpl.', 342761815, 'Nam', '2024-12-01', 'tp.hcm ', 1, '450604', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `level` varchar(50) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `beforeValue` text NOT NULL,
  `afterValue` text NOT NULL,
  `createAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `level`, `ip`, `address`, `beforeValue`, `afterValue`, `createAt`) VALUES
(25, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản trijoker0507@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-07-03 14:17:32'),
(26, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản trijoker0507@gmail.com chưa xác thực', 'Tài khoản trijoker0507@gmail.com xác thực thành công', '2024-07-03 14:17:56'),
(27, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 1,}', '2024-07-03 14:18:08'),
(28, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 1,}', '2024-07-03 14:28:21'),
(29, 'INFO', '0:0:0:0:0:0:0:1', 'user', 'null', '{maDH: 47987,maKH: 6,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 944126980,ngayDatHang: 2024-07-03T14:29:16.118980500,ngayNhanHang: 2024-07-03T16:29:16.118980500,trangThai: Đang chuẩn bị,thanhToan: COD,phiVanChuyen: 51503.0}', '2024-07-03 14:29:16'),
(30, 'INFO', '0:0:0:0:0:0:0:1', 'user', 'null', '{maDH: 54916,maKH: 6,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 944126980,ngayDatHang: 2024-07-03T14:30:04.685980800,ngayNhanHang: 2024-07-03T16:30:04.685980800,trangThai: Đang chuẩn bị,thanhToan: COD,phiVanChuyen: 51503.0}', '2024-07-03 14:30:04'),
(31, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 1,}', '2024-07-03 14:34:38'),
(32, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 2,}', '2024-07-03 14:40:10'),
(33, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 2,}', '2024-07-03 14:43:23'),
(34, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 2,}', '2024-07-03 15:04:12'),
(35, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 6,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 2,}', '2024-07-03 15:47:08'),
(36, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản trijoker0507@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-07-14 13:38:07'),
(37, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản trijoker0507@gmail.com chưa xác thực', 'Tài khoản trijoker0507@gmail.com xác thực thành công', '2024-07-14 13:38:26'),
(38, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 7,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 1,}', '2024-07-14 13:38:38'),
(39, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 39845,maKH: 7,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 944126980,ngayDatHang: 2024-07-14T13:39:23.868525,ngayNhanHang: 2024-07-14T15:39:23.868525,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-07-14 13:39:23'),
(40, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'KhachHang{maKH=7, tenKH=\'Dương Trí Nguyên\', email=\'trijoker0507@gmail.com\', matKhau=\'null\', soDT=\'944126980\', gioiTinh=\'Nam\', ngaySinh=2003-07-05, diaChi=\'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh\', maTC=1, picture=\'null\'}', 'Tài khoản trijoker0507@gmail.com đổi mật khẩu thành công', '2024-07-14 13:40:32'),
(41, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 7,tenKH: Dương Trí Nguyên,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 1,}', '2024-07-14 13:40:41'),
(42, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 7,tenKH: David,email: trijoker0507@gmail.com,matKhau: null,soDT: 944126980,diaChi: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,maTC: 2,}', '2024-07-14 13:41:51'),
(43, 'ALERT', '0:0:0:0:0:0:0:1', 'khachhang', 'KhachHang{maKH=7, tenKH=\'null\', email=\'null\', matKhau=\'null\', soDT=\'null\', gioiTinh=\'null\', ngaySinh=null, diaChi=\'null\', maTC=0, picture=\'null\'}', ' ', '2024-07-14 13:43:23'),
(44, 'DANGER', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại', '2024-07-14 13:44:00'),
(45, 'DANGER', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại', '2024-07-14 13:44:07'),
(46, 'DANGER', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại', '2024-07-14 13:44:11'),
(47, 'DANGER', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại', '2024-07-14 13:44:14'),
(48, 'WARNING', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại quá nhiều lần', '2024-07-14 13:44:17'),
(49, 'WARNING', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại quá nhiều lần', '2024-07-14 13:44:21'),
(50, 'WARNING', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại quá nhiều lần', '2024-07-14 13:44:33'),
(51, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản tranlocmom@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-12-14 23:43:43'),
(52, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản tranlocmom@gmail.com chưa xác thực', 'Tài khoản tranlocmom@gmail.com xác thực thành công', '2024-12-14 23:44:29'),
(53, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 8,tenKH: loc ne,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-14 23:44:32'),
(54, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 77223,maKH: 8,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-14T23:47:44.464862300,ngayNhanHang: 2024-12-15T01:47:44.464862300,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-14 23:47:44'),
(55, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 8,tenKH: loc ne,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-14 23:50:30'),
(56, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 89129,maKH: 8,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-14T23:51:23.815298600,ngayNhanHang: 2024-12-15T01:51:23.815298600,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-14 23:51:23'),
(57, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản tuitenlocbikhung@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-12-14 23:57:19'),
(58, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản tuitenlocbikhung@gmail.com chưa xác thực', 'Tài khoản tuitenlocbikhung@gmail.com xác thực thành công', '2024-12-14 23:58:42'),
(59, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-14 23:58:45'),
(60, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 2,}', '2024-12-14 23:59:23'),
(61, 'WARNING', '0:0:0:0:0:0:0:1', 'donhang', '{maDH: 89129,maKH: 8,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: null,ngayDatHang: 2024-12-14T23:51:23,ngayNhanHang: 2024-12-15T01:51:23,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '{maDH: 89129,maKH: 8,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: null,ngayDatHang: 2024-12-15T00:00:53.403399900,ngayNhanHang: 2024-12-15T01:51:23,trangThai: Đang Giao,thanhToan: Chưa Thanh Toán,phiVanChuyen: 51503.0}', '2024-12-15 00:00:53'),
(62, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản tranlocmom@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-12-15 00:49:17'),
(63, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản tranlocmom@gmail.com chưa xác thực', 'Tài khoản tranlocmom@gmail.com xác thực thành công', '2024-12-15 00:49:39'),
(64, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng ký tài khoản', 'Tài khoản tranlocmom@gmail.com đăng ký thành công nhưng chưa xác thực', '2024-12-15 00:58:16'),
(65, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Tài khoản tranlocmom@gmail.com chưa xác thực', 'Tài khoản tranlocmom@gmail.com xác thực thành công', '2024-12-15 00:58:27'),
(66, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 2,}', '2024-12-15 01:16:10'),
(67, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 01:16:39'),
(68, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 49556,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T01:17:12.845798300,ngayNhanHang: 2024-12-15T03:17:12.845798300,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 01:17:12'),
(69, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 9300,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T01:17:57.745093,ngayNhanHang: 2024-12-15T03:17:57.745093,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 01:17:57'),
(70, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 2,}', '2024-12-15 01:18:09'),
(71, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 2,}', '2024-12-15 01:34:13'),
(72, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 9,tenKH: locadmin,email: tuitenlocbikhung@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 2,}', '2024-12-15 01:38:53'),
(73, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 80206,maKH: 9,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T01:54:11.477868600,ngayNhanHang: 2024-12-15T03:54:11.477868600,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 01:54:11'),
(74, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 75318,maKH: 9,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T01:56:30.733981200,ngayNhanHang: 2024-12-15T03:56:30.733981200,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 01:56:30'),
(75, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 02:38:23'),
(76, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 04:04:32'),
(77, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 54268,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T04:15:55.558431300,ngayNhanHang: 2024-12-15T06:15:55.558431300,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 04:15:55'),
(78, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 04:23:41'),
(79, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 04:24:34'),
(80, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 71496,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T04:40:39.662138400,ngayNhanHang: 2024-12-15T06:40:39.662138400,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 04:40:39'),
(81, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 04:42:53'),
(82, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 93321,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T04:43:28.307137700,ngayNhanHang: 2024-12-15T06:43:28.307137700,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 04:43:28'),
(83, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', '{maKH: 11,tenKH: loc hehe,email: tranlocmom@gmail.com,matKhau: null,soDT: 342761815,diaChi: tp.hcm ,maTC: 1,}', '2024-12-15 04:45:43'),
(84, 'INFO', '0:0:0:0:0:0:0:1', 'khachhang', 'null', '{maDH: 2855,maKH: 11,diaChiNhanHang: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh,soDienThoai: 342761815,ngayDatHang: 2024-12-15T04:47:55.907151400,ngayNhanHang: 2024-12-15T06:47:55.907151400,trangThai: Chưa Giao,thanhToan: Chưa thanh toán,phiVanChuyen: 51503.0}', '2024-12-15 04:47:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `nguyenlieu`
--

DROP TABLE IF EXISTS `nguyenlieu`;
CREATE TABLE `nguyenlieu` (
  `id` int(11) NOT NULL,
  `nguyenlieu` varchar(50) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `noidung` varchar(500) DEFAULT NULL,
  `loai` varchar(500) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `donvi` varchar(10) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `tong` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
CREATE TABLE `sanpham` (
  `maSP` int(10) NOT NULL,
  `tenSP` varchar(50) DEFAULT NULL,
  `giaGoc` double DEFAULT NULL,
  `giaGiam` double DEFAULT NULL,
  `soLuongTonKho` int(25) DEFAULT NULL,
  `moTa` varchar(100) DEFAULT NULL,
  `maTL` int(10) DEFAULT NULL,
  `maAnh` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `sanpham`
--

INSERT INTO `sanpham` (`maSP`, `tenSP`, `giaGoc`, `giaGiam`, `soLuongTonKho`, `moTa`, `maTL`, `maAnh`) VALUES
(1, 'Combo B - Gà giòn sốt me', 257000, 199000, 0, '- 2 Miếng gà giòn sốt me\r\n- 2 Miếng gà có xương (lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây nghiền', 1, 1),
(2, 'Combo A - Gà Giòn Sốt Me', 143000, 119000, 0, '- 2 Miếng gà giòn sốt me\r\n- 1 Bắp cải trộn cỡ tiêu chuẩn\r\n- 1 Chai nước ngọt Coca-Cola 390ml', 1, 2),
(3, '1 miếng Gà Giòn Sốt Me', 49000, 0, 21, '', 1, 3),
(4, 'Combo A - Gà Sốt Bơ Tỏi & Thảo Mộc', 155000, 119000, 24, '- 2 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 1 Bánh quy bơ mật ong\r\n- 1 Món ăn kèm tiêu chuẩn tùy chọn (Bắ', 2, 4),
(5, 'Combo B - Gà Sốt Bơ Tỏi & Thảo Mộc', 257000, 199000, 21, '- 2 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 1 Bánh quy bơ mật ong\r\n- 1 Món ăn kèm tiêu chuẩn tùy chọn (Bắ', 2, 5),
(6, '1 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 49000, 0, 20, '', 2, 6),
(7, '4 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 196000, 179000, 24, '- 4 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 3 Tương ớt + 1 tương cà', 2, 7),
(8, '7 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 343000, 299000, 0, '- 7 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 5 Tương ớt + 2 tương cà', 2, 8),
(9, 'Combo Giòn Tan A', 104000, 95000, 25, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Nước ngọt\r\n- 2 Tương ớt + 1 Tương cà', 3, 9),
(10, 'Combo Giòn Tan B', 105000, 95000, 25, '1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Miếng gà giòn không xương (lựa chọn vị cay', 3, 10),
(11, 'Combo Giòn Tan C', 105000, 95000, 24, '- 1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Khuỷu cánh gà cay\r\n- 1 Nước ngọt\r\n- 2 Tư', 3, 11),
(12, 'Combo Giòn Tan D', 114000, 95000, 25, '- 1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Bánh cuộn gà không xương ( lựa chọn vị c', 3, 12),
(13, 'Combo VUI VẺ A', 179000, 159000, 25, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Burger tôm (lựa chọn vị cay/ không cay)\r', 4, 13),
(14, 'Combo VUI VẺ B', 194000, 159000, 24, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Miếng gà giòn không xương (lựa chọn vị c', 4, 14),
(15, 'Combo VUI VẺ C', 218000, 189000, 25, '- 3 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây chiên phô mai\r\n- 2 Nước ngọt\r\n', 4, 15),
(16, 'Combo Nhóm A', 351000, 279000, 23, '- 5 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Bánh cuộn Zesty Crunch (lựa chọn vị cay/', 5, 16),
(17, 'Combo VUI VẺ D', 257000, 199000, 25, '- 3 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Burger gà cổ điển\r\n- 1 Khoai tây chiên v', 4, 17),
(18, 'Combo Nhóm B', 504000, 389000, 24, '- 7 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Burger gà cổ điển\r\n- 1 Bánh cuộn gà giòn', 5, 18),
(19, 'Combo Nhóm C', 608000, 499000, 25, '- 9 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Burger tôm (lựa chọn vị cay/ không cay)\r', 5, 19),
(20, 'Combo Tiết Kiệm A', 84000, 65000, 25, '- 1 Miếng gà rán có xương ( lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây nghiền tiêu chuẩn\r\n- 1 Nước n', 6, 20),
(21, 'Combo Tiết Kiệm B', 94000, 65000, 25, '- 1 Bánh cuộn gà giòn không xương ( lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây nghiền tiêu chuẩn\r\n- ', 6, 21),
(22, 'Combo Tiết Kiệm C', 94000, 65000, 24, '- 1 Burger gà cổ điển\r\n- 1 Khoai tây nghiền tiêu chuẩn\r\n- 1 Nước ngọt\r\n- 1 Tương ớt + 1 Tương cà', 6, 22),
(23, 'Combo Tiết Kiệm D', 85000, 65000, 25, '- 2 Miếng gà giòn không xương ( lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây nghiền tiêu chuẩn\r\n- 1 Nư', 6, 23),
(24, 'Combo CƠM KHUỶU CÁNH GÀ', 75000, 59000, 25, '- 2 Khuỷu cánh gà sốt chua ngọt\r\n- 1 Cơm trắng+ bắp cải trộn\r\n- 1 Nước ngọt\r\n- 1 Tương ớt', 7, 24),
(25, 'Combo CƠM GÀ GIÒN KHÔNG XƯƠNG', 75000, 59000, 25, '- 2 Miếng gà giòn không xương sốt chua ngọt\r\n- 1 Cơm trắng+ salad\r\n- 1 Nước ngọt\r\n- 1 Tương ớt', 7, 25),
(26, 'Combo CƠM KHUỶU CÁNH GÀ & GÀ GIÒN KHÔNG XƯƠNG', 75000, 59000, 25, '- 1 Miếng gà giòn không xương\r\n- 1 Khuỷu cánh gà sốt chua ngọt\r\n- 1 Cơm trắng+ salad\r\n- 1 Nước ngọt\r', 7, 26),
(27, 'CHICKEN BOX – 5 MIẾNG GÀ RÁN', 195000, 189000, 25, '- 5 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 4 Tương ớt + 2 Tương cà', 8, 27),
(28, 'CHICKEN BOX – 9 MIẾNG GÀ RÁN', 351000, 329000, 24, '- 9 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 8 Tương ớt + 4 Tương cà', 8, 28),
(29, 'CHICKEN BOX – 12 MIẾNG GÀ RÁN', 468000, 419000, 25, '- 12 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 10 Tương ớt + 5 Tương cà', 8, 29),
(30, 'GÀ RÁN CÓ XƯƠNG – 1 MIẾNG', 39000, 0, 25, '- 1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Tương ớt + 1 Tương cà', 9, 30),
(31, 'GÀ GIÒN KHÔNG XƯƠNG – 6 MIẾNG', 95000, 0, 25, '- 6 Miếng gà giòn không xương (lựa chọn vị cay/ không cay)\r\n - 1 Sốt mù tạt mật ong\r\n- 2 Tương ớt + ', 9, 31),
(32, 'KHUỶU CÁNH GÀ CAY – 6 MIẾNG', 95000, 0, 25, '- 6 Khuỷu cánh gà cay\r\n- 2 Tương ớt + 2 Tương cà', 9, 32),
(33, 'Burger Mexicana', 69000, 0, 25, '- Burger Mexicana ( lựa chọn vị cay/ không cay)\r\n- 1 Tương ớt + 1 Tương cà', 10, 33),
(34, 'Burger Tex Supreme', 59000, 0, 25, '- Burger Tex Supreme ( lựa chọn vị cay/ không cay)\r\n- 1 Tương ớt + 1 Tương cà', 10, 34),
(35, 'Burger Tôm', 49000, 0, 25, '- Burger Tôm\r\n- 1 Tương ớt + 1 Tương cà', 10, 35),
(36, 'Bánh cuộn Mexicana', 69000, 0, 25, '- Bánh cuộn Mexicana ( lựa chọn vị cay/ không cay)\r\n- 1 Tương ớt + 1 Tương cà', 11, 36),
(37, 'Bánh cuộn Tex', 59000, 0, 25, '- Bánh cuộn Tex ( lựa chọn vị cay/ không cay)\r\n- 1 Tương ớt + 1 Tương cà', 11, 37),
(38, 'Khoai tây chiên phô mai', 49000, 0, 25, '', 12, 38),
(39, 'Khoai tây chiên cỡ lớn', 45000, 0, 25, '', 12, 39),
(40, 'Khoai tây chiên cỡ vừa', 29000, 0, 25, '', 12, 40),
(41, 'Bắp cải trộn cỡ lớn', 45000, 0, 25, '', 12, 41),
(42, 'Bắp cải trộn cỡ vừa', 29000, 0, 25, '', 12, 42),
(43, 'Khoai tây nghiền cỡ lớn', 45000, 0, 25, '', 12, 43),
(44, 'Khoai tây nghiền cỡ vừa', 29000, 0, 25, '', 12, 44),
(45, '01 bánh quy bơ mật ong', 12000, 0, 25, '', 12, 45),
(46, '03 bánh quy bơ mật ong', 29000, 0, 25, '', 12, 46),
(47, '05 bánh quy bơ mật ong', 49000, 0, 25, '', 12, 47),
(48, 'Cơm trắng', 10000, 0, 25, '', 12, 48);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `theloai`
--

DROP TABLE IF EXISTS `theloai`;
CREATE TABLE `theloai` (
  `maTL` int(10) NOT NULL,
  `tenTL` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `theloai`
--

INSERT INTO `theloai` (`maTL`, `tenTL`) VALUES
(0, 'KHÁC'),
(1, 'GÀ GIÒN SỐT ME'),
(2, 'GÀ SỐT BƠ TỎI & THẢO MỘC'),
(3, 'COMBO GÀ RÁN (1 NGƯỜI)'),
(4, 'COMBO GÀ RÁN (2 NGƯỜI)'),
(5, 'COMBO GIA ĐÌNH & BẠN BÈ'),
(6, 'COMBO TIẾT KIỆM'),
(7, 'COMBO CƠM'),
(8, 'SET GÀ RÁN CÓ XƯƠNG'),
(9, 'CÁC MÓN GÀ RÁN'),
(10, 'BURGER'),
(11, 'BÁNH CUỘN'),
(12, 'CÁC MÓN ĂN KÈM');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `truycap`
--

DROP TABLE IF EXISTS `truycap`;
CREATE TABLE `truycap` (
  `maTC` int(10) NOT NULL,
  `tinhTrang` varchar(50) DEFAULT 'Chưa xác thực'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `truycap`
--

INSERT INTO `truycap` (`maTC`, `tinhTrang`) VALUES
(-1, 'Cấm'),
(0, 'Chưa xác thực'),
(1, 'Đã xác thực'),
(2, 'Quản trị viên'),
(3, 'Quản lý Khách Hàng'),
(4, 'Quản lý Đơn Hàng'),
(5, 'Quản lý Sản Phẩm');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `userkey`
--

DROP TABLE IF EXISTS `userkey`;
CREATE TABLE `userkey` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `publickey` text DEFAULT NULL,
  `creatAt` timestamp NULL DEFAULT current_timestamp(),
  `isActive` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `userkey`
--

INSERT INTO `userkey` (`id`, `user_id`, `publickey`, `creatAt`, `isActive`) VALUES
(1, 11, 'MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAsCn2na8ENB8Gd2/aeY8fyWWChqTg9RlB/ewRLlSE5o/x/WDswYtUmbOPomray2Fl2TWZJ6PPhk1pbO5Vtnpi6MGKrZ8Yw0EoS7/hR/RGFtncPdg6rgOUtyANL0XbVey589SmbC78hLyvtM6DE+DRh8YAIVfQ2b0W8qr7jr5+1asHLhyeJsdVnJz2zkyXZOCW9yDZzRF0lykzTHVJZtJaqITSb2UEfnjVFoiHcHCXTJss8E5mpBIsDBpwgBCacHQ2QtK5yd0IsV06FaKeCfA7DcLZMfNWPnGlxs1t/EMGVAsithAaYM4WWFS9/eUu5YAVxd8VSBlPtzw/HUuqb1uNXQIDAQAB', '2024-12-14 17:58:31', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `xacthuc`
--

DROP TABLE IF EXISTS `xacthuc`;
CREATE TABLE `xacthuc` (
  `id` int(255) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `maMatKhau` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `anh`
--
ALTER TABLE `anh`
  ADD PRIMARY KEY (`maAnh`),
  ADD KEY `FK_anh_sanpham` (`maSP`);

--
-- Chỉ mục cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  ADD KEY `FK_chitiet_donhang_donhang` (`maDH`),
  ADD KEY `FK_chitiet_donhang_sanpham` (`maSP`);

--
-- Chỉ mục cho bảng `donhang`
--
ALTER TABLE `donhang`
  ADD PRIMARY KEY (`maDH`);

--
-- Chỉ mục cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD PRIMARY KEY (`maKH`),
  ADD KEY `FK_khachhang_truycap` (`maTC`) USING BTREE;

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD PRIMARY KEY (`maSP`),
  ADD KEY `FK_sanpham_anh` (`maAnh`),
  ADD KEY `FK_sanpham_theloai` (`maTL`);

--
-- Chỉ mục cho bảng `theloai`
--
ALTER TABLE `theloai`
  ADD PRIMARY KEY (`maTL`);

--
-- Chỉ mục cho bảng `truycap`
--
ALTER TABLE `truycap`
  ADD PRIMARY KEY (`maTC`);

--
-- Chỉ mục cho bảng `userkey`
--
ALTER TABLE `userkey`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `xacthuc`
--
ALTER TABLE `xacthuc`
  ADD PRIMARY KEY (`id`,`email`) USING BTREE;

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  MODIFY `maKH` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT cho bảng `nguyenlieu`
--
ALTER TABLE `nguyenlieu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `userkey`
--
ALTER TABLE `userkey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `xacthuc`
--
ALTER TABLE `xacthuc`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `anh`
--
ALTER TABLE `anh`
  ADD CONSTRAINT `FK_anh_sanpham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `chitiet_donhang`
--
ALTER TABLE `chitiet_donhang`
  ADD CONSTRAINT `FK_chitiet_donhang_donhang` FOREIGN KEY (`maDH`) REFERENCES `donhang` (`maDH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_chitiet_donhang_sanpham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `khachhang`
--
ALTER TABLE `khachhang`
  ADD CONSTRAINT `FK_khachhang_truycap` FOREIGN KEY (`maTC`) REFERENCES `truycap` (`maTC`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `sanpham`
--
ALTER TABLE `sanpham`
  ADD CONSTRAINT `FK_sanpham_anh` FOREIGN KEY (`maAnh`) REFERENCES `anh` (`maAnh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_sanpham_theloai` FOREIGN KEY (`maTL`) REFERENCES `theloai` (`maTL`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
