package controller;

import JavaMail.EmailService;
import JavaMail.IJavaMail;
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
import java.io.IOException;
import java.security.SecureRandom;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Random;

@WebServlet(name = "DangKyController", value = "/dangky")
public class DangKyController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String userName = req.getParameter("userName");
        String email = req.getParameter("user");
        String password = req.getParameter("pass");
        String re_pass = req.getParameter("repass");
        String phone = req.getParameter("phone");
        String gioiTinh = req.getParameter("gioiTinh");
        String ngaySinhStr = req.getParameter("ngaySinh");

// Kiểm tra và chuyển đổi định dạng nếu cần thiết
        if (ngaySinhStr == null || ngaySinhStr.isEmpty()) {
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date utilDate;

        try {
            utilDate = dateFormat.parse(ngaySinhStr);
        } catch (ParseException e) {
            e.printStackTrace();
            // Xử lý lỗi chuyển đổi định dạng
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

// Chuyển đổi java.util.Date sang java.sql.Date
        Date ngaySinh = new Date(utilDate.getTime());
        String diaChi = req.getParameter("diaChi");

        // Kiểm tra xem các tham số của form có tồn tại không
        if (userName == null || password == null || re_pass == null || phone == null || gioiTinh == null || ngaySinhStr == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp đến trang đăng nhập
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        String randomSixDigitString = generateRandomString();
        KhachHangDAO kad = new KhachHangDAO();

        if (userName == null || email == null || password == null || re_pass == null ||
                phone == null || gioiTinh == null  || diaChi == null) {
            req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (!kad.isValidEmail(email)) {
            req.setAttribute("error", "Vui lòng nhập đúng định dạng email");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (!kad.isValidPassword(password)) {
            req.setAttribute("error", "Vui lòng nhập mật khẩu từ 6 đến 18 ký tự");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (!kad.phoneValidation(phone)) {
            req.setAttribute("error", "Vui lòng nhập lại số điện thoại");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else if (!password.equals(re_pass)) {
            req.setAttribute("error", "Mật khẩu không trùng khớp, xin vui lòng nhập lại");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        } else {
            KhachHang kh = kad.accountByEmailExist(email);
            // đăng ký nếu không trùng email, số điện thoại đúng định dạng và mật khẩu hợp lệ
            if ((kh == null) && kad.phoneValidation(phone) && kad.isValidEmail(email) && kad.isValidPassword(password)) {
                kad.signUpKhachHang(userName, email, hashedPassword, phone, gioiTinh, ngaySinh, diaChi);
                kad.updateCode(email, randomSixDigitString);
                LogDAO logDAO = new LogDAO();
                Log log = new Log();
                log.setLogLevels(LogLevels.INFO);
                log.setIp(req.getRemoteAddr());
                log.setAddress("khachhang");
                log.setBeforeValue("Chưa đăng ký tài khoản");
                log.setAfterValue("Tài khoản "+ email +" đăng ký thành công nhưng chưa xác thực");
                log.setCreateAt(LocalDateTime.now());
                logDAO.addLog(log);
                // Gửi email
                IJavaMail emailService = new EmailService();
                String mess = "Mã xác thực của bạn là: " + randomSixDigitString;
                emailService.send(email, "Cửa hàng KFP thông báo", mess);
                resp.sendRedirect("xacthuctaikhoan");
                return; // Chuyển hướng thành công, không thực hiện thêm xử lý nào
            } else {
                req.setAttribute("error", "Vui lòng nhập đầy đủ thông tin");
                req.getRequestDispatcher("register.jsp").forward(req, resp);
            }
        }
    }
//    Phương thức tạo 1 chuỗi ngẫu nhiên gồm 6 chữ số.
//    Chuỗi này sẽ chứa các chữ số từ 0 đến 9, và không bắt đầu bằng '0'.
//    @return Chuỗi ngẫu nhiên gồm 6 chữ số.

    public String generateRandomString() {
        SecureRandom random = new SecureRandom();
        StringBuilder randomString = new StringBuilder(6);

        // Đảm bảo ký tự đầu tiên không phải '0'
        int firstDigit;
        do {
            firstDigit = random.nextInt(10);
        } while (firstDigit == 0);
        randomString.append(firstDigit);

        // Tạo ra 5 số còn lại
        for (int i = 1; i < 6; i++) {
            int randomDigit = random.nextInt(10);
            randomString.append(randomDigit);
        }

        return randomString.toString();
    }
}
