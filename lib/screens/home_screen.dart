import 'package:flutter/material.dart';
import 'package:mausam/models/weather_model.dart';
import 'package:mausam/services/fetch_api.dart';
import 'package:mausam/widget/header_card.dart';
import 'package:mausam/widget/seperate_info.dart';
import 'package:mausam/widget/temp_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherModel temp_today;

  double temperature = 0;
  double high_today = 0;
  double low_today = 0;
  double feels_like = 0;

  double speed = 0;
  int humidity = 0;
  int pressure = 0;
  int visibility = 0;

  String description = "";

  @override
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF161618),
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  height: 32,
                  width: 32,
                  child: Image.asset(
                    "assets/logos/logo_white.png",
                  ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Text(
                  "Mausam",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
            const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const HeaderCard(),
          TempCard(
            temperature: temperature,
            high_today: high_today,
            low_today: low_today,
            feels_like: feels_like,
            description: description,
          ),
          const SizedBox(height: 20),
          SeperateInfo(
            humidity: humidity,
            pressure: pressure,
            speed: speed,
            visibility: visibility,
          ),
          const SizedBox(height: 20),
          Container(
            height: 10,
          )
        ],
      ),
    );
  }

  Future<void> fetchUser() async {
    final response = await UserApi.fetchApi();
    setState(
      () {
        temp_today = response;
        temperature =
            double.parse((temp_today.temp - 273.15).toStringAsFixed(2));

        high_today =
            double.parse((temp_today.temp_max - 273.15).toStringAsFixed(2));
        low_today =
            double.parse((temp_today.temp_min - 273.15).toStringAsFixed(2));
        feels_like =
            double.parse((temp_today.feels_like - 273.15).toStringAsFixed(2));

        speed = temp_today.speed;
        pressure = temp_today.pressure;
        humidity = temp_today.humidity;
        visibility = temp_today.visibility;
        description = temp_today.description;
      },
    );
  }
}
