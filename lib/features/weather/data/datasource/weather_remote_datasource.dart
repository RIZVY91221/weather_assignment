import 'package:dio/dio.dart';

import '../../../../core/base/base_remote_source.dart';
import '../../../../core/models/order_model.dart';
import '../../../../core/network/dio_provider.dart';

abstract class WeatherRemoteDataSource{
  Future<OrderModel>getOrder();

}
class WeatherRemoteDataSourceImpl extends BaseRemoteSource implements WeatherRemoteDataSource{

  @override
  Future<OrderModel> getOrder() {

    var endpoint = "${DioProvider.baseUrl}view";
    var dioCall = dioClient.get(endpoint);
    try {
      return callApiWithErrorParser(dioCall)
          .then((response) =>_parseOrderResponse(response));
    } catch (e) {
      rethrow;
    }
  }

 OrderModel _parseOrderResponse(Response<dynamic> response) =>OrderModel.fromJson(response.data);


}
