using Microsoft.AspNetCore.Mvc;

namespace coffee.Controllers
{
    [Route("cp/[controller]")]
    public class ProductsController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
    }
}