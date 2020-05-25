using coffee.Services;
using Dapper;
using System.Data;

namespace coffee.Repository
{
    public class StatisticalRepository : IStatistical
    {
        private string sql;

        public dynamic GetAllBills()
        {
            sql = "GetAllBills";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic GetBillDetailsByBill(int BillsId)
        {
            sql = "GetBillDetailsByBill";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql,
                    new
                    {
                        BillsId
                    }, commandType: CommandType.StoredProcedure));
            return query;
        }
    }
}
