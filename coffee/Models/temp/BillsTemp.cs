using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models.temp
{
    public class BillsTemp
    {
        public int id { get; set; }
        [DisplayName("Thu Ngân")]
        public string created_by { get; set; }
        [DisplayName("Ghi Chú")]
        public string note { get; set; }
        [DisplayName("Thời Gian Thanh Toán")]
        public DateTime time_payment { get; set; }
        [DisplayName("Tổng Tiền")]
        public decimal total_money { get; set; } = 0;
    }
}
