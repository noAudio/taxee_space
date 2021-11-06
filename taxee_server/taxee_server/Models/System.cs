﻿using System.ComponentModel.DataAnnotations.Schema;

namespace taxee_server.Models
{
    public class System
    {
        public long SystemID { get; set; }
        public string name { get; set; }
        public Coordinates coords { get; set; }
        public Body[] bodies { get; set; }
        public Station[] Stations { get; set; }

        [Microsoft.EntityFrameworkCore.Owned]
        public class Coordinates
        {
            public float x { get; set; }
            public float y { get; set; }
            public float z { get; set; }
        }
    }
}
