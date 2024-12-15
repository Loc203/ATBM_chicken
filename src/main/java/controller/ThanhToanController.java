package controller;

import Cart.GioHang;
import Cart.GioHangSanPham;
import dao.ChiTietDonHangDAO;
import dao.DonHangDAO;
import dao.UserkeyDAO;
import entity.ElectronicSignature;
import entity.PublicKeyUser;
import model.*;
import service.ChiTietDonHangService;
import service.DonHangService;
import service.LogService;
import service.SanPhamService;
import util.GHNApiUtil;
import util.IP;
import util.RandomIdOrder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

@WebServlet(name = "ThanhToanController", value = "/thanhtoan")
public class ThanhToanController extends HttpServlet {
    final double VAT = 0.1;
    UserkeyDAO userkeyDAO = new UserkeyDAO();
    PublicKeyUser publicKeyUser = new PublicKeyUser();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        req.getRequestDispatcher("payment.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String info = "";
        //Lấy dữ liệu từ form thanh toán
        String username = req.getParameter("name");
        String tel = req.getParameter("tel");
        System.out.println(tel);
        String email = req.getParameter("email");
        String address = req.getParameter("address");
        System.out.println(address);
        String note = req.getParameter("note") != null ? req.getParameter("note") : "";
        String privateKey = req.getParameter("privateKey");

        HttpSession session = req.getSession();
        // Khách hàng
        KhachHang khachHang = (KhachHang) session.getAttribute("acc");
        // Giỏ hàng của khách hàng
        GioHang gioHang = (GioHang) session.getAttribute("cart");
        // Kiểm tra giỏ hàng có sản phẩm nào không
        if (gioHang.getToTal() == 0) {
            info = "Giỏ hàng của bạn trống. Vui lòng thêm sản phẩm vào giỏ hàng trước khi thanh toán.";
            req.setAttribute("info", info);
            req.getRequestDispatcher("payment.jsp").forward(req, resp);
            return;
        }
        // Danh sách sản phẩm trong giỏ hàng
        List<GioHangSanPham> dsSanPham = gioHang.getDanhSachSanPham();
        // Tạo đối tượng log
        Log log = new Log();
        // Tạo đối tượng đơn hàng
        DonHang donHang = new DonHang();

        // tạo một mã đơn hàng ngẫu nhiên
        int maDH = RandomIdOrder.generateRandomNumber();
        // kiểm tra đã có mã đơn hàng đó hay chưa
        // có thì tạo một mã khác
        boolean checkMaDH = DonHangService.getInstance().getDonHangById(maDH);
        while (checkMaDH) {
            maDH = RandomIdOrder.generateRandomNumber();
            checkMaDH = DonHangService.getInstance().getDonHangById(maDH);
        }
        // thêm các dữ liệu của đơn hàng
        donHang.setMaDH(maDH);
        donHang.setMaKH(khachHang.getMaKH());
        donHang.setDiaChiNhanHang(address);
        donHang.setPhiVanChuyen(GHNApiUtil.totalFee(address));
        donHang.setSoDienThoai(tel);
        // thời gian tạo đơn hàng
        LocalDateTime timeNow = LocalDateTime.now();
        donHang.setNgayDatHang(timeNow);
        // ngày nhận hàng sẽ bằng thời gian đặt hàng + thêm 2h
        donHang.setNgayNhanHang(timeNow.plusHours(2));
        donHang.setTrangThai("Chưa Giao");
        donHang.setThanhToan("Chưa thanh toán");

        String data = donHang.toString();

        try {
            publicKeyUser = userkeyDAO.findKeyActiveByUserId(khachHang.getMaKH());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        String signature;
        try {
            signature = ElectronicSignature.doSignature(privateKey, donHang.toString());
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (SignatureException e) {
            throw new RuntimeException(e);
        }
        boolean isValid = false;
        try {
            isValid = ElectronicSignature.checkSignature(publicKeyUser.getPublicKey(), data, signature);
        } catch (NoSuchAlgorithmException e) {
            resp.getWriter().write("Đã xảy ra lỗi khi kiểm tra chữ ký: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e) {
            resp.getWriter().write("Đã xảy ra lỗi khi kiểm tra chữ ký: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            resp.getWriter().write("Đã xảy ra lỗi khi kiểm tra chữ ký: " + e.getMessage());
            throw new RuntimeException(e);
        } catch (SignatureException e) {
            resp.getWriter().write("Đã xảy ra lỗi khi kiểm tra chữ ký: " + e.getMessage());
            throw new RuntimeException(e);
        }

        System.out.println(data);
        System.out.println(privateKey);
        System.out.println(publicKeyUser.getPublicKey());
        System.out.println(signature);
        System.out.println(isValid);

        if (isValid) {
            boolean success = DonHangService.getInstance().addDonHang(donHang);
            if (success) {
                // Ghi log
                log.setLogLevels(LogLevels.INFO);
                log.setIp(IP.getClientIp(req));
                log.setAddress("khachhang");
                log.setBeforeValue("null");
                log.setAfterValue(donHang.afterValue());
                log.setCreateAt(timeNow);
                LogService.getInstance().addLog(log);

                //Thêm từng sản phẩm vào bảng chi tiết đơn hàng
                for (GioHangSanPham sp : dsSanPham) {
                    SanPham item = sp.getSp();
                    ChiTiet_DonHang ctdh = new ChiTiet_DonHang();
                    ctdh.setMaDH(donHang.getMaDH());
                    ctdh.setMaSP(item.getMaSP());
                    ctdh.setSoLuongDatHang(sp.getSoLuong());

                    // cập nhật lại số lượng trong kho
                    SanPham spTrongKho = SanPhamService.getInstance().getSanPhamById(item.getMaSP());
                    int soLuongConLai = spTrongKho.getSoLuongTonKho() - sp.getSoLuong();
                    spTrongKho.setSoLuongTonKho(soLuongConLai);
                    SanPhamService.getInstance().updateProduct(spTrongKho);


                    ctdh.setThueVAT(VAT);
                    double thanhTien;
                    if (item.getGiaGiam() == 0) {
                        thanhTien = sp.getSoLuong() * item.getGiaGoc() + sp.getSoLuong() * item.getGiaGoc() * VAT;
                    } else {
                        thanhTien = sp.getSoLuong() * item.getGiaGiam() + sp.getSoLuong() * item.getGiaGiam() * VAT;
                    }
                    ctdh.setThanhTien(thanhTien);
                    ChiTietDonHangService.getInstance().addCTDH(ctdh);
                }

                List<ChiTiet_DonHang> ctdh = ChiTietDonHangService.getCTDHByMaDH(maDH);
                String ctdhString = ctdh.toString();
                System.out.println(ctdhString);
                String orderSignature;
                try {
                    orderSignature = ElectronicSignature.doSignature(privateKey,ctdhString);
                } catch (NoSuchAlgorithmException e) {
                    throw new RuntimeException(e);
                } catch (InvalidKeySpecException e) {
                    throw new RuntimeException(e);
                } catch (InvalidKeyException e) {
                    throw new RuntimeException(e);
                } catch (SignatureException e) {
                    throw new RuntimeException(e);
                }

                DonHangDAO.addOrderSignatureByOrederId(maDH, orderSignature);


                gioHang.clear();
                info = "Cảm ơn bạn đã đặt hàng ở cửa hàng chúng tôi";
                req.setAttribute("info", info);
                resp.getWriter().write("valid");
//                resp.sendRedirect("trangchu");
            }
        } else {
            resp.getWriter().write("Chữ ký không hợp lệ. Vui lòng kiểm tra lại khóa riêng tư!");
        }
    }
}
