using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Interface
{
    public interface INewsService
    {
        Task<List<News>> GetLatestNewsAsync();
    }
}
