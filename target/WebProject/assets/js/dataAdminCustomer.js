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
            maSP: $('#productID').val(),
            anh: $('#image').val(),
            tenSP: $('#productName').val(),
            moTa: $('#description').val(),
            soLuong: $('#amount').val(),
            gia: $('#price').val()
        };

        $.ajax({
            type: 'POST',
            url: 'ProductController', // Update this with the actual URL of your server-side endpoint
            data: JSON.stringify(rowData),
            contentType: 'application/json',
            success: function (response) {
                // Handle success response if needed
                $('#dataModal').modal('hide');
                // Reload or update your DataTable as needed
            },
            error: function (error) {
                // Handle error if needed
            }
        });
    });


    // Delete functionality
    $('#deleteBtn').on('click', function () {
        var selectedRows = table.rows('.selected').indexes();

        if (selectedRows.length > 0) {
            table.rows(selectedRows).remove().draw(false);
        }
    });

    function populateFormFields(data) {
        $('#name').val(data[0]); // Assuming 'Name' is in the first column (index 0)
        $('#email').val(data[1]); // Assuming 'Email' is in the second column (index 1)
        $('#phone').val(data[2]); // Assuming 'Phone Number' is in the third column (index 2)
        $('#gender').val(data[3]); // Assuming 'Gender' is in the fourth column (index 3)
        // Convert 'yyyy/mm/dd' to 'yyyy-mm-dd' for input type 'date'
        $('#birthdate').val(data[4].replace(/\//g, '-'));
    }

    function clearFormFields() {
        $('#name').val('');
        $('#email').val('');
        $('#phone').val('');
        $('#gender').val('');
        $('#birthdate').val('');
        currentRow = null;
    }
});