using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace SmartTempMonApp.Models
{
    [Table("alert")]
    public class Alert : BaseModel
    {
        [PrimaryKey("alertID", false)]
        public int AlertID { get; set; }

        [Column("message")]
        public string Message { get; set; }

        [Column("timestamp")]
        public DateTime Timestamp { get; set; }
    }
}
