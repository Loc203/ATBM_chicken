<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<%@ page import="model.TheLoai" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Locale" %>
<%@ page import="Cart.GioHang" %>
<%
    KhachHang userCheck = (KhachHang) session.getAttribute("acc");
    if (userCheck != null && userCheck.getMaTC() == -1) {
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
<%@page contentType="text/html;charset=UTF-8" language="java" %>
<% List<SanPham> data = (List<SanPham>) request.getAttribute("data");%>
<% List<TheLoai> allTL = (List<TheLoai>) request.getAttribute("tl");%>
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
                                 <% for(TheLoai tl : allTL) { %>
                                 <li class="category-item category-item--active">
                                     <a href="thucdon?theloai=<%= tl.getMaTL() %>" class="category-item__link"><%= tl.getTenTL()%></a>
                                 </li>
                                <% } %>
                             </ul>
                         </nav>
                     </div>
                     <div class="col l-8">
                        <div class="product-header">
                            <h1 class="product-header-name">THỰC ĐƠN</h1>
                        </div>
                         <div class="home-product">
                             <!-- Grid -> Row -> Column  -->
                             <div class="row sm-gutter">
                                 <!-- product -->
                                 <%
                                     NumberFormat nf = NumberFormat.getInstance();
                                     for (SanPham sp : data) {
                                 %>
                                 <%
                                     if (sp.getGiaGiam() == 0){
                                 %>
                                <div class="product col l-3">
                                     <a class="product-item" href="chitiet?masanpham=<%= sp.getMaSP() %>">
                                         <div class="product-item__img" style="background-image: url(<%= sp.getAnh().getDuongDan()%>);">
                                             <h4 class="product-item__name"><%= sp.getTenSP()%></h4>
                                             <div class="product-item__price">
                                                 <span class="product-item__price-current"><%= nf.format(sp.getGiaGoc())%> đ</span>
                                             </div>
                                             <div class="product-item__action">
                                                 <div class="btn-add-to-cart">
                                                    <span class="add-to-cart">Xem chi tiết</span>
                                                 </div>
                                             </div>
                                         </div>
                                     </a>
                                </div>
                                 <% } else {%>
                                 <div class="product col l-3">
                                     <a class="product-item" href="chitiet?masanpham=<%= sp.getMaSP() %>">
                                         <div class="product-item__img" style="background-image: url(<%= sp.getAnh().getDuongDan()%>);">
                                             <h4 class="product-item__name"><%= sp.getTenSP()%></h4>
                                             <div class="product-item__price">
                                                 <span class="product-item__price-old"><%= nf.format(sp.getGiaGoc())%> đ</span>
                                                 <span class="product-item__price-current"><%= nf.format(sp.getGiaGiam())%> đ</span>
                                             </div>
                                             <div class="product-item__action">
                                                 <div class="btn-add-to-cart">
                                                     <span class="add-to-cart">Xem chi tiết</span>
                                                 </div>
                                             </div>
                                         </div>
                                     </a>
                                 </div>
                                 <% } %>
                                 <% }
                                 %>
                             </div>
                             <ul class="listPage">
                                
                             </ul>
                         </div>
                     </div>
                 </div>
            </div>
         </div>
         <!-- End: Container -->

         <!-- Begin: Footer -->
        <%@include file="footer.jsp"%>
        <!-- End: Footer -->
        <script src="./assets/js/main.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
            <%
                String alert = (String) session.getAttribute("alert");
            %>

            <%
            if (alert == null){
            } else { %>
            swal("<%= alert%>", "", "success");
            // gắn thông báo
            <% session.setAttribute("alert", null);%>
            <% } %>
        </script>
    </div>
</body>
</html>