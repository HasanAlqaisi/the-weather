import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:moor_flutter/moor_flutter.dart';

// part 'weather.g.dart';

// @JsonSerializable(explicitToJson: true, nullable: false)
class Weather extends Equatable {
  final int id;
  final String main;
  final String description;
  final String icon;

  Weather({this.id, this.main, this.description, this.icon});

  @override
  List<Object> get props => [id, main, description, icon];

  // factory Weather.fromJson(Map<String, dynamic> json) =>
  //     _$WeatherFromJson(json);

  // Map<String, dynamic> toJson() => _$WeatherToJson(this);
}

// class WeatherConverter extends TypeConverter<Weather, String> {
//   @override
//   Weather mapToDart(String fromDb) {
//     if (fromDb == null) {
//       return null;
//     }
//     return Weather.fromJson(json.decode(fromDb) as Map<String, dynamic>);
//   }

//   @override
//   String mapToSql(Weather value) {
//     if (value == null) {
//       return null;
//     }
//     return json.encode(value.toJson());
//   }
// }
