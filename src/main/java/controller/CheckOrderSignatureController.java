package controller;

import com.google.gson.Gson;
import dao.ChiTietDonHangDAO;
import model.ChiTiet_DonHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
@WebServlet(name = "checkOrderSignatureController", value = "/checkOrderSignatureController")
public class CheckOrderSignatureController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        int maDH = Integer.parseInt(req.getParameter("maDH"));
        int maKH = Integer.parseInt(req.getParameter("maKH"));

        List<ChiTiet_DonHang> orderDetail = ChiTietDonHangDAO.getCTDHByMaDH(maDH);
        Gson gson = new Gson();
        String json = gson.toJson(orderDetail);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
