import 'package:weather_assignment/core/usecases/param_usecase.dart';
import 'package:weather_assignment/features/weather/data/model/weather_model.dart';
import 'package:weather_assignment/features/weather/domain/repositories/weather_repository.dart';

class WeatherUseCase implements ParamUseCase<List<Weather>,Params> {
  final WeatherRepository _repo;

  WeatherUseCase(this._repo);

  @override
  Future<List<Weather>> execute(Params params)  {
    return  _repo.getWeatherList(params.city);
  }
}
class Params {
  final String city;

  Params({required this.city});
}