import 'package:get/get.dart';
import 'package:weather_assignment/core/base/base_controller.dart';
import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/features/weather/domain/usecases/weather_usecase.dart';

import '../../../../../core/base/paging_controller.dart';



class WeatherHomeController extends BaseController{
  final WeatherUseCase _weatherUseCase;

  WeatherHomeController(this._weatherUseCase);
  final RxList<OrderModel> _orderListListController = RxList.empty();

  List<OrderModel> get getOrderList => _orderListListController.toList();

  final pagingController = PagingController<OrderModel>();

  void getOrderListService() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;


    var orderListService = _weatherUseCase.execute();

    callDataService(
      orderListService,
      onSuccess: _handleOrderListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  void _handleOrderListResponseSuccess(List<OrderModel> response) {
    List<OrderModel>? orderList = response
        .map((e) => OrderModel.fromJson(e.toJson()))
        .toList();

    if (_isLastPage(orderList.length, response.length)) {
      pagingController.appendLastPage(orderList);
    } else {
      pagingController.appendPage(orderList);
    }

    var newList = [...pagingController.listItems];

    _orderListListController(newList);
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getOrderListService();
  }
  onLoadNextPage() {
    logger.i("On load next");

    getOrderListService();
  }
  bool _isLastPage(int newListItemCount, int totalCount) {
    return (getOrderList.length + newListItemCount) >= totalCount;
  }

}