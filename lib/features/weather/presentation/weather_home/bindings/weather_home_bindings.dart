import 'package:get/get.dart';
import 'package:weather_assignment/features/weather/domain/repositories/weather_repository.dart';
import 'package:weather_assignment/features/weather/domain/usecases/weather_usecase.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/weather_home_controller.dart';

class WeatherHomeBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<WeatherUseCase>(() => WeatherUseCase(Get.find(tag: (WeatherRepository).toString())));
    Get.lazyPut<WeatherHomeController>(
          () => WeatherHomeController(Get.find()),
      fenix: true,
    );
  }

}