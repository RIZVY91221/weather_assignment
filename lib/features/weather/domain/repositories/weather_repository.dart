import 'package:weather_assignment/features/weather/data/model/weather_model.dart';

abstract class WeatherRepository{
  Future<List<Weather>>getWeatherList(String city);
}