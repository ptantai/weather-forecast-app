import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherResponse {
  final LocationResponse? location;
  final CurrentResponse? current;

  WeatherResponse({
    required this.location,
    required this.current,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class CurrentResponse {
  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final int? tempC;
  final double? tempF;
  final int? isDay;
  final ConditionResponse? condition;

  CurrentResponse({
    required this.lastUpdatedEpoch,
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.isDay,
    required this.condition,
  });
  factory CurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ConditionResponse {
  final String? text;
  final String? icon;
  final int? code;

  ConditionResponse({
    required this.text,
    required this.icon,
    required this.code,
  });
  factory ConditionResponse.fromJson(Map<String, dynamic> json) =>
      _$ConditionResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionResponseToJson(this);
}

@JsonSerializable(explicitToJson: true)
class LocationResponse {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  final String? tzId;

  LocationResponse({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
  });
  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
