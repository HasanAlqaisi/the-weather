import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/data/remote_models/daily_model.dart';

import 'feels_like_local.dart';
import 'temp_local.dart';
import 'weather_local.dart';

part 'daily_local.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class DailyLocal extends Equatable {
  final int dt;
  final TempLocal temp;
  final FeelsLikeLocal feelsLike;
  final int humidity;
  final List<WeatherLocal> weather;

  DailyLocal({
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

  factory DailyLocal.fromJson(Map<String, dynamic> json) =>
      _$DailyLocalFromJson(json);

  Map<String, dynamic> toJson() => _$DailyLocalToJson(this);

  factory DailyLocal.fromDailyModel(DailyModel daily) {
    return DailyLocal(
      dt: daily.dt,
      temp: TempLocal.fromTempModel(daily.tempModel),
      feelsLike: FeelsLikeLocal.fromFeelsLikeModel(daily.feelsLikeModel),
      humidity: daily.humidity,
      weather: daily.weather.map((e) => WeatherLocal.fromWeatherModel(e)).toList(),
    );
  }
}

class DailyConverter extends TypeConverter<List<DailyLocal>, String> {
  @override
  List<DailyLocal> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    final daily = json.decode(fromDb);

    return (daily as List).map((i) => DailyLocal.fromJson(i)).toList();
  }

  @override
  String mapToSql(List<DailyLocal> value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.map((daily) => daily.toJson()).toList());
  }
}
