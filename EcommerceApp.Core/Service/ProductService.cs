using AutoMapper;
using EcommerceApp.Core.Interface;
using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Service
{
    public class ProductService : IProductService
    {
        private readonly IReadWriteToJson _dbContext;
        private readonly string fileName = "Products";
        private readonly IMapper _mapper;
        public ProductService(IReadWriteToJson readWriteToJson, IMapper mapper)
        {
            _dbContext = readWriteToJson;
            _mapper = mapper;   
        }
        public async Task<bool> AddProductAsync(User user)
        {
            return await _dbContext.WriteJson(user, fileName);
        }

        public async Task<List<ProductViewModel>> GetAllProductsAsync()
        {
            try
            {
                var res = await _dbContext.ReadJson<Product>(fileName);
                if (res == null)
                    return null;
                else
                {
                    var products = _mapper.Map<List<ProductViewModel>>(res);
                    return products;
                }
            }
            catch (Exception)
            {
                throw;
            }
        }

        public async Task<List<ProductViewModel>> GetFeaturedProducts()
        {
            var res = await _dbContext.ReadJson<Product>(fileName);
            var products = _mapper.Map<List<ProductViewModel>>(res);    
            return products.OrderByDescending(x => x.CurrentPrice).Take(3).ToList();        }

        public async Task<ProductViewModel> GetProductByIdAsync(int id)
        {
            var res = await _dbContext.ReadJson<Product>(fileName);
            var products = _mapper.Map<List<ProductViewModel>>(res);
            return products.Where(x => x.ProductId == id).FirstOrDefault();
        }
    }
}
