<%@ page import="java.util.List" %>
<%@ page import="model.SanPham" %>
<%@ page import="model.KhachHang"%>
<%@page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>Document</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/main.css">
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

    <!-- Popup hiển thị thông báo vô hiệu khóa -->
    <!-- Overlay làm mờ -->
    <div class="overlay" id="overlay"></div>

    <!-- Popup -->
    <div class="popup" id="popup">
        <p id="popupMessage"></p>
        <button class="close-btn" onclick="closePopup()">Đóng</button>
    </div>

    <!-- Begin: Container -->
    <div class="app__content">
        <!-- Begin: Slider -->
        <!-- Carousel -->
        <div class="carousel">
            <!-- List item -->
            <div class="list">
                <div class="item">
                    <img src="./assets/img/slider/new-slider-1.png">
                    <div class="slider-content">
                        <div class="author">KFP Chicken</div>
                        <div class="title">Hương vị đậm đà</div>
                        <div class="topic">Vỏ giòn rụm</div>
                        <div class="des">Thịt mềm thơm</div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-2.jpg">
                    <div class="slider-content">
                        <div class="author">KFP Chicken</div>
                        <div class="title">Sự kết hợp hoàn hảo</div>
                        <div class="topic">Vị ngon và</div>
                        <div class="des">Dinh dưỡng</div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-3.jpg">
                    <div class="slider-content">
                        <div class="author">KFP Chicken</div>
                        <div class="title">Một trải nghiệm vị giác thú vị</div>
                        <div class="topic">Một cảm xúc thăng hoa</div>
                        <div class="des">Một không gian đặc sắc</div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-4.jpg">
                    <div class="slider-content">
                        <div class="author">KFP Chicken</div>
                        <div class="title">Lựa chọn tuyệt vời</div>
                        <div class="topic">Bữa ăn gia đình</div>
                        <div class="des">Tiệc tùng</div>
                    </div>
                </div>
            </div>
            <!-- Thumbnail -->
            <div class="thumbnail">
                <div class="item">
                    <img src="./assets/img/slider/new-slider-1.png">
                    <div class="content">
                        <div class="title">
                            KFP
                        </div>
                        <div class="des">
                            Chicken Fried
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-2.jpg">
                    <div class="content">
                        <div class="title">
                            KFP
                        </div>
                        <div class="des">
                            Chicken Fried
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-3.jpg">
                    <div class="content">
                        <div class="title">
                            KFP
                        </div>
                        <div class="des">
                            Chicken Fried
                        </div>
                    </div>
                </div>
                <div class="item">
                    <img src="./assets/img/slider/new-slider-4.jpg">
                    <div class="content">
                        <div class="title">
                            KFP
                        </div>
                        <div class="des">
                            Chicken Fried
                        </div>
                    </div>
                </div>
            </div>
            <!-- Arrows -->
            <div class="arrows">
                <button id="prev"><</button>
                <button id="next">></button>
            </div>
            <div class="time"></div>
        </div>
        <!-- End: Silder -->

        <!-- Begin: Menu Home -->
<%--        <div class="product-carousel">--%>
<%--            <div class="title">--%>
<%--                TOP BÁN CHẠY--%>
<%--            </div>--%>
<%--            <div class="list">--%>
<%--                <%--%>
<%--                    List<SanPham> top6 = (List<SanPham>) request.getAttribute("carousel");--%>
<%--                    if (top6 != null) {--%>
<%--                        System.out.println("Top 6 size: " + top6.size());--%>
<%--                        for (SanPham sp : top6) {--%>
<%--                %>--%>
<%--                <div class="item">--%>
<%--                    <a class="product-item" href="chitiet?masanpham=<%=sp.getMaSP()%>">--%>
<%--                        <div class="product-item__img" style="background-image: url('<%=sp.getAnh().getDuongDan()%>');">--%>
<%--                            <h4 class="product-item__name"><%=sp.getTenSP()%></h4>--%>
<%--                            <div class="product-item__price">--%>
<%--                                <span class="product-item__price-current"><%=sp.getGiaGiam()%> đ</span>--%>
<%--                            </div>--%>
<%--                            <div class="product-item__action">--%>
<%--                                <div class="btn-add-to-cart">--%>
<%--                                    <span class="add-to-cart">Xem chi tiết</span>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </a>--%>
<%--                </div>--%>
<%--                <%--%>
<%--                    }--%>
<%--                } else {--%>
<%--                %>--%>
<%--                <div class="item">--%>
<%--                    <p>Không có sản phẩm nào để hiển thị.</p>--%>
<%--                </div>--%>
<%--                <%--%>
<%--                    }--%>
<%--                %>--%>
<%--            </div>--%>
<%--            <div class="see-more">--%>
<%--                <a href="thucdon" class="">Xem thêm</a>--%>
<%--            </div>--%>
<%--        </div>--%>
        <!-- End: Menu Home -->

        <!-- Begin: About Home -->
        <div class="about-home">
            <div class="grid">
                <div class="row">

                    <div class="about-home__img col l-6">
                        <img src="./assets/img/about-us/about-us.jpg" alt="">
                    </div>

                    <div class="about-home__desc col l-6">
                        <div class="wrapping-about-home" style="margin-top: 40px">
                                <span class="about-home__desc-intro">
                                    Đôi nét về
                                </span>
                            <span class="about-home__desc-title">
                                    KFP Chicken
                                </span>
                            <p class="about-home__desc-summary">
                                Một thần tượng có ước mơ trở thành chủ một chuỗi cửa hàng thức ăn nhanh. Kiara là phượng
                                hoàng, không phải gà hay gà tây. (Rất quan trọng)
                                Cô ấy bùng cháy rực rỡ, làm việc đến tận xương tủy vì dù sao thì cô ấy cũng sẽ tái sinh
                                từ đống tro tàn của mình. </p>
                            <div class="about-home__btn btn">
                                <a href="vechungtoi" class="about-home__btn--link">Tìm Hiểu Thêm</a>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- End: About Home -->

        <!-- Begin: Info Home -->
        <div class="info-home">
            <div class="grid wide">
                <div class="row">
                    <div class="info-home__standard col l-4">
                        <div class="info-home__standard-icon"
                             style=" background-image: url('./assets/img/footer/footer-circle.png');">
                            <a href="#" style="background-image: url('./assets/img/footer/footer-1.png');"
                               class="info-home__standard-icon--link"></a>
                        </div>

                        <div class="info-home__standard-desc">
                            <h3 class="standard-desc__title">
                                GÀ GIÒN CHUẨN
                                <br>
                                TƯƠI 100%
                            </h3>

                            <p class="standard-desc__info">
                                Thưởng thức gà rán giòn tan,
                                <br>
                                sử dụng gà tươi 100% từ nông trại
                            </p>
                        </div>
                    </div>
                    <div class="info-home__standard col l-4">
                        <div class="info-home__standard-icon"
                             style=" background-image: url('./assets/img/footer/footer-circle.png');">
                            <a href="#" style="background-image: url('./assets/img/footer/footer-2.png');"
                               class="info-home__standard-icon--link"></a>
                        </div>

                        <div class="info-home__standard-desc">
                            <h3 class="standard-desc__title">
                                NƯỚC NGỌT UỐNG
                                <br>
                                KHÔNG GIỚI HẠN
                            </h3>

                            <p class="standard-desc__info">
                                Uống nước ngọt thoải mái với
                                <br>
                                concept refill miễn phí
                            </p>
                        </div>
                    </div>
                    <div class="info-home__standard col l-4">
                        <div class="info-home__standard-icon"
                             style=" background-image: url('./assets/img/footer/footer-circle.png');">
                            <a href="#" style="background-image: url('./assets/img/footer/footer-3.png');"
                               class="info-home__standard-icon--link"></a>
                        </div>

                        <div class="info-home__standard-desc">
                            <h3 class="standard-desc__title">
                                DỊCH VỤ CHUYÊN NGHIỆP &
                                <br>
                                KHÔNG GIAN HIỆN ĐẠI
                            </h3>

                            <p class="standard-desc__info">
                                Trải nghiệm các dịch vụ chuyên nghiệp
                                <br>
                                & không gian cực cool
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End: Info Home -->
    </div>
    <!-- End: Container -->

    <!-- Begin: Footer -->
     <%@include file="footer.jsp"%>
    <!-- End: Footer -->
</div>
<script>
    let nextDom = document.getElementById('next');
    let prevDom = document.getElementById('prev');
    let carouselDom = document.querySelector('.carousel');
    let listItemDom = document.querySelector('.carousel .list');
    let thumbnailDom = document.querySelector('.carousel .thumbnail');

    // Khai báo mảng chứa các slider-content
    let sliderContents = document.querySelectorAll('.carousel .list .item .slider-content');

    // Ẩn tất cả slider-content trừ slider-content của item đầu tiên
    sliderContents.forEach((content, index) => {
        if (index !== 0) {
            content.style.display = 'none';
        }
    });

    nextDom.onclick = function () {
        showSlider('next');
    }

    prevDom.onclick = function () {
        showSlider('prev');
    }

    let timeRunning = 3000;
    let timeAutoNext = 7000;
    let runTimeOut;
    let runAutoRun = setTimeout(() => {
        nextDom.click();
    }, timeAutoNext);

    function showSlider(type) {
        let itemSlider = document.querySelectorAll('.carousel .list .item');
        let itemThumbnail = document.querySelectorAll('.carousel .thumbnail .item');

        if (type === 'next') {
            listItemDom.appendChild(itemSlider[0]);
            thumbnailDom.appendChild(itemThumbnail[0]);
            carouselDom.classList.add('next');
        } else {
            let positionLastItem = itemSlider.length - 1;
            listItemDom.prepend(itemSlider[positionLastItem]);
            thumbnailDom.prepend(itemThumbnail[positionLastItem]);
            carouselDom.classList.add('prev');
        }

        // Ẩn tất cả slider-content của các item
        itemSlider.forEach(item => {
            item.querySelector('.slider-content').style.display = 'none';
        });

        // Hiển thị slider-content của item đầu tiên trong list
        itemSlider[0].querySelector('.slider-content').style.display = 'block';

        clearTimeout(runTimeOut);
        runTimeOut = setTimeout(() => {
            carouselDom.classList.remove('next');
            carouselDom.classList.remove('prev');
        }, timeRunning);

        clearTimeout(runAutoRun);

    }

        // JavaScript hiển thị popup
        window.onload = function () {
        const urlParams = new URLSearchParams(window.location.search);
        const message = urlParams.get('message');
        const popup = document.getElementById('popup');
        const overlay = document.getElementById('overlay');
        const popupMessage = document.getElementById('popupMessage');

        if (message === 'success') {
        popupMessage.textContent = 'Khóa đã được vô hiệu hóa thành công';
        popupMessage.style.color = 'green';
        showPopup();
    } else if (message === 'failure') {
        popupMessage.textContent = 'Không thể vô hiệu hóa khóa';
        popupMessage.style.color = 'red';
        showPopup();
    } else if (message === 'not_found') {
        popupMessage.textContent = 'Không tìm thấy thông tin tài khoản trong session';
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
</body>
</html>