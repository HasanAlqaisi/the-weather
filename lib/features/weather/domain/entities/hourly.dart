import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'weather.dart';

// part 'hourly.g.dart';

// @JsonSerializable(explicitToJson: true, nullable: false)
class Hourly extends Equatable {
  final int dt;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;
  final double pop;

  Hourly(
      {this.dt,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.pop});

  @override
  List<Object> get props => [
        dt,
        temp,
        feelsLike,
        pressure,
        humidity,
        dewPoint,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weather,
        pop
      ];

  // factory Hourly.fromJson(Map<String, dynamic> json) => _$HourlyFromJson(json);

  // Map<String, dynamic> toJson() => _$HourlyToJson(this);
}

// class HourlyConverter extends TypeConverter<List<Hourly>, String> {
//   @override
//   List<Hourly> mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     final hourly = json.decode(fromDb) as Map<String, dynamic>;
//     return (hourly as List).map((i) => Hourly.fromJson(i)).toList();
//   }

//   @override
//   String mapToSql(List<Hourly> value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.map((hourly) => hourly.toJson()).toList());
//   }
// }
