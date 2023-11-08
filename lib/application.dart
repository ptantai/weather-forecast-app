import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/data/data_source/weather_api.dart';
import 'package:weather_forecast_app/data/services/dio/dio_client.dart';
import 'package:weather_forecast_app/utilities/constants.dart';

final getIt = GetIt.instance;

class WeatherApplication {
  static Future<void> configure() async {
    final dioClient =
        DioClient(baseUrl: Constants.baseUrl, apiKey: Constants.apiKey);
    getIt.registerSingleton<DioClient>(dioClient);
    getIt.registerFactory<WeatherApi>(() => WeatherApi(dioClient));
  }
}
