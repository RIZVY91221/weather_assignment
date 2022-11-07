import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/preferred_size.dart';
import 'package:weather_assignment/core/base/base_view.dart';
import 'package:weather_assignment/core/widget/appbar_title.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/weather_home_controller.dart';

class OrderHomePage extends BaseView<WeatherHomeController>{
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      title: const AppBarTitle(text: "Order Details",),
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemBuilder: (context,int i){
            return ListTile(
              title: Text(controller.orderModel.value.data![i].order!.orderId.toString()),
              subtitle: Column(
                children: [
                  Text(controller.orderModel.value.data![i].order!.createdAt.toString()),
                  Text(controller.orderModel.value.data![i].order!.subtotal.toString())
                ],
              ),

            );
          },
        itemCount: controller.orderModel.value.data!.length,
      ),
    );
  }

}