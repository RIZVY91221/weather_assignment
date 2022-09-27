import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/app_colors.dart';

showSnackBar(String? title, String? message, {Color ? backgroundColor=AppColors.lightGreyColor,Color? textColor=AppColors.colorDark}) {
  Get.snackbar(title!, message!,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: backgroundColor,
      colorText: textColor);
}