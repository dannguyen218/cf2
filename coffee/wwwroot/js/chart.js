//var ticksStyle = {
//    fontColor: '#495057',
//    fontStyle: 'bold'
//}

//var mode = 'index'
//var intersect = true

////var $salesChart = $('#sales-chart2')
////var salesChart = new Chart($salesChart, {
////    type: 'bar',
////    data: {
////        labels: ['JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
////        datasets: [
////            {
////                backgroundColor: '#007bff',
////                borderColor: '#007bff',
////                data: [1000, 2000, 3000, 2500, 2700, 2500, 3000]
////            },
////            {
////                backgroundColor: '#ced4da',
////                borderColor: '#ced4da',
////                data: [700, 1700, 2700, 2000, 1800, 1500, 2000]
////            }
////        ]
////    },
////    options: {
////        maintainAspectRatio: false,
////        tooltips: {
////            mode: mode,
////            intersect: intersect
////        },
////        hover: {
////            mode: mode,
////            intersect: intersect
////        },
////        legend: {
////            display: false
////        },
////        scales: {
////            yAxes: [{
////                // display: false,
////                gridLines: {
////                    display: true,
////                    lineWidth: '4px',
////                    color: 'rgba(0, 0, 0, .2)',
////                    zeroLineColor: 'transparent'
////                },
////                ticks: $.extend({
////                    beginAtZero: true,

////                    // Include a dollar sign in the ticks
////                    callback: function (value, index, values) {
////                        if (value >= 1000) {
////                            value /= 1000
////                            value += 'k'
////                        }
////                        return '$' + value
////                    }
////                }, ticksStyle)
////            }],
////            xAxes: [{
////                display: true,
////                gridLines: {
////                    display: false
////                },
////                ticks: ticksStyle
////            }]
////        }
////    }
////})

//var arr;
//getChart7Day();
//function getChart7Day() {
//    $.ajax({
//        url: ChartsAPI,
//        async: false,
//        method: "GET",
//        dataType: "json",
//        contentType: "application/json"
//    }).done(function (data) {
//        console.log(data);
//        arr = data;

//    });
//}

//var $visitorsChart = $('#visitors-chart2')
//var visitorsChart = new Chart($visitorsChart, {
//    data: {
//        labels: [
//            moment().subtract(6, 'day').format('YYYY-MM-DD'),
//            moment().subtract(5, 'day').format('YYYY-MM-DD'),
//            moment().subtract(4, 'day').format('YYYY-MM-DD'),
//            moment().subtract(3, 'day').format('YYYY-MM-DD'),
//            moment().subtract(2, 'day').format('YYYY-MM-DD'),
//            moment().subtract(1, 'day').format('YYYY-MM-DD'),
//            moment().format("YYYY-MM-DD")],
//        datasets: [{
//            type: 'line',
//            data: arr,
//            backgroundColor: 'transparent',
//            borderColor: '#007bff',
//            pointBorderColor: '#007bff',
//            pointBackgroundColor: '#007bff',
//            fill: false
//            // pointHoverBackgroundColor: '#007bff',
//            // pointHoverBorderColor    : '#007bff'
//        },
//        {
//            type: 'line',
//            data: [60, 80],
//            backgroundColor: 'tansparent',
//            borderColor: '#ced4da',
//            pointBorderColor: '#ced4da',
//            pointBackgroundColor: '#ced4da',
//            fill: false
//            // pointHoverBackgroundColor: '#ced4da',
//            // pointHoverBorderColor    : '#ced4da'
//        }]
//    },
//    options: {
//        maintainAspectRatio: false,
//        tooltips: {
//            mode: mode,
//            intersect: intersect
//        },
//        hover: {
//            mode: mode,
//            intersect: intersect
//        },
//        legend: {
//            display: false
//        },
//        scales: {
//            yAxes: [{
//                // display: false,
//                gridLines: {
//                    display: true,
//                    lineWidth: '4px',
//                    color: 'rgba(0, 0, 0, .2)',
//                    zeroLineColor: 'transparent'
//                },
//                ticks: $.extend({
//                    beginAtZero: true,
//                    suggestedMax: 200
//                }, ticksStyle)
//            }],
//            //xAxes: [{
//            //    display: true,
//            //    gridLines: {
//            //        display: false
//            //    },
//            //    ticks: ticksStyle
//            //}]
//            xAxes: [{
//                display: true,
//                gridLines: {
//                    display: false
//                },
//                ticks: ticksStyle
//            }]
//        }
//    }
//})














//===========================================================================================================

//=======================================================Doanh Thu ====================================================
var arr7Day;
var arr7_14Day;
var sum = 0;

getChart7Day();
getChart7_14Day();
function getChart7Day() {
    $.ajax({
        url: ChartsAPI,
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        arr7Day = data;
        arr7Day.forEach(function (num) {
            sum += parseInt(num) || 0;
        });
    });
}

function getChart7_14Day() {
    $.ajax({
        url: ChartsAPI + "/14days",
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        arr7_14Day = data;
    });
}

var optionWeek = {
    chart: {
        fontFamily: 'Nunito, sans-serif',
        height: 435,
        type: 'area',
        zoom: {
            enabled: false
        },
        dropShadow: {
            enabled: true,
            opacity: 0.3,
            blur: 5,
            left: -7,
            top: 22
        },
        toolbar: {
            show: false
        },
        events: {
            mounted: function (ctx, config) {
                const highest1 = ctx.getHighestValueInSeries(0);
                const highest2 = ctx.getHighestValueInSeries(1);

                ctx.addPointAnnotation({
                    x: new Date(ctx.w.globals.seriesX[0][ctx.w.globals.series[0].indexOf(highest1)]).getTime(),
                    y: highest1,
                    label: {
                        style: {
                            cssClass: 'd-none'
                        }
                    },
                    customSVG: {
                        SVG: '<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="#1b55e2" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle"><circle cx="12" cy="12" r="10"></circle></svg>',
                        cssClass: undefined,
                        offsetX: -8,
                        offsetY: 5
                    }
                })

                ctx.addPointAnnotation({
                    x: new Date(ctx.w.globals.seriesX[1][ctx.w.globals.series[1].indexOf(highest2)]).getTime(),
                    y: highest2,
                    label: {
                        style: {
                            cssClass: 'd-none'
                        }
                    },
                    customSVG: {
                        SVG: '<svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="#e7515a" stroke="#fff" stroke-width="3" stroke-linecap="round" stroke-linejoin="round" class="feather feather-circle"><circle cx="12" cy="12" r="10"></circle></svg>',
                        cssClass: undefined,
                        offsetX: -8,
                        offsetY: 5
                    }
                })
            },
        }
    },
    colors: ['#1b55e2', '#e7515a'],
    dataLabels: {
        enabled: false
    },
    markers: {
        discrete: [{
            seriesIndex: 0,
            dataPointIndex: 7,
            fillColor: '#000',
            strokeColor: '#000',
            size: 5
        }, {
            seriesIndex: 2,
            dataPointIndex: 11,
            fillColor: '#000',
            strokeColor: '#000',
            size: 4
        }]
    },
    subtitle: {
        text: 'Tổng Doanh Thu',
        align: 'left',
        margin: 0,
        offsetX: -10,
        offsetY: 35,
        floating: false,
        style: {
            fontSize: '14px',
            color: '#888ea8'
        }
    },
    title: {
        text: addCommas(sum) + " VND",
        align: 'left',
        margin: 0,
        offsetX: -10,
        offsetY: 0,
        floating: false,
        style: {
            fontSize: '25px',
            color: '#0e1726'
        },
    },
    stroke: {
        show: true,
        curve: 'smooth',
        width: 2,
        lineCap: 'square'
    },
    series: [{
        name: 'Tuần Này',
        data: arr7Day
    }, {
        name: 'Tuần Trước',
        data: arr7_14Day
    }],
    labels: [moment().subtract(6, 'day').format('YYYY-MM-DD'),
    moment().subtract(5, 'day').format('YYYY-MM-DD'),
    moment().subtract(4, 'day').format('YYYY-MM-DD'),
    moment().subtract(3, 'day').format('YYYY-MM-DD'),
    moment().subtract(2, 'day').format('YYYY-MM-DD'),
    moment().subtract(1, 'day').format('YYYY-MM-DD'),
    moment().format("YYYY-MM-DD")],
    xaxis: {
        axisBorder: {
            show: false
        },
        axisTicks: {
            show: false
        },
        crosshairs: {
            show: true
        },
        labels: {
            offsetX: 0,
            offsetY: 5,
            style: {
                fontSize: '12px',
                fontFamily: 'Nunito, sans-serif',
                cssClass: 'apexcharts-xaxis-title',
            },
        }
    },
    yaxis: {
        labels: {
            formatter: function (value, index) {
                return addCommas(value) + ' VND'
            },
            offsetX: -22,
            offsetY: 0,
            style: {
                fontSize: '12px',
                fontFamily: 'Nunito, sans-serif',
                cssClass: 'apexcharts-yaxis-title',
            },
        }
    },
    grid: {
        borderColor: '#e0e6ed',
        strokeDashArray: 5,
        xaxis: {
            lines: {
                show: true
            }
        },
        yaxis: {
            lines: {
                show: false,
            }
        },
        padding: {
            top: 0,
            right: 0,
            bottom: 0,
            left: -10
        },
    },
    legend: {
        position: 'top',
        horizontalAlign: 'right',
        offsetY: -50,
        fontSize: '16px',
        fontFamily: 'Nunito, sans-serif',
        markers: {
            width: 10,
            height: 10,
            strokeWidth: 0,
            strokeColor: '#fff',
            fillColors: undefined,
            radius: 12,
            onClick: undefined,
            offsetX: 0,
            offsetY: 0
        },
        itemMargin: {
            horizontal: 0,
            vertical: 20
        }
    },
    tooltip: {
        theme: 'dark',
        marker: {
            show: true,
        },
        x: {
            show: false,
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            type: "vertical",
            shadeIntensity: 1,
            inverseColors: !1,
            opacityFrom: .28,
            opacityTo: .05,
            stops: [45, 100]
        }
    },
    responsive: [{
        breakpoint: 575,
        options: {
            legend: {
                offsetY: -30,
            },
        },
    }]
}

var chartWeek = new ApexCharts(
    document.querySelector("#revenueWeek"),
    optionWeek
);

chartWeek.render();

//=======================================================Cataloges====================================================
var arrTopCataOrder = [];
var arrTopCataName = [];
getTopCata();
function getTopCata() {
    $.ajax({
        url: ChartsAPI + "/topcataloges",
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        $.each(data, function (index, value) {
            arrTopCataName.push(value.name);
            arrTopCataOrder.push(value.quantity);
        });
    });
}

var optionCataloges = {
    chart: {
        type: 'donut',
        width: 450
    },
    colors: ['#1b55e2', '#009688', '#e7515a', '#e2a03f'],
    dataLabels: {
        enabled: false
    },
    legend: {
        position: 'bottom',
        horizontalAlign: 'center',
        fontSize: '14px',
        markers: {
            width: 10,
            height: 10,
        },
        itemMargin: {
            horizontal: 0,
            vertical: 8
        }
    },
    plotOptions: {
        pie: {
            donut: {
                size: '65%',
                background: 'transparent',
                labels: {
                    show: true,
                    name: {
                        show: true,
                        fontSize: '20px',
                        fontFamily: 'Nunito, sans-serif',
                        color: undefined,
                        offsetY: -10
                    },
                    value: {
                        show: true,
                        fontSize: '26px',
                        fontFamily: 'Nunito, sans-serif',
                        color: '20',
                        offsetY: 16,
                        formatter: function (val) {
                            return val
                        }
                    },
                    total: {
                        show: true,
                        showAlways: true,
                        label: 'Tổng Cộng',
                        color: '#888ea8',
                        formatter: function (w) {
                            return w.globals.seriesTotals.reduce(function (a, b) {
                                return a + b
                            }, 0)
                        }
                    }
                }
            }
        }
    },
    stroke: {
        show: true,
        width: 25,
    },
    series: arrTopCataOrder,
    labels: arrTopCataName,
    responsive: [{
        breakpoint: 1599,
        options: {
            chart: {
                width: '350px',
                height: '400px'
            },
            legend: {
                position: 'bottom'
            }
        },

        breakpoint: 1439,
        options: {
            chart: {
                width: '250px',
                height: '390px'
            },
            legend: {
                position: 'bottom'
            },
            plotOptions: {
                pie: {
                    donut: {
                        size: '65%',
                    }
                }
            }
        },
    }]
}
var chartCataloges = new ApexCharts(
    document.querySelector("#orderCataloges"),
    optionCataloges
);

chartCataloges.render();


//=======================================================Products====================================================
getList();
function getList() {
    var t = $("#zero-config").DataTable({
        "destroy": true,
        "responsive": true,
        "searching": false,
        "lengthChange": false,
        "info": false,
        "iDisplayLength": 7,
        "ajax": {
            "url": ChartsAPI + "/topproducts",
            "dataSrc": ""
        },
        "oLanguage": {
            "oPaginate": {
                "sPrevious": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-left"><line x1="19" y1="12" x2="5" y2="12"></line><polyline points="12 19 5 12 12 5"></polyline></svg>`,
                "sNext": `<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right"><line x1="5" y1="12" x2="19" y2="12"></line><polyline points="12 5 19 12 12 19"></polyline></svg>`
            }
        },
        columns: [
            { data: null },
            { title: "Tên Sản Phẩm", data: 'name' },
            {
                title: "Giá Bán", data: 'price',
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            },
            { title: "Số Lượng", data: 'quantity' },
            {
                title: "Tổng Tiền", data: 'total',
                render: function (data, type, row, meta) {
                    return addCommas(data) + " VND";
                }
            },
        ]
    })

    t.on('order.dt search.dt', function () {
        t.column(0, { search: 'applied', order: 'applied' }).nodes().each(function (cell, i) {
            cell.innerHTML = i + 1;
            t.cell(cell).invalidate('dom');
        });
    }).draw();

}


//=================================================================================================================


var d_1options1 = {
    chart: {
        height: 400,
        type: 'bar',
        toolbar: {
            show: false,
        },
        dropShadow: {
            enabled: true,
            top: 1,
            left: 1,
            blur: 2,
            color: '#acb0c3',
            opacity: 0.7,
        }
    },
    colors: ['#5c1ac3', '#ffbb44'],
    plotOptions: {
        bar: {
            horizontal: false,
            columnWidth: '55%',
            endingShape: 'rounded'
        },
    },
    dataLabels: {
        enabled: false
    },
    legend: {
        position: 'bottom',
        horizontalAlign: 'center',
        fontSize: '14px',
        markers: {
            width: 10,
            height: 10,
        },
        itemMargin: {
            horizontal: 0,
            vertical: 8
        }
    },
    stroke: {
        show: true,
        width: 2,
        colors: ['transparent']
    },
    series: [{
        name: 'Direct',
        data: [58, 44, 55, 57, 56, 61, 58, 63, 60, 66, 56, 63]
    }, {
        name: 'Organic',
        data: [91, 76, 85, 101, 98, 87, 105, 91, 114, 94, 66, 70]
    }],
    xaxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
    },
    fill: {
        type: 'gradient',
        gradient: {
            shade: 'light',
            type: 'vertical',
            shadeIntensity: 0.3,
            inverseColors: false,
            opacityFrom: 1,
            opacityTo: 0.8,
            stops: [0, 100]
        }
    },
    tooltip: {
        y: {
            formatter: function (val) {
                return val
            }
        }
    }
}

var d_1C_3 = new ApexCharts(
    document.querySelector("#uniqueVisits"),
    d_1options1
);
d_1C_3.render();