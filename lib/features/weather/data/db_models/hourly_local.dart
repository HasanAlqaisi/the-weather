import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/hourly_model.dart';

import 'weather_local.dart';

part 'hourly_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class HourlyLocal extends Equatable {
  final int dt;
  final double temp;
  final double feelsLike;
  final int humidity;
  final List<WeatherLocal> weather;

  HourlyLocal({
    this.dt,
    this.temp,
    this.feelsLike,
    this.humidity,
    this.weather,
  });

  @override
  List<Object> get props => [
        dt,
        temp,
        feelsLike,
        humidity,
        weather,
      ];

  factory HourlyLocal.fromJson(Map<String, dynamic> json) =>
      _$HourlyLocalFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyLocalToJson(this);

  factory HourlyLocal.fromHourlyModel(HourlyModel hourly) {
    return HourlyLocal(
      dt: hourly.dt,
      temp: hourly.temp,
      feelsLike: hourly.feelsLike,
      humidity: hourly.humidity,
      weather: hourly.weatherModel.map((e) => WeatherLocal.fromWeatherModel(e)).toList(),
    );
  }
}

class HourlyConverter extends TypeConverter<List<HourlyLocal>, String> {
  @override
  List<HourlyLocal> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    final hourly = json.decode(fromDb);
    return (hourly as List).map((i) => HourlyLocal.fromJson(i)).toList();
  }

  @override
  String mapToSql(List<HourlyLocal> value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.map((hourly) => hourly.toJson()).toList());
  }
}
