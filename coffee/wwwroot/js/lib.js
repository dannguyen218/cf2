function showSuccessbyAlert(t) {
    return Swal.fire({
        position: 'center-middle',
        icon: 'success',
        title: t,
        showConfirmButton: false,
        timer: 1500
    })
}

function showEditSuccessbyAlert(t) {
    Swal.fire({
        position: 'top-end',
        icon: 'success',
        title: t,
        showConfirmButton: false,
        timer: 1500
    })
}

function showErrorbyAlert(t) {
    return Swal.fire({
        icon: 'error',
        text: t
    })
}

function showWarningbyAlert(t) {
    return Swal.fire({
        text: t,
        icon: 'question',
        showCancelButton: true,
        cancelButtonColor: '#3085d6',
        confirmButtonColor: '#d33',
        cancelButtonText: 'Hủy',
        confirmButtonText: 'Vâng, xóa nó đi!'

    })
}

function addCommas(nStr) {
    nStr += '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(nStr)) {
        nStr = nStr.replace(rgx, '$1' + '.' + '$2');
    }
    return nStr;
}

function toSlug(str) {
    // Chuyển hết sang chữ thường
    str = str.toLowerCase();

    // xóa dấu
    str = str
        .normalize('NFD') // chuyển chuỗi sang unicode tổ hợp
        .replace(/[\u0300-\u036f]/g, ''); // xóa các ký tự dấu sau khi tách tổ hợp

    // Thay ký tự đĐ
    str = str.replace(/[đĐ]/g, 'd');

    // Xóa ký tự đặc biệt
    str = str.replace(/([^0-9a-z-\s])/g, '');

    // Xóa khoảng trắng thay bằng ký tự _
    str = str.replace(/(\s+)/g, '_');

    // Xóa ký tự - liên tiếp
    str = str.replace(/-+/g, '-');

    // xóa phần dư - ở đầu & cuối
    str = str.replace(/^-+|-+$/g, '');

    // return
    return str;
}

function readURL(input, elem) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(elem).attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function loadImageError(elem) {
    $(elem).attr("src", "/images/default.PNG");
}
