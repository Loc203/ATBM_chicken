<%@ page import="java.util.List" %>
<%@ page import="Cart.GioHangSanPham" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="model.SanPham" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
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
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale = 1.0">;
    <title>Giỏ hàng</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/cart.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
    <div class="app">
         <!-- Begin: Header -->
        <%@include file="header.jsp"%>
        <!-- End: Header -->

        <!-- Begin: Cart -->
        <div class="app_content">
            <div class="product grid wide">
                <table>
                    <tr>
                        <th>Sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Tổng giá</th>
                    </tr>
                    <%
                        NumberFormat nf = NumberFormat.getInstance();
                        List<GioHangSanPham> sanPhams = (List<GioHangSanPham>) request.getAttribute("list-sp");
                        double tongGiaTri = 0;
                        for (GioHangSanPham sp: sanPhams) {
                            tongGiaTri+= sp.tongGiaTri();
                    %>
                    <tr>
                        <td>
                            <% if(sp.getSp().getGiaGiam() == 0) { %>
                                <div class="product-img">
                                    <img src="<%= sp.getSp().getAnh().getDuongDan()%>" alt="">
                                    <div class="">
                                        <p><%= sp.getSp().getTenSP()%></p>
                                        <small>Giá: <%= nf.format(sp.getSp().getGiaGoc())%> đ</small>
                                        <br>
                                        <a href="xoa-san-pham?masanpham=<%=sp.getSp().getMaSP()%>">Xóa</a>
                                    </div>
                                </div>
                            <% } else {%>
                                <div class="product-img">
                                    <img src="<%= sp.getSp().getAnh().getDuongDan()%>" alt="">
                                    <div class="">
                                        <p><%= sp.getSp().getTenSP()%></p>
                                        <small>Giá: <%= nf.format(sp.getSp().getGiaGiam())%> đ</small>
                                        <br>
                                        <a href="xoa-san-pham?masanpham=<%=sp.getSp().getMaSP()%>">Xóa</a>
                                    </div>
                                </div>
                            <% } %>
                        </td>
                        <td>
                            <div class="change-quantity">
                                <a href="tang-giam?thuchien=giam&masanpham=<%= sp.getSp().getMaSP()%>" class="cart-btn-minus" style="font-size: 2.4rem; padding: 8px;border: 4px; cursor: pointer; font-weight: 800;">-</a>
                                <input type="number" value="<%= sp.getSoLuong()%>" name="quantity" disabled>
                                <a href="tang-giam?thuchien=tang&masanpham=<%= sp.getSp().getMaSP()%>" class="cart-btn-plus" style="font-size: 2.4rem; padding: 8px; border: 4px; cursor: pointer;">+</a>
                            </div>
                        </td>
                        <% if(sp.getSp().getGiaGiam() == 0) {%>
                        <td class="total-price"><%= nf.format(sp.getSoLuong() * sp.getSp().getGiaGoc())%> đ</td>
                        <% } else { %>
                        <td class="total-price"><%= nf.format(sp.getSoLuong() * sp.getSp().getGiaGiam())%> đ</td>
                        <% } %>
                    </tr>
                    <% } %>
                </table>
                <div class="total-bill" style="min-height: 140px; margin-top: 120px">
                    <table>
                        <tr>
                            <td>Tổng hóa đơn: </td>
                            <td class="bill"><%= nf.format(tongGiaTri)%> đ</td>
                        </tr>
                    </table>
                </div>
               <%
                    // Kiểm tra xem session có tồn tại không
                    if (session.getAttribute("acc") != null && session.getAttribute("cart") != null) {
                %>
                <div class="cart-payment">
                    <div class="payment-methods">
                        <span class="method">Phương thức thanh toán:</span>
                        <div id="pay-cod" class="pay pay--active">Thanh toán COD</div>
                    </div>
                    <a href="thanhtoan">
                        <button class="btn-pay" type="button" value="pay">Thanh toán</button>
                    </a>
                </div>
                <%
                    }
                %>
            </div>
        </div>
        <!-- End: Cart -->

         <!-- Begin: Footer -->
        <%@include file="footer.jsp"%>
        <!-- End: Footer -->
    </div>
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var payCod = document.getElementById("pay-cod");
            var payCvc = document.getElementById("pay-cvc");

            payCod.addEventListener("click", function () {
                payCod.classList.add("pay--active");
                payCvc.classList.remove("pay--active");
            });

            payCvc.addEventListener("click", function () {
                payCvc.classList.add("pay--active");
                payCod.classList.remove("pay--active");
            });
        });
    </script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script type="text/javascript">
        <%
            String alert = (String) session.getAttribute("remove-cart-alert");
        %>

        <%
        if (alert == null){
        } else { %>
        swal("<%= alert%>", "", "success");
        <% session.setAttribute("remove-cart-alert", null);%>
        <% } %>
    </script>
</body>
</html>