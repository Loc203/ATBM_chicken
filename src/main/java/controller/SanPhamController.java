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

@WebServlet (name = "SanPhamController", value = "/thucdon")
public class SanPhamController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String tl = req.getParameter("theloai");
        System.out.println(tl);
        List<SanPham> all = null;
        List<TheLoai> allTL = TheLoaiService.getInstance().allTL();
        if (tl == null){
            all = SanPhamService.getInstance().getAll();
        } else {
            int maTL = Integer.parseInt(tl.trim());
            all = SanPhamService.getInstance().getAllById(maTL);
        }
        req.setAttribute("data",all);
        req.setAttribute("tl", allTL);
        req.getRequestDispatcher("menu.jsp").forward(req,resp);
    }
}
