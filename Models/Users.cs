using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace SmartTempMonApp.Models
{
    [Table("users")]
    public class Users : BaseModel 
    {

        [PrimaryKey("username", false)]
        public string Username { get; set; }

        [Column("firstname")]
        public string Firstname { get; set; }

        [Column("surname")]
        public string Surname { get; set; }

        [Column("email")]
        public string Email { get; set; }

        [Column("password")]
        public string Password { get; set; }

        [Column("role")]
        public string Role { get; set; }
    }


}
