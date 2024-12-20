package controller;

import com.google.gson.Gson;
import dao.ChiTietDonHangDAO;
import dao.UserkeyDAO;
import entity.ElectronicSignature;
import entity.PublicKeyUser;
import model.ChiTiet_DonHang;
import model.DonHang;
import service.DonHangService;
import service.UserKeyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SignatureException;
import java.security.spec.InvalidKeySpecException;
import java.sql.SQLException;
import java.util.List;
@WebServlet(name = "ClipboardOrderDetail", value = "/ClipboardOrderDetail")
public class ClipboardOrderDetail extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        try {
            int maDH = Integer.parseInt(req.getParameter("maDH"));

            // Fetch order details from DAO
            List<ChiTiet_DonHang> orderDetail = ChiTietDonHangDAO.getCTDHByMaDH(maDH);

            // Convert the list to JSON
            Gson gson = new Gson();
            String json = gson.toJson(orderDetail);

            // Write JSON response
            resp.getWriter().write(json);

        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"error\": \"Unable to fetch order details.\"}");
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}

