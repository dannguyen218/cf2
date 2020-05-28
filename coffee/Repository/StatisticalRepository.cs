using coffee.Models.temp;
using coffee.Services;
using Dapper;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace coffee.Repository
{
    public class StatisticalRepository : IStatistical
    {
        private string sql;

        public List<BillsTemp> GetAllBills()
        {
            sql = "GetAllBills";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query<BillsTemp>(sql, commandType: CommandType.StoredProcedure)).ToList();
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

        public List<BillsTemp> GetAllBillsByDate(string StartDate, string EndDate)
        {
            sql = "GetAllBillsByDate";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query<BillsTemp>(sql,
                    new
                    {
                        StartDate,
                        EndDate
                    }, commandType: CommandType.StoredProcedure)).ToList();
            return query;
        }
    }
}
