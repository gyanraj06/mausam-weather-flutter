import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:mausam/models/location_model.dart';

class HeaderCard extends StatefulWidget {
  const HeaderCard({super.key});

  @override
  State<HeaderCard> createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  ///*date time
  DateTime now = DateTime.now();
  late String day;
  late String month;

  String city = "";

  @override
  void initState() {
    super.initState();
    getDayOfWeek();
    getMonth();
    getCity();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/logos/logo_white.png"),
        Text(
          city,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Text(
          "$day, ${now.day}th $month, ${now.year}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  void getDayOfWeek() {
    List<String> daysOfWeek = [
      "",
      "Mon",
      "Tue",
      "Wed",
      "Thu",
      "Fri",
      "Sat",
      "Sun"
    ];
    day = daysOfWeek[now.weekday];
  }

  void getMonth() {
    List<String> months = [
      "",
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
    ];
    month = months[now.month];
  }

  Future<void> getCity() async {
    Future<List<double>> markups;
    markups = LocationModel.fetchLocation();
    List list = await markups;

    List<Placemark> placemark =
        await placemarkFromCoordinates(list[0], list[1]);
    setState(() {
      city = "${placemark.reversed.last.locality}";
    });
  }
}
