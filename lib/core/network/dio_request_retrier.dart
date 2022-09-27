import 'package:dio/dio.dart';
import 'package:get/get.dart' as getx;
import 'package:weather_assignment/features/weather/data/datasource/weather_local_datasource.dart';

import 'dio_provider.dart';

class DioRequestRetrier {
  final dioClient = DioProvider.tokenClient;
  final RequestOptions requestOptions;

  final WeatherLocalPreferenceManager _preferenceManager =
      getx.Get.find(tag: (WeatherLocalPreferenceManager).toString());

  DioRequestRetrier({required this.requestOptions});

  Future<Response<T>> retry<T>() async {
    var header = await getCustomHeaders();

    return await dioClient.request(
      requestOptions.path,
      cancelToken: requestOptions.cancelToken,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      onReceiveProgress: requestOptions.onReceiveProgress,
      onSendProgress: requestOptions.onSendProgress,
      options: Options(headers: header, method: requestOptions.method),
    );
  }

  Future<Map<String, String>> getCustomHeaders() async {
    final String accessToken =
        await _preferenceManager.getString(WeatherLocalPreferenceManager.keyToken);
    var customHeaders = {'content-type': 'application/json'};
    if (accessToken.trim().isNotEmpty) {
      customHeaders.addAll({
        'Authorization': "Bearer $accessToken",
      });
    }

    return customHeaders;
  }
}
