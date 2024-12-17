package controller;

import com.google.gson.Gson;
import dao.ChiTietDonHangDAO;
import dao.DonHangDAO;
import dao.UserkeyDAO;
import entity.ElectronicSignature;
import entity.PublicKeyUser;
import model.ChiTiet_DonHang;
import model.DonHang;
import service.DonHangService;
import service.UserKeyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CheckOrderSignatureController", value = "/CheckOrderSignatureController")
public class CheckOrderSignatureController extends HttpServlet {
    UserkeyDAO userkeyDAO = new UserkeyDAO();
    PublicKeyUser publicKeyUser = new PublicKeyUser();
    UserKeyService userKeyService = new UserKeyService();
    DonHang donHang;
    String publickey;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            // Lấy tham số từ form
            String maDHParam = req.getParameter("maDH");
            String maKHParam = req.getParameter("maKH");

            // Kiểm tra null và chuyển đổi sang int
            if (maDHParam == null || maKHParam == null) {
                System.out.println("Thông tin tham số bị thiếu: maDH hoặc maKH");
                resp.sendRedirect("orders.jsp?message=error");
                return;
            }
            int maDH = Integer.parseInt(maDHParam);
            int maKH = Integer.parseInt(maKHParam);

            // Lấy chi tiết đơn hàng
            List<ChiTiet_DonHang> orderDetail = ChiTietDonHangDAO.getCTDHByMaDH(maDH);
            String orderDetailString = orderDetail.toString();
//            System.out.println("Chi tiết đơn hàng: " + orderDetailString);

            // Lấy khóa công khai từ UserKeyService
            PublicKeyUser publicKeyUser = userKeyService.findKeyActiveByUserId(maKH);
            String publickey = publicKeyUser.getPublicKey();
//            System.out.println("Khóa công khai: " + publickey);

            // Lấy chữ ký của đơn hàng
            DonHang donHang = DonHangService.getInstance().getOrderById(maDH);
            String orderSignature = donHang.getSignature();
//            System.out.println("Chữ ký đơn hàng: " + orderSignature);

            // Kiểm tra nếu dữ liệu bị thiếu
            if (publickey == null || orderDetailString == null || orderSignature == null) {
//                System.out.println("Dữ liệu đầu vào bị thiếu (publickey, orderDetailString, hoặc orderSignature)");
                resp.sendRedirect("orders.jsp?message=failure");
                return;
            }

            // Kiểm tra chữ ký
            boolean isValid = false;
            try {
                isValid = ElectronicSignature.checkSignature(publickey, orderDetailString, orderSignature);
            } catch (InvalidKeyException | NoSuchAlgorithmException | SignatureException | InvalidKeySpecException e) {
                e.printStackTrace(); // Ghi lại lỗi nếu có
                resp.sendRedirect("orders.jsp?message=failure");
                return;
            }

            // Kiểm tra kết quả chữ ký
            if (isValid) {
                resp.sendRedirect("orders.jsp?message=success");
            } else {
                resp.sendRedirect("orders.jsp?message=failure");
            }

        } catch (Exception e) {
            e.printStackTrace(); // Ghi lại lỗi nếu có
            resp.sendRedirect("orders.jsp?message=failure");
        }
    }
}