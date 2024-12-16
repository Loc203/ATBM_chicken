<%@ page import="dao.DonHangDAO" %>
<%@ page import="dao.KhachHangDAO" %>
<%@ page import="model.KhachHang" %>
<%@ page import="java.util.List" %>
<%
    // Check if the user is logged in and has the required permissions
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck == null || (userCheck.getMaTC() != 2 && userCheck.getMaTC() != 3)) {
        // Redirect to login or error page if the user is not authorized
        response.sendRedirect("trangchu");
        return;
    } else if (userCheck.getMaTC() == -1) {
%>
<!-- Display a message for banned accounts -->
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
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>customer</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js"
            integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/2.0.6/js/dataTables.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/dataTables.buttons.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.dataTables.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.10.1/jszip.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/pdfmake.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.2.7/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/3.0.2/js/buttons.print.min.js"></script>

    <link rel="stylesheet" href="https://cdn.datatables.net/2.0.6/css/dataTables.dataTables.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css"
          integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="./assets/css/table-user.css">
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
                    <li class="navbar__list--item navbar__list--user" style="margin-right: -4px;margin-bottom: -33px;">
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
                    <p style="display: flex; align-items: center; text-decoration: none; font-size: 1.6rem; color: var(--header-color); line-height: 30px; font-weight: 700; margin-right: 10px; margin-bottom: auto;margin-top: 16px;">
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
                            <a class="dropdown-item" href="key.jsp">Quản lý Khóa</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="right-col">
                <div class="rc-container" role="main">
                    <div style="display: contents;">
                        <div class="rc-contentbox">
                            <div class="rc-form">
                                <div class="rc-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div class="button-container">
                                                <button id="addBtn" class="btn btn-primary"
                                                        style="width:40px;height: 40px;border-radius: 50%"><i
                                                        class="fa-solid fa-plus fa-lg"></i></button>
                                            </div>
                                            <table id="example" class="display select" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã Khách Hàng</th>
                                                    <th>Tên Khách Hàng</th>
                                                    <th>Email</th>
                                                    <th>Password</th>
                                                    <th>Số ĐT</th>
                                                    <th>Giới Tính</th>
                                                    <th>Ngày Sinh</th>
                                                    <th>Mã Truy Cập</th>
                                                </tr>
                                                </thead>
                                            </table>
                                            <!-- Modal cho Add -->
                                            <div class="modal" tabindex="-1" role="dialog" id="dataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="KhachHangAddController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm/Chỉnh Sửa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form cho Add -->
                                                            <div class="form-group">
                                                                <label for="id">Mã Khách Hàng</label>
                                                                <input type="text" class="form-control" id="id"
                                                                       name="maKH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="name">Tên Khách Hàng</label>
                                                                <input type="text" class="form-control" id="name"
                                                                       name="tenKH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email">Email:</label>
                                                                <input type="email" class="form-control" id="email"
                                                                       name="email">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="password">Mật Khẩu:</label>
                                                                <input type="text" class="form-control" id="password"
                                                                       name="matKhau">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phone">Số Điện Thoại:</label>
                                                                <input type="tel" class="form-control" id="phone"
                                                                       name="soDT">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="gender">Giới Tính:</label>
                                                                <select class="form-control" id="gender"
                                                                        name="gioiTinh">
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                    <option value="Khác">Khác</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="birthdate">Ngày Sinh:</label>
                                                                <input type="date" class="form-control" id="birthdate"
                                                                       name="ngaySinh">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="access">Mã Truy Cập:</label>
                                                                <select class="form-control" id="access"
                                                                        name="maTC">
                                                                    <option value="-1">-1</option>
                                                                    <option value="0">0</option>
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary" id="saveBtn"
                                                                   value="Lưu">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- Modal cho Edit -->
                                            <div class="modal" tabindex="-1" role="dialog" id="dataEditModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="KhachHangEditController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm/Chỉnh Sửa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form cho edit -->
                                                            <div class="form-group">
                                                                <label for="idED">Mã Khách Hàng</label>
                                                                <input type="text" class="form-control" id="idED"
                                                                       name="maKH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="nameED">Tên Khách Hàng</label>
                                                                <input type="text" class="form-control" id="nameED"
                                                                       name="tenKH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="email">Email:</label>
                                                                <input type="email" class="form-control" id="emailED"
                                                                       name="email">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="passwordED">Mật Khẩu:</label>
                                                                <input type="text" class="form-control" id="passwordED"
                                                                       name="matKhau">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="phoneED">Số Điện Thoại:</label>
                                                                <input type="tel" class="form-control" id="phoneED"
                                                                       name="soDT">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="genderED">Giới Tính:</label>
                                                                <select class="form-control" id="genderED"
                                                                        name="gioiTinh">
                                                                    <option value="Nam">Nam</option>
                                                                    <option value="Nữ">Nữ</option>
                                                                    <option value="Khác">Khác</option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="birthdateED">Ngày Sinh:</label>
                                                                <input type="date" class="form-control" id="birthdateED"
                                                                       name="ngaySinh">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="accessED">Mã Truy Cập:</label>
                                                                <select class="form-control" id="accessED"
                                                                        name="maTC">
                                                                    <option value="-1">-1</option>
                                                                    <option value="0">0</option>
                                                                    <option value="1">1</option>
                                                                    <option value="2">2</option>
                                                                    <option value="3">3</option>
                                                                    <option value="4">4</option>
                                                                    <option value="5">5</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary"
                                                                   id="saveEditBtn" value="Lưu">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
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
</div>
<!--End: Content-->

<!--Begin: Footer-->
<%@include file="footer.jsp" %>
<!--End: Footer-->
<script type="text/javascript">
    $(document).ready(function () {
        $('#addBtn').on('click', function () {
            $('#dataModal').modal('show');
        });

        let table = $('#example').DataTable({
            layout: {
                topStart: {
                    buttons: ['copy', 'excel', 'pdf', 'print']
                }
            },
            ajax: {
                url: 'KhachHangListController',
                type: 'GET',
                dataType: 'json',
                dataSrc: ''
            },
            columns: [
                { data: 'maKH' },
                { data: 'tenKH' },
                { data: 'email' },
                {
                    data: 'matKhau',
                    render: function (data) {
                        return '*****';
                    }
                },
                { data: 'soDT' },
                { data: 'gioiTinh' },
                {
                    data: 'ngaySinh',
                    render: function (data) {
                        if (data) {
                            var date = new Date(data);
                            var day = date.getDate();
                            var month = date.getMonth() + 1;
                            var year = date.getFullYear();
                            return (day < 10 ? '0' : '') + day + '/' + (month < 10 ? '0' : '') + month + '/' + year;
                        }
                        return data;
                    }
                },
                { data: 'maTC' },
                {
                    data: null,
                    orderable: false,
                    className: "edit",
                    render: function (data, type, row) {
                        return '<a><i class="fa-solid fa-pencil fa-lg" style="color: #FFD43B;font-size: 2.0rem"></i></a>';
                    }
                },
                {
                    data: null,
                    orderable: false,
                    className: "delete",
                    render: function (data, type, row) {
                        return '<a href="#"><i class="fa-solid fa-trash" style="color: red;font-size: 2.0rem"></i></a>';
                    }
                },
                {
                    data: 'alertKey',
                    render: function (data) {
                        if (data === 0) {
                            return '<a href="#" onclick="notifyAdminForKey()"><i class="fa-solid fa-key" style="color: orange; font-size: 2.0rem;"></i></a>';
                        }
                        return '';
                    }
                }
            ]
        });
        // Function to handle the key notification
        window.notifyAdminForKey = function () {
            $.ajax({
                url: 'AlertCreateKeyController',
                type: 'GET',
                dataType: 'json',
                success: function (response) {
                    alert('Đã thêm key cho người dùng.');
                },
                error: function () {
                    console.error('Error notifying admin for key.');
                }
            });
        }
        //Xử lý chức năng edit và lấy dữ liệu từ dataTable qua edit
        $('#example tbody').on('click', 'td.edit', function () {
            var rowIndex = table.cell($(this)).index().row;
            var rowData = table.row(rowIndex).data();
            $('#idED').val(rowData.maKH);
            $('#nameED').val(rowData.tenKH);
            $('#emailED').val(rowData.email);
            $('#passwordED').val(rowData.matKhau);
            $('#phoneED').val(rowData.soDT);
            $('#genderED').val(rowData.gioiTinh);

            var date = new Date(rowData.ngaySinh);
            var formattedDate = date.toLocaleDateString('en-CA');
            $('#birthdateED').val(formattedDate);

            $('#accessED').val(rowData.maTC);

            $('#dataEditModal').modal('show');

            $('#saveEditBtn').off('click').on('click', function () {
                var parts = $('#birthdateED').val().split('-');
                var submitDate = parts[0] + '-' + parts[1] + '-' + parts[2];

                $.ajax({
                    url: "KhachHangEditController",
                    type: "POST",
                    data: {
                        maKH: $('#idED').val(),
                        tenKH: $('#nameED').val(),
                        email: $('#emailED').val(),
                        matKhau: $('#passwordED').val(),
                        soDT: $('#phoneED').val(),
                        gioiTinh: $('#genderED').val(),
                        ngaySinh: submitDate,
                        maTC: $('#accessED').val()
                    },
                    success: function (response) {
                        $.ajax({
                            url: 'KhachHangListController',
                            type: 'GET',
                            dataType: 'json',
                            success: function (updatedData) {
                                table.clear().rows.add(updatedData).draw();
                                $('#dataEditModal').modal('hide');
                            },
                            error: function (xhr, status, error) {
                                alert('Failed to fetch updated data: ' + error);
                            }
                        });
                    },
                    error: function (xhr, status, error) {
                        alert('Update failed: ' + error);
                    }
                });
            });

            $('.btn-secondary').on('click', function () {
                $('#dataEditModal').modal('hide');
            });
        });

        $('#example tbody').on('click', 'td.delete', function () {
            var rowIndex = table.cell($(this)).index().row;
            var rowData = table.row(rowIndex).data();
            var maKH = rowData.maKH;

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: "KhachHangDeleteController",
                        type: "POST",
                        data: { maKH: maKH },
                        success: function (response) {
                            table.row(rowIndex).remove().draw();
                            Swal.fire({
                                title: "",
                                text: "Bạn đã xóa thành công",
                                icon: "success"
                            });
                        },
                        error: function (xhr, status, error) {
                            alert('Delete failed: ' + error);
                        }
                    });
                }
            });
        });
    });
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
</body>
<style>
    .dt-button {
        background-color: rgb(154, 205, 50);
        color: #ffff00;
        font-weight: bold;
        border: none;
        padding: 4px;
        margin: 0 4px;
    }
    .dt-button:hover {
        background-color: rgba(154,205,50,0.6);
        transition: linear 0.3s;
    }
</style>
</html>