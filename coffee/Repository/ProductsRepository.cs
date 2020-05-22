using coffee.Models;
using coffee.Services;
using Dapper;
using System.Data;
using System.Linq;

namespace coffee.Repository
{
    public class ProductsRepository : IProducts
    {
        private string get_Products;
        private string add_Products;
        private string edit_Products;
        private string remove_Products;

        public dynamic GetAllProducts()
        {
            get_Products = "GetAllProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(get_Products, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic GetAllProductsByCataloges(int CatalogesId)
        {
            get_Products = "GetAllProductsByCataloges";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
                      conn => conn.Query(get_Products, new { CatalogesId }, commandType: CommandType.StoredProcedure));
            return query;
        }

        public dynamic AddProducts(Products products)
        {
            add_Products = "AddProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(add_Products,
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
            edit_Products = "EditProducts";

            var query = SQLUtils.ExecuteCommand(SQLUtils._connStr,
           conn => conn.Query(edit_Products,
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
            remove_Products = "RemoveProducts";

            SQLUtils.ExecuteCommand(SQLUtils._connStr, conn =>
            {
                var query = conn.Query<Cataloges>(remove_Products,
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
