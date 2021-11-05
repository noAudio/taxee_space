using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using taxee_server.Data;
using taxee_server.Models;

namespace taxee_server.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class SearchController : ControllerBase
    {
        private readonly TaxeeDbContext _context;

        public SearchController(TaxeeDbContext context)
        {
            _context = context;
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<Models.System>> Single(long id)
        {
            var system = await _context.Systems.FindAsync(id);

            if (system is null)
                return NotFound();

            return system;
        }

        [HttpGet]
        public async Task<ActionResult<List<SystemSearch>>> LiveSearch(string partialName)
        {
            var potentialSystems = _context.Systems.Where(star => star.name.Contains(partialName)).Take(5);

            try
            {
                var results = potentialSystems.Select(
                    star => new SystemSearch { 
                        SystemID = star.SystemID, 
                        Name = star.name 
                    }).ToList();
                if (results is null)
                    return NotFound(new List<string> { "No matching systems found." });

                return results;
            }
            catch (MySqlConnector.MySqlException)
            {
                return NotFound(new List<string> { "Could not load systems on time." });
            }

        }
    }
}
