using coffee.Models;
using coffee.Services;
using Dapper;
using System.Data;
using System.Linq;

namespace coffee.Repository
{
    public class CatalogesRepository : ICataloges
    {
        private string sql;

        public dynamic GetAllCataloges()
        {
            sql = "GetAllCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic AddCataloges(Cataloges cataloges)
        {
            sql = "AddCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(sql,
                    new
                    {
                        cataloges.name,
                        cataloges.created_by
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public dynamic EditCataloges(int id, Cataloges cataloges)
        {
            sql = "EditCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(sql,
                    new
                    {
                        cataloges.name,
                        cataloges.updated_by,
                        id
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public void RemoveCataloges(int id, string username)
        {
            sql = "RemoveCataloges";

            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query<Cataloges>(sql,
                    new
                    {
                        username,
                        id
                    }, commandType: CommandType.StoredProcedure);
            });
        }
    }
}