// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/modules/search_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/shared/components/navigator.dart';

class WeatherLayoutScreen extends StatelessWidget {
  WeatherLayoutScreen({super.key});
  WeatherModel? weatherData;
  @override
  Widget build(BuildContext context) {
    weatherData = WeatherProvider.get(context, true).weatherData;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather',
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigatorto(
                context,
                SearchScreen(),
              );
            },
            icon: const Icon(Icons.search, size: 26),
          ),
        ],
      ),
      body: weatherData == null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'There is no weather 😔 start',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                Text(
                  'searching now 🔍',
                  style: TextStyle(
                    fontSize: 30,
                  ),
                )
              ],
            )
          : buildWeatherData(weatherData),
    );
  }
}

Widget buildWeatherData(WeatherModel? weatherData) => Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            weatherData!.forecast!.forecastday![0].day!.condition!
                .getThemeColor()[400]!,
            weatherData.forecast!.forecastday![0].day!.condition!
                .getThemeColor()[300]!,
            weatherData.forecast!.forecastday![0].day!.condition!
                .getThemeColor()[200]!,
            weatherData.forecast!.forecastday![0].day!.condition!
                .getThemeColor()[100]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const Spacer(
            flex: 2,
          ),
          Text(
            weatherData.location!.name!,
            style: const TextStyle(
              fontSize: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Updated at :${weatherData.location!.localtime!.substring(weatherData.location!.localtime!.indexOf(' '))}',
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                weatherData.forecast!.forecastday![0].day!.condition!
                    .getImage(),
              ),
              Text(
                '${weatherData.forecast!.forecastday![0].day!.avgtempC!.toInt()}',
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Max : ${weatherData.forecast!.forecastday![0].day!.maxtempC!.toInt()}',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Min :${weatherData.forecast!.forecastday![0].day!.mintempC!.toInt()} ',
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            weatherData.forecast!.forecastday![0].day!.condition!.text!,
            style: const TextStyle(
              fontSize: 35,
            ),
          ),
          const Spacer(
            flex: 4,
          ),
        ],
      ),
    );
