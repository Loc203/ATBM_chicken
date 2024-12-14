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

@WebServlet (name = "TangGiamSanPhamController", value = "/tang-giam")
public class TangGiamSanPhamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GioHang gioHang = (GioHang) req.getSession().getAttribute("cart");
        List<GioHangSanPham> sanPhams = gioHang.getDanhSachSanPham();
        String hanhdong = req.getParameter("thuchien");
        int masanpham = Integer.parseInt(req.getParameter("masanpham"));
        if (hanhdong != null && masanpham >=1){
            if (hanhdong.equals("tang")){
                for (GioHangSanPham sp: sanPhams){
                    if (sp.getSp().getMaSP() == masanpham){
                        gioHang.add(masanpham, 1);
                    }
                }
            }
            if (hanhdong.equals("giam")){
                for (GioHangSanPham sp: sanPhams){
                    if (sp.getSp().getMaSP() == masanpham){
                        gioHang.decrease(masanpham, 1);
                    }
                }
            }
        }
        req.setAttribute("list-sp", sanPhams);
        resp.sendRedirect("giohang");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    }
}
