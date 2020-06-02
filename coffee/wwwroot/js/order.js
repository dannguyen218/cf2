var $grid;
var orderItem = [];
var cataName;
var total = 0;
var orderList = [];
var billDetail;

$('#billDetail .discard').click(function () {
    successOrder();
});

function successOrder() {
    total = 0;
    orderItem = [];
    orderList = [];
    $("#billDetail .sell-item-list").html("");
    $("#billDetail .detail-section-note input").val("");
    $("#billDetail .table tbody .text-right").html("0 VND");
    $("#billDetail .green-meadow .float-right").html("0 VND");
}

$('#billDetail .detail-section button').click(function () {
    let note = $('#billDetail .detail-section-note input').val();

    if (orderItem == '' || orderList == '') {
        showErrorbyAlert("Vui Lòng Chọn Món");
    } else {
        $.ajax({
            url: "api/OrderAPI",
            type: 'POST',
            data: JSON.stringify({ orderList: orderList, note: note, total: total }),
            contentType: "application/json; charset=utf-8",
            dataType: "json"
        }).done(function () {
            showSuccessbyAlert("Order Thành Công");
            successOrder();
        }).fail(function () {
            console.log("Lỗi order");
        })
    }
});

function animationGrid() {
    $('.filters ul li').click(function () {
        $('.filters ul li').removeClass('active');
        $(this).addClass('active');

        var data = $(this).attr('data-filter');
        $grid.isotope({
            filter: data
        })
    });

    $grid = $(".grid").isotope({
        itemSelector: ".all",
        percentPosition: true,
        masonry: {
            columnWidth: ".all"
        }
    })
}

getListCataloges();

function getListCataloges() {
    $.ajax({
        url: GetCataloge,
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        let str = '';
        $.each(data, function (index, value) {
            str += `<li id="${value.id}">${value.name}</li>`;
        });
        $(".portfolio .filters ul").html(str);
        $(".portfolio .filters ul li:first-child").addClass("active");
        getProductsByCata(data[0].id);
        cataName = data[0].name;
        $('.portfolio .filters ul li').click(function () {
            $('.filters ul li').removeClass('active');
            $(this).addClass('active');
            cataName = $(this).text();
            getProductsByCata($(this).attr('id'));
        });
        //animationGrid();
    });
}
function getProductsByCata(idCata) {
    $.ajax({
        url: GetProduct + "/" + idCata,
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        let str = '';
        $.each(data, function (index, value) {
            str += `<div class="item">
                                    <img src="uploads/products/${value.id}/${value.images}" onerror='loadImageError(this)'>
                                    <div class="p-inner" idItem="${value.id}" priceItem="${value.price}" imagesItem="${value.images}">
                                        <h5>${value.name}</h5>
                                    </div>
                                </div>
                            </div>`;
        });
        $(".portfolio .filters-content > .row").html(str);
        $('.portfolio .filters-content > .row .item').click(function () {
            var nameItem = $(this).find(".p-inner h5").html();
            var idItem = $(this).find(".p-inner").attr("idItem");
            var priceItem = $(this).find(".p-inner").attr("priceItem");
            var imagesItem = $(this).find(".p-inner").attr("imagesItem");
            addBillDetail(nameItem, idItem, priceItem, imagesItem);
        });
    });
}

function removeItem(e, name, id) {
    total -= parseInt($(`#price${id}`).text().replace(/\.| VND| /gi, ""));
    $("#billDetail .table tbody .text-right").html(addCommas(total) + " VND");
    $("#billDetail .green-meadow .float-right").html(addCommas(total) + " VND");

    $(e).closest(".sell-item").remove();
    let index = orderItem.indexOf(name + " : " + cataName);

    if (index > -1) {
        orderItem.splice(index, 1);
        orderList.splice(index, 1);
    }
}

function addBillDetail(nameItem, idItem, priceItem, imagesItem) {
    total += parseInt(priceItem);
    let index = orderItem.indexOf(nameItem + " : " + cataName);
    if (index != -1) {
        var qty = parseInt($(`#qty${idItem}`).text()) + 1;
        $(`#qty${idItem}`).html(qty);
        $(`#price${idItem}`).html(addCommas(parseInt(priceItem) * qty) + " VND");
        orderList[index].total = parseInt(priceItem) * qty;
        orderList[index].quantity = qty;
    } else {
        orderItem.push(nameItem + " : " + cataName);
        billDetail = {
            "name": nameItem,
            "price": parseInt(priceItem),
            "quantity": 1,
            "total": parseInt(priceItem),
            "ProductsId": parseInt(idItem)
        }
        orderList.push(billDetail);
        //orderList[0]["Bánh Bông Lan Trứng Muối"]
        $("#billDetail .sell-item-list").append(`<div class="sell-item">
                        <div class="item-thumb-pic">
                            <div class="item-thumb-pic-center">
                                <img src="uploads/products/${idItem}/${imagesItem}">
                            </div>
                        </div>

                        <div class="sell-item-details">
                            <div class="sell-item-box-wrap">
                                <div class="sell-item-content">
                                    <div class="sell-item-content-name">
                                        ${nameItem}
                                    </div>
                                    <div class="sell-item-content-quantity">
                                        <span class="sell-item-quantity" id="qty${idItem}">1</span>
                                    </div>
                                    <div class="sell-item-content-price" id="price${idItem}">
                                        ${addCommas(priceItem)} VND
                                    </div>
                                </div>
                                <div class="sell-item-action">
                                    <a href="javascript:;" onclick="removeItem(this, '${nameItem}', ${idItem})"><i class="fas fa-times"></i></a>
                                </div>
                            </div>

                        </div>
                    </div>`);
    }
    $("#billDetail .table tbody .text-right").html(addCommas(total) + " VND");
    $("#billDetail .green-meadow .float-right").html(addCommas(total) + " VND");
}