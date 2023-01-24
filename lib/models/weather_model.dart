import 'package:flutter/material.dart';

class WeatherModel {
  Location? location;
  Forecast? forecast;
  WeatherModel({this.location, this.forecast});
  WeatherModel.fromJson(Map<String, dynamic> json) {
    location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }
}

class Location {
  String? name;
  String? localtime;

  Location({this.name, this.localtime});

  Location.fromJson(Map<String, dynamic> json) {
    name = json['name'];

    localtime = json['localtime'];
  }
}

class Condition {
  String? text;
  Condition({this.text});
  Condition.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  String getImage() {
    if (text == 'Sunny' || text == 'Clear' || text == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (text == 'Blizzard' ||
        text == 'Patchy snow possible' ||
        text == 'Patchy sleet possible' ||
        text == 'Patchy freezing drizzle possible' ||
        text == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (text == 'Freezing fog' ||
        text == 'Fog' ||
        text == 'Heavy Cloud' ||
        text == 'Mist' ||
        text == 'Fog') {
      return 'assets/images/cloudy.png';
    } else if (text == 'Patchy rain possible' ||
        text == 'Heavy Rain' ||
        text == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (text == 'Thundery outbreaks possible' ||
        text == 'Moderate or heavy snow with thunder' ||
        text == 'Patchy light snow with thunder' ||
        text == 'Moderate or heavy rain with thunder' ||
        text == 'Patchy light rain with thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getThemeColor() {
    if (text == 'Sunny' || text == 'Clear' || text == 'partly cloudy') {
      return Colors.orange;
    } else if (text == 'Blizzard' ||
        text == 'Patchy snow possible' ||
        text == 'Patchy sleet possible' ||
        text == 'Patchy freezing drizzle possible' ||
        text == 'Blowing snow') {
      return Colors.blue;
    } else if (text == 'Freezing fog' ||
        text == 'Fog' ||
        text == 'Heavy Cloud' ||
        text == 'Mist' ||
        text == 'Fog') {
      return Colors.blueGrey;
    } else if (text == 'Patchy rain possible' ||
        text == 'Heavy Rain' ||
        text == 'Showers	') {
      return Colors.blue;
    } else if (text == 'Thundery outbreaks possible' ||
        text == 'Moderate or heavy snow with thunder' ||
        text == 'Patchy light snow with thunder' ||
        text == 'Moderate or heavy rain with thunder' ||
        text == 'Patchy light rain with thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}

class Forecast {
  List<Forecastday>? forecastday;
  Forecast({this.forecastday});
  Forecast.fromJson(Map<String, dynamic> json) {
    if (json['forecastday'] != null) {
      forecastday = <Forecastday>[];
      json['forecastday'].forEach((v) {
        forecastday!.add(Forecastday.fromJson(v));
      });
    }
  }
}

class Forecastday {
  String? date;
  Day? day;
  Forecastday({
    this.date,
    this.day,
  });
  Forecastday.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
  }
}

class Day {
  double? maxtempC;
  double? mintempC;
  double? avgtempC;
  Condition? condition;
  Day({this.maxtempC, this.mintempC, this.avgtempC, this.condition});
  Day.fromJson(Map<String, dynamic> json) {
    maxtempC = json['maxtemp_c'];
    mintempC = json['mintemp_c'];
    avgtempC = json['avgtemp_c'];
    condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
  }
}
