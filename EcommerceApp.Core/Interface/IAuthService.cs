using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EcommerceApp.Core.Interface
{
    public interface IAuthService
    {
        public Task<User> Login(string email, string password);
        Task<bool> SignUp(UserViewModel user);
    }
}
