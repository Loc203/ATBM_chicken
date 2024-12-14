package controller;

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

@WebServlet (name = "ChiTietSanPhamController", value = "/chitiet")
public class ChiTietSanPhamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String maSP = req.getParameter("masanpham");
        System.out.println(maSP);
        int ma = Integer.parseInt(maSP.trim());
        SanPham sp = SanPhamService.getInstance().getSanPhamById(ma);
        List<TheLoai> allTL = TheLoaiService.getInstance().allTL();
        req.setAttribute("data", sp);
        req.setAttribute("tl", allTL);
        req.getRequestDispatcher("detail.jsp").forward(req,resp);
    }
}
