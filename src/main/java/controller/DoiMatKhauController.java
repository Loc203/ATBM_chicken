package controller;

import dao.KhachHangDAO;
import dao.LogDAO;
import model.KhachHang;
import model.Log;
import model.LogLevels;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "DoiMatKhauController", value = "/doimatkhau")
public class DoiMatKhauController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String password = req.getParameter("password");
        String newPassword_1 = req.getParameter("newPassword_1");
        String newPassword_2 = req.getParameter("newPassword_2");
        KhachHangDAO kad = new KhachHangDAO();

        // Kiểm tra xem các tham số của form có tồn tại không
        if (password == null || newPassword_1 == null || newPassword_2 == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp đến trang đổi mật khẩu
            req.getRequestDispatcher("password.jsp").forward(req, resp);
            return;
        }
        HttpSession session = req.getSession(false); // Lấy phiên hiện tại, không tạo mới nếu không tồn tại
        if (session == null) {
            req.setAttribute("error", "Phiên làm việc đã hết hạn. Vui lòng đăng nhập lại.");
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        KhachHang khachHang = (KhachHang) session.getAttribute("acc");
        if (khachHang == null) {
            req.setAttribute("error", "Không tìm thấy thông tin tài khoản. Vui lòng đăng nhập lại.");
            req.getRequestDispatcher("password.jsp").forward(req, resp);
            return;
        }

        String email = ((KhachHang) session.getAttribute("acc")).getEmail();
        String currentPassword = kad.getMatKhauByEmail(email);
        KhachHang khachhang = (KhachHang) session.getAttribute("acc");
        if (password.equals(newPassword_1)) {
            req.setAttribute("error", "Mật khẩu mới phải khác mật khẩu cũ.");
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.DANGER);
            log.setIp(req.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue(khachhang.toString());
            log.setAfterValue("Tài khoản " + email + " đổi mật khẩu thất bại");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            req.getRequestDispatcher("password.jsp").forward(req, resp);
        } else {
            if (newPassword_1.equals(newPassword_2)) {
                // Thêm điều kiện kiểm tra mật khẩu mới có hợp lệ không
                if (!kad.isValidPassword(newPassword_1)) {
                    req.setAttribute("error", "Mật khẩu mới không hợp lệ, xin nhập lại");
                    LogDAO logDAO = new LogDAO();
                    Log log = new Log();
                    log.setLogLevels(LogLevels.DANGER);
                    log.setIp(req.getRemoteAddr());
                    log.setAddress("khachhang");
                    log.setBeforeValue(khachhang.toString());
                    log.setAfterValue("Tài khoản " + email + " đổi mật khẩu thất bại");
                    log.setCreateAt(LocalDateTime.now());
                    logDAO.addLog(log);
                    req.getRequestDispatcher("password.jsp").forward(req, resp);
                } else {
                    if (BCrypt.checkpw(password, currentPassword)) {
                        // Thực hiện thay đổi mật khẩu và nhận thông tin khách hàng sau khi thay đổi
                        KhachHang kh = kad.changePassword(req, newPassword_1);
                        if (kh != null) {
                            req.setAttribute("success", "Mật khẩu đã được thay đổi thành công.");
                            LogDAO logDAO = new LogDAO();
                            Log log = new Log();
                            log.setLogLevels(LogLevels.INFO);
                            log.setIp(req.getRemoteAddr());
                            log.setAddress("khachhang");
                            log.setBeforeValue(khachhang.toString());
                            log.setAfterValue("Tài khoản " + email + " đổi mật khẩu thành công");
                            log.setCreateAt(LocalDateTime.now());
                            logDAO.addLog(log);
                            req.getRequestDispatcher("logout").forward(req, resp);
                        } else {
                            req.setAttribute("success", "Mật khẩu đã được thay đổi thành công");
                            LogDAO logDAO = new LogDAO();
                            Log log = new Log();
                            log.setLogLevels(LogLevels.INFO);
                            log.setIp(req.getRemoteAddr());
                            log.setAddress("khachhang");
                            log.setBeforeValue(khachhang.toString());
                            log.setAfterValue("Tài khoản " + email + " đổi mật khẩu thành công");
                            log.setCreateAt(LocalDateTime.now());
                            logDAO.addLog(log);
                            req.getRequestDispatcher("logout").forward(req, resp);
                        }
                    } else {
                        req.setAttribute("error", "Mật khẩu hiện tại không chính xác");
                        req.getRequestDispatcher("password.jsp").forward(req, resp);
                    }
                }
            } else {
                req.setAttribute("error", "Mật khẩu mới và xác nhận mật khẩu mới không khớp");
                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.DANGER);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue(khachhang.toString());
                log.setAfterValue("Tài khoản " + email + " đổi mật khẩu thất bại");
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                req.getRequestDispatcher("password.jsp").forward(req, resp);
            }
        }
    }
}
