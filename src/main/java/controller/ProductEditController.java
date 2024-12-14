package controller;

import dao.LogDAO;
import model.Anh;
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

@WebServlet("/ProductEditController")
@MultipartConfig
public class ProductEditController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        int maSP = Integer.parseInt(req.getParameter("maSP"));
        int maAnh = Integer.parseInt(req.getParameter("maAnh"));
        String tenSP = req.getParameter("tenSP");
        double giaGoc = Double.parseDouble(req.getParameter("giaGoc"));
        int soLuongTonKho = Integer.parseInt(req.getParameter("soLuongTonKho"));
        String moTa = req.getParameter("moTa");

        // Lấy dữ liệu trước khi edit
        SanPham existingSanPham = SanPhamService.getInstance().getSanPhamById(maSP);

        if (existingSanPham != null) {
            String beforeValue = existingSanPham.beforeValue();

            existingSanPham.setTenSP(tenSP);
            existingSanPham.setGiaGoc(giaGoc);
            existingSanPham.setSoLuongTonKho(soLuongTonKho);
            existingSanPham.setMoTa(moTa);
            Anh anh = new Anh(maAnh);
            existingSanPham.setAnh(anh);

            boolean success = SanPhamService.getInstance().updateProduct(existingSanPham);

            if (success) {
                // Lấy dữ liệu sau khi edit
                String afterValue = existingSanPham.afterValue();

                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.WARNING);
                log.setIp(req.getRemoteAddr());
                log.setAddress("sanpham");
                log.setBeforeValue(beforeValue);
                log.setAfterValue(afterValue);
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);

                resp.sendRedirect("products.jsp");
            } else {
                req.setAttribute("errorMessage", "Failed to edit product. Please try again.");
                req.getRequestDispatcher("products.jsp").forward(req, resp);
            }
        } else {
            req.setAttribute("errorMessage", "Product with ID " + maSP + " does not exist.");
            req.getRequestDispatcher("products.jsp").forward(req, resp);
        }
    }
}

