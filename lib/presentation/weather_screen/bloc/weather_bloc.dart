import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_forecast_app/domain/entity/weather.dart';
import 'package:weather_forecast_app/domain/usecase/get_weather_usecase.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetWeatherUseCase getWeatherUseCase;

  WeatherBloc(this.getWeatherUseCase) : super(WeatherInitial()) {
    on<OnLocationChanged>((event, emit) async {
      try {
        emit(LoadingState());
        final searchKey = event.value;
        final data = await getWeatherUseCase.getCurrentWeather(searchKey);
        emit(LoadWeatherDone(data));
      } catch (error) {
        emit(FailureState(error.toString()));
      }
    });
  }
}
