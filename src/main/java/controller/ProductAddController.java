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

@WebServlet("/ProductAddController")
@MultipartConfig
public class ProductAddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maSP = Integer.parseInt(req.getParameter("maSP"));
        String tenSP = req.getParameter("tenSP");
        String moTa = req.getParameter("moTa");
        int soLuong = Integer.parseInt(req.getParameter("soLuongTonKho"));
        double gia = Double.parseDouble(req.getParameter("giaGoc"));
        int maAnh = Integer.parseInt(req.getParameter("maAnh"));

        SanPham sp = new SanPham(maSP, tenSP, gia, soLuong, moTa, maAnh);

        String error ="";

        if (SanPhamService.getInstance().checkSanPhamByID(maSP)){
            error ="Mã sản phẩm đã tồn tại";
            req.setAttribute("error", error);
            req.getRequestDispatcher("products.jsp").forward(req, resp);
        }


        boolean success = SanPhamService.getInstance().addProduct(sp);

        if (success) {
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(req.getRemoteAddr());
            log.setAddress("sanpham");
            log.setBeforeValue("none");
            log.setAfterValue(sp.toString());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            resp.sendRedirect("products.jsp");
        } else {
            req.setAttribute("errorMessage", "Failed to add the product. Please try again.");
            req.getRequestDispatcher("products.jsp").forward(req, resp);
        }
    }
}
