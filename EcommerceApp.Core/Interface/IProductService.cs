using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Interface
{
    public interface IProductService
    {
        Task<List<ProductViewModel>> GetAllProductsAsync();
        Task<ProductViewModel> GetProductByIdAsync(int id);
        Task<bool> AddProductAsync(User user);
        Task<List<ProductViewModel>> GetFeaturedProducts();
    }
}
