import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_assignment/core/base/base_controller.dart';
import 'package:weather_assignment/features/weather/data/model/weather_model.dart';
import 'package:weather_assignment/features/weather/domain/usecases/weather_usecase.dart';

import '../../../../../core/base/paging_controller.dart';

class WeatherHomeController extends BaseController{
  final WeatherUseCase _weatherUseCase;

  WeatherHomeController(this._weatherUseCase);

  TextEditingController cityController=TextEditingController();
  var cityName=''.obs;
  int nextDayHour = 0;
  int forecastResultsCount = 5;
  int hoursNextDay = 0;
  var currTime = DateTime.now().hour;
  List hoursList=List.empty(growable: true);
  //final RxList hoursListRx = RxList.empty(growable: true);
  final RxList<Weather> _weatherListController = RxList.empty();

  List<Weather> get getWeatherList => _weatherListController.toList();
  //List get hoursList  => hoursListRx.toList();

  final pagingController = PagingController<Weather>();

  void getWeatherListFunction() {
    if (!pagingController.canLoadNextPage()) return;

    pagingController.isLoadingPage = true;
    Params params;

    if(cityController.text.isEmpty){
      cityName.value="Dhaka";
      params=Params(city: "Dhaka");
    }else{
      params=Params(city: cityController.text);
      cityName.value=cityController.text;
    }
    debugPrint(params.city);

    var weatherDataListService = _weatherUseCase.execute(params);

    callDataService(
      weatherDataListService,
      onSuccess: _handleProjectListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  void _handleProjectListResponseSuccess(List<Weather> response) {
    List<Weather>? _weatherList=List<Weather>.empty(growable: true);
    int j = 0;
    for(int i=0;i<response.length;i++){
      _weatherList.add(response[i]);
    }
    for (var i = currTime; i < 24; i++) {
      hoursList.add(i);
    }
    while (j < forecastResultsCount) {
      if (currTime >= 23) {
        hoursList.add(hoursNextDay);
        hoursNextDay++;
        currTime++;
      }
      currTime++;
      j++;
    }

    if (_isLastPage(_weatherList.length, response.length)) {
      pagingController.appendLastPage(_weatherList);
    } else {
      pagingController.appendPage(_weatherList);
    }

    var newList = [...pagingController.listItems];

    _weatherListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (getWeatherList.length + newListItemCount) >= totalCount;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getWeatherListFunction();
  }
  onLoadNextPage() {
    logger.i("On load next");

    getWeatherListFunction();
  }
}