package controller;

import JavaMail.EmailService;
import JavaMail.IJavaMail;
import dao.KhachHangDAO;
import model.KhachHang;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.SecureRandom;
import java.util.Random;

@WebServlet(name = "MailController", value = "/quenmatkhau")
public class MailController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String to = request.getParameter("email");

        if (to == null) {
            // Nếu các tham số không tồn tại, chỉ cần chuyển tiếp
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);

            return;
        }
        String randomSixDigitString = generateRandomString();
        KhachHangDAO khd = new KhachHangDAO();

        // Kiểm tra email đã tồn tại hay chưa
        KhachHang kh = khd.accountByEmailExist(to);
        if (kh != null) {
            // Thêm email mới vào bảng xacthuc
            khd.insertEmail(to);
            // Luôn cập nhật mã xác thực (code) cho email
            khd.updatePasswordCode(to, randomSixDigitString);

            // Tạo nội dung email
            String mess = "Mã xác thực quên mật khẩu của bạn là: " + randomSixDigitString;

            // Gửi email
            IJavaMail emailService = new EmailService();
            emailService.send(to, "Cửa hàng KFP thông báo", mess);

            // Thiết lập thuộc tính để chỉ ra rằng email đã được gửi thành công
            request.setAttribute("emailSent", true);

            // Chuyển hướng tới trang xác thực quên mật khẩu
            response.sendRedirect("xacthucquenmatkhau");
        } else {
            // Email không tồn tại, chuyển hướng về trang quên mật khẩu
            request.setAttribute("error", "Tài khoản không tồn tại");
            request.getRequestDispatcher("changePassword.jsp").forward(request, response);
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
