<%--
  Created by IntelliJ IDEA.
  User: JamesPakigon
  Date: 7/8/2024
  Time: 4:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="dao.DonHangDAO" %>
<%@ page import="model.DonHang" %>
<%@ page import="model.KhachHang" %>
<%@ page import="java.util.List" %>
<%
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
    <title>Nguyên Liệu</title>
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
                            <a class="dropdown-item" href="log">Log</a>
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
                            <div class="rc-form">
                                <div class="rc-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <div class="button-container">
                                                <button id="addBtn" class="btn btn-primary"
                                                        style="width:40px;height: 40px;border-radius: 50%">
                                                    <i class="fa-solid fa-plus fa-lg"></i>
                                                </button>
                                            </div>
                                            <table id="dataTable" class="display select" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã nguyên liệu</th>
                                                    <th>Nguyên liệu</th>
                                                    <th>Số Lượng</th>
                                                    <th>Nội dung</th>
                                                    <th>Loại</th>
                                                    <th>Thời gian</th>
                                                    <th>Đơn vị</th>
                                                    <th>Giá</th>
                                                    <th>Tổng tiền</th>>
                                                </tr>
                                                </thead>
                                            </table>
                                            <!-- Modal cho Add -->
                                            <div class="modal" tabindex="-1" role="dialog" id="addDataModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="NguyenLieuAddController"
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
                                                                <label for="Iid">Mã nguyên liệu:</label>
                                                                <input type="number" class="form-control"
                                                                       id="Iid" name="id">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="INL">Nguyên liệu:</label>
                                                                <input type="text" class="form-control"
                                                                       id="INL" name="nguyenlieu">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Iamount">Số Lượng:</label>
                                                                <input type="number" class="form-control" id="Iamount"
                                                                       name="soluong">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Inoidung">Nội dung:</label>
                                                                <input type="text" class="form-control" id="Inoidung"
                                                                       name="noidung">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Itype">Loại:</label>
                                                                <input type="text" class="form-control" id="Itype"
                                                                       name="loai">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Itime">Thời gian:</label>
                                                                <input type="datetime-local" class="form-control" id="Itime"
                                                                       name="thoigian">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Imeasure">Đơn vị:</label>
                                                                <input type="text" class="form-control"
                                                                       id="Imeasure" name="donvi">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="Iprice">Giá:</label>
                                                                <input type="number" class="form-control"
                                                                       id="Iprice" name="gia">
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
                url: 'NguyenLieuListController',
                type: 'GET',
                dataType: 'json',
                dataSrc: ''
            },
            columns: [
                {data: 'id'},
                {data: 'nguyenlieu'},
                {data: 'soluong'},
                {data: 'noidung'},
                {data: 'loai'},
                {data: 'thoigian'},
                {data: 'donvi'},
                {data: 'gia'},
                {data: 'tong'},
            ]
        })
    })
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
    })

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
