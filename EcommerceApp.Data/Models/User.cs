using System;
using System.ComponentModel.DataAnnotations;

namespace EcommerceApp.Models
{
    public class User
    {
        public string UserId { get; set; }
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        public string FullName
        {
            get { return $"{FirstName}{LastName}"; }  
        }
        [EmailAddress]
        public string Email { get; set; }
        [DataType(DataType.Password)]
        public string Password { get; set; } 

    }
}
