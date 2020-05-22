using Microsoft.AspNetCore.Mvc;

namespace coffee.Controllers
{
    [Route("cp/[controller]")]
    public class CatalogesController : Controller
    {
        // GET: Cataloges
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
    }
}