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

@WebServlet("/KhachHangAddController")
@MultipartConfig
public class KhachHangAddController extends HttpServlet {
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
        String soDT = req.getParameter("soDT");
        String gioiTinh = req.getParameter("gioiTinh");
        Date ngaySinh = Date.valueOf(req.getParameter("ngaySinh"));

        KhachHang kh = new KhachHang(maKH, tenKH, email, soDT, gioiTinh, ngaySinh);

        boolean success = KhachHangService.getInstance().addKhachHang(kh);

        if (success) {
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(req.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue("none");
            log.setAfterValue(kh.toString());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("customer.jsp");
        } else {
            req.setAttribute("errorMessage", "Failed to add. Please try again.");
            req.getRequestDispatcher("customer.jsp").forward(req, resp);
        }
    }
}


