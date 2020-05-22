displayItems();
function displayItems() {
    var t = $("#example1").DataTable({
        "destroy": true,
        //"dom": '<"float-left"H><"float-right"f>rt<"row"<"col-sm-4"l><"col-sm-4"i><"col-sm-4"p>>',
        "responsive": true,
        "ajax": {
            "url": GetCataloge,
            "dataSrc": ""
        },
        "lengthMenu": [[5, 10, 50, -1], [5, 10, 50, "All"]],
        "oLanguage": {

            "sSearch": "Tìm kiếm:",
            "sLengthMenu": "Hiển thị _MENU_ danh mục ",
            "sZeroRecords": "Không có danh mục để hiển thị",
            "oPaginate": {
                "sPrevious": "Trang trước",
                "sNext": "Trang kế tiếp",
                "sLast": "Trang cuối cùng",
                "sFirst": "Trang đầu tiên"
            },
            "sInfo": "Đang xem danh mục thứ _START_ tới _END_ trong _TOTAL_ danh mục",
            "sInfoEmpty": "Không có danh mục để hiển thị",
            "sInfoFiltered": " - lọc từ _MAX_ danh mục"

        },
        "columnDefs": [
            {
                "searchable": false,
                "orderable": false,
                "targets": [0, 2, 3]
            }
        ],
        "order": [
            [1, 'asc']
        ],
        columns: [
            { data: null },
            { title: "Tên danh mục", data: 'name' },
            {
                data: 'id',
                render: function (data, type, row, meta) {
                    //return `<a href = 'javascript:; ' onclick='editItem(${data}, this)'><i class='fa fa-edit edit-btn'></i>Sửa</a>`;
                    return `<a href="javascript:;" id="editBtn${meta.row}" onclick='editItem(this, ${meta.row})'><i class='fa fa-edit edit-btn'></i>Sửa</a>
                    <button  class="btn update btn-success btn-sm" id="update${meta.row}" onclick="updateEdit(this, ${meta.row}, ${data})" style="display: none;"><i class="fa fa-floppy-o"></i>Update</button>
                    <button class="btn editCancel btn-danger btn-sm" id="editCancel${meta.row}" onclick="cancelEdit(this, ${meta.row})" style="display: none;"><i class="fa fa-times"></i>Cancel</button>`;
                }
            },
            {
                data: 'id',
                render: function (data, type, row, meta) {
                    return `<a href = 'javascript:; ' onclick='deleteItem(${data})'><i class='fa fa-trash-alt delete-btn'></i>Xóa</a>`;
                }
            }
        ],
        "createdRow": function (row, data, index) {
            $('td', row).eq(1).addClass('roleName');
            $('td', row).eq(1).attr('id', 'name' + index);
            $(row).attr('id', data.id);
        }
    })

    t.on('order.dt search.dt', function () {
        t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
            t.cell(cell).invalidate('dom');
        });
    }).draw();

    $("#example1_wrapper #example1_length").css('margin', '0');
    $("#example1_length").parent().addClass("col-md-6");
    $("#example1_length").css("float", "right");
    $("#example1_filter").parent().removeClass("col-md-6").addClass("col-md-2");
    $("#example1_wrapper .row:first-child").prepend(`<div class="col-sm-12 col-md-4">
        <form id="formCreate" class="card-body d-flex justify-content-between" style="padding: 0;">
            <input type="text" id="item" name="item" class="form-control col-sm-9" placeholder="Tên Danh Mục Mới">
                <button class="btn btn-primary col-sm-2 border-0 mb-2 float-right" type="submit"><i class="fa fa-plus create-btn"></i>Tạo</button>
                                </form>
                            </div>`);
    $("#example1_wrapper .row:first-child").append(`<div class="errorTxt"></div>`);


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
    $("#example1 thead th:eq(2)").addClass("width10Percent");
    valueEdit = $(e).parent().parent().find("td:eq(1)").text();
    $(e).parent().parent().find("td:eq(1)").html(`<form id="editForm"><input type="text" id="valueEdit" name="valueEdit" value="${valueEdit}" style="width: 100%;"></form>`)
}

function cancelEdit(e, row) {
    $(e).parent().parent().find("td:eq(1)").html(valueEdit);
    $(e).hide();
    $("#update" + row).hide();
    $("#editBtn" + row).show();
}

function updateEdit(e, row, id) {
    editValidate();
    if ($('#editForm').valid()) {
        $(e).hide();
        $("#editCancel" + row).hide();
        $("#editBtn" + row).show();
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
            } else {
                showEditSuccessbyAlert('Sửa thông tin thành công.');
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