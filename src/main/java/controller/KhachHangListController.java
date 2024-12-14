package controller;

import model.KhachHang;
import service.KhachHangService;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "KhachHangListController", value = "/KhachHangListController")
public class KhachHangListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<KhachHang> khachHangs = KhachHangService.getInstance().getAll();
        Gson gson = new Gson();
        String json = gson.toJson(khachHangs);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
