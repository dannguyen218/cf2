using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models
{
    public class Products
    {
        public int id { get; set; }
        [Required(ErrorMessage = "Sai độ dài")]
        [MaxLength(100)]
        [MinLength(3)]
        public string name { get; set; }
        public string images { get; set; }
        [Column(TypeName = "decimal(8,0)")]
        public decimal price { get; set; } = 0;
        [Required(ErrorMessage = "Vui lòng nhập đơn vị sản phẩm")]
        [MaxLength(100)]
        public string unit { get; set; }

        public int CatalogesId { get; set; }
        public Cataloges Cataloges { get; set; }
        [JsonIgnore]
        public ICollection<BillDetails> BillDetails { get; set; }

        public bool isDeleted { get; set; } = false;
        public DateTime? deleted_at { get; set; }
        [MaxLength(100)]
        public string deleted_by { get; set; }
        public DateTime? created_at { get; set; }
        [MaxLength(100)]
        public string created_by { get; set; }
        public DateTime updated_at { get; set; }
        [MaxLength(100)]
        public string updated_by { get; set; }
    }
}
