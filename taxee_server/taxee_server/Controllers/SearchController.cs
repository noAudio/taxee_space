using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using taxee_server.Models;

namespace taxee_server.Controllers
{
    public class SearchController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public IEnumerable<SystemSearch> Single(string systemName)
        {
            throw new NotImplementedException(); //TODO Add search logic for single systems
        }

        [HttpGet]
        public IEnumerable<SystemSearch> LiveSearch(string partialName)
        {
            throw new NotImplementedException();
        }
    }
}
