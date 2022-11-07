import 'package:get/get.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/bindings/order_details_bindings.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/bindings/weather_home_bindings.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/pages/order_details_page.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/pages/weather_home_page.dart';

class AppRoutes {
  static const String homePage = '/home';
  static const String details = '/order_details';

  static  List<GetPage>pageList = [
    GetPage(
        name: AppRoutes.homePage,
        page: () => OrderListPage(),
        binding: WeatherHomeBindings()
    ),
    GetPage(
        name: AppRoutes.details,
        page: () => OrderDetails(),
        binding: OrderDetailsBindings()
    ),
  ];

}