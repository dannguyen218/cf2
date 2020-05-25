var childEditors = {};  // Globally track created chid editors
$(document).ready(function () {

    function format(rowData, tableId) {
        // rowData - data for the table.
        // tableId - unique table ID for child table.
        // This function just builds the table tag.
        return '<table id="' + tableId + '" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" class="table table-hover text-nowrap">' +
            '</table>';
    }



    // Main table
    var table = $('#example').DataTable({
        ajax: {
            url: GetAllBills,
            dataSrc: ""
        },
        lengthMenu: [[5, 10, 50, -1], [5, 10, 50, "All"]],
        columns: [
            {
                className: 'details-control main-table',
                orderable: false,
                data: null,
                defaultContent: ''
            },
            { data: "id" },
            { data: "time_payment" },
            { data: "created_by" },
            { data: "note" },
            {
                data: "total_money",
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            }
        ],
        order: [[1, 'asc']],
    });


    // Add event listener for for main talbe to open and close first level child details
    $('#example tbody').on('click', 'td.main-table', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        var rowData = row.data();


        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');

            // Destroy the Child Datatable
            $('#' + rowData.name.replace(' ', '-')).DataTable().destroy();
        }
        else {
            var id = "tb_" + rowData.id;

            // Open this row
            row.child(format(rowData, id)).show();

            var t = $('#' + id).DataTable({
                dom: "t",
                ajax: {
                    url: GetAllBills + "/bill/" + rowData.id,
                    dataSrc: ""
                },
                columnDefs: [
                    {
                        searchable: false,
                        orderable: false,
                        targets: [0]
                    }
                ],
                order: [
                    [1, 'asc']
                ],
                columns: [
                    { data: null },
                    { title: "Tên sản phẩm", data: "productName" },
                    { title: "Đơn vị tính", data: "unit" },
                    {
                        title: "Giá", data: "price",
                        render: function (data, type, row, meta) {
                            return addCommas(data) + " VND";
                        }
                    },
                    { title: "Số lượng", data: "quantity" },
                    {
                        title: "Tổng cộng", data: "total",
                        render: function (data, type, row, meta) {
                            return addCommas(data) + " VND";
                        }
                    }
                ]
            });
            t.on('order.dt', function () {
                t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
                    cell.innerHTML = i + 1;
                    t.cell(cell).invalidate('dom');
                });
            }).draw();

            tr.addClass('shown');
        }
    });
});






let startDate,
    endDate;

$('.datePicker, .dateRangeLeft, .dateRangeRight').daterangepicker({
    "singleDatePicker": true,
    "showDropdowns": true,
    "locale": {
        "format": 'DD-MM-YYYY'
    }
});




