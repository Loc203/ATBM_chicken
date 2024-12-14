package controller;

import model.DonHang;
import model.KhachHang;
import service.DonHangService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "XemDonHangController", value = "/xemdonhang")
public class XemDonHangController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        // Retrieve the user session
        HttpSession session = request.getSession();
        KhachHang userCheck = (KhachHang) session.getAttribute("acc");

        // If user is not logged in, redirect to login page
        if (userCheck == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int maKH = userCheck.getMaKH();

        // Call the DAO method to get the list of orders for the user
        List<DonHang> donHangList = DonHangService.getInstance().getDonHangBymaKH(maKH);

        // Set the list of orders as a request attribute
        request.setAttribute("donHangList", donHangList);

        // Forward the request to userorder.jsp
        request.getRequestDispatcher("userorder.jsp").forward(request, response);
    }
}
