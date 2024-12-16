<%--
  Created by IntelliJ IDEA.
  User: JamesPakigon
  Date: 1/23/2024
  Time: 11:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<header id="header">
    <div class="grid wide">
        <nav class="navbar">
            <div class="hlogo">
                <div class="navbar__logo">
                    <a href="trangchu" class="navbar__logo--link">
                        <img src="./assets/img/logo/logo-2.jpg" alt="" class="navbar__logo--img">
                    </a>
                </div>
            </div>
            <div class="navbar__content">
                <ul class="navbar__list">
                    <li class="navbar__list--item">
                        <a href="#" class="navbar__list--link">
                            <!--                                Sẽ thay đổi dựa trong dữ liệu   -->
                            <i class="navbar__list-icon fa-regular fa-user">Admin</i>
                        </a>
                        <div class="account__info">
                            <a href="login.jsp" class="account_setting">Đổi tài khoản</a>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
</body>
</html>
