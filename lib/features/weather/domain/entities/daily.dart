import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';
import 'package:the_weather/features/weather/domain/entities/feels_like.dart';

import 'temp.dart';
import 'weather.dart';

part 'daily.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
class Daily extends Equatable {
  final int dt;
  final int sunrise;
  final int sunset;
  final Temp temp;
  final FeelsLike feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;
  final int clouds;
  final double pop;
  final double uvi;
  final double rain;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi,
      this.rain});

  @override
  List<Object> get props => [
        dt,
        sunrise,
        sunset,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        windSpeed,
        windDeg,
        weather,
        clouds,
        pop,
        uvi,
        rain
      ];

  factory Daily.fromJson(Map<String, dynamic> json) => _$DailyFromJson(json);

  Map<String, dynamic> toJson() => _$DailyToJson(this);
}

class DailyConverter extends TypeConverter<List<Daily>, String> {
  @override
  List<Daily> mapToDart(String fromDb) {
    if (fromDb == null) {
      return null;
    }
    final daily = json.decode(fromDb) as Map<String, dynamic>;

    return (daily as List).map((i) => Daily.fromJson(i)).toList();
  }

  @override
  String mapToSql(List<Daily> value) {
    if (value == null) {
      return null;
    }
    return json.encode(value.map((daily) => daily.toJson()).toList());
  }
}
