package controller;

import dao.UserkeyDAO;
import model.KhachHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "BaoCaoController", value = "/reportkey")
public class BaoCaoKeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        UserkeyDAO userKey = new UserkeyDAO();
        KhachHang khachHang = (KhachHang) session.getAttribute("acc");

        if (khachHang == null) {
            resp.sendRedirect("trangchu?message=not_found");
            return;
        }

        int id = khachHang.getMaKH();
        boolean result = userKey.setInActive(id);

        if (result) {
            resp.sendRedirect("trangchu?message=success");
        } else {
            resp.sendRedirect("trangchu?message=failure");
        }
    }
}
