import 'package:weather_forecast_app/domain/entity/weather.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

class GetWeatherUseCase {
  final WeatherRepository weatherRepository;

  GetWeatherUseCase(this.weatherRepository);

  Future<Weather> getCurrentWeather(String params) {
    return weatherRepository.getWeather(params);
  }
}
