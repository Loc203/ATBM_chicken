<%@ page import="model.KhachHang" %>
<%@ page import="java.util.List" %>
<%
    // Kiểm tra maTC của session
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck == null || (userCheck.getMaTC() != 2)) {
        response.sendRedirect("trangchu");
        return;
    } else if (userCheck.getMaTC() == -1) {
%>
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
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/table-user.css">
    <link rel="stylesheet" href="./assets/css/User-main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app">

    <!-- Begin: Header -->
    <%@ page import="Cart.GioHang" %>
    <%@ page import="model.KhachHang" %>
    <%@page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        GioHang gh = (GioHang) session.getAttribute("cart");
        if (gh == null) gh = new GioHang();
    %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
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
                            <a href="trangchu" class="navbar__list--link">
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
                        <li class="navbar__list--item navbar__list--user"
                            style="margin-right: -4px;margin-bottom: -33px;">
                            <div class="dropdown" style="margin-right: 5px; display: flex; align-items: center;">
                                <i class="navbar__list-icon fa-regular fa-user"
                                   style="margin-right: 5px; display: flex; align-items: center;    "></i>
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
                        <p style="display: flex; align-items: center; text-decoration: none; font-size: 1.6rem; color: var(--header-color); line-height: 30px; font-weight: 700; margin-right: 10px; margin-bottom: auto;margin-top: 40px;">
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
                                <i class="navbar__list-icon fa-solid fa-cart-shopping" style="margin-bottom: 5px"></i>
                            </a>
                            <div class="cart-quantity" style="top: 32px;">
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

    <!-- Begin: Content -->
    <div class="app__content">
        <div class="container info">
            <div class="left-col">
                <div class="user-info"><a class="user-img" href="admin.jsp">
                    <div class="avatar">
                        <img class="avatar__img"
                             src="https://down-vn.img.susercontent.com/file/d5ad3acf45214b97e525f2c2785f3a36_tn"></div>
                </a>
                    <div class="user-setting">
                        <div class="username">Admin</div>
                        <div><a class="change-username" href="admin.jsp">
                            <svg width="12" height="12" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                 style="margin-right: 4px;">
                                <path d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
                                      fill="#9B9B9B" fill-rule="evenodd"></path>
                            </svg>
                            Sửa hồ sơ</a>
                        </div>
                    </div>
                </div>
                <div class="sidebar">
                    <div class="dropdown">
                        <div class="dropdown-header">
                            <div class="header-link">
                                <div class="thumbnail">
                                    <img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4">
                                </div>
                                <div class="header-title">Admin</div>
                            </div>
                        </div>
                        <div class="dropdown-body">
                            <a class="dropdown-item" href="dashboard.jsp">Dashboard</a>
                            <a class="dropdown-item" href="log.jsp">Log</a>
                        </div>
                    </div>
                    <div class="dropdown">
                        <div class="dropdown-header" style="padding: 5px;">
                            <div class="header-link">
                                <div class="thumbnail">
                                    <img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4">
                                </div>
                                <div class="header-title">Danh sách quản lý</div>
                            </div>
                        </div>
                        <div class="dropdown-body">
                            <a class="dropdown-item" href="products.jsp">Quản lý sản phẩm</a>
                            <a class="dropdown-item" href="customer.jsp">Quản lý khách hàng</a>
                            <a class="dropdown-item" href="orders.jsp">Quản lý đơn hàng</a>
                            <a class="dropdown-item" href="ingredient.jsp">Quản lý nguyên liệu</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-col">
                <div class="rc-container" role="main">
                    <div style="display: contents;">
                        <div class="rc-contentbox">
                            <div class="rc-header">
                                <h1 class="rc-title">Dashboard</h1>
                            </div>
                            <div class="rc-form">
                                <div class="rc-content">
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="card text-center">
                                                <div class="card-body">
                                                    <h5 class="card-title">Tổng đơn hàng</h5>
                                                    <p class="card-text">123</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center">
                                                <div class="card-body">
                                                    <h5 class="card-title">Tổng Sản Phẩm</h5>
                                                    <p class="card-text">456</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="card text-center">
                                                <div class="card-body">
                                                    <h5 class="card-title">Tổng Khách Hàng</h5>
                                                    <p class="card-text">789</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row mt-4">
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Doanh thu và Chi Phí</h5>
                                                    <canvas id="revenueExpenseChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="card">
                                                <div class="card-body">
                                                    <h5 class="card-title">Phân chia khách hàng</h5>
                                                    <canvas id="customerDistributionChart"></canvas>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</div>
</div>
</div>
<!--End: Content-->
</div>
<!--Begin: Footer-->
<%@include file="footer.jsp" %>
<!--End: Footer-->
</body>
<script type="text/javascript">
    document.querySelectorAll('.dropdown-header').forEach(header => {
        header.addEventListener('click', () => {
            header.classList.toggle('active');
            const body = header.nextElementSibling;
            if (body.style.display === 'flex') {
                body.style.display = 'none';
            } else {
                body.style.display = 'flex';
            }
        });
    });
</script>
<style>
    body {
        background-color: #f8f9fa;
    }

    .card {
        border: none;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        margin-bottom: 20px;
    }

    .card .card-body {
        padding: 20px;
    }

    .card-title {
        font-size: 18px;
        font-weight: bold;
        color: #007bff;
    }

    .card-text {
        font-size: 24px;
        font-weight: bold;
        color: #343a40;
    }

</style>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var ctx1 = document.getElementById('revenueExpenseChart').getContext('2d');
        var revenueExpenseChart = new Chart(ctx1, {
            type: 'bar',
            data: {
                labels: ['Doanh Thu', 'Chi Phí'],
                datasets: [{
                    label: 'Số Lượng',
                    data: [12345, 6789],
                    backgroundColor: ['#007bff', '#dc3545'],
                    borderColor: ['#007bff', '#dc3545'],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        });

        var ctx2 = document.getElementById('customerDistributionChart').getContext('2d');
        var customerDistributionChart = new Chart(ctx2, {
            type: 'pie',
            data: {
                labels: ['Khách Hàng Mới', 'Khách Hàng Cũ'],
                datasets: [{
                    data: [300, 489],
                    backgroundColor: ['#28a745', '#ffc107'],
                    borderColor: ['#28a745', '#ffc107'],
                    borderWidth: 1
                }]
            }
        });
    });
</script>
</html>