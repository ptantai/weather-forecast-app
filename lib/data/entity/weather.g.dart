// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherResponse _$WeatherResponseFromJson(Map<String, dynamic> json) =>
    WeatherResponse(
      location: json['location'] == null
          ? null
          : LocationResponse.fromJson(json['location'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : CurrentResponse.fromJson(json['current'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WeatherResponseToJson(WeatherResponse instance) =>
    <String, dynamic>{
      'location': instance.location?.toJson(),
      'current': instance.current?.toJson(),
    };

CurrentResponse _$CurrentResponseFromJson(Map<String, dynamic> json) =>
    CurrentResponse(
      lastUpdatedEpoch: json['lastUpdatedEpoch'] as int?,
      lastUpdated: json['lastUpdated'] as String?,
      tempC: json['tempC'] as int?,
      tempF: (json['tempF'] as num?)?.toDouble(),
      isDay: json['isDay'] as int?,
      condition: json['condition'] == null
          ? null
          : ConditionResponse.fromJson(
              json['condition'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CurrentResponseToJson(CurrentResponse instance) =>
    <String, dynamic>{
      'lastUpdatedEpoch': instance.lastUpdatedEpoch,
      'lastUpdated': instance.lastUpdated,
      'tempC': instance.tempC,
      'tempF': instance.tempF,
      'isDay': instance.isDay,
      'condition': instance.condition?.toJson(),
    };

ConditionResponse _$ConditionResponseFromJson(Map<String, dynamic> json) =>
    ConditionResponse(
      text: json['text'] as String?,
      icon: json['icon'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$ConditionResponseToJson(ConditionResponse instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };

LocationResponse _$LocationResponseFromJson(Map<String, dynamic> json) =>
    LocationResponse(
      name: json['name'] as String?,
      region: json['region'] as String?,
      country: json['country'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
      tzId: json['tzId'] as String?,
    );

Map<String, dynamic> _$LocationResponseToJson(LocationResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tzId': instance.tzId,
    };
