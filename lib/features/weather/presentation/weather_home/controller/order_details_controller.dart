import 'package:get/get.dart';
import 'package:weather_assignment/core/models/order_model.dart';

class OrderDetailsController extends GetxController{
  var item=OrderModel().obs;
  @override
  void onInit() {
    item.value=Get.arguments as OrderModel;
    super.onInit();
  }
}