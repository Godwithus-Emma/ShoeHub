using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace EcommerceApp.Core.ViewModel
{
    public class HomeViewModel
    {
       public List<ProductViewModel> products { get; set; }
        public List<ProductViewModel> featured { get; set; }
        public List<News> news { get; set; }

    }
}
