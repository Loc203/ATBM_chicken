package controller;

import model.SanPham;
import model.TheLoai;
import service.ChiTietDonHangService;
import service.SanPhamService;
import service.TheLoaiService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "TrangChuController", value = "/trangchu")
public class TrangChuController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        List<SanPham> top6SanPhamBanChay = ChiTietDonHangService.getInstance().getTop6SanPham();
//        List<SanPham> carousel = new ArrayList<>();
//        if (top6SanPhamBanChay != null && top6SanPhamBanChay.size() == 6){
//            for (SanPham sp: top6SanPhamBanChay) {
//                SanPham sanPham = SanPhamService.getInstance().getSanPhamById(sp.getMaSP());
//                carousel.add(sanPham);
//            }
//        } else {
//            for (int i = 0; i < 6; i++){
//                SanPham sanPham = SanPhamService.getInstance().getSanPhamById(i);
//                carousel.add(sanPham);
//            }
//        }
//        req.setAttribute("carousel", carousel);
//        System.out.println("Carousel size: " + carousel.size());
        req.getRequestDispatcher("index.jsp").forward(req,resp);
    }
}
