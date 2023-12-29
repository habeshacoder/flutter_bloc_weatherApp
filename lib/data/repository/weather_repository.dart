import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/secrets.dart';
import "package:http/http.dart" as http;

class WeatherRepository {
  final WeatherDatProvider? weatherDataProvider;
  WeatherRepository({this.weatherDataProvider});
  //
  Future<WeatherModel> getCurrentWeather() async {
    try {
      String cityName = 'London';
      final res = await weatherDataProvider!.getCurrentWeather(cityName);

      final data = jsonDecode(res);

      if (data['cod'] != '200') {
        throw 'An unexpected error occurred';
      }

      return WeatherModel.fromMap(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
