using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Models
{
    public class Cataloges
    {
        public int id { get; set; }
        [Required(ErrorMessage = "sai độ dài")]
        [MaxLength(100)]
        [MinLength(3)]
        public string name { get; set; }

        [JsonIgnore]
        public ICollection<Products> Products { get; set; }

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
