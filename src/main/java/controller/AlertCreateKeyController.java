package controller;

import com.google.gson.Gson;
import entity.PublicKeyUser;
import model.KhachHang;
import service.KhachHangService;
import service.UserKeyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;


@WebServlet(name = "AlertCreateKeyController", value = "/AlertCreateKeyController")
public class AlertCreateKeyController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int userId = ((KhachHang) session.getAttribute("acc")).getMaKH();
        boolean updateAlert = KhachHangService.getInstance().updateAlert(userId);
        Gson gson = new Gson();
        String json = gson.toJson(updateAlert);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
