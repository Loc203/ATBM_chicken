package controller;

import Cart.GioHang;
import Cart.GioHangSanPham;
import model.SanPham;
import model.TheLoai;
import service.SanPhamService;
import service.TheLoaiService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "GioHangController", value = "/giohang")
public class GioHangController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GioHang gioHang = (GioHang) req.getSession().getAttribute("cart");
        if (gioHang == null) {
            gioHang = new GioHang();
            req.getSession().setAttribute("cart", gioHang);
        }

        List<GioHangSanPham> danhSachSanPham = gioHang.getDanhSachSanPham();
        req.setAttribute("list-sp", danhSachSanPham);

        req.getRequestDispatcher("cart.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
