package controller;

import dao.LogDAO;
import model.*;
import service.ChiTietDonHangService;
import service.DonHangService;
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

@WebServlet(name ="DonHangEditController",value = "/DonHangEditController")
@MultipartConfig
public class DonHangEditController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maDH = Integer.parseInt(req.getParameter("maDH"));
        int maKH = Integer.parseInt(req.getParameter("maKH"));
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        LocalDateTime ngayDatHang = LocalDateTime.now();
        LocalDateTime ngayNhanHang = LocalDateTime.parse(req.getParameter("ngayNhanHang"));
        String trangThai = req.getParameter("trangThai");
        String thanhToan = req.getParameter("thanhToan");

        DonHang dh = new DonHang(maDH, maKH, diaChiNhanHang,ngayDatHang ,ngayNhanHang, trangThai, thanhToan);

        DonHang existingDonHang = DonHangService.getInstance().getOrderById(maDH);

        if (existingDonHang != null) {
            // Lấy dữ liệu trước khi edit
            String beforeValue = existingDonHang.beforeValue();

            existingDonHang.setMaKH(maKH);
            existingDonHang.setDiaChiNhanHang(diaChiNhanHang);
            existingDonHang.setNgayDatHang(ngayDatHang);
            existingDonHang.setNgayNhanHang(ngayNhanHang);
            existingDonHang.setTrangThai(trangThai);
            existingDonHang.setThanhToan(thanhToan);

            boolean success = DonHangService.getInstance().updateDonHang(existingDonHang);

            if (success) {
                // Lấy dữ liệu sau khi update
                String afterValue = existingDonHang.afterValue();

                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.WARNING);
                log.setIp(req.getRemoteAddr());
                log.setAddress("donhang");
                log.setBeforeValue(beforeValue);
                log.setAfterValue(afterValue);
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                resp.sendRedirect("orders.jsp");
            } else {
                req.setAttribute("errorMessage", "Failed to edit. Please try again.");
                req.getRequestDispatcher("orders.jsp").forward(req, resp);
            }
        } else {
            // Nếu mã đơn hàng không tồn tại
            req.setAttribute("errorMessage", "DonHang with ID " + maDH + " does not exist.");
            req.getRequestDispatcher("orders.jsp").forward(req, resp);
        }
    }
}

