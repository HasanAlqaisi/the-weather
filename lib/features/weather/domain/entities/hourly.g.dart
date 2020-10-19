// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hourly _$HourlyFromJson(Map<String, dynamic> json) {
  return Hourly(
    dt: json['dt'] as int,
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feelsLike'] as num).toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: (json['dewPoint'] as num).toDouble(),
    clouds: json['clouds'] as int,
    visibility: json['visibility'] as int,
    windSpeed: (json['windSpeed'] as num).toDouble(),
    windDeg: json['windDeg'] as int,
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pop: (json['pop'] as num).toDouble(),
  );
}

Map<String, dynamic> _$HourlyToJson(Hourly instance) => <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
      'pop': instance.pop,
    };
