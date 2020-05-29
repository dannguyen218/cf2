using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models.temp
{
    public class ProductsTemp
    {
        [DisplayName("Tên Sản Phẩm")]
        public string name { get; set; }
        [DisplayName("Giá")]
        public decimal price { get; set; } = 0;
        [DisplayName("Số Lượng")]
        public int quantity { get; set; } = 0;
        [DisplayName("Tổng Tiền")]
        public decimal total { get; set; } = 0;
    }
}
