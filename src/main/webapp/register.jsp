<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/register.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/vn.js"></script>
    <title>Đăng ký</title>
</head>
<body class="all-form">

<!-- Begin: Header -->
<%@include file="header2.jsp"%>
<!-- End: Header -->

<div class="modal">
    <div class="modal_overlay">
        <div class="modal_body">
            <div class="modal_inner">
                <div class="login-register_container">
                    <img src="./assets/img/white-background/background-login.jpg" class="background-login_img">
                    <!-- Form đăng ký-->

                    <form action="dangky" method="post">

                        <div class="register-form_container" id="register-container">
                            <div class="register-form">
                                <div class="register-form_header">
                                    <span class="register-form_heading">Đăng ký</span>
                                </div>
                                <%
                                    String error = (String) request.getAttribute("error");
                                %>
                                <% if (error != null) { %>
                                <div class="text-danger" style="font-size: 1.5rem; color: red; margin-top:30px; margin-bottom: -30px;"><%= error %></div>
                                <% } %>
                                <div class="register-form_input">
                                    <div class="register-form_group">
                                        <input name="userName" type="text" class="register-form_input"
                                               placeholder="Nhập tên khách hàng" autofocus required>
                                    </div>

                                    <div class="register-form_group">
                                        <input name="user" type="email" class="register-form_input"
                                               placeholder="Nhập email" required>
                                    </div>
                                    <p class="small-text-password">* Bao gồm ít nhất  1 ký tự ghi hoa, ghi thường, chữ số và  ký tự đặc biệt ( 8~20 ký tự )</p>
                                    <div class="register-form_group">
                                        <input name="pass" type="password" class="register-form_input"
                                               placeholder="Nhập mật khẩu ">
                                    </div>
                                    <div class="register-form_group">
                                        <input name="repass" type="password" class="register-form_input"
                                               placeholder="Nhập lại mật khẩu" required>
                                    </div>

                                    <div class="register-form_input--col">
                                        <div class="register-form_group--col">
                                            <input name="phone" class="register-form_input--col" type="text"
                                                   placeholder="Số điện thoại">
                                        </div>

                                        <div class="register-form_group--col">
                                            <label name="gioiTinh" for="gioiTinh" style="font-size: 1.5rem;">Chọn giới
                                                tính:</label>
                                            <select name="gioiTinh" id="gioiTinh" style="font-size: 1.5rem;">
                                                <option value="Nam">Nam</option>
                                                <option value="Nữ">Nữ</option>
                                                <option value="Khác">Khác</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="register-form_input--col">
                                        <div class="register-form_group--col">
                                            <p class="small-text">* Quận Huyện, Phường Xã</p>
                                            <input name="diaChi" type="text" class="register-form_input"
                                                   placeholder="Nhập địa chỉ" required>
                                        </div>

                                        <div class="register-form_group--col">
                                            <input id ="ngaySinh" name="ngaySinh" type="date" class="register-form_input"
                                                   placeholder="Ngày sinh" required>
                                        </div>


                                    </div>


                                    <div class="register-form_control" style="padding-top: 28px;">

                                        <button type="submit" class="register-btn" style="padding-top: -15px;">ĐĂNG KÝ</button>
                                        </div>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=https://localhost:8443/login&response_type=code&client_id=224511662176-ekl8bu51fgqtp04m9dqnegm5ah8d6qjo.apps.googleusercontent.com&approval_prompt=force" class="google-login">
                                        <div class="register" style="margin-top: -5px;">
                                            <h3 class="google-text">Đăng ký với Google</h3>
                                            <a href="" class="register-switch">
                                                <i style=" margin-left: 7px;" class="fa-brands fa-google"></i>
                                            </a>
                                        </div>
                                    </a>
                                        <div class="register" style="margin-top: -5px;">
                                            <h3>Bạn đã có tài khoản?</h3>
                                            <a href="dangnhap" class="login-switch" style="margin-top: 17px; margin-left: 7px;">Đăng nhập</a>
                                        </div>
                                    </div>
                                    </div>
                                </div>
                            </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        flatpickr("#ngaySinh", {
            "locale": "vn",
            dateFormat: "d-m-Y",
        });
    });
</script>
<style>
    .small-text{
        margin-top: -1px;
        margin-bottom: -13px;
        font-size: 1rem;
        color: red;
    }
    .small-text-password{
        margin-top: 7px;
        margin-bottom: -15px;
        font-size: 1rem;
        color: red
    }
</style>
</body>
</html>

<!-- Begin: Footer -->
<%@include file="footer.jsp"%>
<!-- End: Footer -->
</body>
</html>
