using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models
{
    public class Bills
    {
        public int id { get; set; }
        public DateTime? time_payment { get; set; }
        [Column(TypeName = "decimal(15,0)")]
        public decimal total_money { get; set; } = 0;
        [MaxLength(255)]
        public string note { get; set; }

        [JsonIgnore]
        public ICollection<BillDetails> BillDetails { get; set; }

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
