package controller;

import dao.LogDAO;
import model.*;
import service.ChiTietDonHangService;
import service.KhachHangService;
import service.SanPhamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDateTime;

@WebServlet("/KhachHangEditController")
@MultipartConfig
public class KhachHangEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maKH = Integer.parseInt(req.getParameter("maKH"));
        String tenKH = req.getParameter("tenKH");
        String email = req.getParameter("email");
        String matKhau = req.getParameter("matKhau");
        String soDT = req.getParameter("soDT");
        String gioiTinh = req.getParameter("gioiTinh");
        Date ngaySinh = Date.valueOf(req.getParameter("ngaySinh"));
        int maTC = Integer.parseInt(req.getParameter("maTC"));

        KhachHang kh = new KhachHang(maKH, tenKH, email, matKhau, soDT, gioiTinh, ngaySinh, maTC);

        KhachHang existingKhachHang = KhachHangService.getInstance().getKhachHangById(maKH);

        if (existingKhachHang != null) {
            // Lấy dữ liệu trước khi edit
            String beforeValue = existingKhachHang.beforeValue();

            existingKhachHang.setTenKH(tenKH);
            existingKhachHang.setEmail(email);
            existingKhachHang.setMatKhau(matKhau);
            existingKhachHang.setSoDT(soDT);
            existingKhachHang.setGioiTinh(gioiTinh);
            existingKhachHang.setNgaySinh(ngaySinh);
            existingKhachHang.setMaTC(maTC);

            boolean success = KhachHangService.getInstance().updateKhachHang(existingKhachHang);

            if (success) {
                // Lấy dữ liệu sau khi edit
                String afterValue = existingKhachHang.afterValue();

                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.WARNING);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue(beforeValue);
                log.setAfterValue(afterValue);
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);

                resp.sendRedirect("customer.jsp");
            } else {
                req.setAttribute("errorMessage", "Failed to edit. Please try again.");
                req.getRequestDispatcher("customer.jsp").forward(req, resp);
            }
        } else {
            // Nếu maKH không tồn tại
            req.setAttribute("errorMessage", "KhachHang with ID " + maKH + " does not exist.");
            req.getRequestDispatcher("customer.jsp").forward(req, resp);
        }
    }
}


