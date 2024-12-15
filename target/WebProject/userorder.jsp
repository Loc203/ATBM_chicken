<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.KhachHang" %>
<%@ page import="model.DonHang" %>
<%@ page import="java.util.List" %>
<%@ page import="java.net.URLEncoder" %>
<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    List<DonHang> donHangList = (List<DonHang>) request.getAttribute("donHangList");
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
    <title>Xem đơn hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/User-main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/vn.js"></script>
</head>
<body>
<div class="app">
        <%
        // Lấy thông tin từ session
        int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
        String username = ((KhachHang) session.getAttribute("acc")).getTenKH();
        String email = ((KhachHang) session.getAttribute("acc")).getEmail();

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
                                <i class="navbar__list-icon fa-regular fa-user"><%=email%>
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
                <div class="user-info"><a class="user-img" href="">
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
                                <a class="sb-item" href="xemdonhang">
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
                            <div class="rc-header">
                                <h1 class="rc-title">Xem đơn hàng</h1>
                                <div class="rc-desc">Xem trạng thái của đơn hàng</div>
                            </div>
                            <div class="rc-content">
                                <% if (donHangList != null && !donHangList.isEmpty()) { %>
                                <ul>
                                    <% for (DonHang donHang : donHangList) { %>
                                    <li style="padding-bottom: 12px;">
                                        Đơn Hàng <%= donHang.getMaDH() %> :
                                        <a href="orderTracking.jsp?maDH=<%= donHang.getMaDH() %>&trangThai=<%= URLEncoder.encode(donHang.getTrangThai(), "UTF-8") %>&ngayNhanHang=<%= URLEncoder.encode(donHang.getNgayNhanHang().toString(), "UTF-8") %>" style="text-decoration: none; color: blue; font-weight: bold;">
                                            xem trạng thái đơn hàng
                                        </a>
                                    </li>
                                    <% } %>
                                </ul>
                                <% } else { %>
                                <p>Không có đơn hàng nào.</p>
                                <% } %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End: Content-->

        <!-- Begin: Footer -->
        <%@include file="footer.jsp" %>
        <!-- End: Footer -->
    </div>
    <style>
        .rc-title {
            margin: 0;
        }
        .rc-desc {
            margin: 5px 0 0;
        }
        .rc-content {
            padding: 20px;
            background-color: #fff;
            border: 1px solid #e1e1e1;
            border-top: none;
            border-radius: 0 0 5px 5px;
            font-size: 1.6rem;
        }
    </style>
</body>
</html>