using EcommerceApp.Core.Interface;
using EcommerceApp.Models;
using Microsoft.AspNetCore.Mvc;
using System.Threading.Tasks;

namespace EcommerceApp.MVC.Controllers
{
    public class ProductDetailsController : Controller
    {
        private readonly IProductService _db;
        public ProductDetailsController(IProductService db)
        {
            _db = db;
        }
        [HttpGet("{id}")]
        public async Task<IActionResult> Index([FromRoute]int Id)
        {
            var result = await _db.GetProductByIdAsync(Id);
            return View(result);
        }
    }
}
