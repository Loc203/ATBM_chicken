package controller;

import com.google.gson.Gson;
import entity.PublicKeyUser;
import model.KhachHang;
import service.UserKeyService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserKeyByUserController", value = "/UserKeyByUserController")
public class UserKeyByUserController extends HttpServlet{
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");
        HttpSession session = req.getSession();
        int userId = ((KhachHang) session.getAttribute("acc")).getMaKH();
        List<PublicKeyUser> userKeyList;
        try {
            userKeyList = UserKeyService.getInstance().findAllKeyByUserId(userId);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Gson gson = new Gson();
        String json = gson.toJson(userKeyList);
        resp.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }
}
