<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="dao.ChiTietDonHangDAO" %>
<%@ page import="model.DonHang" %>
<%@ page import="java.util.List" %>
<%@ page import="model.ChiTiet_DonHang" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>customer</title>
    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet"/>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" rel="stylesheet"/>
    <!-- MDB -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/6.4.2/mdb.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css">

    <!-- Custom fonts for this template -->
    <link href="./assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="./assets/css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="./assets/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/select/1.3.4/css/select.dataTables.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">

    <link rel="stylesheet" href="./assets/css/base.css">
    <link rel="stylesheet" href="./assets/css/grid.css">
    <link rel="stylesheet" href="./assets/css/table-user.css">
    <link rel="stylesheet" href="./assets/css/responsive.css">
    <link rel="stylesheet" href="./assets/fonts/fontawesome-free-6.4.2-web/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
</head>
<body>
<div class="app">

    <!-- Begin: Header -->
    <%@include file="headerAdmin.jsp" %>

    <!-- Begin: Content -->
    <div class="app__content">
        <div class="container info">
            <div class="left-col">
                <div class="user-info"><a class="user-img" href="admin.jsp">
                    <div class="avatar">
                        <img class="avatar__img"
                             src="https://down-vn.img.susercontent.com/file/d5ad3acf45214b97e525f2c2785f3a36_tn"></div>
                </a>
                    <div class="user-setting">
                        <div class="username">Admin</div>
                        <div><a class="change-username" href="admin.jsp">
                            <svg width="12" height="12" viewBox="0 0 12 12" xmlns="http://www.w3.org/2000/svg"
                                 style="margin-right: 4px;">
                                <path d="M8.54 0L6.987 1.56l3.46 3.48L12 3.48M0 8.52l.073 3.428L3.46 12l6.21-6.18-3.46-3.48"
                                      fill="#9B9B9B" fill-rule="evenodd"></path>
                            </svg>
                            Sửa hồ sơ</a>
                        </div>
                    </div>
                </div>
                <div class="sidebar">
                    <div class="stardust-dropdown stardust-dropdown--open">
                        <div class="stardust-dropdown__item-header"><div class="header-itemlink">
                            <div class="thumbnail">
                                <img src="https://down-vn.img.susercontent.com/file/ba61750a46794d8847c3f463c5e71cc4">
                            </div>
                            <div class="sbheader-container"><span class="item-header">Danh sách quản lý</span></div>
                        </div>
                        </div>
                        <div class="stardust-dropdown__item-body stardust-dropdown__item-body--open"
                             style="opacity: 1;">
                            <div class="sidebar-content">
                                <a class="sb-item" href="customer.jsp">
                                    <span class="sbi-content">Quản lý khách hàng</span>
                                </a>
                                <a class="sb-item" href="products.jsp">
                                    <span class="sbi-content">Quản lý sản phẩm</span>
                                </a>
                                <a class="sb-item" href="orders.jsp">
                                    <span class="sbi-content">Quản lý đơn hàng</span>
                                </a>
                                <a class="sb-item" href="detailOrders.jsp">
                                    <span class="sbi-content">Quản lý chi tiết đơn hàng</span>
                                </a>
                                <a class="dropdown-item" href="key.jsp">
                                    <span class="sbi-content">Quản lý Khóa</span>
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
                            <div class="rc-form">
                                <div class="rc-content">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table id="example" class="display select" style="width:100%">
                                                <thead>
                                                <tr>
                                                    <th>Mã Đơn Hàng</th>
                                                    <th>Mã Sản Phẩm</th>
                                                    <th>Số lượng đặt hàng</th>
                                                    <th>Tổng tiền</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <% ChiTietDonHangDAO dao = new ChiTietDonHangDAO();
                                                    List<ChiTiet_DonHang> ctdhList = dao.getAll();
                                                    for (ChiTiet_DonHang ctdh : ctdhList) {%>
                                                <tr>
                                                    <td><%= ctdh.getMaDH() %>
                                                    </td>
                                                    <td><%= ctdh.getSanPham().getMaSP() %>
                                                    </td>
                                                    <td><%= ctdh.getSoLuongDatHang() %>
                                                    </td>
                                                    <td><%= ctdh.getTongTien() %>
                                                    </td>
                                                </tr>
                                                <% }%>
                                                </tbody>
                                            </table>
                                            <div class="button-container">
                                                <button id="addBtn" class="btn btn-primary">Thêm
                                                </button>
                                                <button id="editBtn" class="btn btn-warning">Chỉnh Sửa
                                                </button>
                                                <button id="deleteBtn" class="btn btn-danger">Xóa
                                                </button>
                                            </div>

                                            <!-- Bootstrap Modal for Add -->
                                            <div class="modal" tabindex="-1" role="dialog" id="addModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="CTDHAddController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Thêm</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <!-- Form fields for Add -->
                                                            <div class="form-group">
                                                                <label for="orderID">Mã Đơn Hàng:</label>
                                                                <input type="text" class="form-control" id="orderID"
                                                                       name="maDH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="product">Mã Sản phẩm:</label>
                                                                <input type="text" class="form-control" id="product"
                                                                       name="maSP">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="quantity">Số lượng đặt hàng:</label>
                                                                <input type="number" class="form-control" id="quantity"
                                                                       name="soLuongDatHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="totalPrice">Tổng tiền:</label>
                                                                <input type="text" class="form-control" id="totalPrice"
                                                                       name="tongTien">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary" id="saveBtn"
                                                                   name="saveBtn" value="Xác nhận">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <!-- Bootstrap Modal for Edit -->
                                            <div class="modal" tabindex="-1" role="dialog" id="editModal">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="CTDHEditController"
                                                          method="POST">
                                                        <!-- Form fields for Edit -->
                                                        <div class="modal-header">
                                                            <h5 class="modal-title">Chỉnh Sửa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            <div class="form-group">
                                                                <label for="editOrderID">Mã Đơn Hàng:</label>
                                                                <input type="text" class="form-control" id="editOrderID"
                                                                       name="maDH">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="editProduct">Mã Sản Phẩm:</label>
                                                                <input type="text" class="form-control" id="editProduct"
                                                                       name="maSP">
                                                            </div>

                                                            <div class="form-group">
                                                                <label for="editQuantity">Số lượng đặt hàng:</label>
                                                                <input type="number" class="form-control"
                                                                       id="editQuantity"
                                                                       name="soLuongDatHang">
                                                            </div>
                                                            <div class="form-group">
                                                                <label for="editTotalPrice">Tổng tiền:</label>
                                                                <input type="text" class="form-control"
                                                                       id="editTotalPrice"
                                                                       name="tongTien">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <input type="submit" class="btn btn-primary"
                                                                   id="saveEditBtn" name="saveBtn" value="Xác nhận">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Đóng
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>

                                            <!-- Bootstrap Modal for Delete -->
                                            <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog"
                                                 aria-labelledby="deleteModalLabel" aria-hidden="true">
                                                <div class="modal-dialog" role="document">
                                                    <form class="modal-content" action="CTDHDeleteController"
                                                          method="POST">
                                                        <div class="modal-header">
                                                            <h5 class="modal-title" id="deleteModalLabel">Xác nhận
                                                                xóa</h5>
                                                            <button type="button" class="close" data-dismiss="modal"
                                                                    aria-label="Close">
                                                                <span aria-hidden="true">&times;</span>
                                                            </button>
                                                        </div>
                                                        <div class="modal-body">
                                                            Bạn có muốn xóa hàng này?
                                                            <div class="form-group" id="hiddenMaDHDiv"
                                                                 style="display: none;">
                                                                <label for="maDHDL">Mã Đơn Hàng:</label>
                                                                <input type="text" class="form-control" id="maDHDL"
                                                                       name="maDH">
                                                            </div>
                                                            <div class="form-group" id="hiddenMaSPDiv"
                                                                 style="display: none;">
                                                                <label for="maSPDL">Mã Sản Phẩm:</label>
                                                                <input type="text" class="form-control" id="maSPDL"
                                                                       name="maSP">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary"
                                                                    data-dismiss="modal">Cancel
                                                            </button>
                                                            <input type="submit" class="btn btn-danger"
                                                                   id="confirmDeleteBtn" value="Xác nhận">
                                                        </div>
                                                    </form>
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
    </div>
</div>
<!--End: Content-->

<!--Begin: Footer-->
<%@include file="footer.jsp" %>
<!--End: Footer-->
<!-- Bootstrap core JavaScript-->
<script src="./assets/vendor/jquery/jquery.min.js"></script>
<script src="./assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="./assets/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="./assets/js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="./assets/vendor/datatables/jquery.dataTables.min.js"></script>
<script src="./assets/vendor/datatables/dataTables.bootstrap4.min.js"></script>

<!-- Page level custom scripts -->
<script src="./assets/js/demo/datatables-demo.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/select/1.3.4/js/dataTables.select.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script>
    $(document).ready(function () {
        // Initialize DataTable
        var table = $('#example').DataTable({
            select: true
        });
        var currentRow;

        // Add functionality using Bootstrap Modal
        $('#addBtn').on('click', function () {
            clearFormFields();
            $('#addModal').modal('show');
        });

        // Save changes in the modal
        $('#saveBtn').on('click', function () {
            var rowData = {
                orderID: $('#orderID').val(),
                product: $('#product').val(),
                soLuongDatHang: $('#quantity').val(),
                totalPrice: $('#totalPrice').val()
            };

            if (currentRow) {
                // Edit existing row
                currentRow.data(Object.values(rowData)).draw();
            } else {
                // Add new row
                table.row.add(Object.values(rowData)).draw();
            }

            $('#addModal').modal('hide');
        });

        // Edit functionality using Bootstrap Modal
        $('#editBtn').on('click', function () {
            var selectedRows = table.rows({ selected: true }).indexes();

            if (selectedRows.length === 1) {
                var selectedRowData = table.row(selectedRows[0]).data();
                if (selectedRowData) {
                    currentRow = table.row(selectedRows[0]);
                    populateFormFields(selectedRowData);
                    $('#editModal').modal('show');
                }
            } else {
                alert("Vui lòng chọn duy nhất 1 hàng để sửa.");
            }
        });

        // Save changes in the editModal
        $('#saveEditBtn').on('click', function () {
            var rowData = {
                orderID: $('#editOrderID').val(),
                product: $('#editProduct').val(),
                soLuongDatHang: $('#editQuantity').val(),
                totalPrice: $('#editTotalPrice').val()
            };

            if (currentRow) {
                // Edit existing row
                currentRow.data(Object.values(rowData)).draw();
            }

            $('#editModal').modal('hide');
        });

        // Delete functionality
        $('#deleteBtn').on('click', function () {
            var selectedRows = table.rows('.selected').indexes();
            populateDeleteFields(selectedRows);
            if (selectedRows.length > 0) {
                $('#deleteModal').modal('show');
            } else {
                alert('Vui lòng chọn 1 hàng để xóa.');
            }
        });

        function populateDeleteFields(selectedRows) {
            var maDHInput = $('#maDHInput');
            var hiddenMaDHDiv = $('#hiddenMaDHDiv');
            var maSPInput = $('#maSPInput');
            var hiddenMaSPDiv = $('#hiddenMaSPDiv')

            if (selectedRows.length > 0) {
                var maDH = table.row(selectedRows[0]).data()[0];
                var maSP = table.row(selectedRows[0]).data()[1];

                maDHInput.val(maDH);
                maSPInput.val(maSP);

                hiddenMaDHDiv.find('#maDHDL').val(maDH);
                hiddenMaSPDiv.find('#maSPDL').val(maSP);
            }
        }

        function populateFormFields(data) {
            $('#editOrderID').val(data[0]);
            $('#editProduct').val(data[1]);
            $('#editQuantity').val(data[2]);
            $('#editTotalPrice').val(data[3]);
        }

        function clearFormFields() {
            $('#orderID').val('');
            $('#product').val('');
            $('#quantity').val('');
            $('#totalPrice').val('');
            currentRow = null;
        }
    });
</script>
</body>
</html>