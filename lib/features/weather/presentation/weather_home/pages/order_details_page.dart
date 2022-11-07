import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/core/values/app_colors.dart';
import 'package:weather_assignment/core/widget/appbar_title.dart';
import 'package:weather_assignment/features/weather/presentation/weather_home/controller/order_details_controller.dart';

class OrderDetails extends GetView<OrderDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.blue.shade100,
        title: const Text("Order Details",style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          height: 1.15,
          color: Colors.black
        ),),
      ),
      backgroundColor: Colors.blue.shade100,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
                color: Colors.white
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(child: itemTile("Total Amount",controller.item.value.order!.total.toString())),
                    Expanded(child: itemTile("Total Quantity",controller.item.value.order!.additional!.lineItemsTotalQty.toString())),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 35,
                  color: Colors.grey.shade100,
                  child: const Padding(
                    padding: EdgeInsets.only(top: 10.0,left: 10),
                    child: Text("ORDER SUMMARY",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
                  )
                ),
                const SizedBox(height: 10,),
                itemTile("Order No",controller.item.value.order!.orderNo.toString()),
                itemTile("Ordered",controller.item.value.order!.createdAt!.split("T").first),
                itemTile("Payment Type",controller.item.value.order!.paymentStatus),
                itemTile("Store Name",controller.item.value.order!.additional!.store!.platformName),
                itemTile("Shop Name",controller.item.value.order!.additional!.store!.shopName),
                itemTile("Shop Name",controller.item.value.order!.additional!.store!.shopName),
                itemTile("Shipping Type",controller.item.value.fulfilmentOrder!.shippingMethod??"_"),
                itemTile("Remarks",controller.item.value.fulfilmentOrder!.remarks ?? '-'),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget itemTile(String name,value){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500,color: AppColors.textColorBlueGreyDark),),
          const SizedBox(height: 8,),
          Text(value,style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold,color: AppColors.colorDark),),
          const SizedBox(height: 2,),
          const Divider(color: AppColors.lightGreyColor,)
        ],
      ),
    );
  }
}
