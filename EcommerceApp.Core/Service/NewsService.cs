using EcommerceApp.Core.Interface;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Service
{
    public class NewsService :INewsService
    {
        private readonly IReadWriteToJson _dbContext;
        private readonly string fileName = "News";
        public NewsService(IReadWriteToJson readWriteToJson)
        {
            _dbContext = readWriteToJson;
        }
        public async Task<List<News>> GetLatestNewsAsync()
        {
            try
            {
                var res = await _dbContext.ReadJson<News>(fileName);
                if (res == null)
                    return null;
                else
                    return res;
            }
            catch (Exception)
            {
                throw;
            }
        }
    }
}
