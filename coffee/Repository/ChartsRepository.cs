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
        private string get_charts;
        public List<int> GetChart7Day()
        {
            get_charts = "GetChart7Day";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query<int>(get_charts, commandType: CommandType.StoredProcedure)).ToList();
            return query;
        }
    }
}
