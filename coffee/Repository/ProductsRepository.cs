using coffee.Models;
using coffee.Services;
using Dapper;
using System.Data;
using System.Linq;

namespace coffee.Repository
{
    public class ProductsRepository : IProducts
    {
        private string sql;

        public dynamic GetAllProducts()
        {
            sql = "GetAllProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic GetAllProductsByCataloges(int CatalogesId)
        {
            sql = "GetAllProductsByCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(sql, new { CatalogesId }, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic AddProducts(Products products)
        {
            sql = "AddProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(sql,
                    new
                    {
                        products.name,
                        products.images,
                        products.price,
                        products.unit,
                        products.created_by,
                        products.CatalogesId
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public dynamic EditProducts(int id, Products products)
        {
            sql = "EditProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(sql,
                    new
                    {
                        products.name,
                        products.images,
                        products.price,
                        products.unit,
                        products.updated_by,
                        products.CatalogesId,
                        id
                    }, commandType: CommandType.StoredProcedure)).FirstOrDefault();
            return query;
        }

        public void RemoveProducts(int id, string username)
        {
            sql = "RemoveProducts";

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

        public void AddImages(int id, string images)
        {
            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query<Cataloges>("addImage",
                    new
                    {
                        images,
                        id
                    }, commandType: CommandType.StoredProcedure);
            });
        }
    }
}
