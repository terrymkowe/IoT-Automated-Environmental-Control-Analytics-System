using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;

namespace SmartTempMonApp.Models
{
    [Table("temperaturelog")]  
    public class TemperatureLog : BaseModel
    {
        [PrimaryKey("logid", false)]
        public int LogID { get; set; }

        [Column("timestamp")]
        public DateTime Timestamp { get; set; }

        [Column("temperature")]
        public decimal Temperature { get; set; }

        [Column("action")]
        public string Action { get; set; }

        [Column("deviceid")]
        public int DeviceID { get; set; }
    }
}
