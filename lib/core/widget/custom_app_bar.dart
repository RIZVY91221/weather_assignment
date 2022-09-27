import 'package:flutter/material.dart';


import '../values/app_colors.dart';

import 'appbar_title.dart';
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String appBarTitleText;
  final List<Widget>? actions;
  final bool isBackButtonEnabled;
  final VoidCallback? onPress;

  CustomAppBar({
    Key? key,
    required this.appBarTitleText,
    this.actions,
    this.onPress,
    this.isBackButtonEnabled = true,
  }) : super(key: key);

  @override
  Size get preferredSize => AppBar().preferredSize;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appBarColor,
      centerTitle: true,
      elevation: 0,
      automaticallyImplyLeading: isBackButtonEnabled,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.appBarIconColor),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          AppBarTitle(text: appBarTitleText,),
        ],
      ),
      leading: !isBackButtonEnabled?IconButton(onPressed:onPress,icon: const Icon(Icons.arrow_back),):null,
    );
  }
}