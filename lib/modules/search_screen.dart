// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/network/http.dart';

// ignore: use_key_in_widget_constructors, must_be_immutable
class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0XFFFFAD3C),
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: searchController,
            decoration: const InputDecoration(
              label: Text(
                'Search',
              ),
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.search),
            ),
            onSubmitted: (value) async {
              cityName = value;
              WeatherModel weather =
                  await WeatherHttp().getWeather(cityName: cityName!);
              WeatherProvider.get(context, false).weatherData = weather;
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}
