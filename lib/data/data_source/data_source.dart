import 'package:weather_forecast_app/application.dart';
import 'package:weather_forecast_app/data/entity/weather.dart';

import 'weather_api.dart';

abstract class DataSources {
  Future<WeatherResponse> getCurrentWeather(String params);
}

class DataSourcesImpl implements DataSources {
  final apiClient = getIt.get<WeatherApi>();

  @override
  Future<WeatherResponse> getCurrentWeather(String params) async {
    return apiClient.getCurrentWeather(params);
  }
}
