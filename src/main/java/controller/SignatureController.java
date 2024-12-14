package controller;

import Cart.GioHang;
import Cart.GioHangSanPham;
import com.google.gson.JsonObject;
import dao.UserkeyDAO;
import entity.ElectronicSignature;
import entity.PublicKeyUser;
import model.DonHang;
import model.KhachHang;
import model.Log;
import service.DonHangService;
import util.GHNApiUtil;
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
import java.time.LocalDateTime;
import java.util.List;

@WebServlet("/SignatureController")
public class SignatureController extends HttpServlet {
    PublicKeyUser publicKeyUser = new PublicKeyUser();
    UserkeyDAO userkeyDAO = new UserkeyDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String info = "";
        //Lấy dữ liệu từ form thanh toán
        String tel = req.getParameter("tel");
        String address = req.getParameter("address");
        String privateKey = req.getParameter("privateKey");
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
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (SignatureException e) {
            throw new RuntimeException(e);
        }

        System.out.println(data);
        System.out.println(signature);
        System.out.println(isValid);
        if (isValid) {
            // Nếu hợp lệ, điều hướng sang trang khác
            resp.sendRedirect("/thanhtoan");
        } else {
            // Nếu không hợp lệ, gửi lại thông báo lỗi và hiển thị form
            req.setAttribute("errorMessage", "Email không hợp lệ. Vui lòng nhập lại!");
            req.getRequestDispatcher("/payment.jsp").forward(req, resp); // Quay lại form
        }
    }
}