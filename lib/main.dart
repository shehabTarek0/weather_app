import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/layout/weather_layout_screen.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeatherProvider(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500),
            actionsIconTheme: IconThemeData(color: Colors.white),
          ),
          primarySwatch: WeatherProvider.get(context, true).weatherData == null
              ? Colors.blue
              : WeatherProvider.get(context, true)
                  .weatherData!
                  .forecast!
                  .forecastday![0]
                  .day!
                  .condition!
                  .getThemeColor(),
        ),
        home: WeatherLayoutScreen(),
      ),
    );
  }
}
