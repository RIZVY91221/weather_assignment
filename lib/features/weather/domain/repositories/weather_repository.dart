import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/features/weather/data/model/weather_model.dart';

abstract class WeatherRepository{
  Future<OrderModel>getOrderResponse();
}