using coffee.Models.temp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Services
{
    public interface IStatistical
    {
        List<BillsTemp> GetAllBills();

        dynamic GetBillDetailsByBill(int BillsId);

        dynamic GetAllBillsByDate(string StartDate, string EndDate);
    }
}
