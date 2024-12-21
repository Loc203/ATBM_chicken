<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/login.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <title>Đăng nhập</title>
</head>
<body class="all-form">

<!-- Begin: Header -->
<%@include file="header2.jsp"%>
<!-- End: Header -->

<!-- Begin: Modal -->
<div class="modal">
    <div class="modal_overlay">
        <div class="modal_body">
            <div class="modal_inner">
                <!-- Form đăng nhập -->
                <form action="dangnhap" method="post" id="login-form" onsubmit="checkCaptcha(event)">
                    <div class="login-register_container">
                        <img src="./assets/img/white-background/background-login.jpg" class="background-login_img">
                        <div class="login-form_container" id="login-container">
                            <div class="login-form">
                                <div class="login-form_header">
                                    <span class="login-form_heading">Đăng nhập</span>
                                </div>
                                <%
                                    String error = (String) request.getAttribute("error");
                                %>
                                <% if (error != null) { %>
                                <div class="text-danger" style="font-size: 1.5rem; color: red; margin-bottom: -23px;"><%= error %></div>
                                <% } %>
                                <div class="login-form_input">
                                    <div class="login-form_group">
                                        <input name="user" type="email" class="login-form_input" placeholder="Nhập email" autofocus required>
                                    </div>
                                    <div class="login-form_group">
                                        <input name="pass" type="password" class="login-form_input" placeholder="Nhập mật khẩu" required>
                                    </div>
                                    <div class="login-form_group">
                                    <div class="g-recaptcha" data-sitekey="6LdI1_kpAAAAADLADtDo_VPbEsRl6lpd_j-ZKhoV"></div>
                                    <div id="error" style="color: red; font-size: 1.2rem;"></div>
                                    </div>
                                    <div class="login-form_control">
                                        <button class="login-btn" type="submit">ĐĂNG NHẬP</button>
                                    </div>
                                    <div class="forget-change-password">
                                        <label class="forget-password_label">
                                            <a href="quenmatkhau" class="forget-password_label">Quên mật khẩu</a>
                                        </label>
                                    </div>
                                    <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=https://localhost:8443/login&response_type=code&client_id=224511662176-ekl8bu51fgqtp04m9dqnegm5ah8d6qjo.apps.googleusercontent.com&approval_prompt=force" class="google-login">
                                        <div class="register">
                                            <h3 class="google-text">Đăng nhập với Google</h3>
                                            <a href="" class="register-switch">
                                                <i style=" margin-left: 7px;" class="fa-brands fa-google"></i>
                                            </a>
                                        </div>
                                        </a>
                                    <div class="register">
                                        <h3>Bạn mới biết đến KFP?</h3>
                                        <a href="dangky" class="register-switch" style="margin-top: 17px; margin-left: 7px;">Đăng ký</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <!-- End: Form đăng nhập -->
            </div>
        </div>
    </div>
</div>
<!-- End: Modal -->

<!-- Begin: Footer -->
<%@include file="footer.jsp"%>
<!-- End: Footer -->

<script src="https://www.google.com/recaptcha/api.js?hl=vi" async defer></script>
<script type="text/javascript">
    function checkCaptcha(event) {
        event.preventDefault(); // Ngăn chặn việc gửi form mặc định
        var form = document.getElementById("login-form");
        var error = document.getElementById("error");
        var response = grecaptcha.getResponse();

        if (response) {
            form.submit(); // Nếu reCAPTCHA được xác thực, gửi form
        } else {
            error.textContent = "Vui lòng xác nhận bạn không phải là robot."; // Thông báo lỗi nếu reCAPTCHA chưa được bấm tích
        }
    }
</script>
</body>
</html>
