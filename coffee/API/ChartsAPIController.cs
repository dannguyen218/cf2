using coffee.Services;
using Microsoft.AspNetCore.Mvc;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChartsAPIController : ControllerBase
    {
        private readonly ICharts _chartsRepository;
        private dynamic result;

        public ChartsAPIController(ICharts chartsRepository)
        {
            _chartsRepository = chartsRepository;
        }

        [HttpGet]
        public IActionResult GetChart7Day()
        {
            result = _chartsRepository.GetChart7Day();
            return Ok(result);
        }
    }
}