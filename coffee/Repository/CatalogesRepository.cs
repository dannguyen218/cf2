using coffee.Models;
using coffee.Services;
using Dapper;
using System.Data;
using System.Linq;

namespace coffee.Repository
{
    public class CatalogesRepository : ICataloges
    {
        private string get_Cataloges;
        private string add_Cataloges;
        private string edit_Cataloges;
        private string remove_Cataloges;

        public dynamic GetAllCataloges()
        {
            get_Cataloges = "GetAllCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(get_Cataloges, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic AddCataloges(Cataloges cataloges)
        {
            add_Cataloges = "AddCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(add_Cataloges,
                    new
                    {
                        cataloges.name,
                        cataloges.created_by
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public dynamic EditCataloges(int id, Cataloges cataloges)
        {
            edit_Cataloges = "EditCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(edit_Cataloges,
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
            remove_Cataloges = "RemoveCataloges";

            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query<Cataloges>(remove_Cataloges,
                    new
                    {
                        username,
                        id
                    }, commandType: CommandType.StoredProcedure);
            });
        }
    }
}