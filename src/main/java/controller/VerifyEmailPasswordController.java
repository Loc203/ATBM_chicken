package controller;

import JavaMail.EmailService;
import JavaMail.IJavaMail;
import dao.KhachHangDAO;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@WebServlet(name = "VerifyEmailPasswordController", value = "/xacthucquenmatkhau")
public class VerifyEmailPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        // Tạo mật khẩu ngẫu nhiên và băm mật khẩu
        String password = generateRandomPassword();
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
        String code = request.getParameter("code");
        // Kiểm tra xem các tham số của form có tồn tại không
        if (code == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp đến trang
            request.getRequestDispatcher("verifyEmailPassword.jsp").forward(request, response);
            return;
        }
        // Cập nhật mật khẩu nếu mã code khớp
        KhachHangDAO khd = new KhachHangDAO();
        khd.updatePasswordIfCodeMatches(code, hashedPassword);
        // Điều hướng
        if (khd.isUpdateSuccess()) {
            IJavaMail emailService = new EmailService();
            String mess = "Mật khẩu mới của bạn là: " + password;
            emailService.send(khd.getEmailByCode(code), "Cửa hàng KFP thông báo", mess);
            // Cập nhật thành công, điều hướng đến trang đăng nhập
            response.sendRedirect("dangnhap");
        } else {
            // Cập nhật không thành công trở lại trang xác thực
            request.setAttribute("error", "Mã xác nhận quên mật khẩu không đúng, xin vui lòng nhập lại");
            request.getRequestDispatcher("verifyEmailPassword.jsp").forward(request, response);
        }
    }



//      Hàm tạo mật khẩu ngẫu nhiên có độ dài 8 ký tự, đảm bảo có ít nhất:
//      - Một chữ hoa
//      - Một chữ thường
//      - Một ký tự đặc biệt
//      - Một chữ số
//     @return Mật khẩu ngẫu nhiên

    public static String generateRandomPassword() {
        // Các ký tự có thể sử dụng
        String upperCaseLetters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        String lowerCaseLetters = "abcdefghijklmnopqrstuvwxyz";
        String digits = "0123456789";
        String specialCharacters = "!@#$%^&*()-+";

        // SecureRandom để đảm bảo tính ngẫu nhiên
        SecureRandom random = new SecureRandom();

        // Danh sách chứa các ký tự trong mật khẩu
        List<Character> passwordChars = new ArrayList<>();

        // Thêm ít nhất một ký tự từ mỗi loại vào danh sách
        passwordChars.add(upperCaseLetters.charAt(random.nextInt(upperCaseLetters.length())));
        passwordChars.add(lowerCaseLetters.charAt(random.nextInt(lowerCaseLetters.length())));
        passwordChars.add(digits.charAt(random.nextInt(digits.length())));
        passwordChars.add(specialCharacters.charAt(random.nextInt(specialCharacters.length())));

        // Thêm các ký tự ngẫu nhiên khác cho đủ độ dài mật khẩu
        String allAllowedChars = upperCaseLetters + lowerCaseLetters + digits + specialCharacters;
        for (int i = 4; i < 8; i++) {
            passwordChars.add(allAllowedChars.charAt(random.nextInt(allAllowedChars.length())));
        }

        // Trộn ngẫu nhiên các ký tự trong danh sách
        Collections.shuffle(passwordChars, random);

        // Tạo mật khẩu từ danh sách các ký tự
        StringBuilder password = new StringBuilder();
        for (char c : passwordChars) {
            password.append(c);
        }

        return password.toString();
    }

}