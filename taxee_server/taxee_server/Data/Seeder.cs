using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace taxee_server.Data
{
    public class Seeder
    {
        private readonly string _dataPath;
        private readonly TaxeeDbContext _context;
        public Seeder(TaxeeDbContext context)
        {
            _dataPath = @$"{Environment.GetFolderPath(Environment.SpecialFolder.Desktop)}\seed_data";
            _context = context;
        }

        public void LoadSystemData()
        {

            if (!Directory.Exists(_dataPath) || !Directory.EnumerateFiles(_dataPath).Any())
                throw new FileNotFoundException("Could not locate systems data dump. Please upload the file to the webserver.");

            var seedFiles = Directory.GetFiles(_dataPath);
            foreach (var seedFile in seedFiles)
            {
                var finalSystemList = new List<Models.System>();
                var jsonString = File.ReadAllText(seedFile);
                var initDeserilization = JsonConvert.DeserializeObject<List<InitSystem>>(jsonString);

                foreach (var initSystem in initDeserilization)
                {
                    finalSystemList.Add(
                        new Models.System
                        {
                            SystemID = initSystem.id64,
                            name = initSystem.name,
                            coords = new Models.System.Coordinates
                            {
                                x = initSystem.coords.x,
                                y = initSystem.coords.y,
                                z = initSystem.coords.z
                            }
                        }
                        );
                    if(finalSystemList.Count == 100)
                    {
                        _context.Systems.AddRange(finalSystemList);
                        _context.SaveChanges();
                        finalSystemList = new List<Models.System>();
                    }
                }
                _context.Systems.AddRange(finalSystemList);
                _context.SaveChanges();
            }
        }


        private class InitSystem
        {
            public int id { get; set; }
            public long id64 { get; set; }
            public string name { get; set; }
            public Coords coords { get; set; }
            public string date { get; set; }
            public class Coords
            {
                public float x { get; set; }
                public float y { get; set; }
                public float z { get; set; }
            }
        }


    }
}
