using EcommerceApp.Core.Interface;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Service
{
    public class UserService : IUserService
    {
        private readonly IReadWriteToJson _dbContext;
        private readonly string fileName = "Users";
        public UserService(IReadWriteToJson readWriteToJson)
        {
            _dbContext = readWriteToJson;
        }
        public async Task<IEnumerable<User>> GetAllUsersAsync()
        {
            try
            {
                var res = await _dbContext.ReadJson<User>(fileName);
                if (res == null) return null;
                return res;
            }
            catch (Exception)
            {
                throw;
            }
        }
        public Task<User> GetUserByIdAsync(int id)
        {
            throw new NotImplementedException();
        }
    }
}
