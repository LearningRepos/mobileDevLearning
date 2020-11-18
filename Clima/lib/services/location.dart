import 'package:geolocator/geolocator.dart';

class Location{
  // double _longitude = 23.2;
  // double _latitude = 37.1;
  double _longitude;
  double _latitude;
  Position _position;

  Location();

  Future<void> getPosition() async {
    try {
      _position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      _longitude = _position.longitude;
      _latitude = _position.latitude;
    // print('Location getPosition() _latitude: $_latitude');
    // print('Location getPosition() _longitude: $_longitude');
    } catch(e){
      print('location error: $e');
    }
  }

  Future<double> getLongitude() async {
    if(_position == null){
      await getPosition();
    }
    return _longitude;
  }

  Future<double> getLatitude() async {
    if(_position == null){
      await getPosition();
    }
    return _latitude;
  }
}
