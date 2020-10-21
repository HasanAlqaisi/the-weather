import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'weather.dart';

// part 'current.g.dart';

// @JsonSerializable(explicitToJson: true, nullable: false)
class Current extends Equatable {
  final int dt;
  final int sunrise;
  final int sunset;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final List<Weather> weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather});

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
        uvi,
        clouds,
        visibility,
        windSpeed,
        windDeg,
        weather
      ];

  // factory Current.fromJson(Map<String, dynamic> json) =>
  //     _$CurrentFromJson(json);

  // Map<String, dynamic> toJson() => _$CurrentToJson(this);
}

// class CurrentConverter extends TypeConverter<Current, String> {
//   @override
//   Current mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return Current.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String mapToSql(Current value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }
