part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

class OnLocationChanged extends WeatherEvent {
  final String value;

  OnLocationChanged(this.value);
}
