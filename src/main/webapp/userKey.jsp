<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="Cart.GioHang" %>
<%@ page import="model.KhachHang" %>
<%@ page import="entity.PublicKeyUser"%>
<%
  KhachHang userCheck = (KhachHang) session.getAttribute("acc");
  if (userCheck.getMaTC() == -1) {
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
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Thông tin tài khoản</title>

  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">
  <link rel="stylesheet" href="./assets/css/base.css">
  <link rel="stylesheet" href="./assets/css/grid.css">
  <link rel="stylesheet" href="./assets/css/User-main.css">
  <link rel="stylesheet" href="./assets/css/responsive.css">
  <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
  <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
  <script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/vn.js"></script>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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

  <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app">
  <!-- Đoạn mã Java để lấy thông tin từ session -->
  <%
    // Lấy thông tin từ session
    int id = ((KhachHang)session.getAttribute("acc")).getMaKH();
    String username = ((KhachHang) session.getAttribute("acc")).getTenKH();
    String email = ((KhachHang) session.getAttribute("acc")).getEmail();
    String phone = ((KhachHang) session.getAttribute("acc")).getSoDT();
    String address = ((KhachHang) session.getAttribute("acc")).getDiaChi();
    String birth = ((KhachHang) session.getAttribute("acc")).getNgaySinh().toString();
    String gender = ((KhachHang) session.getAttribute("acc")).getGioiTinh();
  %>

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
        <div class="navbar__content">
          <ul class="navbar__list">
            <li class="navbar__list--item">
              <a href="#" class="navbar__list--link">
                <!-- Sẽ thay đổi dựa trên dữ liệu -->
                <i class="navbar__list-icon fa-regular fa-user"><%= email %>
                </i>
              </a>
              <div class="account__info">
                <a href="logout" class="account_setting" style="margin-top: -10%;">Đổi tài khoản</a>
                <a href="reportkey" class="account_setting" style="margin-top: 4%;">Báo cáo khóa</a>

              </div>
            </li>
          </ul>
        </div>
      </nav>
    </div>
  </header>

  <div class="app__content">
    <!-- Begin: Content -->
    <div class="container info">
      <div class="left-col">
        <div class="user-info"><a class="user-img" href="">
          <div class="avatar">
            <img class="avatar__img"
                 src="https://down-vn.img.susercontent.com/file/d5ad3acf45214b97e525f2c2785f3a36_tn"></div>
        </a>
          <div class="user-setting">
            <div class="username">Tài khoản</div>
            <div><a class="change-username" href="#">
              <svg width="12" height="12" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                   style="margin-right: 4px;">
                <path d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
                      fill="#9B9B9B" fill-rule="evenodd"></path>
              </svg>
            </a>
            </div>
          </div>
        </div>
        <div class="sidebar">
          <div class="stardust-dropdown stardust-dropdown--open">
            <div class="stardust-dropdown__item-header"><a class="header-itemlink" href="#">
              <div class="thumbnail">
                <img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4">
              </div>
              <div class="sbheader-container"><span class="item-header">Tài khoản của tôi</span></div>
            </a>
            </div>
            <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open"
                 style="opacity: 1;">
              <div class="sidebar-content">
                <a class="sb-item" href="thongtintaikhoan">
                  <span class="sbi-content">Hồ sơ</span>
                </a>
                <a class="sb-item" href="doimatkhau">
                  <span class="sbi-content">Đổi mật khẩu</span>
                </a>
                <a class="sb-item" href="xemdonhang">
                  <span class="sbi-content">Xem đơn hàng</span>
                </a>
                <a class="sb-item" href="userKey.jsp">
                  <span class="sbi-content">Yêu cầu khóa mới</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="right-col">
        <div class="rc-container" role="main">
          <div style="display: contents;">
            <div class="rc-contentbox">
              <div class="rc-header"><h1 class="rc-title">Hồ sơ của tôi</h1>
                <div class="rc-desc">Quản lý thông tin hồ sơ để bảo mật tài khoản</div>
              </div>
              <table id="dataTable" class="display select" style="width:100%">
                <thead>
                <tr>
                  <th>ID</th>
                  <th>Mã Khách Hàng</th>
                  <th>Public Key</th>
                  <th>Ngày tạo</th>
                  <th>Trạng thái</th>
                </tr>
                </thead>
              </table>
              <div id="notification" style="margin-top: 20px;"></div>
              <!-- Modal for displaying the public key -->
              <div class="modal fade" id="publicKeyModal" tabindex="-1" aria-labelledby="publicKeyModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title" id="publicKeyModalLabel">Public Key</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body" style="word-wrap: break-word; max-height: 300px; overflow-y: auto;">
                      <p id="publicKeyContent"></p>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
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
  <!-- End: Content -->
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
          url: 'UserKeyByUserController',
          type: 'GET',
          dataType: 'json',
          dataSrc: ''
        },
        columns: [
          { data: 'id' },
          { data: 'user_id' },
          {
            data: 'publicKey',
            render: function (data, type, row) {
              return `
              <button
                class="btn btn-primary btn-sm"
                onclick="showPublicKeyInModal('${data}')">
                Hiển thị
              </button>
            `;
            }
          },
          {
            data: 'createAt',
            render: function (data, type, row) {
              if (data) {
                let date = new Date(data);
                return date.toLocaleString();
              }
            }
          },
          {
            data: 'isActive',
            render: function (data, type, row) {
              if (data === 1) {
                return `<span style="color: green; font-weight: bold;">Key đang hoạt động</span>`;
              } else {
                return `<span style="color: red; font-weight: bold;">Key đã vô hiệu hóa</span>`;
              }
            }
          }
        ]
      });
    })
    function showPublicKeyInModal(publicKey) {
      $('#publicKeyContent').text(publicKey);
      $('#publicKeyModal').modal('show');
    }
    // Check for active key
    $.ajax({
      url: 'KeyActiveCheckerController',
      type: 'GET',
      dataType: 'json',
      success: function (response) {
        if (!response) {
          // No active key found, show notification
          $('#notification').html(`
            <div class="alert alert-warning" role="alert" style="display: flex; align-items: center; justify-content: center;">
              <button class="btn btn-primary btn-sm" onclick="notifyAdminToCreateKey()">Thông báo quản trị viên để làm key mới</button>
            </div>
          `);
        }
      },
      error: function () {
        console.error('Error checking active key.');
      }
    });
    // Notify admin function
    function notifyAdminToCreateKey() {
      $.ajax({
        url: 'AlertCreateKeyController',
        type: 'GET',
        dataType: 'json',
        success: function (response) {
          alert('Thông báo đã được gửi tới quản trị viên.');
        },
        error: function () {
          console.error('Error sending notification to admin.');
        }
      });
    }
  </script>

  <%@include file="footer.jsp"%>
</div>
<style>
  .error-message{
    font-size: 1.5rem;
    color: red;
    margin-left: 30%;
  }
  .success-message{
    font-size: 1.5rem;
    color: green;
    margin-left: 30%;
  }
</style>
</body>
</html>

