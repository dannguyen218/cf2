using coffee.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Services
{
    public interface IOrder
    {
        int AddBill(string created_by, dynamic order);

        void AddBillDetail(int BillsId, dynamic order);

        void EditBill(decimal @total_money, int id);
    }
}
