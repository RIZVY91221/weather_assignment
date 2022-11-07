import 'package:weather_assignment/core/models/order_model.dart';
import 'package:weather_assignment/core/usecases/param_usecase.dart';
import 'package:weather_assignment/features/weather/domain/repositories/weather_repository.dart';

import '../../../../core/usecases/no_params_usecase.dart';

class WeatherUseCase implements NoParamUseCase<OrderModel> {
  final WeatherRepository _repo;

  WeatherUseCase(this._repo);

  @override
  Future<OrderModel> execute() {
    return _repo.getOrderResponse();
  }

}
class Params {
  final String city;

  Params({required this.city});
}