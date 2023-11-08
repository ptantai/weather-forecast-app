import 'package:json_annotation/json_annotation.dart';

part 'weather.g.dart';

@JsonSerializable()
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

@JsonSerializable()
class CurrentResponse {
  @JsonKey(name: 'last_updated_epoch')
  final double? lastUpdatedEpoch;
  @JsonKey(name: 'last_update')
  final String? lastUpdated;
  @JsonKey(name: 'temp_c')
  final double? tempC;
  @JsonKey(name: 'temp_f')
  final double? tempF;
  @JsonKey(name: 'is_day')
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

@JsonSerializable()
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

@JsonSerializable()
class LocationResponse {
  final String? name;
  final String? region;
  final String? country;
  final double? lat;
  final double? lon;
  @JsonKey(name: 'tz_id')
  final String? tzId;
  @JsonKey(name: 'localtime_epoch')
  final int? localtimeEpoch;
  final String? localtime;

  LocationResponse({
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
    required this.tzId,
    required this.localtimeEpoch,
    required this.localtime,
  });
  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);
}
