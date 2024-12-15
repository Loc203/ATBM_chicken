<%@ page import="model.KhachHang" %>
<%@ page import="java.util.Objects" %>
<%@page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/payment-card.css">
    <link rel="stylesheet" type="text/css" href="path/to/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <script src="path/to/sweetalert2.all.min.js"></script>

        <title>Thanh toán bằng thẻ</title>
    </head>

    <body class="all-form">

<%--    <%String error = (String) request.getSession().getAttribute("error");%>--%>
<%--    <%String success = (String) request.getSession().getAttribute("success");%>--%>

<%--    <script>--%>
<%--        function showSweetAlert(icon, title, message) {--%>
<%--            Swal.fire({--%>
<%--                icon: icon,--%>
<%--                title: title,--%>
<%--                text: message,--%>
<%--                confirmButtonText: 'Đồng ý'--%>
<%--            });--%>
<%--        }--%>
<%--    </script>--%>
<%--    <%--%>
<%--        // Get the success attribute from the request--%>
<%--        Object successAttribute = request.getAttribute("success");--%>

<%--        // Check if there is a success attribute and it's the second or third redirect--%>
<%--        if (successAttribute != null) {--%>
<%--        String successMessage = Objects.toString(successAttribute, "");--%>
<%--            Integer redirectCount = (Integer) session.getAttribute("redirectCount");--%>

<%--            // Clear the success attribute to avoid displaying it again--%>
<%--        request.removeAttribute("success");--%>

<%--        // Show SweetAlert only on the second or third redirect after form submission--%>
<%--        if (redirectCount >= 2 ) {--%>
<%--    %>--%>
<%--    <script>--%>
<%--        showSweetAlert('success', 'Thông báo thành công', '<%= successMessage %>');--%>
<%--    </script>--%>
<%--    <%--%>
<%--        }--%>
<%--        }--%>
<%--    %>--%>
<!-- Begin: Header -->
<header id="header">
    <div class="grid wide">
        <nav class="navbar">
            <div class="hlogo">
                <div class="navbar__logo">
                    <a href="trangchu" class="navbar__logo--link">
                        <img src="./assets/img/logo/logo-2.jpg" alt="" class="navbar__logo--img">
                    </a>
                </div>
            </div>
    </nav>
    </div>
</header>
<!-- End: Header -->
<%
    // Lấy thông tin từ session
    int id = ((KhachHang) session.getAttribute("acc")).getMaKH();
    String username = ((KhachHang) session.getAttribute("acc")).getTenKH();


%>
<% String errorMessage = (String) request.getAttribute("error"); %>

<%-- Display the error message with SweetAlert if it's not null --%>
<% if (errorMessage != null) { %>
<script>
    // Display SweetAlert with the error message
    Swal.fire({
        icon: 'error',
        title: 'Payment Error',
        text: '<%= errorMessage %>',
        confirmButtonText: 'Đồng ý',  // Set the text for the Confirm button

    });
</script>
<% } %>
<form action="thanhtoan" method="post">
    <div class="container" id="container">
        <img src="./assets/img/white-background/background-login.jpg" class="background-login_img">
        <div class="container-form">
            <p class="h8">Thanh toán</p>
            <div class="information-form">
                <div class="col-12">
                    <div class="payment-input">
                        <p class="text-payment">Họ tên</p>
                        <input name="cardName" class="payment-input pay-name" type="text" placeholder="<%= username %>" value="<%= username %>" disabled>
                    </div>
                </div>
                <div class="col-12">
                    <div class="payment-input">
                        <p class="text-payment">Số thẻ</p>
                        <input name="cardNumber" class="payment-input pay-number" type="text" placeholder="1234 5678 435678" autofocus required>
                    </div>
                </div>
                <div class="col-6">
                    <div class="payment-input">
                        <p class="text-payment">Thời hạn hiệu lực</p>
                        <input name="cardDate" class="payment-input pay-date" type="date">
                    </div>
                    <div class="payment-input ">
                        <p class="text-payment">Mật khẩu</p>
                        <input name="cardPassword" class="payment-input pay-password" type="password" placeholder="***" required>
                    </div>
                </div>
                <div class="col-13">
                    <div class="payment-button pay">
                        <button type="submit" class="payment-button pay">
                            <span class="text-payment pay">Thanh toán</span>
                            <i class='fas fa-arrow-right' style='font-size:14px'></i>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>

<!-- Begin: Footer -->
        <div class ="footer-form">
          <footer id="footer">
                <div class="grid wide">
                    <div class="row">
                        <div class="footer-info col l-4">
                            <h3 class="footer-title">KFP CHICKEN VIETNAM</h3>
                            <ul class="footer-list">
                                <li class="footer-list__item">
                                    <i class="footer-icon fa-solid fa-location-dot"></i>
                                    Khu Phố 6, Thủ Đức, Thành phố Hồ Chí Minh
                                </li>
                                <li class="footer-list__item">
                                    <i class="footer-icon fa-solid fa-phone"></i>
                                    0123456789
                                </li>
                                <li class="footer-list__item">
                                    <i class="footer-icon fa-regular fa-envelope"></i>
                                    lamhongphuc0110@gmail.com
                                </li>
                                <li class="footer-list__item">
                                    <i class="footer-icon fa-solid fa-globe"></i>
                                    https://onlyfans.com/hongphuclam
                                </li>
                            </ul>
                        </div>
                        <div class="footer-info col l-4">
                            <h3 class="footer-title">Thông Tin</h3>
                            <ul class="footer-list">
                                <li class="footer-list__item">
                                    <a href="#" class="footer-list__item--link">
                                        Về KFP Chicken
                                    </a>
                                </li>
                                <li class="footer-list__item">
                                    <a href="#" class="footer-list__item--link">
                                        Thực đơn
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div class="footer-info col l-4">
                            <ul class="footer-list__socials">
                                <h3 class="footer-title">Kết Nối</h3>
                                <li class="footer-list__item">
                                    <a href="https://www.facebook.com/profile.php?id=100004867398813"
                                       class="footer-list__item-social--link">
                                        <i class="footer-icon fa-brands fa-facebook"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="copyright">
                        Copyright © 2023 Nhóm 35
                    </div>
                </div>
            </footer>
        </div>
        <!-- End: Footer -->
</body>

</html>