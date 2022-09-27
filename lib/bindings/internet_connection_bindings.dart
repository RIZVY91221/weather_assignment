import 'package:get/get.dart';

import '../core/controller/internet_connection_controller.dart';

class InternetConnectionBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ConnectionManagerController>(
          () => ConnectionManagerController(),
      tag: (ConnectionManagerController).toString(),
      fenix: true,
    );
  }
}