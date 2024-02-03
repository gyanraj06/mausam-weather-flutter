import 'package:geolocator/geolocator.dart';

//*uses geolocator package

class LocationModel {
  static Future<List<double>> fetchLocation() async {
    List<double> markups = [];

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      LocationPermission ask = await Geolocator.requestPermission();
    } else {
      Position currentPos = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      markups.add(currentPos.latitude);
      markups.add(currentPos.longitude);
    }

    return markups;
  }
}
