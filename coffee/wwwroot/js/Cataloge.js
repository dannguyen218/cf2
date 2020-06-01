displayItems();
function displayItems() {
    var t = $("#zero-config").DataTable({
        "destroy": true,
        //"dom": '<"float-left"H><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
        "responsive": true,
        "ajax": {
            "url": GetCataloge,
            "dataSrc": ""
        },
        "lengthMenu": [[5, 10, 50, -1], [5, 10, 50, "All"]],
        "stripeClasses": [],
        "oLanguage": {

            //"sSearch": "Tìm kiếm:",
            "sLengthMenu": "Hiển thị _MENU_ danh mục ",
            "sZeroRecords": "Không có danh mục để hiển thị",
            //"oPaginate": {
            //    "sPrevious": "Trang trước",
            //    "sNext": "Trang kế tiếp",
            //    "sLast": "Trang cuối cùng",
            //    "sFirst": "Trang đầu tiên"
            //},
            "oPaginate": {
                "sPrevious": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>`,
                "sNext": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>`
            },
            "sSearch": '<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-search"><circle cx="11" cy="11" r="8"></circle><line x1="21" y1="21" x2="16.65" y2="16.65"></line></svg>',
            "sSearchPlaceholder": "Tìm kiếm...",
            "sInfo": "Đang xem danh mục thứ _START_ tới _END_ trong _TOTAL_ danh mục",
            "sInfoEmpty": "Không có danh mục để hiển thị",
            "sInfoFiltered": " - lọc từ _MAX_ danh mục"

        },
        "columnDefs": [
            {
                "searchable": false,
                "orderable": false,
                "targets": [0, 2]
            }
        ],
        "order": [
            [1, 'asc']
        ],
        columns: [
            { data: null },
            { title: "Tên danh mục", data: 'name' },
            //{
            //    data: 'id',
            //    render: function (data, type, row, meta) {
            //        //return `<a href = 'javascript:; ' onclick='editItem(${data}, this)'><i class='fa fa-edit edit-btn'></i>Sửa</a>`;
            //        return `<a href="javascript:;" id="editBtn${meta.row}" onclick='editItem(this, ${meta.row})'><i class='fa fa-edit edit-btn'></i>Sửa</a>
            //        <button  class="btn update btn-success btn-sm" id="update${meta.row}" onclick="updateEdit(this, ${meta.row}, ${data})" style="display: none;"><i class="fa fa-floppy-o"></i>Update</button>
            //        <button class="btn editCancel btn-danger btn-sm" id="editCancel${meta.row}" onclick="cancelEdit(this, ${meta.row})" style="display: none;"><i class="fa fa-times"></i>Cancel</button>`;
            //    }
            //},
            {
                //data: 'id',
                //render: function (data, type, row, meta) {
                //    return `<a href = 'javascript:; ' onclick='deleteItem(${data})'><i class='fa fa-trash-alt delete-btn'></i>Xóa</a>`;
                //}

                data: 'id',
                render: function (data, type, row, meta) {
                    return `<ul class="table-controls">
                             <li><a href="javascript:void(0);" id="editBtn${meta.row}" onclick='editItem(this, ${meta.row})' data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-2 row-edit"><path d="M17 3a2.828 2.828 0 1 1 4 4L7.5 20.5 2 22l1.5-5.5L17 3z"></path></svg></a>
<a href="javascript:;" class="update" id="update${meta.row}" onclick="updateEdit(this, ${meta.row}, ${data})" style="display: none;">             <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-check-circle edit-ok"><path d="M22 11.08V12a10 10 0 1 1-5.93-9.14"></path><polyline points="22 4 12 14.01 9 11.01"></polyline></svg></a>
<a href="javascript:;" class="editCancel" id="editCancel${meta.row}" onclick="cancelEdit(this, ${meta.row})" style="display: none;"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-x-octagon edit-cancel"><polygon points="7.86 2 16.14 2 22 7.86 22 16.14 16.14 22 7.86 22 2 16.14 2 7.86 7.86 2"></polygon><line x1="15" y1="9" x2="9" y2="15"></line><line x1="9" y1="9" x2="15" y2="15"></line></svg></a>
                            </li>
                             <li><a href="javascript:void(0);" onclick='deleteItem(${data})' data-toggle="tooltip" data-placement="top" title="" data-original-title="Delete"><svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2 row-delete"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path><line x1="10" y1="11" x2="10" y2="17"></line><line x1="14" y1="11" x2="14" y2="17"></line></svg></a></li>
                           </ul>`;
                }
            }
        ],
        "createdRow": function (row, data, index) {
            $('td', row).eq(1).addClass('roleName');
            $('td', row).eq(1).attr('id', 'name' + index);
            $(row).attr('id', data.id);
        },
        "fnDrawCallback": function () {
            $('#zero-config_wrapper .row:eq(3)').append($('#zero-config_length'));
        }
    })

    t.on('order.dt search.dt', function () {
        t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
            t.cell(cell).invalidate('dom');
        });
    }).draw();

    //$("#zero-config_wrapper #zero-config_length").css('margin', '0');
    //$("#zero-config_length").parent().addClass("col-md-6");
    //$("#zero-config_length").css("float", "right");
    //$("#zero-config_filter").parent().removeClass("col-md-6").addClass("col-md-2");
    $("#zero-config_wrapper .row:first-child .col-sm-12:first-child").prepend(`<form id="formCreate" class="card-body" style="padding: 0;" novalidate="novalidate">
    <div class="row">    <div class="col-7"><input type="text" id="item" name="item" class="form-control col-sm-9" placeholder="Tên Danh Mục Mới"></div>
    <div class="col-3" style="margin-left: -15%;"><button class="btn btn-primary mb-2" type="submit" style="
    padding: 10px 25px;margin-top: 3%;"><i class="fa fa-plus create-btn"></i>Tạo</button></div></div></form>`);
    //$('#zero-config_wrapper .row:eq(2)').append(`<div class="dataTables_length" id="zero-config_length"><label>Hiển thị <select name="zero-config_length" aria-controls="zero-config" class="form-control"><option value="5">5</option><option value="10">10</option><option value="50">50</option><option value="-1">All</option></select> danh mục </label></div>`);
    //$("#zero-config_wrapper .row:first-child").append(`<div class="errorTxt"></div>`);


}

$("#formCreate").submit(function (event) {
    event.preventDefault();
    if (!$(this).valid()) return false;
    addItem(item.value);
});

function addItem(item) {
    if (item.trim().length > 0) {
        let newData = {
            "name": item.trim(),
            "created_by": "dan"
        };
        $.ajax({
            url: GetCataloge,
            method: 'POST',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(newData)
        }).done(function (data, textStatus, xhr) {
            if (xhr.status == 200) {
                showErrorbyAlert(data.message);
            } else {
                showSuccessbyAlert('Tạo danh mục mới thành công.');
                $("#formCreate")[0].reset();
                displayItems();
            }
        }).fail(function () {
            showErrorbyAlert("Lỗi Tạo Danh Mục");
        });
    }
    else {
        showErrorbyAlert("Lỗi Tạo Danh Mục Item");
    }
}

var valueEdit;
function editItem(e, row) {
    $(e).hide();
    $("#update" + row).show();
    $("#editCancel" + row).show();
    $("#zero-config thead th:eq(2)").addClass("width5Percent");
    valueEdit = $(e).parent().parent().parent().parent().find("td:eq(1)").text();
    $(e).parent().parent().parent().parent().find("td:eq(1)").html(`<form id="editForm"><input type="text" id="valueEdit" name="valueEdit" value="${valueEdit}" style="width: 100%;"></form>`)
}

function cancelEdit(e, row) {
    $(e).parent().parent().parent().parent().find("td:eq(1)").html(valueEdit);
    $(e).hide();
    $("#update" + row).hide();
    $("#editBtn" + row).show();
}

function updateEdit(e, row, id) {
    editValidate();
    if ($('#editForm').valid()) {

        var newData = {
            "id": id,
            "name": $("#valueEdit").val().trim(),
            "updated_by": "dan"
        }
        $.ajax({
            url: GetCataloge + "/" + id,
            method: 'PUT',
            dataType: 'json',
            contentType: 'application/json',
            data: JSON.stringify(newData)
        }).done(function (data, textStatus, xhr) {
            if (xhr.status == 200) {
                showErrorbyAlert(data.message);
                $(e).show();
                $("#editCancel" + row).show();
                $("#editBtn" + row).hide();
            } else {
                showEditSuccessbyAlert('Sửa thông tin thành công.');
                $(e).hide();
                $("#editCancel" + row).hide();
                $("#editBtn" + row).show();
                displayItems();
            }
        }).fail(function () {
            showErrorbyAlert("Lỗi Tạo Danh Mục");
        });
    }
}

function deleteItem(id) {
    showWarningbyAlert('Bạn chắc chắn muốn xóa danh mục này?').then((result) => {
        if (result.value) {
            $.ajax({
                url: GetCataloge + "/" + parseInt(id) + "/dan",
                method: 'DELETE',
                dataType: 'json',
                contentType: 'application/json'
            }).done(function () {
                displayItems();
            })
        }
    })
}

jQuery.validator.addMethod("specCharacter", function (value, element) {
    return this.optional(element) || !/['`~!@#$%^&*()_|+=?;:'",.<>\{\}\[\]\\\/]/.test(value);
}, "Vui lòng không nhập ký tự đặc biệt");

$("#formCreate").validate({
    rules: {
        item: {
            required: true,
            normalizer: function (value) {
                return $.trim(value);
            },
            minlength: 3,
            specCharacter: true
        }
    },
    messages: {
        item: {
            required: "Vui lòng nhập tên danh mục",
            minlength: "Phải nhập 3 ký tự trở lên"
        }
    },
    errorElement: 'div',
    errorLabelContainer: '.errorTxt'
});

function editValidate() {
    $("#editForm").validate({
        rules: {
            valueEdit: {
                required: true,
                normalizer: function (value) {
                    return $.trim(value);
                },
                minlength: 3,
                specCharacter: true
            }
        },
        messages: {
            valueEdit: {
                required: "Vui lòng nhập tên danh mục",
                minlength: "Phải nhập 3 ký tự trở lên"
            }
        }
    });
}