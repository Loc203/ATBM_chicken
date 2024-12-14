package controller;

import Cart.GioHang;
import model.SanPham;
import model.TheLoai;
import service.SanPhamService;
import service.TheLoaiService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "ThemGioHangController", value = "/them-gio-hang")
public class ThemGioHangController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        GioHang gh = (GioHang) session.getAttribute("cart");
        if (gh == null) gh = new GioHang();
        int ma = Integer.parseInt(req.getParameter("masanpham").trim());
        gh.add(ma);
        session.setAttribute("cart", gh);
        session.setAttribute("alert", "Thêm vào giỏ hàng thành công");
        resp.sendRedirect("thucdon");

    }
}
