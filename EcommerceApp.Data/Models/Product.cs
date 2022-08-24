using EcommerceApp.Domain.Enum;
using System;
using System.Collections.Generic;
using System.Text;

namespace EcommerceApp.Models
{
    public class Product
    {
        public string ProductId { get; set; }
        public string ProdutcName { get; set; }
        public decimal CurrentPrice { get; set; }
        public decimal InitialPrice { get; set; }
        public double Discount { get; set; }
        public string ImgaeUrl { get; set; }
        public ProductCategory ProductCategory { get; set; }  
        public ProductRating ProductRating { get; set; }

    }
}
