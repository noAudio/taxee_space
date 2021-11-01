import 'station.dart';
import 'body.dart';

class System {
  String systemID, name;
  ReceivedCoordinates coordinates;
  double distance;
  Body? bodies;
  Station? stations;

  System({
    required this.systemID,
    required this.name,
    required this.coordinates,
    required this.distance,
    this.bodies,
    this.stations,
  });
}

class ReceivedCoordinates {
  double x, y, z;

  ReceivedCoordinates({
    required this.x,
    required this.y,
    required this.z,
  });
}
