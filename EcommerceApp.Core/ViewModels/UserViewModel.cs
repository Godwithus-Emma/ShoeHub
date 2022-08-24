using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace EcommerceApp.Core.ViewModels
{
    public class UserViewModel
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        [EmailAddress]
        public string Email { get; set; }
        [RegularExpression(@"^(?=.*[@$!%*#?&])(?=.*[0-9])[\w\d@$!%*#?&]{6,}$", ErrorMessage = "Invalid Password")]
        public string Password { get; set; }
    }
}
