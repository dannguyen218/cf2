using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models.temp
{
    public class CatalogesTemp
    {
        [DisplayName("Danh Mục")]
        public string name { get; set; }
        [DisplayName("Số Lượng Order")]
        public int quantity { get; set; } = 0;
    }
}
