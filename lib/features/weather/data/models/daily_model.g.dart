// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'daily_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DailyModel _$DailyModelFromJson(Map<String, dynamic> json) {
  return DailyModel(
    dt: json['dt'] as int,
    sunrise: json['sunrise'] as int,
    sunset: json['sunset'] as int,
    tempModel: json['temp'] == null
        ? null
        : TempModel.fromJson(json['temp'] as Map<String, dynamic>),
    feelsLikeModel: json['feels_like'] == null
        ? null
        : FeelsLikeModel.fromJson(json['feels_like'] as Map<String, dynamic>),
    pressure: json['pressure'] as int,
    humidity: json['humidity'] as int,
    dewPoint: (json['dew_point'] as num)?.toDouble(),
    windSpeed: (json['wind_speed'] as num)?.toDouble(),
    windDeg: json['wind_deg'] as int,
    weatherModel: (json['weather'] as List)
        ?.map((e) =>
            e == null ? null : WeatherModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    clouds: json['clouds'] as int,
    pop: (json['pop'] as num)?.toDouble(),
    uvi: (json['uvi'] as num)?.toDouble(),
    rain: (json['rain'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$DailyModelToJson(DailyModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'sunrise': instance.sunrise,
      'sunset': instance.sunset,
      'temp': instance.tempModel?.toJson(),
      'feels_like': instance.feelsLikeModel?.toJson(),
      'pressure': instance.pressure,
      'humidity': instance.humidity,
      'dew_point': instance.dewPoint,
      'wind_speed': instance.windSpeed,
      'wind_deg': instance.windDeg,
      'weather': instance.weatherModel?.map((e) => e?.toJson())?.toList(),
      'clouds': instance.clouds,
      'pop': instance.pop,
      'uvi': instance.uvi,
      'rain': instance.rain,
    };
