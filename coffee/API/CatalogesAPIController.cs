using coffee.Models;
using coffee.Services;
using Microsoft.AspNetCore.Mvc;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class CatalogesAPIController : ControllerBase
    {
        private readonly ICataloges _catalogesRepository;
        private dynamic result;

        public CatalogesAPIController(ICataloges catalogesRepository)
        {
            _catalogesRepository = catalogesRepository;
        }

        [HttpGet]
        public IActionResult GetAllCataloge()
        {
            result = _catalogesRepository.GetAllCataloges();
            return Ok(result);
        }

        [HttpPost]
        public IActionResult PostCataloge(Cataloges cataloges)
        {
            result = _catalogesRepository.AddCataloges(cataloges);
            if (result != null && result.ms == "found")
            {
                return Content("{\"message\":\"Danh mục này đã có, hãy nhập tên khác\"}");
            }
            else
            {
                return NoContent();
            }
        }

        [HttpPut("{id}")]
        public IActionResult PutCataloge(int id, Cataloges cataloges)
        {
            if (id != cataloges.id)
            {
                return BadRequest();
            }

            result = _catalogesRepository.EditCataloges(id, cataloges);
            if (result != null && result.ms == "found")
            {
                return Content("{\"message\":\"Danh mục này đã có, hãy nhập tên khác\"}");
            }
            else
            {
                return NoContent();
            }
        }

        [HttpDelete("{id}/{username}")]
        public ActionResult RemoveCataloges(int id, string username)
        {
            _catalogesRepository.RemoveCataloges(id, username);
            return NoContent();
        }
    }
}
