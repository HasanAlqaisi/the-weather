// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Current _$CurrentFromJson(Map<String, dynamic> json) {
  return Current(
    dt: json['dt'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    temp: (json['temp'] as num).toDouble(),
    feelsLike: (json['feelsLike'] as num).toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: (json['dewPoint'] as num).toDouble(),
    uvi: (json['uvi'] as num).toDouble(),
    clouds: json['clouds'] as int,
    visibility: json['visibility'] as int,
    windSpeed: (json['windSpeed'] as num).toDouble(),
    windDeg: json['windDeg'] as int,
    weather: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CurrentToJson(Current instance) => <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.temp,
      'feelsLike': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dewPoint': instance.dewPoint,
      'uvi': instance.uvi,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'windSpeed': instance.windSpeed,
      'windDeg': instance.windDeg,
      'weather': instance.weather?.map((e) => e?.toJson())?.toList(),
    };
