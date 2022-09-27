import 'package:flutter/material.dart';

import '../values/app_colors.dart';
import 'eleveted_container.dart';
class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: ElevatedContainer(
        padding: EdgeInsets.all(8),
        child: CircularProgressIndicator(
          color: AppColors.colorPrimary,
        ),
      ),
    );
  }
}