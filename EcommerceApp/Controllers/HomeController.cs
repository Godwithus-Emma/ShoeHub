using EcommerceApp.Core.Interface;
using EcommerceApp.Core.ViewModel;
using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace EcommerceApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private readonly IProductService _productDb;
        private readonly INewsService _newsDb;
        public HomeController(ILogger<HomeController> logger, IProductService productDb, INewsService newsDb)
        {
            _logger = logger;
            _productDb= productDb;    
            _newsDb= newsDb;
        }
        public async Task<IActionResult> Index()
        {
            HomeViewModel productList = new HomeViewModel
            {
                products = await _productDb.GetAllProductsAsync() ?? new List<ProductViewModel>(),
                featured = await _productDb.GetFeaturedProducts() ?? new List<ProductViewModel>(),
                news = await _newsDb.GetLatestNewsAsync() ?? new List<News>(),
            };
            return View(productList);
        }
        public IActionResult Privacy()
        {
            return View();
        }
        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
