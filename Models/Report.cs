using Supabase.Postgrest.Attributes;
using Supabase.Postgrest.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SmartTempMonApp.Models
{
    [Table("report")]
    public class Report : BaseModel
    {
        [PrimaryKey("reportID", false)]
        public int ReportIDD { get; set; }

        [Column("date")]
        public DateTime Date { get; set; }

        [Column("datasummary")]
        public string DataSummary { get; set; }

        [Column("generatedby")]
        public string GeneratedBy { get; set; }
    }
}
