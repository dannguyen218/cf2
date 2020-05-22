using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace coffee.Models
{
    public class BillDetails
    {
        public int id { get; set; }
        [Column(TypeName = "decimal(8,0)")]
        public decimal price { get; set; } = 0;
        public int quantity { get; set; } = 0;
        [Column(TypeName = "decimal(8,0)")]
        public decimal total { get; set; } = 0;

        public int ProductsId { get; set; }
        public Products Products { get; set; }
        public int BillsId { get; set; }
        public Bills Bills { get; set; }

        public bool isDeleted { get; set; } = false;
        public DateTime? deleted_at { get; set; }
        [MaxLength(100)]
        public string deleted_by { get; set; }
        public DateTime? created_at { get; set; }
        [MaxLength(100)]
        public string created_by { get; set; }
        public DateTime? updated_at { get; set; }
        [MaxLength(100)]
        public string updated_by { get; set; }
    }
}
