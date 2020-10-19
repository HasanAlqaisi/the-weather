import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

import 'current.dart';
import 'daily.dart';
import 'hourly.dart';

part 'weather_entity.g.dart';

@JsonSerializable(explicitToJson: true, nullable: false)
// @DataClassName('WeatherD')
class WeatherEntity extends Equatable {
  // IntColumn get id => integer().autoIncrement()();
  // RealColumn get lat => real()();
  // RealColumn get lon => real()();
  // TextColumn get timezone => text()();
  // IntColumn get timezoneOffset => integer()();
  // TextColumn get current => text().map(CurrentConverter())();
  // TextColumn get hourly => text().map(HourlyConverter())();
  // TextColumn get daily => text().map(DailyConverter())();

  final int id;
  final double lat;
  final double lon;
  final String timezone;
  final int timezoneOffset;
  final Current current;
  final List<Hourly> hourly;
  final List<Daily> daily;

  WeatherEntity(
      {this.id,
      this.lat,
      this.lon,
      this.timezone,
      this.timezoneOffset,
      this.current,
      this.hourly,
      this.daily});

  @override
  List<Object> get props =>
      [id, lat, lon, timezone, timezoneOffset, current, hourly, daily];

  factory WeatherEntity.fromJson(Map<String, dynamic> json) =>
      _$WeatherEntityFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherEntityToJson(this);
}

// class WeatherEntityConverter extends TypeConverter<WeatherEntity, String> {
//   @override
//   WeatherEntity mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return WeatherEntity.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String mapToSql(WeatherEntity value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }
