<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Xác thực tài khoản</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/css/change-password.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body class="all-form">

<!-- Begin: Header -->
<%@include file="header2.jsp"%>
<!-- End: Header -->

<form action="xacthuctaikhoan" method="post">
    <div class="modal">
        <div class="modal_overlay">
            <div class="modal_body">
                <div class="modal_inner">
                    <!-- Form xác thực email -->
                    <div class="login-register_container">
                        <img src="./assets/img/white-background/background-login.jpg" class="background-login_img">
                        <div class="forget-password_container" id="forget-password-container">
                            <div class="forget-password">
                                <div class="forget-password_header">
                                    <a href="dangky" class="forget-password_arrow">
                                        <i class="fa-solid fa-arrow-left" style="color: var(--primary-color);" id="back-arrow"></i>
                                    </a>
                                    <span class="forget-password_heading">Xác thực email</span>
                                </div>
                                <%
                                    String error = (String) request.getAttribute("error");
                                %>
                                <% if (error != null) { %>
                                <div class="text-danger" style="font-size: 1.5rem; color: red; margin-top:30px; margin-bottom: -52px; margin-left: 43px;"><%= error %></div>
                                <% } %>
                                <div class="forget-password_input">
                                    <div class="forget-password_group">
                                        <input name="code" type="text" class="forget-password_input" placeholder="Nhập mã xác thực" autofocus required>
                                    </div>
                                </div>
                                <div class="forget-password_control">
                                    <button type="submit" class="forget-password-btn">XÁC NHẬN</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Begin: Footer -->
<%@include file="footer.jsp"%>

</footer>
<!-- End: Footer -->
</body>
</html>
