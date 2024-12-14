package controller;

import dao.LogDAO;
import model.Log;
import model.LogLevels;
import model.NguyenLieu;
import service.NguyenLieuService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "NguyenLieuAddController", value = "/NguyenLieuAddController")
public class NguyenLieuAddController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        int id = Integer.parseInt(request.getParameter("id"));
        String nguyenlieu = request.getParameter("nguyenlieu");
        int soluong = Integer.parseInt(request.getParameter("soluong"));
        String noidung = request.getParameter("noidung");
        String loai = request.getParameter("loai");
        LocalDateTime thoigian = LocalDateTime.parse(request.getParameter("thoigian"));
        String donvi = request.getParameter("donvi");
        double gia = Double.parseDouble(request.getParameter("gia"));

        NguyenLieu nl = new NguyenLieu(id, nguyenlieu, soluong, noidung, loai,thoigian, donvi, gia);
        int success = NguyenLieuService.getInstance().addNguyenLieu(nl);

        if (success == 1){
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(request.getRemoteAddr());
            log.setAddress("nguyenlieu");
            log.setBeforeValue("none");
            log.setAfterValue(nl.toString());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            response.sendRedirect("ingredient.jsp");
        }
    }
}
