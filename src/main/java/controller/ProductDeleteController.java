package controller;

import dao.LogDAO;
import model.Log;
import model.LogLevels;
import model.SanPham;
import service.SanPhamService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "xoasp", value = "/ProductDeleteController")
@MultipartConfig
public class ProductDeleteController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maSP = Integer.parseInt(req.getParameter("maSP"));

        SanPham sp = new SanPham(maSP);

        boolean success = SanPhamService.getInstance().deleteProduct(sp);

        if (success) {
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.ALERT);
            log.setIp(req.getRemoteAddr());
            log.setAddress("sanpham");
            log.setBeforeValue(sp.toString());
            log.setAfterValue(" ");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("products.jsp");
            resp.getWriter().write("success");
        } else {
            req.getRequestDispatcher("products.jsp").forward(req, resp);
            resp.getWriter().write("error");
        }
    }
}


