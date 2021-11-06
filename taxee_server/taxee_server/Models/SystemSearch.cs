using System.ComponentModel.DataAnnotations.Schema;

namespace taxee_server.Models
{
    [NotMapped]
    public class SystemSearch
    {
        public long SystemID { get; set; }
        public string Name { get; set; }
    }
}
