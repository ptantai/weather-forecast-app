import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_forecast_app/data/entity/weather.dart';

part 'weather_api.g.dart';

@RestApi(baseUrl: 'https://api.weatherapi.com/v1/')
abstract class WeatherApi {
  factory WeatherApi(Dio dio, {String baseUrl}) = _WeatherApi;

  @GET('/current.json')
  Future<WeatherResponse> getCurrentWeather(@Query('q') String params);
}
