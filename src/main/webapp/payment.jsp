<!DOCTYPE html>
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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="./assets/css/payment.css">
    <title>Thanh toán khi nhận hàng</title>
</head>
<style>
    .app {
        background-color: #f7f7f6;
    }

    .contact-form {
        height: 600px;
        display: flex;
        justify-content: center;
        flex-direction: column;
        align-items: center;
        margin-top: 80px;
    }
    .title-form h3 {
        font-size: 2.4rem;
        color: var(--primary-color);
    }

    .content-form {
        font-size: 1.6rem;
    }

    .form-input input {
        width: 540px;
        height: 45px;
        margin: 8px 0;
        border: none;
        padding: 8px;
        border-radius: 8px;
    }

    .order-submit {
        display: flex;
        justify-content: center;
        align-items: center;
    }

    .order-submit button {
        width: 140px;
        height: 50px;
        color: var(--header-color);
        background-color: var(--primary-color);
        border-radius: 8px;
        border: none;
        margin-top: 8px;
    }

    .order-submit button:hover {
        background-color: var(--header-color);
        color: var(--white-color);
        cursor: pointer;
        transition: linear .3s;
    }

    .guide,
    .notice,
    .note{
        padding: 4px;
        font-size: 1.2rem;
    }

    .text-notice {
        color: red;
    }
</style>
<body>
    <!-- Begin: Header -->
    <%@include file="header.jsp"%>
    <!-- End: Header -->
    <div class="app">
        <div class="grid wide">
            <div class="row">
                <div class="col l-12">
                    <div class="contact-form">
                        <div class="title-form">
                            <h3>Thông tin thanh toán</h3>
                        </div>
                        <div class="content-form">
<%--                            action="/thanhtoan" method="post"--%>
                            <form id="paymentForm" class="form-contact">
                                <%
                                    // Lấy thông tin từ session
                                    KhachHang khachHang = ((KhachHang) session.getAttribute("acc"));
                                %>
                                <div class="form-input">
                                    <input type="text" name="name" required placeholder="<%=khachHang.getTenKH()%>" value="<%=khachHang.getTenKH()%>">
                                </div>
                                <div class="form-input">
                                    <input type="text" name="tel" required placeholder="<%=khachHang.getSoDT()%>" value="<%=khachHang.getSoDT()%>">
                                </div>
                                <div class="form-input">
                                    <input type="email" name="email" placeholder="<%=khachHang.getEmail()%>" value="<%=khachHang.getEmail()%>">
                                </div>
                                <div class="guide">
                                    <p>Vui lòng nhập địa chỉ theo định dạng: Xã/Phường, Quận/Huyện/Thị xã, Tỉnh/Thành phố
                                    </p>
                                    <p>Ví dụ: Phường Linh Trung, Thành phố Thủ Đức, Hồ Chí Minh</p>
                                </div>
                                <div class="form-input">
                                    <input type="text" name="address" required placeholder="<%=khachHang.getDiaChi()%>" value="<%=khachHang.getDiaChi()%>">
                                </div>
                                <div class="notice">
                                    <p class="text-notice">Lưu ý: phạm vi giao hàng <= 10km, nếu ngoài phạm vi chúng tôi sẽ hủy đơn hàng</p>
                                </div>
                                <div class="form-input">
                                    <input type="text" name="note" placeholder="Ghi chú">
                                </div>
                                <div class="note">Nếu nhận hàng tại cửa hàng vui lòng thêm chữ "nhận tại cửa hàng" vào ô ghi chú
                                <br>
                                Ví dụ: ghi chú của bạn, nhận tại cửa hàng</div>
                                <div class="form-input">
                                    <input type="text" name="privateKey" placeholder="Private Key">
                                </div>
                                <div class="note">Vui lòng cung cấp private key để chúng tôi xác minh đây chính là bạn!</div>
                                <div id="errorMessage" style="color: red;"></div>
                                <div class="order-submit">
                                    <div class="send">
                                        <button type="submit">
                                            Xác nhận
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Begin: Footer -->
    <%@include file="footer.jsp"%>
    <!-- End: Footer -->

    <script>
        $(document).ready(function () {
            $("#paymentForm").on("submit", function (e) {
                e.preventDefault(); // Ngăn form gửi theo cách thông thường

                // Lấy dữ liệu từ form
                const formData = $(this).serialize();

                // Gửi dữ liệu qua AJAX
                $.ajax({
                    url: "/thanhtoan", // Đường dẫn đến Servlet
                    type: "post",
                    data: formData,
                    success: function (response) {
                        if (response === "valid") {
                            // Nếu dữ liệu hợp lệ, chuyển sang trang thành công
                            window.location.href = "/trangchu";
                        } else {
                            // Hiển thị thông báo lỗi nếu không hợp lệ
                            $("#errorMessage").text(response);
                        }
                    },
                    error: function () {
                        alert("Đã xảy ra lỗi! Vui lòng thử lại.");
                    }
                });
            });
        });
    </script>
</body>
</html>