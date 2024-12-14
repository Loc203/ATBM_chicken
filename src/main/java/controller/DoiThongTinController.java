package controller;

import com.google.gson.Gson;
import com.google.gson.JsonSyntaxException;
import dao.KhachHangDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "DoiThongTinController", value = "/thongtintaikhoan")
public class DoiThongTinController extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        resp.setContentType("application/json");

        // Đọc dữ liệu JSON từ request body
        StringBuilder jsonBuffer = new StringBuilder();
        try (BufferedReader reader = req.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                jsonBuffer.append(line);
            }
        } catch (IOException e) {
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Chuyển đổi JSON thành Map
        Map<String, Object> formData;
        try {
            formData = new Gson().fromJson(jsonBuffer.toString(), HashMap.class);
        } catch (JsonSyntaxException e) {
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra nếu formData null
        if (formData == null) {
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Retrieve parameters from the formData
        String username = (String) formData.get("username");
        String phone = (String) formData.get("phone");
        String gioiTinh = (String) formData.get("gioiTinh");
        String ngaySinhStr = (String) formData.get("ngaySinh");
        String diaChi = (String) formData.get("address");

        // Create a Map for response
        Map<String, Object> responseMap = new HashMap<>();

        // Kiểm tra xem các tham số của form có tồn tại không
        if (username == null || phone == null || gioiTinh == null || ngaySinhStr == null || diaChi == null) {
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Parse and validate the date format
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        java.util.Date utilDate;
        try {
            utilDate = dateFormat.parse(ngaySinhStr);
        } catch (ParseException e) {
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Convert java.util.Date to java.sql.Date
        Date ngaySinh = new Date(utilDate.getTime());
        KhachHangDAO kad = new KhachHangDAO();


        // Kiểm tra số điện thoại
        if (!kad.phoneValidation(phone) && phone != null && !phone.isEmpty()) {
            responseMap.put("error", "Vui lòng nhập đúng số điên thoại");
            req.getRequestDispatcher("user.jsp").forward(req, resp);
            return;
        }

        // Kiểm tra và thay đổi thông tin
        String kh = kad.changeUsernameInfo(req, username);
        String kh_2 = kad.changeUserAddressInfo(req, diaChi);
        String kh_3 = kad.changeBirthDateInfo(req, ngaySinh);
        String kh_4 = kad.changePhoneNumberInfo(req, phone);
        String kh_5 = kad.changeGenderInfo(req, gioiTinh);

        if (kh != null || kh_2 != null || kh_3 != null || kh_4 != null || kh_5 != null) {
            responseMap.put("success", true);
        } else {
            responseMap.put("success", false);
        }

        // Convert responseMap to JSON using Gson
        String jsonResponse = new Gson().toJson(responseMap);
        PrintWriter out = resp.getWriter();
        out.print(jsonResponse);
        out.flush();
    }
}

