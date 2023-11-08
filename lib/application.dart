import 'package:get_it/get_it.dart';
import 'package:weather_forecast_app/data/data_source/data_source.dart';
import 'package:weather_forecast_app/data/data_source/weather_api.dart';
import 'package:weather_forecast_app/data/repository/weather_repository.dart';
import 'package:weather_forecast_app/data/services/dio/dio_client.dart';
import 'package:weather_forecast_app/domain/usecase/get_weather_usecase.dart';
import 'package:weather_forecast_app/presentation/weather_screen/bloc/weather_bloc.dart';
import 'package:weather_forecast_app/utilities/constants.dart';

final getIt = GetIt.instance;

class WeatherApplication {
  static void configure() {
    final dioClient =
        DioClient(baseUrl: Constants.baseUrl, apiKey: Constants.apiKey);
    getIt.registerSingleton<DioClient>(dioClient);

    getIt.registerSingleton<WeatherApi>(WeatherApi(dioClient));

    getIt.registerLazySingleton(() => DataSourcesImpl(getIt.get()));

    getIt.registerLazySingleton(
        () => WeatherRepositoryImpl(getIt.get<DataSourcesImpl>()));

    getIt.registerSingleton(
        GetWeatherUseCase(getIt.get<WeatherRepositoryImpl>()));

    getIt.registerFactory(() => WeatherBloc(getIt.get()));
  }
}
