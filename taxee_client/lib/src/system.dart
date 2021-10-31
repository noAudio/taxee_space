class System {
  String systemID, name;
  ReceivedCoordinates coordinates;
  Body? bodies;
  Station? stations;

  System(
    this.systemID,
    this.name,
    this.coordinates,
    this.bodies,
    this.stations,
  );
}

class ReceivedCoordinates {
  double x, y, z;

  ReceivedCoordinates(this.x, this.y, this.z);
}

class Body {
  String bodyID;
  String name;
  String systemID;

  Body(
    this.bodyID,
    this.name,
    this.systemID,
  );
}

class Station {
  String stationID, name, systemID;

  Station(
    this.stationID,
    this.name,
    this.systemID,
  );
}

enum BodyType {
  star,
  planet,
  moon,
  ring,
}
