<%--
  Created by IntelliJ IDEA.
  User: HP
  Date: 5/17/2024
  Time: 3:09 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck != null && userCheck.getMaTC() == -1) {
%>
<!-- Cho ra trang sau nếu maTC của người dùng trùng với bị cấm(a.k.a -1) -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Account Banned</title>
</head>
<body>
<p>Tài khoản của bạn đã bị cấm, <a href="login.jsp">click vào đây</a> để quay lại đăng nhập.</p>
</body>
</html>
<%
        return;
    }
%>
<html>
<head>
    <title>Liên hệ</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/menu.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<style>
    .contact-form {
        height: 600px;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        background-color: #f7f7f6;
        margin-top: 80px;
    }
    .title-form h3 {
        font-size: 2.4rem;
        color: var(--primary-color);
    }

    .content-form {
        font-size: 1.6rem;
    }

    .form-input input {
        width: 540px;
        height: 45px;
        margin: 8px 0;
        border: none;
        padding: 8px;
        border-radius: 8px;
    }

    .form-input textarea {
        width: 540px;
        height: 80px;
        margin: 8px 0;
        border: none;
        padding: 8px;
        border-radius: 8px;
    }

    .group-submit {
        display: flex;
        justify-content: space-around;
        align-items: center;
    }

    .group-submit button {
        width: 140px;
        height: 50px;
        color: var(--header-color);
        background-color: var(--primary-color);
        border-radius: 8px;
        border: none;
    }

    .group-submit button:hover {
        background-color: var(--header-color);
        color: var(--white-color);
        cursor: pointer;
        transition: linear .3s;
    }
</style>
<body>
    <!-- Begin: Header -->
    <%@include file="header.jsp"%>
    <!-- End: Header -->
    <div class="app">
        <div class="grid wide">
            <div class="row">
                <div class="col l-12">
                    <div class="contact-form">
                        <div class="title-form">
                            <h3>GỬI THÔNG TIN CHO CHÚNG TÔI</h3>
                        </div>
                        <div class="content-form">
                            <form class="form-contact" action="">
                                <div class="form-input">
                                    <input type="text" name="name" required placeholder="Họ tên *">
                                </div>
                                <div class="form-input">
                                    <input type="tel" name="tel" required placeholder="Điện thoại *">
                                </div>
                                <div class="form-input">
                                    <input type="email" name="email" placeholder="Email">
                                </div>
                                <div class="form-input">
                                    <textarea name="content" id="" placeholder="Nội dung *"></textarea>
                                </div>
                                <div class="group-submit">
                                    <div class="captcha">
                                        <div class="g-recaptcha" data-sitekey="6LfC3N8pAAAAAATV96nSWxONZBibLMmUZ-NvBIwO"></div>
                                    </div>
                                    <div class="send">
                                        <button type="submit">
                                            <i class='fa fa-paper-plane'></i>
                                            Gửi
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Begin: Footer -->
    <%@include file="footer.jsp"%>
    <!-- End: Footer -->
</body>
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
</html>
