using AutoMapper;
using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace EcommerceApp.Core.Utility.AutoMaper
{
    public class ProductMapper : Profile
    {
        public ProductMapper()
        {
            CreateMap<User, UserViewModel>().ReverseMap();
            CreateMap<Product, ProductViewModel>().ReverseMap();
        }
       
    }
}
