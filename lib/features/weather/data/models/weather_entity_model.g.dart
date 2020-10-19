// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_entity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherEntityModel _$WeatherEntityModelFromJson(Map<String, dynamic> json) {
  return WeatherEntityModel(
    lat: (json['lat'] as num).toDouble(),
    lon: (json['lon'] as num).toDouble(),
    timezone: json['timezone'] as String,
    timezoneOffset: json['timezone_offset'] as int,
    currentModel:
        CurrentModel.fromJson(json['current'] as Map<String, dynamic>),
    hourlyModel: (json['hourly'] as List)
        .map((e) => HourlyModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    dailyModel: (json['daily'] as List)
        .map((e) => DailyModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$WeatherEntityModelToJson(WeatherEntityModel instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lon': instance.lon,
      'timezone': instance.timezone,
      'timezone_offset': instance.timezoneOffset,
      'current': instance.currentModel.toJson(),
      'hourly': instance.hourlyModel.map((e) => e.toJson()).toList(),
      'daily': instance.dailyModel.map((e) => e.toJson()).toList(),
    };
