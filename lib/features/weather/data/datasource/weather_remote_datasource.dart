import 'package:dio/dio.dart';
import 'package:weather_assignment/features/weather/data/model/weather_model.dart';

import '../../../../core/base/base_remote_source.dart';
import '../../../../core/network/dio_provider.dart';

abstract class WeatherRemoteDataSource{
  Future<List<Weather>>getWeatherList(String city);

}
class WeatherRemoteDataSourceImpl extends BaseRemoteSource implements WeatherRemoteDataSource{
  @override
  Future<List<Weather>> getWeatherList(String city) {
    var endpoint = "${DioProvider.baseUrl}forecast.json";
    var dioCall = dioClient.get(endpoint,queryParameters: {
     'q':city,
      'days':3
    },
      options:Options(headers: {
        'x-rapidapi-host':'weatherapi-com.p.rapidapi.com',
        'x-rapidapi-key':'e214152c05msh246a6bbab968304p1cbb77jsn410c979554d0'
      })
    );

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) =>_parseWeatherListResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  List<Weather> _parseWeatherListResponse(Response<dynamic> response) =>(response.data['forecast']['forecastday'] as List)
      .map((x) => Weather.fromJson(x))
      .toList();

}
