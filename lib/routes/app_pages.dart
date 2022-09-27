import 'package:get/get.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/bindings/weather_home_bindings.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/pages/weather_home_page.dart';

class AppRoutes {
  static const String homePage = '/home';

  static  List<GetPage>pageList = [
    GetPage(
        name: AppRoutes.homePage,
        page: () => WeatherHomePage(),
        binding: WeatherHomeBindings()
    ),
  ];

}