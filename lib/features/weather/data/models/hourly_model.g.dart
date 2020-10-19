// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyModel _$HourlyModelFromJson(Map<String, dynamic> json) {
  return HourlyModel(
    dt: json['dt'] as int,
    temp: (json['temp'] as num)?.toDouble(),
    feelsLike: (json['feels_like'] as num)?.toDouble(),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: (json['dew_point'] as num)?.toDouble(),
    clouds: json['clouds'] as int,
    visibility: json['visibility'] as int,
    windSpeed: (json['wind_speed'] as num)?.toDouble(),
    windDeg: json['wind_deg'] as int,
    weatherModel: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    pop: (json['pop'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$HourlyModelToJson(HourlyModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'temp': instance.temp,
      'feels_like': instance.feelsLike,
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'clouds': instance.clouds,
      'visibility': instance.visibility,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weatherModel?.map((e) => e?.toJson())?.toList(),
      'pop': instance.pop,
    };
