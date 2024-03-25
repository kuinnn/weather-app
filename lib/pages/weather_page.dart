import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_models.dart';
import 'package:weather_app/service/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
final _weatherService = WeatherService('d04629cfb9db83d015d41b7958d2a290');
Weather? _weather;

  // fetch weather
_fetchWeather() async {
  // get the current city
String cityName = await _weatherService.getCurrentCity();

  // get weather for city
try {
  final weather = await _weatherService.getWeather(cityName);
  setState ((){
    _weather = weather;
    });
  }

// any errors
catch (e) {
  print(e);
  }
}

  // weather animations

// initial state
@override
  void initState() {
    super.initState();

    // fetch weather on startup
    _fetchWeather();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}