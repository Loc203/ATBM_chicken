-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.28-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.5.0.6677
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for kfpchicken
CREATE DATABASE IF NOT EXISTS `kfpchicken` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `kfpchicken`;

-- Dumping structure for table kfpchicken.anh
CREATE TABLE IF NOT EXISTS `anh` (
  `maAnh` int(10) NOT NULL,
  `maSP` int(10) DEFAULT NULL,
  `duongDan` varchar(255) DEFAULT NULL,
  `chuThich` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maAnh`),
  KEY `FK_anh_sanpham` (`maSP`),
  CONSTRAINT `FK_anh_sanpham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.anh: ~48 rows (approximately)
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

-- Dumping structure for table kfpchicken.chitiet_donhang
CREATE TABLE IF NOT EXISTS `chitiet_donhang` (
  `maDH` int(10) DEFAULT NULL,
  `maSP` int(10) NOT NULL,
  `soLuongDatHang` int(10) DEFAULT NULL,
  `thueVAT` double NOT NULL DEFAULT 0.1,
  `tongTien` double NOT NULL,
  KEY `FK_chitiet_donhang_sanpham` (`maSP`) USING BTREE,
  KEY `FK_chitiet_donhang_donhang` (`maDH`),
  CONSTRAINT `FK_chitiet_donhang_donhang` FOREIGN KEY (`maDH`) REFERENCES `donhang` (`maDH`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_chitiet_donhang_sanpham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.chitiet_donhang: ~2 rows (approximately)
INSERT INTO `chitiet_donhang` (`maDH`, `maSP`, `soLuongDatHang`, `thueVAT`, `tongTien`) VALUES
	(39845, 3, 2, 0.1, 107800),
	(39845, 5, 2, 0.1, 437800),
	(39845, 6, 3, 0.1, 161700);

-- Dumping structure for table kfpchicken.donhang
CREATE TABLE IF NOT EXISTS `donhang` (
  `maDH` int(10) NOT NULL,
  `maKH` int(10) DEFAULT NULL,
  `diaChiNhanHang` varchar(255) DEFAULT NULL,
  `soDienThoai` varchar(50) DEFAULT NULL,
  `ngayDatHang` datetime DEFAULT NULL,
  `ngayNhanHang` datetime DEFAULT NULL,
  `trangThai` varchar(50) DEFAULT 'Chưa giao',
  `thanhToan` varchar(50) DEFAULT NULL,
  `phiVanChuyen` double DEFAULT NULL,
  PRIMARY KEY (`maDH`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.donhang: ~0 rows (approximately)
INSERT INTO `donhang` (`maDH`, `maKH`, `diaChiNhanHang`, `soDienThoai`, `ngayDatHang`, `ngayNhanHang`, `trangThai`, `thanhToan`, `phiVanChuyen`) VALUES
	(39845, 7, 'Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh', '944126980', '2024-07-14 13:39:23', '2024-07-14 15:39:23', 'Chưa Giao', 'Chưa thanh toán', 51503);

-- Dumping structure for table kfpchicken.khachhang
CREATE TABLE IF NOT EXISTS `khachhang` (
  `maKH` int(10) NOT NULL AUTO_INCREMENT,
  `tenKH` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `matkhau` varchar(5000) DEFAULT NULL,
  `soDT` int(11) DEFAULT NULL,
  `gioiTinh` varchar(5) DEFAULT NULL,
  `ngaySinh` date DEFAULT '2000-01-01',
  `diaChi` varchar(100) DEFAULT NULL,
  `maTC` int(10) DEFAULT 0,
  `code` varchar(50) DEFAULT NULL,
  `picture` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`maKH`),
  KEY `FK_khachhang_truycap` (`maTC`) USING BTREE,
  CONSTRAINT `FK_khachhang_truycap` FOREIGN KEY (`maTC`) REFERENCES `truycap` (`maTC`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.khachhang: ~1 rows (approximately)

-- Dumping structure for table kfpchicken.log
CREATE TABLE IF NOT EXISTS `log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` varchar(50) NOT NULL DEFAULT '0',
  `ip` varchar(50) NOT NULL DEFAULT '0',
  `address` varchar(50) NOT NULL DEFAULT '0',
  `beforeValue` text NOT NULL,
  `afterValue` text NOT NULL,
  `createAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.log: ~25 rows (approximately)
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
	(50, 'WARNING', '0:0:0:0:0:0:0:1', 'khachhang', 'Chưa đăng nhập', 'Tài khoản trijoker0507@gmail.com đăng nhập thất bại quá nhiều lần', '2024-07-14 13:44:33');

-- Dumping structure for table kfpchicken.nguyenlieu
CREATE TABLE IF NOT EXISTS `nguyenlieu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nguyenlieu` varchar(50) DEFAULT NULL,
  `soluong` int(11) DEFAULT NULL,
  `noidung` varchar(500) DEFAULT NULL,
  `loai` varchar(500) DEFAULT NULL,
  `thoigian` datetime DEFAULT NULL,
  `donvi` varchar(10) DEFAULT NULL,
  `gia` double DEFAULT NULL,
  `tong` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.nguyenlieu: ~0 rows (approximately)

-- Dumping structure for table kfpchicken.sanpham
CREATE TABLE IF NOT EXISTS `sanpham` (
  `maSP` int(10) NOT NULL,
  `tenSP` varchar(50) DEFAULT NULL,
  `giaGoc` double DEFAULT NULL,
  `giaGiam` double DEFAULT NULL,
  `soLuongTonKho` int(25) DEFAULT NULL,
  `moTa` varchar(100) DEFAULT NULL,
  `maTL` int(10) DEFAULT NULL,
  `maAnh` int(10) DEFAULT NULL,
  PRIMARY KEY (`maSP`),
  KEY `FK_sanpham_theloai` (`maTL`),
  KEY `FK_sanpham_anh` (`maAnh`),
  CONSTRAINT `FK_sanpham_anh` FOREIGN KEY (`maAnh`) REFERENCES `anh` (`maAnh`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_sanpham_theloai` FOREIGN KEY (`maTL`) REFERENCES `theloai` (`maTL`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.sanpham: ~49 rows (approximately)
INSERT INTO `sanpham` (`maSP`, `tenSP`, `giaGoc`, `giaGiam`, `soLuongTonKho`, `moTa`, `maTL`, `maAnh`) VALUES
	(1, 'Combo B - Gà giòn sốt me', 257000, 199000, 0, '- 2 Miếng gà giòn sốt me\r\n- 2 Miếng gà có xương (lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây nghiền', 1, 1),
	(2, 'Combo A - Gà Giòn Sốt Me', 143000, 119000, 0, '- 2 Miếng gà giòn sốt me\r\n- 1 Bắp cải trộn cỡ tiêu chuẩn\r\n- 1 Chai nước ngọt Coca-Cola 390ml', 1, 2),
	(3, '1 miếng Gà Giòn Sốt Me', 49000, 0, 23, '', 1, 3),
	(4, 'Combo A - Gà Sốt Bơ Tỏi & Thảo Mộc', 155000, 119000, 25, '- 2 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 1 Bánh quy bơ mật ong\r\n- 1 Món ăn kèm tiêu chuẩn tùy chọn (Bắ', 2, 4),
	(5, 'Combo B - Gà Sốt Bơ Tỏi & Thảo Mộc', 257000, 199000, 22, '- 2 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 1 Bánh quy bơ mật ong\r\n- 1 Món ăn kèm tiêu chuẩn tùy chọn (Bắ', 2, 5),
	(6, '1 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 49000, 0, 22, '', 2, 6),
	(7, '4 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 196000, 179000, 25, '- 4 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 3 Tương ớt + 1 tương cà', 2, 7),
	(8, '7 miếng Gà Sốt Bơ Tỏi & Thảo Mộc', 343000, 299000, 0, '- 7 Miếng gà sốt bơ tỏi và thảo mộc\r\n- 5 Tương ớt + 2 tương cà', 2, 8),
	(9, 'Combo Giòn Tan A', 104000, 95000, 25, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Nước ngọt\r\n- 2 Tương ớt + 1 Tương cà', 3, 9),
	(10, 'Combo Giòn Tan B', 105000, 95000, 25, '1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Miếng gà giòn không xương (lựa chọn vị cay', 3, 10),
	(11, 'Combo Giòn Tan C', 105000, 95000, 25, '- 1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Khuỷu cánh gà cay\r\n- 1 Nước ngọt\r\n- 2 Tư', 3, 11),
	(12, 'Combo Giòn Tan D', 114000, 95000, 25, '- 1 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Bánh cuộn gà không xương ( lựa chọn vị c', 3, 12),
	(13, 'Combo VUI VẺ A', 179000, 159000, 25, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Burger tôm (lựa chọn vị cay/ không cay)\r', 4, 13),
	(14, 'Combo VUI VẺ B', 194000, 159000, 25, '- 2 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 2 Miếng gà giòn không xương (lựa chọn vị c', 4, 14),
	(15, 'Combo VUI VẺ C', 218000, 189000, 25, '- 3 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Khoai tây chiên phô mai\r\n- 2 Nước ngọt\r\n', 4, 15),
	(16, 'Combo Nhóm A', 351000, 279000, 25, '- 5 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 1 Bánh cuộn Zesty Crunch (lựa chọn vị cay/', 5, 16),
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
	(28, 'CHICKEN BOX – 9 MIẾNG GÀ RÁN', 351000, 329000, 25, '- 9 Miếng gà rán có xương (lựa chọn vị cay/ không cay)\r\n- 8 Tương ớt + 4 Tương cà', 8, 28),
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

-- Dumping structure for table kfpchicken.theloai
CREATE TABLE IF NOT EXISTS `theloai` (
  `maTL` int(10) NOT NULL,
  `tenTL` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maTL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.theloai: ~12 rows (approximately)
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

-- Dumping structure for table kfpchicken.truycap
CREATE TABLE IF NOT EXISTS `truycap` (
  `maTC` int(10) NOT NULL,
  `tinhTrang` varchar(50) DEFAULT 'Chưa xác thực',
  PRIMARY KEY (`maTC`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.truycap: ~7 rows (approximately)
INSERT INTO `truycap` (`maTC`, `tinhTrang`) VALUES
	(-1, 'Cấm'),
	(0, 'Chưa xác thực'),
	(1, 'Đã xác thực'),
	(2, 'Quản trị viên'),
	(3, 'Quản lý Khách Hàng'),
	(4, 'Quản lý Đơn Hàng'),
	(5, 'Quản lý Sản Phẩm');

-- Dumping structure for table kfpchicken.xacthuc
CREATE TABLE IF NOT EXISTS `xacthuc` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `maMatKhau` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`,`email`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Dumping data for table kfpchicken.xacthuc: ~0 rows (approximately)

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
