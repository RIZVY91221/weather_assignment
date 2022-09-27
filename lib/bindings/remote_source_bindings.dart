
import 'package:get/get.dart';

import '../features/weather/data/datasource/weather_remote_datasource.dart';

class RemoteSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherRemoteDataSource>(
          () => WeatherRemoteDataSourceImpl(),
      tag: (WeatherRemoteDataSource).toString(),
      fenix: true,
    );
  }
}