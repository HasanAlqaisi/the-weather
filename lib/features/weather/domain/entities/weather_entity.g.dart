// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntity _$WeatherEntityFromJson(Map<String, dynamic> json) {
  return WeatherEntity(
    id: json['id'] as int,
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lon'] as num).toDouble(),
    timezone: json['timezone'] as String,
    timezoneOffset: json['timezoneOffset'] as int,
    current: Current.fromJson(json['current'] as Map<String, dynamic>),
    hourly: (json['hourly'] as List)
        .map((e) => Hourly.fromJson(e as Map<String, dynamic>))
        .toList(),
    daily: (json['daily'] as List)
        .map((e) => Daily.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WeatherEntityToJson(WeatherEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezoneOffset': instance.timezoneOffset,
      'current': instance.current.toJson(),
      'hourly': instance.hourly.map((e) => e.toJson()).toList(),
      'daily': instance.daily.map((e) => e.toJson()).toList(),
    };
