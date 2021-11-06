using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using taxee_server.Models;

namespace taxee_server.Data
{
    public class TaxeeDbContext : DbContext
    {
        public DbSet<Models.System> Systems { get; set; }
        public DbSet<Station> Stations { get; set; }
        public DbSet<Body> Bodies { get; set; }
        public TaxeeDbContext(DbContextOptions<TaxeeDbContext> options) : base(options)
        {
        }
    }
}
