import 'package:get/get.dart';
import 'package:weather_assignment/core/utils/custom_snackbar.dart';
import 'package:weather_assignment/features/weather/data/model/weather_model.dart';
import 'package:weather_assignment/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/controller/internet_connection_controller.dart';
import '../datasource/weather_local_datasource.dart';
import '../datasource/weather_remote_datasource.dart';

class WeatherRepositoryImpl implements WeatherRepository{
  WeatherRemoteDataSource remoteSource = Get.find(tag: (WeatherRemoteDataSource).toString());
  WeatherLocalPreferenceManager localSource = Get.find(tag: (WeatherLocalPreferenceManager).toString());
  ConnectionManagerController networkCheck = Get.find(tag: (ConnectionManagerController).toString());


  @override
  Future<List<Weather>> getWeatherList(String city){
    return remoteSource.getWeatherList(city);
  }

}