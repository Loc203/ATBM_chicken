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

                        <%
                            // Kiểm tra xem session có tồn tại và có chứa thuộc tính "maTC" không
                            if (session.getAttribute("acc") != null && ((KhachHang) session.getAttribute("acc")).getMaTC() == 2) {
                        %>
                        <a href="./dashboard.jsp" class="navbar__list--link">
                            TRANG QUẢN LÝ
                        </a>
                        <%
                            }
                        %>
                    </li>
                    <li class="navbar__list--item">
                        <a href="trangchu" class="navbar__list--link navbar__list--link--active">
                            TRANG CHỦ
                        </a>
                    </li>
                    <li class="navbar__list--item">
                        <a href="thucdon" class="navbar__list--link">
                            THỰC ĐƠN
                        </a>
                    </li>
                    <li class="navbar__list--item">
                        <a href="vechungtoi" class="navbar__list--link">
                            VỀ KFP
                        </a>
                    </li>
                    <li class="navbar__list--item navbar__list--user" style="margin-right: -4px;">
                        <div class="dropdown" style="margin-right: 5px; display: flex; align-items: center;">
                            <i class="navbar__list-icon fa-regular fa-user"
                               style="margin-right: 5px; display: flex; align-items: center;"></i>
                            <%
                                // Kiểm tra xem session có tồn tại không
                                if (session.getAttribute("acc") != null) {
                            %>

                            <div class="dropdown-content">
                                <a href="thongtintaikhoan" class="navbar__list--link">
                                    THÔNG TIN TÀI KHOẢN
                                </a>
                                <a href="logout" class="navbar__list--link">
                                    ĐĂNG XUẤT
                                </a>
                            </div>
                        </div>
                    </li>
                    <%
                        }
                    %>

                    <%
                        // Kiểm tra xem session có tồn tại không
                        if (session.getAttribute("acc") != null) {
                            // Lấy đối tượng người dùng từ session
                            KhachHang userObj = (KhachHang) session.getAttribute("acc");

                            // Kiểm tra xem đối tượng có tồn tại không
                            if (userObj != null) {
                                // Ép kiểu đối tượng người dùng
                                KhachHang user = (KhachHang) userObj;
                    %>
                    <p style="display: flex; align-items: center; text-decoration: none; font-size: 1.6rem; color: var(--header-color); line-height: 30px; font-weight: 700; margin-right: 10px;">
                        <%= user.getEmail() %>
                    </p>
                    <!-- Thêm các thông tin khác của người dùng nếu cần -->
                    <%
                            }
                        }
                    %>

                    <%
                        // Kiểm tra xem session có tồn tại không
                        if (session.getAttribute("acc") != null) {
                    %>
                    <%
                    } else {
                    %>
                    <a href="dangnhap" class="navbar__list--link">
                        ĐĂNG NHẬP
                    </a>
                    <%
                        }
                    %>

                    <!--                                <img src="https://down-vn.img.susercontent.com/file/0f829c741e66f7b9bdd65cf03a782ed8_tn" alt="" class="navbar__list-user-img">-->
                    <!--                                <span class="navbar__list-user-name">Nguyên Dương</span>-->

                    <!--                                <ul class="navbar__list-user-menu">-->
                    <!--                                    <li class="navbar__list-user-item">-->
                    <!--                                        <a href="">Tài khoản của tôi</a>-->
                    <!--                                    </li>-->
                    <!--                                    <li class="navbar__list-user-item navbar__list-user-item&#45;&#45;seperate">-->
                    <!--                                        <a href="">Đăng xuất</a>-->
                    <!--                                    </li>-->
                    <!--                                </ul>-->
                    </li>
                    <li class="navbar__list--item">
                        <a href="giohang" class="navbar__list--link">
                            <i class="navbar__list-icon fa-solid fa-cart-shopping"></i>
                        </a>
                        <div class="cart-quantity">
                                    <span class="quantity">
                                        <%= gh.getToTal()%>
                                    </span>
                        </div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</header>
<!-- End: Header -->


</body>
</html>