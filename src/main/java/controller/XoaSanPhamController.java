package controller;

import Cart.GioHang;
import Cart.GioHangSanPham;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name = "XoaSanPhamController", value = "/xoa-san-pham")
public class XoaSanPhamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GioHang gioHang = (GioHang) req.getSession().getAttribute("cart");
        List<GioHangSanPham> sanPhams = gioHang.getDanhSachSanPham();
        int masanpham = Integer.parseInt(req.getParameter("masanpham").trim());
        for (GioHangSanPham sp :sanPhams) {
            if (sp.getSp().getMaSP() == masanpham) {
                gioHang.remove(masanpham);
            }
        }
        req.setAttribute("list-sp", sanPhams);
        req.getSession().setAttribute("remove-cart-alert", "Xóa thành công");
        resp.sendRedirect("giohang");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
