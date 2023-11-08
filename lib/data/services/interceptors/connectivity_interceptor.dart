import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkInterceptor extends Interceptor {
  Connectivity connectivity;
  NetworkInterceptor(this.connectivity) : super();

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var connectivityResult = await (connectivity.checkConnectivity());
    if (!kDebugMode && connectivityResult == ConnectivityResult.none) {
      return handler.reject(OfflineError(requestOptions: options));
    }
    return handler.next(options);
  }
}

class OfflineError extends DioException {
  OfflineError({required RequestOptions requestOptions, response})
      : super(
          requestOptions: requestOptions,
          type: DioExceptionType.connectionError,
          message: 'No Connection!',
        );
}
