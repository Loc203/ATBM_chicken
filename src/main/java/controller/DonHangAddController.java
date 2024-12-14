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

@WebServlet("/DonHangAddController")
@MultipartConfig
public class DonHangAddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setCharacterEncoding("UTF-8");

        int maDH = Integer.parseInt(req.getParameter("maDH"));
        int maKH = Integer.parseInt(req.getParameter("maKH"));
        String diaChiNhanHang = req.getParameter("diaChiNhanHang");
        LocalDateTime ngayDatHang = LocalDateTime.now();
        LocalDateTime ngayNhanHang = LocalDateTime.parse(req.getParameter("ngayNhanHang"));
        String trangThai = req.getParameter("trangThai");
        String thanhToan = req.getParameter("thanhToan");

        DonHang dh = new DonHang(maDH, maKH, diaChiNhanHang,ngayDatHang ,ngayNhanHang, trangThai, thanhToan);

        boolean success = DonHangService.getInstance().addDonHang(dh);

        if (success) {
            // Sau khi phương thức thực hiện thành công
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(req.getRemoteAddr());
            log.setAddress("donhang");
            log.setBeforeValue("none");
            log.setAfterValue(dh.toString());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("orders.jsp");
        } else {
            // Sau khi phương thức thực hiện thất bại
            req.setAttribute("errorMessage", "Failed to add. Please try again.");
            req.getRequestDispatcher("orders.jsp").forward(req, resp);
        }
    }
}

