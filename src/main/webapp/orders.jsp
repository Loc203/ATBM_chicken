<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="dao.DonHangDAO" %>
<%@ page import="model.DonHang" %>
<%@ page import="model.KhachHang" %>
<%@ page import="java.util.List" %>

<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck == null || userCheck.getMaTC() != 2 && userCheck.getMaTC() != 4) {
        response.sendRedirect("/trangchu");
        return;
    } else if (userCheck.getMaTC() == -1) {
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
    <%@ page import="model.ChiTiet_DonHang" %>
    <%@ page import="dao.ChiTietDonHangDAO" %>
    <%@ page import="java.sql.SQLException" %>
    <%@ page import="service.DonHangService" %>
    <%@ page import="entity.PublicKeyUser" %>
    <%@ page import="service.UserKeyService" %>
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

                <!-- Popup hiển thị thông báo vô hiệu khóa -->
                <!-- Overlay làm mờ -->
                <div class="overlay" id="overlay"></div>

                <!-- Popup -->
                <div class="popup" id="popup">
                    <p id="popupMessage"></p>
                    <button class="close-btn" onclick="closePopup()">Đóng</button>
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
                            <div class="cart-quantity" style="top: 28px">
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
                                            <table id="dataTable" class="display select" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>Đơn Hàng</th>
                                                    <th>Khách Hàng</th>
                                                    <th>Địa chỉ</th>
                                                    <th>Ngày nhận hàng</th>
                                                    <th>Trạng thái</th>
                                                    <th>Thanh Toán</th>
                                                    <th>Chi tiết đơn hàng</th>
                                                </tr>
                                                </thead>
                                            </table>
                                            <!-- Modal cho Add -->
                                            <div class="modal" tabindex="-1" role="dialog" id="addDataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="DonHangAddController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form cho Add -->
                                                            <div class="form-group">
                                                                <label for="orderID">Mã Đơn Hàng:</label>
                                                                <input type="text" class="form-control"
                                                                       id="orderID" name="maDH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="KHID">Mã Khách Hàng:</label>
                                                                <input type="text" class="form-control"
                                                                       id="KHID" name="maKH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="address">Địa Chỉ:</label>
                                                                <input type="text" class="form-control" id="address"
                                                                       name="diaChiNhanHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="receiveDate">Ngày Nhận Hàng:</label>
                                                                <input type="datetime-local" class="form-control"
                                                                       id="receiveDate"
                                                                       name="ngayNhanHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="status">Trạng thái:</label>
                                                                <select class="form-control" id="status"
                                                                        name="trangThai">
                                                                    <option value="Chưa Giao">Chưa giao</option>
                                                                    <option value="Đã Bàn Giao">Đã Bàn giao</option>
                                                                    <option value="Đang Giao">Đang giao</option>
                                                                    <option value="Giao Thành Công">Giao Thành Công
                                                                    </option>
                                                                    <option value="Giao Hàng Không Thành Công">Giao Hàng
                                                                        Không Thành Công
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="payout">Thanh Toán:</label>
                                                                <select class="form-control" id="payout"
                                                                        name="thanhToan">
                                                                    <option value="Đã Thanh Toán">Đã thanh toán</option>
                                                                    <option value="Chưa Thanh Toán">Chưa thanh toán
                                                                    </option>
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
                                            <div class="modal" tabindex="-1" role="dialog" id="editDataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="DonHangEditController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Chỉnh Sửa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form cho Edit -->
                                                            <div class="form-group">
                                                                <label for="orderIDED">Mã Đơn Hàng:</label>
                                                                <input type="text" class="form-control"
                                                                       id="orderIDED" name="maDH" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="KHIDED">Mã Khách Hàng:</label>
                                                                <input type="text" class="form-control"
                                                                       id="KHIDED" name="maKH" readonly>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="addressED">Địa Chỉ:</label>
                                                                <input type="text" class="form-control" id="addressED"
                                                                       name="diaChiNhanHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="receiveDateED">Ngày Nhận Hàng:</label>
                                                                <input type="datetime-local" class="form-control"
                                                                       id="receiveDateED"
                                                                       name="ngayNhanHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="statusED">Trạng thái:</label>
                                                                <select class="form-control" id="statusED"
                                                                        name="trangThai">
                                                                    <option value="Chưa Giao">Chưa giao</option>
                                                                    <option value="Đã Bàn Giao">Đã Bàn giao</option>
                                                                    <option value="Đang Giao">Đang giao</option>
                                                                    <option value="Giao Thành Công">Giao Thành Công
                                                                    </option>
                                                                    <option value="Giao Hàng Không Thành Công">Giao Hàng
                                                                        Không Thành Công
                                                                    </option>
                                                                </select>
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="payoutED">Thanh Toán:</label>
                                                                <select class="form-control" id="payoutED"
                                                                        name="thanhToan">
                                                                    <option value="Đã Thanh Toán">Đã thanh toán</option>
                                                                    <option value="Chưa Thanh Toán">Chưa thanh toán
                                                                    </option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary"
                                                                   id="saveEditBtn"
                                                                   value="Lưu">
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
            $('#addDataModal').modal('show');
        });
        let table = $('#dataTable').DataTable({
            layout: {
                topStart: {
                    buttons: ['copy', 'excel', 'pdf', 'print']
                }
            },
            ajax: {
                url: 'DonHangListController',
                type: 'GET',
                dataType: 'json',
                dataSrc: ''
            },
            columns: [
                {data: 'maDH'},
                {data: 'tenKH'},
                {data: 'diaChiNhanHang'},
                {data: 'ngayNhanHang'},
                {
                    data: 'trangThai',
                    render: function (data, type, row) {
                        return '<button type="button" class="orderDetailBtn btn-warning" onclick="handleOrderTracking(\'' + row.maDH + '\', \'' + data + '\', \'' + row.ngayNhanHang + '\')">Trạng thái</button>';
                    }
                },
                {
                    data: 'phiVanChuyen',
                    visible: false
                },

                {
                    data: 'thanhToan',
                    render: function (data, type, row) {
                        var thanhToan = data.toLowerCase();
                        if (thanhToan == "đã thanh toán") {
                            return '<span style="color: green; font-weight: bold;">' + data + '</span>';
                        } else if (thanhToan == "chưa thanh toán") {
                            return '<span style="color: red; font-weight: bold;">' + data + '</span>';
                        } else {
                            return data;
                        }
                    }
                },
                {
                    data: 'maDH',
                    render: function (data, type, row) {
                        return '<button type="button" class="orderDetailBtn btn-info" onclick="viewOrderDetails(' + data + ', \'' + row.ngayDatHang + '\',\'' + row.phiVanChuyen + '\')">Chi tiết</button>';
                    }
                },
                {
                    data: 'maKH',
                    visible: false,
                },
                {
                    data: 'signature',
                    visible: false,
                },
                {
                    data: null,
                    orderable: false,
                    className: "edit", render: function (data, type, row) {
                        return '<a><i class="fa-solid fa-pencil fa-lg" style="color: #FFD43B;font-size: 2.0rem"></i></a>';
                    }
                },
                {
                    data: null,
                    orderable: false,
                    className: "delete", render: function (data, type, row) {
                        return '<a href="#"><i class="fa-solid fa-trash" style="color: red;font-size: 2.0rem"></i></a>';
                    }
                },
                {
                    data: 'null',
                    orderable: false,
                    className: "check", render: function (data, type, row) {
                        return '<form method="POST" action="CheckOrderSignatureController" style="display:inline;">' +
                            '<input type="hidden" name="maDH" value="' + row.maDH + '">' +
                            '<input type="hidden" name="maKH" value="' + row.maKH + '">' +
                            '<button type="submit" style="background:none; border:none; cursor:pointer;">' +
                            '<i class="fa-solid fa-magnifying-glass" style="color: lightgreen; font-size: 2.0rem;"></i>' +
                            '</button>' +
                            '</form>';
                    }


                }
            ]
        });
        // window.checkOrderSignature = function () {
        //     var element = event.currentTarget;
        //     var table = $('#dataTable').DataTable();
        //     var row = table.row($(element).closest('tr'));
        //     var rowData = row.data();
        //
        //     var orderID = rowData.maDH;
        //     var userID = rowData.maKH;
        //     var signature = rowData.signature;
        //
        //     console.log(orderID);
        //     console.log(userID);
        //     console.log(signature);
        //     $.ajax({
        //         url: "CheckOrderSignatureController", // Đường dẫn đến Servlet
        //         type: "POST",
        //         data: {maDH : orderID, maKH : userID},
        //         success: function (response) {
        //             if (response.trim() === "Valid") {
        //                 // Nếu dữ liệu hợp lệ
        //                 alert("Don hang hop le!.");
        //                 // console.log("true");
        //             } else {
        //                 // Hiển thị thông báo lỗi nếu không hợp lệ
        //                 alert("Thong tin don hang da duoc thay doi, vui long kiem tra lai.");
        //                 // console.log("false");
        //             }
        //         },
        //         error: function () {
        //             console.log("Da co loi xay ra!");
        //         }
        //     });
        // }
        // Xử lý nút edit
        $('#dataTable tbody').on('click', 'td.edit', function () {
            var rowIndex = table.cell($(this)).index().row;
            var rowData = table.row(rowIndex).data();
            $('#orderIDED').val(rowData.maDH);
            $('#KHIDED').val(rowData.maKH);
            $('#addressED').val(rowData.diaChiNhanHang);
            $('#phoneED').val(rowData.soDienThoai);
            $('#orderDateED').val(rowData.ngayDatHang);
            $('#receiveDateED').val(rowData.ngayNhanHang);
            $('#statusED').val(rowData.trangThai);
            $('#payoutED').val(rowData.thanhToan);

            $('#editDataModal').modal('show');

            $('#saveEditBtn').on('click', function () {
                $.ajax({
                    url: "DonHangEditController",
                    type: "POST",
                    data: {
                        maDH: $('#orderIDED').val(),
                        maKH: $('#KHIDED').val(),
                        diaChiNhanHang: $('#addressED').val(),
                        soDienThoai: $('#phoneED').val(),
                        ngayDatHang: $('#orderDateED').val(),
                        ngayNhanHang: $('#receiveDateED').val(),
                        trangThai: $('#statusED').val(),
                        thanhToan: $('#payoutED').val(),
                        phiVanChuyen: $('').val()
                    },
                    success: function (response) {
                        $.ajax({
                            url: 'DonHangListController',
                            type: 'GET',
                            dataType: 'json',
                            success: function (updatedData) {
                                table.clear().rows.add(updatedData).draw();

                                $('#editDataModal').modal('hide');
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
                $('#editDataModal').modal('hide');
            });
        });

        // Xử lý nút xóa
        $('#dataTable tbody').on('click', 'td.delete', function () {
            var rowIndex = table.cell($(this)).index().row;
            var rowData = table.row(rowIndex).data();
            var maDH = rowData.maDH;

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
                        url: "DonHangDeleteController",
                        type: "POST",
                        data: {maDH: maDH},
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
        window.handleOrderTracking = function (maDH, trangThai, ngayNhanHang) {
            if (trangThai === "Giao Hàng Không Thành Công") {
                Swal.fire({
                    title: "Thông báo",
                    text: "Đơn Hàng Đã Bị Hủy",
                    icon: "error",
                    confirmButtonText: "OK"
                });
            } else {
                location.href = 'orderTracking.jsp?maDH=' + maDH + '&trangThai=' + encodeURIComponent(trangThai) + '&ngayNhanHang=' + encodeURIComponent(ngayNhanHang);
            }
        };
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

    function viewOrderDetails(maDH, ngayDatHang, phiVanChuyen) {
        window.location.href = 'CTDHController?maDH=' + maDH + '&ngayDatHang=' + ngayDatHang + '&phiVanChuyen=' + phiVanChuyen;
    }


    // JavaScript hiển thị popup
    window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        const popup = document.getElementById('popup');
        const overlay = document.getElementById('overlay');
        const popupMessage = document.getElementById('popupMessage');

        if (message === 'success') {
            popupMessage.textContent = 'Đơn hàng hợp lệ';
            popupMessage.style.color = 'green';
            showPopup();
        } else if (message === 'failure') {
            popupMessage.textContent = 'Thông tin đơn hàng đã bị thay đổi, vui lòng kiểm tra lại';
            popupMessage.style.color = 'red';
            showPopup();
        } else if (message === 'error') {
            popupMessage.textContent = 'Có lỗi ngoài dự kiến đã xảy ra';
            popupMessage.style.color = 'orange';
            showPopup();
        }
    };

    // Hiển thị popup
    function showPopup() {
        const popup = document.getElementById('popup');
        const overlay = document.getElementById('overlay');
        popup.classList.add('active');
        overlay.classList.add('active');
    }

    // Đóng popup
    function closePopup() {
        const popup = document.getElementById('popup');
        const overlay = document.getElementById('overlay');
        popup.classList.remove('active');
        overlay.classList.remove('active');
    }
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
        background-color: rgba(154, 205, 50, 0.6);
        transition: linear 0.3s;
    }

    .orderDetailBtn {
        width: 65px;
        height: 25px;
        font-weight: bold;
        color: black;
        border-radius: 4px;
    }

    .btn-warning {
        width: 80px;
    }

    /* CSS cho popup */
    .popup {
        position: fixed;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        display: none; /* Ẩn popup mặc định */
    }

    .popup.active {
        display: block; /* Hiển thị popup khi có class 'active' */
    }

    .popup .close-btn {
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .popup .close-btn:hover {
        background-color: #0056b3;
    }
    /* CSS cho popup hiển thị thông báo khóa */
    /* CSS overlay */
    .popup {
        position: fixed;
        top: 50%;
        left: 50%;
        width: 16%;
        transform: translate(-50%, -50%);
        z-index: 1000;
        background-color: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        text-align: center;
        display: none; /* Ẩn popup mặc định */
    }

    .popup.active {
        display: block; /* Hiển thị popup khi có class 'active' */
    }

    .popup .close-btn {
        margin-top: 10px;
        padding: 5px 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .popup .close-btn:hover {
        background-color: #0056b3;
    }

    /* CSS overlay */
    .overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999;
        display: none; /* Ẩn overlay mặc định */
    }

    .overlay.active {
        display: block; /* Hiển thị overlay khi có class 'active' */
    }
</style>
</body>
</html>