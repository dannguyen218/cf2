using coffee.Models;
using coffee.Services;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Repository
{
    public class OrderRepository : IOrder
    {
        public void AddBill_BillDetail(dynamic item, string note)
        {
            int total = item.total;
            string created_by = item.created_by;
            int price = item.price;
            int quantity = item.quantity;
            int ProductsId = item.ProductsId;

            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query<dynamic>("AddBill_BillDetail",
                    new
                    {
                        total,
                        created_by,
                        price,
                        quantity,
                        ProductsId,
                        note
                    }, commandType: CommandType.StoredProcedure);
            });
        }
    }
}
