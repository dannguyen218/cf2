using coffee.Services;
using Microsoft.AspNetCore.Mvc;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class ChartsAPIController : ControllerBase
    {
        private readonly ICharts _chartsRepository;
        private readonly IStatistical _statisticalRepository;
        private dynamic result;

        public ChartsAPIController(ICharts chartsRepository, IStatistical statisticalRepository)
        {
            _chartsRepository = chartsRepository;
            _statisticalRepository = statisticalRepository;
        }

        [HttpGet]
        public IActionResult GetChart7Day()
        {
            result = _chartsRepository.GetChart7Day();
            return Ok(result);
        }

        [HttpGet("14days")]
        public IActionResult GetChart7_14Day()
        {
            result = _chartsRepository.GetChart7_14Day();
            return Ok(result);
        }

        [HttpGet("topcataloges")]
        public IActionResult GetTopCataloges7Days()
        {
            result = _chartsRepository.GetTopCataloges7Days();
            return Ok(result);
        }

        [HttpGet("topproducts")]
        public IActionResult GetTopProducts()
        {
            result = _statisticalRepository.GetTopProducts();
            return Ok(result);
        }
    }
}