import 'package:flutter/material.dart';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/screens/home_screen.dart';
import 'package:mausam/widget/location_button.dart';
import 'package:geocoding/geocoding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  bool checkPageBool = false;
  String locationVal = "";
  List<double> locationmarkups = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF161618),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 150, bottom: 10),
              child: Image.asset("assets/logos/logo_white.png"),
            ),
            const Text(
              "Grant Location Access",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                fetchLocation();
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: LocationButton(),
              ),
            ),
            Text(
              locationVal,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () async {
                if (locationVal == "" || locationVal == "Get Location First") {
                  setState(() {
                    locationVal = "Get Location First";
                  });
                } else {
                  //* Shared Pref
                  checkPageBool = true;
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool("checkPage", checkPageBool);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              },
              child: Container(
                height: 50,
                width: 150,
                color: Colors.white,
                child: const Center(
                    child: Text(
                  "CONFIRM",
                  style: TextStyle(
                      color: Color(0xFFE21A41),
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }

  void fetchLocation() async {
    Future<List<double>> markups;
    markups = LocationModel.fetchLocation();
    List list = await markups;

    List<Placemark> placemark =
        await placemarkFromCoordinates(list[0], list[1]);
    setState(() {
      locationVal = "${placemark.reversed.last.locality}";
    });
  }

//   void fetchLocation() async {
//     double lat;
//     double lon;

//     LocationPermission permission = await Geolocator.checkPermission();
//     if (permission == LocationPermission.denied ||
//         permission == LocationPermission.deniedForever) {
//       locationVal = "Location Denied";
//       LocationPermission ask = await Geolocator.requestPermission();
//     } else {
//       Position currentPos = await Geolocator.getCurrentPosition(
//           desiredAccuracy: LocationAccuracy.best);
//       lat = currentPos.latitude;
//       lon = currentPos.longitude;
//       setState(() {
//         locationVal = "$lat and $lon";
//       });
//     }
//   }
}
