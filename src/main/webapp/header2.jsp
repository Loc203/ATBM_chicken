<%@ page import="Cart.GioHang" %>
<%@ page import="model.KhachHang" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    GioHang gh = (GioHang) session.getAttribute("cart");
    if (gh == null) gh = new GioHang();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thực Đơn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<!-- Begin: Header -->
<header id="header" style="z-index: 1000">
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

                    </li>
                    <li class="navbar__list--item">

                    </li>
                    <li class="navbar__list--item">

                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- End: Header -->


</body>
</html>