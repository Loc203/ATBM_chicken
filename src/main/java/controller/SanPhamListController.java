package controller;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import dao.SanPhamDAO;
import model.SanPham;
import service.SanPhamService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "SanPhamListController", value = "/SanPhamListController")
public class SanPhamListController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        List<SanPham> sanphams = SanPhamService.getInstance().getAll();
        Gson gson = new Gson();
        String json = gson.toJson(sanphams);
        response.getWriter().write(json);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}
