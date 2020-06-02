using coffee.Services;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace coffee.Repository
{
    public class ChartsRepository : ICharts
    {
        private string sql;
        public List<int> GetChart7Day()
        {
            sql = "GetChart7Day";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query<int>(sql, commandType: CommandType.StoredProcedure)).ToList();
            return query;
        }

        public List<int> GetChart7_14Day()
        {
            sql = "GetChart7_14Day";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query<int>(sql, commandType: CommandType.StoredProcedure)).ToList();
            return query;
        }

        public dynamic GetTopCataloges7Days()
        {
            sql = "GetTopCataloges7Days";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql, commandType: CommandType.StoredProcedure)).ToList();
            return query;
        }
    }
}
