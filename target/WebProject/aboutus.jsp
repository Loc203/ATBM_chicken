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
    <title>Về chúng tôi</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/about-us-main.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app">
    <!-- Begin: Header -->
    <%@include file="header.jsp"%>


    <div class="app__content">
        <!-- Begin: Slider -->
        <div class="wrapping-slider">
            <div class="app__content-slider" style="background-image: url('./assets/img/slider/slider-img.jpg');">
            </div>
        </div>
                <div class = "slider-content">
                    <div class="wrapper">
                        <div class ="content">
                            <h1>GIỚI THIỆU</h1>
                        </div>
                    </div>
                </div>

<!-- End: Slider -->

<!-- Begin: About-us Content -->
<div class="about-us-content">
    <!-- About us General -->
    <div class="group-a">
        <div class="about-wrapper">
            <div class="group-a-cont">
            <div class="leftcol1-1">
                <div class="description">
                    <div class="des-title">
                        <h2>KFP CHICKEN</h2>
                    </div>
                    <div class="des-content">
                        <p> - Được thành lập tại Thủ Đức, TP. Hồ Chí Minh. Với doanh thu đạt hơn 1500000 mỗi tuần, KFP Chicken là 1 trong những của hàng đồ ăn nhanh hàng đầu về gà rán tại Việt Nam.</p>
                        <p> - KFP Chicken được biến đến rộng rãi nhờ vào nguyên liệu gà luôn tươi ngon, chất lượng nhất, không sử dụng sản phẩm đông lạnh. Đồng thời đảm bảo được độ ngon giòn và nóng hổi của các món ăn cho các thực khách.</p>
                    </div>
                </div>
            </div>
            <div class="rightcol1-1">
                <div class="a-img">
                    <img src="./assets/img/about-us/kfp.gif" alt="KFP GIF">
                </div>
            </div>
            </div>
        </div>
    </div>
    <!-- Năm 2020 -->
        <div class="group-b">
            <div class="b-title">
                <div class="about-wrapper">
                    <h2>Sự phát triển của cửa hàng</h2>
                </div>
            </div>
            <div class="group-b-cont">
                <div class="about-wrapper">
                    <div class="title-years">
                        <div class="years">
                            <h3>2020</h3>
                        </div>
                        <div class="cont-2020">
                            <div class="content-aboutus">
                                <div class="cleft">
                                    <div class="col1-2020">
                                        <div class="about-col">
                                            <div class="thumb">
                                                <img src="./assets/img/about-us/Takanashi-Kiara-Portrait.png"alt="portrait">
                                            </div>
                                            <div class="desc">
                                                Takanashi Kiara, cô nàng thần
                                                tượng đã đặt nền móng cho KFP
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                    <div class="cright">
                                        <div class="content-aboutus">
                                        <div class="col2-2020">
                                            <div class="about-col">
                                                <div class="thumb">
                                                    <img src="./assets/img/about-us/300000.png" alt="300k">
                                                </div>
                                                <div class="desc">
                                                    KFP đã nhanh chóng tạo nên
                                                    cơn sốt khi trong vòng tháng
                                                    đầu tiên đã có doanh thu đến
                                                    hơn 300000.
                                                    </div>
                                            </div>
                                        </div>
                                            <div class="col3-2020">
                                                <div class="about-col">
                                                    <div class="thumb">
                                                        <img src="./assets/img/about-us/mascot1.jpg" alt="m1">
                                                    </div>
                                                    <div class="desc">
                                                        Linh vật đầu tiền của KFP
                                                        tên Chimken
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
    <!-- Năm 2021 -->
        <div class="group-c">
            <div class="about-wrapper">
                <div class="title-years">
                    <div class="years">
                        <h2>2021</h2>
                    </div>
                </div>
                        <div class="cont-2021">
                            <div class="group-c-cont">
                                <div class="col1-2021">
                                    <div class="about-col2">
                                        <div class="thumb">
                                            <img src ="./assets/img/about-us/store.png" alt="store">
                                        </div>
                                        <div class="desc">
                                            KFP Chicken mở thêm 1 chi nhánh tại Đức.
                                        </div>
                                    </div>
                                </div>
                                <div class="col2-2021">
                                    <div class="about-col2">
                                        <div class="thumb">
                                            <img src="./assets/img/about-us/mascot2.jpg" alt="mascot2">
                                        </div>
                                        <div class="desc">
                                            Linh vật thứ 2 và là linh vật hiện
                                            tại có tên Kotori.
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
            </div>
        </div>
    <!-- Năm 2022 -->
    <div class="group-d">
        <div class="about-wrapper">
            <div class="title-years">
                <div class="years">
                    <h2>2022</h2>
                </div>
            </div>
            <div class="cont-2022">
                <div class="group-c-cont">
                    <div class="col1-2021">
                        <div class="about-col2">
                            <div class="thumb">
                                <img src ="./assets/img/about-us/handshake.jpg" alt="collab">
                            </div>
                            <div class="desc">
                                Hợp tác cùng cửa hàng đồ ăn nhanh Nijisanji
                                ,trở thành chuỗi cửa hàng đồ ăn nhanh KFP
                                                Chicken
                            </div>
                        </div>
                    </div>
                    <div class="col2-2021">
                        <div class="about-col2">
                            <div class="thumb">
                                <img src="./assets/img/about-us/holotalk.png" alt="holotalk">
                            </div>
                            <div class="desc">
                                Được giới truyền thông để ý và bắt đầu dự án
                                Holotalk nhằm truyền bá hình ảnh của KFP đến
                                nhiều người hơn
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Năm 2023 -->
    <div class="group-e">
        <div class="about-wrapper">
            <div class="title-years">
                <div class="years">
                    <h2>2023</h2>
                </div>
            </div>
            <div class="cont-2023">
                <div class="group-c-cont">
                    <div class="col1-2021">
                        <div class="about-col2">
                            <div class="thumb">
                                <img src ="./assets/img/about-us/200m.png" alt="200mil">
                            </div>
                            <div class="desc">
                                Tổng doanh thu đạt được hơn 200.000.000
                            </div>
                        </div>
                    </div>
                    <div class="col2-2021">
                        <div class="about-col2">
                            <div class="thumb">
                                <img src="./assets/img/about-us/stonks.png" alt="stonks">
                            </div>
                            <div class="desc">
                                Trở thành 1 trong những cửa hàng thức ăn nhanh
                                phát triển nhanh nhất
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    </div>
    <!--End: about-us-content-->
    <%@include file="footer.jsp"%>
    <!-- End: Footer -->
</div>
</body>
</html>