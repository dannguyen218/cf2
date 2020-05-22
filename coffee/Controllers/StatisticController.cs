using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace coffee.Controllers
{
    [Route("cp/[controller]")]
    public class StatisticController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }
    }
}