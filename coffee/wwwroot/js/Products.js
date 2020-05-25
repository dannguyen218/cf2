getList();

function getCataloges() {
    return $.ajax({
        url: GetCataloge,
        method: "GET",
        dataType: "json",
        async: false,
        contentType: "application/json"
    })
}

function openAddProduct() {
    $('#addProduct').modal('show');
    getCataloges().done(function (data) {
        let str = '';
        $.each(data, function (index, value) {
            str += `<option value="${value.id}">${value.name}</option>`
        });
        $("#CatalogeId").html(str);
    });
    $("#frmAddProduct")[0].reset();
    $("#frmAddProduct").validate().resetForm();
    $("#avatar").val("");
    $("#CatalogeId").prop('selectedIndex', 0);
    $('#blah').css('opacity', 0);
    $("#blah").attr("src", "");
    $('#noimg').css('display', 'flex');
};

$("#frmAddProduct").submit(function (event) {
    event.preventDefault();
    if (!$(this).valid()) return false;
    productSave();
});

$("#avatar").change(function () {
    readURL(this, "#blah");
    $('#blah').css('opacity', 1);
    $('#noimg').css('display', 'none');
});

function productSave() {
    var name = $("#name").val().trim();

    var price = $("#price").val().trim();
    if (price == "") {
        price = 0;
    };

    var unit = $("#unit").val().trim();
    var catalogeId = parseInt($("#CatalogeId").val());

    var formData = new FormData();
    // append data
    formData.append('name', name);
    formData.append('price', price);
    formData.append('unit', unit);
    formData.append('catalogeId', catalogeId);

    var files = $("#avatar").get(0).files;
    // Add the uploaded image content to the form data collection
    if (files.length > 0) {
        newFile = new File([files[0]], toSlug(files[0].name.split(".")[0]) + "." + files[0].name.split(".")[1], { type: 'image/*' });
        formData.append('imageFile', newFile);
    }
    createProduct(formData);
}

function createProduct(formData) {
    $.ajax({
        url: GetProduct,
        method: "POST",
        contentType: false,
        processData: false,
        data: formData
    }).done(function (data, textStatus, xhr) {
        console.log(data);
        if (xhr.status == 200) {
            $('#addProduct').modal('hide');
            showErrorbyAlert(JSON.parse(data).message);
        } else {
            $('#addProduct').modal('hide');
            showSuccessbyAlert('Tạo sản phẩm mới thành công.');
            getList();
        }
    }).fail(function () {
        $('#addProduct').modal('hide');
        showErrorbyAlert("Lỗi Tạo Sản Phẩm");
    });
}

function getList() {
    var t = $("#example1").DataTable({
        "destroy": true,
        "responsive": true,
        "ajax": {
            "url": GetProduct,
            "dataSrc": ""
        },
        "lengthMenu": [[5, 10, 50, -1], [5, 10, 50, "All"]],
        "oLanguage": {

            "sSearch": "Tìm kiếm:",
            "sLengthMenu": "Hiển thị _MENU_ sản phẩm ",
            "sZeroRecords": "Không có sản phẩm để hiển thị",
            "oPaginate": {
                "sPrevious": "Trang trước",
                "sNext": "Trang kế tiếp",
                "sLast": "Trang cuối cùng",
                "sFirst": "Trang đầu tiên"
            },
            "sInfo": "Đang xem sản phẩm thứ _START_ tới _END_ trong _TOTAL_ sản phẩm",
            "sInfoEmpty": "Không có sản phẩm để hiển thị",
            "sInfoFiltered": " - lọc từ _MAX_ sản phẩm"

        },
        "columnDefs": [
            {
                "searchable": false,
                "orderable": false,
                "targets": [0, 5, 6, 7]
            }
        ],
        "order": [
            [1, 'asc']
        ],
        columns: [
            { data: null },
            { title: "Tên sản phẩm", data: 'name' },
            { title: "Danh mục sản phẩm", data: 'CatalogesName' },
            {
                title: "Giá bán", data: 'price',
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            },
            { title: "Đơn vị tính", data: 'unit' },
            {
                title: "Ảnh sản phẩm",
                data: { id: "id", images: "images" },
                render: function (data, type, row, meta) {
                    if (data.images == "default.PNG")
                        return `<img style='max-height:120px; max-width:120px;' src='/images/${data.images}'/>`;
                    else
                        return `<img style='max-height:120px; max-width:120px;' src='/uploads/products/${data.id}/${data.images}' onerror='loadImageError(this)' />`;
                }
            },
            {
                data: 'id',
                render: function (data, type, row, meta) {
                    return `<a href = 'javascript:; ' onclick='openEditProduct(${data}, this)'><i class='fa fa-edit edit-btn'></i>Sửa</a>`;
                }
            },
            {
                data: 'id',
                render: function (data, type, row, meta) {
                    return `<a href = 'javascript:; ' onclick='deleteItem(${data})'><i class='fa fa-trash-alt delete-btn'></i>Xóa</a>`;
                }
            }]
    })

    t.on('order.dt search.dt', function () {
        t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
            t.cell(cell).invalidate('dom');
        });
    }).draw();

}

var idEdit;
var rowIndex;
var arr;
$('#eavatar').change(function () {
    readURL(this, "#eblah");
    $('#enoimg').css('display', 'none');
    $('#eblah').css('opacity', 1);
})

$("#frmEditProduct").submit(function (event) {
    event.preventDefault();
    if (!$(this).valid()) return false;
    productEdit();
});


function openEditProduct(id, e) {
    $('#showEdit').modal('show');
    getCataloges().done(function (data) {
        let str = '';
        $.each(data, function (index, value) {
            str += `<option value="${value.id}">${value.name}</option>`
        });
        $("#eCatalogeId").html(str);
    });
    $("#frmEditProduct").validate().resetForm();
    idEdit = id;
    rowIndex = $(e).closest("tr").index();
    getEditInfo(rowIndex);
};

function getEditInfo(rowIndex) {
    arr = [];
    $("#tbList tr:eq(" + rowIndex + ") td").each(function () {
        arr.push($(this).text());
    });
    $("#ename").val(arr[1]);
    $("#eCatalogeId option:contains(" + arr[2] + ")").attr('selected', 'selected');
    $("#eprice").val(arr[3].replace(/\.|vnđ| /gi, ""));
    $("#eunit").val(arr[4]);
    $("#eblah").attr('src', $("#tbList tr:eq(" + rowIndex + ") td:eq(5) img").attr("src"));
    $('#eblah').css('opacity', 1);
    $('#enoimg').css('display', 'none');
}

function productEdit() {
    var name = $("#ename").val().trim();

    var price = $("#eprice").val().trim();
    if (price == "") {
        price = 0;
    };

    var unit = $("#eunit").val().trim();
    var catalogeId = parseInt($("#eCatalogeId").val());

    var formData = new FormData();
    // append data
    formData.append('id', idEdit);
    formData.append('name', name);
    formData.append('price', price);
    formData.append('unit', unit);
    formData.append('catalogeId', catalogeId);

    var files = $("#eavatar").get(0).files;
    // Add the uploaded image content to the form data collection
    if (files.length > 0) {
        newFile = new File([files[0]], toSlug(files[0].name.split(".")[0]) + "." + files[0].name.split(".")[1], { type: 'image/*' });
        formData.append('imageFile', newFile);
    } else {
        var images = $('#eblah').attr('src').replace(/^.*[\\\/]/, '')
        formData.append('imageOld', images);
    }
    editBtn(formData);
}

function editBtn(formData) {
    $.ajax({
        url: GetProduct + "/" + idEdit,
        method: "PUT",
        contentType: false,
        processData: false,
        data: formData
    }).done(function (data, textStatus, xhr) {
        console.log(data);
        if (xhr.status == 200) {
            $("#showEdit").modal("hide");
            showErrorbyAlert(JSON.parse(data).message);
        } else {
            $("#showEdit").modal("hide");
            showSuccessbyAlert('Sửa thông tin thành công.');
            getList();
        }
    }).fail(function () {
        $("#showEdit").modal("hide");
        showErrorbyAlert("Lỗi Tạo Sản Phẩm");
    });
}


function deleteItem(id) {
    showWarningbyAlert('Bạn chắc chắn muốn xóa sản phẩm này?').then((result) => {
        if (result.value) {
            $.ajax({
                url: GetProduct + "/" + parseInt(id) + "/dan",
                method: 'DELETE',
                dataType: 'json',
                contentType: 'application/json'
            }).done(function () {
                getList();
            })
        }
    })
}

//jQuery.validator.addMethod("specCharacter", function (value, element) {
//    return this.optional(element) || /[-'`~!@#$%^&*()_|+=?;:'",.<>\{\}\[\]\\\/]/.test(value);
//}, "Vui lòng không nhập ký tự đặc biệt");

jQuery.validator.addMethod("specCharacter", function (value, element) {
    return this.optional(element) || !/['`~!@#$%^&*()_|+=?;:'",.<>\{\}\[\]\\\/]/.test(value);
}, "Vui lòng không nhập ký tự đặc biệt");

$.validator.addMethod('filesize', function (value, element, param) {
    return this.optional(element) || (element.files[0].size <= param)
}, 'Kích thước ảnh phải nhỏ hơn {0} bytes');


$("#frmAddProduct").validate({
    rules: {
        name: {
            required: true,
            normalizer: function (value) {
                return $.trim(value);
            },
            minlength: 3,
            specCharacter: true
        },
        price: {
            digits: true
        },
        unit: {
            required: true,
            normalizer: function (value) {
                return $.trim(value);
            },
            specCharacter: true
        },
        avatar: {
            extension: "jpg,jpeg,png",
            filesize: 5242880 // <- 5 MB
        }
    },
    messages: {
        name: {
            required: "Vui lòng nhập tên sản phẩm",
            minlength: "Phải nhập 3 ký tự trở lên"
        },
        price: {
            digits: "Vui lòng nhập số"
        },
        unit: {
            required: "Vui lòng nhập đơn vị sản phẩm"
        },
        avatar: {
            extension: "Vui lòng chọn ảnh định dạng jpg/jpeg/png",
            accept: "Vui lòng chỉ upload ảnh"
        }
    }
});

$("#frmEditProduct").validate({
    rules: {
        ename: {
            required: true,
            normalizer: function (value) {
                return $.trim(value);
            },
            minlength: 3,
            specCharacter: true
        },
        eprice: {
            digits: true
        },
        eunit: {
            required: true,
            normalizer: function (value) {
                return $.trim(value);
            },
            specCharacter: true
        }
    },
    messages: {
        ename: {
            required: "Vui lòng nhập tên sản phẩm",
            minlength: "Phải nhập 3 ký tự trở lên"
        },
        eprice: {
            digits: "Vui lòng nhập số"
        },
        eunit: {
            required: "Vui lòng nhập đơn vị sản phẩm"
        }
    }
});



