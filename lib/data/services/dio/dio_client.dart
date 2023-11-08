import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:weather_forecast_app/data/services/interceptors/connectivity_interceptor.dart';

class DioClient extends DioForNative {
  final String baseUrl;
  final String apiKey;
  DioClient({
    required this.baseUrl,
    required this.apiKey,
  }) {
    interceptors.addAll([
      // listing all interceptors
      NetworkInterceptor(Connectivity())
    ]);
    options = BaseOptions(baseUrl: baseUrl, headers: {'key': apiKey});
  }
}
