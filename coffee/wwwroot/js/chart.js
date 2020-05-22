var ticksStyle = {
    fontColor: '#495057',
    fontStyle: 'bold'
}

var mode = 'index'
var intersect = true

//var $salesChart = $('#sales-chart2')
//var salesChart = new Chart($salesChart, {
//    type: 'bar',
//    data: {
//        labels: ['JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
//        datasets: [
//            {
//                backgroundColor: '#007bff',
//                borderColor: '#007bff',
//                data: [1000, 2000, 3000, 2500, 2700, 2500, 3000]
//            },
//            {
//                backgroundColor: '#ced4da',
//                borderColor: '#ced4da',
//                data: [700, 1700, 2700, 2000, 1800, 1500, 2000]
//            }
//        ]
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

//                    // Include a dollar sign in the ticks
//                    callback: function (value, index, values) {
//                        if (value >= 1000) {
//                            value /= 1000
//                            value += 'k'
//                        }
//                        return '$' + value
//                    }
//                }, ticksStyle)
//            }],
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

var arr;
getChart7Day();
function getChart7Day() {
    $.ajax({
        url: ChartsAPI,
        async: false,
        method: "GET",
        dataType: "json",
        contentType: "application/json"
    }).done(function (data) {
        console.log(data);
        arr = data;
        
    });
}

var $visitorsChart = $('#visitors-chart2')
var visitorsChart = new Chart($visitorsChart, {
    data: {
        labels: [
            moment().subtract(6, 'day').format('YYYY-MM-DD'),
            moment().subtract(5, 'day').format('YYYY-MM-DD'),
            moment().subtract(4, 'day').format('YYYY-MM-DD'),
            moment().subtract(3, 'day').format('YYYY-MM-DD'),
            moment().subtract(2, 'day').format('YYYY-MM-DD'),
            moment().subtract(1, 'day').format('YYYY-MM-DD'),
            moment().format("YYYY-MM-DD")],
        datasets: [{
            type: 'line',
            data: arr,
            backgroundColor: 'transparent',
            borderColor: '#007bff',
            pointBorderColor: '#007bff',
            pointBackgroundColor: '#007bff',
            fill: false
            // pointHoverBackgroundColor: '#007bff',
            // pointHoverBorderColor    : '#007bff'
        },
        {
            type: 'line',
            data: [60, 80],
            backgroundColor: 'tansparent',
            borderColor: '#ced4da',
            pointBorderColor: '#ced4da',
            pointBackgroundColor: '#ced4da',
            fill: false
            // pointHoverBackgroundColor: '#ced4da',
            // pointHoverBorderColor    : '#ced4da'
        }]
    },
    options: {
        maintainAspectRatio: false,
        tooltips: {
            mode: mode,
            intersect: intersect
        },
        hover: {
            mode: mode,
            intersect: intersect
        },
        legend: {
            display: false
        },
        scales: {
            yAxes: [{
                // display: false,
                gridLines: {
                    display: true,
                    lineWidth: '4px',
                    color: 'rgba(0, 0, 0, .2)',
                    zeroLineColor: 'transparent'
                },
                ticks: $.extend({
                    beginAtZero: true,
                    suggestedMax: 200
                }, ticksStyle)
            }],
            //xAxes: [{
            //    display: true,
            //    gridLines: {
            //        display: false
            //    },
            //    ticks: ticksStyle
            //}]
            xAxes: [{
                display: true,
                gridLines: {
                    display: false
                },
                ticks: ticksStyle
            }]
        }
    }
})




