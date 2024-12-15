$(document).ready(function () {
    var table = $('#example').DataTable({
        select: true
    });

    var currentRow;

    // Add functionality using Bootstrap Modal
    $('#addBtn').on('click', function () {
        clearFormFields();
        $('#dataModal').modal('show');
    });

    // Edit functionality using Bootstrap Modal
    $('#editBtn').on('click', function () {
        var selectedRows = table.rows({ selected: true }).indexes();

        if (selectedRows.length === 1) {
            var selectedRowData = table.row(selectedRows[0]).data();
            if (selectedRowData) {
                currentRow = table.row(selectedRows[0]);
                populateFormFields(selectedRowData);
                $('#dataModal').modal('show');
            }
        } else {
            // Display a message or take appropriate action if more than one row is selected
            alert("Please select a single row to edit.");
        }
    });

    // Save changes in the modal
    $('#saveBtn').on('click', function () {
        var rowData = {
            customerName: $('#customerName').val(),
            productName: $('#productName').val(),
            address: $('#address').val(),
            amount: $('#amount').val(),
            totalPrice: $('#totalPrice').val()
        };

        if (currentRow) {
            // Edit existing row
            currentRow.data(Object.values(rowData)).draw();
        } else {
            // Add new row
            table.row.add(Object.values(rowData)).draw();
        }

        $('#dataModal').modal('hide');
    });

    // Delete functionality
    $('#deleteBtn').on('click', function () {
        var selectedRows = table.rows('.selected').indexes();

        if (selectedRows.length > 0) {
            table.rows(selectedRows).remove().draw(false);
        }
    });

    function populateFormFields(data) {
        $('#customerName').val(data[0]); // Assuming 'Customer Name' is in the first column (index 0)
        $('#productName').val(data[1]); // Assuming 'Product Name' is in the second column (index 1)
        $('#address').val(data[2]); // Assuming 'Address' is in the third column (index 2)
        $('#amount').val(data[3]); // Assuming 'Amount' is in the fourth column (index 3)
        $('#totalPrice').val(data[4]); // Assuming 'Total Price' is in the fifth column (index 4)
    }

    function clearFormFields() {
        $('#customerName').val('');
        $('#productName').val('');
        $('#address').val('');
        $('#amount').val('');
        $('#totalPrice').val('');
        currentRow = null;
    }
});
