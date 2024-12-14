package controller;

import dao.KhachHangDAO;
import dao.LogDAO;
import model.KhachHang;
import model.Log;
import model.LogLevels;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "VerifyEmailController", value = "/xacthuctaikhoan")
public class VerifyEmailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String code = request.getParameter("code");
        if (code == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp đến trang
            request.getRequestDispatcher("verifyEmail.jsp").forward(request, response);
            return;
        }
        KhachHangDAO khd = new KhachHangDAO();
        // Gọi phương thức changeMaTC để thay đổi mã Truy cập
        boolean result = khd.changeMaTC(code);
        String kh = khd.getEmailByCodeKH(code);
        if (result) {
            // Nếu thay đổi thành công, điều hướng người dùng đến trang đăng nhập
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(request.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue("Tài khoản " +kh + " chưa xác thực");
            log.setAfterValue("Tài khoản "+ kh +" xác thực thành công");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            response.sendRedirect("dangnhap");
        } else {
            // Nếu không thành công, xử lý lỗi
            request.setAttribute("error", "Mã xác thực không đúng");
            request.getRequestDispatcher("verifyEmail.jsp").forward(request, response);
        }
    }
}