<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.SanPham" %>
<%@ page import="dao.SanPhamDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="model.KhachHang" %>

<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck == null || userCheck.getMaTC() != 2 && userCheck.getMaTC() != 5) {
        response.sendRedirect("/trangchu");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <link rel="stylesheet" href="./assets/css/table-user.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">

</head>
<body>
<div class="app">

    <!-- Begin: Header -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/header.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
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
                        <p style="display: flex; align-items: center; text-decoration: none; font-size: 1.6rem; color: var(--header-color); line-height: 30px; font-weight: 700; margin-right: 10px;margin-top: 22px;">
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
                            <div class="cart-quantity" style ="top: 28px">
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
                                                <button id="addImageBtn" class="btn btn-primary"
                                                        style="width:40px;height: 40px;border-radius: 50%; background-color: blue">
                                                    <i class="fa-solid fa-file-import"></i></button>
                                            </div>

                                            <table id="dataTable" class="display select" style="width:100%;">
                                                <thead>
                                                <tr>
                                                    <th>Mã Sản Phẩm</th>
                                                    <th>Hình Ảnh</th>
                                                    <th>Tên Sản Phẩm</th>
                                                    <th>Mô Tả</th>
                                                    <th>Số Lượng Trong Kho</th>
                                                    <th>Giá</th>
                                                </tr>
                                                </thead>
                                            </table>
                                            <!-- Modal cho thêm hình ảnh -->
                                            <div class="modal" tabindex="-1" role="dialog" id="addImageModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="ImageAddController"
                                                          method="POST" enctype="multipart/form-data">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm Hình Ảnh</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form thêm hình ảnh -->
                                                            <div class="form-group">
                                                                <label for="imageID">Mã Hình Ảnh:</label>
                                                                <input type="number" class="form-control" id="imageID"
                                                                       name="maAnh" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="imageFile">Hình Ảnh*:</label>
                                                                <input type="file" class="form-control" id="imageFile"
                                                                       name="anh" required>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary"
                                                                   id="saveImageBtn" name="saveImageBtn"
                                                                   value="Xác nhận">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal" name="closeBtn">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- Modal cho Add -->
                                            <div class="modal" tabindex="-1" role="dialog" id="dataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="ProductAddController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form add -->
                                                            <div class="form-group">
                                                                <label for="productID">Mã Sản Phẩm*:</label>
                                                                <input type="text" class="form-control" id="productID"
                                                                       name="maSP" required>
                                                            </div>
                                                            <% String error = (String) request.getAttribute("error");
                                                            if (error == null) {
                                                            error ="";%>
                                                            <p class="text-danger"><%=error%></p>
                                                            <% } %>
                                                            <div class="form-group">
                                                                <label for="selectedImage">Hình Ảnh:</label>
                                                                <button type="button" class="btn btn-primary" id="selectedImage">Chọn Hình Ảnh</button>
                                                                <input type="hidden" id="imagePath" name="maAnh">
                                                                <div id="imagePreview" style="margin-top: 10px;"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="productName">Tên Sản Phẩm*:</label>
                                                                <input type="text" class="form-control"
                                                                       id="productName" name="tenSP" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="description">Mô Tả:</label>
                                                                <textarea class="form-control"
                                                                          id="description" name="moTa"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="amount">Số lượng trong kho:</label>
                                                                <input type="number" class="form-control" id="amount"
                                                                       name="soLuongTonKho" required>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="price">Giá:</label>
                                                                <input type="text" class="form-control" id="price"
                                                                       placeholder="Enter price in 'đ' format"
                                                                       name="giaGoc" required>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary" id="saveBtn"
                                                                   name="saveBtn" value="Xác nhận">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal" name="closeBtn">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- Modal edit -->
                                            <div class="modal" tabindex="-1" role="dialog" id="editDataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="ProductEditController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Chỉnh Sửa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form edit -->
                                                            <div class="form-group">
                                                                <label for="productIDED">Mã Sản Phẩm:</label>
                                                                <input type="text" class="form-control" id="productIDED"
                                                                       name="maSP" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="selectedImageED">Hình Ảnh:</label>
                                                                <button type="button" class="btn btn-primary" id="selectedImageED">Chọn Hình Ảnh</button>
                                                                <input type="hidden" id="imagePathED" name="maAnh">
                                                                <div id="imagePreviewED" style="margin-top: 10px;"></div>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="productNameED">Tên Sản Phẩm:</label>
                                                                <input type="text" class="form-control"
                                                                       id="productNameED" name="tenSP">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="descriptionED">Mô Tả:</label>
                                                                <textarea class="form-control"
                                                                          id="descriptionED" name="moTa"></textarea>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="amountED">Số lượng trong kho:</label>
                                                                <input type="number" class="form-control" id="amountED"
                                                                       name="soLuongTonKho">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="priceED">Giá:</label>
                                                                <input type="text" class="form-control" id="priceED"
                                                                       placeholder="Enter price in 'đ' format"
                                                                       name="giaGoc">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary"
                                                                   id="saveEditBtn" name="saveBtn" value="Xác nhận">

                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal" name="closeBtn">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                            <!-- Modal cho chọn hình ảnh -->
                                            <div class="modal" tabindex="-1" role="dialog" id="selectImageModal">
                                                <div class="modal-dialog" role="document">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Chọn Hình Ảnh</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <table id="imageTable" class="table table-striped"
                                                                   style="width:100%;">
                                                                <thead>
                                                                <tr>
                                                                    <th>Mã Hình Ảnh</th>
                                                                    <th>Hình Ảnh</th>
                                                                    <th>Chọn</th>
                                                                </tr>
                                                                </thead>
                                                            </table>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
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
            $('#selectedImage, #selectedImageED').on('click', function () {
                $('#selectImageModal').modal('show');
                loadImageTable();
            });

            // Load hình ảnh từ database
            function loadImageTable() {
                $('#imageTable').DataTable({
                    ajax: {
                        url: 'ImageListController',
                        type: 'GET',
                        dataType: 'json',
                        dataSrc: '',
                    },
                    destroy: true,
                    columns: [
                        { data: 'maAnh' },
                        {
                            data: 'duongDan', render: function (data, type, row) {
                                return '<img src="' + data + '" alt="Product Image" style="max-width: 100px; max-height: 100px;">';
                            }
                        },
                        {
                            data: null,
                            orderable: false,
                            render: function (data, type, row) {
                                return '<button type="button" class="btn btn-success select-image" data-id="' + row.maAnh + '">Chọn</button>';
                            }
                        }
                    ]
                });
            }

            // Xử lý chọn hình ảnh
            $('#imageTable').on('click', '.select-image', function () {
                var imageId = $(this).data('id');
                $('#imagePath').val(imageId);
                $('#imagePreview').html('<p>Image ID: ' + imageId + '</p>');
                $('#selectImageModal').modal('hide');

                // Lấy hình ảnh đã chọn để đưa vào edit modal
                $('#imagePathED').val(imageId);
                $('#imagePreviewED').html('<p>Image ID: ' + imageId + '</p>'); // Cập nhật hình ảnh đã chọn trong modal
            });
            // Thêm hình ảnh
            $('#addImageBtn').on('click', function () {
                $('#addImageModal').modal('show');
            });

            $('#saveImageBtn').on('click', function (e) {
                e.preventDefault();

                var formData = new FormData($('#addImageModal form')[0]);
                $.ajax({
                    url: "ImageAddController",
                    type: "POST",
                    data: formData,
                    contentType: false,
                    processData: false,
                    success: function (response) {
                        $('#addImageModal').modal('hide');
                        Swal.fire({
                            icon: 'success',
                            title: 'Success',
                            text: response,
                        }).then(() => {
                            location.reload();
                        });
                    },
                    error: function (xhr, status, error) {
                        $('#addImageModal').modal('hide');
                        Swal.fire({
                            icon: 'error',
                            title: 'Error',
                            text: 'Image upload failed: ' + xhr.responseText,
                        });
                    }
                });
            });

            $('.btn-secondary').on('click', function () {
                $('#addImageModal').modal('hide');
            });


            let table = $("#dataTable").DataTable({
                layout: {
                    topStart: {
                        buttons: ['copy', 'excel', 'pdf', 'print']
                    }
                },
                ajax: {
                    url: "SanPhamListController",
                    type: "GET",
                    dataType: "json",
                    dataSrc: "",
                },
                columns: [
                    {data: "maSP"},
                    {
                        data: "anh", render: function (data, type, row) {
                            return '<img src="' + data.duongDan + '" alt="Product Image" style="max-width: 100px; max-height: 100px;">';
                        }
                    },
                    {data: "tenSP"},
                    {data: "moTa"},
                    {data: "soLuongTonKho"},
                    {
                        data: "giaGoc", render: function (data) {
                            return Number(data).toLocaleString('en-US') + "đ";
                        }
                    },
                    {
                        data: null,
                        orderable: false,
                        className: "edit", render: function (data, type, row) {
                            return '<a><i class="fa-solid fa-pencil fa-lg" style="color: #FFD43B;font-size: 2.0rem"></i>'
                        }
                    },
                    {
                        data: null,
                        orderable: false,
                        className: "delete", render: function (data, type, row) {
                            return '<a href="#"><i class="fa-solid fa-trash" style="color: red;font-size: 2.0rem"></i></a>';
                        },
                    },
                    { data: "giaGiam",
                    visible: false}
                ]
            });

            $('#dataTable tbody').on('click', 'td.edit', function () {
                var rowIndex = table.cell($(this)).index().row;
                var rowData = table.row(rowIndex).data();
                $('#productIDED').val(rowData.maSP);
                $('#imagePathED').val(rowData.anh.maAnh);
                $('#imagePreviewED').html('<p>Image ID: ' + rowData.anh.maAnh + '</p');
                $('#productNameED').val(rowData.tenSP);
                $('#descriptionED').val(rowData.moTa);
                $('#amountED').val(rowData.soLuongTonKho);
                $('#priceED').val(rowData.giaGoc);
                $('#promotePrice').val(rowData.giaGiam);

                $('#editDataModal').modal('show');

                $('#saveEditBtn').on('click', function () {
                    $.ajax({
                        url: "ProductEditController",
                        type: "POST",
                        data: {
                            maSP: $('#productIDED').val(),
                            maAnh: $('#imagePathED').val(),
                            tenSP: $('#productNameED').val(),
                            moTa: $('#descriptionED').val(),
                            soLuongTonKho: $('#amountED').val(),
                            giaGoc: $('#priceED').val(),
                            giaGiam: $('#promotePrice').val()
                        },
                        success: function (response) {
                            table.row(rowIndex).data({
                                maSP: $('#productIDED').val(),
                                maAnh: $('#imagePathED').val(),
                                tenSP: $('#productNameED').val(),
                                moTa: $('#descriptionED').val(),
                                soLuongTonKho: $('#amountED').val(),
                                giaGoc: $('#priceED').val(),
                                giaGiam: $('#promotePrice').val()
                            }).draw();

                            $('#editDataModal').modal('hide');
                        },
                        error: function (xhr, status, error) {
                            alert('Update failed: ' + error);
                        }
                    });
                });

                $('.btn-secondary').on('click', function () {
                    $('#editDataModal').modal('hide');
                });
            });

            $('#dataTable tbody').on('click', 'td.delete', function () {
                var rowIndex = table.cell($(this)).index().row;
                var rowData = table.row(rowIndex).data();
                var maSP = rowData.maSP;

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
                            url: "ProductDeleteController",
                            type: "POST",
                            data: {maSP: maSP},
                            success: function (response) {
                                table.row(rowIndex).remove().draw();
                                Swal.fire({
                                    title: "",
                                    text: "Bạn đã xóa thành công",
                                    icon: "success"
                                });
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
</body>
</html>