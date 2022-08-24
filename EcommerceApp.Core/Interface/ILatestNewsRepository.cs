using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Interface
{
    public interface ILatestNewsRepository
    {
        public Task<News> GetLatestNewsAsync();
    }
}
