<%@ page import="model.KhachHang" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck.getMaTC() == -1) {
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đổi mật khẩu</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/User-main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app">

    <%
        // Lấy thông tin từ session
        int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
        String username = ((KhachHang) session.getAttribute("acc")).getTenKH();
        String email = ((KhachHang) session.getAttribute("acc")).getEmail();
        String phone = ((KhachHang) session.getAttribute("acc")).getSoDT();
        String address = ((KhachHang) session.getAttribute("acc")).getDiaChi();
        String birth = ((KhachHang) session.getAttribute("acc")).getNgaySinh().toString();
        String gender = ((KhachHang) session.getAttribute("acc")).getGioiTinh();
    %>
    <!-- Begin: Header -->
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
                                <i class="navbar__list-icon fa-regular fa-user"><%= email %>
                                </i>
                            </a>
                            <div class="account__info">
                                <a href="logout" class="account_setting">Đổi tài khoản</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </header>
    <div class="app__content">
        <!-- Begin: Content -->
        <div class="container info">
            <div class="left-col">
                <div class="user-info"><a class="user-img" href="#">
                    <div class="avatar">
                        <img class="avatar__img"
                             src="https://down-vn.img.susercontent.com/file/d5ad3acf45214b97e525f2c2785f3a36_tn"></div>
                </a>
                    <div class="user-setting">
                        <div class="username">Tài khoản</div>
                        <div><a class="change-username" href="#">
                            <svg width="12" height="12" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                 style="margin-right: 4px;">
                                <path d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
                                      fill="#9B9B9B" fill-rule="evenodd"></path>
                            </svg>
                        </a>
                        </div>
                    </div>
                </div>
                <div class="sidebar">
                    <div class="stardust-dropdown stardust-dropdown--open">
                        <div class="stardust-dropdown__item-header"><a class="header-itemlink" href="#">
                            <div class="thumbnail">
                                <img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4">
                            </div>
                            <div class="sbheader-container"><span class="item-header">Tài khoản của tôi</span></div>
                        </a>
                        </div>
                        <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open"
                             style="opacity: 1;">
                            <div class="sidebar-content">
                                <a class="sb-item" href="thongtintaikhoan">
                                    <span class="sbi-content">Hồ sơ</span>
                                </a>
                                <a class="sb-item" href="doimatkhau">
                                    <span class="sbi-content">Đổi mật khẩu</span>
                                </a>
                                <a class="sb-item" href="xemdonhang">
                                    <span class="sbi-content">Xem đơn hàng</span>
                                </a>
                                <a class="sb-item" href="userKey.jsp">
                                    <span class="sbi-content">Yêu cầu khóa mới</span>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-col">
                <div class="rc-container" role="main">
                    <div style="display: contents;">
                        <div class="rc-contentbox">
                            <div class="rc-header"><h1 class="rc-title">Đổi mật khẩu</h1>
                                <div class="rc-desc">Quản lý mật khẩu người dùng để bảo mật</div>
                            </div>

                            <div class="rc-form">
                                <div class="rc-content">

                                    <!-- Div để hiển thị thông báo lỗi -->
                                    <div id="errorDiv"></div>

                                    <form action="doimatkhau" method="post">
                                        <table class="table-content">
                                            <%
                                                String error = (String) request.getAttribute("error");
                                            %>
                                            <% if (error != null) { %>
                                            <div class="text-danger" style="font-size: 1.5rem; color: red; margin-left: 249px;"><%= error %></div>
                                            <% } %>
                                            <tr>
                                                <td class="row-desc"><label>Mật khẩu cũ</label></td>
                                                <td class="row-content">
                                                    <div>
                                                        <div class="text-box"><input name="password" type="password"
                                                                                     placeholder=""
                                                                                     class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Mật khẩu mới</label></td>
                                                <td class="row-content">
                                                    <div>
                                                        <div class="text-box"><input name="newPassword_1"
                                                                                     type="password"
                                                                                     placeholder=""
                                                                                     class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Nhập lại mật khẩu mới</label></td>
                                                <td class="row-content">
                                                    <div>
                                                        <div class="text-box"><input name="newPassword_2"
                                                                                     type="password"
                                                                                     placeholder=""
                                                                                     class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label></label></td>
                                                <td class="row-content">
                                                    <button type="submit"
                                                            class="btn btn-solid-primary btn--m btn--inline"
                                                            aria-disabled="false">Lưu
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--End: Content-->

    <!--Begin: Footer-->
    <footer id="footer">
        <div class="grid wide">
            <div class="row">
                <div class="footer-info col l-4">
                    <h3 class="footer-title">KFP CHICKEN VIETNAM</h3>
                    <ul class="footer-list">
                        <li class="footer-list__item">
                            <i class="footer-icon fa-solid fa-location-dot"></i>
                            Khu Phố 6, Thủ Đức, Thành phố Hồ Chí Minh
                        </li>
                        <li class="footer-list__item">
                            <i class="footer-icon fa-solid fa-phone"></i>
                            0123456789
                        </li>
                        <li class="footer-list__item">
                            <i class="footer-icon fa-regular fa-envelope"></i>
                            lamhongphuc0110@gmail.com
                        </li>
                        <li class="footer-list__item">
                            <i class="footer-icon fa-solid fa-globe"></i>
                            https://onlyfans.com/hongphuclam
                        </li>
                    </ul>
                </div>
                <div class="footer-info col l-4">
                    <h3 class="footer-title">Thông Tin</h3>
                    <ul class="footer-list">
                        <li class="footer-list__item">
                            <a href="#" class="footer-list__item--link">
                                Về KFP Chicken
                            </a>
                        </li>
                        <li class="footer-list__item">
                            <a href="#" class="footer-list__item--link">
                                Thực đơn
                            </a>
                        </li>
                    </ul>
                </div>
                <div class="footer-info col l-4">
                    <ul class="footer-list__socials">
                        <h3 class="footer-title">Kết Nối</h3>
                        <li class="footer-list__item">
                            <a href="https://www.facebook.com/profile.php?id=100004867398813"
                               class="footer-list__item-social--link">
                                <i class="footer-icon fa-brands fa-facebook"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                Copyright © 2023 Nhóm 35
            </div>
        </div>
    </footer>
</div>
</body>
</html>