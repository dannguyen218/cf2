using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models.temp
{
    public class BillsTemp
    {
        public int id { get; set; }
        public string created_by { get; set; }
        public string note { get; set; }
        public DateTime time_payment { get; set; }
        public decimal total_money { get; set; } = 0;
    }
}
