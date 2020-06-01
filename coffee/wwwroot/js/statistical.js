function format(rowData, tableId) {
    // rowData - data for the table.
    // tableId - unique table ID for child table.
    // This function just builds the table tag.
    return '<table id="' + tableId + '" cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;" class="table table-hover text-nowrap">' +
        '</table>';
}
var table;
var excelUrl = "/excel";
$(document).ready(function () {
    $("#excelBtn").on("click", function (e) {
        e.preventDefault(); // cancel the link itself
        location.replace(excelUrl);
    });
    // Main table
    table = $('#zero-config').DataTable({
        responsive: true,
        ajax: {
            url: GetAllBills,
            dataSrc: ""
        },
        lengthMenu: [[5, 10, 50, -1], [5, 10, 50, "All"]],
        "stripeClasses": [],
        oLanguage: {

            //sSearch: "Tìm kiếm:",
            sLengthMenu: "Hiển thị _MENU_ hóa đơn ",
            sZeroRecords: "Không có hóa đơn để hiển thị",
            //oPaginate: {
            //    sPrevious: "Trang trước",
            //    sNext: "Trang kế tiếp",
            //    sLast: "Trang cuối cùng",
            //    sFirst: "Trang đầu tiên"
            //},
            "oPaginate": {
                "sPrevious": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>`,
                "sNext": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>`
            },
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "Tìm kiếm...",
            sInfo: "Đang xem hóa đơn thứ _START_ tới _END_ trong _TOTAL_ hóa đơn",
            sInfoEmpty: "Không có hóa đơn để hiển thị",
            sInfoFiltered: " - lọc từ _MAX_ hóa đơn"

        },
        order: [
            [1, 'asc']
        ],
        columns: [
            {
                className: 'details-control main-table',
                orderable: false,
                data: null,
                defaultContent: ''
            },
            { data: "id" },
            { data: "created_by" },
            { data: "note" },
            {
                data: "time_payment",
                render: function (data, type, row) {
                    return moment(data).format("DD-MM-YYYY HH:mm:ss");
                }
            },
            {
                data: "total_money",
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            }
        ],
        //initComplete: function () {
        //    var sum = 0;
        //    $("#zero-config tbody tr").find("td:eq(5)").each(function () {
        //        sum += parseInt($(this).text().replace(/\.|VND| /gi, ""));
        //    });
        //    $("#revenue").html(addCommas(sum) + " VND");
        //},
        drawCallback: function (settings) {
            var sum = 0;
            $("#zero-config tbody tr").find("td:eq(5)").each(function () {
                sum += parseInt($(this).text().replace(/\.|VND| /gi, ""));
            });
            $("#revenue").html(addCommas(sum) + " VND");
        }
    });

    childTable();
});

function childTable() {
    // Add event listener for for main talbe to open and close first level child details
    $('#zero-config tbody').on('click', 'td.main-table', function () {
        var tr = $(this).closest('tr');
        var row = table.row(tr);
        var rowData = row.data();


        if (row.child.isShown()) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');

            // Destroy the Child Datatable
            //$('#' + rowData.name.replace(' ', '-')).DataTable().destroy();
        }
        else {
            var id = "tb_" + rowData.id;

            // Open this row
            row.child(format(rowData, id)).show();

            var t = $('#' + id).DataTable({
                dom: "t",
                responsive: true,
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
}

$("#dateRangepicker").val(moment().format('DD/MM/YYYY'));
$("#dateRangepicker").daterangepicker({
    ranges: {
        'Hôm nay': [moment(), moment()],
        'Ngày hôm qua': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
        'Tuần này': [moment().startOf('isoWeek').add(1, 'days'), moment()],
        'Tuần trước': [moment().subtract(1, 'weeks').startOf('isoWeek').add(1, 'days'), moment().subtract(1, 'weeks').endOf('isoWeek')],
        'Tháng này': [moment().startOf('month').add(1, 'days'), moment().endOf('month')],
        'Tháng trước': [moment().subtract(1, 'month').startOf('month').add(1, 'days'), moment().subtract(1, 'month').endOf('month')],
        'Năm này': [moment().startOf('year').add(1, 'days'), moment()],
        'Năm trước': [moment().subtract(1, 'year').startOf('year').add(1, 'days'), moment().subtract(1, 'year').endOf('year')]
    },
    callback: function (startDate, endDate, period) {
        if (startDate.format('YYYY-MM-DD') == endDate.format('YYYY-MM-DD')) {
            $(this).val(startDate.format('DD/MM/YYYY'));
            GetAllBillsByDate(startDate.format('YYYY-MM-DD'), startDate.format('YYYY-MM-DD'))
        }
        else {
            $(this).val(startDate.format('DD/MM/YYYY') + ' – ' + endDate.format('DD/MM/YYYY'));
            GetAllBillsByDate(startDate.format('YYYY-MM-DD'), endDate.format('YYYY-MM-DD'))
        }
    }
});

function GetAllBillsByDate(StartDate, EndDate) {
    table = $('#zero-config').DataTable({
        destroy: true,
        responsive: true,
        ajax: {
            url: GetAllBills + "/date/" + StartDate + "/" + EndDate,
            dataSrc: ""
        },
        lengthMenu: [[5, 10, 50, -1], [5, 10, 50, "All"]],
        oLanguage: {
            sLengthMenu: "Hiển thị _MENU_ hóa đơn ",
            sZeroRecords: "Không có hóa đơn để hiển thị",
            "oPaginate": {
                "sPrevious": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>`,
                "sNext": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>`
            },
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "Tìm kiếm...",
            sInfo: "Đang xem hóa đơn thứ _START_ tới _END_ trong _TOTAL_ hóa đơn",
            sInfoEmpty: "Không có hóa đơn để hiển thị",
            sInfoFiltered: " - lọc từ _MAX_ hóa đơn"

        },
        order: [
            [1, 'asc']
        ],
        columns: [
            {
                className: 'details-control main-table',
                orderable: false,
                data: null,
                defaultContent: ''
            },
            { data: "id" },
            { data: "created_by" },
            { data: "note" },
            {
                data: "time_payment",
                render: function (data, type, row) {
                    return moment(data).format("DD-MM-YYYY HH:mm:ss");
                }
            },
            {
                data: "total_money",
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            }
        ],
        drawCallback: function (settings) {
            var sum = 0;
            $("#zero-config tbody tr").find("td:eq(5)").each(function () {
                sum += parseInt($(this).text().replace(/\.|VND| /gi, ""));
            });
            $("#revenue").html(addCommas(sum) + " VND");
            excelUrl = `/excel/${StartDate}/${EndDate}`;
        }
    });
}




