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
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.time.LocalDateTime;

@WebServlet(name = "DangNhapController", value = "/dangnhap")
public class DangNhapController extends HttpServlet {

    private static final int MAX_ATTEMPTS = 5; // tối đa 5 lần đăng nhập sai
    private static final long LOCKOUT_DURATION = 300000; // đặt 300 giây làm thời gian nguôi / chờ

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");

        String username = req.getParameter("user");
        String password = req.getParameter("pass");

        HttpSession session = req.getSession();

        Integer attempts = (Integer) session.getAttribute("attempts");
        Long lockoutEndTime = (Long) session.getAttribute("lockoutEndTime");

        // Kiểm tra xem các tham số của form có tồn tại không
        if (username == null || password == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp đến trang đăng nhập
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        if (attempts == null) {
            attempts = 0;
        }

        long currentTime = System.currentTimeMillis();

        if (lockoutEndTime != null && currentTime < lockoutEndTime) {
            long remainingTime = (lockoutEndTime - currentTime) / 1000;
            req.setAttribute("error", " Vui lòng thử lại sau " + remainingTime + " giây");
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.WARNING);
            log.setIp(req.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue("Chưa đăng nhập");
            log.setAfterValue("Tài khoản " + username + " đăng nhập thất bại quá nhiều lần");
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            req.getRequestDispatcher("login.jsp").forward(req, resp);
            return;
        }

        KhachHangDAO khd = new KhachHangDAO();
        KhachHang kh = khd.login(username, password);

        if (kh != null) {
            // Kiểm tra password và email
            if (khd.isValidPassword(password) && khd.isValidEmail(username)) {
                if (khd.isLoginSuccess(kh)) {
                    session.setAttribute("acc", kh); // Set session attribute
                    session.removeAttribute("attempts"); // xóa attempts nếu đăng nhập thành công
                    // Đặt lại thời gian timeout của session là 30 phút (30 * 60 giây)
                    session.setMaxInactiveInterval(30*60);
                    LogDAO logDAO = new LogDAO();
                    Log log = new Log();
                    log.setLogLevels(LogLevels.INFO);
                    log.setIp(req.getRemoteAddr());
                    log.setAddress("khachhang");
                    log.setBeforeValue("Chưa đăng nhập");
                    log.setAfterValue(kh.afterValue());
                    log.setCreateAt(LocalDateTime.now());
                    logDAO.addLog(log);
                    resp.sendRedirect("trangchu"); //
                } else {
                    req.setAttribute("error", "Tài khoản chưa được xác nhận hoặc đã bị khóa");
                    req.getRequestDispatcher("login.jsp").forward(req, resp);
                    LogDAO logDAO = new LogDAO();
                    Log log = new Log();
                    log.setLogLevels(LogLevels.DANGER);
                    log.setIp(req.getRemoteAddr());
                    log.setAddress("khachhang");
                    log.setBeforeValue("Chưa đăng nhập");
                    log.setAfterValue("Tài khoản " + username + " chưa được xác nhận hoặc đã bị khóa");
                    log.setCreateAt(LocalDateTime.now());
                    logDAO.addLog(log);
                }
            } else {
                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.DANGER);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue("Chưa đăng nhập");
                log.setAfterValue("Tài khoản " + username + " đăng nhập thất bại");
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                req.setAttribute("error", "Email hoặc mật khẩu không hợp lệ");
                req.getRequestDispatcher("login.jsp").forward(req, resp);
            }
        } else {
            attempts++;
            session.setAttribute("attempts", attempts);

            if (attempts >= MAX_ATTEMPTS) {
                session.setAttribute("lockoutEndTime", currentTime + LOCKOUT_DURATION);
                long remainingTime = LOCKOUT_DURATION / 1000; //
                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.WARNING);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue("Chưa đăng nhập");
                log.setAfterValue("Tài khoản " + username + " đăng nhập thất bại quá nhiều lần");
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                req.setAttribute("error", " Vui lòng thử lại sau " + remainingTime + " giây");
            } else {
                int remainingAttempts = MAX_ATTEMPTS - attempts;
                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.DANGER);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue("Chưa đăng nhập");
                log.setAfterValue("Tài khoản " + username + " đăng nhập thất bại");
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                req.setAttribute("error", "Sai email hoặc mật khẩu. Bạn còn " + remainingAttempts + " lần thử");
            }

            req.getRequestDispatcher("login.jsp").forward(req, resp);
        }
    }
}
