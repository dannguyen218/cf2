using coffee.Models;

namespace coffee.Services
{
    public interface ICataloges
    {
        dynamic GetAllCataloges();

        dynamic AddCataloges(Cataloges cataloges);

        dynamic EditCataloges(int id, Cataloges cataloges);

        void RemoveCataloges(int id, string username);
    }
}
