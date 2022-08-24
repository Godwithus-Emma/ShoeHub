using EcommerceApp.Core.Interface;
using EcommerceApp.Core.ViewModels;
using EcommerceApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace EcommerceApp.MVC.Controllers
{
    public class AuthController : Controller
    {
        private readonly IAuthService _authService;
        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }
        public IActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Login(string email, string password)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    var res = await _authService.Login(email, password);
                    if (res == null) return View();
                    HttpContext.Session.SetString("Email", email);
                    return RedirectToAction("Index", "Home");
                }
                catch (Exception)
                {
                    throw;
                }
            }
            return View();
        }

        public IActionResult SignUp()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> SignUp(UserViewModel user)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    await _authService.SignUp(user);
                }
                catch (Exception)
                {
                    throw;
                }
                HttpContext.Session.SetString("Email", user.Email);
                return RedirectToAction("Index", "Home");
            }
            return View();
        }
        public IActionResult LogOut()
        {
            HttpContext.Session.Clear();
            return RedirectToAction("Index", "Home");
        }

    }
}
