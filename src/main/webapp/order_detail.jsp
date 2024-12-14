<%@ page import="model.ChiTiet_DonHang" %>
<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int maDH = (int) request.getAttribute("maDH");
    String ngayDatHang = (String) request.getAttribute("ngayDatHang");
    Double phiVanChuyen = (Double) request.getAttribute("phiVanChuyen");
    List<ChiTiet_DonHang> orderDetails = (List<ChiTiet_DonHang>) request.getAttribute("orderDetails");
    java.text.NumberFormat numberFormat = java.text.NumberFormat.getInstance(new java.util.Locale("vi", "VN"));

    double totalAmount = 0.0;
    double afterTotal = 0.0;

    if (orderDetails != null && !orderDetails.isEmpty()) {
        for (ChiTiet_DonHang ctdh : orderDetails) {
            List<Integer> dsMaSP = ctdh.getDsMaSP();
            List<Integer> dsSoLuongDatHang = ctdh.getDsSoLuongDatHang();
            for (int i = 0; i < dsMaSP.size(); i++) {
                SanPham sp = ctdh.getSanPham();
                int soLuong = dsSoLuongDatHang.get(i);
                double gia = sp.getGiaGiam() != 0 ? sp.getGiaGiam() : sp.getGiaGoc();
                double thanhTien = soLuong * gia * 1.1;
                totalAmount += thanhTien;
            }
        }
        afterTotal = totalAmount + phiVanChuyen;
    }
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<!-- Begin: Header -->
<%@include file="header.jsp" %>
<!-- End: Header -->

<div class="app">
    <h3>Chi tiết đơn hàng</h3>
    <div class="content">
        <div class="orderId">
            <label>Mã đơn hàng:</label>
            <%= maDH %>
        </div>
        <%
            if (orderDetails != null && !orderDetails.isEmpty()) {
                for (ChiTiet_DonHang ctdh : orderDetails) {
                    List<Integer> dsMaSP = ctdh.getDsMaSP();
                    List<Integer> dsSoLuongDatHang = ctdh.getDsSoLuongDatHang();
                    for (int i = 0; i < dsMaSP.size(); i++) {
                        SanPham sp = ctdh.getSanPham();
                        int soLuong = dsSoLuongDatHang.get(i);
                        double gia = sp.getGiaGiam() != 0 ? sp.getGiaGiam() : sp.getGiaGoc();
                        double thanhTien = soLuong * gia * 1.1;
        %>
        <div class="group-product">
            <div class="product">
                <div class="title">
                    <label for="">Tên sản phẩm:</label>
                    <span><%= sp.getTenSP() %></span>
                </div>
                <div class="quantity">
                    <label for="">Số lượng:</label>
                    <span><%= dsSoLuongDatHang.get(i) %></span>
                </div>
                <div class="price">
                    <label for="">Thành tiền:</label>
                    <span><%= numberFormat.format(thanhTien) %> đ</span>
                </div>
            </div>
        </div>
        <%
                }
            }
        } else {
        %>
        <div class="product">
            <div class="title">
                <span>Không có chi tiết đơn hàng</span>
            </div>
        </div>
        <%
            }
        %>
        <div class="dateOrder">
            <label for="">Ngày đặt hàng:</label>
            <%= ngayDatHang %>
        </div>
        <div class="total">
            <label for="">Tổng giá trị đơn hàng:</label>
            <span><%= numberFormat.format(afterTotal) %> đ</span>
        </div>
        <p class="back">
            <a href="./orders.jsp">
                <i class="fa-solid fa-arrow-left-long"></i>
                Quay về danh sách
            </a>
        </p>
    </div>
</div>

<!-- Begin: Footer -->
<%@include file="footer.jsp" %>
<!-- End: Footer -->
</body>
</html>

<style>
    .app {
        padding-top: 160px;
        padding-bottom: 160px;
        background-color: #f7f7f6;
    }

    h3 {
        color: var(--primary-color);
        font-size: 3rem;
        text-align: center;
    }

    .content {
        display: flex;
        flex-direction: column;
        align-items: center;
        font-size: 1.6rem;
    }

    .orderId {
        font-size: 2.4rem;
        font-weight: 600;
        color: var(--header-color);
    }

    .orderId,
    .group-product,
    .dateOrder,
    .total,
    .back {
        margin: 16px 0;
    }

    .title, .quantity, .price {
        margin: 12px 0;
    }

    .back a {
        color: var(--primary-color);
        text-decoration: none;
        font-weight: 600;
    }

    .back a:hover {
        color: var(--header-color);
        transition: linear 0.3s;
    }

</style>