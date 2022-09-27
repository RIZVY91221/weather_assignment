import 'package:get/get.dart';

import '../features/weather/data/datasource/weather_local_datasource.dart';

class LocalSourceBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<WeatherLocalPreferenceManager>(
          () => HRISLocalPreferenceManagerImpl(),
      tag: (WeatherLocalPreferenceManager).toString(),
      fenix: true,
    );
  }
}