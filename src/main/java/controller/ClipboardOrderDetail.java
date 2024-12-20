package controller;

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
    UserkeyDAO userkeyDAO = new UserkeyDAO();
    PublicKeyUser publicKeyUser = new PublicKeyUser();
    UserKeyService userKeyService = new UserKeyService();
    DonHang donHang;
    String publickey;

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        int maDH = Integer.parseInt(req.getParameter("maDH"));
        int maKH = Integer.parseInt(req.getParameter("maKH"));

        List<ChiTiet_DonHang> orderDetail = ChiTietDonHangDAO.getCTDHByMaDH(maDH);
        String orderDetailString = orderDetail.toString();
        try {
            publicKeyUser = userKeyService.findKeyActiveByUserId(maKH);
            publickey = publicKeyUser.getPublicKey();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        donHang = DonHangService.getInstance().getOrderById(maDH);
        String orderSignature = donHang.getSignature();
        boolean isValid = false;
        try {
            isValid = ElectronicSignature.checkSignature(publickey, orderDetailString, orderSignature);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeyException e) {
            throw new RuntimeException(e);
        } catch (SignatureException e) {
            throw new RuntimeException(e);
        }

        if (isValid){
            resp.getWriter().write("Valid");
            return;
        }else {
            resp.getWriter().write("inValid");
            return;
        }
    }
}
