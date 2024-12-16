package controller;

import JavaMail.SendEmail;
import dao.KhachHangDAO;
import dao.UserkeyDAO;
import entity.PublicKeyUser;
import entity.RSA;
import model.KhachHang;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(name = "CreateKeyController", value = "/CreateKeyController")
public class CreateKeyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            RSA rsa = new RSA(2048);
            String publicKey = rsa.exportPublicKey();
            String privateKey = rsa.exportPrivateKey();

            String userEmail = req.getParameter("email");

            // Send the public key to the user via email
            SendEmail.sendMailKey(userEmail, publicKey, privateKey);

            // Save the public key to the database for the user
            UserkeyDAO userkeyDAO = new UserkeyDAO();
            PublicKeyUser publicKeyUser = new PublicKeyUser();
            publicKeyUser.setUser_id(Integer.parseInt(req.getParameter("userID")));
            publicKeyUser.setPublicKey(publicKey);
            publicKeyUser.setIsActive(1);

            userkeyDAO.saveKey(publicKeyUser);

            int maKH = Integer.parseInt(req.getParameter("userID"));
            boolean updated = KhachHangDAO.updateAlertKey(maKH);

            resp.setContentType("application/json");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write("{\"success\": true, \"message\": \"Key added successfully for the user.\", \"refresh\": true}");
        } catch (SQLException e) {
            // Handle exceptions
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            resp.getWriter().write("{\"success\": false, \"message\": \"Error saving key to database.\"}");
        }
    }
}
