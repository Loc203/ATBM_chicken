/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;


import Google.GoogleLogin;
import dao.KhachHangDAO;
import dao.LogDAO;
import model.GoogleAccount;
import model.KhachHang;
import model.Log;
import model.LogLevels;
import org.mindrot.jbcrypt.BCrypt;

import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "DangNhapGoogleController", value = "/login")
public class DangNhapGoogleController extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        // Lấy các tham số từ request
        String code = request.getParameter("code");
        String error = request.getParameter("error");

        // Nếu người dùng hủy ủy quyền
        if (error != null) {
            request.getRequestDispatcher("dangnhap").forward(request, response);
            return;  // Thêm return để ngăn mã phía sau chạy tiếp
        }

        // Khởi tạo session và DAO
        HttpSession session = request.getSession();
        KhachHangDAO khd = new KhachHangDAO();

        // Đăng nhập Google và lấy thông tin người dùng
        GoogleLogin gg = new GoogleLogin();
        String accessToken = gg.getToken(code);
        GoogleAccount account = gg.getUserInfo(accessToken);

        // Đăng nhập và lấy đối tượng KhachHang
        KhachHang kh_1 = khd.accountByGoogleExist(account.getEmail());

        // Nếu đã tồn tại email google
        if (kh_1 != null) {
            // Đăng nhập, lưu thông tin vào session và trả về trang chủ
            KhachHang kh_2 = khd.loginGoogle(account.getEmail(), "google");
            session.setAttribute("acc", kh_2);
            // Đặt lại thời gian timeout của session là 30 phút (30 * 60 giây)
            session.setMaxInactiveInterval(30*60);
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(request.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue("Đã có tài khoản google");
            log.setAfterValue(kh_2.afterValue());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            response.sendRedirect("trangchu");
        } else {
            // Tạo mật khẩu ngẫu nhiên và băm mật khẩu
            String password = generateRandomPassword();
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt());
            // Đăng ký google
            khd.signUpKhachHangGoogle(account.getGiven_name() + " " +account.getFamily_name(),account.getEmail(),hashedPassword,"1","google", account.getPicture());
            // Đăng nhập dựa trên tài khoản google vừa đăng ký
            KhachHang kh_4 = khd.loginGoogle(account.getEmail(), "google");
            session.setAttribute("acc", kh_4);
            // Đặt lại thời gian timeout của session là 30 phút (30 * 60 giây)
            session.setMaxInactiveInterval(30*60);
            LogDAO logDAO = new LogDAO();
            Log log = new Log();
            log.setLogLevels(LogLevels.INFO);
            log.setIp(request.getRemoteAddr());
            log.setAddress("khachhang");
            log.setBeforeValue("Chưa có tài khoản google");
            log.setAfterValue(kh_4.afterValue());
            log.setCreateAt(LocalDateTime.now());
            logDAO.addLog(log);
            response.sendRedirect("trangchu");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    // Hàm tạo mật khẩu ngẫu nhiên có độ dài 20 ký tự, đảm bảo có ít nhất:
    // - Một chữ hoa
    // - Một chữ thường
    // - Một ký tự đặc biệt
    // - Một chữ số
    // @return Mật khẩu ngẫu nhiên
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

        // Thêm các ký tự ngẫu nhiên khác cho đủ độ dài mật khẩu (20 ký tự)
        String allAllowedChars = upperCaseLetters + lowerCaseLetters + digits + specialCharacters;
        for (int i = 4; i < 20; i++) {
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
