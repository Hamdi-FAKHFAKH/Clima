import 'package:geolocator/geolocator.dart';

class Location {
  double? Latitude;
  double? Longitude;
  Future getposition() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      Latitude = position.latitude;
      Longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
