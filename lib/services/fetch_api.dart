import 'dart:convert';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/models/weather_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  static Future<WeatherModel> fetchApi() async {
    Future<List<double>> markups;
    markups = LocationModel.fetchLocation();
    List list = await markups;
    double lat = list[0];
    double lon = list[1];

    final url =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=a6d17f1d1fe4a17be3592c8e851d1dfc";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    final body = response.body;
    final json = jsonDecode(body);
    //final mainData = json['main'];

    //* EUREKAAAAAAAAAAAAAAA

    final weatherModel = WeatherModel.fromMap(json);
    return weatherModel;
    // final results = json['main'];

    // print(results.runtimeType);
    // final transformed = results.map((e) {
    //   return WeatherModel.fromMap(e);
    // }).toList();

    // print("fetchUser function released.");
    // return transformed;
  }
}
