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

@WebServlet("/KhachHangDeleteController")
@MultipartConfig
public class KhachHangDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maKH = Integer.parseInt(req.getParameter("maKH"));


        KhachHang kh = new KhachHang(maKH);

        boolean success = KhachHangService.getInstance().deleteKhachHang(kh);

        if (success) {
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.ALERT);
            log.setIp(req.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue(kh.toString());
            log.setAfterValue(" ");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("customer.jsp");
        } else {
            req.setAttribute("errorMessage", "Failed to delete. Please try again.");
            req.getRequestDispatcher("customer.jsp").forward(req, resp);
        }
    }
}


