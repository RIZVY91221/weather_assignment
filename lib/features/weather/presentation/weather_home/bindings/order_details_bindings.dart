import 'package:get/get.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/order_details_controller.dart';

class OrderDetailsBindings extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<OrderDetailsController>(
          () => OrderDetailsController(),
      fenix: true,
    );
  }

}