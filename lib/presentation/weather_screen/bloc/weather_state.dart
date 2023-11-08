part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

class WeatherInitial extends WeatherState {}

class LoadingState extends WeatherState {}

class FailureState extends WeatherState {
  final String errorMessage;
  FailureState(this.errorMessage);
}

class LoadWeatherDone extends WeatherState {
  final Weather result;

  LoadWeatherDone(this.result);
}
