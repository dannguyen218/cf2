using coffee.Models;
using coffee.Services;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.IO;
using System.Drawing;
using LazZiya.ImageResize;

namespace coffee.API
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProductsAPIController : ControllerBase
    {
        private readonly IProducts _productsRepository;
        private dynamic result;
        private readonly IHostingEnvironment _hostingEnvironment;

        public ProductsAPIController(IProducts productsRepository, IHostingEnvironment hostingEnvironment)
        {
            _productsRepository = productsRepository;
            _hostingEnvironment = hostingEnvironment;
        }

        [HttpGet]
        public IActionResult GetAllProducts()
        {
            result = _productsRepository.GetAllProducts();
            return Ok(result);
        }

        [HttpGet("{CatalogesId}")]
        public IActionResult GetAllProductsByCataloges(int CatalogesId)
        {
            result = _productsRepository.GetAllProductsByCataloges(CatalogesId);
            return Ok(result);
        }

        [HttpPost]
        public IActionResult PostProduct()
        {
            var product = new Products();
            product.name = HttpContext.Request.Form["name"];
            product.price = decimal.Parse(HttpContext.Request.Form["price"]);
            product.unit = HttpContext.Request.Form["unit"];
            product.CatalogesId = int.Parse(HttpContext.Request.Form["catalogeId"]);
            product.created_by = "dan";
            var image = HttpContext.Request.Form.Files["imageFile"];


            result = _productsRepository.AddProducts(product);
            if (result != null && result.ms == "found")
            {
                return Content("{\"message\":\"Sản phẩm này đã có, hãy nhập tên khác\"}");
            }
            else
            {
                if (image != null)
                    AddImage(image, result.id);
                else
                    _productsRepository.AddImages(result.id, "default.PNG");
                return NoContent();
            }
        }

        [HttpPut("{id}")]
        public IActionResult PutProduct(int id)
        {
            if (id != int.Parse(HttpContext.Request.Form["id"]))
            {
                return BadRequest();
            }

            var product = new Products();
            product.name = HttpContext.Request.Form["name"];
            product.price = decimal.Parse(HttpContext.Request.Form["price"]);
            product.unit = HttpContext.Request.Form["unit"];
            product.CatalogesId = int.Parse(HttpContext.Request.Form["catalogeId"]);
            product.updated_by = "dan";
            var image = HttpContext.Request.Form.Files["imageFile"];
            if (image == null)
            {
                product.images = HttpContext.Request.Form["imageOld"];
            }

            result = _productsRepository.EditProducts(id, product);
            if (result != null && result.ms == "found")
            {
                return Content("{\"message\":\"Sản phẩm này đã có, hãy nhập tên khác\"}");
            }
            else
            {
                if (image != null)
                    AddImage(image, id);
                return NoContent();
            }
        }

        [HttpDelete("{id}/{username}")]
        public ActionResult RemoveProduct(int id, string username)
        {
            _productsRepository.RemoveProducts(id, username);
            return NoContent();
        }

        public void AddImage(IFormFile image, int id)
        {

            string directory = Path.Combine(_hostingEnvironment.WebRootPath, "uploads/products");
            if (!Directory.Exists(directory))
            {
                Directory.CreateDirectory(directory);
            }

            string uploadsFolder = directory + "/" + id;
            if (!Directory.Exists(uploadsFolder))
            {
                Directory.CreateDirectory(uploadsFolder);
            }

            string uniqueFileName = null;
            string uniqueFileName1 = null;

            uniqueFileName = Guid.NewGuid().ToString() + "_" + image.FileName;
            string filePath = Path.Combine(uploadsFolder, uniqueFileName);
            image.CopyTo(new FileStream(filePath, FileMode.Create));

            uniqueFileName1 = Guid.NewGuid().ToString() + "_resize" + "_" + image.FileName;
            using (var stream = image.OpenReadStream())
            {
                var uploadedImage = Image.FromStream(stream);
                var x = uploadedImage.Width;
                var y = uploadedImage.Height;
                if (x > y)
                {
                    x = 175;
                    y = y / x * 175;
                }
                else
                {
                    y = 150;
                    x = x / y * 150;
                }
                //returns Image file
                var img = ImageResize.Scale(uploadedImage, x, y);
                img = new Bitmap(stream);
                img.SaveAs(uploadsFolder + "/" + uniqueFileName1);
            }
            _productsRepository.AddImages(id, uniqueFileName1);
        }
    }
}