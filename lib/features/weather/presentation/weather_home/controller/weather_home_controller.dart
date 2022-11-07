import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_assignment/core/base/base_controller.dart';
import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/features/weather/domain/usecases/weather_usecase.dart';



class WeatherHomeController extends BaseController{
  final WeatherUseCase _weatherUseCase;

  WeatherHomeController(this._weatherUseCase);
  var orderModel=OrderModel().obs;

  void getWeatherListFunction() {

    var weatherDataListService = _weatherUseCase.execute();

    callDataService(
      weatherDataListService,
      onSuccess: _handleProjectListResponseSuccess,
    );
  }

  void _handleProjectListResponseSuccess(OrderModel response) {
    debugPrint(response.toString());
    orderModel.value=response;
  }

}