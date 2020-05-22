using coffee.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Services
{
    public interface IOrder
    {
        void AddBill_BillDetail(dynamic item, string note);
    }
}
