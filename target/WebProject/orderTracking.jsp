<%@ page import="java.net.URLDecoder" %>
<%
    String maDH = request.getParameter("maDH");
    String trangThai = URLDecoder.decode(request.getParameter("trangThai"), "UTF-8");
    String ngayNhanHang = URLDecoder.decode(request.getParameter("ngayNhanHang"), "UTF-8");
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Theo dõi đơn hàng</title>
    <link rel="stylesheet" href="./assets/css/orderTracking.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<div class="container px-1 px-md-4 py-5 mx-auto">
    <div class="card">
        <a href="orders.jsp"><span class="text-primary font-weight-bold" style="color: #f8b02d !important;">QUAY LẠI </span></a>
        <div class="row d-flex justify-content-between px-3 top">
            <div class="d-flex">
                <h5>ĐƠN HÀNG <span class="text-primary font-weight-bold" style="color: #f8b02d !important;">#<%= maDH %></span></h5>
            </div>
            <div class="d-flex flex-column text-sm-right">
                <p class="mb-0">Ngày dự kiến <span><%= ngayNhanHang %></span></p>
            </div>
        </div>
        <div class="row d-flex justify-content-center">
            <div class="col-12">
                <ul id="progressbar" class="text-center">
                    <%
                        if ("Chưa Giao".equalsIgnoreCase(trangThai)) {
                    %>
                    <li class="active step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                    <%
                    } else if ("Đã Bàn Giao".equalsIgnoreCase(trangThai)) {
                    %>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <li class="step0"></li>
                    <li class="step0"></li>
                    <%
                    } else if ("Đang Giao".equalsIgnoreCase(trangThai)) {
                    %>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <li class="step0"></li>
                    <%
                    } else if ("Giao Thành Công".equalsIgnoreCase(trangThai)) {
                    %>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <li class="active step0"></li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
        <div class="row justify-content-between top">
            <div class="row d-flex icon-content">
                <img class="icon" src="https://i.imgur.com/9nnc9Et.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">Đang chuẩn bị<br>đơn hàng</p>
                </div>
            </div>
            <div class="row d-flex icon-content">
                <img class="icon" src="https://i.imgur.com/u1AzR7w.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">Đã giao cho<br>bên vận chuyển</p>
                </div>
            </div>
            <div class="row d-flex icon-content">
                <img class="icon" src="https://i.imgur.com/TkPm63y.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">Đang trên đường<br>giao đến bạn</p>
                </div>
            </div>
            <div class="row d-flex icon-content">
                <img class="icon" src="https://i.imgur.com/HdsziHP.png">
                <div class="d-flex flex-column">
                    <p class="font-weight-bold">Đơn hàng<br>đã được giao</p>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
