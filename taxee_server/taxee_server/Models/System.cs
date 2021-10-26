namespace taxee_server.Models
{
    public partial class System
    {
        public string name { get; set; }
        public Coordinates coords { get; set; }
        public Body[] bodies { get; set; }
        public Station[] Stations { get; set; }
        public class Coordinates
        {
            public float x { get; set; }
            public float y { get; set; }
            public float z { get; set; }
        }
        public class Body
        {
            public string BodyID { get; set; }
            public string BodyName { get; set; }
        }
        public class Station
        {
            public string StationID { get; set; }
            public string StationName { get; set; }
        }
    }
}
