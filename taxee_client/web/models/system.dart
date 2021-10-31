import 'station.dart';
import 'body.dart';

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
