// ignore_for_file: unused_local_variable, avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

// https://api.weatherapi.com/v1/forecast.json?key=4edcfb8df30e4ca984e64050231601&q=giza&days=5&aqi=no&alerts=no
class WeatherHttp {
  Future<WeatherModel> getWeather({required String cityName}) async {
    String baseUrl = 'http://api.weatherapi.com/v1';
    String apiKey = '4edcfb8df30e4ca984e64050231601';
    Uri url = Uri.parse(
        '$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=3&aqi=no&alerts=no');
    http.Response response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    print(data);
    WeatherModel weather = WeatherModel.fromJson(data);
    print(weather.forecast!.forecastday![0].day!.maxtempC);
    print(weather.forecast!.forecastday![0].day!.avgtempC);
    print(weather.forecast!.forecastday![0].day!.mintempC);
    print(weather.location!.localtime!
        .substring(weather.location!.localtime!.indexOf(' ')));
    // print(weather.location!.name);
    print(weather.forecast!.forecastday![0].day!.condition!.text);
    return weather;
  }
}
