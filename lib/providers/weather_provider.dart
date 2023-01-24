import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherProvider extends ChangeNotifier {
  static WeatherProvider get(context, bool listen) =>
      Provider.of<WeatherProvider>(context, listen: listen);
  WeatherModel? _weatherData;
  set weatherData(WeatherModel? weather) {
    _weatherData = weather;
    notifyListeners();
  }

  // ignore: unnecessary_getters_setters
  WeatherModel? get weatherData => _weatherData;
}
