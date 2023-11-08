import 'package:weather_forecast_app/data/data_source/data_source.dart';
import 'package:weather_forecast_app/data/entity/weather.dart';
import 'package:weather_forecast_app/domain/entity/weather.dart';
import 'package:weather_forecast_app/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final DataSources dataSources;
  WeatherRepositoryImpl(this.dataSources);

  @override
  Future<Weather> getWeather(String params) async {
    final data = await dataSources.getCurrentWeather(params);
    return Weather(
      current: _mapCurrentWeather(data.current),
      location: _mapLocationWeather(data.location),
    );
  }

  Current _mapCurrentWeather(CurrentResponse? current) {
    return Current(
      tempF: current?.tempF,
      tempC: current?.tempC,
      isDay: current?.isDay,
      condition: _mapConditionResponse(current?.condition),
      lastUpdated: current?.lastUpdated,
      lastUpdatedEpoch: current?.lastUpdatedEpoch,
    );
  }

  Location _mapLocationWeather(LocationResponse? location) {
    return Location(
      country: location?.country,
      lat: location?.lat,
      lon: location?.lon,
      name: location?.name,
      region: location?.region,
      tzId: location?.tzId,
      localtime: location?.localtime,
      localtimeEpoch: location?.localtimeEpoch,
    );
  }

  Condition _mapConditionResponse(ConditionResponse? condition) {
    return Condition(
      code: condition?.code,
      icon: condition?.icon,
      text: condition?.text,
    );
  }
}
