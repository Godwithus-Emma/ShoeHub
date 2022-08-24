using AutoMapper;
using EcommerceApp.Core.Interface;
using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Service
{
    public class AuthService: IAuthService
    {
        private readonly IUserService _db;
        private readonly IReadWriteToJson _dbContext;
        private readonly IMapper _mapper;
        private readonly string fileName = "Users";
        public AuthService(IUserService db, IReadWriteToJson readWriteToJson, IMapper mapper)
        {
            _db = db;   
            _dbContext = readWriteToJson;   
            _mapper = mapper;
        }
        public async Task<bool> SignUp(UserViewModel user)
        {
            var newUser = _mapper.Map<User>(user);
            newUser.UserId = Guid.NewGuid().ToString();
            return await _dbContext.WriteJson(user, fileName);
        }
        public async Task<User> Login(string email, string password)
        {
            var users = await _db.GetAllUsersAsync();
            foreach (var item in users)
            {
                if (item.Email == email && item.Password == password)
                {

                    return item;
                }
            }
            return null;
        }

    }
}
