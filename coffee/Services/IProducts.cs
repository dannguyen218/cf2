using coffee.Models;

namespace coffee.Services
{
    public interface IProducts
    {
        dynamic GetAllProducts();

        dynamic GetAllProductsByCataloges(int CatalogesId);

        dynamic AddProducts(Products products);

        dynamic EditProducts(int id, Products products);

        void RemoveProducts(int id, string username);

        void AddImages(int id, string images);
    }
}
