using Microsoft.AspNetCore.Mvc;

namespace coffee.Controllers
{
    [Route("cp")]
    public class HomeController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
    }
}
