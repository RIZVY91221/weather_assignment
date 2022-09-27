import 'package:get/get.dart';
import 'package:weather_assignment/features/weather/domain/repositories/weather_repository.dart';

import '../features/weather/data/repository/weather_repository_impl.dart';

class RepositoryBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherRepository>(
          () => WeatherRepositoryImpl(),
      tag: (WeatherRepository).toString(),
      fenix: true,
    );
  }
}