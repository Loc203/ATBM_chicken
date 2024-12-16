<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Cart.GioHang" %>
<%@ page import="model.KhachHang" %>
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
    <title>Thông tin tài khoản</title>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="app">
    <!-- Đoạn mã Java để lấy thông tin từ session -->
    <%
        // Lấy thông tin từ session
        int id = ((KhachHang)session.getAttribute("acc")).getMaKH();
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
                                <!-- Sẽ thay đổi dựa trên dữ liệu -->
                                <i class="navbar__list-icon fa-regular fa-user"><%= email %>
                                </i>
                            </a>
                            <div class="account__info">
                                <a href="logout" class="account_setting" style="margin-top: -10%;">Đổi tài khoản</a>
                                <a href="reportkey" class="account_setting" style="margin-top: 4%;">Báo cáo khóa</a>

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
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-col">
                <div class="rc-container" role="main">
                    <div style="display: contents;">
                        <div class="rc-contentbox">
                            <div class="rc-header"><h1 class="rc-title">Hồ sơ của tôi</h1>
                                <div class="rc-desc">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
                            </div>
                            <form id="updateInfoForm" action="thongtintaikhoan" method="post">
                                <div class="rc-form">
                                    <div class="rc-content">
                                        <table class="table-content">
                                            <!-- Thông báo lỗi và thành công -->
                                            <div id="updateMessage"></div>

                                            <tr>
                                                <td class="row-desc"><label>Mã khách hàng</label></td>
                                                <td class="row-content">
                                                    <div class="text-type">
                                                        <div class="info-text"><%= id %></div>
                                                        <button class="button"></button>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Tên</label></td>
                                                <td class="row-content">
                                                    <div>
                                                        <div id="username" class="text-box">
                                                            <input name="username" type="text"
                                                                   placeholder="<%= username %>"
                                                                   class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Email</label></td>
                                                <td class="row-content">
                                                    <div class="text-type">
                                                        <div class="info-text"><%= email %></div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Số điện thoại</label></td>
                                                <td class="row-content">
                                                    <div class="text-type">
                                                        <div id="phone" class="text-box">
                                                            <input name="phone" type="text"
                                                                   placeholder="<%= phone %>"
                                                                   class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Giới tính</label></td>
                                                <td class="row-content">
                                                    <div class="dropbox">
                                                        <div class="col-md-6 col-sm-12 mb-3">
                                                            <div class="form-floating">
                                                                <select name="gioiTinh" id="gioiTinh"
                                                                        style="font-size: 1.5rem;">
                                                                    <option value="Nam" <%= gender.equals("Nam") ? "selected" : "" %>>Nam</option>
                                                                    <option value="Nữ" <%= gender.equals("Nữ") ? "selected" : "" %>>Nữ</option>
                                                                    <option value="Khác" <%= gender.equals("Khác") ? "selected" : "" %>>Khác</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Ngày sinh</label></td>
                                                <td class="row-content">
                                                    <div class="Date">
                                                        <input id="ngaySinh" name="ngaySinh" type="date"
                                                               class="register-form_input"
                                                               value="<%= birth %>" required>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"><label>Địa chỉ</label></td>
                                                <td class="row-content">
                                                    <div>
                                                        <div id="address" class="text-box">
                                                            <input name="address" type="text"
                                                                   placeholder="<%= address %>"
                                                                   class="input-box" value="">
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="row-desc"></td>
                                                <td class="row-content">
                                                    <button type="submit"
                                                            class="btn btn-solid-primary btn--m btn--inline"
                                                            aria-disabled="false">Lưu
                                                    </button>
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End: Content -->

    <script>
        document.addEventListener('DOMContentLoaded', function() {
            flatpickr("#ngaySinh", {
                "locale": "vn",
                dateFormat: "d-m-Y",
            });
        });
    </script>
    <script>
        $(document).ready(function () {
            $("#updateInfoForm").submit(function (event) {
                event.preventDefault();

                var formData = {
                    username: $("input[name='username']").val(),
                    phone: $("input[name='phone']").val(),
                    gioiTinh: $("#gioiTinh").val(),
                    ngaySinh: $("#ngaySinh").val(),
                    address: $("input[name='address']").val()
                };

                console.log("Form Data:", formData);

                $.ajax({
                    type: "POST",
                    contentType: "application/json",
                    url: "thongtintaikhoan",
                    data: JSON.stringify(formData),
                    dataType: 'json',
                    success: function (response) {
                        console.log("Response from server:", response);
                        if (response.success) {
                            $("#updateMessage").html("<div class='success-message'>Thay đổi thông tin thành công</div>");
                        } else {
                            $("#updateMessage").html("<div class='success-message'>Thay đổi thông tin thành công</div>");
                        }
                    },
                    error: function (e) {
                        console.log("Error: ", e);
                        console.log("Response Text: ", e.responseText); // Log the response text for debugging
                        $("#updateMessage").html("<div class='error-message'>Vui lòng nhập đúng số điện thoại</div>");
                    }
                });
            });
        });

    </script>

    <%@include file="footer.jsp"%>
</div>
<style>
    .error-message{
        font-size: 1.5rem;
        color: red;
        margin-left: 30%;
    }
    .success-message{
        font-size: 1.5rem;
        color: green;
        margin-left: 30%;
    }
</style>
</body>
</html>

