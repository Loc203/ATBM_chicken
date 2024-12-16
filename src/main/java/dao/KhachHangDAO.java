package dao;

import db.JDBIConnector;
import model.KhachHang;
import model.TruyCap;
import org.jdbi.v3.core.Jdbi;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class KhachHangDAO {
    private static Jdbi JDBI;
    private boolean updateSuccess;

    public static KhachHang getKhachHangByEmail(String email) {
        Optional<KhachHang> khachHang = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select maKH, tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi, maTC from khachhang where tenKH=?")
                        .bind(0, email)
                        .mapToBean(KhachHang.class).stream().findFirst()
        ));
        return khachHang.isEmpty() ? null : khachHang.get();
    }

    public KhachHang getUserByEmail(String email) {
        Optional<KhachHang> khachHang = JDBIConnector.me().withHandle((handle ->
                handle.createQuery("select maKH, tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi, maTC from khachhang where email=?")
                        .bind(0, email)
                        .mapToBean(KhachHang.class).stream().findFirst()
        ));
        return khachHang.isEmpty() ? null : khachHang.get();
    }
    // đăng nhập email
    public KhachHang login(String email, String password) {
        JDBI = JDBIConnector.me();

        Optional<KhachHang> optionalKhachHang = JDBI.withHandle(handle -> {
            // Lấy mật khẩu đã mã hóa từ cơ sở dữ liệu dựa trên email
            String hashedPassword = handle.createQuery("SELECT matKhau FROM khachhang WHERE email = :email")
                    .bind("email", email)
                    .mapTo(String.class)
                    .findFirst()
                    .orElse(null);

            // Kiểm tra xem mật khẩu đã mã hóa có tồn tại không
            if (hashedPassword != null && BCrypt.checkpw(password, hashedPassword)) {
                // Nếu mật khẩu khớp, trả về thông tin người dùng
                return handle.createQuery("SELECT maKH, tenKH, email, soDT, gioiTinh, ngaySinh, diaChi, maTC FROM khachhang WHERE email = :email")
                        .bind("email", email)
                        .mapToBean(KhachHang.class)
                        .findFirst();
            } else {
                // Nếu mật khẩu không khớp, trả về null
                return Optional.empty();
            }
        });

        // Trả về thông tin người dùng hoặc null nếu không tìm thấy
        return optionalKhachHang.orElse(null);
    }

    // đăng nhập google
    public KhachHang loginGoogle(String email, String code) {
        JDBI = JDBIConnector.me();

        Optional<KhachHang> optionalKhachHang = JDBI.withHandle(handle ->
                handle.createQuery("SELECT maKH, tenKH, email, matKhau, soDT, gioiTinh, ngaySinh, diaChi, maTC FROM khachhang WHERE email = :email AND code = :code")
                        .bind("email", email)
                        .bind("code", code)
                        .mapToBean(KhachHang.class)
                        .findFirst());

        // Kiểm tra xem kết quả có tồn tại không, nếu có thì trả về. Ngược lại, trả về null.
        return optionalKhachHang.orElse(null);
    }


    public boolean isLoginSuccessful(String email, String matkhau) {
        JDBI = JDBIConnector.me();

        Optional<KhachHang> optionalKhachHang = JDBI.withHandle(handle ->
                handle.createQuery("SELECT maKH, tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi FROM khachhang WHERE email = :email AND matKhau = :matKhau")
                        .bind("email", email)
                        .bind("matKhau", matkhau)
                        .mapToBean(KhachHang.class)
                        .findFirst());

        // Trả về true nếu đăng nhập thành công, ngược lại trả về false.
        if (optionalKhachHang.isPresent()) {
            return true; // Đăng nhập thành công
        } else {
            throw new RuntimeException("Sai email hoặc mật khẩu"); // Đăng nhập không thành công, ném ngoại lệ với thông báo lỗi
        }
    }

    public boolean isLoginSuccess(KhachHang account) {
        return account.getMaTC() != 0;
    }

    public boolean isAdminLoginSuccess(KhachHang account) {
        return account.getMaTC() == 2;
    }

    // kiểm tra xem email đã tồn tại chưa
    public KhachHang accountByEmailExist(String email) {
        JDBI = JDBIConnector.me();
        Optional<KhachHang> account = JDBI.withHandle(handle ->
                handle.createQuery("SELECT maKH, tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi,code FROM khachhang WHERE email = ? AND code != 'google'")
                        .bind(0, email)
                        .mapToBean(KhachHang.class)
                        .stream()
                        .findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    // kiểm tra xem email google đã tồn tại chưa
    public KhachHang accountByGoogleExist(String email) {
        JDBI = JDBIConnector.me();
        Optional<KhachHang> account = JDBI.withHandle(handle ->
                handle.createQuery("SELECT maKH, tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi,code FROM khachhang WHERE email = ? AND code = 'google'")
                        .bind(0, email)
                        .mapToBean(KhachHang.class)
                        .stream()
                        .findFirst()
        );
        return account.isEmpty() ? null : account.get();
    }

    // đăng ký tài khoản bằng email
    public void signUpKhachHang(String tenKH, String email, String matKhau, String soDT, String gioiTinh, Date ngaySinh, String diaChi) {
        JDBI = JDBIConnector.me();

        try {
            JDBI.useHandle(handle ->
                    handle.createUpdate("INSERT INTO khachhang (tenKH,email, matKhau,soDT,gioiTinh,ngaySinh, diaChi) " +
                                    "VALUES (?,?,?,?,?,?,?)")
                            .bind(0, tenKH)
                            .bind(1, email)
                            .bind(2, matKhau)
                            .bind(3, soDT)
                            .bind(4, gioiTinh)
                            .bind(5, ngaySinh)
                            .bind(6, diaChi)
                            .execute()
            );
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception or log it appropriately
        }
    }

    // đăng ký tài khoản bằng google
    public void signUpKhachHangGoogle(String tenKH, String email, String matKhau, String maTC, String code, String picture) {
        JDBI = JDBIConnector.me();

        try {
            JDBI.useHandle(handle ->
                    handle.createUpdate("INSERT INTO khachhang (tenKH, email, matKhau, maTC,code, picture) " +
                                    "VALUES (?, ?, ?, ?, ?, ?)")
                            .bind(0, tenKH)
                            .bind(1, email)
                            .bind(2, matKhau)
                            .bind(3, maTC) // Thêm tham số mã truy cập ( khác so với signUpKhachHang)
                            .bind(4, code) // Thêm tham số mã code ( khác so với signUpKhachHang)
                            .bind(5, picture) // Thêm tham số mã picture ( khác so với signUpKhachHang)
                            .execute()
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * Phương thức kiểm tra mật khẩu có hợp lệ hay không.
     * Mật khẩu hợp lệ phải có chiều dài từ 8 đến 20 ký tự và chứa ít nhất:
     * - Một chữ hoa
     * - Một chữ thường
     * - Một ký tự đặc biệt
     * - Một chữ số
     *
     * @param password Mật khẩu cần kiểm tra
     * @return true nếu mật khẩu hợp lệ, false nếu không hợp lệ
     */
    public boolean isValidPassword(String password) {
        // Kiểm tra nếu chiều dài của mật khẩu nằm trong khoảng từ 8 đến 20 ký tự
        int passwordLength = password.length();
        if (passwordLength < 8 || passwordLength > 20) {
            return false;
        }

        // Các biến để kiểm tra sự hiện diện của các loại ký tự khác nhau
        boolean hasUppercase = false;
        boolean hasLowercase = false;
        boolean hasDigit = false;
        boolean hasSpecialChar = false;

        // Chuỗi chứa các ký tự đặc biệt
        String specialCharacters = "!@#$%^&*()-+";

        // Duyệt qua từng ký tự trong mật khẩu
        for (char c : password.toCharArray()) {
            if (Character.isUpperCase(c)) {
                hasUppercase = true;
            } else if (Character.isLowerCase(c)) {
                hasLowercase = true;
            } else if (Character.isDigit(c)) {
                hasDigit = true;
            } else if (specialCharacters.indexOf(c) >= 0) {
                hasSpecialChar = true;
            }

            // Nếu tất cả các điều kiện đều thỏa mãn, trả về true ngay lập tức
            if (hasUppercase && hasLowercase && hasDigit && hasSpecialChar) {
                return true;
            }
        }

        // Trả về false nếu không thỏa mãn tất cả các điều kiện
        return false;
    }

    public boolean isValidEmail(String email) {
        // Biểu thức chính quy để kiểm tra định dạng email
        String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\.[a-zA-Z0-9_+&*-]+)*@(?:[a-zA-Z0-9-]+\\.)+[a-zA-Z]{2,7}$";

        // Tạo một đối tượng Pattern từ biểu thức chính quy
        Pattern pattern = Pattern.compile(emailRegex);

        // Tạo một đối tượng Matcher để so khớp biểu thức chính quy với chuỗi email
        Matcher matcher = pattern.matcher(email);

        // Trả về true nếu chuỗi email khớp với biểu thức chính quy, ngược lại trả về false
        return matcher.matches();
    }

    public boolean phoneValidation(String phone) {
        // Biểu thức chính quy cho số điện thoại: bắt đầu bằng số 0, theo sau bởi ít nhất 9 chữ số.
        String regex = "^0[0-9]{9}$";
        // Tạo một Pattern từ biểu thức chính quy
        Pattern pattern = Pattern.compile(regex);
        // Tạo một Matcher để so khớp chuỗi với biểu thức chính quy
        Matcher matcher = pattern.matcher(phone);
        // Kiểm tra xem chuỗi có khớp với biểu thức chính quy không
        return matcher.matches();
    }

    public String changeUsernameInfo(HttpServletRequest request, String tenKH) {
        String kh = new KhachHang().getTenKH();
        try {
            HttpSession session = request.getSession();
            int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
            if (tenKH != null && !tenKH.isEmpty()) {

                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET tenKH = :tenKH WHERE maKH = :id")
                                .bind("tenKH", tenKH)
                                .bind("id", id)
                                .execute()
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception or log it appropriately
        }
        return kh;
    }


    public String changeUserAddressInfo(HttpServletRequest request, String diaChi) {
        KhachHang khachHang = null;
        String kh = new KhachHang().getDiaChi();
        try {
            HttpSession session = request.getSession();
            khachHang = (KhachHang) session.getAttribute("acc");

            // Kiểm tra xem có thông tin nhập vào hay không
            if (diaChi != null && !diaChi.isEmpty()) {
                int id = khachHang.getMaKH();
                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET diaChi = :diaChi WHERE maKH = :id")
                                .bind("diaChi", diaChi)
                                .bind("id", id)
                                .execute()
                );

            }
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý ngoại lệ hoặc ghi log phù hợp
        }
        return kh;
    }

    // Phương thưc đổi số điện thoại
    public String changePhoneNumberInfo(HttpServletRequest request, String soDT) {
        String kh = new KhachHang().getSoDT();
        try {
            HttpSession session = request.getSession();
            int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
            if (soDT != null && !soDT.isEmpty()) {

                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET soDT = :soDT WHERE maKH = :id")
                                .bind("soDT", soDT)
                                .bind("id", id)
                                .execute()
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception or log it appropriately
        }
        return kh;
    }

    // Phương thức đổi giới tính
    public String changeGenderInfo(HttpServletRequest request, String gioiTinh) {
        String kh = new KhachHang().getGioiTinh();
        try {
            HttpSession session = request.getSession();
            int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
            if (gioiTinh != null && !gioiTinh.isEmpty()) {

                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET gioiTinh = :gioiTinh WHERE maKH = :id")
                                .bind("gioiTinh", gioiTinh)
                                .bind("id", id)
                                .execute()
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Handle the exception or log it appropriately
        }
        return kh;
    }

    // Phương thức đổi ngày sinh
    public String changeBirthDateInfo(HttpServletRequest request, Date ngaySinh) {
        String kh = new KhachHang().getTenKH();
        try {
            HttpSession session = request.getSession();
            int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
            if (ngaySinh != null) {

                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET ngaySinh = :ngaySinh WHERE maKH = :id")
                                .bind("ngaySinh", ngaySinh)
                                .bind("id", id)
                                .execute()
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return kh;
    }

    // Phương thức thay đổi mật khẩu
    public KhachHang changePassword(HttpServletRequest request, String newPassword) {
        KhachHang khachHang = null;
        try {
            HttpSession session = request.getSession();
            int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
            String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

            // Kiểm tra xem newPassword có giá trị trống hay không ( null )
            if (newPassword != null) {
                JDBI.useHandle(handle ->
                        handle.createUpdate("UPDATE khachhang SET matKhau = :hashedPassword WHERE maKH = :id")
                                .bind("hashedPassword", hashedPassword)
                                .bind("id", id)
                                .execute()
                );
            } else {
                // Nếu newPassword rỗng, không thực hiện cập nhật
                System.out.println("Không có mật khẩu mới để cập nhật.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return khachHang;
    }


    public static List<KhachHang> getAll() {
        String query = "SELECT kh.maKH, kh.tenKH, kh.email, kh.matKhau, kh.soDT, kh.gioiTinh, kh.ngaySinh, kh.diaChi, " +
                "tc.maTC, tc.tinhTrang " +
                "FROM khachhang kh " +
                "JOIN truycap tc ON kh.maTC = tc.maTC";
        List<KhachHang> khachHangs = new ArrayList<>();
        try {
            khachHangs = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(query)
                            .map((rs, ctx) -> {
                                int maKH = rs.getInt("maKH");
                                String tenKH = rs.getString("tenKH");
                                String email = rs.getString("email");
                                String matKhau = rs.getString("matKhau");
                                String soDt = rs.getString("soDT");
                                String gioiTinh = rs.getString("gioiTinh");
                                Date ngaySinh = rs.getDate("ngaySinh");
                                String diaChi = rs.getString("diaChi");

                                int maTC = rs.getInt("maTC");
                                String tinhTrang = rs.getString("tinhTrang");
                                TruyCap truyCap = new TruyCap(maTC, tinhTrang);

                                return new KhachHang(maKH, tenKH, email, matKhau, soDt, gioiTinh, ngaySinh, diaChi, maTC);
                            })
                            .list());
        } catch (Exception e) {
            e.printStackTrace();
        }
        return khachHangs;
    }

    public static boolean addKhachHang(KhachHang khachHang) {
        String insertQuery = "INSERT INTO khachhang (maKH, tenKH, email, matKhau, soDT, gioiTinh, ngaySinh, diaChi, maTC) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, null, ?)";

        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(insertQuery)
                            .bind(0, khachHang.getMaKH())
                            .bind(1, khachHang.getTenKH())
                            .bind(2, khachHang.getMatKhau())
                            .bind(3, khachHang.getEmail())
                            .bind(4, khachHang.getSoDT())
                            .bind(5, khachHang.getGioiTinh())
                            .bind(6, khachHang.getNgaySinh())
                            .bind(7, khachHang.getMaTC())
                            .execute()
            );
            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }

    public static boolean updateKhachHang(KhachHang khachHang) {
        String updateQuery = "UPDATE khachhang SET tenKH = ?, email = ?, matKhau = ?, soDT = ?, gioiTinh = ?, ngaySinh = ?, maTC = ? WHERE maKH = ?";
        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(updateQuery)
                            .bind(7, khachHang.getMaKH())
                            .bind(0, khachHang.getTenKH())
                            .bind(1, khachHang.getEmail())
                            .bind(2, khachHang.getMatKhau())
                            .bind(3, khachHang.getSoDT())
                            .bind(4, khachHang.getGioiTinh())
                            .bind(5, khachHang.getNgaySinh())
                            .bind(6, khachHang.getMaTC())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
    public static boolean updateAlert(int maKH){
        String updateQuery = "UPDATE khachhang SET alertKey = 0 WHERE maKH = ?";
        int rowsAffected = JDBIConnector.me().withHandle(handle ->
                handle.createUpdate(updateQuery)
                        .bind(0, maKH)
                        .execute()
        );
        return rowsAffected > 0;
    }

    public static boolean deleteKhachHang(KhachHang khachHang) {
        String deleteQuery = "DELETE FROM khachhang WHERE maKH = ?";
        try {
            int rowsAffected = JDBIConnector.me().withHandle(handle ->
                    handle.createUpdate(deleteQuery)
                            .bind(0, khachHang.getMaKH())
                            .execute()
            );

            return rowsAffected > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public String changePasswordMail(String newPassword, String email) {
        JDBI = JDBIConnector.me();

        try {
            // Kiểm tra xem newPassword và email có giá trị không trống
            if (newPassword != null && !newPassword.trim().isEmpty() && email != null && !email.trim().isEmpty()) {
                // Thực hiện cập nhật mật khẩu dựa trên email
                int updatedRows = JDBI.withHandle(handle -> {
                    return handle.createUpdate("UPDATE khachhang SET matKhau = :newPassword WHERE email = :email")
                            .bind("newPassword", newPassword)
                            .bind("email", email)
                            .execute();
                });

                if (updatedRows > 0) {
                    System.out.println("Mật khẩu đã được thay đổi thành công.");
                } else {
                    System.out.println("Không tìm thấy khách hàng với địa chỉ email đã cung cấp.");
                }
            } else {
                System.out.println("Mật khẩu mới hoặc địa chỉ email không hợp lệ.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Xử lý ngoại lệ hoặc ghi log một cách thích hợp
        }
        return newPassword;
    }

    public boolean changeMaTC(String code) {
        JDBI = JDBIConnector.me();

        try {
            int updatedRows = JDBI.withHandle(handle ->
                    handle.createUpdate("UPDATE khachhang SET maTC = 1 WHERE code = :code")
                            .bind("code", code)
                            .execute()
            );
            if (updatedRows > 0) {
                System.out.println("Mã Truy cập đã được thay đổi thành công");
                return true; // Cập nhật thành công
            } else {
                System.out.println("Không có mã nào được cập nhật");
                return false; // Không cập nhật
            }
        } catch (Exception e) {
            System.err.println("Lỗi trong quá trình cập nhật mã Truy cập: " + e.getMessage());
            return false; // Xử lý ngoại lệ và trả về false
        }
    }

    // phương thức cập nhật mã xác thực email
    public void updateCode(String email, String code) {
        try {
            System.out.println("Bắt đầu cập nhật mã xác thực cho email: " + email);
            System.out.println("Giá trị của mã xác thực là: " + code);

            JDBIConnector.me().useHandle(handle ->
                    handle.createUpdate("UPDATE khachhang SET code = :code WHERE email = :email")
                            .bind("email", email)
                            .bind("code", code)
                            .execute()
            );
            System.out.println("Mã mã xác thực đã được cập nhật thành công cho email: " + email);
        } catch (Exception e) {
            System.out.println("Lỗi khi cập nhật mã mã xác thực: " + e.getMessage());
            e.printStackTrace();
        }
    }

    // Chèn email vào trong bảng xacthuc nếu trước đó chưa có
    public String insertEmail(String email) {

        // Kiểm tra sự tồn tại của email trong bảng xacthuc
        boolean emailExists = JDBI.withHandle(handle ->
                handle.createQuery("SELECT COUNT(*) FROM xacthuc WHERE email = :email")
                        .bind("email", email)
                        .mapTo(Integer.class)
                        .findOne()
                        .orElse(0) > 0
        );

        // Nếu email đã tồn tại, không chèn thêm
        if (emailExists) {
            System.out.println("Email đã tồn tại trong bảng xacthuc: " + email);
            return null;
        }

        // Nếu email chưa tồn tại, thực hiện chèn email vào bảng xacthuc
        JDBI.useHandle(handle ->
                handle.createUpdate("INSERT INTO xacthuc (email) VALUES (:email)")
                        .bind("email", email)
                        .execute()
        );

        System.out.println("Email đã được thêm thành công: " + email);
        return email;
    }

    // Phương thức tạo mã mật khẩu dùng để xác nhận quên mâ khẩu
    public void updatePasswordCode(String email, String maMatKhau) {
        JDBIConnector.me().useHandle(handle ->
                handle.createUpdate("UPDATE xacthuc SET maMatKhau = :maMatKhau WHERE email = :email")
                        .bind("email", email)
                        .bind("maMatKhau", maMatKhau)
                        .execute()
        );
        System.out.println("Mã mật khẩu đã được cập nhật thành công cho email: " + email);
    }

    // Cập nhật lại mật khẩu nếu nhập đúng mã xác nhận mật khẩu ( không cho tài khoản google )
    public void updatePasswordIfCodeMatches(String inputCode, String newPassword) {
        JDBIConnector.me().useHandle(handle -> {
            try {
                // Truy vấn để lấy email từ bảng xacthuc dựa trên maMatKhau (code)
                Optional<String> emailOpt = handle.createQuery(
                                "SELECT email FROM xacthuc WHERE maMatKhau = :inputCode")
                        .bind("inputCode", inputCode)
                        .mapTo(String.class)
                        .findOne();

                // Kiểm tra nếu có kết quả trả về
                if (emailOpt.isPresent()) {
                    String email = emailOpt.get();

                    // Cập nhật matKhau mới trong bảng khachhang dựa trên email ( không bao gồm google )
                    int rowsUpdated = handle.createUpdate("UPDATE khachhang SET matKhau = :newPassword WHERE email = :email AND code != 'google'")
                            .bind("newPassword", newPassword)
                            .bind("email", email)
                            .execute();

                    updateSuccess = rowsUpdated > 0; // Cập nhật biến trạng thái
                    if (updateSuccess) {
                        System.out.println("Mật khẩu đã được cập nhật thành công cho email: " + email);
                    } else {
                        System.out.println("Cập nhật mật khẩu thất bại cho email: " + email);
                    }
                } else {
                    updateSuccess = false;
                    System.out.println("Không tìm thấy mã xác thực trong cơ sở dữ liệu.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                updateSuccess = false; // Cập nhật biến trạng thái khi gặp lỗi
                System.out.println("Có lỗi xảy ra trong quá trình cập nhật mật khẩu: " + e.getMessage());
            }
        });
    }


//    Lấy trạng thái cập nhật mật khẩu
//    * @return true nếu cập nhật thành công, false nếu không thành công

    public boolean isUpdateSuccess() {
        return updateSuccess;
    }

    //     Phương thức lấy email dựa trên mã xác nhận mật khẩu
    public String getEmailByCode(String code) {
        return JDBI.withHandle(handle ->
                handle.createQuery("SELECT email FROM xacthuc WHERE maMatKhau = :code")
                        .bind("code", code)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }

    //     Phương thức lấy email dựa trên mã xác nhận mật khẩu
    public String getEmailByCodeKH(String code) {
        return JDBI.withHandle(handle ->
                handle.createQuery("SELECT email FROM khachhang WHERE code = :code")
                        .bind("code", code)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }
    // Phương thức lấy mật khẩu dựa theo email
    public String getMatKhauByEmail(String email) {
        return JDBI.withHandle(handle ->
                handle.createQuery("SELECT matKhau FROM khachhang WHERE email = :email AND code != 'google'")
                        .bind("email", email)
                        .mapTo(String.class)
                        .findOne()
                        .orElse(null)
        );
    }
    public static KhachHang getKhachHangById(int id) {
        String sql = "SELECT maKH, tenKH, email, matKhau, soDT, gioiTinh, ngaySinh, maTC FROM khachhang WHERE maKH = ?";

        try {
            Optional<KhachHang> optionalKhachHang = JDBIConnector.me().withHandle(handle ->
                    handle.createQuery(sql)
                            .bind(0, id)
                            .mapToBean(KhachHang.class)
                            .findOne()
            );

            return optionalKhachHang.orElse(null);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}
