<%@ page import="model.SanPham" %>
<%@ page import="java.util.StringTokenizer" %>
<%@ page import="model.TheLoai" %>
<%@ page import="java.util.List" %>
<%@ page import="Cart.GioHang" %>
<%@ page import="java.text.NumberFormat" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<% SanPham sp = (SanPham) request.getAttribute("data");%>
<% List<TheLoai> allTL = (List<TheLoai>) request.getAttribute("tl");%>
<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck != null && userCheck.getMaTC() == -1) {
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Thực Đơn</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/menu.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<style>
    .detail-img {
        position: relative;
    }

    .opacity {
        opacity: 0.6;
    }

    .sold-out {
        color: var(--white-color);
        background-color: var(--primary-color);
        position: absolute;
        font-size: 4rem;
        padding: 16px;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
    }

    .btn-add-to-cart-sold-out {
        pointer-events: none;
        cursor: default; /* Thêm cảm giác không thể click */
        color: var(--white-color);
        background-color: var(--sale-color);
        padding: 8px;
        margin-left: 12px;
        border-radius: 4px;
    }
</style>
<body>
<div class="app">
    <!-- Begin: Header -->
    <%@include file="header.jsp"%>
    <!-- End: Header -->

    <!-- Begin: Container -->
    <div class="app__container">
        <div class="grid wide">
            <div class="row sm-gutter app__content">
                <div class="col l-4">
                    <nav class="category">
                        <ul class="category-list">
                            <%
                                NumberFormat nf = NumberFormat.getInstance();
                                for(TheLoai tl : allTL) {
                            %>
                            <li class="category-item category-item--active">
                                <a href="thucdon?theloai=<%= tl.getMaTL() %>" class="category-item__link"><%= tl.getTenTL()%></a>
                            </li>
                            <% } %>
                        </ul>
                    </nav>
                </div>
                <div class="col l-8">
                    <div class="detail">
                        <!-- Grid -> Row -> Column  -->
                        <%
                            if (sp.getSoLuongTonKho() == 0) {
                        %>
                        <div class="row sm-gutter">
                            <!-- product -->
                            <div class="detail-img col l-6">
                                <img src="<%= sp.getAnh().getDuongDan()%>" alt="" class="opacity">
                                <div class="sold-out">Hết hàng</div>
                            </div>
                            <div class="detail-desc col l-6">
                                     <span class="detail-desc__title">
                                        <%= sp.getTenSP()%>
                                     </span>
                                <% if (sp.getGiaGiam() == 0) {%>
                                <div class="detail-desc__price">
                                    <span class="detail-desc__price-label">Giá bán:</span>
                                    <span class="detail-desc__price-current"> <%= nf.format(sp.getGiaGoc())%> đ</span>
                                </div>
                                <% } else {%>
                                <div class="detail-desc__price">
                                    <span class="detail-desc__price-label">Giá bán:</span>
                                    <span class="detail-desc__price-current"> <%= nf.format(sp.getGiaGiam())%> đ</span>
                                    <span class="detail-desc__price-old"> <%= nf.format(sp.getGiaGoc())%> đ</span>
                                </div>
                                <% } %>
                                <%
                                    StringTokenizer st = new StringTokenizer(sp.getMoTa(), "-");
                                    while (st.hasMoreTokens()) {
                                %>
                                <ul class="detail-desc__list">
                                    <li class="detail-desc__list-item">
                                        <%= st.nextToken()%>
                                    </li>
                                </ul>
                                <% } %>
                                <div class="order">
                                    <a href="them-gio-hang?masanpham=<%=sp.getMaSP()%>" class="btn-add-to-cart-sold-out" style="text-decoration: none">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="des" style="font-size: 1.6rem; margin-top: 32px; line-height: 1.6;">
                            2 Miếng Gà Giòn Sốt Me: Gà được chiên giòn đến màu vàng óng ánh, với vỏ giòn rụm bên ngoài và thịt mềm mịn bên trong. Sốt me được làm từ me chua ngọt, có vị đậm đà và hấp dẫn. Sốt me được phủ đều lên bề mặt gà, tạo ra một lớp vị đặc biệt, kết hợp hài hòa với vị giòn của gà rán.
                            <br>
                            2 Miếng Gà có Xương (Lựa Chọn Vị Cay/ Không Cay): Các miếng gà này được chế biến từ phần cánh hoặc đùi của gà, với xương bên trong giúp giữ cho thịt gà mềm ngọt và ngon miệng. Bạn có thể lựa chọn giữa vị cay hoặc không cay cho miếng gà này, tùy thuộc vào sở thích về mức độ gia vị.
                        </div>
                        <% } else {%>
                        <div class="row sm-gutter">
                            <!-- product -->
                            <div class="detail-img col l-6">
                                <img src="<%= sp.getAnh().getDuongDan()%>" alt="" class="">
                            </div>
                            <div class="detail-desc col l-6">
                                     <span class="detail-desc__title">
                                        <%= sp.getTenSP()%>
                                     </span>
                                <% if (sp.getGiaGiam() == 0) {%>
                                <div class="detail-desc__price">
                                    <span class="detail-desc__price-label">Giá bán:</span>
                                    <span class="detail-desc__price-current"> <%= nf.format(sp.getGiaGoc())%> đ</span>
                                </div>
                                <% } else {%>
                                <div class="detail-desc__price">
                                    <span class="detail-desc__price-label">Giá bán:</span>
                                    <span class="detail-desc__price-current"> <%= nf.format(sp.getGiaGiam())%> đ</span>
                                    <span class="detail-desc__price-old"> <%= nf.format(sp.getGiaGoc())%> đ</span>
                                </div>
                                <% } %>
                                <%
                                    StringTokenizer st = new StringTokenizer(sp.getMoTa(), "-");
                                    while (st.hasMoreTokens()) {
                                %>
                                <ul class="detail-desc__list">
                                    <li class="detail-desc__list-item">
                                        <%= st.nextToken()%>
                                    </li>
                                </ul>
                                <% } %>
                                <div class="order">
                                    <a href="them-gio-hang?masanpham=<%=sp.getMaSP()%>" class="btn-add-to-cart" style="text-decoration: none">Thêm vào giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <div class="des" style="font-size: 1.6rem; margin-top: 32px; line-height: 1.6;">
                            2 Miếng Gà Giòn Sốt Me: Gà được chiên giòn đến màu vàng óng ánh, với vỏ giòn rụm bên ngoài và thịt mềm mịn bên trong. Sốt me được làm từ me chua ngọt, có vị đậm đà và hấp dẫn. Sốt me được phủ đều lên bề mặt gà, tạo ra một lớp vị đặc biệt, kết hợp hài hòa với vị giòn của gà rán.
                            <br>
                            2 Miếng Gà có Xương (Lựa Chọn Vị Cay/ Không Cay): Các miếng gà này được chế biến từ phần cánh hoặc đùi của gà, với xương bên trong giúp giữ cho thịt gà mềm ngọt và ngon miệng. Bạn có thể lựa chọn giữa vị cay hoặc không cay cho miếng gà này, tùy thuộc vào sở thích về mức độ gia vị.
                        </div>
                        <% } %>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- End: Container -->

    <!-- Begin: Footer -->
    <%@include file="footer.jsp"%>
    <!-- End: Footer -->
</div>
</body>
</html>