using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace SmartTempMonApp.Models
{
    [Table("userlog")] 
    public class UserLog : BaseModel
    {
        [PrimaryKey("username", false)]
        public string Username { get; set; }

        [PrimaryKey("logID", false)]
        public int LogID { get; set; }
    }
}
