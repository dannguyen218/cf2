using coffee.Models;
using coffee.Services;
using Dapper;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Repository
{
    public class OrderRepository : IOrder
    {
        private decimal total;
        private string created_by;
        private decimal price;
        private int quantity;
        private int ProductsId;
        private string note;

        public int AddBill(string created_by, dynamic order)
        {
            if (order.note != "")
                note = order.note;
            else
                note = null;
            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query<int>("AddBill",
                    new
                    {
                        created_by,
                        note
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public void AddBillDetail(int BillsId, dynamic order)
        {
            ArrayList list = new ArrayList();
            foreach (dynamic item in order.orderList)
            {
                total = item.total;
                created_by = "dan";
                price = item.price;
                quantity = item.quantity;
                ProductsId = item.ProductsId;
                list.Add(new { total, created_by, price, quantity, BillsId, ProductsId });
            }

            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Execute("AddBillDetail",
                    list,
                    commandType: CommandType.StoredProcedure);
            });
        }

        public void EditBill(decimal total_money, int id)
        {
            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query("EditBill",
                    new
                    {
                        total_money,
                        id
                    }, commandType: CommandType.StoredProcedure);
            });
        }
    }
}
