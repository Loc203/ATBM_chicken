package controller;

import model.ChiTiet_DonHang;
import service.ChiTietDonHangService;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name="CTDHController",value = "/CTDHController")
@MultipartConfig
public class CTDHController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int maDH = Integer.parseInt(request.getParameter("maDH"));
        String ngayDatHang = request.getParameter("ngayDatHang");
        double phiVanChuyen = Double.parseDouble(request.getParameter("phiVanChuyen"));

        List<ChiTiet_DonHang> orderDetails = ChiTietDonHangService.getCTDHByMaDH(maDH);

        request.setAttribute("maDH", maDH);
        request.setAttribute("ngayDatHang", ngayDatHang);
        request.setAttribute("orderDetails", orderDetails);
        request.setAttribute("phiVanChuyen", phiVanChuyen);

        request.getRequestDispatcher("order_detail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req,resp);
    }
}
