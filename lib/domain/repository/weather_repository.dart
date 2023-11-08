import 'package:weather_forecast_app/domain/entity/weather.dart';

abstract class WeatherRepository {
  Future<Weather> getWeather(String params);
}
