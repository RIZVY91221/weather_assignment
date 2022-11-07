import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/weather_home_controller.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/pages/order_details_page.dart';

import '../../../../../core/base/base_view.dart';
import '../../../../../core/values/app_colors.dart';
import '../../../../../core/values/app_values.dart';
import '../../../../../core/widget/custom_app_bar.dart';
import '../../../../../core/widget/pagging_view.dart';

class OrderListPage extends BaseView<WeatherHomeController> {
  OrderListPage() {
    controller.getOrderListService();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.blue.shade100,
      title: const Text("Order List",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.15,
          color: Colors.black
      ),),
    );
  }

  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding: const EdgeInsets.all(AppValues.padding),
        child: Obx(
              () =>
              ListView.separated(
                shrinkWrap: true,
                itemCount: controller.getOrderList.length,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var model = controller.getOrderList[index];

                  return leaveApproveListTile(context, model);
                },
                separatorBuilder: (BuildContext context, int index) =>
                const Divider(color: AppColors.lightGreyColor,),
              ),
        ),
      ),
    );
  }

  Widget leaveApproveListTile(BuildContext context, OrderModel item) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7.0),
        color: AppColors.kBgLightColor,
      ),
      child: Card(
          elevation: 0.0,
          child: ListTile(
            onTap: ()=>Get.toNamed('/order_details',arguments: item),
            title: Text(item.order!.orderNo.toString(),style: const TextStyle(fontWeight: FontWeight.w500,color: AppColors.colorDark,fontSize: 17),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10,),
                Text("Ordered: "+item.order!.createdAt.toString().split("T").first+" | "+item.order!.subtotal.toString() +"items"),
                const SizedBox(height: 3,),
                Text("TotalAmount: "+item.order!.total.toString() +" "+item.order!.orderCurrency!)
              ],
            ),
            trailing: const Icon(
              Icons.directions,color: Colors.blue,size: 18,
            ),
          )
      ),
    );
  }
}