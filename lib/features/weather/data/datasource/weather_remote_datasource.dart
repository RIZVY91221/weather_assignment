import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/base/base_remote_source.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/network/dio_provider.dart';
import 'package:flutter/services.dart' show rootBundle;

abstract class WeatherRemoteDataSource{
  Future<List<OrderModel>>getOrder();

}
class WeatherRemoteDataSourceImpl extends BaseRemoteSource implements WeatherRemoteDataSource{

  @override
  Future<List<OrderModel>> getOrder() {

    //var endpoint = "${DioProvider.baseUrl}view";
    //var dioCall = dioClient.get(endpoint);
    String assetsPath='assets/orders.json';
    try {
   /*   return callApiWithErrorParser(dioCall)
          .then((response) => _parseOrderListResponse(response));*/
      return rootBundle.loadString(assetsPath)
          .then((jsonStr) {
        return _parseOrderListResponse(json.decode(jsonStr) as Map<String,dynamic>);
      } );
    } catch (e) {
      rethrow;
    }
  }

  List<OrderModel> _parseOrderListResponse(Map<String,dynamic> response) =>(response['data'] as List)
      .map((x) => OrderModel.fromJson(x))
      .toList();


}
