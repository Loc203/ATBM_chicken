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

@WebServlet(name = "DonHangDeleteController", value = "/DonHangDeleteController")
@MultipartConfig
public class DonHangDeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maDH = Integer.parseInt(req.getParameter("maDH"));


        DonHang dh = new DonHang(maDH);

        boolean success = DonHangService.getInstance().deleteDonHang(dh);

        if (success) {
            // Sau khi thực hiện thành công
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.ALERT);
            log.setIp(req.getRemoteAddr());
            log.setAddress("donhang");
            log.setBeforeValue(dh.toString());
            log.setAfterValue(" ");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("orders.jsp");
        } else {
            // Sau khi thực hiện không thành công
            req.setAttribute("errorMessage", "Failed to delete. Please try again.");
            req.getRequestDispatcher("orders.jsp").forward(req, resp);
        }
    }
}


